# Core Assistant Model

VurctOS is assistant-first, not folder-first.

The local project folder remains important, but it is not the product center. It is the first local context and memory substrate.

The product center is the **VurctOS Core Assistant**: a personal AI operating system layer that understands user intent, recalls memory, selects project context, delegates work to specialized AI tools, reviews outputs, updates memory, and turns repeated workflows into reusable skills.

## What The Core Assistant Is

The Core Assistant is the central intelligence of VurctOS.

It is not just a chat interface and not just a workflow runner. It is the operating layer that sits between the user, local context, memory, workflows, skills, and external AI tools.

The Core Assistant should:

- understand what the user is trying to accomplish
- identify which project, memory, and workflow context matters
- decide which AI tool or agent role should handle each part of the work
- coordinate subscription-first tools through clean handoff
- review outputs before accepting them into the project record
- summarize what was learned
- update memory
- detect repeated patterns that should become skills
- become more personalized over time

## Main Loop

Canonical loop: `User request -> intent detection -> memory lookup -> project context selection -> agent delegation -> workflow execution -> result review -> learning summary -> memory update -> skill candidate update`.

```text
User request
  -> intent detection
  -> memory lookup
  -> project context selection
  -> agent delegation
  -> workflow execution
  -> result review
  -> learning summary
  -> memory update
  -> skill candidate update
```

This loop is the core operating model. Every workflow, project folder, memory file, agent handoff, and future MCP tool should support this loop.

## 1. Intent Detection

The Core Assistant first identifies what kind of request the user is making.

Examples:

- create a new video concept
- reverse engineer a viral video
- generate prompts for Kling or Runway
- review generated shots
- organize a project
- code a helper tool
- update memory
- extract a repeated workflow into a skill

Intent detection should also identify constraints:

- which project is active
- which tools are allowed
- whether the task needs creative judgment, code execution, video analysis, review, or memory work
- whether the user wants planning, execution, or critique
- whether subscription-first handoff is enough or automation is justified

## 2. Memory Lookup

The Core Assistant uses memory before acting.

Memory can include:

- user preferences
- brand rules
- style patterns
- project facts
- prior decisions
- prompt patterns that worked
- repeated failures
- tool-specific constraints
- previous skill candidates

The goal is not only to recall facts. The goal is to understand how the user thinks, decides, rejects, accepts, and improves work.

## 3. Project Context Selection

Project folders are the first local context and memory layer.

The Core Assistant selects only the context needed for the request:

- project profile
- task file
- source inputs
- analysis notes
- prompt files
- generated outputs
- memory entries
- workflow state

The folder stores context, evidence, outputs, and memory. The folder does not run the product. The Core Assistant runs the product.

## 4. Agent Delegation

The Core Assistant delegates work to specialized agent roles.

### Claude Code

Use Claude Code for:

- execution
- project automation
- local file operations
- simple scripts when justified
- implementation work
- converting repeated manual steps into practical tools

### Codex

Use Codex for:

- code review
- implementation review
- architecture consistency
- documentation consistency
- verification planning
- overbuild detection

### Gemini

Use Gemini for:

- video analysis
- long-context research
- transcript review
- reference comparison
- extracting structure from large source material

### ChatGPT

Use ChatGPT for:

- creative direction
- prompt writing
- concept development
- visual judgment
- caption writing
- audience and story framing

### Hermes Agent

Hermes Agent is the future learning layer.

Use Hermes later for:

- persistent memory refinement
- decision-pattern learning
- skill candidate scoring
- personalization feedback
- cross-project learning

Hermes is not required for the first implementation, but the Core Assistant should be designed so Hermes can eventually strengthen the learning loop.

## 5. Subscription-First Tool Coordination

The Core Assistant should prefer official subscription login workflows where practical.

Instead of forcing every task through APIs, it should coordinate tools through:

- copy-ready prompts
- clean file handoff
- explicit upload lists
- expected output locations
- review checklists
- memory updates after tool results are inspected

