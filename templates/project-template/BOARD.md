# Board

The task board is the single source of truth for coordination in this project. The Orchestrator (Claude) creates cards, assigns them to agent profiles, and moves them through statuses. Agents do not message each other directly. All coordination flows through this board and the files in `handoffs/`.

See `ORCHESTRATION.md` in the repository root for the full model.

## Card Format

```text
- id: card-001
  title: Short description of the unit of work
  assignee: gemini
  channel: handoff
  status: ready
  inputs:
    - input/source.mp4
    - PROFILE.md
  expected_outputs:
    - analysis/hook-analysis.md
  handoff: handoffs/card-001.md
  notes: Anything the worker should know.
```

- `assignee`: an agent profile in `agents/` (claude, claude-exec, codex, gemini, chatgpt, hermes, or a video tool).
- `channel`: `handoff` for copy handoff (the default for subscription tools, human in the loop), or `local` for assisted local execution (claude-exec, local ComfyUI). VurctOS does not headlessly automate subscription logins.
- `status`: `backlog`, `ready`, `in-progress`, `review`, `done`, or `blocked`.

A card is never marked `done` until the Orchestrator has reviewed the result.

## Cards

```text
- id: card-001
  title:
  assignee:
  channel:
  status: backlog
  inputs:
  expected_outputs:
  handoff:
  notes:
```
