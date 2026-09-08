%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "MCP Mode"
description: "Expose your Docker Agent agents as MCP tools for use in Claude Desktop, Claude Code, and other MCP-compatible applications."
keywords: docker agent, ai agents, features, mcp mode
@y
title: "MCP Mode"
description: "Expose your Docker Agent agents as MCP tools for use in Claude Desktop, Claude Code, and other MCP-compatible applications."
keywords: docker agent, ai agents, features, mcp mode
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/mcp-mode/
@y
canonical: __SUBDIR__/ai/docker-agent/features/mcp-mode/
@z

@x
_Expose your Docker Agent agents as MCP tools for use in Claude Desktop, Claude Code, and other MCP-compatible applications._
@y
_Expose your Docker Agent agents as MCP tools for use in Claude Desktop, Claude Code, and other MCP-compatible applications._
@z

@x
## Why MCP Mode?
@y
## Why MCP Mode?
@z

@x
The `docker agent serve mcp` command makes your agents available to any application that supports the [Model Context Protocol](https://modelcontextprotocol.io/). This means you can:
@y
The `docker agent serve mcp` command makes your agents available to any application that supports the [Model Context Protocol](https://modelcontextprotocol.io/). This means you can:
@z

@x
- Use custom agents directly within **Claude Desktop** or **Claude Code**
- Share specialized agents across different applications
- Build reusable agent teams consumable from any MCP client
- Integrate domain-specific agents into existing workflows
@y
- Use custom agents directly within **Claude Desktop** or **Claude Code**
- Share specialized agents across different applications
- Build reusable agent teams consumable from any MCP client
- Integrate domain-specific agents into existing workflows
@z

@x
> [!NOTE]
> **What is MCP?**
>
> The [Model Context Protocol](https://modelcontextprotocol.io/) is an open standard for connecting AI tools. See also [Remote MCP Servers](../remote-mcp/index.md) for connecting to cloud services.
@y
> [!NOTE]
> **What is MCP?**
>
> The [Model Context Protocol](https://modelcontextprotocol.io/) is an open standard for connecting AI tools. See also [Remote MCP Servers](../remote-mcp/index.md) for connecting to cloud services.
@z

@x
## Basic Usage
@y
## Basic Usage
@z

@x
```bash
# Expose a local config (stdio transport, the default)
$ docker agent serve mcp ./agent.yaml
@y
```bash
# Expose a local config (stdio transport, the default)
$ docker agent serve mcp ./agent.yaml
@z

@x
# Expose from a registry
$ docker agent serve mcp myorg/agent:tag
@y
# Expose from a registry
$ docker agent serve mcp myorg/agent:tag
@z

@x
# Set the working directory
$ docker agent serve mcp ./agent.yaml --working-dir /path/to/project
```
@y
# Set the working directory
$ docker agent serve mcp ./agent.yaml --working-dir /path/to/project
```
@z

@x
## Transports
@y
## Transports
@z

@x
By default, `serve mcp` uses the stdio transport — ideal for clients that spawn the server as a subprocess (Claude Desktop, Claude Code, Cursor, …).
@y
By default, `serve mcp` uses the stdio transport — ideal for clients that spawn the server as a subprocess (Claude Desktop, Claude Code, Cursor, …).
@z

@x
To expose the MCP server over streaming HTTP instead, pass `--http`:
@y
To expose the MCP server over streaming HTTP instead, pass `--http`:
@z

@x
```bash
# Streaming HTTP transport on the default 127.0.0.1:8081
$ docker agent serve mcp ./agent.yaml --http
@y
```bash
# Streaming HTTP transport on the default 127.0.0.1:8081
$ docker agent serve mcp ./agent.yaml --http
@z

@x
# Override the listen address / port; non-loopback HTTP requires authentication
$ docker agent serve mcp ./agent.yaml --http --listen 0.0.0.0:9090 --auth-token "$MCP_BEARER_TOKEN"
```
@y
# Override the listen address / port; non-loopback HTTP requires authentication
$ docker agent serve mcp ./agent.yaml --http --listen 0.0.0.0:9090 --auth-token "$MCP_BEARER_TOKEN"
```
@z

@x
| Flag                   | Default            | Description                                                                                                  |
| ---------------------- | ------------------ | ------------------------------------------------------------------------------------------------------------ |
| `--http`               | `false`            | Use streaming HTTP transport instead of stdio.                                                               |
| `-l`, `--listen`       | `127.0.0.1:8081`   | Address to listen on when `--http` is enabled.                                                               |
| `-a`, `--agent`        | all agents         | Expose a single named agent instead of every agent in the config.                                            |
| `--tool-name`          | (none)             | Override the MCP tool identifier clients call (defaults to agent name); only valid when exposing one agent.  |
| `--auth-token`          | (none)             | Require this Bearer token for HTTP requests. Required for non-loopback HTTP unless explicitly overridden.       |
| `--insecure-no-auth`    | `false`            | Permit unauthenticated non-loopback HTTP. Use only behind a trusted authentication boundary.                    |
| `--safety`              | `restricted`       | Tool safety policy for HTTP requests. CLI value overrides agent/runtime configuration.                           |
| `--mcp-keepalive`      | `0`                | Interval between MCP keep-alive pings (e.g. `30s`); `0` disables keep-alive.                                 |
@y
| Flag                   | Default            | Description                                                                                                  |
| ---------------------- | ------------------ | ------------------------------------------------------------------------------------------------------------ |
| `--http`               | `false`            | Use streaming HTTP transport instead of stdio.                                                               |
| `-l`, `--listen`       | `127.0.0.1:8081`   | Address to listen on when `--http` is enabled.                                                               |
| `-a`, `--agent`        | all agents         | Expose a single named agent instead of every agent in the config.                                            |
| `--tool-name`          | (none)             | Override the MCP tool identifier clients call (defaults to agent name); only valid when exposing one agent.  |
| `--auth-token`          | (none)             | Require this Bearer token for HTTP requests. Required for non-loopback HTTP unless explicitly overridden.       |
| `--insecure-no-auth`    | `false`            | Permit unauthenticated non-loopback HTTP. Use only behind a trusted authentication boundary.                    |
| `--safety`              | `restricted`       | Tool safety policy for HTTP requests. CLI value overrides agent/runtime configuration.                           |
| `--mcp-keepalive`      | `0`                | Interval between MCP keep-alive pings (e.g. `30s`); `0` disables keep-alive.                                 |
@z

@x
Runtime configuration flags such as `--working-dir`, `--env-from-file`, `--models-gateway`, and hook flags are also available — see the [CLI reference](../cli/index.md).
@y
Runtime configuration flags such as `--working-dir`, `--env-from-file`, `--models-gateway`, and hook flags are also available — see the [CLI reference](../cli/index.md).
@z

@x
## HTTP security
@y
## HTTP security
@z

@x
HTTP MCP defaults to loopback binding. A non-loopback `--listen` address requires `--auth-token`; use `--insecure-no-auth` only when a trusted reverse proxy or network boundary authenticates clients. The safety policy is resolved in this order: `--safety`, agent configuration, runtime configuration, then `restricted`. These HTTP-only flags do not affect stdio or `--attach` operation.
@y
HTTP MCP defaults to loopback binding. A non-loopback `--listen` address requires `--auth-token`; use `--insecure-no-auth` only when a trusted reverse proxy or network boundary authenticates clients. The safety policy is resolved in this order: `--safety`, agent configuration, runtime configuration, then `restricted`. These HTTP-only flags do not affect stdio or `--attach` operation.
@z

@x
## Using with Claude Desktop
@y
## Using with Claude Desktop
@z

@x
Add a configuration to your Claude Desktop MCP settings file:
@y
Add a configuration to your Claude Desktop MCP settings file:
@z

@x
- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`
@y
- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`
@z

@x
```json
{
  "mcpServers": {
    "myagent": {
      "command": "/usr/local/bin/docker",
      "args": [
        "agent", 
        "serve",
        "mcp",
        "myorg/coder",
        "--working-dir",
        "/home/user/projects"
      ],
      "env": {
        "ANTHROPIC_API_KEY": "your_key_here",
        "OPENAI_API_KEY": "your_key_here"
      }
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "myagent": {
      "command": "/usr/local/bin/docker",
      "args": [
        "agent", 
        "serve",
        "mcp",
        "myorg/coder",
        "--working-dir",
        "/home/user/projects"
      ],
      "env": {
        "ANTHROPIC_API_KEY": "your_key_here",
        "OPENAI_API_KEY": "your_key_here"
      }
    }
  }
}
```
@z

@x
Restart Claude Desktop after updating the configuration.
@y
Restart Claude Desktop after updating the configuration.
@z

@x
## Using with Claude Code
@y
## Using with Claude Code
@z

@x
```bash
$ claude mcp add --transport stdio myagent \
  --env OPENAI_API_KEY=$OPENAI_API_KEY \
  --env ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
  -- docker agent serve mcp myorg/agent:tag --working-dir $(pwd)
```
@y
```bash
$ claude mcp add --transport stdio myagent \
  --env OPENAI_API_KEY=$OPENAI_API_KEY \
  --env ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
  -- docker agent serve mcp myorg/agent:tag --working-dir $(pwd)
```
@z

@x
## Multi-Agent in MCP Mode
@y
## Multi-Agent in MCP Mode
@z

@x
When you expose a multi-agent configuration via MCP, each agent becomes a separate tool in the MCP client:
@y
When you expose a multi-agent configuration via MCP, each agent becomes a separate tool in the MCP client:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Main coordinator
    sub_agents: [designer, engineer]
  designer:
    model: openai/gpt-5-mini
    description: UI/UX design specialist
  engineer:
    model: anthropic/claude-sonnet-4-5
    description: Software engineer
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Main coordinator
    sub_agents: [designer, engineer]
  designer:
    model: openai/gpt-5-mini
    description: UI/UX design specialist
  engineer:
    model: anthropic/claude-sonnet-4-5
    description: Software engineer
```
@z

@x
All three agents (`root`, `designer`, `engineer`) appear as separate tools in Claude Desktop or Claude Code.
@y
All three agents (`root`, `designer`, `engineer`) appear as separate tools in Claude Desktop or Claude Code.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
- **Agents not appearing:** Verify the `docker-agent` binary path and restart the MCP client
- **Permission errors:** Ensure `docker-agent` has execute permissions (`chmod +x`)
- **Missing API keys:** Pass all required keys in the `env` section
- **Working directory issues:** Verify the `--working-dir` path exists and is accessible
@y
- **Agents not appearing:** Verify the `docker-agent` binary path and restart the MCP client
- **Permission errors:** Ensure `docker-agent` has execute permissions (`chmod +x`)
- **Missing API keys:** Pass all required keys in the `env` section
- **Working directory issues:** Verify the `--working-dir` path exists and is accessible
@z
