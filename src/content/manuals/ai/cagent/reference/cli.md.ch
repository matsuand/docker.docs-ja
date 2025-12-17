%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: CLI reference
linkTitle: CLI
description: Complete reference for cagent command-line interface
keywords: [ai, agent, cagent, cli, command line]
@y
title: CLI reference
linkTitle: CLI
description: Complete reference for cagent command-line interface
keywords: [ai, agent, cagent, cli, command line]
@z

@x
Command-line interface for running, managing, and deploying AI agents.
@y
Command-line interface for running, managing, and deploying AI agents.
@z

@x
For agent configuration file syntax, see the [Configuration file
reference](./config.md). For toolset capabilities, see the [Toolsets
reference](./toolsets.md).
@y
For agent configuration file syntax, see the [Configuration file
reference](./config.md). For toolset capabilities, see the [Toolsets
reference](./toolsets.md).
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ cagent [command] [flags]
```
@y
```console
$ cagent [command] [flags]
```
@z

@x
## Global flags
@y
## Global flags
@z

@x
Work with all commands:
@y
Work with all commands:
@z

@x
| Flag            | Type    | Default | Description          |
| --------------- | ------- | ------- | -------------------- |
| `-d`, `--debug` | boolean | false   | Enable debug logging |
| `-o`, `--otel`  | boolean | false   | Enable OpenTelemetry |
| `--log-file`    | string  | -       | Debug log file path  |
@y
| Flag            | Type    | Default | Description          |
| --------------- | ------- | ------- | -------------------- |
| `-d`, `--debug` | boolean | false   | Enable debug logging |
| `-o`, `--otel`  | boolean | false   | Enable OpenTelemetry |
| `--log-file`    | string  | -       | Debug log file path  |
@z

@x
Debug logs write to `~/.cagent/cagent.debug.log` by default. Override with
`--log-file`.
@y
Debug logs write to `~/.cagent/cagent.debug.log` by default. Override with
`--log-file`.
@z

@x
## Runtime flags
@y
## Runtime flags
@z

@x
Work with most commands. Supported commands link to this section.
@y
Work with most commands. Supported commands link to this section.
@z

@x
| Flag                | Type    | Default | Description                          |
| ------------------- | ------- | ------- | ------------------------------------ |
| `--models-gateway`  | string  | -       | Models gateway address               |
| `--env-from-file`   | array   | -       | Load environment variables from file |
| `--code-mode-tools` | boolean | false   | Enable JavaScript tool orchestration |
| `--working-dir`     | string  | -       | Working directory for the session    |
@y
| Flag                | Type    | Default | Description                          |
| ------------------- | ------- | ------- | ------------------------------------ |
| `--models-gateway`  | string  | -       | Models gateway address               |
| `--env-from-file`   | array   | -       | Load environment variables from file |
| `--code-mode-tools` | boolean | false   | Enable JavaScript tool orchestration |
| `--working-dir`     | string  | -       | Working directory for the session    |
@z

@x
Set `--models-gateway` via `CAGENT_MODELS_GATEWAY` environment variable.
@y
Set `--models-gateway` via `CAGENT_MODELS_GATEWAY` environment variable.
@z

@x
## Commands
@y
## Commands
@z

@x
### a2a
@y
### a2a
@z

@x
Expose agent via the Agent2Agent (A2A) protocol. Allows other A2A-compatible
systems to discover and interact with your agent. Auto-selects an available
port if not specified.
@y
Expose agent via the Agent2Agent (A2A) protocol. Allows other A2A-compatible
systems to discover and interact with your agent. Auto-selects an available
port if not specified.
@z

@x
```console
$ cagent a2a agent-file|registry-ref
```
@y
```console
$ cagent a2a agent-file|registry-ref
```
@z

@x
> [!NOTE]
> A2A support is currently experimental and needs further work. Tool calls are
> handled internally and not exposed as separate ADK events. Some ADK features
> are not yet integrated.
@y
> [!NOTE]
> A2A support is currently experimental and needs further work. Tool calls are
> handled internally and not exposed as separate ADK events. Some ADK features
> are not yet integrated.
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@z

@x
Flags:
@y
Flags:
@z

@x
| Flag            | Type    | Default | Description       |
| --------------- | ------- | ------- | ----------------- |
| `-a`, `--agent` | string  | root    | Agent name        |
| `--port`        | integer | 0       | Port (0 = random) |
@y
| Flag            | Type    | Default | Description       |
| --------------- | ------- | ------- | ----------------- |
| `-a`, `--agent` | string  | root    | Agent name        |
| `--port`        | integer | 0       | Port (0 = random) |
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Examples:
@y
Examples:
@z

@x
```console
$ cagent a2a ./agent.yaml --port 8080
$ cagent a2a agentcatalog/pirate --port 9000
```
@y
```console
$ cagent a2a ./agent.yaml --port 8080
$ cagent a2a agentcatalog/pirate --port 9000
```
@z

@x
### acp
@y
### acp
@z

@x
Start agent as ACP (Agent Client Protocol) server on stdio for editor integration.
See [ACP integration](../integrations/acp.md) for setup guides.
@y
Start agent as ACP (Agent Client Protocol) server on stdio for editor integration.
See [ACP integration](../integrations/acp.md) for setup guides.
@z

@x
```console
$ cagent acp agent-file|registry-ref
```
@y
```console
$ cagent acp agent-file|registry-ref
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
### alias add
@y
### alias add
@z

