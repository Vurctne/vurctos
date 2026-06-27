# Security Policy

VurctOS is an early-stage, local-first project. There is no formal support SLA, but security reports are taken seriously.

## Reporting a vulnerability

Please report suspected vulnerabilities privately, before any public disclosure:

- Email: contact@vurctne.com
- Or use GitHub's private vulnerability reporting (the "Report a vulnerability" button under the repository's Security tab), if enabled.

Do not open a public issue for a security problem.

Helpful things to include: what the issue is, how to reproduce it, and the impact you see.

## Scope

The CLI (`cli/vurctos.py`) is local-first, standard-library only, uses no API keys, and makes no network calls. The most relevant areas for security review are: how it runs the local `claude` CLI (`vurctos dispatch`), how it reads and writes `BOARD.md` / memory files, and the project-template hooks.

Note the documented trust model: `vurctos dispatch` runs a board card's instructions with edits accepted, so only dispatch boards whose cards you authored or reviewed (see `cli/README.md`). Do not commit secrets or private data (see `docs/privacy-model.md`).
