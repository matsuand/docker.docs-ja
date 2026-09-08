%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "ACP (Agent Client Protocol)"
description: "Expose Docker Agent agents via the Agent Client Protocol for integration with ACP-compatible hosts like VS Code, IDEs, and other developer tools."
keywords: docker agent, ai agents, features, acp (agent client protocol)
linkTitle: "ACP"
@y
title: "ACP (Agent Client Protocol)"
description: "Expose Docker Agent agents via the Agent Client Protocol for integration with ACP-compatible hosts like VS Code, IDEs, and other developer tools."
keywords: docker agent, ai agents, features, acp (agent client protocol)
linkTitle: "ACP"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/acp/
@y
canonical: __SUBDIR__/ai/docker-agent/features/acp/
@z

@x
_Expose Docker Agent agents via the Agent Client Protocol for integration with ACP-compatible hosts like VS Code, IDEs, and other developer tools._
@y
_Expose Docker Agent agents via the Agent Client Protocol for integration with ACP-compatible hosts like VS Code, IDEs, and other developer tools._
@z

@x
## Overview
@y
## Overview
@z

@x
The `docker agent serve acp` command starts an ACP server that communicates over **stdio** (standard input/output). This makes it ideal for integration with editors, IDEs, and other tools that spawn agent processes — the host sends JSON-RPC messages to Docker Agent's stdin and reads responses from stdout.
@y
The `docker agent serve acp` command starts an ACP server that communicates over **stdio** (standard input/output). This makes it ideal for integration with editors, IDEs, and other tools that spawn agent processes — the host sends JSON-RPC messages to Docker Agent's stdin and reads responses from stdout.
@z

