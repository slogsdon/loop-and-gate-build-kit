# The Gates

The eleven points where an agentic build loop has to stop and wait for a human.
The pipeline runs the stretches between them; the gates are where you decide.
This is the operating reference — the terse, runnable form. The narrative
version with worked examples lives in the field guide.

Each gate names its **lens** — Business (product judgment), Engineering
(developer judgment), or Both — so you know when you're on home ground and when
to slow down and lean on the structure. You do not need both lenses to use this.
Each gate tells you how to work it even when its lens isn't yours yet.

**Run Gate ∞ first, every time.** It decides how many of the other ten this
change actually earns.

---

## Gate ∞ — How much process does this change deserve?

_Lens: Both, and above the others. The master gate._

- **Decide:** Right-size the process to the stakes. A typo fix doesn't get a spec
  and a security pass; a billing change or a data migration gets all of it.
- **Good judgment:** Read the blast radius first and let it set the process. Two
  gates for a copy tweak, all ten for anything touching money or data. Never
  confuse "I did all the steps" with "I did the right steps."
- **Not your lens:** This is the one gate you can't hand to the agent — it's the
  decision about how much to trust the agent. Heuristic: touches money, customer
  data, auth, or anything you can't cleanly undo → run the full set. Cosmetic and
  reversible → run the minimum. Unsure → treat it as higher-stakes than it looks.
- **Failure modes:** Full ceremony on everything until you abandon the process.
  Minimum process on everything until something irreversible breaks. Deciding by
  mood instead of by stakes.

---

## Gate 0 — Should this exist?

_Lens: Business._

- **Decide:** Does this move the product toward the outcome you care about, and is
  it worth your scarcest resource — your attention this month? "Would be nice" is
  not a yes.
- **Good judgment:** Weigh it against what you're *not* building instead. Ask
  whether the requester is a pattern or a sample of one. Be willing to kill your
  own idea. Strongest signal a problem is real: people already pay to avoid it.
- **Not your lens:** Make the cost visible instead of trusting your gut. Write one
  sentence on who it's for and one on what changes for them. Can't fill either →
  that's your answer. Ask the agent to steelman the case *against* building it.
- **Failure modes:** Building because it's easy now. Treating one loud customer as
  the market. Never killing anything, so the roadmap is just an inbox.

---

## Gate 1 — Who is it for, and what's a win?

_Lens: Business._

- **Decide:** Name the specific user and the specific success signal. This is the
  context every downstream gate inherits — the highest-leverage sentence you'll
  write all project.
- **Good judgment:** The user is a person, not a segment. The win is observable —
  a behavior that changes or a number that moves — not "customers will love it."
  Watch the gap between an activation metric (sign-ups) and an outcome metric.
- **Not your lens:** Use the business-context step as a form, not an essay:
  persona, the problem in their words, what "fixed" looks like, how you'd measure
  it. Never done this? Ask one real customer and write their words, not your
  paraphrase. The agent can clean up the note; it can't have the conversation.
- **Failure modes:** Success defined as "it ships." A persona so broad it fits
  everyone and helps no one. Skipping this because you "already know."

---

## Gate 2 — Which direction?

_Lens: Business._

- **Decide:** Pick the direction that fits where the product is going, not just the
  one that solves today's ticket. Taste and fit, not feasibility — that's a later
  gate.
- **Good judgment:** Reject a technically fine option that pulls the product
  off-strategy. Choose the smallest direction that addresses the real problem from
  Gate 1, not the most impressive one. If two are close, pick the cheaper to
  reverse.
- **Not your lens:** Ask the agent for three directions with tradeoffs stated in
  customer terms, not technical ones. Map each against the Gate 1 success signal
  and pick the closest fit.
- **Failure modes:** Choosing the shiny direction over the fitting one. Letting the
  agent's first suggestion become the decision by default. Solving a bigger
  problem than you have.

---

## Gate 3 — Right plan, right scope?

_Lens: Both. Product owns the scope, engineering owns the feasibility._

- **Decide:** Approve, adjust, or send back. Check two things: does the scope match
  Gate 1, and is the approach sound enough to build on.
- **Good judgment:** Catch the missing case before it's built — the backfill for
  existing rows, the empty state, the failure path, the thing that breaks at
  scale. Cut scope that crept in. Rather fix the plan than the code. Common gaps:
  undefined unit of action, unspecified data contracts, no backfill plan, absent
  outcome metrics, no failure/observability state.
- **Not your lens:** Product person → vet scope and edges, not the code approach.
  Ask "what happens to data that already exists," "what's the empty/error case,"
  "what did you decide not to handle." Developer without product sense → re-read
  against the Gate 1 win and cut anything that doesn't serve it. Make the agent
  list what it's *not* doing — that's where the gaps hide.
- **Failure modes:** Approving a coherent plan for the wrong problem. Scope quietly
  growing because each addition seems small. Reviewing code later instead of the
  plan now.

---

## Gate 4 — Is the architecture sane?

_Lens: Engineering._

- **Decide:** Is this shape one you can build on, or one you'll rip out? Trading
  present convenience against future cost, before it becomes load-bearing.
- **Good judgment:** Spot the abstraction that will fight the next feature. Resist
  cleverness that saves ten lines now and costs a day later. Let boring, obvious
  structure win.
