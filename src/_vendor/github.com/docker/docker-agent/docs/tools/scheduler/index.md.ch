%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Scheduler Tool"
description: "Schedule instructions to run at a time or on a recurring interval."
keywords: docker agent, ai agents, tools, toolsets, scheduler tool, cron
linkTitle: "Scheduler"
@y
title: "Scheduler Tool"
description: "Schedule instructions to run at a time or on a recurring interval."
keywords: docker agent, ai agents, tools, toolsets, scheduler tool, cron
linkTitle: "Scheduler"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/scheduler/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/scheduler/
@z

@x
_Schedule instructions to run at a time or on a recurring interval._
@y
_Schedule instructions to run at a time or on a recurring interval._
@z

@x
## Overview
@y
## Overview
@z

@x
The scheduler toolset lets an agent make something happen at a chosen time or on a repeating cadence during a session. You give it an instruction and a schedule; when the schedule is due, the instruction is delivered back to the agent, which then carries out the action with its normal tools (`shell`, `api`, `fetch`, and so on).
@y
The scheduler toolset lets an agent make something happen at a chosen time or on a repeating cadence during a session. You give it an instruction and a schedule; when the schedule is due, the instruction is delivered back to the agent, which then carries out the action with its normal tools (`shell`, `api`, `fetch`, and so on).
@z

@x
The scheduler does not run shell or API calls itself. When a schedule fires it injects the instruction into the agent loop via the runtime's recall mechanism — the same primitive [`background_jobs`](../background-jobs/index.md) uses to report completed work — and the agent decides how to act. This keeps every action under the agent's normal tools and permissions rather than adding a second, unattended
command runner.
@y
The scheduler does not run shell or API calls itself. When a schedule fires it injects the instruction into the agent loop via the runtime's recall mechanism — the same primitive [`background_jobs`](../background-jobs/index.md) uses to report completed work — and the agent decides how to act. This keeps every action under the agent's normal tools and permissions rather than adding a second, unattended
command runner.
@z

@x
> [!NOTE]
> Schedules only fire while the session is running (interactive TUI or a server mode) and are not persisted across restarts. Scheduling requires a host that supports recall; if it does not, `create_schedule` returns an error.
@y
> [!NOTE]
> Schedules only fire while the session is running (interactive TUI or a server mode) and are not persisted across restarts. Scheduling requires a host that supports recall; if it does not, `create_schedule` returns an error.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: scheduler
```
@y
```yaml
toolsets:
  - type: scheduler