@x
Create alias for agent.
@y
Create alias for agent.
@z

@x
```console
$ cagent alias add name target
```
@y
```console
$ cagent alias add name target
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `name` - Alias name (required)
- `target` - Path to YAML or registry reference (required)
@y
- `name` - Alias name (required)
- `target` - Path to YAML or registry reference (required)
@z

@x
Examples:
@y
Examples:
@z

@x
```console
$ cagent alias add dev ./dev-agent.yaml
$ cagent alias add prod docker.io/user/prod-agent:latest
$ cagent alias add default ./agent.yaml
```
@y
```console
$ cagent alias add dev ./dev-agent.yaml
$ cagent alias add prod docker.io/user/prod-agent:latest
$ cagent alias add default ./agent.yaml
```
@z

@x
Setting alias name to "default" lets you run `cagent run` without arguments.
@y
Setting alias name to "default" lets you run `cagent run` without arguments.
@z

@x
### alias list
@y
### alias list
@z

@x
List all aliases.
@y
List all aliases.
@z

@x
```console
$ cagent alias list
$ cagent alias ls
```
@y
```console
$ cagent alias list
$ cagent alias ls
```
@z

@x
### alias remove
@y
### alias remove
@z

@x
Remove alias.
@y
Remove alias.
@z

@x
```console
$ cagent alias remove name
$ cagent alias rm name
```
@y
```console
$ cagent alias remove name
$ cagent alias rm name
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `name` - Alias name (required)
@y
- `name` - Alias name (required)
@z

@x
### api
@y
### api
@z

@x
HTTP API server.
@y
HTTP API server.
@z

@x
```console
$ cagent api agent-file|agents-dir
```
@y
```console
$ cagent api agent-file|agents-dir
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|agents-dir` - Path to YAML or directory with agents (required)
@y
- `agent-file|agents-dir` - Path to YAML or directory with agents (required)
@z

@x
Flags:
@y
Flags:
@z

@x
| Flag                 | Type    | Default    | Description                       |
| -------------------- | ------- | ---------- | --------------------------------- |
| `-l`, `--listen`     | string  | :8080      | Listen address                    |
| `-s`, `--session-db` | string  | session.db | Session database path             |
| `--pull-interval`    | integer | 0          | Auto-pull OCI ref every N minutes |
@y
| Flag                 | Type    | Default    | Description                       |
| -------------------- | ------- | ---------- | --------------------------------- |
| `-l`, `--listen`     | string  | :8080      | Listen address                    |
| `-s`, `--session-db` | string  | session.db | Session database path             |
| `--pull-interval`    | integer | 0          | Auto-pull OCI ref every N minutes |
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Examples:
@y
Examples:
@z

@x
```console
$ cagent api ./agent.yaml
$ cagent api ./agents/ --listen :9000
$ cagent api docker.io/user/agent --pull-interval 10
```
@y
```console
$ cagent api ./agent.yaml
$ cagent api ./agents/ --listen :9000
$ cagent api docker.io/user/agent --pull-interval 10
```
@z

@x
The `--pull-interval` flag works only with OCI references. Automatically pulls and reloads at the specified interval.
@y
The `--pull-interval` flag works only with OCI references. Automatically pulls and reloads at the specified interval.
@z

@x
### build
@y
### build
@z

@x
Build Docker image for agent.
@y
Build Docker image for agent.
@z

