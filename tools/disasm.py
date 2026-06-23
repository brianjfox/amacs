#!/usr/bin/env python3
"""tools/disasm.py — round-trip-safe 65C02 linear disassembler for AMACS.

Reads BIN/AMACS.OBJ (origin $1000) and emits Merlin-syntax source that, when
assembled by Merlin 32, reproduces the image byte-for-byte. This is the Stage 2
"first cut": a linear sweep with NUMERIC operands (no symbol names yet) and a
coarse code/data split driven by an externally supplied region map.

Round-trip discipline (validated by tools/verify.sh on every build):

  * Every instruction is emitted in a form whose Merlin 32 re-encoding equals
    the original bytes. The only operand ambiguity on 65C02 is zero-page vs
    absolute: Merlin picks zero-page whenever the operand value < $100, so for
    an *absolute*-mode opcode with a small operand we emit the `:' force-absolute
    suffix (e.g. `lda: $0060` -> AD 60 00).
  * Opcodes Merlin 32 cannot assemble (the Rockwell RMB/SMB/BBR/BBS at $x7/$xF)
    and any opcode not in the table are emitted as single `dfb $xx' data bytes.
    AMACS sets IfNCR65C02 = 0, so these do not occur as instructions in code;
    they only appear inside data, where raw bytes are correct anyway.

Data regions (from a JSON region map, optional) are emitted as `dfb`/`asc`
runs instead of being decoded as instructions, purely for readability — the
bytes are identical either way.

Usage:
    tools/disasm.py BIN/AMACS.OBJ src/amacs.s [regions.json]
"""
import json
import os
import sys

ORG = 0x1000

