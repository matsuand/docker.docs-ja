%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Background Agents Tool"
description: "Dispatch work to sub-agents concurrently and collect results asynchronously."
keywords: docker agent, ai agents, tools, toolsets, background agents tool
linkTitle: "Background Agents"
@y
title: "Background Agents Tool"
description: "Dispatch work to sub-agents concurrently and collect results asynchronously."
keywords: docker agent, ai agents, tools, toolsets, background agents tool
linkTitle: "Background Agents"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/background-agents/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/background-agents/
@z

@x
_Dispatch work to sub-agents concurrently and collect results asynchronously._
@y
_Dispatch work to sub-agents concurrently and collect results asynchronously._
@z

@x
## Overview
@y
## Overview
@z

@x
The background agents tool lets an orchestrator dispatch work to sub-agents concurrently and collect results asynchronously. Unlike [transfer_task](../transfer-task/index.md) (which blocks until the sub-agent finishes), background agent tasks run in parallel — the orchestrator can start several tasks, do other work, and check on them later.
@y
The background agents tool lets an orchestrator dispatch work to sub-agents concurrently and collect results asynchronously. Unlike [transfer_task](../transfer-task/index.md) (which blocks until the sub-agent finishes), background agent tasks run in parallel — the orchestrator can start several tasks, do other work, and check on them later.
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
| Tool                     | Description                                                     |
| ------------------------ | --------------------------------------------------------------- |
| `run_background_agent`   | Start a sub-agent task in the background; returns a task ID     |
| `list_background_agents` | List all background tasks with their status and runtime         |
| `view_background_agent`  | View live output or final result of a task by ID                |
| `stop_background_agent`  | Cancel a running task by ID                                     |
@y
| Tool                     | Description                                                     |
| ------------------------ | --------------------------------------------------------------- |
| `run_background_agent`   | Start a sub-agent task in the background; returns a task ID     |
| `list_background_agents` | List all background tasks with their status and runtime         |
| `view_background_agent`  | View live output or final result of a task by ID                |
| `stop_background_agent`  | Cancel a running task by ID                                     |
@z

@x
### `run_background_agent` parameters
@y
### `run_background_agent` parameters
@z

@x
| Parameter         | Type   | Required | Description                                                                 |
| ----------------- | ------ | -------- | --------------------------------------------------------------------------- |
| `agent`           | string | ✓        | Name of the sub-agent to run. Must be listed under the caller's `sub_agents`. |
| `task`            | string | ✓        | Clear, concise description of the task the sub-agent should achieve.        |
| `expected_output` | string | ✗        | Optional description of the result format the caller expects.               |
@y
| Parameter         | Type   | Required | Description                                                                 |
| ----------------- | ------ | -------- | --------------------------------------------------------------------------- |
| `agent`           | string | ✓        | Name of the sub-agent to run. Must be listed under the caller's `sub_agents`. |
| `task`            | string | ✓        | Clear, concise description of the task the sub-agent should achieve.        |
| `expected_output` | string | ✗        | Optional description of the result format the caller expects.               |
@z

@x
`run_background_agent` returns a **task ID** string. Tools run by the sub-agent inherit the parent session's permissions. Because background tasks run non-interactively, any tool call that would normally prompt the user for approval will be automatically denied. To allow background agents to run mutating tools, you must explicitly approve them in the parent session (e.g. via YOLO mode or explicit allow rules).
@y
`run_background_agent` returns a **task ID** string. Tools run by the sub-agent inherit the parent session's permissions. Because background tasks run non-interactively, any tool call that would normally prompt the user for approval will be automatically denied. To allow background agents to run mutating tools, you must explicitly approve them in the parent session (e.g. via YOLO mode or explicit allow rules).
@z

