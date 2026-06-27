# Manifesto

We are tired of our AI coding tools forgetting who we are.

We are tired of explaining the same preferences, the same project, the same decisions again and again.

We are tired of Claude Code and Codex working side by side yet acting like strangers, each re-asking what the other already knows.

People who code with AI assistants do not need another generic agent framework. They need their tools to remember them and to act as one team.

Not one chatbot.

Not one magic prompt.

Not one closed workspace that traps the context.

They need a small local layer that remembers preferences and decisions, carries them across sessions, and shares them across tools.

## We Believe Your Tools Should Remember You

Claude Code and Codex are both strong. The problem is not that they are weak. The problem is that they forget, and that they do not talk to each other.

Every new session starts cold. You restate your conventions, your constraints, the decisions you already made, the mistakes you already corrected. When you switch from one tool to the other, none of it carries over.

You become the memory. You copy context, repeat rules, re-explain the project, and rebuild state every time a session ends or a tool changes.

VurctOS makes that memory real, and shared.

## We Do Not Want Another Generic Agent Framework

Generic frameworks often start with abstractions before proving anything works.

VurctOS starts with a concrete problem:

How do we give Claude Code and Codex a shared, persistent memory plus lightweight coordination, without API keys, without a runtime, and without lock-in?

The first answer is deliberately simple:

- plain markdown files
- a Python standard-library CLI
- a shared memory bridge into both tools
- a human-gated consolidation loop
- a single kanban board as the source of truth

Heavier automation comes only after the simple version is proven.

## We Believe Memory Should Capture Decisions

Most memory systems remember facts.

That is not enough. What matters is how you work and how you decide.

You need memory that captures your preferences, your conventions, your constraints, the patterns you reject, and the corrections you make. A correction is the highest-value signal there is, and it should never evaporate when the session ends.

The question is not only "what did the user say?"

The better question is "how does this user decide, and how do we hold onto that?"

So VurctOS keeps three layers, all inspectable files: durable memory (USER.md and MEMORY.md), procedural memory (skills in the SKILL.md format), and session recall (per-day logs with a local full-text index). A human-gated reflect and reflect-apply loop consolidates the noise of a session into durable memory only with your approval.

## We Believe One Memory Should Serve Every Tool

A preference you set in one tool should hold in the other.

Claude Code reads shared memory through @-imports in CLAUDE.md. Codex has no @-import, so the same memory reaches it through a prose bridge in AGENTS.md. Either way, the files are the single source of truth, and both tools read from them.

Global memory (kept in ~/.vurctos and loaded into every session) carries your cross-project preferences everywhere, so you set them once.

## We Believe In Subscription-First AI

Many people already pay for Claude Code and Codex. VurctOS uses that reality instead of forcing every workflow through paid APIs.

Local tools run automatically. Any web tool stays human-in-the-loop: a copy handoff, never a script driving someone else's terms of service.

Your login, your files, your machine. No API keys required. API mode is an explicit opt-in, never a default.

## We Believe Tools Should Coordinate, And Review Each Other

Two tools acting as one team need a shared workspace and a division of labor.

Coordination lives in local files. A single board is the source of truth. Work is dispatched one card at a time to Claude or to Codex, and finished work lands in review, never straight to done. A rejection files the lesson back into memory so the same mistake is not repeated.

Claude acts as Orchestrator and as Executor. Codex acts as an independent reviewer and as an executor. No tool reviews only its own output.

## We Believe The Future Is A Personal AI Operating Layer

The next step after chatbots is a personal operating layer for AI work.

Such a layer does not have to own any model. It has to remember the context, coordinate the tools, and help you improve over time.

VurctOS starts with the memory and coordination problem for AI coding assistants because that pain is real, daily, and shared by anyone who codes with these tools.

Single-card dispatch ships today. A continuous dispatcher loop, an MCP surface, and a GUI are still future work.

The ambition is large.

The first version is practical.
