# Handoffs

Each worker returns a structured handoff file, not free-form chat, so the Orchestrator can validate and route the result without information loss. One file per board card: `handoffs/<card-id>.md`.

## Handoff Template

```text
---
card: card-001
from: gemini
to: claude
status: done
inputs:
  - input/source.mp4
outputs:
  - analysis/hook-analysis.md
---

## Summary
One paragraph on what was produced.

## Result
The concrete output, or a pointer to the output files.

## Notes For Review
Anything the Orchestrator should check, plus known limitations.
```

The Orchestrator reads the handoff during result review, checks it against intent, project constraints, and style memory, then accepts the card or reopens it with feedback.
