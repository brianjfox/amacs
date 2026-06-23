#!/usr/bin/env python3
"""tools/decode.py — decode an original Merlin .S file to plain ASCII.

The original AMACS source/equate files (DEFS/*.S, MAKETAGS.DIR/**/*.S) are
stored Apple-II style: every byte has the high bit set, and lines are
terminated with CR ($0D) rather than LF. This strips the high bit and converts
CR -> LF so the files can be read with normal tools.

Usage:
    tools/decode.py FILE        # print decoded text to stdout
"""
import sys


def decode(data: bytes) -> str:
    return "".join(chr(b & 0x7F) for b in data).replace("\r", "\n")


def main(argv):
    if len(argv) != 2:
        sys.stderr.write("usage: decode.py FILE\n")
        return 2
    with open(argv[1], "rb") as f:
        sys.stdout.write(decode(f.read()))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
