%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Troubleshooting"
description: "Common issues and how to resolve them when working with Docker Agent."
keywords: docker agent, ai agents, community, troubleshooting
@y
title: "Troubleshooting"
description: "Common issues and how to resolve them when working with Docker Agent."
keywords: docker agent, ai agents, community, troubleshooting
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/community/troubleshooting/
@y
canonical: __SUBDIR__/ai/docker-agent/community/troubleshooting/
@z

@x
_Common issues and how to resolve them when working with Docker Agent._
@y
_Common issues and how to resolve them when working with Docker Agent._
@z

@x
## Common Errors
@y
## Common Errors
@z

@x
### Context Window Exceeded
@y
### Context Window Exceeded
@z

@x
Error message: `context_length_exceeded` or similar.
@y
Error message: `context_length_exceeded` or similar.
@z

@x
- Use `/compact` in the TUI to summarize and reduce conversation history
- Set `num_history_items` in agent config to limit messages sent to the model
- Switch to a model with larger context (Claude Sonnet 4.5 supports 1M tokens, Gemini up to 2M)
- Break large tasks into smaller conversations
@y
- Use `/compact` in the TUI to summarize and reduce conversation history
- Set `num_history_items` in agent config to limit messages sent to the model
- Switch to a model with larger context (Claude Sonnet 4.5 supports 1M tokens, Gemini up to 2M)
- Break large tasks into smaller conversations
@z

@x
### Max Iterations Reached
@y
### Max Iterations Reached
@z

@x
The agent hit its `max_iterations` limit without completing the task.
@y
The agent hit its `max_iterations` limit without completing the task.
@z

@x
- Increase `max_iterations` in agent config (default is unlimited, but many agents set 20-50)
- Check if the agent is stuck in a loop (enable `--debug` to see tool calls)
- Break complex tasks into smaller steps
@y
- Increase `max_iterations` in agent config (default is unlimited, but many agents set 20-50)
- Check if the agent is stuck in a loop (enable `--debug` to see tool calls)
- Break complex tasks into smaller steps
@z

@x
### Model Fallback Triggered
@y
### Model Fallback Triggered
@z

@x
When the primary model fails, Docker Agent automatically switches to fallback models. Look for log messages like `"Switching to fallback model"`.
@y
When the primary model fails, Docker Agent automatically switches to fallback models. Look for log messages like `"Switching to fallback model"`.
@z

@x
- **429 errors:** Rate limited — the cooldown period keeps using the fallback
- **5xx errors:** Server issues — retries with exponential backoff first, then falls back
- **4xx errors:** Client errors — skips directly to next model
@y
- **429 errors:** Rate limited — the cooldown period keeps using the fallback
- **5xx errors:** Server issues — retries with exponential backoff first, then falls back
- **4xx errors:** Client errors — skips directly to next model
@z

@x
Configure fallback behavior in your agent config:
@y
Configure fallback behavior in your agent config:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    fallback:
      models: [openai/gpt-5-mini, openai/gpt-4o-mini]
      retries: 2 # retries per model for 5xx errors
      cooldown: 1m # how long to stick with fallback after 429
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    fallback:
      models: [openai/gpt-5-mini, openai/gpt-4o-mini]
      retries: 2 # retries per model for 5xx errors
      cooldown: 1m # how long to stick with fallback after 429
```
@z

@x
## Missing credentials or model errors
@y
## Missing credentials or model errors
@z

@x
When Docker Agent can't find a usable model at startup, it fails fast with an actionable error. The message names the exact next step. `docker agent doctor` is the fastest way to see the full picture — which providers have credentials, whether Docker Model Runner is reachable, and which model `auto` would pick.
@y
When Docker Agent can't find a usable model at startup, it fails fast with an actionable error. The message names the exact next step. `docker agent doctor` is the fastest way to see the full picture — which providers have credentials, whether Docker Model Runner is reachable, and which model `auto` would pick.
@z

@x
### Required environment variables not set
@y
### Required environment variables not set
@z

@x
An agent (or a tool it uses) depends on environment variables that aren't configured:
@y
An agent (or a tool it uses) depends on environment variables that aren't configured:
@z

@x
```text
The following environment variables must be set:
 - ANTHROPIC_API_KEY
