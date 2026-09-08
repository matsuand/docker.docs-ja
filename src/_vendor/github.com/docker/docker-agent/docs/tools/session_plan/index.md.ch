%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Session Plan Tool"
description: "Per-session plan tracker for the draft, review, execute workflow."
keywords: docker agent, ai agents, tools, toolsets, session plan tool
linkTitle: "Session Plan"
@y
title: "Session Plan Tool"
description: "Per-session plan tracker for the draft, review, execute workflow."
keywords: docker agent, ai agents, tools, toolsets, session plan tool
linkTitle: "Session Plan"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/session_plan/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/session_plan/
@z

@x
_Per-session plan tracker for the "draft, review, execute" workflow._
@y
_Per-session plan tracker for the "draft, review, execute" workflow._
@z

@x
## Overview
@y
## Overview
@z

@x
The `session_plan` toolset gives one agent a place to write a plan for the current session, signal that the plan is ready, and let the host route the next turn to an executing agent.
@y
The `session_plan` toolset gives one agent a place to write a plan for the current session, signal that the plan is ready, and let the host route the next turn to an executing agent.
@z

@x
Different from the [`plan` toolset](../plan/index.md) — `plan` is for shared, named plans multiple agents collaborate on over many sessions. `session_plan` is for one ephemeral plan per session, scoped to that session by ID.
@y
Different from the [`plan` toolset](../plan/index.md) — `plan` is for shared, named plans multiple agents collaborate on over many sessions. `session_plan` is for one ephemeral plan per session, scoped to that session by ID.
@z

@x
Plans live as Markdown files under:
@y
Plans live as Markdown files under:
@z

@x
```text
~/.cagent/session_plans/<session-id>.md
```
@y
```text
~/.cagent/session_plans/<session-id>.md
```
@z

@x
The tool surface is three tools:
@y
The tool surface is three tools:
@z

@x
| Tool                 | Description                                                                                          |
| -------------------- | ---------------------------------------------------------------------------------------------------- |
| `write_session_plan` | Create or replace this session's plan as markdown. There's exactly one plan per session.             |
| `read_session_plan`  | Read the plan written for the current session and return it as markdown.                             |
| `exit_plan_mode`     | Signal that the plan is ready for review. Does not switch agents on its own.                         |
@y
| Tool                 | Description                                                                                          |
| -------------------- | ---------------------------------------------------------------------------------------------------- |
| `write_session_plan` | Create or replace this session's plan as markdown. There's exactly one plan per session.             |
| `read_session_plan`  | Read the plan written for the current session and return it as markdown.                             |
| `exit_plan_mode`     | Signal that the plan is ready for review. Does not switch agents on its own.                         |
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: session_plan
```
@y
```yaml
toolsets:
  - type: session_plan
```
@z

@x
No configuration options. The plan path is derived from the session ID; the agent does not name plans.
@y
No configuration options. The plan path is derived from the session ID; the agent does not name plans.
@z

@x
Restrict the toolset to a subset of tools the standard way:
@y
Restrict the toolset to a subset of tools the standard way:
@z

@x
```yaml
# An agent that consumes a plan but should not be able to (re)write or finalize one.
toolsets:
  - type: session_plan
    tools:
      - read_session_plan
```
@y
```yaml
# An agent that consumes a plan but should not be able to (re)write or finalize one.
toolsets:
  - type: session_plan
    tools:
      - read_session_plan
