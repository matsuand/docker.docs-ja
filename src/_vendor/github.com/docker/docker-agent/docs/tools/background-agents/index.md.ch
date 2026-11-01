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
| `wait_background_agents` | Wait for specified tasks to finish and collect their results    |
@y
| Tool                     | Description                                                     |
| ------------------------ | --------------------------------------------------------------- |
| `run_background_agent`   | Start a sub-agent task in the background; returns a task ID     |
| `list_background_agents` | List all background tasks with their status and runtime         |
| `view_background_agent`  | View live output or final result of a task by ID                |
| `stop_background_agent`  | Cancel a running task by ID                                     |
| `wait_background_agents` | Wait for specified tasks to finish and collect their results    |
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
### `wait_background_agents` parameters
@y
### `wait_background_agents` parameters
@z

@x
| Parameter  | Type     | Required | Description                                                              |
| ---------- | -------- | -------- | ------------------------------------------------------------------------ |
| `task_ids` | string[] | ✓        | 1–100 distinct task IDs returned by `run_background_agent`.               |
| `timeout`  | integer  | ✗        | Maximum seconds to wait for the whole group. Default `300`, maximum `3600`; `0` uses the default. |
@y
| Parameter  | Type     | Required | Description                                                              |
| ---------- | -------- | -------- | ------------------------------------------------------------------------ |
| `task_ids` | string[] | ✓        | 1–100 distinct task IDs returned by `run_background_agent`.               |
| `timeout`  | integer  | ✗        | Maximum seconds to wait for the whole group. Default `300`, maximum `3600`; `0` uses the default. |
@z

@x
Start all independent tasks first, then call `wait_background_agents` with their IDs:
@y
Start all independent tasks first, then call `wait_background_agents` with their IDs:
@z

@x
```json
{"task_ids": ["agent_task_a", "agent_task_b"], "timeout": 300}
```
@y
```json
{"task_ids": ["agent_task_a", "agent_task_b"], "timeout": 300}
```
@z

@x
The tool waits for **all specified tasks**, including failed or stopped tasks, without polling. It returns JSON with:
@y
The tool waits for **all specified tasks**, including failed or stopped tasks, without polling. It returns JSON with:
@z

@x
- `all_done`: every requested task's execution has exited. This does **not** mean every task succeeded: check each task's `status` before continuing dependent work.
- `timed_out`: present and `true` when the shared timeout expires.
- `tasks`: results in the same order as `task_ids`, each containing `task_id`, `status`, and `done`, plus `output` or `error` when available. Output/error text is capped at 4 KiB per task; `truncated: true` means to use `view_background_agent` for the full result.
@y
- `all_done`: every requested task's execution has exited. This does **not** mean every task succeeded: check each task's `status` before continuing dependent work.
- `timed_out`: present and `true` when the shared timeout expires.
- `tasks`: results in the same order as `task_ids`, each containing `task_id`, `status`, and `done`, plus `output` or `error` when available. Output/error text is capped at 4 KiB per task; `truncated: true` means to use `view_background_agent` for the full result.
@z

@x
A timeout returns available results and live output without stopping unfinished tasks. Call the tool again to continue waiting; already-finished tasks return their cached results immediately. Cancelling the wait also leaves the tasks running and returns a tool error with available task results. Runtime shutdown still stops background tasks as usual.
@y
A timeout returns available results and live output without stopping unfinished tasks. Call the tool again to continue waiting; already-finished tasks return their cached results immediately. Cancelling the wait also leaves the tasks running and returns a tool error with available task results. Runtime shutdown still stops background tasks as usual.
@z

@x
A stopped task can have `done: false` while its execution is still shutting down. The join waits for execution to exit, not just for the stop request to be acknowledged. Unknown or pruned IDs are reported individually as `status: "not_found"`, leave `all_done` false, and make the result a tool error; other requested tasks are still joined. Completed tasks may be pruned when the task-history limit is reached, so collect their results before dispatching many more tasks.
@y
A stopped task can have `done: false` while its execution is still shutting down. The join waits for execution to exit, not just for the stop request to be acknowledged. Unknown or pruned IDs are reported individually as `status: "not_found"`, leave `all_done` false, and make the result a tool error; other requested tasks are still joined. Completed tasks may be pruned when the task-history limit is reached, so collect their results before dispatching many more tasks.
@z

@x
This is a synchronization tool, not workspace isolation: concurrent coding agents still need separate workspaces to avoid conflicting edits.
@y
This is a synchronization tool, not workspace isolation: concurrent coding agents still need separate workspaces to avoid conflicting edits.
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
The TUI sidebar's Agents section shows **Background: N running** while background tasks are executing. The count also appears in the collapsed sidebar, counts separate tasks even when they use the same agent, and remains visible after the foreground agent finishes. Tasks leave the count once execution and cleanup finish, including failed or cancelled tasks. Hiding the Agents section hides the count.
@y
The TUI sidebar's Agents section shows **Background: N running** while background tasks are executing. The count also appears in the collapsed sidebar, counts separate tasks even when they use the same agent, and remains visible after the foreground agent finishes. Tasks leave the count once execution and cleanup finish, including failed or cancelled tasks. Hiding the Agents section hides the count.
@z

@x
For remote sessions, the count tracks task lifecycle events received while connected; tasks already running before the connection or events lost during recovery may not be reflected. Use `list_background_agents` for the authoritative task list.
@y
For remote sessions, the count tracks task lifecycle events received while connected; tasks already running before the connection or events lost during recovery may not be reflected. Use `list_background_agents` for the authoritative task list.
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
The orchestrator calls `run_background_agent` for each coding task, then uses `wait_background_agents` with all task IDs to join and collect results. It can inspect live progress separately with `list_background_agents` and `view_background_agent`.
@y
The orchestrator calls `run_background_agent` for each coding task, then uses `wait_background_agents` with all task IDs to join and collect results. It can inspect live progress separately with `list_background_agents` and `view_background_agent`.
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