@y
```text
The following environment variables must be set:
 - ANTHROPIC_API_KEY
@z

@x
Provide them using any of these sources:
 - Shell environment:      export ANTHROPIC_API_KEY=<value>
 - Env file:               docker agent run --env-from-file <file> ...
 - Docker Agent env file:  docker agent setup (stores the key in ~/.config/cagent/.env)
@y
Provide them using any of these sources:
 - Shell environment:      export ANTHROPIC_API_KEY=<value>
 - Env file:               docker agent run --env-from-file <file> ...
 - Docker Agent env file:  docker agent setup (stores the key in ~/.config/cagent/.env)
@z

@x
See https://docs.docker.com/ai/docker-agent/guides/secrets/ for details.
```
@y
See https://docs.docker.com/ai/docker-agent/guides/secrets/ for details.
```
@z

@x
Set the variable through any of the listed [secret sources](../../guides/secrets/index.md). When the missing variable is a model-provider API key, the error also suggests running a local model instead (`docker agent run --model dmr/ai/qwen3 ...`), which needs no API key, and links to the [Set Up a Model](../../getting-started/set-up-a-model/index.md) tutorial.
@y
Set the variable through any of the listed [secret sources](../../guides/secrets/index.md). When the missing variable is a model-provider API key, the error also suggests running a local model instead (`docker agent run --model dmr/ai/qwen3 ...`), which needs no API key, and links to the [Set Up a Model](../../getting-started/set-up-a-model/index.md) tutorial.
@z

@x
### No model available (`auto` selection failed)
@y
### No model available (`auto` selection failed)
@z

@x
The `auto` model selector found no configured cloud provider and no usable Docker Model Runner model:
@y
The `auto` model selector found no configured cloud provider and no usable Docker Model Runner model:
@z

@x
```text
No model is currently available.
@y
```text
No model is currently available.
@z

@x
To fix this, you can:
  - Pull a Docker Model Runner model, e.g. `docker model pull ai/qwen3`
  - Install Docker Model Runner: https://docs.docker.com/ai/model-runner/get-started/
  - Configure an API key for a cloud provider:
    - anthropic: ANTHROPIC_API_KEY
    - openai: OPENAI_API_KEY
    ...
```
@y
To fix this, you can:
  - Pull a Docker Model Runner model, e.g. `docker model pull ai/qwen3`
  - Install Docker Model Runner: https://docs.docker.com/ai/model-runner/get-started/
  - Configure an API key for a cloud provider:
    - anthropic: ANTHROPIC_API_KEY
    - openai: OPENAI_API_KEY
    ...
```
@z

@x
Either configure a cloud provider API key (see [API keys not set](#api-keys-not-set) below) or pull a local model. The [Set Up a Model](../../getting-started/set-up-a-model/index.md) tutorial walks through both paths. Run `docker agent doctor` to see which providers have credentials and whether Docker Model Runner is reachable.
@y
Either configure a cloud provider API key (see [API keys not set](#api-keys-not-set) below) or pull a local model. The [Set Up a Model](../../getting-started/set-up-a-model/index.md) tutorial walks through both paths. Run `docker agent doctor` to see which providers have credentials and whether Docker Model Runner is reachable.
@z

@x
### Docker Model Runner model not pulled
@y
### Docker Model Runner model not pulled
@z

@x
A `dmr/...` model was requested but isn't available locally:
@y
A `dmr/...` model was requested but isn't available locally:
@z

@x
```text
model ai/qwen3 is not pulled in Docker Model Runner
@y
```text
model ai/qwen3 is not pulled in Docker Model Runner
@z

@x
To resolve this, you can:
  - Pull it first: docker model pull ai/qwen3
  - Or choose a model that is already available (see `docker model ls`).
```
@y
To resolve this, you can:
  - Pull it first: docker model pull ai/qwen3
  - Or choose a model that is already available (see `docker model ls`).
