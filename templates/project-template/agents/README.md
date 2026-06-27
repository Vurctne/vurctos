# Agent Profiles

Each file here is an agent profile: a specialized identity the Orchestrator can assign board cards to. The idea is adapted from the open-source Hermes Agent project, where a profile can specify its own model, tools, and access.

A profile declares:

- tier: orchestrator or worker
- channel: how the Orchestrator reaches it (cli direct, copy handoff, or native for Claude)
- responsibilities: what kind of cards it should receive
- reviewed by: who checks its output
- handoff: where its result is written

The canonical role registry is in `CORE.md`. The coordination model is in `ORCHESTRATION.md`.