# --- 65C02 opcode table: opcode -> (mnemonic, mode) -----------------------
# Modes and their lengths/operand syntax are defined in MODES below. Opcodes
# absent from this table are emitted as 1-byte `dfb` data (round-trip safe).
OPC = {
    0x00: ("brk", "imp"), 0x01: ("ora", "izx"), 0x04: ("tsb", "zp"),
    0x05: ("ora", "zp"),  0x06: ("asl", "zp"),  0x08: ("php", "imp"),
    0x09: ("ora", "imm"), 0x0A: ("asl", "acc"), 0x0C: ("tsb", "abs"),
    0x0D: ("ora", "abs"), 0x0E: ("asl", "abs"),
    0x10: ("bpl", "rel"), 0x11: ("ora", "izy"), 0x12: ("ora", "izp"),
    0x14: ("trb", "zp"),  0x15: ("ora", "zpx"), 0x16: ("asl", "zpx"),
    0x18: ("clc", "imp"), 0x19: ("ora", "aby"), 0x1A: ("inc", "acc"),
    0x1C: ("trb", "abs"), 0x1D: ("ora", "abx"), 0x1E: ("asl", "abx"),
    0x20: ("jsr", "abs"), 0x21: ("and", "izx"), 0x24: ("bit", "zp"),
    0x25: ("and", "zp"),  0x26: ("rol", "zp"),  0x28: ("plp", "imp"),
    0x29: ("and", "imm"), 0x2A: ("rol", "acc"), 0x2C: ("bit", "abs"),
    0x2D: ("and", "abs"), 0x2E: ("rol", "abs"),
    0x30: ("bmi", "rel"), 0x31: ("and", "izy"), 0x32: ("and", "izp"),
    0x34: ("bit", "zpx"), 0x35: ("and", "zpx"), 0x36: ("rol", "zpx"),
    0x38: ("sec", "imp"), 0x39: ("and", "aby"), 0x3A: ("dec", "acc"),
    0x3C: ("bit", "abx"), 0x3D: ("and", "abx"), 0x3E: ("rol", "abx"),
    0x40: ("rti", "imp"), 0x41: ("eor", "izx"), 0x45: ("eor", "zp"),
    0x46: ("lsr", "zp"),  0x48: ("pha", "imp"), 0x49: ("eor", "imm"),
    0x4A: ("lsr", "acc"), 0x4C: ("jmp", "abs"), 0x4D: ("eor", "abs"),
    0x4E: ("lsr", "abs"),
    0x50: ("bvc", "rel"), 0x51: ("eor", "izy"), 0x52: ("eor", "izp"),
    0x55: ("eor", "zpx"), 0x56: ("lsr", "zpx"), 0x58: ("cli", "imp"),
    0x59: ("eor", "aby"), 0x5A: ("phy", "imp"), 0x5D: ("eor", "abx"),
    0x5E: ("lsr", "abx"),
    0x60: ("rts", "imp"), 0x61: ("adc", "izx"), 0x64: ("stz", "zp"),
    0x65: ("adc", "zp"),  0x66: ("ror", "zp"),  0x68: ("pla", "imp"),
    0x69: ("adc", "imm"), 0x6A: ("ror", "acc"), 0x6C: ("jmp", "ind"),
    0x6D: ("adc", "abs"), 0x6E: ("ror", "abs"),
    0x70: ("bvs", "rel"), 0x71: ("adc", "izy"), 0x72: ("adc", "izp"),
    0x74: ("stz", "zpx"), 0x75: ("adc", "zpx"), 0x76: ("ror", "zpx"),
    0x78: ("sei", "imp"), 0x79: ("adc", "aby"), 0x7A: ("ply", "imp"),
    0x7C: ("jmp", "iax"), 0x7D: ("adc", "abx"), 0x7E: ("ror", "abx"),
    0x80: ("bra", "rel"), 0x81: ("sta", "izx"), 0x84: ("sty", "zp"),
    0x85: ("sta", "zp"),  0x86: ("stx", "zp"),  0x88: ("dey", "imp"),
    0x89: ("bit", "imm"), 0x8A: ("txa", "imp"), 0x8C: ("sty", "abs"),
    0x8D: ("sta", "abs"), 0x8E: ("stx", "abs"),
    0x90: ("bcc", "rel"), 0x91: ("sta", "izy"), 0x92: ("sta", "izp"),
    0x94: ("sty", "zpx"), 0x95: ("sta", "zpx"), 0x96: ("stx", "zpy"),
    0x98: ("tya", "imp"), 0x99: ("sta", "aby"), 0x9A: ("txs", "imp"),
    0x9C: ("stz", "abs"), 0x9D: ("sta", "abx"), 0x9E: ("stz", "abx"),
    0xA0: ("ldy", "imm"), 0xA1: ("lda", "izx"), 0xA2: ("ldx", "imm"),
    0xA4: ("ldy", "zp"),  0xA5: ("lda", "zp"),  0xA6: ("ldx", "zp"),
    0xA8: ("tay", "imp"), 0xA9: ("lda", "imm"), 0xAA: ("tax", "imp"),
    0xAC: ("ldy", "abs"), 0xAD: ("lda", "abs"), 0xAE: ("ldx", "abs"),
    0xB0: ("bcs", "rel"), 0xB1: ("lda", "izy"), 0xB2: ("lda", "izp"),
    0xB4: ("ldy", "zpx"), 0xB5: ("lda", "zpx"), 0xB6: ("ldx", "zpy"),
    0xB8: ("clv", "imp"), 0xB9: ("lda", "aby"), 0xBA: ("tsx", "imp"),
    0xBC: ("ldy", "abx"), 0xBD: ("lda", "abx"), 0xBE: ("ldx", "aby"),
    0xC0: ("cpy", "imm"), 0xC1: ("cmp", "izx"), 0xC4: ("cpy", "zp"),
    0xC5: ("cmp", "zp"),  0xC6: ("dec", "zp"),  0xC8: ("iny", "imp"),
    0xC9: ("cmp", "imm"), 0xCA: ("dex", "imp"), 0xCC: ("cpy", "abs"),
    0xCD: ("cmp", "abs"), 0xCE: ("dec", "abs"),
    0xD0: ("bne", "rel"), 0xD1: ("cmp", "izy"), 0xD2: ("cmp", "izp"),
    0xD5: ("cmp", "zpx"), 0xD6: ("dec", "zpx"), 0xD8: ("cld", "imp"),
    0xD9: ("cmp", "aby"), 0xDA: ("phx", "imp"), 0xDD: ("cmp", "abx"),
    0xDE: ("dec", "abx"),
    0xE0: ("cpx", "imm"), 0xE1: ("sbc", "izx"), 0xE4: ("cpx", "zp"),
    0xE5: ("sbc", "zp"),  0xE6: ("inc", "zp"),  0xE8: ("inx", "imp"),
    0xE9: ("sbc", "imm"), 0xEA: ("nop", "imp"), 0xEC: ("cpx", "abs"),
    0xED: ("sbc", "abs"), 0xEE: ("inc", "abs"),
    0xF0: ("beq", "rel"), 0xF1: ("sbc", "izy"), 0xF2: ("sbc", "izp"),
    0xF5: ("sbc", "zpx"), 0xF6: ("inc", "zpx"), 0xF8: ("sed", "imp"),
    0xF9: ("sbc", "aby"), 0xFA: ("plx", "imp"), 0xFD: ("sbc", "abx"),
    0xFE: ("inc", "abx"),
}

