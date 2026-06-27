# Vision

## The Big Idea

VurctOS is not a folder workflow tool.

It is a small local layer for people who code with AI assistants. Your AI coding tools forget you and do not talk to each other. VurctOS gives Claude Code and Codex a shared, persistent memory plus lightweight coordination, so they stop re-asking and start acting as one team.

The center is the Core Assistant, realized concretely by Claude acting as Orchestrator. It understands user intent, looks up memory, selects project context, delegates work, reviews outputs, and learns from the result. The local project folder is the first context and memory substrate, not the product center.

The first version uses local folders and markdown because they are the simplest reliable context and memory substrate. The goal is larger: an AI coding team that remembers project context, understands how you work, reuses proven workflows, and coordinates the AI coding subscriptions you already pay for, without making you copy-paste everything by hand and without API keys.

## Personal AI OS

A personal AI operating system is not a new model. It is the layer that coordinates the models and tools a person already uses.

For someone who codes with AI, that layer is the Core Assistant. It should know:

- the user's preferences and conventions
- the user's preferred structure for projects
- the user's decisions and the reasons behind them
- the user's standards for what "good" looks like
- the user's repeated decision patterns
- the current state of every active project

This memory lives in files first, not hidden inside a private cloud. The three-layer memory model draws design inspiration from the Hermes agent design (as a reference, not a runtime or a required component), but the user can always inspect and edit what the system learns.

## AI Coding Team

VurctOS treats AI coding tools like team members:

- Claude acts as the Orchestrator that coordinates the team, and as an Executor for code and file tasks.
- Codex acts as an independent reviewer and as an executor.

The user stays in charge. Claude as Orchestrator coordinates the work, remembers the brief, selects the relevant files, runs workflows, reviews outputs (it never reviews its own execution output; Codex does that), and captures lessons learned. See `CORE.md` for the canonical roles.

Both tools share the same memory. Claude Code reads it through `@`-imports in `CLAUDE.md`; Codex has no `@`-import, so the same memory is bridged into it through a prose `AGENTS.md`. Write a preference or a decision once, and both tools pick it up.

## Self-Learning Workflows

Most coding work repeats.

Someone may repeatedly:

- set up a new project the same way
- apply the same conventions and review checks
- run the same debugging or refactoring steps
- consolidate what a session learned into durable memory

The Core Assistant should make repeated work visible, then turn it into reusable workflows and skills. One non-video example that ships is a "vibe coding" workflow.

The goal is not to automate everything immediately. The goal is to capture what is repeatable, test it, and promote it into a skill only when it proves useful.

## Memory

Memory is more than remembering facts.

VurctOS should learn how the user makes decisions:

- what the user rejects
- what the user repeats
- which conventions and style rules matter
- which approaches work for which tools
- which mistakes happen often
- which workflow steps are worth automating

This memory should be readable, editable, and portable. Concretely it is three layers of plain files: durable memory (`USER.md` and `MEMORY.md`), procedural memory (skills in the SKILL.md format), and session recall (day logs plus a local SQLite full-text index). A human-gated reflect / reflect-apply loop consolidates session logs into durable memory only after you approve it, and `--global` memory (`~/.vurctos`) carries preferences across every project and every session.

## Skills

A skill is a reusable workflow learned from repeated work. It starts as documents and templates in the SKILL.md format and can later become executable modules, MCP tools, or shareable packages. The skill model and the example skills are defined in `docs/skills-system.md`, and `skill-new` scaffolds one.

## Coding-First Direction

The target user is anyone who uses Claude Code and/or Codex, in any field: software engineers, data people, researchers, founders, students, anyone who codes with these tools.

The product prioritizes the reality of that work:

- many sessions, and tools that forget between them
- two tools that do not share what they know
- messy real projects
- fast iteration
- decisions that need to hold across sessions
- conventions worth keeping consistent
- local files
- reusable project memory

VurctOS should help you finish work, not force you into a rigid enterprise workflow.

## Subscription-First Direction

People who code with AI already pay for their subscriptions. VurctOS respects that and prefers official login workflows over API keys. Local tools (scripts, CLIs, and similar) run automatically; any web tool stays human-in-the-loop through a copy handoff. The principle and the preferred login paths are defined in `docs/subscription-first.md`.

## Long-Term Potential

If the foundation works, VurctOS can grow into:

- a Core Assistant that knows the user's working style
- a skill system for repeatable coding workflows
- a memory layer that learns decision patterns
- an orchestration layer that connects AI coding tools through MCP
- a plugin layer for community workflows
- a GUI for less technical users
- a Vurctne Skills ecosystem for workflow packs
- the open-source personal AI operating layer for AI coding tools

Today, one part of the agent layer ships: a single-card `dispatch` (with `--agent claude` or `--agent codex`) that runs one ready card and moves it to review, never straight to done, plus `reject` to send reviewed work back with the lesson filed into memory. A continuous dispatcher loop, MCP, and a GUI are still future.

The path starts small: one Core Assistant, one local context substrate, shared memory across two tools, one useful workflow.
