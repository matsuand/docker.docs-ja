%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Todo Tool"
description: "Task list management for complex multi-step workflows."
keywords: docker agent, ai agents, tools, toolsets, todo tool
linkTitle: "Todo"
@y
title: "Todo Tool"
description: "Task list management for complex multi-step workflows."
keywords: docker agent, ai agents, tools, toolsets, todo tool
linkTitle: "Todo"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/todo/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/todo/
@z

@x
_Task list management for complex multi-step workflows._
@y
_Task list management for complex multi-step workflows._
@z

@x
## Overview
@y
## Overview
@z

@x
The todo tool provides task list management. Agents can create, update, list, and track progress on tasks with status tracking (pending, in-progress, completed). Useful for complex multi-step workflows where the agent needs to stay organized and ensure all steps are completed.
@y
The todo tool provides task list management. Agents can create, update, list, and track progress on tasks with status tracking (pending, in-progress, completed). Useful for complex multi-step workflows where the agent needs to stay organized and ensure all steps are completed.
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
| Tool           | Description                              |
| -------------- | ---------------------------------------- |
| `create_todo`  | Create a new task                        |
| `create_todos` | Create multiple tasks at once            |
| `update_todos` | Update status of one or more tasks       |
| `list_todos`   | List all current tasks with their status |
@y
| Tool           | Description                              |
| -------------- | ---------------------------------------- |
| `create_todo`  | Create a new task                        |
| `create_todos` | Create multiple tasks at once            |
| `update_todos` | Update status of one or more tasks       |
| `list_todos`   | List all current tasks with their status |
@z

@x
### Task Statuses
@y
### Task Statuses
@z

@x
| Status        | Description                  |
| ------------- | ---------------------------- |
| `pending`     | Task has not been started    |
| `in-progress` | Task is currently being done |
| `completed`   | Task is finished             |
@y
| Status        | Description                  |
| ------------- | ---------------------------- |
| `pending`     | Task has not been started    |
| `in-progress` | Task is currently being done |
| `completed`   | Task is finished             |
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: todo
```
@y
```yaml
toolsets:
  - type: todo
```
@z

@x
### Options
@y
### Options
@z

@x
| Property | Type    | Default | Description                                                             |
| -------- | ------- | ------- | ----------------------------------------------------------------------- |
| `shared` | boolean | `false` | When `true`, todos are shared across all agents in a multi-agent config |
@y
| Property | Type    | Default | Description                                                             |
| -------- | ------- | ------- | ----------------------------------------------------------------------- |
| `shared` | boolean | `false` | When `true`, todos are shared across all agents in a multi-agent config |
@z

@x
### Shared Todos
@y
### Shared Todos
@z

@x
In multi-agent setups, enable shared todos so all agents can see and update the same task list:
@y
In multi-agent setups, enable shared todos so all agents can see and update the same task list:
@z

@x
```yaml
toolsets:
  - type: todo
    shared: true
```
@y
```yaml
toolsets:
  - type: todo
    shared: true
```
@z