```
@z

@x
If instead you see `cannot query Docker Model Runner at <url>`, Docker Model Runner isn't installed or running — see the [Model Runner get-started guide](https://docs.docker.com/ai/model-runner/get-started/).
@y
If instead you see `cannot query Docker Model Runner at <url>`, Docker Model Runner isn't installed or running — see the [Model Runner get-started guide](https://docs.docker.com/ai/model-runner/get-started/).
@z

@x
> [!TIP]
> **Diagnose before you run**
>
> Run `docker agent doctor` (or `docker agent doctor ./agent.yaml` to include a file's requirements) to check all three issues in one shot. It exits non-zero when something would block a run, making it useful as a CI preflight. See the [CLI reference](../../features/cli/index.md#docker-agent-doctor).
@y
> [!TIP]
> **Diagnose before you run**
>
> Run `docker agent doctor` (or `docker agent doctor ./agent.yaml` to include a file's requirements) to check all three issues in one shot. It exits non-zero when something would block a run, making it useful as a CI preflight. See the [CLI reference](../../features/cli/index.md#docker-agent-doctor).
@z

@x
## Debug Mode
@y
## Debug Mode
@z

@x
The first step for any issue is enabling debug logging. This provides detailed information about what Docker Agent is doing internally.
@y
The first step for any issue is enabling debug logging. This provides detailed information about what Docker Agent is doing internally.
@z

@x
```bash
# Enable debug logging (writes to ~/.cagent/cagent.debug.log)
$ docker agent run config.yaml --debug
@y
```bash
# Enable debug logging (writes to ~/.cagent/cagent.debug.log)
$ docker agent run config.yaml --debug
@z

@x
# Write debug logs to a custom file
$ docker agent run config.yaml --debug --log-file ./debug.log
@y
# Write debug logs to a custom file
$ docker agent run config.yaml --debug --log-file ./debug.log
@z

@x
# Enable OpenTelemetry tracing for deeper analysis
$ docker agent run config.yaml --otel
```
@y
# Enable OpenTelemetry tracing for deeper analysis
$ docker agent run config.yaml --otel
```
@z

@x
> [!TIP]
> Always enable `--debug` when reporting issues. The log file contains detailed traces of API calls, tool executions, and agent interactions.
@y
> [!TIP]
> Always enable `--debug` when reporting issues. The log file contains detailed traces of API calls, tool executions, and agent interactions.
@z

@x
## Agent Not Responding
@y
## Agent Not Responding
@z

@x
### API keys not set
@y
### API keys not set
@z

@x
Each model provider requires its own API key as an environment variable:
@y
Each model provider requires its own API key as an environment variable:
@z

@x
| Provider      | Environment Variable                                |
| ------------- | --------------------------------------------------- |
| OpenAI        | `OPENAI_API_KEY`                                    |
| Anthropic     | `ANTHROPIC_API_KEY`                                 |
| Google Gemini | `GOOGLE_API_KEY` or `GEMINI_API_KEY`                |
| Mistral       | `MISTRAL_API_KEY`                                   |
| xAI           | `XAI_API_KEY`                                       |
| Nebius        | `NEBIUS_API_KEY`                                    |
| MiniMax       | `MINIMAX_API_KEY`                                   |
| Requesty      | `REQUESTY_API_KEY`                                  |
| OpenRouter    | `OPENROUTER_API_KEY`                                |
| GitHub Copilot | `GITHUB_TOKEN` (PAT with `copilot` scope)          |
| Azure OpenAI  | `AZURE_API_KEY` (override with `token_key`)         |
| AWS Bedrock   | `AWS_BEARER_TOKEN_BEDROCK` or AWS credentials chain |
@y
| Provider      | Environment Variable                                |
| ------------- | --------------------------------------------------- |
| OpenAI        | `OPENAI_API_KEY`                                    |
| Anthropic     | `ANTHROPIC_API_KEY`                                 |
| Google Gemini | `GOOGLE_API_KEY` or `GEMINI_API_KEY`                |
| Mistral       | `MISTRAL_API_KEY`                                   |
| xAI           | `XAI_API_KEY`                                       |
| Nebius        | `NEBIUS_API_KEY`                                    |
| MiniMax       | `MINIMAX_API_KEY`                                   |
| Requesty      | `REQUESTY_API_KEY`                                  |
| OpenRouter    | `OPENROUTER_API_KEY`                                |
| GitHub Copilot | `GITHUB_TOKEN` (PAT with `copilot` scope)          |
| Azure OpenAI  | `AZURE_API_KEY` (override with `token_key`)         |
| AWS Bedrock   | `AWS_BEARER_TOKEN_BEDROCK` or AWS credentials chain |
@z

@x
```bash
# Verify your keys are set
$ env | grep API_KEY
```
@y
```bash
# Verify your keys are set
$ env | grep API_KEY
```
@z

@x
### Incorrect model name
@y
### Incorrect model name
@z

@x
Model names must match the provider's naming exactly. Common mistakes:
@y
Model names must match the provider's naming exactly. Common mistakes:
@z

@x
- Using a deprecated model name (e.g. `gpt-4` instead of `gpt-5-mini` or `gpt-4o`)
- Model references are case-sensitive: `openai/gpt-5-mini` ≠ `openai/GPT-5-mini`
@y
- Using a deprecated model name (e.g. `gpt-4` instead of `gpt-5-mini` or `gpt-4o`)
- Model references are case-sensitive: `openai/gpt-5-mini` ≠ `openai/GPT-5-mini`
@z

@x
### Network connectivity
@y
### Network connectivity
@z

@x
If the agent hangs or times out, check that you can reach the provider's API endpoint. Firewalls, VPNs, or proxy settings may block requests.
@y
If the agent hangs or times out, check that you can reach the provider's API endpoint. Firewalls, VPNs, or proxy settings may block requests.
@z

@x
## Tool Execution Failures
@y
## Tool Execution Failures
@z

@x
### MCP tools not found or failing
@y
### MCP tools not found or failing
@z

@x
- Ensure the MCP tool command is installed and on your `PATH`
- Check file permissions — tools need to be executable
- Test MCP tools independently before integrating with Docker Agent
- For Docker-based MCP tools (`ref: docker:*`), ensure Docker Desktop is running
@y
- Ensure the MCP tool command is installed and on your `PATH`
- Check file permissions — tools need to be executable
- Test MCP tools independently before integrating with Docker Agent
- For Docker-based MCP tools (`ref: docker:*`), ensure Docker Desktop is running
@z

@x
### Filesystem / shell tool errors
@y
### Filesystem / shell tool errors
@z

@x
- Verify the agent has the correct toolset configured (`type: filesystem`, `type: shell`)
- Check that the working directory exists and is accessible
- On macOS, ensure terminal has the necessary permissions (e.g., Full Disk Access)
@y
- Verify the agent has the correct toolset configured (`type: filesystem`, `type: shell`)
- Check that the working directory exists and is accessible
- On macOS, ensure terminal has the necessary permissions (e.g., Full Disk Access)
@z

@x
### Tool lifecycle issues
@y
### Tool lifecycle issues
@z

@x
MCP and LSP toolsets are managed by a supervisor that auto-restarts them when they crash or drop their session. The TUI exposes that supervisor through two slash commands:
@y
MCP and LSP toolsets are managed by a supervisor that auto-restarts them when they crash or drop their session. The TUI exposes that supervisor through two slash commands:
@z

@x
- `/tools` — the unified tools dialog. Its top section lists every toolset with its current state (`Stopped`, `Starting`, `Ready`, `Degraded`, `Restarting`, `Failed`), restart count, and last error; the bottom section lists every tool the agent can call. Start here whenever a tool seems missing or stuck.
- `/toolset-restart <name>` — force a supervisor-driven reconnect of the named toolset. Useful after completing OAuth, when a remote MCP server has been redeployed, or when a language server like `gopls` is unresponsive.
@y
- `/tools` — the unified tools dialog. Its top section lists every toolset with its current state (`Stopped`, `Starting`, `Ready`, `Degraded`, `Restarting`, `Failed`), restart count, and last error; the bottom section lists every tool the agent can call. Start here whenever a tool seems missing or stuck.
- `/toolset-restart <name>` — force a supervisor-driven reconnect of the named toolset. Useful after completing OAuth, when a remote MCP server has been redeployed, or when a language server like `gopls` is unresponsive.
@z

@x
Remote MCP servers that return `401 invalid_token` (e.g. because the stored OAuth token was revoked or rotated) are now self-healing: Docker Agent silently exchanges the refresh token for a new one when possible, or surfaces an OAuth re-authentication prompt on your next message when refresh is not possible. No more stuck toolsets that require a process restart — but if you want to trigger re-auth immediately, `/toolset-restart <name>` forces it right away.
@y
Remote MCP servers that return `401 invalid_token` (e.g. because the stored OAuth token was revoked or rotated) are now self-healing: Docker Agent silently exchanges the refresh token for a new one when possible, or surfaces an OAuth re-authentication prompt on your next message when refresh is not possible. No more stuck toolsets that require a process restart — but if you want to trigger re-auth immediately, `/toolset-restart <name>` forces it right away.
@z

@x
MCP tools using stdio transport must complete the initialization handshake before becoming available. If tools fail silently:
@y
MCP tools using stdio transport must complete the initialization handshake before becoming available. If tools fail silently:
@z

@x
1. Run `/tools` to see whether the toolset is `Failed` or stuck in `Restarting`, and what the last error was.
2. Enable `--debug` and look for MCP protocol messages in the log
3. Check that the MCP server process starts and responds to `initialize`
4. Verify environment variables required by the tool are set (check `env` and `env_file` in the toolset config)
@y
1. Run `/tools` to see whether the toolset is `Failed` or stuck in `Restarting`, and what the last error was.
2. Enable `--debug` and look for MCP protocol messages in the log
3. Check that the MCP server process starts and responds to `initialize`
4. Verify environment variables required by the tool are set (check `env` and `env_file` in the toolset config)
@z

@x
> [!NOTE]
> **Startup tool-listing timeout**
>
> At startup, Docker Agent queries each toolset for its tool list. If a toolset does not respond within 10 seconds (e.g. a wedged MCP stdio server that never answers `tools/list`), that toolset is skipped with a warning and the remaining toolsets load normally. The sidebar resolves showing whichever tools did load — no infinite spinner. Enable `--debug` to see the warning message, and use `/toolset-restart <name>` once the server becomes responsive.
@y
> [!NOTE]
> **Startup tool-listing timeout**
>
> At startup, Docker Agent queries each toolset for its tool list. If a toolset does not respond within 10 seconds (e.g. a wedged MCP stdio server that never answers `tools/list`), that toolset is skipped with a warning and the remaining toolsets load normally. The sidebar resolves showing whichever tools did load — no infinite spinner. Enable `--debug` to see the warning message, and use `/toolset-restart <name>` once the server becomes responsive.
@z

@x
If a toolset keeps crashing in a tight loop, tune the [`lifecycle`](../../configuration/tools/index.md#toolset-lifecycle) block on the toolset (e.g. raise `backoff.initial`, lower `max_restarts`, or switch to the `best-effort` profile) so a flaky dependency does not amplify into a restart storm.
@y
If a toolset keeps crashing in a tight loop, tune the [`lifecycle`](../../configuration/tools/index.md#toolset-lifecycle) block on the toolset (e.g. raise `backoff.initial`, lower `max_restarts`, or switch to the `best-effort` profile) so a flaky dependency does not amplify into a restart storm.
@z

@x
## Configuration Errors
@y
## Configuration Errors
@z

@x
### YAML syntax issues
@y
### YAML syntax issues
@z

@x
Docker Agent validates config at startup and reports errors with line numbers. Common problems:
@y
Docker Agent validates config at startup and reports errors with line numbers. Common problems:
@z

@x
- Incorrect indentation (YAML is whitespace-sensitive)
- Missing quotes around values containing special characters (`:`, `#`, `{`, `}`)
- Using tabs instead of spaces
@y
- Incorrect indentation (YAML is whitespace-sensitive)
- Missing quotes around values containing special characters (`:`, `#`, `{`, `}`)
- Using tabs instead of spaces
@z