@x
ACP is built on the [ACP Go SDK](https://github.com/coder/acp-go-sdk) and provides a standardized way for client applications to interact with AI agents.
@y
ACP is built on the [ACP Go SDK](https://github.com/coder/acp-go-sdk) and provides a standardized way for client applications to interact with AI agents.
@z

@x
> [!NOTE]
> **ACP vs A2A vs MCP**
>
> **ACP** connects an agent to a *host application* (IDE, CLI tool) via stdio. **A2A** connects *agents to other agents* over HTTP. **MCP** exposes agents as *tools* for other MCP clients. Choose based on your integration target.
@y
> [!NOTE]
> **ACP vs A2A vs MCP**
>
> **ACP** connects an agent to a *host application* (IDE, CLI tool) via stdio. **A2A** connects *agents to other agents* over HTTP. **MCP** exposes agents as *tools* for other MCP clients. Choose based on your integration target.
@z

@x
## Usage
@y
## Usage
@z

@x
```bash
# Start ACP server on stdio
$ docker agent serve acp ./agent.yaml
@y
```bash
# Start ACP server on stdio
$ docker agent serve acp ./agent.yaml
@z

@x
# With a multi-agent team config
$ docker agent serve acp ./team.yaml
@y
# With a multi-agent team config
$ docker agent serve acp ./team.yaml
@z

@x
# From an OCI registry
$ docker agent serve acp myorg/agent:tag
@y
# From an OCI registry
$ docker agent serve acp myorg/agent:tag
@z

@x
# With a custom session database
$ docker agent serve acp ./agent.yaml --session-db ./my-sessions.db
```
@y
# With a custom session database
$ docker agent serve acp ./agent.yaml --session-db ./my-sessions.db
```
@z

@x
## How It Works
@y
## How It Works
@z

@x
1. The host application spawns `docker agent serve acp agent.yaml` as a child process
2. Communication happens over **stdin/stdout** using the ACP protocol
3. The host sends user messages, Docker Agent processes them through the agent
4. Agent responses, tool calls, and events stream back to the host
5. Sessions are persisted in a SQLite database for continuity
@y
1. The host application spawns `docker agent serve acp agent.yaml` as a child process
2. Communication happens over **stdin/stdout** using the ACP protocol
3. The host sends user messages, Docker Agent processes them through the agent
4. Agent responses, tool calls, and events stream back to the host
5. Sessions are persisted in a SQLite database for continuity
@z

@x
```bash
# Conceptual flow:
Host Application
  └── spawns: docker agent serve acp agent.yaml
        ├── stdin  ← JSON-RPC requests from host
        └── stdout → JSON-RPC responses to host
```
@y
```bash
# Conceptual flow:
Host Application
  └── spawns: docker agent serve acp agent.yaml
        ├── stdin  ← JSON-RPC requests from host
        └── stdout → JSON-RPC responses to host
```
@z

@x
## Features
@y
## Features
@z

@x
- **Stdio transport** — No network ports needed; ideal for subprocess integration
- **Session persistence** — SQLite-backed sessions survive process restarts
- **Full agent support** — All Docker Agent features work: tools, multi-agent, model fallbacks
- **Multi-agent configs** — Team configurations with sub-agents work transparently
- **Filesystem operations** — Agents can read/write files relative to the host's working directory
@y
- **Stdio transport** — No network ports needed; ideal for subprocess integration
- **Session persistence** — SQLite-backed sessions survive process restarts
- **Full agent support** — All Docker Agent features work: tools, multi-agent, model fallbacks
- **Multi-agent configs** — Team configurations with sub-agents work transparently
- **Filesystem operations** — Agents can read/write files relative to the host's working directory
@z

@x
## CLI Flags
@y
## CLI Flags
@z

@x
```bash
docker agent serve acp <agent-file>|<registry-ref> [flags]
```
@y
```bash
docker agent serve acp <agent-file>|<registry-ref> [flags]
```
@z

@x
| Flag                              | Default                | Description                                                                                                          |
| --------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `-s, --session-db <path>`         | `<data-dir>/session.db` | Path to the SQLite session database.                                                                                 |
| `--working-dir <path>`            | current dir            | Working directory the agent runs in.                                                                                 |
| `--env-from-file <file>`          | (none)                 | Load additional environment variables from a `.env` file (repeatable).                                               |
| `--models-gateway <url>`          | (none)                 | Route all provider traffic through a models gateway URL.                                                             |
| `--code-mode-tools`               | `false`                | Expose tools as a single "code" toolset that accepts a JavaScript snippet to run.                                    |
| `--hook-pre-tool-use <cmd>`       | (none)                 | Add a pre-tool-use hook (repeatable). See [Hooks](../../configuration/hooks/index.md).                     |
| `--hook-post-tool-use <cmd>`      | (none)                 | Add a post-tool-use hook (repeatable).                                                                               |
| `--hook-session-start <cmd>`      | (none)                 | Add a session-start hook (repeatable).                                                                               |
| `--hook-session-end <cmd>`        | (none)                 | Add a session-end hook (repeatable).                                                                                 |
| `--hook-on-user-input <cmd>`      | (none)                 | Add an on-user-input hook (repeatable).                                                                              |
| `--hook-stop <cmd>`               | (none)                 | Add a stop hook, fired when the model finishes responding (repeatable).                                              |
@y
| Flag                              | Default                | Description                                                                                                          |
| --------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `-s, --session-db <path>`         | `<data-dir>/session.db` | Path to the SQLite session database.                                                                                 |
| `--working-dir <path>`            | current dir            | Working directory the agent runs in.                                                                                 |
| `--env-from-file <file>`          | (none)                 | Load additional environment variables from a `.env` file (repeatable).                                               |
| `--models-gateway <url>`          | (none)                 | Route all provider traffic through a models gateway URL.                                                             |
| `--code-mode-tools`               | `false`                | Expose tools as a single "code" toolset that accepts a JavaScript snippet to run.                                    |
| `--hook-pre-tool-use <cmd>`       | (none)                 | Add a pre-tool-use hook (repeatable). See [Hooks](../../configuration/hooks/index.md).                     |
| `--hook-post-tool-use <cmd>`      | (none)                 | Add a post-tool-use hook (repeatable).                                                                               |
| `--hook-session-start <cmd>`      | (none)                 | Add a session-start hook (repeatable).                                                                               |
| `--hook-session-end <cmd>`        | (none)                 | Add a session-end hook (repeatable).                                                                                 |
| `--hook-on-user-input <cmd>`      | (none)                 | Add an on-user-input hook (repeatable).                                                                              |
| `--hook-stop <cmd>`               | (none)                 | Add a stop hook, fired when the model finishes responding (repeatable).                                              |
@z

@x
## Integration Example
@y
## Integration Example
@z

@x
A host application would spawn Docker Agent as a subprocess and communicate via the ACP protocol:
@y
A host application would spawn Docker Agent as a subprocess and communicate via the ACP protocol:
@z

@x
```javascript
// Pseudocode for an IDE extension
const child = spawn("docker", ["agent", "serve", "acp", "./agent.yaml"]);
@y
```javascript
// Pseudocode for an IDE extension
const child = spawn("docker", ["agent", "serve", "acp", "./agent.yaml"]);
@z

@x
// Send a message to the agent
child.stdin.write(
  JSON.stringify({
    jsonrpc: "2.0",
    method: "agent/run",
    params: { message: "Explain this code" },
  }),
);
@y
// Send a message to the agent
child.stdin.write(
  JSON.stringify({
    jsonrpc: "2.0",
    method: "agent/run",
    params: { message: "Explain this code" },
  }),
);
@z

@x
// Read responses
child.stdout.on("data", (data) => {
  const response = JSON.parse(data);
  // Handle agent response, tool calls, etc.
});
```
@y
// Read responses
child.stdout.on("data", (data) => {
  const response = JSON.parse(data);
  // Handle agent response, tool calls, etc.
});
```
@z

@x
> [!TIP]
> **When to use ACP**
>
> Use ACP when building **IDE integrations**, **editor plugins**, or any tool that wants to embed a Docker Agent agent as a subprocess. For HTTP-based integrations, use the [API Server](../api-server/index.md) instead.
@y
> [!TIP]
> **When to use ACP**
>
> Use ACP when building **IDE integrations**, **editor plugins**, or any tool that wants to embed a Docker Agent agent as a subprocess. For HTTP-based integrations, use the [API Server](../api-server/index.md) instead.
@z

@x
> [!NOTE]
> **See also**
>
> For HTTP-based agent access, see the [API Server](../api-server/index.md). For agent-to-agent communication, see [A2A Protocol](../a2a/index.md). For exposing agents as MCP tools, see [MCP Mode](../mcp-mode/index.md).
@y
> [!NOTE]
> **See also**
>
> For HTTP-based agent access, see the [API Server](../api-server/index.md). For agent-to-agent communication, see [A2A Protocol](../a2a/index.md). For exposing agents as MCP tools, see [MCP Mode](../mcp-mode/index.md).
@z
