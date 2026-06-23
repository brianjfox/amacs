#!/usr/bin/env python3
"""tools/find_data.py — generate src/regions.json (the code/data map).

Combines three sources of DATA regions, all evidence-based:

  1. Structural tables with known addresses/extents (entry pointer block, the
     extended-key dispatch tables, the CommandNames string table).
  2. The window-descriptor records (WindowOne/WindowTwo/SelectedWind), confirmed
     by GetSelWind copying their fields into the WindowLft..WindowBot zero page.
  3. Inline message strings: AMACS prints messages with the idiom
        jsr PrintMessage    ; $5968 / bytes 20 68 59
        <high-bit text>      ; inline, $00-terminated
     We scan for `20 68 59`, and where it is followed by a clean printable run
     ending in $00 we carve [text .. $00] as data (the JSR stays code). This
     finds the strings with EXACT boundaries; coincidental matches are rejected
     by the printable-content check.

Everything else stays code. Marking data vs code never changes the assembled
bytes (verified by make check) — it only makes the disassembly readable.
"""
import json
import os
import sys

ORG = 0x1000
PRINT_MESSAGE = 0x5968  # JSR PrintMessage -> inline $00-terminated string

# (start, end_exclusive, name) for fixed-extent structural data. Extents are
# bounded by the next routine symbol in LINK.OUTPUT and confirmed by inspecting
# record structure / referencing code.
STRUCTURAL = [
    (0x1027, 0x1035, "entry pointer block (CompList..C_XCharCount)"),
    (0x111D, 0x1126, "WindowOne (9-byte window descriptor record)"),
    (0x1126, 0x112F, "WindowTwo (9-byte window descriptor record)"),
    (0x112F, 0x1130, "SelectedWind (current window index)"),
    # --- command/char/completion dispatch tables ---
    (0x3F6D, 0x3F70, "CharIndex (3 bytes)"),
    (0x4F84, 0x504E, "ComTab (command dispatch table)"),
    (0x5987, 0x598C, "CompList / CompOffset / CompCount"),
    # --- mode / key name tables ---
    (0x54F2, 0x5528, "ModeNames (major+minor mode name strings)"),
    (0x5528, 0x5538, "MinorNames (pointers into ModeNames)"),
    (0x5908, 0x5944, "KeyNames (8 key codes + 8 name pointers + name strings)"),
    # --- date / file-type tables ---
    (0x6E79, 0x6E9D, "MonthNames (12 x 3-char month abbreviations)"),
    (0x7640, 0x7679, "FileTypeNames (14 [type,3-char] records: TXT,BIN,DIR.. + $00)"),
    # --- extended-key dispatch ---
    (0x7DB8, 0x7DDE, "C_XCharacters (38 extended-key chars)"),
    (0x7DDE, 0x7E2A, "C_XVectors (38 handler addresses)"),
    (0x7E2A, 0x7E2B, "C_XCharCount ($26 = 38)"),
    # --- settable-variable tables ---
    (0x975D, 0x9A6A, "Variables (variable-name + record table)"),
    (0x9A6A, 0x9A6D, "VariableLink"),
    (0x9A6D, 0x9B15, "VarList (variable records)"),
    (0x9B15, 0x9B37, "VarDocList (variable doc strings)"),
    # --- command-name string table to EOF ---
    (0x9B37, 0xA4F8, "CommandNames (command-name string table to EOF)"),
]


def find_strings(data):
    """Return [(start, end_exclusive, preview)] for inline PrintMessage strings."""
    n = len(data)
    lo, hi = PRINT_MESSAGE & 0xFF, (PRINT_MESSAGE >> 8) & 0xFF
    out = []
    for i in range(n - 2):
        if data[i] != 0x20 or data[i + 1] != lo or data[i + 2] != hi:
            continue
        s = i + 3
        j = s
        while j < n and data[j] != 0x00 and (j - s) < 256:
            j += 1
        if j >= n or data[j] != 0x00:
            continue
        run = data[s:j]
        if len(run) < 2:
            continue
        printable = sum(1 for b in run if 0x20 <= (b & 0x7F) < 0x7F or b in (0x8D, 0x8A))
        if printable < len(run) * 0.85:
            continue
        text = "".join(chr(b & 0x7F) if 0x20 <= (b & 0x7F) < 0x7F else "." for b in run)
        out.append((ORG + s, ORG + j + 1, f"msg: {text[:40]}"))
    return out


def main(argv):
    obj = argv[1] if len(argv) > 1 else os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "BIN", "AMACS.OBJ")
    out_path = argv[2] if len(argv) > 2 else os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "src", "regions.json")
    data = open(obj, "rb").read()

    regions = list(STRUCTURAL)
    strings = find_strings(data)

    # Drop any string that overlaps a structural region (defensive).
    def overlaps(s, e):
        return any(not (e <= rs or s >= re) for rs, re, _ in STRUCTURAL)
    n_skipped = 0
    for s, e, name in strings:
        if overlaps(s, e):
            n_skipped += 1
            continue
        regions.append((s, e, name))

    regions.sort()
    # Sanity: no overlaps.
    for (s1, e1, _), (s2, e2, _) in zip(regions, regions[1:]):
        if e1 > s2:
            sys.stderr.write(f"ERROR: overlapping regions ${s1:04X}-${e1:04X} / ${s2:04X}\n")
            return 1

    # Tables that are arrays of little-endian address words: emit as annotated
    # `da' so each entry shows the routine it points to.
    ptrtable_starts = {0x1027, 0x7DDE}
    out = [{"start": f"{s:04X}", "end": f"{e:04X}",
            "kind": "ptrtable" if s in ptrtable_starts else "data", "name": nm}
           for (s, e, nm) in regions]
    with open(out_path, "w") as f:
        json.dump(out, f, indent=2)
        f.write("\n")
    str_bytes = sum(e - s for s, e, nm in regions if nm.startswith("msg:"))
    print(f"wrote {out_path}: {len(out)} data regions "
          f"({len(STRUCTURAL)} structural + {len(strings) - n_skipped} strings, "
          f"{n_skipped} skipped); {str_bytes} bytes of inline strings")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
