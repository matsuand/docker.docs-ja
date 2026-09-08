%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Memory Tool"
description: "Persistent key-value storage backed by SQLite for cross-session recall."
keywords: docker agent, ai agents, tools, toolsets, memory tool
linkTitle: "Memory"
@y
title: "Memory Tool"
description: "Persistent key-value storage backed by SQLite for cross-session recall."
keywords: docker agent, ai agents, tools, toolsets, memory tool
linkTitle: "Memory"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/memory/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/memory/
@z

@x
_Persistent key-value storage backed by SQLite for cross-session recall._
@y
_Persistent key-value storage backed by SQLite for cross-session recall._
@z

@x
## Overview
@y
## Overview
@z

@x
The memory tool provides persistent key-value storage backed by SQLite. Data survives across sessions, allowing agents to remember facts, user preferences, project context, and past decisions. Memories can be organized with categories and searched by keyword.
@y
The memory tool provides persistent key-value storage backed by SQLite. Data survives across sessions, allowing agents to remember facts, user preferences, project context, and past decisions. Memories can be organized with categories and searched by keyword.
@z

@x
By default, the database is stored at `~/.cagent/memory/<config-name>/memory.db`, where `<config-name>` is derived from the loaded configuration (typically the YAML file name) and falls back to `default` when unavailable. When the agent is loaded from an OCI reference (e.g. `docker/my-agent:latest`), characters that are reserved in filesystem paths (such as `:`) are sanitised in the `<config-name>` segment — the agent's display name elsewhere is unchanged. Agents declared in the same configuration share this database by default; set an explicit `path` per toolset to isolate them.
@y
By default, the database is stored at `~/.cagent/memory/<config-name>/memory.db`, where `<config-name>` is derived from the loaded configuration (typically the YAML file name) and falls back to `default` when unavailable. When the agent is loaded from an OCI reference (e.g. `docker/my-agent:latest`), characters that are reserved in filesystem paths (such as `:`) are sanitised in the `<config-name>` segment — the agent's display name elsewhere is unchanged. Agents declared in the same configuration share this database by default; set an explicit `path` per toolset to isolate them.
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
| Tool              | Description                                                                      |
| ----------------- | -------------------------------------------------------------------------------- |
| `add_memory`      | Store a new memory with optional category                                        |
| `get_memories`    | Retrieve all stored memories                                                     |
| `delete_memory`   | Delete a specific memory by ID                                                   |
| `search_memories` | Search memories by keywords and/or category (more efficient than `get_memories`) |
| `update_memory`   | Update an existing memory's content and/or category by ID                        |
@y
| Tool              | Description                                                                      |
| ----------------- | -------------------------------------------------------------------------------- |
| `add_memory`      | Store a new memory with optional category                                        |
| `get_memories`    | Retrieve all stored memories                                                     |
| `delete_memory`   | Delete a specific memory by ID                                                   |
| `search_memories` | Search memories by keywords and/or category (more efficient than `get_memories`) |
| `update_memory`   | Update an existing memory's content and/or category by ID                        |
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: memory
```
@y
```yaml
toolsets:
  - type: memory
```
@z

@x
### Options
@y
### Options
@z

@x
| Property | Type   | Default                                   | Description                      |
| -------- | ------ | ----------------------------------------- | -------------------------------- |
| `path`   | string | `~/.cagent/memory/<config-name>/memory.db` | Path to the SQLite database file |
@y
| Property | Type   | Default                                   | Description                      |
| -------- | ------ | ----------------------------------------- | -------------------------------- |
| `path`   | string | `~/.cagent/memory/<config-name>/memory.db` | Path to the SQLite database file |
@z

@x
### Custom Database Path
@y
### Custom Database Path
@z

@x
```yaml
toolsets:
  - type: memory
    path: ./agent_memory.db
```
@y
```yaml
toolsets:
  - type: memory
    path: ./agent_memory.db
```
@z

@x
## Categories
@y
## Categories
@z

@x
Memories support an optional `category` field for organization and filtering. Common categories include:
@y
Memories support an optional `category` field for organization and filtering. Common categories include:
@z

@x
- `preference` — User preferences and settings
- `fact` — Factual information about the project or user
- `project` — Project-specific context
- `decision` — Past decisions and their rationale
@y
- `preference` — User preferences and settings
- `fact` — Factual information about the project or user
- `project` — Project-specific context
- `decision` — Past decisions and their rationale
@z

@x
> [!TIP]
> Memory is especially useful for long-running assistants that need to recall information across conversations — like coding preferences, project conventions, or context discovered during previous sessions.
@y
> [!TIP]
> Memory is especially useful for long-running assistants that need to recall information across conversations — like coding preferences, project conventions, or context discovered during previous sessions.
@z
