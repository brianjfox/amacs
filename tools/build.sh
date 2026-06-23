#!/usr/bin/env bash
#
# tools/build.sh — assemble the reconstructed source to a raw object at $1000.
#
# Produces build/AMACS.OBJ from src/amacs.s using Merlin 32. The reconstructed
# source carries `org $1000`; Merlin 32 emits a headerless raw object (just the
# assembled bytes), which is exactly the format of BIN/AMACS.OBJ.
#
# We stage the source into build/ and assemble there so Merlin's `dsk` output
# lands in build/ deterministically (Merlin writes the object relative to the
# source file's directory).
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MERLIN_BIN="$REPO_ROOT/tools/merlin32/Source/merlin32"
SRC="$REPO_ROOT/src/amacs.s"
BUILD_DIR="$REPO_ROOT/build"
STAGE="$BUILD_DIR/amacs.s"
OUT="$BUILD_DIR/AMACS.OBJ"

if [ ! -x "$MERLIN_BIN" ]; then
    echo "ERROR: Merlin 32 not built. Run: tools/setup.sh" >&2
    exit 1
fi
if [ ! -f "$SRC" ]; then
    echo "ERROR: $SRC not found. Generate scaffolding with: make blob" >&2
    exit 1
fi

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cp "$SRC" "$STAGE"
# Stage the module sources too, so the master's `put modules/...' resolves
# relative to the staged master.
if [ -d "$REPO_ROOT/src/modules" ]; then
    cp -R "$REPO_ROOT/src/modules" "$BUILD_DIR/modules"
fi

# Assemble. macro_dir is the build dir (so any future `use`/`put` of staged
# includes resolves). Merlin writes the object named by `dsk` (AMACS.OBJ) here.
LOG="$BUILD_DIR/merlin.log"
if ! "$MERLIN_BIN" "$BUILD_DIR" "$STAGE" >"$LOG" 2>&1; then
    echo "ERROR: Merlin 32 assembly failed:" >&2
    cat "$LOG" >&2
    exit 1
fi

# Merlin signals errors by emitting error_output.txt and a non-zero exit; guard
# against both in case of exit-code quirks.
if [ -f "$BUILD_DIR/error_output.txt" ]; then
    echo "ERROR: Merlin 32 reported errors:" >&2
    cat "$BUILD_DIR/error_output.txt" >&2
    exit 1
fi
if [ ! -f "$OUT" ]; then
    echo "ERROR: expected object not produced: $OUT" >&2
    cat "$LOG" >&2
    exit 1
fi

echo "Built $OUT ($(wc -c <"$OUT" | tr -d ' ') bytes)"
