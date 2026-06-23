# PROGRESS.md — AMACS Source Reconstruction

Status as of 2026-06-23. This is the living map + plan. No disassembly has
started yet — this document is for Brian to review and approve the approach
before we cut the first listing.

---

## 1. What we have (verified inventory)

### The target
- `BIN/AMACS.OBJ` — **38,136 bytes** (confirmed). Load/origin **$1000**.
  Last byte lives at `$1000 + 0x94F7 = $A4F7`. This is ground truth, read-only.
- `BIN/#AMACS.OBJ#` — 38,138-byte Emacs backup. Cross-check only.

### The opening bytes are already fully explained
The first `$35` bytes are the public entry block, and `DEFS/EXTERNAL.EQUS.S`
documents every entry. Decoded from the binary:

| Addr  | Bytes      | Meaning (from EXTERNAL.EQUS.S) |
|-------|------------|--------------------------------|
| $1000 | 4C 46 10   | `JMP $1046`  AMACSBoot (cold start) |
| $1003 | 4C 55 10   | `JMP $1055`  AMACSWarm |
| $1006 | 4C 9D 72   | `JMP $729D`  DSK:OpenFile |
| $1009 | 4C FE 72   | `JMP $72FE`  PrepRead |
| $100C | 4C E5 73   | `JMP $73E5`  DSK:CloseFile |
| $100F | 4C AB 72   | `JMP $72AB`  DSK:ReadByte |
| $1012 | 4C E5 5A   | `JMP $5AE5`  SI:CompleteMe |
| $1015 | 4C 6B 7A   | `JMP $7A6B`  InitArgument |
| $1018 | 4C AF 14   | `JMP $14AF`  SetVariable |
| $101B | 4C B8 42   | `JMP $42B8`  GiveArgs |
| $101E | 4C 2E 5A   | `JMP $5A2E`  FunctionRef |
| $1021 | 4C D3 7F   | `JMP $7FD3`  BindKey |
| $1024 | 4C 0B 28   | `JMP $280B`  PushTYI |
| $1027 | (word)     | CompList pointer |
| $1029 | (word)     | CommandNames pointer |
| $102B | (word)     | CharIndex pointer |
| $102D | (word)     | ComTab pointer |
| $102F | (word)     | C_XCharacters pointer |
| $1031 | (word)     | C_XVectors pointer |
| $1033 | (word)     | C_XCharCount pointer |

`BindKey = $7FD3` here matches `BindKey = $7FD3` in `LINK.OUTPUT.S` — the
equate files cross-validate against the binary. This is a strong signal the
symbol map is real and accurate.

### The symbolication inputs (all decoded and skimmed)
All `DEFS/*.S` are Merlin source: high-bit-set bytes, CR (`$0D`) line endings.
Decode = `byte & 0x7F`, CR→newline.

| File | Role | Notes |
|------|------|-------|
| `LINK.OUTPUT.S` | **Linker symbol map — 700 named addresses, alphabetized.** The single most valuable input. | Range $1035…$A4xx in-file, plus ~15 in $D000+ (bank-switched runtime region, not in OBJ). |
| `DOC.EQUS.S` | ~360 `doc:Name = $ABxx`/`$BExx` command-doc symbols. | Addresses are $AB00–$BExx — **outside AMACS.OBJ**; these belong to the docs overlay (`BIN/SI.DOCS.OBJ`). Useful for naming commands, not for placing code in AMACS.OBJ. |
| `BUFFER.EQUS.S` | Buffer/gap-buffer data model (`Point`, `GapTop`, `GapBot`, `TheBuffer`…), buffer-info struct offsets, flags, minor modes. | Zero-page `TheBuffer = $60`. Editor is a classic gap buffer. |
| `SCREEN.EQUS.S` | Window/cursor zero-page ($20–$29), soft switches, key/char constants, 80-col conditional. | Defines `RdMainRam/WrMainRam/RdAltRam/WrAltRam` etc. |
| `BANKSW.EQUS.S` | Aux-RAM / alt-ZP soft switches and bank indices (`ram_*`). | Main/Aux + Bank1/Bank2 model. Flag these sites loudly. |
| `PRODOS.EQUS.S` | ProDOS MLI call numbers, error codes, global page, machine-ID, path buffers (`$301`), `rm_FileBuffer = $A500`. | `$A500` = "1 after last byte of AMACS" — consistent with file end $A4F7. |
| `FILER.EQUS.S` | MLI param-block field offsets (overlaid on `MLIParams`). | |
| `EXTERNAL.EQUS.S` | The entry vector block (table above). | Authoritative for $1000–$1034. |
| `LIBRARY.EQUS.S` | High-RAM map $D000–$DFFF (alt-bank routines, quit code, modeline, lib names, buffer-dumper, libraries). | Runtime addresses; relocated, not literal OBJ offsets. |
| `MODE.EQUS.S` | Major-mode numbers (Fund/Text/Merlin/Lisp/C/Pascal + Dired/Bufed/Mail). | |
| `DISPLAY.EQUS.S` | Display-driver dispatch codes (`dc_*`). | |
| `VAR.EQUS.S` | Variable-type tags (`var_byte`…`var_ftyp`). | |