# Instruction length per addressing mode.
LEN = {
    "imp": 1, "acc": 1, "imm": 2, "zp": 2, "zpx": 2, "zpy": 2,
    "izx": 2, "izy": 2, "izp": 2, "rel": 2,
    "abs": 3, "abx": 3, "aby": 3, "ind": 3, "iax": 3,
}

# Soft switches that change which RAM bank subsequent code reads/writes or runs
# in. Referencing these flips the memory map, so each site is flagged loudly in
# the disassembly (CLAUDE.md: "Flag bank-switch sites prominently"). Behavior is
# asserted from the hardware, not guessed.
BANK_NOTES = {
    0xC002: "BANK: read MAIN 48K (RAMRD off)",
    0xC003: "BANK: read AUX 48K (RAMRD on)",
    0xC004: "BANK: write MAIN 48K (RAMWR off)",
    0xC005: "BANK: write AUX 48K (RAMWR on)",
    0xC008: "BANK: main zero-page/stack (ALTZP off)",
    0xC009: "BANK: aux zero-page/stack (ALTZP on)",
    0xC054: "BANK: display page 1 / main (PAGE2 off)",
    0xC055: "BANK: display page 2 / aux (PAGE2 on)",
    0xC083: "BANK: language-card RAM bank 2 (read+write, BIT twice)",
    0xC08B: "BANK: language-card RAM bank 1 (read+write, BIT twice)",
    0xC08A: "BANK: language-card ROM (read)",
}

# Mnemonics that have a zero-page form, so an absolute operand < $100 must be
# forced with the `:' suffix to stop Merlin shortening it to zero page.
ZP_CAPABLE = {
    "lda", "sta", "ldx", "stx", "ldy", "sty", "stz",
    "adc", "sbc", "and", "ora", "eor", "cmp", "cpx", "cpy",
    "bit", "asl", "lsr", "rol", "ror", "inc", "dec", "tsb", "trb",
}


def operand_text(mne, mode, b1, b2, addr, sym, labels=None):
    """Return (mnemonic, operand, named?) for one instruction. When the target
    address has a known symbol (`sym`, addr->name) the numeric operand is
    replaced by that original name. Failing that, control-flow targets
    (branches, jmp/jsr) that hit a local instruction get a synthetic `Lxxxx`
    label from `labels`. Force-abs (`:`) is preserved."""
    labels = labels or {}
    use_labels = (mode == "rel") or (mode == "abs" and mne in ("jmp", "jsr"))

    def nm(val, numfmt):
        key = f"{val:04X}"
        if key in sym:
            return sym[key], True
        if use_labels and key in labels:
            return labels[key], True
        return numfmt, False

    if mode in ("imp", "acc"):
        return mne, "", False
    if mode == "imm":
        return mne, f"#${b1:02X}", False          # immediates stay numeric
    if mode == "zp":
        t, named = nm(b1, f"${b1:02X}");          return mne, t, named
    if mode == "zpx":
        t, named = nm(b1, f"${b1:02X}");          return mne, f"{t},x", named
    if mode == "zpy":
        t, named = nm(b1, f"${b1:02X}");          return mne, f"{t},y", named
    if mode == "izx":
        t, named = nm(b1, f"${b1:02X}");          return mne, f"({t},x)", named
    if mode == "izy":
        t, named = nm(b1, f"${b1:02X}");          return mne, f"({t}),y", named
    if mode == "izp":
        t, named = nm(b1, f"${b1:02X}");          return mne, f"({t})", named
    if mode == "rel":
        target = (addr + 2 + ((b1 ^ 0x80) - 0x80)) & 0xFFFF
        t, named = nm(target, f"${target:04X}");  return mne, t, named
    word = b1 | (b2 << 8)
    if mode == "ind":
        t, named = nm(word, f"${word:04X}");      return mne, f"({t})", named
    if mode == "iax":
        t, named = nm(word, f"${word:04X}");      return mne, f"({t},x)", named
    # abs / abx / aby
    suffix = {"abs": "", "abx": ",x", "aby": ",y"}[mode]
    force = (word < 0x100) and (mne in ZP_CAPABLE)
    out_mne = mne + ":" if force else mne
    t, named = nm(word, f"${word:04X}")
    return out_mne, f"{t}{suffix}", named


