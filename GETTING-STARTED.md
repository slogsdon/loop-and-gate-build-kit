# Getting Started (no terminal)

This is the path for someone who has never opened a terminal and doesn't want to.
Everything here is download-and-click. About 15 minutes, most of it one-time.

Prefer the terminal? The [README](README.md) has the `git clone` path. Both end in
the same place.

## What you're about to set up

Three layers, bottom to top:

1. **Claude Code** — the AI that reads and writes files and builds your software.
   You install it as a normal **Desktop app**.
2. **This kit** — the *judgment layer*. It stops the build at the points where a
   human has to decide, and walks you through each. You add it as a **plugin**, no
   files to download or manage.
3. **The build pipeline** — a couple of free public plugins that teach the engine
   how to brainstorm, plan, build, test, and review.

There's also an optional **Foundation kit** underneath for memory and your
voice/taste — more at the end.

## What you need

- A **Mac or Windows** computer.
- A **paid Claude plan** — Pro or Max. **The free Claude plan does not include
  Claude Code**, so this won't work on free.

## Step 1 — get a Claude plan

At [claude.ai](https://claude.ai), make sure you're on **Pro** or **Max**. This is
the step people miss, and nothing works without it.

## Step 2 — install the Claude desktop app

A normal app you double-click to install, no terminal.

- **Mac:** download the `.dmg`, open it, drag Claude to Applications.
- **Windows:** download the `.exe` and run it. If it asks you to install **Git**
  first, say yes, then reopen the app.

Get the installers from Anthropic's download page
([code.claude.com/docs](https://code.claude.com/docs)). Open the app, sign in
(the browser opens for a second), and click the **Code** tab.

## Step 3 — add this kit (inside the app)

In the Code chat box, type this and press Enter:

```
/plugin marketplace add slogsdon/loop-and-gate-build-kit
```

A menu appears. Click **Install** on the *loop-and-gate-build-kit* plugin. That's
it — the skill and the gates are now available. No folder to download, nothing to
set up.

## Step 4 — add the build pipeline

The gates are a layer *on top of* a build loop, so you add the loop too. Same
place, paste these one at a time:

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
```

The first pair is the core loop (brainstorm → plan → build → test → review). The
second fills the gaps it leaves (a security check, live browser testing, launch
prep). Both are free and public.

## Step 5 — your first build

Open the folder you want to build in (**File → Open folder**), then type:

```
/loop-and-gate
```

Tell it what you want to build, in plain words. It will:

- **Size the change first** (Gate ∞) — a small tweak gets a light touch, anything
  touching money or user data gets the full treatment.
- **Walk you through the decisions that are yours** — is this worth building, who's
  it for and what's a win, is the plan right, does the test actually prove
  anything, is it safe to ship. It asks you these; there's no file to fill in.
- **Put the agent to work when a decision needs a skill you don't have yet** —
  laying out the options and showing you what would break, so you decide with your
  eyes open and learn by doing.

## Going further

- **The Foundation kit** —
  [second-brain-agent](https://github.com/slogsdon/second-brain-agent) — gives the
  AI a memory across sessions and learns your voice and taste. Once it's set up,
  `/loop-and-gate` uses it automatically. It has its own no-terminal guide.
- **`reference/gates.md`** (inside the plugin) — the full eleven-gate list in plain
  language, each with a "what to do if this isn't your strength."
- **Across your devices.** Kick off or steer a build from your phone or tablet, not
  just your desk. The Foundation's [Working across devices](https://github.com/slogsdon/second-brain-agent#working-across-devices)
  guide — Remote Control, Dispatch, and keeping notes in sync — applies here too.

## Prefer the terminal?

`git clone` the repo and use the `loop-and-gate` skill directly — see the
[README](README.md).
