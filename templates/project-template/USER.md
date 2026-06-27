# User Profile

This is durable memory: the stable facts about the user, the project, and the decision patterns that change slowly. Together with `MEMORY.md` it forms the durable layer of the three-layer memory model (see `docs/memory-system.md`).

Use this file to describe who the user is, how they like to work, the project context, the conventions, the constraints, and how the user tends to decide. This lets Claude (as Orchestrator) and Codex make better first drafts and stop re-asking things they were already told.

## User

- Name:
- Role:
- Coding assistants used: (Claude Code, Codex, or both)
- Working style: (how they like tasks approached: plan-first, surgical changes, terse or detailed, etc.)
- Communication preferences:

## Project

- Project name:
- What it is:
- Language and stack:
- Repository or working directory:
- Goal:
- Current stage:

## Conventions

- Code style: (formatting, naming, patterns to follow)
- Testing: (how tests are run, what coverage is expected)
- Commit and branch rules:
- Documentation expectations:
- Dependencies: (what may or may not be added)

## Constraints

- Must do:
- Must avoid:
- Tool or environment constraints:
- Security or privacy constraints:
- Output format:

## Success Criteria

- What good looks like:
- What should be delivered:
- How work will be judged:

## Decision Patterns

How this user tends to decide, so the Orchestrator can make better first drafts and reduce repeated explanation. Capture stable patterns, not one-off choices.

- Consistently values:
- Consistently rejects:
- Trade-offs usually made:
- Recurring reasons behind choices:
