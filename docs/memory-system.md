# Memory System

VurctOS memory is not only for remembering facts.

The deeper goal is learning how the user works and makes decisions.

## Three Memory Layers

VurctOS memory is organized in three layers, an idea adapted from the open-source Hermes Agent project and implemented as inspectable files:

1. Durable memory: stable facts, preferences, style, and decisions. Files: `PROFILE.md` and `MEMORY.md`, where project, workflow, style, and decision memory are sections.
2. Procedural memory: how to do things. This is the skills layer in the SKILL.md standard; see `docs/skills-system.md`.
3. Session recall: what happened before. Dated logs in `sessions/`, with a future option to add full-text search.

This keeps memory readable, editable, portable, and compatible with coding agents.

## PROFILE.md

`PROFILE.md` stores stable context.

Examples:

- creator identity
- brand identity
- target audience
- preferred tools
- style preferences
- recurring constraints
- publishing platforms

This file should change slowly.

## MEMORY.md

`MEMORY.md` stores project learning.

Examples:

- prompts that worked
- prompts that failed
- tool limitations
- visual rules
- editing preferences
- production decisions
- repeated patterns worth turning into skills

This file should change as work happens.

## Project Memory

Project memory captures facts and constraints for one project. In the project template this appears as the "Stable Project Facts" section of `MEMORY.md`:

- project goal
- target platform
- source material
- characters or products
- style direction
- naming rules
- output locations

## Workflow Memory

Workflow memory captures what happened during a repeatable process:

- steps used
- tools used
- manual corrections
- bottlenecks
- useful prompts
- failed assumptions
- automation candidates

## Style Memory

Style memory captures taste:

- preferred camera language
- lighting preferences
- pacing rules
- color and texture patterns
- acceptable and unacceptable visual traits
- editing rhythm

Style memory is important because creators judge outputs subjectively.

## Decision Memory

Decision memory captures why choices were made.

Examples:

- why a hook was selected
- why a shot was rejected
- why one prompt pattern worked better
- why a tool was chosen for a step
- what the creator consistently values

This is where VurctOS can become more useful over time. It should learn decision patterns, not only store notes.

## Session Recall

Session recall is the third memory layer. Each working session is logged as a dated markdown file in `sessions/`, capturing the request, the cards run, what was accepted or rejected, and what was learned. This is the learning summary made durable, and it is what the Orchestrator can search when a project comes back later.

In v1 this is plain markdown. A future version may add a full-text index for cross-session recall, following the Hermes Agent design.

## Memory Update Rule

At the end of a workflow, update memory with:

- what worked
- what failed
- what changed
- what should be reused
- what should become a skill

Do not hide memory. Keep it inspectable.