```
@z

@x
## When to call exit_plan_mode
@y
## When to call exit_plan_mode
@z

@x
Call `exit_plan_mode` once the plan is complete and you do not intend to change it on the next turn. It validates that a plan exists for the session and returns a "ready for review" tool result. It does **not** switch agents or solicit user approval on its own — the host application owns the next-turn routing (for example, by reading the tool result, by a UI affordance the user toggles, or by a `handoff` declared on the agent).
@y
Call `exit_plan_mode` once the plan is complete and you do not intend to change it on the next turn. It validates that a plan exists for the session and returns a "ready for review" tool result. It does **not** switch agents or solicit user approval on its own — the host application owns the next-turn routing (for example, by reading the tool result, by a UI affordance the user toggles, or by a `handoff` declared on the agent).
@z

@x
This separation keeps the tool reusable across UIs: a CLI that prints tool results inline, a chat UI with a plan-mode toggle, and a server that auto-routes the next turn through a `handoff` can all consume the same signal without one stepping on another.
@y
This separation keeps the tool reusable across UIs: a CLI that prints tool results inline, a chat UI with a plan-mode toggle, and a server that auto-routes the next turn through a `handoff` can all consume the same signal without one stepping on another.
@z

@x
## Storage and cleanup
@y
## Storage and cleanup
@z

@x
- Plans are markdown files written atomically (temp + rename), so concurrent readers — in this process or another — never observe a partial write.
- A best-effort sweep on first use of the toolset removes plan files older than 30 days under the plans directory. Stranded plans for long-gone sessions do not accumulate.
- The session ID identifies the file directly. There is no in-process mutex or revision counter, because two sessions cannot map to the same path.
@y
- Plans are markdown files written atomically (temp + rename), so concurrent readers — in this process or another — never observe a partial write.
- A best-effort sweep on first use of the toolset removes plan files older than 30 days under the plans directory. Stranded plans for long-gone sessions do not accumulate.
- The session ID identifies the file directly. There is no in-process mutex or revision counter, because two sessions cannot map to the same path.
@z

@x
## Events
@y
## Events
@z

@x
A `session_plan_updated` event is emitted whenever `write_session_plan` succeeds:
@y
A `session_plan_updated` event is emitted whenever `write_session_plan` succeeds:
@z

@x
```json
{
  "type": "session_plan_updated",
  "session_id": "...",
  "path": "/Users/.../.cagent/session_plans/<session-id>.md",
  "content": "# my plan\n...",
  "agent_name": "planner"
}
```
@y
```json
{
  "type": "session_plan_updated",
  "session_id": "...",
  "path": "/Users/.../.cagent/session_plans/<session-id>.md",
  "content": "# my plan\n...",
  "agent_name": "planner"
}
```
@z

@x
Embedders that render the plan inline can subscribe and update without re-reading the file.
@y
Embedders that render the plan inline can subscribe and update without re-reading the file.
@z

@x
## Managing session plans from the host
@y
## Managing session plans from the host
@z

@x
A session plan belongs to its session: hosts can read and export it, never change it.
@y
A session plan belongs to its session: hosts can read and export it, never change it.
@z

@x
- **CLI** — the [`docker agent plans`](../../features/cli/index.md#docker-agent-plans) command group lists, reads (`get --session <session-id>`), and exports session plans alongside shared plans. Mutations (`update`, `status`, `delete`) are refused with an `unsupported` error explaining the ownership rule.
- **TUI** — the `/plans` browser (see the [plan toolset docs](../plan/index.md#the-plans-browser-in-the-tui) for the full keybinding table) includes the **current session's** plan as the `session` scope row; plans of other sessions are never enumerated. Its identity is the session ID and its version column shows `-` — session plans have no versions. <kbd>Enter</kbd> opens the detail view (scope, session ID, update time, scrollable markdown) and <kbd>x</kbd> exports to `session-plan-<short-id>.md` in the working directory (refusing to overwrite an existing file). <kbd>e</kbd> opens the plan body in your external editor (`$VISUAL` or `$EDITOR`) for editing — the write is unguarded and last-write-wins by design. Status and delete visibly report that session plans don't support them (session plans belong to their session and carry no shared-plan metadata). The browser refreshes live on the `session_plan_updated` event, so a plan the agent just wrote appears without reopening.
@y
- **CLI** — the [`docker agent plans`](../../features/cli/index.md#docker-agent-plans) command group lists, reads (`get --session <session-id>`), and exports session plans alongside shared plans. Mutations (`update`, `status`, `delete`) are refused with an `unsupported` error explaining the ownership rule.
- **TUI** — the `/plans` browser (see the [plan toolset docs](../plan/index.md#the-plans-browser-in-the-tui) for the full keybinding table) includes the **current session's** plan as the `session` scope row; plans of other sessions are never enumerated. Its identity is the session ID and its version column shows `-` — session plans have no versions. <kbd>Enter</kbd> opens the detail view (scope, session ID, update time, scrollable markdown) and <kbd>x</kbd> exports to `session-plan-<short-id>.md` in the working directory (refusing to overwrite an existing file). <kbd>e</kbd> opens the plan body in your external editor (`$VISUAL` or `$EDITOR`) for editing — the write is unguarded and last-write-wins by design. Status and delete visibly report that session plans don't support them (session plans belong to their session and carry no shared-plan metadata). The browser refreshes live on the `session_plan_updated` event, so a plan the agent just wrote appears without reopening.
@z

@x
## Example
@y
## Example
@z

@x
A two-agent workflow: `root` executes, `planner` plans. `/plan` hands off to the planner; `exit_plan_mode` signals "ready", and the host decides what happens next.
@y
A two-agent workflow: `root` executes, `planner` plans. `/plan` hands off to the planner; `exit_plan_mode` signals "ready", and the host decides what happens next.
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Executes approved plans
    instruction: |
      You execute plans the planner has handed off. When you see a message
      that a plan has been approved, read it with read_session_plan and work
      through its steps in order.
    toolsets:
      - type: session_plan
        tools:
          - read_session_plan
      - type: filesystem
      - type: shell
    commands:
      plan:
        description: "Switch to the planner"
        agent: planner
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Executes approved plans
    instruction: |
      You execute plans the planner has handed off. When you see a message
      that a plan has been approved, read it with read_session_plan and work
      through its steps in order.
    toolsets:
      - type: session_plan
        tools:
          - read_session_plan
      - type: filesystem
      - type: shell
    commands:
      plan:
        description: "Switch to the planner"
        agent: planner
@z

@x
  planner:
    model: anthropic/claude-sonnet-4-5
    description: Investigates and writes plans for review
    instruction: |
      Investigate the user's request, then write the plan with
      write_session_plan. Iterate with the user until the plan is complete,
      then call exit_plan_mode to mark it ready for review.
    toolsets:
      - type: session_plan
      - type: filesystem
        readonly: true
      - type: user_prompt
```
@y
  planner:
    model: anthropic/claude-sonnet-4-5
    description: Investigates and writes plans for review
    instruction: |
      Investigate the user's request, then write the plan with
      write_session_plan. Iterate with the user until the plan is complete,
      then call exit_plan_mode to mark it ready for review.
    toolsets:
      - type: session_plan
      - type: filesystem
        readonly: true
      - type: user_prompt
