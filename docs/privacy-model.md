# Privacy Model and Data Boundary

VurctOS is open source. Your VurctOS instance data is private. These two things must stay separate.

The system is public. The data is private by default.

This document is the operational policy for that split: what is safe to commit, what must stay out of the public repository, and how to promote a private lesson into a public improvement without leaking anything. The durable memory layout it refers to (USER.md, MEMORY.md, skills/, sessions/) is defined in `docs/memory-system.md`.

## Public System Layer

The public VurctOS repository may contain:

- architecture and system documentation
- blank templates
- workflow definitions
- schema examples
- generic skills
- fake or fully sanitized examples
- tests with synthetic fixtures
- the CLI and other open-source system code

The public repository must not depend on private user data to make sense.

## Private Instance Layer

Private VurctOS instance data should live outside the public repository, in a local data location you control. A platform-neutral example:

```text
~/VurctOSData/
  personal-memory/      durable, cross-project USER-level memory
  projects/
    project-a/          a real project (USER.md, MEMORY.md, and its files)
    project-b/
```

Windows users can use any local drive (for example `D:\VurctOSData\`); the layout is illustrative, not required.

The public repository ships the system. It does not ship the user's instance.

```text
VurctOS public repo
  -> system, templates, schemas, docs, generic workflows, CLI

Private VurctOS instance
  -> personal memory, project knowledge, real sources, private outputs
```

## Data Classes

### Public System Data

Safe to commit when written generically:

- docs, blank templates, empty schemas
- workflow definitions, generic skill definitions
- fake examples, synthetic tests

### Private User Data

Never commit:

- personal memory
- a real project's `USER.md` (durable user preferences and style memory)
- a real project's `MEMORY.md`
- user corrections tied to real work
- private tool preferences that reveal sensitive strategy

### Private Source Data

Never commit source material from a real project:

- private code, data files, or documents
- PDFs, screenshots, product or customer documents
- source URLs with private context
- notes extracted from private sources

### Sensitive Runtime Data

Never commit:

- API keys, OAuth tokens, cookies
- browser profiles, session files
- local settings, account exports

## Personal Knowledge

Personal knowledge (long-term taste, repeated corrections, decision patterns, trusted references, private skill drafts) is durable user memory. It belongs in `USER.md` inside a private instance, not in the public repository. Public VurctOS may define the schema for it, but must not contain a real user's personal knowledge.

## Project Knowledge

Project knowledge lives inside a project folder so the project stays understandable from files alone: project facts and lessons in `MEMORY.md`, the current task and decisions in `task.md` and the board, typed results in `handoffs/`, and the project's own files alongside them. For real work, that project folder should live outside the public repository. Public VurctOS ships only the blank project template.

## Promotion Rule

Using VurctOS creates private lessons. Some are worth turning into open-source improvements. Only promote an improvement after removing private details.

Good public contribution:

- a generic workflow step
- a blank template field
- a review checklist
- a board or handoff schema
- a tool handoff convention
- a skill candidate format
- a fake example that demonstrates the pattern

Bad public contribution:

- a real client brief
- source files or data from a private project
- a notes or memory file with real private links
- a project memory file
- a personal preference log
- an agent log containing private context
- a generated asset tied to private source material

## Promotion Workflow

When a private project teaches VurctOS something useful:

1. Keep the original project data private.
2. Extract the reusable pattern.
3. Remove names, URLs, client facts, source quotes, and private decisions.
4. Rewrite the pattern as a generic template, checklist, workflow rule, or skill candidate.
5. Use fake examples if an example is needed.
6. Commit only the sanitized system improvement.

```text
use private VurctOS instance
  -> discover a reusable pattern
  -> sanitize the lesson
  -> update public docs, schemas, templates, or workflows
  -> keep the original data private
```

## Conflict Rule

If there is doubt about whether something is private, treat it as private. Do not commit it.

## Review Before Commit

Before committing, confirm:

- no real source files are staged
- no real `MEMORY.md` or `USER.md` from a live project is staged
- no real `analysis/source-register.md` is staged
- no secrets, tokens, or sessions are staged
- no private URLs, names, or client details are staged
- examples are fake or fully sanitized

If a file is useful but private, move it to the private instance layer.

## Git Boundary

The repository `.gitignore` excludes generated and machine-local noise: the session index (`**/sessions/index.db`), Obsidian config (`.obsidian/`), Python artifacts, and `.DS_Store`. It does not, and cannot, protect private data that lives outside the repository.

`.gitignore` is a guardrail, not a privacy guarantee. Before committing, review the staged files and confirm they contain only public system material.
