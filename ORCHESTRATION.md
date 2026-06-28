# Orchestration

How the VurctOS Core Assistant coordinates a team of AI tools.

This document defines the master coordination system: Claude acting as Orchestrator, a file-based task board, agent profiles, the handoff contract, and how memory and skills align to open standards. It is the concrete realization of the Core Assistant model in `CORE.md`.

## Status: Now Versus Future

Now (v1, markdown-first, no API keys required):

- Claude (via Claude Code subscription login) acts as the Orchestrator.
- The task board, agent profiles, handoffs, memory, and skills are all plain files.
- Work is coordinated by Claude reading and writing those files, not by a background runtime.

Future (only after the local model proves useful):

- Scripts that claim board cards, assemble handoffs, and count skill repetitions.
- A real dispatcher loop, SQLite session store, and MCP tools.
- Optional integration with the Hermes Agent runtime for programmatic agents.

VurctOS borrows design ideas and open standards from the Hermes Agent project, but does not depend on its runtime. Subscription-first coordination and web-tool handoff are non-negotiable, and the Hermes runtime cannot drive subscription web tools, so the Orchestrator is always VurctOS itself.

## 1. Claude As Orchestrator

The Core Assistant is an abstract role. In VurctOS it is realized concretely by Claude acting as Orchestrator.

The Orchestrator owns the canonical loop in `CORE.md`. It does not do all the work itself. It decomposes the request, assigns work to agent profiles through the board, coordinates subscription-first handoff, reviews typed results, and updates memory and skills.

Claude wears two hats, same engine, different identity:

- Claude as Orchestrator: the Core Assistant. Plans, delegates, reviews, learns. Never reviews its own execution output.
- Claude as Executor: a worker profile for coding and local file work, assigned a board card like any other worker.

The Orchestrator should prefer to delegate. When Claude executes a card as Executor, an independent reviewer (Codex) checks the result, so the planner and the judge are never the same hat.

## 2. The Board: File-Based Coordination

VurctOS borrows the single-source-of-truth board idea from Hermes Agent and implements it as a markdown file, `BOARD.md`, in the project folder.

Principle, also from Hermes: agents do not talk to each other directly. All coordination flows through the board and through handoff files. This keeps the project understandable from files alone and avoids hidden state.

Each task is a card:

```text
- id: card-003
  title: Analyze the hook structure of the source video
  assignee: gemini
  channel: cli
  status: ready
  inputs:
    - input/source.mp4
    - PROFILE.md
  expected_outputs:
    - analysis/hook-analysis.md
  handoff: handoffs/card-003.md
  notes: Focus on the first three seconds.
```

Card status values: `backlog`, `ready`, `in-progress`, `review`, `done`, `blocked`.

The Orchestrator is responsible for creating cards during task decomposition, moving cards through statuses, and never marking a card `done` before result review (loop step 7).

## 3. Agent Profiles

Agent roles are defined as profiles, an idea borrowed from Hermes Agent, where each profile can specify its own model, tools, and access. In VurctOS a profile lives in `agents/<name>.md` and declares how the Orchestrator should delegate to it.

Profiles are organized in two tiers.

Orchestrator tier:

- `claude` (Orchestrator): runs the loop, owns the board, delegates, reviews, updates memory.

Worker tier:

- `codex`: code review, implementation review, consistency checking. Reviews Claude-as-Executor output.
- `gemini`: video analysis, long-context research, transcript review.
- `chatgpt`: creative direction, prompt writing, visual judgment, captions.
- `claude-exec` (Claude as Executor): file creation, local automation, small scripts.
- `kling`, `runway`, and similar: image and video generation.
- `hermes`: memory and learning. Today this is the memory protocol in section 5, run by the Orchestrator over files. Stronger automation is future work.

### Two Delegation Channels

Every worker is reached through one of two channels, both subscription-first:

- Channel A, CLI direct: the Orchestrator invokes a subscription-login CLI and reads the result back. Used for `gemini`, `codex`, and `claude-exec`. Higher automation, no API keys.
- Channel B, copy handoff: the Orchestrator produces a copy-ready prompt, an upload list, and an expected output location. A human pastes it into the web tool and saves the result back. Used for `chatgpt`, `kling`, `runway`, and other web-only tools.

A profile file declares: tier, channel, responsibilities, allowed skills, the handoff format it expects, and who reviews its output.

## 4. The Handoff Contract

Borrowing the typed result idea from Hermes Agent, workers do not return free-form chat. Each handoff is a structured file, `handoffs/<card-id>.md`, so results can be validated and routed without information loss.

