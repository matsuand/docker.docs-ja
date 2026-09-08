%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "A2A Protocol"
description: "Expose Docker Agent agents via Google's Agent-to-Agent (A2A) protocol for interoperability with other agent frameworks."
keywords: docker agent, ai agents, features, a2a protocol
@y
title: "A2A Protocol"
description: "Expose Docker Agent agents via Google's Agent-to-Agent (A2A) protocol for interoperability with other agent frameworks."
keywords: docker agent, ai agents, features, a2a protocol
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/a2a/
@y
canonical: __SUBDIR__/ai/docker-agent/features/a2a/
@z

@x
_Expose Docker Agent agents via Google's Agent-to-Agent (A2A) protocol for interoperability with other agent frameworks._
@y
_Expose Docker Agent agents via Google's Agent-to-Agent (A2A) protocol for interoperability with other agent frameworks._
@z

@x
## Overview
@y
## Overview
@z

@x
The `docker agent serve a2a` command starts an A2A server that exposes your agents using the [A2A protocol](https://a2a-protocol.org/latest/). This enables communication between Docker Agent and other agent frameworks that support A2A.
@y
The `docker agent serve a2a` command starts an A2A server that exposes your agents using the [A2A protocol](https://a2a-protocol.org/latest/). This enables communication between Docker Agent and other agent frameworks that support A2A.
@z

@x
> [!WARNING]
> **Early support**
>
> A2A support is functional but still evolving. Tool calls, artifacts, and memory features have limited A2A integration. See limitations below.
@y
> [!WARNING]
> **Early support**
>
> A2A support is functional but still evolving. Tool calls, artifacts, and memory features have limited A2A integration. See limitations below.
@z

@x
## Usage
@y
## Usage
@z

@x
```bash
# Start A2A server for an agent
$ docker agent serve a2a ./agent.yaml
@y
```bash
# Start A2A server for an agent
$ docker agent serve a2a ./agent.yaml
@z

@x
# Specify a custom address
$ docker agent serve a2a ./agent.yaml --listen 127.0.0.1:9000
@y
# Specify a custom address
$ docker agent serve a2a ./agent.yaml --listen 127.0.0.1:9000
@z

@x
# Use an agent from an OCI registry
$ docker agent serve a2a myorg/agent:tag
```
@y
# Use an agent from an OCI registry
$ docker agent serve a2a myorg/agent:tag
```
@z

@x
## Flags
@y
## Flags
@z

@x
| Flag                              | Default          | Description                                                                                                          |
| --------------------------------- | ---------------- | -------------------------------------------------------------------------------------------------------------------- |
| `-l, --listen <addr>`             | `127.0.0.1:8082` | Address to listen on.                                                                                                |
| `-a, --agent <name>`              | (first agent)    | Name of the agent to expose when the config contains multiple agents. Defaults to the team's first agent.            |
| `-s, --session-db <path>`         | `<data-dir>/session.db` | Path to the SQLite session database.                                                                          |
| `--working-dir <path>`            | current dir      | Working directory the agent runs in.                                                                                 |
| `--env-from-file <file>`          | (none)           | Load additional environment variables from a `.env` file (repeatable).                                               |
| `--models-gateway <url>`          | (none)           | Route all provider traffic through a models gateway URL.                                                             |
| `--code-mode-tools`               | `false`          | Expose tools as a single "code" toolset that accepts a JavaScript snippet to run.                                    |
| `--hook-pre-tool-use <cmd>`       | (none)           | Add a pre-tool-use hook (repeatable). See [Hooks](../../configuration/hooks/index.md).                     |
| `--hook-post-tool-use <cmd>`      | (none)           | Add a post-tool-use hook (repeatable).                                                                               |
| `--hook-session-start <cmd>`      | (none)           | Add a session-start hook (repeatable).                                                                               |
| `--hook-session-end <cmd>`        | (none)           | Add a session-end hook (repeatable).                                                                                 |
| `--hook-on-user-input <cmd>`      | (none)           | Add an on-user-input hook (repeatable).                                                                              |
| `--hook-stop <cmd>`               | (none)           | Add a stop hook, fired when the model finishes responding (repeatable).                                              |
| `--auth-token <token>`            | (none)           | Bearer token required for agent-card and invocation requests.                                                        |
| `--cors-origin <origins>`          | (none)           | Allowed browser origins, comma-separated; empty disables CORS.                                                       |
| `--insecure-no-auth`              | `false`          | Allow an unauthenticated non-loopback listener (unsafe).                                                             |
| `--safety <policy>`               | `restricted`     | Tool safety policy; `autonomous` is permitted only through this explicit CLI flag.                                   |
@y
| Flag                              | Default          | Description                                                                                                          |
| --------------------------------- | ---------------- | -------------------------------------------------------------------------------------------------------------------- |
| `-l, --listen <addr>`             | `127.0.0.1:8082` | Address to listen on.                                                                                                |
| `-a, --agent <name>`              | (first agent)    | Name of the agent to expose when the config contains multiple agents. Defaults to the team's first agent.            |
| `-s, --session-db <path>`         | `<data-dir>/session.db` | Path to the SQLite session database.                                                                          |
| `--working-dir <path>`            | current dir      | Working directory the agent runs in.                                                                                 |
| `--env-from-file <file>`          | (none)           | Load additional environment variables from a `.env` file (repeatable).                                               |
| `--models-gateway <url>`          | (none)           | Route all provider traffic through a models gateway URL.                                                             |
| `--code-mode-tools`               | `false`          | Expose tools as a single "code" toolset that accepts a JavaScript snippet to run.                                    |
| `--hook-pre-tool-use <cmd>`       | (none)           | Add a pre-tool-use hook (repeatable). See [Hooks](../../configuration/hooks/index.md).                     |
| `--hook-post-tool-use <cmd>`      | (none)           | Add a post-tool-use hook (repeatable).                                                                               |
| `--hook-session-start <cmd>`      | (none)           | Add a session-start hook (repeatable).                                                                               |
| `--hook-session-end <cmd>`        | (none)           | Add a session-end hook (repeatable).                                                                                 |
| `--hook-on-user-input <cmd>`      | (none)           | Add an on-user-input hook (repeatable).                                                                              |
| `--hook-stop <cmd>`               | (none)           | Add a stop hook, fired when the model finishes responding (repeatable).                                              |
| `--auth-token <token>`            | (none)           | Bearer token required for agent-card and invocation requests.                                                        |
| `--cors-origin <origins>`          | (none)           | Allowed browser origins, comma-separated; empty disables CORS.                                                       |
| `--insecure-no-auth`              | `false`          | Allow an unauthenticated non-loopback listener (unsafe).                                                             |
| `--safety <policy>`               | `restricted`     | Tool safety policy; `autonomous` is permitted only through this explicit CLI flag.                                   |
@z

@x
## Authentication and network exposure
@y
## Authentication and network exposure
@z

@x
Loopback listeners may run without authentication. Non-loopback listeners require
`--auth-token` unless `--insecure-no-auth` explicitly acknowledges the exposure.
Clients must send `Authorization: Bearer <token>` for both agent-card discovery
and JSON-RPC invocation. Configure browser access with `--cors-origin`; it accepts
comma-separated literal origins or `~`-prefixed regular expressions and permits
credentials only for matching origins.
@y
Loopback listeners may run without authentication. Non-loopback listeners require
`--auth-token` unless `--insecure-no-auth` explicitly acknowledges the exposure.
Clients must send `Authorization: Bearer <token>` for both agent-card discovery
and JSON-RPC invocation. Configure browser access with `--cors-origin`; it accepts
comma-separated literal origins or `~`-prefixed regular expressions and permits
credentials only for matching origins.
@z

@x
```bash
$ docker agent serve a2a ./agent.yaml --auth-token "$A2A_TOKEN" \
    --cors-origin http://localhost:3000
```
@y
```bash
$ docker agent serve a2a ./agent.yaml --auth-token "$A2A_TOKEN" \
    --cors-origin http://localhost:3000
```
@z

@x
## Tool safety and migration
@y
## Tool safety and migration
@z

@x
A2A sessions default to the `restricted` tool safety policy. Precedence is the
`--safety` flag, then agent YAML, then runtime YAML. YAML may select `strict`,
`balanced`, or `restricted`; `safety: autonomous` stops startup and directs the
operator to `--safety autonomous`. That CLI flag is the only deliberate opt-in
to autonomous tool execution.
@y
A2A sessions default to the `restricted` tool safety policy. Precedence is the
`--safety` flag, then agent YAML, then runtime YAML. YAML may select `strict`,
`balanced`, or `restricted`; `safety: autonomous` stops startup and directs the
operator to `--safety autonomous`. That CLI flag is the only deliberate opt-in
to autonomous tool execution.
@z

@x
Existing deployments should choose an explicit policy before upgrading. Migration
027 labels pre-existing sessions as `run`, so they cannot be resumed through
`/invoke`; clients must start new A2A contexts. An A2A context ID that collides
with another session is rejected without changing that session.
@y
Existing deployments should choose an explicit policy before upgrading. Migration
027 labels pre-existing sessions as `run`, so they cannot be resumed through
`/invoke`; clients must start new A2A contexts. An A2A context ID that collides
with another session is rejected without changing that session.
@z

@x
Downgrading to a binary that predates migration 027 fails because the session
database has a newer schema (`ErrNewerDatabase`). Restore an older database, or
use a binary that includes the migration. Revert changes without removing the
migration catalogue entry.
@y
Downgrading to a binary that predates migration 027 fails because the session
database has a newer schema (`ErrNewerDatabase`). Restore an older database, or
use a binary that includes the migration. Revert changes without removing the
migration catalogue entry.
@z

@x
## Features
@y
## Features
@z

@x
- **Auto port selection** — Picks an available port if not specified
- **Agent card** — Provides standard A2A agent metadata
- **Full Docker Agent features** — Supports all tools, models, and gateway features
- **Multiple sources** — Load agents from files or OCI registries
@y
- **Auto port selection** — Picks an available port if not specified
- **Agent card** — Provides standard A2A agent metadata
- **Full Docker Agent features** — Supports all tools, models, and gateway features
- **Multiple sources** — Load agents from files or OCI registries
@z

@x
> [!TIP]
> **See also**
>
> For exposing agents via MCP instead, see [MCP Mode](../mcp-mode/index.md). For stdio-based integration, see [ACP](../acp/index.md). For the HTTP API, see [API Server](../api-server/index.md).
@y
> [!TIP]
> **See also**
>
> For exposing agents via MCP instead, see [MCP Mode](../mcp-mode/index.md). For stdio-based integration, see [ACP](../acp/index.md). For the HTTP API, see [API Server](../api-server/index.md).
@z

@x
## Current Limitations
@y
## Current Limitations
@z

@x
- Tool calls are handled internally, not exposed as separate A2A events
- A2A artifact support not yet integrated
- A2A memory features not yet integrated
- Multi-agent (sub-agent) scenarios need further work
@y
- Tool calls are handled internally, not exposed as separate A2A events
- A2A artifact support not yet integrated
- A2A memory features not yet integrated
- Multi-agent (sub-agent) scenarios need further work
@z
