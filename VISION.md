# Vision

## The Big Idea

VurctOS is not a folder workflow tool.

It is intended to become a personal AI operating system that learns how the user thinks, works, creates, decides, and improves.

The product center is the VurctOS Core Assistant. It understands user intent, looks up memory, selects project context, delegates work to specialized AI tools, reviews outputs, and learns from the result.

The first version still uses local folders and markdown because they are the simplest reliable context and memory substrate. The long-term goal is larger: an AI creative team that can remember project context, understand user style, reuse proven workflows, and coordinate existing AI subscriptions without making the user copy-paste everything manually.

## Personal AI OS

A personal AI operating system is not a new model. It is the layer that coordinates the models and tools a person already uses.

For creators, that layer is the Core Assistant. It should know:

- the user's creative taste
- the user's preferred structure for projects
- the user's prompt style
- the user's visual standards
- the user's editing and publishing habits
- the user's repeated decision patterns
- the current state of every active project

This memory should live in files first, not hidden inside a private cloud. Hermes can further strengthen this learning layer over time, but the user should still be able to inspect and edit what the system learns.

## AI Creative Team

VurctOS treats AI tools like team members:

- Claude can act as the Orchestrator that coordinates the team, and as Executor for code and local automation.
- ChatGPT can act as creative director, prompt writer, and visual judge.
- Codex can act as implementation reviewer, code reviewer, and consistency checker.
- Gemini can act as video analyst, long-context researcher, and source reviewer.
- Runway, Kling, Veo, Hailuo, and ComfyUI can act as image and video production systems.
- Hermes can act as the memory and learning role, a file-based protocol now and stronger automation later.

The user remains the director. Claude as Orchestrator coordinates the team, remembers the brief, selects the relevant files, runs workflows, reviews outputs, and captures lessons learned. See `CORE.md` for the canonical roles.

## Self-Learning Workflows

Most AI work repeats.

A creator may repeatedly:

- analyze viral videos
- extract frames
- identify shot structure
- build image prompts
- build video prompts
- compare generated outputs
- rewrite captions
- package final prompt packs

The Core Assistant should make repeated work visible, then turn it into reusable workflows and skills.

The goal is not to automate everything immediately. The goal is to capture what is repeatable, test it, and promote it into a skill only when it is useful.

## Memory

Memory is more than remembering facts.

VurctOS should learn how the user makes decisions:

- what the user rejects
- what the user repeats
- what style rules matter
- which prompts work for which tools
- which output defects happen often
- which workflow steps are worth automating

This memory should be readable, editable, and portable.

## Skills

A skill is a reusable workflow learned from repeated work. It should start as documents and templates and can later become executable modules, MCP tools, or marketplace packages. The skill model and the example skills are defined in `docs/skills-system.md`.

## Creator-First Direction

The first target user is an AI creator or creator-entrepreneur who produces videos, ads, cinematic prompts, social content, and lightweight software tools.

The product should prioritize the reality of creative work:

- messy inputs
- many tools
- many versions
- fast iteration
- subjective judgment
- style consistency
- deadlines
- local files
- reusable project memory

VurctOS should help creators finish work, not force them into a rigid enterprise workflow.

## Subscription-First Direction

Many creators already pay for AI subscriptions. The first version should respect that and prefer official login workflows over API keys. The principle and the preferred login paths are defined in `docs/subscription-first.md`.

## Long-Term Potential

If the foundation works, VurctOS can grow into:

- a Core Assistant that knows the creator's working style
- a skill system for repeatable AI workflows
- a memory layer that learns decision patterns
- an orchestration layer that connects AI tools through MCP
- a plugin layer for community workflows
- a GUI for non-technical creators
- a Vurctne Skills ecosystem for workflow packs
- the open-source AI operating system layer underneath VI Studio

The path starts small: one Core Assistant model, one local context substrate, one flagship workflow, one useful prompt pack.