```text
---
card: card-003
from: gemini
to: claude
status: done
inputs:
  - input/source.mp4
outputs:
  - analysis/hook-analysis.md
---

## Summary
One paragraph on what was produced.

## Result
The concrete output, or a pointer to the output files.

## Notes For Review
Anything the Orchestrator should check, plus known limitations.
```

The Orchestrator reads the handoff during result review (loop step 7), checks it against intent, project constraints, and style memory, then either accepts it (card to `done`) or reopens the card with feedback.

## 5. Memory Model: Three Layers

VurctOS aligns its memory to the Hermes Agent three-layer model, implemented as inspectable files. This reconciles the older mixed memory taxonomy into three clear layers.

1. Durable memory, stable facts and preferences:
   - `PROFILE.md`: stable user, brand, and style preferences.
   - `MEMORY.md`: durable project facts, decisions, and style or rejection rules. Decision memory and style memory are sections here, not separate files.

2. Procedural memory, how to do things:
   - `skills/`: reusable procedures in the SKILL.md format (section 6).

3. Session recall, what happened before:
   - `sessions/`: dated session logs in markdown now. A future version may add a SQLite full-text index for cross-session recall, following Hermes Agent.

The Orchestrator reads durable memory and relevant skills before acting (loop steps 2 and 3) and appends to durable memory and session logs after review (loop steps 8 and 9). Memory stays human-readable and editable. VurctOS never becomes a hidden memory black box.

## 6. Skills: The SKILL.md Open Standard

VurctOS skills follow the agentskills.io open standard, so a VurctOS skill is portable to and from the wider ecosystem, and the future Vurctne Skills marketplace stays compatible by default.

A skill is a directory under `skills/`:

```text
skills/
  viral-video-analysis/
    SKILL.md
    references/
    scripts/
    assets/
```

`SKILL.md` is YAML frontmatter plus a markdown body. Required frontmatter is `name` and `description` only:

```text
---
name: viral-video-analysis
description: Break a viral short video into hook, shot structure, and style notes. Use when the user wants to reverse engineer a reference video into a prompt pack.
version: 0.1.0
author: vurctne
---

## When To Use
...

## Inputs
...

## Steps
...

## Outputs
...

## Review Criteria
...

## Memory Updates
...
```

Rules from the standard: `name` is lowercase letters, numbers, and hyphens, and must match the folder name. `description` must state both what the skill does and when to use it, since that is what makes the Orchestrator select it. Avoid angle brackets in frontmatter. Promotion rule from `CORE.md` still applies: only a repeated, useful pattern becomes a skill.

## 7. How This Runs The Loop

The canonical loop lives in `CORE.md`. This is how each step maps to the orchestration primitives above:

- Intent detection: the Orchestrator reads the request and constraints.
- Memory lookup: read durable memory and relevant skills (section 5 and 6).
- Project context selection: select only the files the cards will need.
- Agent delegation: create board cards, assign profiles and channels (sections 2 and 3).
- Workflow execution: workers run through CLI direct or copy handoff (section 3).
- Result review: read handoffs, check against memory, accept or reopen (section 4).
- Learning summary: write what worked and failed into a session log.
- Memory update: append durable facts and decisions (section 5).
- Skill candidate update: count repetition, promote to a SKILL.md when justified (section 6).

## 8. Subscription-First And Safety

- Prefer subscription login over API keys. The first version requires no API keys.
- Do not commit secrets, tokens, browser sessions, or private creator assets.
- Do not automate web tools in ways that violate platform terms. Channel B keeps a human in the loop for web tools.
- Keep the board, handoffs, memory, and skills inspectable and editable.

## 9. Growth Path

```text
v1  markdown coordination
    BOARD.md, agents/, handoffs/, three-layer memory, SKILL.md skills
      -> v2  small scripts
             claim cards, assemble handoffs, count skill repetitions
        -> v3  dispatcher loop, SQLite session recall, MCP tools
          -> future  optional Hermes Agent runtime for programmatic agents
```

Each step is added only when the previous one proves useful. The file formats above are chosen to match Hermes Agent and the SKILL.md standard, so later integration stays low-cost.

## Borrowed From Hermes Agent

VurctOS adapts these ideas from the open-source Hermes Agent project by Nous Research: the board as a single source of truth, agents coordinating through the board rather than direct messaging, agent profiles with per-profile model and tool choices, typed result handoffs, the three-layer memory model, and skills as procedural memory. VurctOS implements them as subscription-first markdown files rather than as a runtime.
