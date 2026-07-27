# Running Wide — where the gates go when the work fans out

**This adds no gate.** It's the sub-reference for one decision you already make:
Gate ∞'s *how wide*. Read it when you're considering running many agents on one
job at once, and put it down again when the answer is no — which is most of the
time.

The shape has a name — fan out, reduce, synthesize — and one honest summary:
**it buys breadth, not judgment.** Many agents working independent pieces finish
in the time of the slowest piece instead of the sum of all of them. That is the
entire benefit. It does not make any single piece better, and it will spend real
money in the background while you're not looking.

---

## Does this job earn a wide run?

The test is whether two pieces of the work genuinely don't need each other's
output. Walk the steps and ask, at each one: *does this need what the last step
produced?* If yes, keep the order. If no, the wait is invented — those two can
run at once.

If you can't name two independent pieces, there is nothing to fan out. It's one
loop. Run the loop.

**Don't go wide when:**

- The job is small or isolated — one bug, one function. Coordination costs more
  than the work.
- You want to approve every step. A wide run's whole premise is working without
  you between the seams. A tight leash and a fleet are the same money for less
  work.
- You don't know yet what you're looking for. Exploration wants one agent you can
  steer, not twenty locked into a plan you wrote before you understood the
  problem.
- The steps really do depend on each other. Forcing width onto sequential work
  adds cost and buys nothing.

**Good candidates:** one agent per file across a repo-wide sweep or audit; one
researcher per independent angle; anything where you'd otherwise queue N
identical, unrelated jobs and wait.

---

## Where the human gates go

This is the part that makes a wide run compatible with the gates instead of a
replacement for them. The instinct — approve every node — kills the benefit and
buys nothing, because the nodes are independent and there's no decision to make
between them. Gates go at the **seams**, where the shape of the work changes:

1. **Before the fan-out** — approve the split, the cap, and the contract. This is
   Gate ∞ plus Gate 7 in one stop: is this really independent work, how many
   agents, and what does that cost. It's also the last cheap moment to be wrong.
2. **After the reduce, before the synthesize** — approve what survived. You're
   looking at a compressed list, not twenty transcripts: what came back, what
   died, what got dropped and why. This is where Gate 6 and Gate 8 land.

Two gates for twenty agents. Anything the fan-out produces that would normally
earn Gates 0–3 still earns them — but it earns them *once*, on the merged
result, not per node.

---

## The node contract

A node whose output is a wall of prose is a node only a human can read, which
means you're back to reading twenty transcripts. Fix the shape before the run:

```
JOB:  one bounded job, nothing else
IN:   what's passed in — never what the agent should assume
OUT:  fixed fields (e.g. finding, file, line, evidence path)
CAP:  how many of these run, stated before the run starts
FAIL: a node that returns nothing gets flagged, never skipped silently
```

The `OUT` line is what makes the merge readable. The `FAIL` line is what keeps
the merge honest.

---

## The three ways wide runs break

- **Context collapse.** Twenty raw outputs into one final step is fine; two
  hundred is not — you blow the window before the synthesis starts. Layer the
  merge: summarize in batches, then combine the summaries.
- **False independence.** Two nodes look independent because their prompts don't
  mention each other, but they write the same file or share the same rate limit.
  That's a real dependency you didn't draw. Give each worker its own workspace
  (a git worktree per agent is the cheap version), and audit for shared
  *resources*, not just shared data.
- **Silent node failure.** In a queue, one failure stops everything — annoying,
  obvious. In a wide run, one dead node out of fifty vanishes into a report that
  reads complete. Count what returned against what you started. This is Gate 5's
  question in a shape where nothing stalls to tell you.

---

## The anchor rule

Checkers checking checkers converges on agreement, not truth — every node reads
another node's report and everything stays consistent while nothing is verified.
A wide run needs at least one input that can't argue back: a test that actually
ran, a file that actually exists, a number that landed somewhere outside the run.
If every node's evidence is another node's output, you've bought consensus.

Same rule as Gate 6, one level up: a checker that shares the worker's context is
agreeing, not checking. Hand it the finding and the evidence, never the session.

---

## Cost

The coordination gets cheaper. The work does not. Ten agents cost roughly ten
agents. Public example of the ceiling: one engineer's fleet-driven runtime
rewrite ran ~50 workflows at up to 64 concurrent agents and cost roughly $165k in
usage — with a human designing and watching all of it.

So: cap the first run low, price it, and widen only once a run has earned it.
That's Gate 7, and it's the gate a wide run fails most often.

---

## Tooling (dated: 2026-07-27 — disposable, like every tool note here)

Claude Code runs this shape natively — describing the job as a *workflow* gets you
an orchestration script and a coordinated set of sub-agents, with results passed
as data rather than conversation, so the intermediate output never lands in your
session. Nothing to install. As always: the seams and the gates are the asset,
the tool is the appendix.