```
@z

@x
See [`examples/session_plan.yaml`](https://github.com/docker/docker-agent/blob/main/examples/session_plan.yaml) for a complete working example.
@y
See [`examples/session_plan.yaml`](https://github.com/docker/docker-agent/blob/main/examples/session_plan.yaml) for a complete working example.
@z

@x
## Error Handling
@y
## Error Handling
@z

@x
- `read_session_plan` and `exit_plan_mode` return a "no plan written yet" error when called before `write_session_plan`.
- `write_session_plan` validates the session ID and refuses to write anything that could escape the plans directory; in practice the runtime generates UUIDs so this only triggers if an embedder supplies a hand-crafted ID.
@y
- `read_session_plan` and `exit_plan_mode` return a "no plan written yet" error when called before `write_session_plan`.
- `write_session_plan` validates the session ID and refuses to write anything that could escape the plans directory; in practice the runtime generates UUIDs so this only triggers if an embedder supplies a hand-crafted ID.
@z

@x
> [!TIP]
> **session_plan vs. plan vs. todo vs. tasks**
>
> Use **session_plan** when one agent drafts an approach for the user to review before another agent executes it (ephemeral, one per session). Use [plan](../plan/index.md) for shared, named plans multiple agents collaborate on over many sessions. Use [todo](../todo/index.md) for lightweight in-session task lists. Use [tasks](../tasks/index.md) for a structured, persistent task database with priorities and dependencies.
@y
> [!TIP]
> **session_plan vs. plan vs. todo vs. tasks**
>
> Use **session_plan** when one agent drafts an approach for the user to review before another agent executes it (ephemeral, one per session). Use [plan](../plan/index.md) for shared, named plans multiple agents collaborate on over many sessions. Use [todo](../todo/index.md) for lightweight in-session task lists. Use [tasks](../tasks/index.md) for a structured, persistent task database with priorities and dependencies.
@z
