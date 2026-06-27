# VurctOS

VurctOS is an assistant-first open-source personal AI operating system that turns existing AI subscriptions into a self-learning creative team.

It is for creators and builders who already use ChatGPT, Claude, Gemini, Codex, Runway, Kling, ComfyUI, Veo, Hailuo, CapCut, DaVinci Resolve, and other AI tools, but are tired of manually copying context between them.

## The Problem

Modern AI creators do not use one tool. They use many:

- ChatGPT for creative direction, prompt writing, and visual judgment
- Claude Code for execution, project automation, and vibe coding
- Codex for code review, implementation review, and consistency checking
- Gemini for video understanding, long-context analysis, and research
- Runway, Kling, Veo, Hailuo, and similar platforms for video generation
- ComfyUI for local image and video workflows
- DaVinci Resolve, Premiere, or CapCut for editing and publishing

These tools are powerful, but they do not share context, memory, project state, or workflow history. The creator becomes the operating system by copying prompts, re-explaining decisions, moving files, and remembering what worked.

VurctOS exists to remove that friction.

## What VurctOS Is

VurctOS is an assistant-first operating layer for AI creative work.

The product center is the **VurctOS Core Assistant**. It understands user intent, looks up memory, selects project context, delegates work to specialized AI tools, reviews results, updates memory, and turns repeated workflows into skills.

The local project folder remains important, but it is not the product center. It is the first local context and memory substrate: the place where inputs, outputs, prompts, analysis, decisions, and memory stay inspectable.

The first version is not a complex app. It is a clear Core Assistant model, local context structure, workflow format, memory model, and starter template for AI video production.

The first public demo is the **Viral Video Reverse Engineering Workflow**:

```text
viral video input
  -> frame extraction
  -> video analysis
  -> shot breakdown
  -> image prompts
  -> Kling / Runway prompts
  -> publishing captions
  -> final prompt pack
```

## What It Is Not

VurctOS is not:

- another generic agent framework
- a chatbot replacement
- a full desktop OS
- a GUI-first product
- a marketplace in version one
- an API-key-first automation framework
- a complete MCP orchestration system yet
- a tool that replaces ChatGPT, Claude, Gemini, Codex, Kling, Runway, or ComfyUI

The first version should stay small enough to understand, run, and improve.

## Core Principles

1. Prefer official subscription login workflows where possible.
2. Do not require API keys for the first version unless absolutely necessary.
3. Make the Core Assistant the product center.
4. Use local files and project context as the first context and memory substrate.
5. Add MCP orchestration later, after the assistant-first local foundation works.
6. Learn from repeated work and turn workflows into reusable skills.
7. Remember user preferences, style, project rules, and decision patterns.
8. Keep the system modular, open-source friendly, and easy to extend.
9. Start with AI video production workflows.
10. Do not overbuild the first public demo.

## Founder Brand Context

VurctOS sits underneath the Vurctne ecosystem:

- **Vurctne**: parent developer and creator brand
- **VurctOS**: open-source personal AI operating system, short for Vurctne Operating System
- **VI Studio**: AI video creation and advertising workflow layer, full name Vurctne Imagination
- **Vurctne Skills**: future workflow and skill marketplace

The open-source foundation should be useful on its own, while also supporting future Vurctne creative products.

## Current Project Status

This repository is in foundation mode.

Created now:

- Core Assistant model
- project vision and manifesto
- architecture outline
- phased roadmap
- tight MVP definition
- agent instructions
- contribution guide
- documentation pages
- flagship workflows
- local project template
- script and example placeholders

Not created yet:

- production CLI
- dependency setup
- GUI
- MCP server
- marketplace
- browser automation
- cloud sync

## Repository Structure

```text
VurctOS/
  README.md
  CORE.md
  VISION.md
  MANIFESTO.md
  ARCHITECTURE.md
  ROADMAP.md
  MVP.md
  AGENTS.md
  CONTRIBUTING.md
  LICENSE
  docs/
  workflows/
  templates/project-template/
  scripts/
  examples/
```

## Planned Roadmap

- Phase 0: foundation documentation and repository structure
- Phase 1: local project workflow
- Phase 2: viral video reverse engineering workflow
- Phase 3: memory and skill capture
- Phase 4: agent orchestration
- Phase 5: MCP integration
- Phase 6: creator workflow packs
- Phase 7: community and open-source ecosystem
- Phase 8: marketplace and commercial layers

See `ROADMAP.md` for detail.

## Early-Stage Disclaimer

VurctOS is an early-stage open-source project. The architecture, license, workflow format, and implementation details may change as the first real creator workflow is tested.

The foundation is intentionally practical: assistant-first coordination, local files as context substrate, subscription-first execution, memory that humans can inspect, and automation only where it proves useful.