def fmt_instr(label, mne, operand):
    text = f"{mne} {operand}".rstrip()
    return f"{label:<8}{text}"


def scan_code(data, start, end, instr_starts, targets):
    """Replicate the emit decode loop's byte advancement to record where real
    instructions start (instr_starts) and which addresses are control-flow
    targets (targets: branch / jmp-abs / jsr-abs operands). Used to synthesize
    local labels before emitting."""
    off1 = end - ORG
    i = start - ORG
    while i < off1:
        addr = ORG + i
        op = data[i]
        if op in (0x00, 0xFF):
            j = i
            while j < off1 and data[j] == op:
                j += 1
            if j - i >= 4:
                i = j
                continue
        entry = OPC.get(op)
        if entry is None:
            i += 1
            continue
        mne, mode = entry
        n = LEN[mode]
        if i + n > off1:
            i += 1
            continue
        instr_starts.add(addr)
        b1 = data[i + 1] if n >= 2 else 0
        b2 = data[i + 2] if n >= 3 else 0
        if mode == "rel":
            targets.add((addr + 2 + ((b1 ^ 0x80) - 0x80)) & 0xFFFF)
        elif mode == "abs" and mne in ("jmp", "jsr"):
            targets.add(b1 | (b2 << 8))
        i += n


def _gloss(chunk):
    """ASCII gloss (high bit stripped) for a data line's comment."""
    return "".join(chr(b & 0x7F) if 0x20 <= (b & 0x7F) < 0x7F else "." for b in chunk)


def emit_data(out, data, start, end):
    """Emit bytes [start,end) of the image as `dfb` hex runs (16 per line),
    with an ASCII gloss in the comment so text tables stay readable."""
    off0 = start - ORG
    off1 = end - ORG
    i = off0
    while i < off1:
        chunk = data[i:min(i + 16, off1)]
        hexes = ",".join(f"${b:02X}" for b in chunk)
        out.append(f"        dfb {hexes}    ; ${ORG + i:04X}  {_gloss(chunk)}")
        i += len(chunk)


def disassemble(out, data, start, end, sym, aliases, labels, stats):
    """Linear-disassemble bytes [start,end) of the image into Merlin source.
    Emits a `; === Name ===' marker where an instruction starts at a known
    symbol, a local `Lxxxx' label at control-flow targets, and replaces
    operands with symbol/label names via operand_text()."""
    off1 = end - ORG
    i = start - ORG
    while i < off1:
        addr = ORG + i
        key = f"{addr:04X}"
        if key in sym:
            extra = f"   (also {', '.join(aliases[key])})" if key in aliases else ""
            out.append(f";")
            out.append(f"; === {sym[key]}{extra} ===")
        op = data[i]
        # Collapse $00/$FF fill runs into a `ds' directive. We're at an
        # instruction boundary here, so this never splits a real instruction;
        # 4+ consecutive $00/$FF in a code span is zero/fill data, not code.
        if op in (0x00, 0xFF):
            j = i
            while j < off1 and data[j] == op:
                j += 1
            if j - i >= 4:
                if op == 0x00:
                    out.append(f"        ds {j - i}        ; ${addr:04X}  {j - i} bytes $00 fill")
                else:
                    out.append(f"        ds {j - i},$FF    ; ${addr:04X}  {j - i} bytes $FF fill")
                stats["fill"] += 1
                i = j
                continue
        label = labels.get(key, "")
        entry = OPC.get(op)
        if entry is None:
            out.append(f"{label:<8}dfb ${op:02X}        ; ${addr:04X}  (data/65C02-bit)")
            i += 1
            continue
        mne, mode = entry
        n = LEN[mode]
        if i + n > off1:
            out.append(f"{label:<8}dfb ${op:02X}        ; ${addr:04X}  (truncated)")
            i += 1
            continue
        b1 = data[i + 1] if n >= 2 else 0
        b2 = data[i + 2] if n >= 3 else 0
        out_mne, operand, named = operand_text(mne, mode, b1, b2, addr, sym, labels)
        stats["instrs"] += 1
        if mode not in ("imp", "acc", "imm"):
            stats["operands"] += 1
            if named:
                stats["named"] += 1
        # Referenced address (for bank-switch flagging).
        if mode in ("abs", "abx", "aby", "ind", "iax"):
            ref = b1 | (b2 << 8)
        elif mode in ("zp", "zpx", "zpy", "izx", "izy", "izp"):
            ref = b1
        else:
            ref = None
        note = ""
        if ref in BANK_NOTES:
            note = f"   <== {BANK_NOTES[ref]}"
            stats["bank"] += 1
        out.append(f"{fmt_instr(label, out_mne, operand)}    ; ${addr:04X}{note}")
        i += n


