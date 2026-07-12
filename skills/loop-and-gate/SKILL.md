---
name: loop-and-gate
description: Run a change through the Loop & Gate human-decision gates. Use before or during any agentic build — when starting a feature, approving a plan, judging a test, or deciding whether to ship. Surfaces the gates this change earns and walks the human through each decision, including the fallback when a gate's lens isn't theirs.
---

# Loop & Gate

One job: stop the build loop at the points where a human has to decide, and make
the decision well. The agent runs the stretches between gates; this skill runs
the gates.

The full checklist for every gate is in `reference/gates.md` — read it when you
reach a gate. This skill is how you *operate* it.

## Always start with Gate ∞

Before anything, decide how much process this change earns. Do not run all ten
working gates on every change.

1. Read the change and size its blast radius. Ask the human, in one line: **what
   breaks if this is wrong, and can it be undone?**
2. Pick the gate set:
   - **Touches money, customer data, auth, or anything irreversible** → the full
     set (0–9, in order).
   - **Cosmetic and reversible** (copy tweak, a redirect, a style fix) → the
     minimum: "is this the right small fix?" and "ship it." Usually two gates.
   - **Unsure** → treat it as higher-stakes than it looks. Over-processing a small
     thing costs minutes; under-processing a big one costs the weekend.
3. State the chosen gate set to the human before proceeding. That statement is
   itself the Gate ∞ decision.

## Working a gate

For each gate in the chosen set, in order:

1. Name the gate and its lens (Business / Engineering / Both) from
   `reference/gates.md`.
2. Present **the decision** the human is on the hook for — not a recommendation,
   the actual call.
3. Surface what the pipeline produced or claimed at this point (the plan, the
   test, the cost, the diff), and apply the **good judgment** heuristics for that
   gate.
4. **If the gate's lens isn't the human's**, run the "not your lens" fallback from
   the reference: put the agent to work making the decision defensible (steelman
   the opposite, enumerate what it's *not* doing, name what would turn red if it
   broke, propose a cheaper tier), and let the human decide against the structure.
   Do this *with* the human, so they learn the gate — never *instead* of them.
5. Wait for the human's decision before moving to the next gate. The whole point
   is that these calls are theirs.

## Rules

- **Never make a gate decision for the human.** Surface the call, apply the
  heuristics, present the evidence — then stop. Rubber-stamping is the failure
  this skill exists to prevent.
- **Gate ∞ is not optional and not delegable.** It's the decision about how much
  to trust the agent, so the agent can't make it. Always run it, always with the
  human.
- **A gate with no tool behind it is still a gate.** Cost (7) and process (∞) have
  no skill filling them — they're pure judgment. Don't skip a gate because nothing
  automates it.
- **Match rigor to blast radius, not to habit.** The same change doesn't get the
  same process everywhere; Gate ∞ resets it each time.
- If a Foundation kit is present, read `vault/Profiles/` for the human's voice and
  taste so gate framing and any drafted customer notes match how they'd write and
  judge. Log each gate decision — the call and the one-line why — to the vault
  (the day's note, or the capture/inbox path) so the reasoning compounds across
  sessions instead of evaporating. Gate ∞'s chosen set is worth logging too.

## The pipeline underneath

Which agent skills fill the space between the gates is a disposable, dated
snapshot — see `reference/pipeline-snapshot.md`. Never anchor on the tools; anchor
on the gates. When the tool names change next quarter, the gates don't.
