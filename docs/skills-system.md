# Skills System

A VurctOS skill is a reusable workflow learned from repeated work.

Skills should begin as documents and templates. Later, they may become scripts, plugins, or (in the future) marketplace packages.

## What A Skill Should Capture

A useful skill should define:

- when to use it
- required inputs
- output format
- step-by-step process
- agent roles
- quality checks
- memory updates
- examples

The goal is to make repeated work easier without hiding the process.

## Skill Format

VurctOS skills follow the SKILL.md open standard (agentskills.io), so a skill is portable to and from the wider ecosystem and the future Vurctne Skills marketplace stays compatible by default.

A skill is a directory under `skills/`:

```text
skills/
  vibe-coding-setup/
    SKILL.md
    references/
    scripts/
    assets/
```

`SKILL.md` is YAML frontmatter plus a markdown body. Required frontmatter is `name` and `description` only:

```text
---
name: vibe-coding-setup
description: Prepare a clean local project context for a coding agent (task file, conventions, agent rules, review checklist). Use when starting work in a new or unfamiliar repo with Claude Code or Codex.
version: 0.1.0
author: vurctne
---
```

Rules from the standard: `name` is lowercase letters, numbers, and hyphens and must match the folder name. `description` must state both what the skill does and when to use it, since that is what makes the Orchestrator select it. Avoid angle brackets in frontmatter. The markdown body should cover the items above: when to use, inputs, steps, agent roles, outputs, quality checks, and memory updates.

## Early Skill Examples

### Vibe Coding Setup Skill

Creates a clean local project context for coding agents (Claude Code, Codex).

It may include:

- repo inspection
- task file
- architecture and convention notes
- agent rules
- review checklist

This is the one worked example carried through the current docs. It is deliberately small: it produces the files a coding agent needs to start well, nothing more.

## Skill Lifecycle

1. A workflow is repeated manually.
2. The user or agent notices a pattern (reflect proposals collect these as skill candidates).
3. The pattern is documented as a skill draft: `vurctos skill-new <name>` scaffolds the compliant skeleton, the Orchestrator fills it, a human reviews it.
4. The skill is tested on another project.
5. The skill gains quality checks.
6. Only then should automation be added.

## Skill Storage

Repository-level skills live in the top-level `skills/` directory, each as its own SKILL.md directory. Project-specific skill notes can also live inside a project folder under `skills/` when the skill is still experimental.

## Quality Rule

Do not call something a skill just because it is a prompt.

A real skill includes process, inputs, outputs, quality checks, and memory behavior.