def main(argv):
    if len(argv) not in (3, 4, 5):
        sys.stderr.write("usage: disasm.py INPUT.OBJ OUTPUT.s [regions.json] [symbols.json]\n")
        return 2
    src_obj, out_s = argv[1], argv[2]
    regions = []
    if len(argv) >= 4 and argv[3]:
        with open(argv[3]) as f:
            regions = json.load(f)
    sym, aliases = {}, {}
    if len(argv) == 5 and argv[4]:
        with open(argv[4]) as f:
            sj = json.load(f)
        sym, aliases = sj.get("byaddr", {}), sj.get("aliases", {})

    with open(src_obj, "rb") as f:
        data = f.read()
    end_addr = ORG + len(data)

    # Build an ordered, gap-filled region list. Unlisted spans default to code.
    regions = sorted(regions, key=lambda r: int(str(r["start"]), 16))
    spans = []
    cur = ORG
    for r in regions:
        s = int(str(r["start"]), 16)
        e = int(str(r["end"]), 16)
        if s > cur:
            spans.append((cur, s, "code"))
        spans.append((s, e, r["kind"]))
        cur = e
    if cur < end_addr:
        spans.append((cur, end_addr, "code"))

    out = [
        ";-*- Mode: Merlin -*-",
        ";",
        "; src/amacs.s -- AMACS main editor: reconstructed disassembly.",
        ";",
        "; *** GENERATED (tools/disasm.py). Operands carry original names from",
        ";     DEFS/LINK.OUTPUT.S + DEFS/*.EQUS.S where known; the rest are bare",
        ";     addresses. Reassembles byte-identical to BIN/AMACS.OBJ (make check). ***",
        f"; Origin ${ORG:04X}; {len(data)} bytes; last address ${end_addr - 1:04X}.",
        ";",
    ]

    # Symbol equates. Every name used by an operand must be defined; we emit the
    # whole table (sorted by address) so it doubles as a symbol map. This is the
    # original linker map + curated DEFS addresses, names verbatim.
    if sym:
        out.append("; ===================== symbol equates =====================")
        for key in sorted(sym, key=lambda k: int(k, 16)):
            v = int(key, 16)
            # 2-digit value => Merlin types the symbol as zero-page (needed for
            # zp / zp-indirect operands); 4-digit => absolute.
            vfmt = f"${v:02X}" if v < 0x100 else f"${v:04X}"
            al = f"  ; = {', '.join(aliases[key])}" if key in aliases else ""
            out.append(f"{sym[key]:<18} = {vfmt}{al}")
        out.append("; ==========================================================")
        out.append(";")

    out += [f"        org ${ORG:04X}", "        dsk AMACS.OBJ", ";"]

    # Pass A: scan code spans for instruction boundaries and control-flow
    # targets, then synthesize local labels for targets that hit a local
    # instruction and have no original symbol.
    instr_starts, targets = set(), set()
    for (s, e, kind) in spans:
        if kind != "data":
            scan_code(data, s, e, instr_starts, targets)
    labels = {f"{a:04X}": f"L{a:04X}" for a in (targets & instr_starts)
              if f"{a:04X}" not in sym}

    # Pass B: emit.
    stats = {"instrs": 0, "operands": 0, "named": 0, "bank": 0, "fill": 0,
             "labels": len(labels)}
    names = {(int(str(r["start"]), 16)): r.get("name", "") for r in regions}
    for (s, e, kind) in spans:
        nm = names.get(s, "")
        tag = f"{kind}  {nm}".rstrip()
        out.append(f"; ---- ${s:04X}-${e - 1:04X}  {tag} ----")
        if kind == "data":
            emit_data(out, data, s, e)
        else:
            disassemble(out, data, s, e, sym, aliases, labels, stats)

    out_dir = os.path.dirname(out_s)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    with open(out_s, "w") as f:
        f.write("\n".join(out) + "\n")
    pct = (100 * stats["named"] // stats["operands"]) if stats["operands"] else 0
    print(f"wrote {out_s}: {len(out)} lines, {len(data)} bytes, {len(spans)} regions; "
          f"{stats['instrs']} instrs, {stats['named']}/{stats['operands']} "
          f"address operands named ({pct}%), {stats['labels']} local labels, "
          f"{stats['bank']} bank-switch sites flagged, {stats['fill']} fill runs collapsed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
