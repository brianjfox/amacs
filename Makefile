# AMACS source-reconstruction build + round-trip verification.
#
#   make setup    build the reference assembler (Merlin 32) into tools/
#   make blob     (re)generate scaffolding src/amacs.s from BIN/AMACS.OBJ
#   make build    assemble src/amacs.s -> build/AMACS.OBJ at origin $1000
#   make verify   byte-compare build/AMACS.OBJ against BIN/AMACS.OBJ
#   make check    build + verify (the canonical round-trip)
#   make clean    remove build artifacts
#
# The contract: `make check` must stay green. A change that alters a single
# output byte is wrong and is caught here immediately.

GOLD    := BIN/AMACS.OBJ
SRC     := src/amacs.s
REGIONS := src/regions.json

.PHONY: all check setup blob disasm build verify clean

all: check

setup:
	tools/setup.sh

$(SRC): tools/make_blob_source.py $(GOLD)
	tools/make_blob_source.py $(GOLD) $(SRC)

blob:
	tools/make_blob_source.py $(GOLD) $(SRC)

# Regenerate the Stage 2 disassembly from the binary + code/data region map.
disasm:
	tools/disasm.py $(GOLD) $(SRC) $(REGIONS)

build:
	tools/build.sh

verify:
	tools/verify.sh

check: build verify

clean:
	rm -rf build
