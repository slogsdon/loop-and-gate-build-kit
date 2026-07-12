# Getting Started (from zero)

This guide assumes **nothing**. No coding background, never opened a terminal,
not sure what a plugin is. If that's you, you're exactly who this is for. About
20 minutes, most of it one-time setup you never do again.

If you already run Claude Code with a plugin or two, skip to
[the short version](#short-version-if-youre-already-set-up).

## What you're about to set up

Three layers, bottom to top:

1. **Claude Code** — the AI that actually reads and writes files and builds your
   software. This is the engine.
2. **The build pipeline** — a couple of free add-ons ("plugins") that teach the
   engine how to brainstorm, plan, build, test, and review.
3. **This kit** — the *judgment layer*. It stops the engine at the points where a
   human has to decide, and walks you through each one. It doesn't build for you;
   it makes sure you're steering.

You need all three. This guide gets you all three.

There's also an optional fourth layer underneath: the **Foundation kit**
([second-brain-agent](https://github.com/slogsdon/second-brain-agent)),
which gives the AI a memory that survives between sessions and learns your voice
and taste. It's the gentler on-ramp — it walks you through installing Claude Code
step by step — so **if any of this feels like a lot, start with the Foundation
kit first**, then come back here and add this one on top. The two are built to
compose.

## Step 0 — what you need

- A Mac or Linux computer. (On Windows, install "WSL" first — search "install
  WSL" — then follow along inside it.)
- A Claude subscription or API key (the same account you'd use for Claude).

## Step 1 — open a terminal

The terminal is a text window where you type commands instead of clicking. It
sounds scarier than it is.

- **Mac:** press `Cmd+Space`, type "Terminal", press Enter.
- **Linux:** open your "Terminal" app.

You'll paste a few lines into it. That's all.

## Step 2 — install Claude Code

Claude Code runs on something called Node.js. Install Node from
<https://nodejs.org> (download the "LTS" version, open it, click through).

Then, in the terminal, paste this and press Enter:

```bash
npm install -g @anthropic-ai/claude-code
```

When it finishes, check it worked:

```bash
claude --version
```

If you see a version number, you're good. If it says "command not found," close
the terminal, open a new one, and try `claude --version` again.

## Step 3 — get this kit

Still in the terminal, paste these two lines:

```bash
git clone https://github.com/slogsdon/loop-and-gate-build-kit.git
cd loop-and-gate-build-kit
```

(`git` usually comes with your system. If it says git isn't found, on Mac just
run `git` once and it'll offer to install the tools. On Linux, install the `git`
package.)

## Step 4 — run setup

```bash
./scripts/setup.sh
```

This installs the kit's skill and then prints the last two steps. Follow what it
prints — it tells you the exact plugin commands and how to start.

## Step 5 — install the build pipeline

The setup script tells you to open Claude Code and paste four lines. Here's what
they are and why:

Open Claude Code by typing `claude` in the terminal. Then paste these one at a
time (they're commands *inside* Claude, starting with `/`):

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
```

The first pair is the core loop (brainstorm → plan → build → test → review). The
second pair fills the gaps it leaves (a security check, live testing in a real
browser, launch prep). Both are free and public.

## Step 6 — describe your idea before you build

Before building, fill in the business-context brief. It's a fill-in form, not an
essay — open `templates/business-context.md`, copy it, and answer what you can. A
blank you can't fill is useful information, not a failure. This is the one part
that's purely you: who it's for and what would make it a win. Everything the AI
builds is built against your answers here.

## Step 7 — your first build

In Claude Code, type:

```
/loop-and-gate
```

Tell it what you want to build, in plain words. Point it at the brief you just
filled in. Then watch what happens:

- It **starts by asking how big a deal this change is** (Gate ∞) — a small tweak
  gets a light touch, anything involving money or user data gets the full
  treatment.
- It **stops at each decision that's yours to make** — is this worth building,
  who's it for, is the plan right, does the test actually prove anything, is it
  safe to ship — and hands the decision to you.
- When a decision needs a skill you don't have yet, it **puts the AI to work
  making the call clear** — laying out the options, arguing the other side,
  showing you what would break — so you can decide with your eyes open and learn
  the skill by using it.

That last part is the whole point. Use it to *work* each decision and you get
better every time. Use it to rubber-stamp and skip, and you'll just build the
wrong thing faster.

## Where to go when you're stuck

- `reference/gates.md` — the full list of the eleven decision points, in plain
  language, each with a "what to do if this isn't your strength."
- `reference/pipeline-snapshot.md` — the exact tools this uses today, and how to
  swap in your own.
- The **Foundation kit** —
  [second-brain-agent](https://github.com/slogsdon/second-brain-agent) — is
  the companion that gives the AI a memory across sessions and learns your voice
  and taste. If you want the AI to remember your project between sessions and
  sound like you, set that up too — it's built to sit underneath this one, and
  once it's installed, `/loop-and-gate` uses it automatically (it reads your
  voice/taste profiles and logs your gate decisions there).

---

## Short version (if you're already set up)

You have Claude Code. Then:

```bash
git clone https://github.com/slogsdon/loop-and-gate-build-kit.git
cd loop-and-gate-build-kit && ./scripts/setup.sh
```

Install the pipeline plugins (superpowers + agent-skills) as the script prints,
fill `templates/business-context.md`, and run `/loop-and-gate`.
