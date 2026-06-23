#!/usr/bin/env bash
#
# tools/verify.sh — byte-for-byte round-trip check.
#
# Compares the freshly built object (build/AMACS.OBJ) against the ground-truth
# image (BIN/AMACS.OBJ). Exits 0 only if they are byte-identical. On any
# difference (including a size mismatch) it prints the address of the first
# divergence as $1000 + offset and exits non-zero.
#
# This is the heart of the project: the reconstruction is "done" for a region
# only when this stays green.
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GOLD="$REPO_ROOT/BIN/AMACS.OBJ"
BUILT="$REPO_ROOT/build/AMACS.OBJ"

if [ ! -f "$BUILT" ]; then
    echo "ERROR: $BUILT not found. Run: make build" >&2
    exit 1
fi

python3 - "$GOLD" "$BUILT" <<'PY'
import sys

org = 0x1000
gold_path, built_path = sys.argv[1], sys.argv[2]
gold = open(gold_path, "rb").read()
built = open(built_path, "rb").read()

n = min(len(gold), len(built))
for i in range(n):
    if gold[i] != built[i]:
        print(f"MISMATCH at offset {i} (address ${org + i:04X}): "
              f"expected ${gold[i]:02X}, got ${built[i]:02X}")
        sys.exit(1)

if len(gold) != len(built):
    longer = "built" if len(built) > len(gold) else "gold"
    print(f"SIZE MISMATCH: gold={len(gold)} bytes, built={len(built)} bytes "
          f"(first {n} bytes match; {longer} is longer, "
          f"diverges at address ${org + n:04X})")
    sys.exit(1)

print(f"VERIFY OK: build/AMACS.OBJ == BIN/AMACS.OBJ ({len(gold)} bytes, "
      f"origin ${org:04X}, last address ${org + len(gold) - 1:04X})")
PY
