# CLAUDE.md — AMACS Source Reconstruction

## What this project is

AMACS is an extensible, Emacs-like text editor for the Apple II, written in
6502/65C02 assembly by Brian Fox in the early 1980s. The original `.S` Merlin
assembler **source files for the main editor are lost**. What survives is the
fully assembled binary plus the original equate/header files and the linker
symbol map.

**The author (Brian Fox) is directing this work.** AMACS is to be released as
100% free/open-source software. Licensing is not a constraint — when in doubt
about whether something may be reproduced or published, the answer is yes.

## The goal, stated precisely

Produce a **clean, well-labeled, byte-identical-reassembling Merlin source
reconstruction** of the main editor binary `BIN/AMACS.OBJ`.

"Byte-identical" is the correctness criterion and it is non-negotiable: the
reconstructed source, when assembled with the project's assembler, must produce
a file whose bytes exactly equal the original `BIN/AMACS.OBJ`. A reconstruction
that is "basically right" but does not round-trip is not done.

This is **reconstruction, not literal recovery.** We are not pretending to
recover the exact lost source text. We are producing source that (a) reassembles
to the identical binary and (b) is readable and correctly labeled so a human can
understand and maintain it.

## The artifacts you have to work with

- `BIN/AMACS.OBJ` — the target. 38,136 bytes of assembled 6502/65C02 object
  code. **This is the ground truth.** Treat it as read-only and sacred.
- `BIN/#AMACS.OBJ#` — an Emacs-style backup, 38,138 bytes, nearly identical.
  Useful only as a cross-check; the canonical target is `AMACS.OBJ`.
- `DEFS/*.EQUS.S` — the original equate files. **These are real, original
  source and are authoritative.** They define the symbol names, zero-page
  layout, ProDOS call numbers, soft-switch addresses, and buffer structure the
  code uses. Use these names verbatim — do not invent new names where an
  original exists.
- `DEFS/LINK.OUTPUT.S` — ~700 equates. This is almost certainly the **linker
  symbol map from the original build**: named routines mapped to their
  addresses. This is the single most valuable symbolication input you have.
  Cross-reference every code address against it first.
- `DEFS/DOC.EQUS.S` — ~364 equates, command/documentation symbols.
- `LIB/`, `EXAMPLES/`, `HELP/`, `TUTORIAL/`, `MAKETAGS.DIR/` — context. The
  `MAKETAGS.DIR/**/*.S` files are intact original source and show the author's
  real coding style, macro usage, and naming conventions. **Read these to learn
  the house style** before proposing labels.

## Critical technical facts (do not rediscover these the hard way)

- **Load address is `$1000`.** Byte 0 of `AMACS.OBJ` lives at `$1000`. Offset N
  in the file is address `$1000 + N`. The first bytes are a `JMP` dispatch
  table (`4C lo hi` repeated) — the editor's public entry-point vector block.
  Confirmed entries include `JMP $1046`, `JMP $1055`, `JMP $729D`, etc.
- **CPU is 65C02.** Use a 65C02-aware disassembler; do not let it misdecode
  65C02-only opcodes as 6502 garbage.
- **The code uses Apple II aux-memory bank switching.** See
  `DEFS/BANKSW.EQUS.S` and `DEFS/SCREEN.EQUS.S`. Soft switches like `$C008`
  (UseMainZP), `$C009` (UseAuxZP), `WrMainRam`/`RdMainRam` etc. mean the running
  program moves between main and aux RAM and between zero-page banks. Code that
  looks like it jumps "into data" may be executing in a different bank context.
  Flag bank-switch sites prominently in comments.
- **Merlin source text format.** Original `.S` files are stored with the high
  bit set on each byte and use CR (`\r`, `$0D`) line terminators, not LF. To
  read them as text, strip the high bit (`byte & 0x7F`) and treat CR as
  newline. Any new source files we generate for the modern toolchain should be
  plain ASCII / LF unless the chosen assembler requires otherwise.
- **Naming conventions observed in the originals:** CamelCase for routines and
  buffer fields (`TheBuffer`, `GapTop`, `OpenFile`), lower_snake with a type
  prefix for small enums (`var_byte`, `ram_AuxBank1`), `?`-suffixed names for
  read-back soft switches (`RdMainRam?`). Match these. Do not impose a different
  convention.

## Toolchain

Primary path: a 65C02 cross-disassembler + a Merlin-compatible assembler that
can reassemble to a fixed origin and emit a raw object identical to the original.

- For assembly/reassembly, **Merlin 32** (Brutal Deluxe) is the reference
  Merlin-syntax cross-assembler and is the natural target since the originals
  are Merlin format.
- `da65` (cc65 suite) is an acceptable disassembler if driven with a hand-built
  info file pinning the origin to `$1000` and marking code/data regions.
- `6502bench SourceGen` is excellent for the interactive label-import +
  reassembly-verification loop and can run alongside this repo.

Whatever the tool, the build must be **reproducible from a single command** and
the verification must be automated (see below).

## The verification harness is the heart of the project

Before doing large-scale labeling, stand up the round-trip check:

1. A `build` step that assembles the reconstructed source to a raw object.
2. A `verify` step that does a byte-for-byte comparison of the build output
   against `BIN/AMACS.OBJ` and exits non-zero on any difference, printing the
   address (`$1000 + offset`) of the first divergence.
3. Wire `verify` into CI so the round-trip can never silently regress.

**Work in small, always-verifying increments.** The correct rhythm is:
disassemble a region → label it → reassemble → confirm still byte-identical →
commit. Never make a large batch of changes and verify at the end. If a label
or reformat changes a single output byte, that change is wrong and must be
caught immediately.

## Division of labor (important)

You (Claude) do the high-volume mechanical work:
- Driving the disassembler and producing the initial listing.
- The symbolication pass: cross-referencing every `JMP`/`JSR`/branch/`LDA`/`STA`
  target against `LINK.OUTPUT.S` and the other `DEFS`, and rewriting bare
  addresses into named labels.
- Separating code from data (jump tables, string tables, the chart data).
- Maintaining the build + verify harness and keeping the round-trip green.
- Proposing comments that explain mechanics ("switches to aux bank before
  copy", "advances point past the gap").

Brian does the irreducible human part:
- Confirming or correcting labels where intent matters.
- Explaining *why* — the design rationale, the macro boundaries that existed in
  the lost source, clever tricks the binary cannot self-document.
- Final say on naming and structure.

**Never invent a semantic explanation of intent and state it as fact.** If you
don't know why a routine does something, say so and label it descriptively by
*behavior*, leaving the *why* for Brian. Distinguish clearly in comments between
"this is what the code does" (you can assert) and "this is probably why"
(propose, mark as a question).

## Working agreements

- `BIN/AMACS.OBJ` is read-only ground truth. Never modify it. Never "fix" the
  binary to match the source — the source is always what changes.
- Prefer many small commits with descriptive messages over large ones. Each
  commit should leave the round-trip verification green.
- When you reach a genuinely ambiguous decision point (is this region code or
  data? is this the real routine name?), stop and ask rather than guessing and
  burying the guess in a commit.
- Keep a running `PROGRESS.md`: which address ranges are disassembled, labeled,
  verified; which are still raw; open questions for Brian.
- Don't reformat or re-comment original `DEFS/*.S` or `MAKETAGS.DIR` source —
  those are authentic and stay as-is. New work goes in new files.
