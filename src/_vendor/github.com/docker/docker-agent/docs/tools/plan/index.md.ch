%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Plan Tool"
description: "Shared persistent scratchpad for multi-agent collaboration."
keywords: docker agent, ai agents, tools, toolsets, plan tool
linkTitle: "Plan"
@y
title: "Plan Tool"
description: "Shared persistent scratchpad for multi-agent collaboration."
keywords: docker agent, ai agents, tools, toolsets, plan tool
linkTitle: "Plan"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/plan/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/plan/
@z

@x
_Shared persistent scratchpad for multi-agent collaboration._
@y
_Shared persistent scratchpad for multi-agent collaboration._
@z

@x
## Overview
@y
## Overview
@z

@x
The plan tool gives agents a shared, persistent scratchpad of named documents. Any agent in a multi-agent config that loads the `plan` toolset can read and write the same plans, and those plans survive across sessions. This makes it straightforward to wire a planner agent that sketches work and one or more executor agents that consume it without any custom tool wiring.
@y
The plan tool gives agents a shared, persistent scratchpad of named documents. Any agent in a multi-agent config that loads the `plan` toolset can read and write the same plans, and those plans survive across sessions. This makes it straightforward to wire a planner agent that sketches work and one or more executor agents that consume it without any custom tool wiring.
@z

@x
Plans are stored as JSON files in the Docker Agent data directory (`~/.cagent/plans/` by default). Agents that share a process serialize on a single mutex, and every write or delete additionally holds an advisory lock on a sentinel file in the plans directory, so writers in *separate* Docker Agent processes are serialized too: concurrent edits can never silently overwrite each other, and a stale revision always fails with a deterministic version conflict. Writes are atomic (temp file + rename), so a reader never observes partial content.
@y
Plans are stored as JSON files in the Docker Agent data directory (`~/.cagent/plans/` by default). Agents that share a process serialize on a single mutex, and every write or delete additionally holds an advisory lock on a sentinel file in the plans directory, so writers in *separate* Docker Agent processes are serialized too: concurrent edits can never silently overwrite each other, and a stale revision always fails with a deterministic version conflict. Writes are atomic (temp file + rename), so a reader never observes partial content.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: plan
```
@y
```yaml
toolsets:
  - type: plan