@x
Background delegation shares the same runtime guards as `transfer_task`: delegation cycles are rejected and chains are capped at 10 nested delegations. See [Delegation Limits](../transfer-task/index.md#delegation-limits).
@y
Background delegation shares the same runtime guards as `transfer_task`: delegation cycles are rejected and chains are capped at 10 nested delegations. See [Delegation Limits](../transfer-task/index.md#delegation-limits).
@z

@x
### `view_background_agent` and `stop_background_agent` parameters
@y
### `view_background_agent` and `stop_background_agent` parameters
@z

@x
| Parameter | Type   | Required | Description                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------- |
| `task_id` | string | ✓        | Task ID returned by `run_background_agent` or `list_background_agents`. |
@y
| Parameter | Type   | Required | Description                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------- |
| `task_id` | string | ✓        | Task ID returned by `run_background_agent` or `list_background_agents`. |
@z

@x
`list_background_agents` takes no parameters.
@y
`list_background_agents` takes no parameters.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: background_agents
```
@y
```yaml
toolsets:
  - type: background_agents
```
@z

@x
No configuration options. Requires the agent to have `sub_agents` configured so the background tasks have agents to dispatch to.
@y
No configuration options. Requires the agent to have `sub_agents` configured so the background tasks have agents to dispatch to.
@z

@x
## Example
@y
## Example
@z

@x
```yaml
agents:
  coordinator:
    model: openai/gpt-4o
    description: Orchestrates parallel research
    instruction: Fan out research tasks and synthesize results.
    sub_agents: [researcher]
    toolsets:
      - type: background_agents
      - type: think
@y
```yaml
agents:
  coordinator:
    model: openai/gpt-4o
    description: Orchestrates parallel research
    instruction: Fan out research tasks and synthesize results.
    sub_agents: [researcher]
    toolsets:
      - type: background_agents
      - type: think
@z

@x
  researcher:
    model: openai/gpt-4o
    description: Web researcher
    instruction: Research topics thoroughly.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
```
@y
  researcher:
    model: openai/gpt-4o
    description: Web researcher
    instruction: Research topics thoroughly.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
```
@z

@x
> [!TIP]
> **When to Use**
>
> Use `background_agents` when your orchestrator needs to fan out work to multiple specialists in parallel — for example, researching several topics simultaneously or running independent code analyses side by side.
@y
> [!TIP]
> **When to Use**
>
> Use `background_agents` when your orchestrator needs to fan out work to multiple specialists in parallel — for example, researching several topics simultaneously or running independent code analyses side by side.
@z

@x
In the TUI, each background task's token usage is accounted for live: the sidebar's Agents panel shows the sub-agent's context usage percentage on its roster row, the Agent Inspector shows its exact token counts, and the task's cost joins the session total.
@y
In the TUI, each background task's token usage is accounted for live: the sidebar's Agents panel shows the sub-agent's context usage percentage on its roster row, the Agent Inspector shows its exact token counts, and the task's cost joins the session total.
@z

@x
## Using Harness Sub-Agents
@y
## Using Harness Sub-Agents
@z

@x
Background agents work equally well with [harness-backed sub-agents](../../features/harnesses/index.md) — sub-agents driven by external coding CLIs such as Claude Code or Codex. This lets you dispatch multiple independent coding tasks in parallel:
@y
Background agents work equally well with [harness-backed sub-agents](../../features/harnesses/index.md) — sub-agents driven by external coding CLIs such as Claude Code or Codex. This lets you dispatch multiple independent coding tasks in parallel:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Orchestrator that fans out coding tasks
    instruction: |
      Dispatch the frontend and backend tasks in parallel,
      then collect results and produce a summary.
    sub_agents:
      - claude-coder
      - codex-coder
    toolsets:
      - type: background_agents
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Orchestrator that fans out coding tasks
    instruction: |
      Dispatch the frontend and backend tasks in parallel,
      then collect results and produce a summary.
    sub_agents:
      - claude-coder
      - codex-coder
    toolsets:
      - type: background_agents
@z

@x
  claude-coder:
    description: Frontend specialist (Claude Code)
    harness:
      type: claude-code
      effort: medium
@y
  claude-coder:
    description: Frontend specialist (Claude Code)
    harness:
      type: claude-code
      effort: medium
@z

@x
  codex-coder:
    description: Backend specialist (Codex)
    harness:
      type: codex
```
@y
  codex-coder:
    description: Backend specialist (Codex)
    harness:
      type: codex
```
@z

@x
The orchestrator calls `run_background_agent` for each coding task, then uses `list_background_agents` and `view_background_agent` to collect results when they finish.
@y
The orchestrator calls `run_background_agent` for each coding task, then uses `list_background_agents` and `view_background_agent` to collect results when they finish.
@z

@x
> [!NOTE]
> **Harness toolsets are ignored**
>
> Harness agents use the external CLI's own tools — any `toolsets:` configured on the harness agent are silently ignored. See [Coding Harnesses](../../features/harnesses/index.md) for details and caveats.
@y
> [!NOTE]
> **Harness toolsets are ignored**
>
> Harness agents use the external CLI's own tools — any `toolsets:` configured on the harness agent are silently ignored. See [Coding Harnesses](../../features/harnesses/index.md) for details and caveats.
@z

@x
See [`examples/coding_harness_background_agents.yaml`](https://github.com/docker/docker-agent/blob/main/examples/coding_harness_background_agents.yaml) for a complete configuration.
@y
See [`examples/coding_harness_background_agents.yaml`](https://github.com/docker/docker-agent/blob/main/examples/coding_harness_background_agents.yaml) for a complete configuration.
@z
