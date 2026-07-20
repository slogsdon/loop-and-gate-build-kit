# Security Policy

## Reporting a vulnerability

**Do not open a public issue for security problems.** Use GitHub's private
vulnerability reporting instead:

1. Go to the **Security** tab of this repository.
2. Click **Report a vulnerability** to open a private advisory.

If private reporting is unavailable, email shane@shanelogsdon.com with the
details. Expect an acknowledgement within a few days.

## Scope

This project is plain markdown skills, shell scripts, and hook configuration —
there is no server, database, or hosted service. The most relevant concerns are:

- **Never commit credentials or tokens.** No API keys, subscription tokens, or
  personal secrets belong in the vault, skills, config, or commit history. The
  memory files are meant to be readable and shareable; keep secrets out of them.
- **Shell scripts and hooks run on your machine.** Review `scripts/setup.sh`
  and any hook or `.claude/` config before running, the same as any script from
  the internet.
- **Skills instruct an agent.** A malicious skill edit could steer the agent.
  Review changes to `skills/` and `.claude/` in any pull request before merging.

If you find a secret already committed anywhere in the history, treat it as
compromised: rotate it immediately, then report so the history can be scrubbed.