```
@z

@x
No additional options are required. All agents that include `type: plan` in their toolsets share the same plans.
@y
No additional options are required. All agents that include `type: plan` in their toolsets share the same plans.
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
| Tool                    | Description                                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------------------- |
| `write_plan`            | Create or update a shared plan by name. Replaces the entire plan content — read it first to preserve what you want to keep. Each write bumps the revision number. |
| `read_plan`             | Read a shared plan by name, including its title, content, author, status, revision number, and last-updated timestamp. |
| `list_plans`            | List all shared plans with their name, title, author, status, revision, and last-updated timestamp. |
| `delete_plan`           | Delete a shared plan by name.                                                                     |
| `update_plan_from_file` | Create or update a plan, taking the new content from a file on disk instead of inline. Use it with `export_plan_to_file` to edit a large plan without re-sending its whole body. |
| `export_plan_to_file`   | Write a plan's content to a file. The content goes to disk and is **not** returned as tool output, so materialising a plan costs no tokens. |
| `set_plan_status`       | Set a plan's free-form status without rewriting its body. The plan must already exist. |
| `get_plan_status`       | Read a plan's status and current revision without fetching its body.                  |
@y
| Tool                    | Description                                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------------------- |
| `write_plan`            | Create or update a shared plan by name. Replaces the entire plan content — read it first to preserve what you want to keep. Each write bumps the revision number. |
| `read_plan`             | Read a shared plan by name, including its title, content, author, status, revision number, and last-updated timestamp. |
| `list_plans`            | List all shared plans with their name, title, author, status, revision, and last-updated timestamp. |
| `delete_plan`           | Delete a shared plan by name.                                                                     |
| `update_plan_from_file` | Create or update a plan, taking the new content from a file on disk instead of inline. Use it with `export_plan_to_file` to edit a large plan without re-sending its whole body. |
| `export_plan_to_file`   | Write a plan's content to a file. The content goes to disk and is **not** returned as tool output, so materialising a plan costs no tokens. |
| `set_plan_status`       | Set a plan's free-form status without rewriting its body. The plan must already exist. |
| `get_plan_status`       | Read a plan's status and current revision without fetching its body.                  |
@z

@x
### Cheap edits with file-based revisions
@y
### Cheap edits with file-based revisions
@z

@x
Re-sending a whole plan on every revision is expensive. The file-based tools let
an agent edit a plan without paying input-token cost for its body:
@y
Re-sending a whole plan on every revision is expensive. The file-based tools let
an agent edit a plan without paying input-token cost for its body:
@z

@x
1. `export_plan_to_file` writes the current plan content to a path. The content
   is written to disk and is **not** returned.
2. The agent edits that file in place with its filesystem tools.
3. `update_plan_from_file` commits the file's new contents as the next revision.
@y
1. `export_plan_to_file` writes the current plan content to a path. The content
   is written to disk and is **not** returned.
2. The agent edits that file in place with its filesystem tools.
3. `update_plan_from_file` commits the file's new contents as the next revision.
@z

@x
### Free-form status
@y
### Free-form status
@z

@x
Each plan carries a free-form `status` string. There is no fixed vocabulary:
define your own in the system prompt (e.g. `idle`, `in-progress`, `blocked`,
`done`, `canceled`). Read and write it independently of the body with
`get_plan_status` and `set_plan_status`, or pass `status` to `write_plan` and
`update_plan_from_file`. The TUI surfaces the status next to the plan title.
@y
Each plan carries a free-form `status` string. There is no fixed vocabulary:
define your own in the system prompt (e.g. `idle`, `in-progress`, `blocked`,
`done`, `canceled`). Read and write it independently of the body with
`get_plan_status` and `set_plan_status`, or pass `status` to `write_plan` and
`update_plan_from_file`. The TUI surfaces the status next to the plan title.
@z

@x
### Optimistic locking
@y
### Optimistic locking
@z

@x
When several sessions edit the same plan, concurrent writes could silently
overwrite each other. Every read returns a `revision` number; pass the value you
last read as `last_known_revision` to `write_plan`, `update_plan_from_file`,
`set_plan_status`, or `delete_plan`. If the plan changed since (its current
revision no longer matches), the write is rejected with a version-conflict
error and the caller should re-read the plan and retry. The revision check and
the write happen under the storage's cross-process file lock, so the conflict
is detected reliably even when the competing writer runs in a different Docker
Agent process. Omit `last_known_revision` to write unconditionally (last
writer wins).
@y
When several sessions edit the same plan, concurrent writes could silently
overwrite each other. Every read returns a `revision` number; pass the value you
last read as `last_known_revision` to `write_plan`, `update_plan_from_file`,
`set_plan_status`, or `delete_plan`. If the plan changed since (its current
revision no longer matches), the write is rejected with a version-conflict
error and the caller should re-read the plan and retry. The revision check and
the write happen under the storage's cross-process file lock, so the conflict
is detected reliably even when the competing writer runs in a different Docker
Agent process. Omit `last_known_revision` to write unconditionally (last
writer wins).
@z

@x
### Plan Names
@y
### Plan Names
@z

@x
Plan names must match the pattern `[a-z0-9][a-z0-9_-]*` (lowercase letters, digits, `-`, `_`). This is enforced structurally so two different inputs can never collapse onto the same file and path-traversal is impossible by construction.
@y
Plan names must match the pattern `[a-z0-9][a-z0-9_-]*` (lowercase letters, digits, `-`, `_`). This is enforced structurally so two different inputs can never collapse onto the same file and path-traversal is impossible by construction.
@z

@x
### Plan Fields
@y
### Plan Fields
@z

@x
Each plan document contains:
@y
Each plan document contains:
@z

@x
| Field      | Description                                               |
| ---------- | --------------------------------------------------------- |
| `name`     | The plan's unique slug name                               |
| `title`    | A short human-readable title (optional)                   |
| `content`  | The full Markdown or free-form plan text                  |
| `author`   | Free-form label identifying who last wrote the plan       |
| `status`   | Free-form lifecycle label (optional), e.g. `in-progress`  |
| `revision` | Monotonically increasing version counter, bumped on every write |
| `updatedAt`| ISO 8601 timestamp of the last write                      |
@y
| Field      | Description                                               |
| ---------- | --------------------------------------------------------- |
| `name`     | The plan's unique slug name                               |
| `title`    | A short human-readable title (optional)                   |
| `content`  | The full Markdown or free-form plan text                  |
| `author`   | Free-form label identifying who last wrote the plan       |
| `status`   | Free-form lifecycle label (optional), e.g. `in-progress`  |
| `revision` | Monotonically increasing version counter, bumped on every write |
| `updatedAt`| ISO 8601 timestamp of the last write                      |
@z

@x
## Example
@y
## Example
@z

@x
Two agents collaborate on a shared plan — the architect drafts it and the builder refines it:
@y
Two agents collaborate on a shared plan — the architect drafts it and the builder refines it:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Coordinator
    instruction: |
      Route work between the architect and the builder.
    handoffs: [architect, builder]
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Coordinator
    instruction: |
      Route work between the architect and the builder.
    handoffs: [architect, builder]
@z

@x
  architect:
    model: anthropic/claude-sonnet-4-5
    description: Drafts high-level plans
    instruction: |
      Use list_plans and read_plan to inspect existing plans, then write_plan
      to create or revise one. Always read before writing. When done, hand off
      to the builder.
    toolsets:
      - type: plan
    handoffs: [builder]
@y
  architect:
    model: anthropic/claude-sonnet-4-5
    description: Drafts high-level plans
    instruction: |
      Use list_plans and read_plan to inspect existing plans, then write_plan
      to create or revise one. Always read before writing. When done, hand off
      to the builder.
    toolsets:
      - type: plan
    handoffs: [builder]
@z

@x
  builder:
    model: openai/gpt-4o
    description: Adds implementation steps to plans
    instruction: |
      Read the architect's plan with read_plan, then use write_plan to append
      concrete implementation steps. Always read before writing. When done,
      hand off back to root.
    toolsets:
      - type: plan
    handoffs: [root]
```
@y
  builder:
    model: openai/gpt-4o
    description: Adds implementation steps to plans
    instruction: |
      Read the architect's plan with read_plan, then use write_plan to append
      concrete implementation steps. Always read before writing. When done,
      hand off back to root.
    toolsets:
      - type: plan
    handoffs: [root]
