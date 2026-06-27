# Subscription-First Principle

VurctOS should prefer official subscription login workflows where possible.

The first users already pay for an AI coding assistant. The system should help them get more out of that subscription before forcing an API-first architecture.

## Why Subscription-First

Subscription-first workflows are practical because:

- users already pay for tools like Claude Code and OpenAI Codex
- these tools have first-class local CLI and editor experiences
- API costs can block early adoption
- not everyone wants to manage keys
- plain local files and the coordination CLI are enough for a useful first workflow

## Examples

Preferred early paths:

- Claude Code login for local project execution and orchestration
- Codex login for an independent review pass and a second executor

Both run on the user's existing subscription. No API keys are required to start.

## What VurctOS Should Do First

The first version should:

- keep the shared memory files (`USER.md`, `PROFILE.md`, `MEMORY.md`) current and readable by both assistants
- track work as board cards in `BOARD.md`
- keep a record of which agent ran a card
- write results to typed handoff files under `handoffs/`
- update memory after results are reviewed

This keeps both assistants working from the same context while staying simple.

## API Keys Later

API keys may be supported later for:

- batch processing
- server workflows
- repeatable automation
- integrations where official APIs are stable and affordable

API keys should not be required for the first MVP.

## Automation Boundaries

Subscription-first does not mean unsafe automation.

Rules:

- prefer official login flows
- respect platform terms
- do not store account sessions in project folders
- do not hide external actions from the user
- make handoff steps explicit

The shipped example of safe local automation is `vurctos dispatch`: it runs one `channel: local` board card headlessly through a subscription login (Claude Code, or Codex with `--agent codex`), with no API keys, and the result always goes to human review. Cards move to `review`, never straight to `done`. See `cli/README.md`.

The first product should be useful even when the user drives each assistant by hand and lets VurctOS hold the shared memory and the board between runs.