@x
### Missing references
@y
### Missing references
@z

@x
- Local agents in `sub_agents` must be defined in the `agents` section (external OCI references like `myorg/agent:tag` are resolved from registries automatically)
- Named model references must exist in the `models` section (or use inline format like `openai/gpt-5`)
- RAG source names referenced by agents must be defined in the `rag` section
@y
- Local agents in `sub_agents` must be defined in the `agents` section (external OCI references like `myorg/agent:tag` are resolved from registries automatically)
- Named model references must exist in the `models` section (or use inline format like `openai/gpt-5`)
- RAG source names referenced by agents must be defined in the `rag` section
@z

@x
### Toolset validation
@y
### Toolset validation
@z

@x
- The `path` field is valid for `memory` and `tasks` toolsets, and for the agent-level `cache` block
- MCP toolsets need either `command` (stdio), `remote` (Streamable HTTP/SSE), or `ref` (Docker)
- Provider names must be one of: `openai`, `anthropic`, `google`, `amazon-bedrock`, `dmr`, etc.
@y
- The `path` field is valid for `memory` and `tasks` toolsets, and for the agent-level `cache` block
- MCP toolsets need either `command` (stdio), `remote` (Streamable HTTP/SSE), or `ref` (Docker)
- Provider names must be one of: `openai`, `anthropic`, `google`, `amazon-bedrock`, `dmr`, etc.
@z

