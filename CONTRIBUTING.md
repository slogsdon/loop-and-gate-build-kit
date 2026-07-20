# Contributing to loop-and-gate-build-kit

Thanks for wanting to help. This kit is a judgment layer for building software
with an agentic loop — a gates reference (`reference/gates.md`), the
`loop-and-gate` operating skill, and a few templates. Contributions that keep it
terse and runnable are very welcome.

## Reporting bugs

Open a [bug report](.github/ISSUE_TEMPLATE/bug_report.md) issue. Include your
Claude Code version, install method (clone or plugin), OS, and the exact steps
plus any error output.

Never paste credentials, tokens, or private vault contents into an issue. For
anything security-sensitive, follow [SECURITY.md](.github/SECURITY.md) instead
of opening a public issue.

## Proposing gate or skill changes

The gates live in `reference/gates.md` and the operating skill in
`skills/loop-and-gate/`. Before proposing a change:

1. **Open a feature request first** for anything non-trivial, so the design can
   be discussed before you write it. Small fixes (a typo, a broken link, a
   clarified checklist item) can go straight to a PR.
2. **Match the existing style.** The gates are terse and runnable, one decision
   each. Keep additions in that form — no speculative structure.
3. **Keep changes surgical.** Touch only what the change needs.

### The gates are the asset

The whole point of this kit is that the loop *stops* at a fixed set of
human-decision points. **Pull requests that remove a gate, auto-approve one, or
otherwise let the agent skip the human will be declined.** That is not a bug in
the workflow — it is the workflow. Tightening a gate's wording, adding a missing
check, or clarifying when a gate is earned is exactly the kind of change we
want; deleting the human from the loop is not. If you think a gate genuinely
needs to change, open an issue and make the case first.

## Pull request conventions

- **Branch names:** `feature/<short-desc>`, `fix/<short-desc>`, or
  `chore/<short-desc>`.
- **Commits:** [Conventional Commits](https://www.conventionalcommits.org) —
  `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`. Small, atomic
  commits.
- **Scope:** one concern per PR. Keep the diff as small as the change allows.
- **Docs:** update the README or reference docs in the same PR as the change.

By contributing, you agree your contributions are licensed under the project's
[MIT License](LICENSE).
