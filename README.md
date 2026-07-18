# Loop & Gate — Build Kit

A judgment layer for building software with an agentic loop. Anyone can install
the tools that write code. Almost nobody knows **where to intervene**. This kit
is the map of those points — the gates — and how to work each one, even the ones
whose expertise you don't have yet.

## The idea in one paragraph

An agentic build loop can run brainstorm → plan → build → test → review → ship on
its own. It should. But it makes wrong assumptions and runs with them, it
overbuilds, it calls a one-off demo "tested," and it can't tell a real problem
from a loud one. So the loop has to stop at a fixed set of points and wait for a
human. Those points are the gates. Work them well and a mediocre tool stack ships
good software. Work them badly and the best tools on the market ship you a fast,
tested, well-reviewed mistake. **The gates are the asset. The tools are a
disposable appendix.**

## What's in here

| Path | What it is |
|------|-----------|
| `GETTING-STARTED.md` | Zero-assumptions walkthrough — start here if you're new to any of this. |
| `reference/gates.md` | The eleven gates in runnable checklist form — the core asset. |
| `skills/loop-and-gate/` | The operating skill: run a change through the gates it earns. |
| `reference/pipeline-snapshot.md` | A dated snapshot of the public plugins that fill the space between the gates, with install commands. Labelled disposable on purpose. |
| `templates/business-context.md` | A fill-in template for the business-context step (persona, opportunity, KPIs, GTM, risk). |
| `.claude-plugin/` | Marketplace + plugin manifest — lets you install this kit via `/plugin marketplace add`. |
| `scripts/setup.sh` | Optional convenience for the terminal/clone path. Not needed for plugin install. |

## Install

**New to this?** Read **[GETTING-STARTED.md](GETTING-STARTED.md)** — it assumes no
coding background and no terminal experience, and gets you from nothing to your
first build using the Claude Code Desktop app.

**Have Claude Code? Install it as a plugin — no clone, no setup.** In the Code chat
(Desktop app, web, or CLI), type:

```
/plugin marketplace add slogsdon/loop-and-gate-build-kit
```

then click **Install** on the menu that appears. The `loop-and-gate` skill is now
available: run `/loop-and-gate` at any build decision — it runs **Gate ∞** first to
size the change, then walks you through only the gates that change actually needs.

You also need the **build pipeline** the gates sit on top of (the gates are the
judgment layer, not the loop itself) — two free public plugins, `superpowers` and
`agent-skills`. GETTING-STARTED and `reference/pipeline-snapshot.md` list the exact
install commands.

**Prefer the terminal?** `git clone` this repo and use the `loop-and-gate` skill
directly. `scripts/setup.sh` is an optional convenience for that path.

## What it looks like

A customer reports the lead export is missing a field. You invoke `loop-and-gate`:

- **Gate ∞ first.** The skill asks what breaks if this is wrong and whether it's
  reversible. Export change, no money or auth, reversible → it earns a few gates,
  not all ten.
- **Gate 1.** Who asked, why it matters, what "fixed" means to them. Your call.
- **Gate 3.** Approve the plan — and it makes the agent list what it's *not* doing,
  which surfaces the missing backfill for existing rows.
- **Gate 6.** "If this breaks next month, what turns red?" No answer → it's a demo,
  send it back for a real assertion.
- **Gate 9.** Ship to the customer who asked first, tell them, then widen.

A one-line copy fix, run through the same skill, earns two gates and ships in
minutes. That difference is Gate ∞ doing its job.

## The one rule

The kit doesn't decide for you. It surfaces the call, applies the heuristics, puts
the agent to work making the decision defensible — then stops. Use it to *work*
each gate and you level up on the lens you're missing. Use it to *skip* the gate
and you just fail faster, with nicer tooling.

## What this sits next to

- **The whole stack** — [Loop & Gate](https://shane.logsdon.io/loop-and-gate/) — the
  overview: the mental model, all four pieces, and how to install them together.
- **The Grow Kit** — [loop-and-gate-grow-kit](https://github.com/slogsdon/loop-and-gate-grow-kit)
  — is the other half of the loop. This kit takes an idea to shipped software. The
  Grow Kit takes shipped software to the right people and reads whether it worked.
  They close a loop through the Foundation vault: the Grow Kit writes market signals
  where this kit's Gate 0 reads them to decide what to build next. Same method, both
  halves, one customer at the center.
- **The Foundation kit** — [second-brain-agent](https://github.com/slogsdon/second-brain-agent)
  — is the ground this stands on: cross-session memory, capture from your phone,
  and your voice/taste profiles. If it's present, the operating skill reads
  `vault/Profiles/` so gate framing matches how you write and judge, and logs each
  gate decision so your reasoning compounds across sessions. This kit works
  without it, but they're built to compose — and the Foundation kit is the gentler
  on-ramp, so **if you're new, start there** (it walks you through installing
  Claude Code) and add this kit on top.
- **Across your devices** — the Foundation's [Working across devices](https://github.com/slogsdon/second-brain-agent#working-across-devices)
  guide applies here too. Gate decisions and logs land in the same vault, so the
  same Remote Control, sync, and worktree discipline runs this kit from your
  phone, tablet, or desk — nothing kit-specific to set up.
- **The field guide** is the narrative version of the gates, with a worked example
  carried through the whole build of one real product. This kit is the terse,
  runnable form of the same eleven gates.

## Status

The asset (gates reference + operating skill), the business-context template, and
the pipeline snapshot with compose-your-own guide are all here. Next: glue to read
the Foundation kit's voice/taste profiles, and a final package pass.
