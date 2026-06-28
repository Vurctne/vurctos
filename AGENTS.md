# AGENTS.md

This repository is the foundation for VurctOS, an open-source personal AI operating system for AI creators.

## Project Purpose

VurctOS turns existing AI subscriptions into a self-learning creative team.

The first public direction is AI video production, starting with the Viral Video Reverse Engineering Workflow.

## Current Phase

The project is in foundation mode.

Do not build the full system yet. Prefer clear markdown, simple project templates, workflow definitions, and small scripts only when a repeated manual step is obvious.

## Required Reading

Before making substantive changes, read:

- `README.md`
- `CORE.md`
- `ORCHESTRATION.md`
- `VISION.md`
- `MANIFESTO.md`
- `ARCHITECTURE.md`
- `MVP.md`
- `ROADMAP.md`
- `docs/subscription-first.md`
- `docs/memory-system.md`
- `docs/skills-system.md`

## Brand Rules

- Vurctne is the parent developer and creator brand.
- VurctOS is the open-source personal AI operating system.
- VI Studio is the AI video creation and advertising workflow layer.
- VI means Vurctne Imagination.
- Vurctne Skills is the future workflow and skill marketplace.

Use these names consistently.

## Writing Rules

- Avoid the English long em dash character.
- Use commas, colons, parentheses, short hyphens, or new lines instead.
- Keep documentation practical and ambitious.
- Explain what exists now versus what is future direction.
- Do not pretend future systems are already implemented.

## Safety Rules

- Do not commit secrets, tokens, browser profiles, session files, private creator assets, or account credentials.
- Avoid APIs unless the user explicitly asks for API-based integration.
- Prefer official subscription login workflows where practical and permitted.
- Do not automate websites in ways that violate platform terms.
- Preserve local-first behavior.

## Repository Rules

- Do not delete source files or project documents unless the user explicitly asks.
- Do not overbuild.
- Prefer markdown and simple scripts first.
- Do not add package managers, frameworks, build systems, MCP servers, or GUI code without explicit approval.
- Preserve modular architecture.
- Always update docs when making structural changes.
- Keep project folders readable by humans and AI agents.

## Architecture Rules

- Local files are the first stable communication layer.
- Agents coordinate through the task board and handoff files, not direct messaging.
- Workflows should be markdown-first until automation is justified.
- Memory should be inspectable and editable.
- Skills should be reusable workflow patterns, not hidden magic.
- MCP comes later, after local workflows prove useful.
- Plugin and marketplace layers come after the open-source foundation is coherent.

## Agent Role Defaults

- Claude: Orchestrator (the Core Assistant), and as a worker the Executor for code and local automation.
- Codex: code review, implementation review, consistency checking.
- Gemini: video analysis and long-context research.
- ChatGPT: creative direction, prompt writing, visual judgment.
- Hermes: memory and learning, a file-based protocol now and stronger automation later.

The canonical role registry is in `CORE.md`; the coordination system is in `ORCHESTRATION.md`.

## Definition Of Done

A change is done when:

- affected documents are internally consistent
- no forbidden long em dash characters were introduced
- the repository still reflects a documentation-first foundation
- no full-system implementation has been introduced accidentally
- git status has been checked
