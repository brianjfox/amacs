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

# Mnemonics that have a zero-page form, so an absolute operand < $100 must be
# forced with the `:' suffix to stop Merlin shortening it to zero page.
ZP_CAPABLE = {
    "lda", "sta", "ldx", "stx", "ldy", "sty", "stz",
    "adc", "sbc", "and", "ora", "eor", "cmp", "cpx", "cpy",
    "bit", "asl", "lsr", "rol", "ror", "inc", "dec", "tsb", "trb",
}


def operand_text(mne, mode, b1, b2, addr):
    """Return the Merlin operand string (and possibly a `:'-suffixed mnemonic)
    for one instruction. Returns (mnemonic, operand)."""
    if mode == "imp" or mode == "acc":
        return mne, ""
    if mode == "imm":
        return mne, f"#${b1:02X}"
    if mode == "zp":
        return mne, f"${b1:02X}"
    if mode == "zpx":
        return mne, f"${b1:02X},x"
    if mode == "zpy":
        return mne, f"${b1:02X},y"
    if mode == "izx":
        return mne, f"(${b1:02X},x)"
    if mode == "izy":
        return mne, f"(${b1:02X}),y"
    if mode == "izp":
        return mne, f"(${b1:02X})"
    if mode == "rel":
        target = (addr + 2 + ((b1 ^ 0x80) - 0x80)) & 0xFFFF
        return mne, f"${target:04X}"
    word = b1 | (b2 << 8)
    if mode == "ind":
        return mne, f"(${word:04X})"
    if mode == "iax":
        return mne, f"(${word:04X},x)"
    # abs / abx / aby
    suffix = {"abs": "", "abx": ",x", "aby": ",y"}[mode]
    force = (word < 0x100) and (mne in ZP_CAPABLE)
    out_mne = mne + ":" if force else mne
    return out_mne, f"${word:04X}{suffix}"


def fmt_instr(addr, mne, operand):
    label = ""  # numeric pass: no labels yet
    text = f"{mne} {operand}".rstrip()
    return f"{label:<8}{text}"


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


def disassemble(out, data, start, end):
    """Linear-disassemble bytes [start,end) of the image into Merlin source."""
    off1 = end - ORG
    i = start - ORG
    while i < off1:
        addr = ORG + i
        op = data[i]
        entry = OPC.get(op)
        if entry is None:
            out.append(f"        dfb ${op:02X}        ; ${addr:04X}  (data/65C02-bit)")
            i += 1
            continue
        mne, mode = entry
        n = LEN[mode]
        if i + n > off1:
            # instruction would run past region end -> emit remaining as data
            out.append(f"        dfb ${op:02X}        ; ${addr:04X}  (truncated)")
            i += 1
            continue
        b1 = data[i + 1] if n >= 2 else 0
        b2 = data[i + 2] if n >= 3 else 0
        out_mne, operand = operand_text(mne, mode, b1, b2, addr)
        out.append(f"        {fmt_instr(addr, out_mne, operand)}    ; ${addr:04X}")
        i += n


def main(argv):
    if len(argv) not in (3, 4):
        sys.stderr.write("usage: disasm.py INPUT.OBJ OUTPUT.s [regions.json]\n")
        return 2
    src_obj, out_s = argv[1], argv[2]
    regions = []
    if len(argv) == 4:
        with open(argv[3]) as f:
            regions = json.load(f)

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
        "; src/amacs.s -- AMACS main editor: Stage 2 linear disassembly.",
        ";",
        "; *** GENERATED (tools/disasm.py) -- numeric operands, no labels yet. ***",
        "; Reassembles byte-identical to BIN/AMACS.OBJ (verified by make check).",
        f"; Origin ${ORG:04X}; {len(data)} bytes; last address ${end_addr - 1:04X}.",
        ";",
        f"        org ${ORG:04X}",
        "        dsk AMACS.OBJ",
        ";",
    ]
    names = {(int(str(r["start"]), 16)): r.get("name", "") for r in regions}
    for (s, e, kind) in spans:
        nm = names.get(s, "")
        tag = f"{kind}  {nm}".rstrip()
        out.append(f"; ---- ${s:04X}-${e - 1:04X}  {tag} ----")
        if kind == "data":
            emit_data(out, data, s, e)
        else:
            disassemble(out, data, s, e)

    out_dir = os.path.dirname(out_s)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    with open(out_s, "w") as f:
        f.write("\n".join(out) + "\n")
    print(f"wrote {out_s}: {len(out)} lines, {len(data)} bytes "
          f"({len(spans)} regions)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