```
@z

@x
No configuration options.
@y
No configuration options.
@z

@x
## Tools
@y
## Tools
@z

@x
| Tool | Description |
| --- | --- |
| `create_schedule` | Register an instruction to run at a time or interval. |
| `list_schedules` | List active schedules with their id, spec, and next fire time. |
| `cancel_schedule` | Remove a schedule by id. |
@y
| Tool | Description |
| --- | --- |
| `create_schedule` | Register an instruction to run at a time or interval. |
| `list_schedules` | List active schedules with their id, spec, and next fire time. |
| `cancel_schedule` | Remove a schedule by id. |
@z

@x
### `create_schedule`
@y
### `create_schedule`
@z

@x
| Parameter | Required | Description |
| --- | --- | --- |
| `prompt` | Yes | The instruction to deliver to the agent when the schedule fires. |
| `when` | Yes | When to fire (see [Schedule specs](#schedule-specs)). |
| `name` | No | Optional human-readable label. |
@y
| Parameter | Required | Description |
| --- | --- | --- |
| `prompt` | Yes | The instruction to deliver to the agent when the schedule fires. |
| `when` | Yes | When to fire (see [Schedule specs](#schedule-specs)). |
| `name` | No | Optional human-readable label. |
@z

@x
Returns the new schedule's id and its next fire time.
@y
Returns the new schedule's id and its next fire time.
@z

@x
### `cancel_schedule`
@y
### `cancel_schedule`
@z

@x
| Parameter | Required | Description |
| --- | --- | --- |
| `id` | Yes | The id of the schedule to cancel (from `create_schedule` or `list_schedules`). |
@y
| Parameter | Required | Description |
| --- | --- | --- |
| `id` | Yes | The id of the schedule to cancel (from `create_schedule` or `list_schedules`). |
@z

@x
## Schedule specs
@y
## Schedule specs
@z

@x
The `when` argument accepts:
@y
The `when` argument accepts:
@z

@x
| Form | Meaning | Example |
| --- | --- | --- |
| `in:<duration>` | One-shot, after a delay | `in:10m` |
| `at:<RFC3339>` | One-shot, at an absolute future time | `at:2026-07-14T09:00:00Z` |
| `every:<duration>` | Recurring, at a fixed interval | `every:1h` |
| `minutely` / `hourly` / `daily` / `weekly` | Recurring preset intervals | `hourly` |
@y
| Form | Meaning | Example |
| --- | --- | --- |
| `in:<duration>` | One-shot, after a delay | `in:10m` |
| `at:<RFC3339>` | One-shot, at an absolute future time | `at:2026-07-14T09:00:00Z` |
| `every:<duration>` | Recurring, at a fixed interval | `every:1h` |
| `minutely` / `hourly` / `daily` / `weekly` | Recurring preset intervals | `hourly` |
@z

@x
Durations use Go's duration syntax (`30s`, `15m`, `2h`). Preset and `every:` intervals are measured from the schedule's creation time (for example `hourly` fires every hour after it is created), not aligned to wall-clock slots.
@y
Durations use Go's duration syntax (`30s`, `15m`, `2h`). Preset and `every:` intervals are measured from the schedule's creation time (for example `hourly` fires every hour after it is created), not aligned to wall-clock slots.
@z

@x
> [!IMPORTANT]
> **Recurring schedules have a one-minute minimum.** Every fire injects a message into the agent loop and typically costs an LLM turn, so `every:` values below `1m` are rejected — a typo such as `every:1s` in place of `every:1h` would otherwise become a runaway token burn. One-shot schedules (`in:` / `at:`) are not restricted, since they fire once.
@y
> [!IMPORTANT]
> **Recurring schedules have a one-minute minimum.** Every fire injects a message into the agent loop and typically costs an LLM turn, so `every:` values below `1m` are rejected — a typo such as `every:1s` in place of `every:1h` would otherwise become a runaway token burn. One-shot schedules (`in:` / `at:`) are not restricted, since they fire once.
@z

@x
## Example
@y
## Example
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    description: A monitoring assistant
    instruction: |
      Every 15 minutes, run `git fetch` and tell me if origin/main moved.
    toolsets:
      - type: scheduler
      - type: shell
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    description: A monitoring assistant
    instruction: |
      Every 15 minutes, run `git fetch` and tell me if origin/main moved.
    toolsets:
      - type: scheduler
      - type: shell
```
@z

@x
The agent calls:
@y
The agent calls:
@z

@x
```text
create_schedule(prompt="Run git fetch and report if origin/main moved", when="every:15m")
```
@y
```text
create_schedule(prompt="Run git fetch and report if origin/main moved", when="every:15m")
```
@z

@x
Every 15 minutes it is reminded, runs the command with the `shell` tool, and reports back.
@y
Every 15 minutes it is reminded, runs the command with the `shell` tool, and reports back.
@z

@x
> [!TIP]
> **When to use**
>
> Use the scheduler for recurring monitoring, timed one-shots, and unattended housekeeping loops during a long-running session. For work that should run immediately and be awaited, use [`background_jobs`](../background-jobs/index.md) instead.
@y
> [!TIP]
> **When to use**
>
> Use the scheduler for recurring monitoring, timed one-shots, and unattended housekeeping loops during a long-running session. For work that should run immediately and be awaited, use [`background_jobs`](../background-jobs/index.md) instead.
@z
