%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Tools"
description: "Tools give agents the ability to interact with the world — read files, run commands, search the web, query databases, and more."
keywords: docker agent, ai agents, concepts, tools
@y
title: "Tools"
description: "Tools give agents the ability to interact with the world — read files, run commands, search the web, query databases, and more."
keywords: docker agent, ai agents, concepts, tools
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/concepts/tools/
@y
canonical: https://docs.docker.com/ai/docker-agent/concepts/tools/
@z

@x
_Tools give agents the ability to interact with the world — read files, run commands, search the web, query databases, and more._
@y
_Tools give agents the ability to interact with the world — read files, run commands, search the web, query databases, and more._
@z

@x
## How Tools Work
@y
## How Tools Work
@z

@x
When an agent needs to perform an action, it makes a **tool call**. The Docker Agent runtime executes the tool and returns the result to the agent, which can then use it to continue its work.
@y
When an agent needs to perform an action, it makes a **tool call**. The Docker Agent runtime executes the tool and returns the result to the agent, which can then use it to continue its work.
@z

@x
1. Agent receives a user message
2. Agent decides it needs to use a tool (e.g., read a file)
3. Docker Agent executes the tool and returns the result
4. Agent incorporates the result and responds
@y
1. Agent receives a user message
2. Agent decides it needs to use a tool (e.g., read a file)
3. Docker Agent executes the tool and returns the result
4. Agent incorporates the result and responds
@z

@x
> [!NOTE]
> **Tool Confirmation**
>
> By default, Docker Agent asks for user confirmation before executing tools that have side effects (shell commands, file writes). Use `--yolo` to auto-approve all tool calls.
@y
> [!NOTE]
> **Tool Confirmation**
>
> By default, Docker Agent asks for user confirmation before executing tools that have side effects (shell commands, file writes). Use `--yolo` to auto-approve all tool calls.
@z

@x
## Built-in Tools
@y
## Built-in Tools
@z

@x
Enable a built-in toolset by adding its `type` to the agent's `toolsets` list. For example:
@y
Enable a built-in toolset by adding its `type` to the agent's `toolsets` list. For example:
@z

@x
```yaml
toolsets:
  - type: filesystem
  - type: shell
  - type: todo
```
@y
```yaml
toolsets:
  - type: filesystem
  - type: shell
  - type: todo
```
@z

@x
Choose tools for the capabilities your agent needs:
@y
Choose tools for the capabilities your agent needs:
@z

@x
- **Work with files and processes:** [Filesystem](../../tools/filesystem/index.md) and [Shell](../../tools/shell/index.md).
- **Plan and remember:** [Todo](../../tools/todo/index.md), [Memory](../../tools/memory/index.md), and [RAG](../../tools/rag/index.md).
- **Coordinate agents:** [Transfer Task](../../tools/transfer-task/index.md) and [Background Agents](../../tools/background-agents/index.md).
@y
- **Work with files and processes:** [Filesystem](../../tools/filesystem/index.md) and [Shell](../../tools/shell/index.md).
- **Plan and remember:** [Todo](../../tools/todo/index.md), [Memory](../../tools/memory/index.md), and [RAG](../../tools/rag/index.md).
- **Coordinate agents:** [Transfer Task](../../tools/transfer-task/index.md) and [Background Agents](../../tools/background-agents/index.md).
@z

@x
See [Built-in Tools](../../configuration/tools/index.md#built-in-tools) for the complete catalog, including each toolset's type and configuration reference.
@y
See [Built-in Tools](../../configuration/tools/index.md#built-in-tools) for the complete catalog, including each toolset's type and configuration reference.
@z

@x
## MCP Tools
@y
## MCP Tools
@z

@x
Docker Agent supports the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) for extending agents with external tools. There are three ways to connect MCP tools:
@y
Docker Agent supports the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) for extending agents with external tools. There are three ways to connect MCP tools:
@z

@x
- **Docker MCP** (recommended) — Run MCP servers in Docker containers via the [MCP Gateway](https://github.com/docker/mcp-gateway). Browse the [Docker MCP Catalog](https://hub.docker.com/search?q=&type=mcp).
- **Local MCP (stdio)** — Run MCP servers as local processes communicating over stdin/stdout.
- **Remote MCP (Streamable HTTP / SSE)** — Connect to MCP servers running on a network. See [Remote MCP Servers](../../features/remote-mcp/index.md).
@y
- **Docker MCP** (recommended) — Run MCP servers in Docker containers via the [MCP Gateway](https://github.com/docker/mcp-gateway). Browse the [Docker MCP Catalog](https://hub.docker.com/search?q=&type=mcp).
- **Local MCP (stdio)** — Run MCP servers as local processes communicating over stdin/stdout.
- **Remote MCP (Streamable HTTP / SSE)** — Connect to MCP servers running on a network. See [Remote MCP Servers](../../features/remote-mcp/index.md).
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:duckduckgo
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:duckduckgo
```
@z

@x
See [Tool Config](../../configuration/tools/index.md#mcp-tools) for full MCP configuration reference.
@y
See [Tool Config](../../configuration/tools/index.md#mcp-tools) for full MCP configuration reference.
@z

@x
> [!TIP]
> **See also**
>
> For full configuration reference, see [Tool Config](../../configuration/tools/index.md).
@y
> [!TIP]
> **See also**
>
> For full configuration reference, see [Tool Config](../../configuration/tools/index.md).
@z