### Symbol density (LINK.OUTPUT by $1000 page, in-OBJ region)
`$1xxx:74  $2xxx:112  $3xxx:99  $4xxx:61  $5xxx:73  $6xxx:62  $7xxx:98
$8xxx:82  $9xxx:22  $Axxx:2`  → ~683 labels across ~37 KB ≈ one label every
~55 bytes. Coverage is excellent; symbolication will be richly seeded.

### House style (from MAKETAGS.DIR originals + macros)
- Merlin column format: label in col 1; opcode space-indented; `;` comments.
- Directives in use: `org`, `typ`, `dsk`, `put`, `use`, `do/else/fin`
  conditionals, `mac/eom`, `dfb`, `da`, `lstdo off`. Macro params `]1 ]2 …`.
- Standard macros (`macros/standard.S`): `incr/decr` (16-bit inc/dec),
  `push/pop`, `move`, `load` (load immediate word), `phy` (65C02), etc.
- Naming: CamelCase routines/fields (`GapTop`, `OpenFile`); `?`-suffix
  predicates (`RdMainRam?`, `ZeroArg?`); `:` namespacing (`DSK:OpenFile`,
  `doc:CRLF`); `type_` / `xx_` prefixes for enums (`var_byte`, `ram_AuxBank1`,
  `mm_AutoFill`, `bf_ReadOnly`).
- These are 65C02 sources; `phy`/`ply` etc. appear. CPU target is 65C02.

### Other artifacts (context, not on the critical path)
- `BIN/SI.*.OBJ`, `BIN/AMACS.CHART`, `BIN/MAKECHART` — wall chart + system
  includes/overlays (docs, buffer dump, parenscan, ramaccess, initfiles).
- `LIB/`, `EXAMPLES/`, `HELP/`, `TUTORIAL/` — user-facing content.
- `MAKETAGS.DIR/**` — intact original source (the tag generator). Style ref.

---

## 2. Toolchain status — Merlin 32 chosen and working ✓

**The reassembler is Merlin 32** (Brutal Deluxe, v1.1.10, the
`apple2accumulator` fork). It is the natural target since the originals are
Merlin syntax, so the reconstruction is authored in the same dialect we ship.
`tools/setup.sh` clones and builds it into `tools/merlin32/` (gitignored — not
committed as a binary). Confirmed facts from a live test:

- **Output is a raw, headerless object.** `org $1000` + emitted bytes →
  exactly those bytes on disk, no ProDOS/AppleSingle/length prefix. This
  matches the format of `BIN/AMACS.OBJ` directly — no strip step needed.
- **Exit codes:** 0 on success; 1 on error, accompanied by an
  `error_output.txt`. The harness treats the byte-compare as authoritative and
  also fails on a non-zero exit or the presence of `error_output.txt`.
- **`dsk` output path** is resolved relative to the *source file's* directory.
  `build.sh` stages the source into `build/` and assembles there so the object
  lands in `build/AMACS.OBJ` deterministically.
- **Invocation:** `merlin32 <macro_dir> <source_file>`.