@x
```console
$ cagent build agent-file|registry-ref [image-name]
```
@y
```console
$ cagent build agent-file|registry-ref [image-name]
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
- `image-name` - Docker image name (optional)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
- `image-name` - Docker image name (optional)
@z

@x
Flags:
@y
Flags:
@z

@x
| Flag         | Type    | Default | Description                |
| ------------ | ------- | ------- | -------------------------- |
| `--dry-run`  | boolean | false   | Print Dockerfile only      |
| `--push`     | boolean | false   | Push image after build     |
| `--no-cache` | boolean | false   | Build without cache        |
| `--pull`     | boolean | false   | Pull all referenced images |
@y
| Flag         | Type    | Default | Description                |
| ------------ | ------- | ------- | -------------------------- |
| `--dry-run`  | boolean | false   | Print Dockerfile only      |
| `--push`     | boolean | false   | Push image after build     |
| `--no-cache` | boolean | false   | Build without cache        |
| `--pull`     | boolean | false   | Pull all referenced images |
@z

@x
Example:
@y
Example:
@z

@x
```console
$ cagent build ./agent.yaml myagent:latest
$ cagent build ./agent.yaml --dry-run
```
@y
```console
$ cagent build ./agent.yaml myagent:latest
$ cagent build ./agent.yaml --dry-run
```
@z

@x
### catalog list
@y
### catalog list
@z

@x
List catalog agents.
@y
List catalog agents.
@z

@x
```console
$ cagent catalog list [org]
```
@y
```console
$ cagent catalog list [org]
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `org` - Organization name (optional, default: `agentcatalog`)
@y
- `org` - Organization name (optional, default: `agentcatalog`)
@z

@x
Queries Docker Hub for agent repositories.
@y
Queries Docker Hub for agent repositories.
@z

@x
### debug config
@y
### debug config
@z

@x
Show resolved agent configuration.
@y
Show resolved agent configuration.
@z

@x
```console
$ cagent debug config agent-file|registry-ref
```
@y
```console
$ cagent debug config agent-file|registry-ref
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Shows canonical configuration in YAML after all processing and defaults.
@y
Shows canonical configuration in YAML after all processing and defaults.
@z

@x
### debug toolsets
@y
### debug toolsets
@z

@x
List agent tools.
@y
List agent tools.
@z

@x
```console
$ cagent debug toolsets agent-file|registry-ref
```
@y
```console
$ cagent debug toolsets agent-file|registry-ref
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Lists all tools for each agent in the configuration.
@y
Lists all tools for each agent in the configuration.
@z

@x
### eval
@y
### eval
@z

@x
Run evaluation tests.
@y
Run evaluation tests.
@z

@x
```console
$ cagent eval agent-file|registry-ref [eval-dir]
```
@y
```console
$ cagent eval agent-file|registry-ref [eval-dir]
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
- `eval-dir` - Evaluation files directory (optional, default: `./evals`)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
- `eval-dir` - Evaluation files directory (optional, default: `./evals`)
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
### exec
@y
### exec
@z

@x
Single message execution without TUI.
@y
Single message execution without TUI.
@z

@x
```console
$ cagent exec agent-file|registry-ref [message|-]
```
@y
```console
$ cagent exec agent-file|registry-ref [message|-]
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
- `message` - Prompt, or `-` for stdin (optional)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
- `message` - Prompt, or `-` for stdin (optional)
@z

