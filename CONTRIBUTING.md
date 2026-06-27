# Contributing To VurctOS

VurctOS is early-stage. The most useful contributions right now are clear documents, practical workflows, reusable skill templates, examples, and small scripts that support the local-first MVP.

## Project Stage

The project is in foundation mode.

That means:

- the architecture is still being shaped
- the project is licensed under Apache License 2.0
- the MVP should remain narrow
- docs and workflow clarity matter more than code volume
- no one should add a large runtime without discussion

## How To Contribute

1. Read `README.md`, `VISION.md`, `ARCHITECTURE.md`, `MVP.md`, and `ROADMAP.md`.
2. Choose a small contribution.
3. Keep the change readable and local-first.
4. Update related docs when structure changes.
5. Avoid adding dependencies unless they are clearly justified.
6. Explain what problem your contribution solves.

## Good First Contributions

- improve a workflow document
- add an example coding workflow
- refine the project template
- add a memory example
- add a skill template
- document a subscription-first handoff pattern
- write a small script proposal in `scripts/README.md`
- improve terminology consistency

## What Not To Commit

VurctOS open-sources the system, not anyone's private instance. Never include in a contribution: secrets, API keys, tokens, or credentials; real personal data (names, private emails, employers); machine-specific paths (`/Users/...`, `C:\Users\...`, hostnames); or a real project's memory, sessions, or source material. Examples must be fake or fully sanitized. Full policy: `docs/privacy-model.md`.

## Documentation Standards

- Keep writing clear, practical, and specific.
- Avoid the English long em dash character.
- Separate what exists now from future plans.
- Prefer examples over abstract claims.
- Use markdown files that can be read without special tooling.

## Workflow Contribution Standards

A workflow contribution should include:

- purpose
- required inputs
- expected outputs
- folder locations
- agent roles
- manual steps
- future automation ideas
- memory updates

## Skill Contribution Standards

A skill contribution should explain:

- what repeated workflow it captures
- when to use it
- required inputs
- output format
- quality checks
- example usage
- memory entries it should create or update

## Code Style

The existing code is `cli/vurctos.py`: standard-library-only Python 3.8+, tested by `cli/test_vurctos.py` (stdlib unittest). No framework, package manager, or new runtime should be introduced without discussion.

Code added to the project should be:

- small
- readable
- testable
- local-first
- documented
- easy to remove if the workflow changes

Do not introduce a framework just to prepare for future complexity.

## License

By contributing, you agree that your contributions are licensed under the Apache License 2.0, the same license that covers the project. See `LICENSE`.
