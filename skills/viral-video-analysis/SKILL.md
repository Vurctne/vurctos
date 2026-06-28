---
name: viral-video-analysis
description: Break a viral short video into hook, shot structure, and style notes. Use when the user wants to reverse engineer a reference video into a structured prompt pack for AI video production.
version: 0.1.0
author: vurctne
---

# Viral Video Analysis

This skill captures the repeated pattern of turning one reference video into a reusable creative breakdown. It is the analysis core of the Viral Video Reverse Engineering Workflow.

## When To Use

Use when the user provides a reference video and wants to understand and reuse its creative pattern, not copy it.

## Inputs

- one source video in `input/`
- creator or brand context in `PROFILE.md`
- optional transcript, screenshots, or reference images

## Steps

1. Watch the video and note the hook in the first few seconds.
2. Write the overall analysis to `analysis/video-analysis.md`: hook, pacing, story structure, emotional beats, camera language, visual style, editing rhythm, and what makes it work.
3. Write a focused hook breakdown to `analysis/hook-analysis.md`: opening visual, pattern interrupt, the promise to the viewer, and why they keep watching.
4. Write a shot-by-shot breakdown to `analysis/shot-breakdown.md`.

## Agent Roles

- gemini: video analysis and long-context review
- claude as Orchestrator: select context, review the analysis against style memory

## Outputs

- `analysis/video-analysis.md`
- `analysis/hook-analysis.md`
- `analysis/shot-breakdown.md`

## Review Criteria

- the hook breakdown explains why the opening works, not just what happens
- the shot breakdown is detailed enough to drive image and video prompts
- the analysis respects the creator's style memory

## Memory Updates

- record visual rules and pacing preferences observed
- note any reusable hook pattern as a skill candidate
