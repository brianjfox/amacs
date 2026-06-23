#!/usr/bin/env python3
"""tools/build_symbols.py — build an address -> name table for symbolication.

The equate files mix two very different things: real memory ADDRESSES (zero-page
vars, soft switches, ProDOS globals, RAM buffers, ROM routines) and numeric
CONSTANTS (mode numbers, error codes, bit masks, char codes, sizes). For
symbolicating memory operands we want only the addresses — naming `lda $28` as
`er_NoDevice` would be nonsense; it is `BASL`.

Sources:
  * DEFS/LINK.OUTPUT.S — the linker symbol map: ~700 literal `Name = $XXXX`
    pairs covering the editor image ($1000-$A4F7) and a few high-RAM routines.
    These are all genuine addresses; taken wholesale.
  * DEFS/{SCREEN,BANKSW,PRODOS,BUFFER,LIBRARY}.EQUS.S — taken selectively: a
    symbol is an address if its value >= $200 and its name is not a size, OR it
    is in the curated zero-page allowlist below. (VAR/MODE/DISPLAY/FILER/EXTERNAL
    are pure constants or vector aliases and are skipped.)

The result is INJECTIVE on names (each name maps to exactly one address) so the
generated EQU block is legal and round-trips. Collisions are recorded as
aliases. Names are emitted verbatim from the originals.

Output: src/symbols.json = {"byaddr": {...}, "aliases": {...}}
"""
import json
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEFS = os.path.join(REPO, "DEFS")

# DEFS files searched for real ADDRESS equates, in dependency order so that
# computed expressions (e.g. PageTop = Point+2) resolve.
ADDR_FILES = [
    "SCREEN.EQUS.S", "BANKSW.EQUS.S", "PRODOS.EQUS.S",
    "BUFFER.EQUS.S", "LIBRARY.EQUS.S",
]
# Files used only to resolve referenced names (constants), never themselves
# contributing addresses.
HELPER_FILES = ["VAR.EQUS.S", "MODE.EQUS.S", "DISPLAY.EQUS.S"]

# Genuine zero-page variables (value < $200) we DO want as address names.
ZP_ALLOW = {
    "scrny", "WindowLft", "WindowRgt", "WindowTop", "WindowBot", "CH", "CV",
    "BASL", "BASH", "BuffPoint", "TheBuffer", "Point", "PageTop", "MarkPnt",
    "BuffTop", "BuffBot", "GapTop", "GapBot", "PhysBuffTop", "PhysBuffBot",
    "BuffData", "TheBuffer_X",
}
# Names that look like addresses by value but are really sizes/lengths.
SIZE_RE = re.compile(r"(Size|Sz|Len)$")

EQU_RE = re.compile(r"^(\S+)\s*(?:=|equ)\s+(.+?)\s*(?:;.*)?$", re.IGNORECASE)
TOKEN_RE = re.compile(r"\$[0-9A-Fa-f]+|%[01]+|'.'|[A-Za-z_][\w:?]*|\d+|[-+*/()<>]")
LINK_RE = re.compile(r"^(\S+)\s*=\s*\$([0-9A-Fa-f]+)\s*$")


def decode(path):
    data = open(path, "rb").read()
    return "".join(chr(b & 0x7F) for b in data).replace("\r", "\n")


def evaluate(expr, syms):
    out = []
    for tok in TOKEN_RE.findall(expr):
        if tok.startswith("$"):
            out.append(str(int(tok[1:], 16)))
        elif tok.startswith("%"):
            out.append(str(int(tok[1:], 2)))
        elif tok.startswith("'"):
            out.append(str(ord(tok[1])))
        elif tok[0].isdigit():
            out.append(tok)
        elif tok in "+-*/()":
            out.append(tok)
        elif tok in (">", "<"):
            return None
        elif tok in syms:
            out.append(str(syms[tok]))
        else:
            return None
    if not out:
        return None
    try:
        return int(eval("".join(out), {"__builtins__": {}}, {})) & 0xFFFF
    except Exception:
        return None


def parse_equs(files):
    """Evaluate equates across files; return list of (name, value, file) and the
    running symbol dict (so later files can reference earlier names)."""
    syms = {}
    found = []
    skip = False
    for fname in files:
        path = os.path.join(DEFS, fname)
        if not os.path.exists(path):
            continue
        for raw in decode(path).split("\n"):
            s = raw.strip()
            low = s.lower()
            if low.startswith("do "):
                skip = low.split()[1:] == ["0"]; continue
            if low == "else":
                skip = not skip; continue
            if low == "fin":
                skip = False; continue
            if skip or not s or s.startswith(";"):
                continue
            m = EQU_RE.match(raw)
            if not m:
                continue
            name, expr = m.group(1), m.group(2)
            val = evaluate(expr, syms)
            if val is not None:
                syms.setdefault(name, val)
                found.append((name, val, fname))
    return found, syms


def is_address(name, val):
    if name in ZP_ALLOW:
        return True
    if val >= 0x200 and not SIZE_RE.search(name):
        return True
    return False


def parse_link():
    out = []
    for raw in decode(os.path.join(DEFS, "LINK.OUTPUT.S")).split("\n"):
        m = LINK_RE.match(raw.strip())
        if m:
            out.append((m.group(1), int(m.group(2), 16)))
    return out


def main(argv):
    out_path = argv[1] if len(argv) > 1 else os.path.join(REPO, "src", "symbols.json")

    link = parse_link()
    # Resolve constants first (helpers), then address files referencing them.
    _, const_syms = parse_equs(HELPER_FILES)
    found, _ = parse_equs(HELPER_FILES + ADDR_FILES)
    defs_addrs = [(n, v) for (n, v, f) in found
                  if f in ADDR_FILES and is_address(n, v)]

    byaddr = {}      # hexaddr -> canonical name (injective on names)
    aliases = {}     # hexaddr -> [other names]
    used_names = {}  # name -> hexaddr

    def add(name, val):
        key = f"{val:04X}"
        if name in used_names:
            # name already bound to some address; record as alias only if same
            if used_names[name] == key and byaddr.get(key) != name:
                aliases.setdefault(key, [])
                if name not in aliases[key]:
                    aliases[key].append(name)
            return  # never re-bind a name to a second address
        if key in byaddr:
            aliases.setdefault(key, [])
            if name not in aliases[key]:
                aliases[key].append(name)
            return
        byaddr[key] = name
        used_names[name] = key

    for name, val in link:                       # LINK owns the image
        add(name, val)
    for name, val in sorted(defs_addrs, key=lambda kv: kv[1]):
        add(name, val)

    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w") as f:
        json.dump({"byaddr": byaddr, "aliases": aliases}, f, indent=0,
                  sort_keys=True)
    in_img = sum(1 for k in byaddr if 0x1000 <= int(k, 16) <= 0xA4F7)
    print(f"wrote {out_path}: {len(byaddr)} addresses "
          f"({in_img} inside image), {len(defs_addrs)} DEFS addrs kept, "
          f"{len(link)} LINK syms, {len(aliases)} addrs with aliases")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