- **Not your lens:** The riskiest gap — bad structure is invisible until it's
  expensive. Use the agent as a critic: ask it to name the tradeoffs of the chosen
  design, what it'd do differently at 10x data/users, what would be hard to change
  later. Then the one rule you can judge without expertise: if a small future
  change would touch many files, the shape is probably wrong.
- **Failure modes:** Accepting the first structure because it runs. Clever over
  boring. Discovering the design was wrong only when a feature becomes weirdly
  hard.

---

## Gate 5 — Off the rails?

_Lens: Engineering._

- **Decide:** Intervene or let it run. Is the loop converging or spinning, and does
  an on-the-fly choice the plan didn't specify need your input?
- **Good judgment:** Recognize thrash early — the same fix reattempted with
  cosmetic changes — and stop it before it burns the session. Catch the *silent
  decision* and pull it up to a real gate. Off the rails isn't only spinning;
  often it's the agent confidently building more than you asked (duplicated logic,
  dead scaffolding, an abstraction for a problem you don't have).
- **Not your lens:** You can spot a loop without deep skill: if the last three
  attempts are variations of the same thing, it's stuck — interrupt, make it
  explain what it's trying and change approach rather than retry. For silent
  decisions, periodically ask "what did you decide here that I didn't tell you
  to." An over-engineering review agent holds the DRY/YAGNI line for you.
- **Failure modes:** Letting a stuck loop run because it "might get there." Missing
  the buried decision until it's baked in. Intervening so early the agent never
  works.

---

## Gate 6 — Does the test prove it?

_Lens: Engineering. Where a non-developer running a loop gets burned the most._

- **Decide:** Is "done" backed by something still true next month? An actual
  assertion or just an observation? Deterministic? Does it test the behavior the
  customer cares about, or the one that was easy to assert?
- **Good judgment:** Ask for the test, not the transcript, and read the assertion
  against the Gate 1 acceptance criterion. For anything user-facing, insist on a
  deterministic browser test over the agent's one-off click-through — the agent
  testing its own work in-session proves the code ran once, not that it works.
  Spend rigor in proportion to blast radius.
- **Not your lens:** You don't have to write the test to judge it. Ask the agent:
  "if this breaks next month, what fails and turns red?" If the answer is "nothing
  automatic," it's a demo, not evidence. Make it show the assertion and name the
  input that would make the test fail — a test that can't fail isn't testing
  anything.
- **Failure modes:** Rubber-stamping the transcript. Confusing coverage with proof
  (five tests all asserting the happy path the agent also wrote). Accepting a
  flaky test until you learn to ignore it. Testing the convenient thing instead of
  the important one.

---

## Gate 7 — Is the cost right?

_Lens: Engineering._

- **Decide:** Match the spend to the current stage. Cheap work goes to cheap
  models; the expensive ones are saved for where they earn it. Right-size infra
  for the load you have, not the load you imagine.
- **Good judgment:** Route by need — a classification or a cleanup doesn't need a
  frontier model. Read the bill; know what your loop actually costs. Avoid both
  premature scaling and the lazy default of maximum-everything.
- **Not your lens:** You don't need to be an infra expert to ask "what does this
  cost per run, and is there a cheaper model that's good enough here?" Make the
  agent propose a cheaper tier and justify when the expensive one is required. Set
  a budget ceiling so a runaway loop stops instead of surprising you.
- **Failure modes:** Frontier model on every trivial call. Building for scale you
  don't have. Never looking at the bill until it's a problem.

---

## Gate 8 — Risk acceptable to ship?

_Lens: Both. Product weighs customer impact, engineering weighs blast radius._

- **Decide:** Ship, hold, or ship narrowly. Weigh what breaks if you're wrong
  against what you gain by shipping now. Passing gates is necessary, not
  sufficient.
- **Good judgment:** Size the blast radius — who's affected if this is broken, and
  how badly. Ship reversible things readily, irreversible things carefully. Know
  the difference between a bug you can fix Monday and one that corrupts data you
  can't get back.
- **Not your lens:** Product person → "what's the worst thing that happens to a
  customer if this is wrong, and can we undo it?" Developer without product feel →
  "who is actually affected and how much do they care?" Have the agent enumerate
  failure modes and which are reversible. Reversible-and-low-impact ships;
  irreversible-or-high-impact gets more proof first.
- **Failure modes:** Treating green tests as permission to stop thinking. Shipping
  an irreversible change with a reversible change's caution. Blocking forever on a
  low-stakes change.

---

## Gate 9 — Ship now, to whom?

_Lens: Business._

- **Decide:** When it goes live and who gets it first. Timing, communication,
  staged exposure.
- **Good judgment:** Ship the requested fix to the requester first and close the
  loop with them personally. Don't ship risky changes into a window you can't
  watch. Use a limited rollout when the downside is real.
- **Not your lens:** Mostly customer instinct; the cheap substitute is a rule —
  ship to the person who asked first, tell them, then widen. Have the agent draft
  the "here's the thing you asked for" note, then edit it into your voice and
  send. Timing rule: don't deploy something you can't babysit right before you
  step away.
- **Failure modes:** Big-bang shipping something that should have gone out
  narrowly. Never telling the customer who asked. Deploying into the weekend and
  hoping.

---

## Using this reference

At a decision point, run Gate ∞ to pick the gates this change earns, then work
each one: state the decision, apply the judgment heuristics, and if the lens
isn't yours, use the "not your lens" fallback to put the agent to work while you
learn to make the call yourself. The gates are the asset. The tools that fill the
space between them are a snapshot — see `reference/pipeline-snapshot.md`.
