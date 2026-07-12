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
good software; work them badly and the best tools on the market ship you a fast,
tested, well-reviewed mistake. **The gates are the asset. The tools are a
disposable appendix.**

## What's in here

| Path | What it is |
|------|-----------|
| `reference/gates.md` | The eleven gates in runnable checklist form — the core asset. |
| `skills/loop-and-gate/` | The operating skill: run a change through the gates it earns. |
| `reference/pipeline-snapshot.md` | *(coming)* A dated snapshot of the public plugins that fill the space between the gates. Labelled disposable on purpose. |
| `templates/business-context.md` | *(coming)* A fill-in template for the business-context step (persona, opportunity, KPIs, GTM, risk). |

## Install

Drop the skill where your agent discovers skills. For Claude Code:

```bash
ln -s "$(pwd)/skills/loop-and-gate" ~/.claude/skills/loop-and-gate
# or symlink into a project's .claude/skills/
```

Then, at any build decision, invoke `loop-and-gate`. It runs **Gate ∞** first to
decide how much process the change earns, then walks you through only the gates
that change actually needs.

## The one rule

The kit doesn't decide for you. It surfaces the call, applies the heuristics, puts
the agent to work making the decision defensible — then stops. Use it to *work*
each gate and you level up on the lens you're missing. Use it to *skip* the gate
and you just fail faster, with nicer tooling.

## Two things this sits next to

- **The Foundation kit** (second-brain-agent) is the ground this stands on:
  cross-session memory, capture, and your voice/taste profiles. If it's present,
  the operating skill reads `vault/Profiles/` so gate framing matches how you
  write and judge. This kit works without it, but they're built to compose.
- **The field guide** is the narrative version of the gates, with a worked example
  carried through the whole build of one real product. This kit is the terse,
  runnable form of the same eleven gates.

## Status

Early. The gates reference and the operating skill are here (the asset). The
pipeline snapshot, the business-context template, and the compose-your-own guide
are next.
