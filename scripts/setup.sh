#!/usr/bin/env bash
# One-time setup for the Loop & Gate Build Kit.
# Installs the loop-and-gate skill, then tells you the two plugin commands to
# paste into Claude Code. Safe to re-run.
set -euo pipefail

cd "$(dirname "$0")/.."
repo="$(pwd)"

echo "== Loop & Gate Build Kit — setup =="
echo ""

# 0. pi instead of Claude Code? pi installs the kit and its pipeline as packages,
#    so there's nothing to symlink — just hand off the commands.
if ! command -v claude >/dev/null 2>&1 && command -v pi >/dev/null 2>&1; then
  echo "ok: pi found ($(pi --version 2>/dev/null | head -1))"
  cat <<EOF

In your terminal, install the kit and the build pipeline:

  pi install $repo
  pi install git:github.com/obra/superpowers
  pi install git:github.com/addyosmani/agent-skills

Then start pi and type:  /skill:loop-and-gate
EOF
  exit 0
fi

# 1. Claude Code present?
if ! command -v claude >/dev/null 2>&1; then
  echo "MISSING: Claude Code isn't installed yet."
  echo "  It's the tool this kit plugs into. Install it first:"
  echo "    npm install -g @anthropic-ai/claude-code"
  echo "  (Need npm? Install Node.js from https://nodejs.org, then run the line above.)"
  echo "  Then run this script again: ./scripts/setup.sh"
  exit 1
fi
echo "ok: Claude Code found ($(claude --version 2>/dev/null | head -1))"

# 2. Install the skill as a personal skill (available in every project).
skills_dir="$HOME/.claude/skills"
mkdir -p "$skills_dir"
dst="$skills_dir/loop-and-gate"
if [ -L "$dst" ] || [ -e "$dst" ]; then
  rm -rf "$dst"
fi
ln -s "$repo/skills/loop-and-gate" "$dst"
echo "ok: installed the loop-and-gate skill -> $dst"

# 3. Hand off the plugin commands (slash commands can't be run from a script).
cat <<'EOF'

Almost there. Two more steps, both inside Claude Code.

STEP A — install the build pipeline (the tools the gates sit on top of).
Open Claude Code (type `claude` in your terminal), then paste these lines
one at a time:

  /plugin marketplace add obra/superpowers-marketplace
  /plugin install superpowers@superpowers-marketplace
  /plugin marketplace add addyosmani/agent-skills
  /plugin install agent-skills@addy-agent-skills

STEP B — start your first build. Still in Claude Code, type:

  /loop-and-gate

Tell it what you want to build. It will stop and ask you at each point where
a human has to decide — that's the whole idea.

Full walkthrough with nothing assumed: see GETTING-STARTED.md

Want the AI to remember your project between sessions and sound like you?
Install the companion Foundation kit (loop-and-gate-foundation) underneath this one:
  https://github.com/slogsdon/loop-and-gate-foundation
EOF