@x
Same flags as [run](#run).
@y
Same flags as [run](#run).
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Examples:
@y
Examples:
@z

@x
```console
$ cagent exec ./agent.yaml
$ cagent exec ./agent.yaml "Check for security issues"
$ echo "Instructions" | cagent exec ./agent.yaml -
```
@y
```console
$ cagent exec ./agent.yaml
$ cagent exec ./agent.yaml "Check for security issues"
$ echo "Instructions" | cagent exec ./agent.yaml -
```
@z

@x
### feedback
@y
### feedback
@z

@x
Submit feedback.
@y
Submit feedback.
@z

@x
```console
$ cagent feedback
```
@y
```console
$ cagent feedback
```
@z

@x
Shows link to submit feedback.
@y
Shows link to submit feedback.
@z

@x
### mcp
@y
### mcp
@z

@x
MCP (Model Context Protocol) server on stdio. Exposes agents as tools to MCP
clients. See [MCP integration](../integrations/mcp.md) for setup guides.
@y
MCP (Model Context Protocol) server on stdio. Exposes agents as tools to MCP
clients. See [MCP integration](../integrations/mcp.md) for setup guides.
@z

@x
```console
$ cagent mcp agent-file|registry-ref
```
@y
```console
$ cagent mcp agent-file|registry-ref
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (required)
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Examples:
@y
Examples:
@z

@x
```console
$ cagent mcp ./agent.yaml
$ cagent mcp docker.io/user/agent:latest
```
@y
```console
$ cagent mcp ./agent.yaml
$ cagent mcp docker.io/user/agent:latest
```
@z

@x
### new
@y
### new
@z

@x
Create agent configuration interactively.
@y
Create agent configuration interactively.
@z

@x
```console
$ cagent new [message...]
```
@y
```console
$ cagent new [message...]
```
@z

@x
Flags:
@y
Flags:
@z

@x
| Flag               | Type    | Default | Description                     |
| ------------------ | ------- | ------- | ------------------------------- |
| `--model`          | string  | -       | Model as `provider/model`       |
| `--max-iterations` | integer | 0       | Maximum agentic loop iterations |
@y
| Flag               | Type    | Default | Description                     |
| ------------------ | ------- | ------- | ------------------------------- |
| `--model`          | string  | -       | Model as `provider/model`       |
| `--max-iterations` | integer | 0       | Maximum agentic loop iterations |
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Opens interactive TUI to configure and generate agent YAML.
@y
Opens interactive TUI to configure and generate agent YAML.
@z

@x
### pull
@y
### pull
@z

@x
Pull agent from OCI registry.
@y
Pull agent from OCI registry.
@z

@x
```console
$ cagent pull registry-ref
```
@y
```console
$ cagent pull registry-ref
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `registry-ref` - OCI registry reference (required)
@y
- `registry-ref` - OCI registry reference (required)
@z

@x
Flags:
@y
Flags:
@z

@x
| Flag      | Type    | Default | Description                 |
| --------- | ------- | ------- | --------------------------- |
| `--force` | boolean | false   | Pull even if already exists |
@y
| Flag      | Type    | Default | Description                 |
| --------- | ------- | ------- | --------------------------- |
| `--force` | boolean | false   | Pull even if already exists |
@z

@x
Example:
@y
Example:
@z

@x
```console
$ cagent pull docker.io/user/agent:latest
```
@y
```console
$ cagent pull docker.io/user/agent:latest
```
@z

@x
Saves to local YAML file.
@y
Saves to local YAML file.
@z

@x
### push
@y
### push
@z

@x
Push agent to OCI registry.
@y
Push agent to OCI registry.
@z

@x
```console
$ cagent push agent-file registry-ref
```
@y
```console
$ cagent push agent-file registry-ref
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file` - Path to local YAML (required)
- `registry-ref` - OCI reference like `docker.io/user/agent:latest` (required)
@y
- `agent-file` - Path to local YAML (required)
- `registry-ref` - OCI reference like `docker.io/user/agent:latest` (required)
@z

@x
Example:
@y
Example:
@z

@x
```console
$ cagent push ./agent.yaml docker.io/myuser/myagent:latest
```
@y
```console
$ cagent push ./agent.yaml docker.io/myuser/myagent:latest
```
@z

@x
### run
@y
### run
@z

@x
Interactive terminal UI for agent sessions.
@y
Interactive terminal UI for agent sessions.
@z

@x
```console
$ cagent run [agent-file|registry-ref] [message|-]
```
@y
```console
$ cagent run [agent-file|registry-ref] [message|-]
```
@z

@x
Arguments:
@y
Arguments:
@z

@x
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (optional)
- `message` - Initial prompt, or `-` for stdin (optional)
@y
- `agent-file|registry-ref` - Path to YAML or OCI registry reference (optional)
- `message` - Initial prompt, or `-` for stdin (optional)
@z

@x
Flags:
@y
Flags:
@z

@x
| Flag            | Type    | Default | Description                  |
| --------------- | ------- | ------- | ---------------------------- |
| `-a`, `--agent` | string  | root    | Agent name                   |
| `--yolo`        | boolean | false   | Auto-approve all tool calls  |
| `--attach`      | string  | -       | Attach image file            |
| `--model`       | array   | -       | Override model (repeatable)  |
| `--dry-run`     | boolean | false   | Initialize without executing |
| `--remote`      | string  | -       | Remote runtime address       |
@y
| Flag            | Type    | Default | Description                  |
| --------------- | ------- | ------- | ---------------------------- |
| `-a`, `--agent` | string  | root    | Agent name                   |
| `--yolo`        | boolean | false   | Auto-approve all tool calls  |
| `--attach`      | string  | -       | Attach image file            |
| `--model`       | array   | -       | Override model (repeatable)  |
| `--dry-run`     | boolean | false   | Initialize without executing |
| `--remote`      | string  | -       | Remote runtime address       |
@z

@x
Supports [runtime flags](#runtime-flags).
@y
Supports [runtime flags](#runtime-flags).
@z

@x
Examples:
@y
Examples:
@z

@x
```console
$ cagent run ./agent.yaml
$ cagent run ./agent.yaml "Analyze this codebase"
$ cagent run ./agent.yaml --agent researcher
$ echo "Instructions" | cagent run ./agent.yaml -
$ cagent run
```
@y
```console
$ cagent run ./agent.yaml
$ cagent run ./agent.yaml "Analyze this codebase"
$ cagent run ./agent.yaml --agent researcher
$ echo "Instructions" | cagent run ./agent.yaml -
$ cagent run
```
@z

@x
Running without arguments uses the default agent or a "default" alias if configured.
@y
Running without arguments uses the default agent or a "default" alias if configured.
@z

@x
Shows interactive TUI in a terminal. Falls back to exec mode otherwise.
@y
Shows interactive TUI in a terminal. Falls back to exec mode otherwise.
@z

@x
#### Interactive commands
@y
#### Interactive commands
@z

@x
TUI slash commands:
@y
TUI slash commands:
@z

@x
| Command    | Description                      |
| ---------- | -------------------------------- |
| `/exit`    | Exit                             |
| `/reset`   | Clear history                    |
| `/eval`    | Save conversation for evaluation |
| `/compact` | Compact conversation             |
| `/yolo`    | Toggle auto-approval             |
@y
| Command    | Description                      |
| ---------- | -------------------------------- |
| `/exit`    | Exit                             |
| `/reset`   | Clear history                    |
| `/eval`    | Save conversation for evaluation |
| `/compact` | Compact conversation             |
| `/yolo`    | Toggle auto-approval             |
@z

@x
### version
@y
### version
@z

@x
Print version information.
@y
Print version information.
@z

@x
```console
$ cagent version
```
@y
```console
$ cagent version
```
@z

@x
Shows cagent version and commit hash.
@y
Shows cagent version and commit hash.
@z

@x
## Environment variables
@y
## Environment variables
@z

@x
| Variable                       | Description                     |
| ------------------------------ | ------------------------------- |
| `CAGENT_MODELS_GATEWAY`        | Models gateway address          |
| `TELEMETRY_ENABLED`            | Telemetry control (set `false`) |
| `CAGENT_HIDE_TELEMETRY_BANNER` | Hide telemetry banner (set `1`) |
| `OTEL_EXPORTER_OTLP_ENDPOINT`  | OpenTelemetry endpoint          |
@y
| Variable                       | Description                     |
| ------------------------------ | ------------------------------- |
| `CAGENT_MODELS_GATEWAY`        | Models gateway address          |
| `TELEMETRY_ENABLED`            | Telemetry control (set `false`) |
| `CAGENT_HIDE_TELEMETRY_BANNER` | Hide telemetry banner (set `1`) |
| `OTEL_EXPORTER_OTLP_ENDPOINT`  | OpenTelemetry endpoint          |
@z

@x
## Model overrides
@y
## Model overrides
@z

@x
Override models specified in your configuration file using the `--model` flag.
@y
Override models specified in your configuration file using the `--model` flag.
@z

@x
Format: `[agent=]provider/model`
@y
Format: `[agent=]provider/model`
@z

@x
Without an agent name, the model applies to all agents. With an agent name, it applies only to that specific agent.
@y
Without an agent name, the model applies to all agents. With an agent name, it applies only to that specific agent.
@z

@x
Apply to all agents:
@y
Apply to all agents:
@z

@x
```console
$ cagent run ./agent.yaml --model gpt-5
$ cagent run ./agent.yaml --model anthropic/claude-sonnet-4-5
```
@y
```console
$ cagent run ./agent.yaml --model gpt-5
$ cagent run ./agent.yaml --model anthropic/claude-sonnet-4-5
```
@z

@x
Apply to specific agents only:
@y
Apply to specific agents only:
@z

@x
```console
$ cagent run ./agent.yaml --model researcher=gpt-5
$ cagent run ./agent.yaml --model "agent1=gpt-5,agent2=claude-sonnet-4-5"
```
@y
```console
$ cagent run ./agent.yaml --model researcher=gpt-5
$ cagent run ./agent.yaml --model "agent1=gpt-5,agent2=claude-sonnet-4-5"
```
@z

@x
Providers: `openai`, `anthropic`, `google`, `dmr`
@y
Providers: `openai`, `anthropic`, `google`, `dmr`
@z

@x
Omit provider for automatic selection based on model name.
@y
Omit provider for automatic selection based on model name.
@z