Disassembler (Phase 1, not yet installed): **da65** (cc65 suite, brew-available)
driven by a hand-built `.info` (origin `$1000`, `.cpu 65c02`, code/data ranges),
and/or **6502bench SourceGen** for the interactive label loop.

---

## 3. Verification harness — BUILT AND GREEN ✓

The round-trip is stood up and proven end to end. Layout:

```
src/amacs.s              reconstructed Merlin source (currently a byte blob)
build/                   assembler output (gitignored)
Makefile                 setup / blob / build / verify / check / clean
tools/setup.sh           clone+build Merlin 32 into tools/merlin32/
tools/make_blob_source.py generate src/amacs.s as verbatim HEX from the binary
tools/build.sh           assemble src/amacs.s -> build/AMACS.OBJ (origin $1000)
tools/verify.sh          byte-compare build vs BIN/AMACS.OBJ; report first diff
tools/decode.py          decode a high-bit/CR Merlin .S file to ASCII
```

Single commands: `make build`, `make verify`, `make check` (build+verify).

**Proof it works (this session):**
- Positive: `make check` → `VERIFY OK ... (38136 bytes, origin $1000, last
  address $A4F7)`, exit 0.
- Negative: flipping one source byte at `$1020` → `MISMATCH at offset 32
  (address $1020): expected $5A, got $5B`, non-zero exit. Regenerated clean,
  back to green.
- Cold build from `make clean` reproduces the identical object.

`verify` is one command, exits non-zero on any difference (byte or size), and
names the first divergent address as `$1000 + offset`. It is wired into CI
(`.github/workflows/verify.yml`: setup → build → verify on push/PR).

### The blob "source" (bootstrap scaffolding)
`src/amacs.s` currently holds the *entire* image as Merlin `hex` lines that
assemble verbatim at `$1000`. This is deliberate: it gives us a real,
in-repo source that already round-trips, so labeling can begin against a green
baseline. As reconstruction proceeds, raw `hex` regions are replaced — region
by region — with hand-written, labeled code/data that must keep `make check`
green. The blob shrinks; the contract never changes. (`make blob` regenerates
it from the binary; it is committed so CI needs no special step.)

---

## 4. Plan of attack (phased; each phase ends green)

**Phase 0 — Tooling & harness. ✓ DONE.** Merlin 32 built; `decode.py`,
`make_blob_source.py`, `build.sh`, `verify.sh`, `Makefile`, CI all in place.
Round-trip proven green (positive + negative), output confirmed headerless,
`org`/`dsk` semantics settled. da65/SourceGen still to be added for Phase 1.

**Phase 1 — One-shot raw disassembly. ✓ DONE.** `tools/disasm.py` is a
round-trip-safe 65C02 linear disassembler (built in-house — no da65 needed). It
emits Merlin source with numeric operands that **reassembles byte-identical**
(confirmed by `make check`). Empirically verified Merlin 32 encoding rules:
zero-page is chosen by operand value `< $100`, and the `:` mnemonic suffix forces
absolute (`lda: $0060` → `AD 60 00`); 65C02-only modes (STZ/BRA/PHX/`($zp)`/
JMP `($abs,x)`/BIT-imm) confirmed. Merlin 32 cannot assemble the Rockwell
`RMB/SMB/BBR/BBS` ($x7/$xF) ops — but AMACS sets `IfNCR65C02 = 0`, so those bytes
occur only in data and are emitted as `dfb`. Regenerate with `make disasm`.

**Phase 2 — Header & vector block (done-on-paper already).** Hand-author
$1000–$1034 from `EXTERNAL.EQUS.S` (table in §1): 13 `JMP`s + 7 word pointers.
Smallest, fully-known region — ideal first real commit. Verify.

**Phase 3 — Code/data separation.** Walk every `JMP/JSR/branch` and indexed
`LDA/STA` target against the symbol map to classify regions. Carve out the
obvious data: the command/key tables (`ComTab`, `CommandNames`, `CharIndex`,
`C_XCharacters/Vectors`, `CompList`), message/string tables (`BadCharMsg`, …),
and any chart data. Mark each region in the disassembler info file. Verify after
each carve. **Where code-vs-data is genuinely ambiguous, stop and ask Brian.**