@x
> [!NOTE]
> **Schema Validation**
>
> Use the [JSON schema](https://github.com/docker/docker-agent/blob/main/agent-schema.json) in your editor for real-time config validation and autocompletion.
@y
> [!NOTE]
> **Schema Validation**
>
> Use the [JSON schema](https://github.com/docker/docker-agent/blob/main/agent-schema.json) in your editor for real-time config validation and autocompletion.
@z

@x
## Session &amp; Connectivity Issues
@y
## Session &amp; Connectivity Issues
@z

@x
### Downgrade fails with a newer-database error
@y
### Downgrade fails with a newer-database error
@z

@x
If an older Docker Agent binary cannot open the session database after an upgrade,
the database may contain a schema migration that the older binary does not know.
Restore a database created by the older version, or use a binary that includes the
migration.
@y
If an older Docker Agent binary cannot open the session database after an upgrade,
the database may contain a schema migration that the older binary does not know.
Restore a database created by the older version, or use a binary that includes the
migration.
@z

@x
### Port conflicts
@y
### Port conflicts
@z

@x
When running Docker Agent as an API server or MCP server, ensure the port is not already in use:
@y
When running Docker Agent as an API server or MCP server, ensure the port is not already in use:
@z

@x
```bash
# Check if port 8080 is in use
$ lsof -i :8080
@y
```bash
# Check if port 8080 is in use
$ lsof -i :8080
@z

@x
# Use a different port
$ docker agent serve api config.yaml --listen :9090
```
@y
# Use a different port
$ docker agent serve api config.yaml --listen :9090
```
@z

@x
### MCP endpoint accessibility
@y
### MCP endpoint accessibility
@z

@x
For remote MCP servers, verify the endpoint is reachable:
@y
For remote MCP servers, verify the endpoint is reachable:
@z

@x
```bash
# Test streamable HTTP endpoint
$ curl -v https://mcp-server.example.com/mcp
```
@y
```bash
# Test streamable HTTP endpoint
$ curl -v https://mcp-server.example.com/mcp
```
@z

@x
### Session isolation
@y
### Session isolation
@z

@x
The API server stores every conversation as a distinct session in the SQLite database (`session.db` by default). Each session is identified by its UUID and only mixes messages when the same session ID is reused. If conversations seem to bleed into each other:
@y
The API server stores every conversation as a distinct session in the SQLite database (`session.db` by default). Each session is identified by its UUID and only mixes messages when the same session ID is reused. If conversations seem to bleed into each other:
@z

@x
- Make sure each client creates a fresh session via `POST /api/sessions` (don't reuse session IDs across users).
- Confirm `--session-db` points to the path you expect — a stale database from another run can resurface old sessions.
- Use `GET /api/sessions/:id` to inspect what is actually stored, and `DELETE /api/sessions/:id` to clear sessions you don't want anymore.
@y
- Make sure each client creates a fresh session via `POST /api/sessions` (don't reuse session IDs across users).
- Confirm `--session-db` points to the path you expect — a stale database from another run can resurface old sessions.
- Use `GET /api/sessions/:id` to inspect what is actually stored, and `DELETE /api/sessions/:id` to clear sessions you don't want anymore.
@z

@x
### HTTP 413: request body too large
@y
### HTTP 413: request body too large
@z

@x
Three kinds of process reject an oversized request body with `413 Request Entity Too Large`: `docker agent serve api`, `docker agent serve chat`, and an interactive run's control plane ([`docker agent run --listen`](../../features/api-server/index.md#listen)). They aren't configured the same way: `serve api` and `serve chat` each expose their own `--max-request-size` flag (1 MiB default). A `--listen` control plane has no such flag — it enforces a fixed, non-configurable 1 MiB limit — and no `--auth-token` either. Work through these layers in order:
@y
Three kinds of process reject an oversized request body with `413 Request Entity Too Large`: `docker agent serve api`, `docker agent serve chat`, and an interactive run's control plane ([`docker agent run --listen`](../../features/api-server/index.md#listen)). They aren't configured the same way: `serve api` and `serve chat` each expose their own `--max-request-size` flag (1 MiB default). A `--listen` control plane has no such flag — it enforces a fixed, non-configurable 1 MiB limit — and no `--auth-token` either. Work through these layers in order:
@z

@x
1. **Identify which server is involved.** `serve api`, `serve chat`, and an attached run's `--listen` control plane are three separate kinds of process. `serve api` and `serve chat` each have their own `--max-request-size` flag and 1 MiB default — check the flags the process that returned the 413 was actually started with. A `--listen` control plane has no `--max-request-size` flag: its 1 MiB cap is fixed.
2. **Measure the serialized request body, not a source file's size.** JSON string escaping and, for any base64-encoded binary content, base64's ~33% expansion both inflate the wire size well past the original file size — a file just under the limit can still push the encoded request over it.
3. **Rule out an intermediary.** If a reverse proxy, gateway, or load balancer sits in front of Docker Agent, it usually enforces its own, independent body-size limit — often with a differently formatted error — and can reject the request before Docker Agent ever sees it.
4. **Confirm who actually returned the error.** A 413 (or a context-length error) can also come from the model provider itself once the request reaches it; that is a separate limit unrelated to `--max-request-size` — see [Context Window Exceeded](#context-window-exceeded) above.
5. **Resolve it.** Once you've confirmed Docker Agent's own server rejected the request, send less content — split it across turns. On `serve api` or `serve chat` you can also restart the server with a deliberately chosen, larger `--max-request-size` (see [API Server](../../features/api-server/index.md#cli-flags) or [Chat Server](../../features/chat-server/index.md#cli-flags)). A `--listen` control plane has no `--max-request-size` flag to raise — sending less content is the only fix.
@y
1. **Identify which server is involved.** `serve api`, `serve chat`, and an attached run's `--listen` control plane are three separate kinds of process. `serve api` and `serve chat` each have their own `--max-request-size` flag and 1 MiB default — check the flags the process that returned the 413 was actually started with. A `--listen` control plane has no `--max-request-size` flag: its 1 MiB cap is fixed.
2. **Measure the serialized request body, not a source file's size.** JSON string escaping and, for any base64-encoded binary content, base64's ~33% expansion both inflate the wire size well past the original file size — a file just under the limit can still push the encoded request over it.
3. **Rule out an intermediary.** If a reverse proxy, gateway, or load balancer sits in front of Docker Agent, it usually enforces its own, independent body-size limit — often with a differently formatted error — and can reject the request before Docker Agent ever sees it.
4. **Confirm who actually returned the error.** A 413 (or a context-length error) can also come from the model provider itself once the request reaches it; that is a separate limit unrelated to `--max-request-size` — see [Context Window Exceeded](#context-window-exceeded) above.
5. **Resolve it.** Once you've confirmed Docker Agent's own server rejected the request, send less content — split it across turns. On `serve api` or `serve chat` you can also restart the server with a deliberately chosen, larger `--max-request-size` (see [API Server](../../features/api-server/index.md#cli-flags) or [Chat Server](../../features/chat-server/index.md#cli-flags)). A `--listen` control plane has no `--max-request-size` flag to raise — sending less content is the only fix.
@z

@x
A few things that catch people out:
@y
A few things that catch people out:
@z

@x
- `--max-request-size` is set once at process startup and applies to every request that server handles — it isn't per-request or per-client. Only `serve api` and `serve chat` have it; a `--listen` control plane's 1 MiB cap can't be changed.
- `0` or a negative value falls back to the 1 MiB default; it does not mean "no limit".
- Retrying the same oversized body against the same server won't succeed — the limit doesn't change between requests.
- On all three, the body-size check runs ahead of request authentication, so an oversized request can come back as 413 even without valid credentials.
- Piping stdin into a **local** run (`docker agent run agent.yaml -`) never crosses Docker Agent's own inbound HTTP boundary — Docker Agent may still send that content onward to a model/provider over HTTP, but no request reaches Docker Agent's own server to be measured against a `--max-request-size` cap. Piping stdin into `docker agent run --remote ... -`, however, does cross that boundary: the CLI serializes that stdin text into a native API run request and sends it to whichever Docker Agent server the `--remote` address points at — a `serve api` process or another run's `--listen` control plane, never `serve chat`, which speaks a different protocol — so it's measured against that server's own limit like any other request (a configurable `--max-request-size` for `serve api`, or the fixed 1 MiB cap for a `--listen` control plane). That initial request carries only message text — conversion currently drops any attachment resolved locally (`@path`, `/attach`, `--attach`) for the first message, so it alone can't be the cause of a 413. But a `--remote` run doesn't stay text-only for its whole lifetime: a locally resolved attachment added to a *later* message while the agent is still busy — via the default steer behavior or an explicit follow-up (Alt+Enter) — is forwarded as part of that native API request, counts toward the same limit, and can trigger 413 just like any other oversized request.
@y
- `--max-request-size` is set once at process startup and applies to every request that server handles — it isn't per-request or per-client. Only `serve api` and `serve chat` have it; a `--listen` control plane's 1 MiB cap can't be changed.
- `0` or a negative value falls back to the 1 MiB default; it does not mean "no limit".
- Retrying the same oversized body against the same server won't succeed — the limit doesn't change between requests.
- On all three, the body-size check runs ahead of request authentication, so an oversized request can come back as 413 even without valid credentials.
- Piping stdin into a **local** run (`docker agent run agent.yaml -`) never crosses Docker Agent's own inbound HTTP boundary — Docker Agent may still send that content onward to a model/provider over HTTP, but no request reaches Docker Agent's own server to be measured against a `--max-request-size` cap. Piping stdin into `docker agent run --remote ... -`, however, does cross that boundary: the CLI serializes that stdin text into a native API run request and sends it to whichever Docker Agent server the `--remote` address points at — a `serve api` process or another run's `--listen` control plane, never `serve chat`, which speaks a different protocol — so it's measured against that server's own limit like any other request (a configurable `--max-request-size` for `serve api`, or the fixed 1 MiB cap for a `--listen` control plane). That initial request carries only message text — conversion currently drops any attachment resolved locally (`@path`, `/attach`, `--attach`) for the first message, so it alone can't be the cause of a 413. But a `--remote` run doesn't stay text-only for its whole lifetime: a locally resolved attachment added to a *later* message while the agent is still busy — via the default steer behavior or an explicit follow-up (Alt+Enter) — is forwarded as part of that native API request, counts toward the same limit, and can trigger 413 just like any other oversized request.
@z

@x
> [!WARNING]
> Raising `--max-request-size` increases how much memory an unauthenticated or malicious client can force the server to buffer per request. Pick a value with your deployment's exposure in mind, and pair any non-loopback listener with `--auth-token` (API server) or `--api-key`/`--api-key-env` (chat server). A `--listen` control plane has neither flag — keep it on loopback, a unix socket, or behind an authenticating reverse proxy if it must be reachable from elsewhere.
@y
> [!WARNING]
> Raising `--max-request-size` increases how much memory an unauthenticated or malicious client can force the server to buffer per request. Pick a value with your deployment's exposure in mind, and pair any non-loopback listener with `--auth-token` (API server) or `--api-key`/`--api-key-env` (chat server). A `--listen` control plane has neither flag — keep it on loopback, a unix socket, or behind an authenticating reverse proxy if it must be reachable from elsewhere.
@z

@x
## Performance Issues
@y
## Performance Issues
@z

@x
### High memory usage
@y
### High memory usage
@z

@x
- Large context windows (64K+ tokens) consume significant memory — consider reducing `max_tokens`
- Use `num_history_items` in agent config to limit conversation history
- For DMR (local models), tune `runtime_flags` for your hardware (e.g., `--ngl` for GPU layers)
@y
- Large context windows (64K+ tokens) consume significant memory — consider reducing `max_tokens`
- Use `num_history_items` in agent config to limit conversation history
- For DMR (local models), tune `runtime_flags` for your hardware (e.g., `--ngl` for GPU layers)
@z

@x
### Slow responses
@y
### Slow responses
@z

@x
- Check if MCP tools are adding latency (visible in debug logs)
- Use the `/cost` command in TUI to see token usage and identify expensive interactions
- For DMR, consider enabling [speculative decoding](../../providers/dmr/index.md) for faster inference
@y
- Check if MCP tools are adding latency (visible in debug logs)
- Use the `/cost` command in TUI to see token usage and identify expensive interactions
- For DMR, consider enabling [speculative decoding](../../providers/dmr/index.md) for faster inference
@z

@x
### Tool resource leaks
@y
### Tool resource leaks
@z

@x
Monitor for tools that don't clean up properly — check debug logs for MCP server start/stop lifecycle events. Orphaned tool processes can consume system resources.
@y
Monitor for tools that don't clean up properly — check debug logs for MCP server start/stop lifecycle events. Orphaned tool processes can consume system resources.
@z

@x
## Agent Store Issues
@y
## Agent Store Issues
@z

@x
### Pull / push failures
@y
### Pull / push failures
@z

@x
```bash
# Test registry connectivity
$ docker pull docker.io/username/agent:latest
@y
```bash
# Test registry connectivity
$ docker pull docker.io/username/agent:latest
@z

@x
# Verify pulled agent content
$ docker agent share pull docker.io/username/agent:latest
```
@y
# Verify pulled agent content
$ docker agent share pull docker.io/username/agent:latest
```
@z

@x
### Agent content issues
@y
### Agent content issues
@z

@x
- Ensure the pushed YAML is valid — run `docker agent run` locally before pushing
- Check that referenced resources (MCP tools, files) are available on the target machine
- For auto-refresh (`--pull-interval`), verify the registry is accessible from the server
@y
- Ensure the pushed YAML is valid — run `docker agent run` locally before pushing
- Check that referenced resources (MCP tools, files) are available on the target machine
- For auto-refresh (`--pull-interval`), verify the registry is accessible from the server
@z

@x
## Log Analysis
@y
## Log Analysis
@z

@x
When reviewing debug logs, search for these key patterns:
@y
When reviewing debug logs, search for these key patterns:
@z

@x
| Log Pattern                 | What It Indicates                                                                                |
| --------------------------- | ------------------------------------------------------------------------------------------------ |
| `"Starting runtime stream"` | Agent execution beginning                                                                        |
| `"Tool call"`               | A tool is being executed                                                                         |
| `"Tool call result"`        | Tool execution completed                                                                         |
| `"Stream stopped"`          | Agent finished processing                                                                        |
| `HTTP 429`                  | Rate limiting — consider adding a [fallback model](../../configuration/agents/index.md) |
| `context canceled`          | Operation was interrupted (timeout or user cancel)                                               |
| `[RAG Manager]`             | RAG retrieval operations                                                                         |
| `[Reranker]`                | Reranking operations                                                                             |
@y
| Log Pattern                 | What It Indicates                                                                                |
| --------------------------- | ------------------------------------------------------------------------------------------------ |
| `"Starting runtime stream"` | Agent execution beginning                                                                        |
| `"Tool call"`               | A tool is being executed                                                                         |
| `"Tool call result"`        | Tool execution completed                                                                         |
| `"Stream stopped"`          | Agent finished processing                                                                        |
| `HTTP 429`                  | Rate limiting — consider adding a [fallback model](../../configuration/agents/index.md) |
| `context canceled`          | Operation was interrupted (timeout or user cancel)                                               |
| `[RAG Manager]`             | RAG retrieval operations                                                                         |
| `[Reranker]`                | Reranking operations                                                                             |
@z

@x
> [!WARNING]
> **Still stuck?**
>
> If these steps don't resolve your issue, file a bug on the [GitHub issue tracker](https://github.com/docker/docker-agent/issues) with your debug log attached, or ask on [Slack](https://dockercommunity.slack.com/archives/C09DASHHRU4).
@y
> [!WARNING]
> **Still stuck?**
>
> If these steps don't resolve your issue, file a bug on the [GitHub issue tracker](https://github.com/docker/docker-agent/issues) with your debug log attached, or ask on [Slack](https://dockercommunity.slack.com/archives/C09DASHHRU4).
@z
