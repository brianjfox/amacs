# PROMPTS.md — How to drive Claude Code through the AMACS reconstruction

These are staged prompts. Run them roughly in order. The point of staging is to
give Claude Code one well-defined job at a time instead of "go reverse-engineer
this," which tends to wander. Don't paste them all at once.

`CLAUDE.md` is read automatically at the start of every Claude Code session, so
you don't need to repeat its contents in any prompt below.

---

## Stage 0 — Orientation (do this first, every fresh start)

> Read CLAUDE.md, then survey the repository: confirm the size and load address
> of BIN/AMACS.OBJ, decode and skim every DEFS/*.EQUS.S file (remember they're
> high-bit-set with CR line endings), and read a couple of the MAKETAGS.DIR
> *.S files to learn the author's coding style. Then write PROGRESS.md with a
> map of what we have and a proposed plan of attack. Do not start disassembling
> yet — I want to review the plan first.

Review the plan. Correct anything about the structure you know to be wrong
before proceeding — this is the cheapest moment to steer.

---

## Stage 1 — Build the verification harness BEFORE any labeling

> Set up the toolchain and the round-trip verification harness described in
> CLAUDE.md. I want a single `build` command that assembles reconstructed source
> to a raw object at origin $1000, and a `verify` command that compares the
> output byte-for-byte against BIN/AMACS.OBJ and reports the address of the
> first difference. Prove it works end to end: start by treating the raw bytes
> as a trivial "source" (e.g. a literal byte blob the assembler emits verbatim),
> assemble it, and show me verify passing. Then wire verify into CI.

This is the most important stage. Until `verify` passes on a trivial round-trip,
nothing else is trustworthy. Don't let it move on until this is green.

---

## Stage 2 — First disassembly pass (structure, not names yet)

> Disassemble BIN/AMACS.OBJ as 65C02 at origin $1000. First identify the
> top-of-file JMP dispatch table and list every entry-point address. Then make a
> first cut at separating code from data: the jump table, any string/message
> tables, and the chart data are data; everything reachable from the entry
> vectors is code. Produce the disassembly as source that reassembles
> byte-identically — run verify and show me it still passes. Record the
> code/data map in PROGRESS.md. Use bare addresses for now; we label next.

Expect to iterate here. If `verify` breaks, a region was mis-split between code
and data. That's normal; it's exactly what the harness is for.

---

## Stage 3 — Symbolication from the linker map (the big automated win)

> Now the symbolication pass. DEFS/LINK.OUTPUT.S is almost certainly the
> original linker symbol map — ~700 name→address pairs. Cross-reference every
> code address (JMP/JSR/branch targets, and the operands of LDA/STA/etc. that
> hit known locations) against LINK.OUTPUT.S first, then against the other DEFS
> files (BUFFER, PRODOS, SCREEN, BANKSW, DOC...). Replace bare addresses with the
> original names wherever a match exists. Use the names verbatim — do not invent
> a name where an original exists. After each batch, run verify and commit.
> Maintain a coverage stat in PROGRESS.md: what fraction of addresses now have
> real names vs. still anonymous.

This is where Claude Code earns its keep — it's hours of mechanical
cross-referencing done consistently. Let it run, spot-check the commits.

---

## Stage 4 — Label the remainder by behavior + flag bank switching

> For code regions with no symbol in LINK.OUTPUT.S, propose descriptive labels
> based on observed behavior (e.g. AdvancePointPastGap), clearly marked as
> Claude-proposed, not original. Separately, find every aux-memory and zero-page
> bank-switch site (see BANKSW.EQUS.S / SCREEN.EQUS.S soft switches) and add a
> prominent comment at each, because these change which RAM bank subsequent code
> executes or operates in. List everything you labeled by behavior in
> PROGRESS.md under "needs Brian's confirmation," and list anything you genuinely
> can't explain under "open questions." Keep verify green throughout.

Then sit down with the "needs confirmation" and "open questions" lists. This is
your irreducible part — your answers here are things no tool can derive.

---

## Stage 5 — Comments, rationale, and polish

> Go through the confirmed labels and add explanatory comments for mechanics you
> can assert from the code. Where I've given you design rationale, fold it in but
> keep it clearly separated from behavioral description. Do a final readability
> pass on the reconstructed source so a new maintainer could navigate it. Confirm
> verify still passes and CI is green. Update PROGRESS.md to reflect final state.

---

## Standing reminders to drop in whenever needed

- "Run verify and show me the result before committing."
- "You're guessing at intent there — label it by behavior and add it to the open
  questions list instead of asserting why."
- "Don't modify BIN/AMACS.OBJ or the original DEFS/MAKETAGS source. The source
  reconstruction is what changes, never the ground truth."
- "Stop and ask: is this region code or data? Don't bury the guess in a commit."

---

## A note on session length

A 38 KB binary is big enough that you'll work across several sessions. Because
CLAUDE.md and PROGRESS.md are on disk, each new session can re-orient from them —
so keep PROGRESS.md accurate; it's the project's memory between sessions. Start
each session with a short "read CLAUDE.md and PROGRESS.md, tell me where we are
and what's next" before giving the day's task.