**Phase 4 — Symbolication sweep (the high-volume mechanical work).** Region by
region, replace bare addresses with the `LINK.OUTPUT` names, wire in `DEFS`
equates (zero-page buffer/screen vars, soft switches, ProDOS calls, modes).
Annotate every bank-switch / alt-ZP site prominently. Small commits, verify
each. Re-introduce the standard macros only where they provably reassemble
identically — otherwise leave expanded.

**Phase 5 — Readability pass.** Behavioral comments (what, asserted) separated
from intent (why, proposed/flagged for Brian). Group routines into logical
source files mirroring the original module boundaries we can infer
(buffer, display, filer, keys, args, search, …).

**Phase 6 — Final round-trip & docs.** Full byte-identical build from clean
checkout in CI. Document the build, the toolchain, and remaining open questions.

Throughout: disassemble a region → label → reassemble → confirm byte-identical
→ commit. Never batch-then-verify.

---

## 5. Open questions for Brian

1. **Toolchain pick.** Merlin 32 + da65, or 6502bench SourceGen for the
   interactive loop? Any existing build setup you prefer I match?
2. **`doc:` symbols / docs overlay.** `DOC.EQUS.S` addresses ($AB00–$BExx)
   sit *outside* AMACS.OBJ — they look like the `SI.DOCS.OBJ` overlay. Are we
   reconstructing only the main editor `AMACS.OBJ` now, with the overlays
   (`SI.DOCS.OBJ`, buffer dumper, etc.) as later/out-of-scope work? Assuming
   yes for now.
3. **Source granularity.** Reconstruct as one monolithic `.S` (closest to a
   single assembled object) or split into module files via `put`/`use` like the
   originals? The split is nicer to read but I'll only do it if it round-trips.
4. **`LINK.OUTPUT.S` provenance.** Confirm this is the linker map from the
   actual shipped build of *this* `AMACS.OBJ` (the $1021→$7FD3 BindKey match
   strongly suggests it is). If it's from a different build, addresses could be
   off and I should treat it as advisory.

---

## 6. Region tracker (filled in as we go)

The full image is **disassembled and round-trips byte-identical** (`make check`).
Code/data split is a confident first cut, recorded in `src/regions.json`:

| Range | Kind | State | Notes |
|-------|------|-------|-------|
| $1000–$1026 | code | disassembled | 13-entry JMP vector block (matches EXTERNAL.EQUS, §1) |
| $1027–$1034 | data | carved | 7 word pointers: CompList=$5987, CommandNames=$9B37, CharIndex=$3F6D, ComTab=$4F84, C_XCharacters=$7DB8, C_XVectors=$7DDE, C_XCharCount=$7E2A |
| $1035 | data (1 byte) | noted | AMACSStack — saved stack ptr (`stx $1035` at $1047); refine in symbolication |
| $1036–$7DB7 | code | disassembled | bulk editor code (numeric operands, not yet labeled) |
| $7DB8–$7DDD | data | carved | C_XCharacters — 38 extended-key chars |
| $7DDE–$7E29 | data | carved | C_XVectors — 38 handler addresses (little-endian) |
| $7E2A | data | carved | C_XCharCount = $26 (38) |
| $7E2B–$9B36 | code | disassembled | more editor code |
| $9B37–$A4F7 | data | carved | CommandNames — alphabetical command-name string table to EOF |

(States: raw → disassembled → carved/labeled → verified.)

**Known data-table starts still inside "code" spans** (from the pointer block;
extents not yet bounded — to be carved as symbolication reveals their edges):
ComTab=$4F84, CharIndex=$3F6D, CompList=$5987, plus the many `*Msg`/`*String`/
table symbols in LINK.OUTPUT. These are emitted as (harmless, round-tripping)
pseudo-instructions for now; flagged so we don't mistake them for real code.

### Stage status (per PROMPTS.md)
- Stage 0 (orientation) ✓ · Stage 1 (harness) ✓ · Stage 2 (disassembly + first
  code/data cut, round-trips) ✓
- Stage 3 (symbolication from LINK.OUTPUT — the 700 names) — next.
- Stages 4–5 (behavioral labels + bank-switch flags; comments/polish) — pending.
