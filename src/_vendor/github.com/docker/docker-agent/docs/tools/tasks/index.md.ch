%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Tasks Tool"
description: "Persistent task database with priorities and dependencies, shared across sessions."
keywords: docker agent, ai agents, tools, toolsets, tasks tool
linkTitle: "Tasks"
@y
title: "Tasks Tool"
description: "Persistent task database with priorities and dependencies, shared across sessions."
keywords: docker agent, ai agents, tools, toolsets, tasks tool
linkTitle: "Tasks"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/tasks/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/tasks/
@z

@x
_Persistent task database with priorities and dependencies, shared across sessions._
@y
_Persistent task database with priorities and dependencies, shared across sessions._
@z

@x
## Overview
@y
## Overview
@z

@x
The tasks tool provides a persistent task database that survives across agent sessions. Unlike the [Todo tool](../todo/index.md), which maintains an in-memory task list for the current session only, the tasks tool stores tasks in a JSON file on disk so they can be accessed and updated across multiple sessions. Tasks support priorities and dependencies — a task is _blocked_ until every task it depends on is `done`.
@y
The tasks tool provides a persistent task database that survives across agent sessions. Unlike the [Todo tool](../todo/index.md), which maintains an in-memory task list for the current session only, the tasks tool stores tasks in a JSON file on disk so they can be accessed and updated across multiple sessions. Tasks support priorities and dependencies — a task is _blocked_ until every task it depends on is `done`.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: tasks
    path: ./tasks.json  # Optional: custom database path
```
@y
```yaml
toolsets:
  - type: tasks
    path: ./tasks.json  # Optional: custom database path
```
@z

@x
### Options
@y
### Options
@z

@x
| Property | Type   | Default       | Description                                                                                                                  |
| -------- | ------ | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `path`   | string | `tasks.json`  | Path to the JSON task database. Relative paths resolve against the agent config directory (or `--working-dir` when set).     |
@y
| Property | Type   | Default       | Description                                                                                                                  |
| -------- | ------ | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `path`   | string | `tasks.json`  | Path to the JSON task database. Relative paths resolve against the agent config directory (or `--working-dir` when set).     |
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
The tasks toolset exposes these tools:
@y
The tasks toolset exposes these tools:
@z

@x
| Tool Name           | Description                                                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `create_task`       | Create a new task with a title, description (or markdown file path), optional priority, and optional dependencies.       |
| `get_task`          | Get full details of a single task by ID, including its effective status (`blocked` if any dependency is not `done`).     |
| `update_task`       | Update a task's title, description, priority, status, or dependency list.                                                |
| `delete_task`       | Delete a task by ID. Also removes it from other tasks' dependency lists.                                                 |
| `list_tasks`        | List tasks sorted by priority (critical first) with blocked tasks last. Optionally filter by status or priority.         |
| `next_task`         | Return the highest-priority actionable task — one that is not blocked and not done. Great for "what should I work on?". |
| `add_dependency`    | Add a dependency: a task is blocked until the task it depends on is `done`.                                              |
| `remove_dependency` | Remove a dependency from a task.                                                                                         |
@y
| Tool Name           | Description                                                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `create_task`       | Create a new task with a title, description (or markdown file path), optional priority, and optional dependencies.       |
| `get_task`          | Get full details of a single task by ID, including its effective status (`blocked` if any dependency is not `done`).     |
| `update_task`       | Update a task's title, description, priority, status, or dependency list.                                                |
| `delete_task`       | Delete a task by ID. Also removes it from other tasks' dependency lists.                                                 |
| `list_tasks`        | List tasks sorted by priority (critical first) with blocked tasks last. Optionally filter by status or priority.         |
| `next_task`         | Return the highest-priority actionable task — one that is not blocked and not done. Great for "what should I work on?". |
| `add_dependency`    | Add a dependency: a task is blocked until the task it depends on is `done`.                                              |
| `remove_dependency` | Remove a dependency from a task.                                                                                         |
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
    model: openai/gpt-4o
    toolsets:
      - type: tasks
        path: ./project-tasks.json
```
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    toolsets:
      - type: tasks
        path: ./project-tasks.json
```
@z

@x
> [!TIP]
> **Tasks vs. Todo**
>
> Use the **tasks** tool when you need persistence across sessions, priorities, or dependencies (e.g., long-running projects, recurring work). Use the [todo tool](../todo/index.md) for ephemeral, session-scoped task lists.
@y
> [!TIP]
> **Tasks vs. Todo**
>
> Use the **tasks** tool when you need persistence across sessions, priorities, or dependencies (e.g., long-running projects, recurring work). Use the [todo tool](../todo/index.md) for ephemeral, session-scoped task lists.
@z