API keys and automation can come later. The first useful operating model should work with tools the user already subscribes to.

## 6. Workflow Execution

Workflows are not the center of VurctOS. They are reusable operating patterns run by the Core Assistant.

For example, the Viral Video Reverse Engineering Workflow is executed by the Core Assistant through steps such as:

- detect the user wants to reverse engineer a video
- select relevant project context and memory
- delegate video understanding to Gemini
- delegate prompt drafting to ChatGPT
- delegate local organization or packaging to Claude Code
- delegate review and consistency checking to Codex
- coordinate Kling, Runway, or similar tools through subscription-first handoff
- review outputs
- update memory and skill candidates

The workflow definition describes the pattern. The Core Assistant coordinates the work.

## 7. Result Review

The Core Assistant should not blindly accept outputs.

It should review results against:

- user intent
- project constraints
- style memory
- quality criteria
- tool-specific limitations
- continuity rules
- prior user feedback

Some review can be delegated:

- Codex reviews implementation and consistency.
- ChatGPT reviews creative direction and prompt quality.
- Gemini reviews source-video alignment.
- Future Hermes reviews memory and personalization impact.

## 8. Learning Summary

After meaningful work, the Core Assistant produces a learning summary.

The learning summary should capture:

- what the user asked for
- what context mattered
- which tools or agents were used
- what worked
- what failed
- what the user accepted or rejected
- what should be remembered
- what repeated pattern may become a skill

This summary is the bridge between execution and memory.

## 9. Memory Update

Memory updates should be deliberate and inspectable.

The Core Assistant should update memory with:

- stable preferences
- project decisions
- style rules
- prompt patterns
- workflow lessons
- tool constraints
- quality standards
- rejected directions

Memory should remain editable by the user. VurctOS should never become a hidden memory black box.

## 10. Skill Candidate Update

When a workflow repeats, the Core Assistant should identify it as a skill candidate.

A skill candidate should include:

- name
- trigger condition
- required inputs
- process steps
- expected outputs
- agent roles
- review criteria
- memory behavior
- examples

Only repeated, useful patterns should become skills. A single prompt is not a skill.

## Key Concepts

### Core Assistant

The central operating intelligence. It understands intent, coordinates agents and tools, runs workflows, reviews outputs, learns from outcomes, and personalizes over time.

### Agent Roles

Specialized AI tool roles delegated by the Core Assistant. Agent roles are workers, reviewers, analysts, and creative partners. They are not the operating center.

### Workflows

Repeatable process patterns. Workflows describe how work should happen, but the Core Assistant decides when and how to run them.

### Memory

The assistant's inspectable learning layer. Memory stores preferences, project state, style rules, decisions, workflow lessons, and skill candidates.

### Skills

Reusable workflows that have proven themselves through repetition. Skills are promoted from repeated work and should include process, inputs, outputs, review criteria, and memory behavior.

### Project Folders

The first local context and memory substrate. Project folders store files, evidence, inputs, outputs, prompts, and memory, but they are not the product center.

### Future MCP Layer

The future orchestration protocol layer. MCP can expose project context, memory, workflow tools, and adapter functions to the Core Assistant after the local model is stable.

### Future Hermes Layer

The future self-learning layer. Hermes should refine memory, detect decision patterns, recommend skills, and make the Core Assistant more personalized across projects.

## Personalization Over Time

VurctOS becomes more useful as it observes repeated work.

It should learn from:

- repeated user requests
- accepted outputs
- rejected outputs
- corrections
- style preferences
- project rules
- prompt revisions
- workflow bottlenecks
- tool-specific successes and failures

Personalization should be practical. The Core Assistant should not claim to know the user in a vague way. It should improve by using visible memory and proven workflow patterns to reduce repeated explanation, improve delegation, and make better first drafts.

## Core Principle

Folders store the work.

Workflows structure the work.

Skills reuse the work.

Memory learns from the work.

Agents perform parts of the work.

The Core Assistant coordinates the work.
