#!/usr/bin/env bash
#
# tools/setup.sh — fetch and build the reference assembler (Merlin 32).
#
# Merlin 32 (Brutal Deluxe) is the project's reference Merlin-syntax cross
# assembler. We build it from source into tools/merlin32/ (gitignored) so the
# toolchain is reproducible from a single command and not committed as a binary.
#
# Idempotent: re-running rebuilds only if the binary is missing.
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MERLIN_DIR="$REPO_ROOT/tools/merlin32"
MERLIN_BIN="$MERLIN_DIR/Source/merlin32"
MERLIN_REPO="https://github.com/apple2accumulator/merlin32.git"

if [ -x "$MERLIN_BIN" ]; then
    echo "Merlin 32 already built: $MERLIN_BIN"
    "$MERLIN_BIN" --help 2>&1 | head -1 || true
    exit 0
fi

echo "Cloning Merlin 32 from $MERLIN_REPO ..."
rm -rf "$MERLIN_DIR"
git clone --depth 1 "$MERLIN_REPO" "$MERLIN_DIR"

echo "Building Merlin 32 ..."
make -C "$MERLIN_DIR/Source" -f GNUmakefile

if [ ! -x "$MERLIN_BIN" ]; then
    echo "ERROR: build did not produce $MERLIN_BIN" >&2
    exit 1
fi

echo "OK: $MERLIN_BIN"
"$MERLIN_BIN" --help 2>&1 | head -1 || true
