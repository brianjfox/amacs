#!/usr/bin/env python3
"""tools/make_blob_source.py — generate a verbatim-byte Merlin source.

This emits src/amacs.s as a trivial "source" that, when assembled by Merlin 32
at origin $1000, reproduces BIN/AMACS.OBJ byte-for-byte. It is pure scaffolding
used to prove the round-trip harness works end to end BEFORE any real
disassembly has happened.

As reconstruction proceeds, regions of these raw `hex` lines get replaced with
real, labeled Merlin code/data that must continue to reassemble byte-identical.
So the blob shrinks over time but the build/verify contract never changes.

Usage:
    tools/make_blob_source.py BIN/AMACS.OBJ src/amacs.s
"""
import os
import sys

BYTES_PER_LINE = 32
ORG = 0x1000


def main(argv):
    if len(argv) != 3:
        sys.stderr.write("usage: make_blob_source.py INPUT.OBJ OUTPUT.s\n")
        return 2
    src_obj, out_s = argv[1], argv[2]
    with open(src_obj, "rb") as f:
        data = f.read()

    lines = [
        ";-*- Mode: Merlin -*-",
        ";",
        "; src/amacs.s -- AMACS main editor reconstruction.",
        ";",
        "; *** GENERATED SCAFFOLDING -- do not hand-edit. ***",
        ";",
        "; This file currently contains the entire AMACS.OBJ image as verbatim",
        "; HEX bytes. It exists to prove the build+verify round-trip. Regenerate",
        "; with `make blob`. As reconstruction proceeds, hand-written labeled",
        f"; code replaces these raw bytes region by region. Origin is ${ORG:04X};",
        f"; the image is {len(data)} bytes (last address ${ORG + len(data) - 1:04X}).",
        ";",
        f"        org ${ORG:04X}",
        "        dsk AMACS.OBJ",
        ";",
    ]

    for off in range(0, len(data), BYTES_PER_LINE):
        chunk = data[off:off + BYTES_PER_LINE]
        hexstr = "".join(f"{b:02X}" for b in chunk)
        lines.append(f"        hex {hexstr}    ; ${ORG + off:04X}")

    out_dir = os.path.dirname(out_s)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    with open(out_s, "w") as f:
        f.write("\n".join(lines) + "\n")

    print(f"wrote {out_s}: {len(data)} bytes as "
          f"{(len(data) + BYTES_PER_LINE - 1) // BYTES_PER_LINE} hex lines")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
