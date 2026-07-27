# The Pipeline — a dated snapshot

**This is the disposable layer. Read the warning before the table.**

The gates are the asset. The tools that fill the space between them are a
commodity that reprices and renames every quarter. What follows is one working
composition, verified against a live setup on **2026-07-12** — a snapshot, not the
method. When these names change next quarter, the gates in `gates.md` don't. Never
sell or anchor on this table. It's the appendix.

## The composition

No single plugin covers idea-to-ship, so the workflow is composed from three
kinds of tool:

- **A core loop** — brainstorm, plan, build, test, review. The spine.
- **Gap-fillers** — the few things the spine lacks: a dedicated security pass, live
  browser testing, launch prep.
- **A custom layer** — what no general toolkit provides: the business-context step
  up front, and domain-specific build skills for your stack.

## The map (verified 2026-07-12)

Every public skill named here existed in the live install on that date. `superpowers`
(via `obra/superpowers-marketplace`) and `agent-skills` (`addyosmani/agent-skills`)
are both public and free.

| Gate | Step | Skill(s) filling the space | Public? |
|------|------|----------------------------|---------|
| 0–1 Should it exist / who + success | Business context | business-context brief (see `templates/`) | Template here |
| 2 Which direction | Brainstorm | `superpowers:brainstorming` | **Yes** |
| 3 Right plan + scope | Plan | `superpowers:writing-plans` | **Yes** |
| 4 Architecture sane | Build | `superpowers:using-git-worktrees`, `superpowers:subagent-driven-development` (or `executing-plans`); `worktrunk` for clean separate sessions | **Yes** |
| 5 Off the rails | Build | `superpowers:test-driven-development`, `superpowers:systematic-debugging`; `ponytail` for over-engineering review | **Yes** |
| 6 Does the test prove it | Validate | `superpowers:verification-before-completion`, `agent-skills:browser-testing-with-devtools` | **Yes** |
| 7 Is the cost right | Validate | — none. Model routing + reading the bill. Pure judgment. | n/a |
| 4–5 wide runs (repo sweeps, audits) | Build | Claude Code's own workflow orchestration — no install. See `reference/fan-out.md` | **Built in** |
| 8 Risk acceptable to ship | Validate | `superpowers:requesting-code-review` + `receiving-code-review`, `agent-skills:security-and-hardening` | **Yes** |
| 9 Ship now, to whom | Ship | `agent-skills:shipping-and-launch`, `superpowers:finishing-a-development-branch` | **Yes** |
| ∞ How much process | (meta) | — none. You decide how much loop to run. | n/a |
| domain (inside 4–5) | Build | your own domain skills (auth, database, typing, deps) | Swap in yours |

Two honest read-outs:

- **8 of the ~9 tool-backed gate-gaps are filled by two free public plugins.** The
  "install the workflow" promise is almost entirely satisfiable with public tools
  plus this kit's judgment layer.
- **Two gates (7 cost, ∞ process) have no tool at all**, and the business-context
  step is a template, not a plugin. That's not a hole — it's the proof that the
  gates are where *you* work, not where the tools do.

## Install the public layer

```bash
# core loop
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace

# gap-fillers (security pass, live browser testing, launch prep)
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
```

Optional augments, running alongside the core (not replacing a gate skill):

```bash
# clean, separate work sessions (augments Gate 4 worktrees)
/plugin marketplace add max-sixty/worktrunk
/plugin install worktrunk@worktrunk

# over-engineering review at Gate 5
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail

# accessibility / web quality — feeds the Grow side more than a build gate
/plugin marketplace add addyosmani/web-quality-skills
/plugin install web-quality-skills@addy-web-quality-skills
```

## Compose your own

You don't have to use these exact plugins. Slot equivalents for your stack —
the gates are what matter, the tools are interchangeable. If you're on Cursor,
Copilot, or a different plugin set, map each gate to whatever you already have:

- **Core loop** — any tool that does brainstorm → plan → build → test → review.
- **Gap-fillers** — whatever covers security, live browser testing, launch prep if
  your core doesn't.
- **Custom** — the business-context brief in `templates/` (no tool needed) plus your
  own domain skills.

`agent-skills` has grown to overlap much of the core loop, so it's also a
by-taste alternative at several gates — e.g. `agent-skills:planning-and-task-breakdown`
or `spec-driven-development` in place of `superpowers:writing-plans`,
`agent-skills:code-simplification` in place of `ponytail` at Gate 5,
`agent-skills:code-review-and-quality` in place of the superpowers review pair.
Pick to taste. Same gate, more than one public tool.