```
@z

@x
See [`examples/shared_plan.yaml`](https://github.com/docker/docker-agent/blob/main/examples/shared_plan.yaml) for a complete working example.
@y
See [`examples/shared_plan.yaml`](https://github.com/docker/docker-agent/blob/main/examples/shared_plan.yaml) for a complete working example.
@z

@x
## Error Handling
@y
## Error Handling
@z

@x
- `read_plan` returns a distinct "not found" error when a plan does not exist, as opposed to any other I/O error, so callers can tell "plan missing" from "plan unreadable."
- `list_plans` skips corrupt entries but reports them in a `warnings` field so an agent can detect and recover from a bad state (e.g., by calling `delete_plan`).
- `delete_plan` can remove a corrupt plan to recover from a bad state.
@y
- `read_plan` returns a distinct "not found" error when a plan does not exist, as opposed to any other I/O error, so callers can tell "plan missing" from "plan unreadable."
- `list_plans` skips corrupt entries but reports them in a `warnings` field so an agent can detect and recover from a bad state (e.g., by calling `delete_plan`).
- `delete_plan` can remove a corrupt plan to recover from a bad state.
@z

@x
## Managing plans from the host
@y
## Managing plans from the host
@z

@x
Shared plans can also be inspected and managed outside a session with the [`docker agent plans`](../../features/cli/index.md#docker-agent-plans) command group: list, get, create, update, set status, export, and delete — with the same optimistic-locking semantics as the tools (`--expected-version` guards a write and a stale version fails with exit code 3; `--force` writes unconditionally). Session plans (the per-session "draft, review, execute" plan) can be listed, read, and exported through the same commands but stay owned by their session and cannot be mutated from the host.
@y
Shared plans can also be inspected and managed outside a session with the [`docker agent plans`](../../features/cli/index.md#docker-agent-plans) command group: list, get, create, update, set status, export, and delete — with the same optimistic-locking semantics as the tools (`--expected-version` guards a write and a stale version fails with exit code 3; `--force` writes unconditionally). Session plans (the per-session "draft, review, execute" plan) can be listed, read, and exported through the same commands but stay owned by their session and cannot be mutated from the host.
@z

@x
```bash
$ docker agent plans list
$ docker agent plans get release > plan.md
$ docker agent plans update release --file ./plan.md --expected-version 1
```
@y
```bash
$ docker agent plans list
$ docker agent plans get release > plan.md
$ docker agent plans update release --file ./plan.md --expected-version 1
```
@z

@x
### The `/plans` browser in the TUI
@y
### The `/plans` browser in the TUI
@z

@x
Inside the full-screen TUI, the `/plans` slash command (also in the <kbd>Ctrl</kbd>+<kbd>K</kbd> command palette) opens a plan browser over the same store the agents use, so changes made by agents mid-session appear immediately. The list shows every shared plan plus the current session's [session plan](../session_plan/index.md), with each plan's scope, identity (name, or session ID for the session plan), status, version (`-` for the unversioned session plan), last update time, and title.
@y
Inside the full-screen TUI, the `/plans` slash command (also in the <kbd>Ctrl</kbd>+<kbd>K</kbd> command palette) opens a plan browser over the same store the agents use, so changes made by agents mid-session appear immediately. The list shows every shared plan plus the current session's [session plan](../session_plan/index.md), with each plan's scope, identity (name, or session ID for the session plan), status, version (`-` for the unversioned session plan), last update time, and title.
@z

@x
Keybindings:
@y
Keybindings:
@z

@x
| Key | Action |
| --- | ------ |
| <kbd>↑</kbd>/<kbd>↓</kbd>, mouse | Navigate; <kbd>Enter</kbd> or double-click opens a detail view with the full metadata and scrollable markdown content |
| <kbd>/</kbd> | Filter by name, title, status, or scope (<kbd>Esc</kbd> leaves filter mode) |
| <kbd>r</kbd> | Refresh from storage |
| <kbd>x</kbd> | Export the selected plan to `<name>.md` (shared) or `session-plan-<short-id>.md` (session) in the session's working directory. An existing file is never overwritten — the export fails with a notification instead |
| <kbd>s</kbd> | Set a shared plan's free-form status via a small input dialog |
| <kbd>e</kbd> | Edit a shared plan's content in `$VISUAL`/`$EDITOR` |
| <kbd>n</kbd> | Create a new shared plan: pick a name, then draft the content in `$VISUAL`/`$EDITOR` (an empty draft aborts) |
| <kbd>d</kbd> | Delete a shared plan after a confirmation that names the plan and its version |
| <kbd>Esc</kbd> | Close the detail view / the browser |
@y
| Key | Action |
| --- | ------ |
| <kbd>↑</kbd>/<kbd>↓</kbd>, mouse | Navigate; <kbd>Enter</kbd> or double-click opens a detail view with the full metadata and scrollable markdown content |
| <kbd>/</kbd> | Filter by name, title, status, or scope (<kbd>Esc</kbd> leaves filter mode) |
| <kbd>r</kbd> | Refresh from storage |
| <kbd>x</kbd> | Export the selected plan to `<name>.md` (shared) or `session-plan-<short-id>.md` (session) in the session's working directory. An existing file is never overwritten — the export fails with a notification instead |
| <kbd>s</kbd> | Set a shared plan's free-form status via a small input dialog |
| <kbd>e</kbd> | Edit a shared plan's content in `$VISUAL`/`$EDITOR` |
| <kbd>n</kbd> | Create a new shared plan: pick a name, then draft the content in `$VISUAL`/`$EDITOR` (an empty draft aborts) |
| <kbd>d</kbd> | Delete a shared plan after a confirmation that names the plan and its version |
| <kbd>Esc</kbd> | Close the detail view / the browser |
@z

@x
Every mutation is guarded by the version shown on screen (the same optimistic locking as `last_known_revision`): if an agent changed the plan in the meantime, the write is rejected, a notification reports the current version, the newer content is left intact and re-read into the browser, and an edit draft is kept in a temp file so nothing is lost. Session plans are read-only here — status, edit, and delete report why instead of attempting the write. The browser also refreshes live when agents in the same process write, re-status, or delete plans (and when this session's agent updates its session plan); in the lean TUI, which has no overlays, `/plans` is unavailable.
@y
Every mutation is guarded by the version shown on screen (the same optimistic locking as `last_known_revision`): if an agent changed the plan in the meantime, the write is rejected, a notification reports the current version, the newer content is left intact and re-read into the browser, and an edit draft is kept in a temp file so nothing is lost. Session plans are read-only here — status, edit, and delete report why instead of attempting the write. The browser also refreshes live when agents in the same process write, re-status, or delete plans (and when this session's agent updates its session plan); in the lean TUI, which has no overlays, `/plans` is unavailable.
@z

@x
> [!TIP]
> **Plan vs. Todo vs. Tasks**
>
> Use **plan** for shared, free-form documents that multiple agents collaborate on (design docs, requirements, work items). Use [todo](../todo/index.md) for lightweight in-session task lists. Use [tasks](../tasks/index.md) for a structured, persistent task database with priorities and dependencies.
@y
> [!TIP]
> **Plan vs. Todo vs. Tasks**
>
> Use **plan** for shared, free-form documents that multiple agents collaborate on (design docs, requirements, work items). Use [todo](../todo/index.md) for lightweight in-session task lists. Use [tasks](../tasks/index.md) for a structured, persistent task database with priorities and dependencies.
@z
