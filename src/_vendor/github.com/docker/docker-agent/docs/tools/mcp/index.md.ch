%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "MCP Tool"
description: "Extend agents with external tools via the Model Context Protocol."
keywords: docker agent, ai agents, tools, toolsets, mcp tool
linkTitle: "MCP"
@y
title: "MCP Tool"
description: "Extend agents with external tools via the Model Context Protocol."
keywords: docker agent, ai agents, tools, toolsets, mcp tool
linkTitle: "MCP"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/mcp/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/mcp/
@z

@x
_Extend agents with external tools via the Model Context Protocol (MCP)._
@y
_Extend agents with external tools via the Model Context Protocol (MCP)._
@z

@x
## Overview
@y
## Overview
@z

@x
The `mcp` toolset connects your agent to any MCP server — a process or remote service that exposes tools, resources, and prompts over the [Model Context Protocol](https://modelcontextprotocol.io/). Three flavours are supported:
@y
The `mcp` toolset connects your agent to any MCP server — a process or remote service that exposes tools, resources, and prompts over the [Model Context Protocol](https://modelcontextprotocol.io/). Three flavours are supported:
@z

@x
| Flavour | Transport | Best for |
| --- | --- | --- |
| **Docker MCP** | Container via the [MCP Gateway](https://github.com/docker/mcp-gateway) | Curated, sandboxed servers from the [Docker MCP Catalog](https://hub.docker.com/u/mcp) |
| **Local stdio** | Subprocess over stdin/stdout | Custom or community MCP servers run from a binary or `npx`/`pip` package |
| **Remote** | Streamable HTTP or SSE | Cloud services with hosted MCP endpoints (Linear, Notion, Atlassian, …) |
@y
| Flavour | Transport | Best for |
| --- | --- | --- |
| **Docker MCP** | Container via the [MCP Gateway](https://github.com/docker/mcp-gateway) | Curated, sandboxed servers from the [Docker MCP Catalog](https://hub.docker.com/u/mcp) |
| **Local stdio** | Subprocess over stdin/stdout | Custom or community MCP servers run from a binary or `npx`/`pip` package |
| **Remote** | Streamable HTTP or SSE | Cloud services with hosted MCP endpoints (Linear, Notion, Atlassian, …) |
@z

@x
> [!NOTE]
> **What is MCP?**
>
> The [Model Context Protocol](https://modelcontextprotocol.io/) is an open standard for connecting AI tools. Docker Agent can both _use_ MCP servers (this page) and _expose_ agents as MCP servers — see [MCP Mode](../../features/mcp-mode/index.md).
@y
> [!NOTE]
> **What is MCP?**
>
> The [Model Context Protocol](https://modelcontextprotocol.io/) is an open standard for connecting AI tools. Docker Agent can both _use_ MCP servers (this page) and _expose_ agents as MCP servers — see [MCP Mode](../../features/mcp-mode/index.md).
@z

@x
## Docker MCP (Recommended)
@y
## Docker MCP (Recommended)
@z

@x
Run MCP servers as secure Docker containers via the MCP Gateway. The `ref: docker:<name>` syntax pulls a curated definition from the Docker MCP Catalog:
@y
Run MCP servers as secure Docker containers via the MCP Gateway. The `ref: docker:<name>` syntax pulls a curated definition from the Docker MCP Catalog:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:duckduckgo        # web search
  - type: mcp
    ref: docker:github-official   # GitHub integration
    tools: ["list_issues", "create_issue"]
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:duckduckgo        # web search
  - type: mcp
    ref: docker:github-official   # GitHub integration
    tools: ["list_issues", "create_issue"]
```
@z

@x
Browse available servers at the [Docker MCP Catalog](https://hub.docker.com/u/mcp).
@y
Browse available servers at the [Docker MCP Catalog](https://hub.docker.com/u/mcp).
@z

@x
| Property      | Type   | Description                                                      |
| ------------- | ------ | ---------------------------------------------------------------- |
| `ref`         | string | Docker MCP reference (`docker:name`) or a name from the [reusable `mcps:`](../../configuration/overview/index.md#reusable-mcp-servers-mcps) block. |
| `tools`       | array  | Optional whitelist — only expose these tools to the model.       |
| `instruction` | string | Custom instructions injected into the agent's context.           |
| `config`      | any    | MCP server-specific configuration passed during initialization.  |
| `working_dir` | string | Working directory for the MCP gateway subprocess. Only applies when the catalog entry runs as a local process (not remote). Relative paths are resolved against the agent's working directory. Supports `${env.VAR}` (canonical), plus `~` and shell-style `$VAR`/`${VAR}` expansion ([details](../../configuration/overview/index.md#variable-expansion-in-config-fields)). |
@y
| Property      | Type   | Description                                                      |
| ------------- | ------ | ---------------------------------------------------------------- |
| `ref`         | string | Docker MCP reference (`docker:name`) or a name from the [reusable `mcps:`](../../configuration/overview/index.md#reusable-mcp-servers-mcps) block. |
| `tools`       | array  | Optional whitelist — only expose these tools to the model.       |
| `instruction` | string | Custom instructions injected into the agent's context.           |
| `config`      | any    | MCP server-specific configuration passed during initialization.  |
| `working_dir` | string | Working directory for the MCP gateway subprocess. Only applies when the catalog entry runs as a local process (not remote). Relative paths are resolved against the agent's working directory. Supports `${env.VAR}` (canonical), plus `~` and shell-style `$VAR`/`${VAR}` expansion ([details](../../configuration/overview/index.md#variable-expansion-in-config-fields)). |
@z

@x
## Local MCP (stdio)
@y
## Local MCP (stdio)
@z

@x
Run MCP servers as local processes communicating over stdin/stdout:
@y
Run MCP servers as local processes communicating over stdin/stdout:
@z

@x
```yaml
toolsets:
  - type: mcp
    command: python
    args: ["-m", "mcp_server"]
    tools: ["search", "fetch"]
    env:
      API_KEY: value
```
@y
```yaml
toolsets:
  - type: mcp
    command: python
    args: ["-m", "mcp_server"]
    tools: ["search", "fetch"]
    env:
      API_KEY: value
```
@z

@x
| Property      | Type   | Description |
| ------------- | ------ | ----------- |
| `command`     | string | Command to execute the MCP server. |
| `args`        | array  | Command arguments. |
| `tools`       | array  | Optional whitelist — only expose these tools. |
| `env`         | object | Environment variables (key-value pairs). |
| `working_dir` | string | Working directory for the MCP server process. Relative paths are resolved against the agent's working directory. Defaults to the agent's working directory when omitted. Supports `${env.VAR}` (canonical), plus `~` and shell-style `$VAR`/`${VAR}` expansion ([details](../../configuration/overview/index.md#variable-expansion-in-config-fields)). |
| `instruction` | string | Custom instructions injected into the agent's context. |
| `version`     | string | Package reference for [auto-installing](../../configuration/tools/index.md#auto-installing-tools) the command binary. |
@y
| Property      | Type   | Description |
| ------------- | ------ | ----------- |
| `command`     | string | Command to execute the MCP server. |
| `args`        | array  | Command arguments. |
| `tools`       | array  | Optional whitelist — only expose these tools. |
| `env`         | object | Environment variables (key-value pairs). |
| `working_dir` | string | Working directory for the MCP server process. Relative paths are resolved against the agent's working directory. Defaults to the agent's working directory when omitted. Supports `${env.VAR}` (canonical), plus `~` and shell-style `$VAR`/`${VAR}` expansion ([details](../../configuration/overview/index.md#variable-expansion-in-config-fields)). |
| `instruction` | string | Custom instructions injected into the agent's context. |
| `version`     | string | Package reference for [auto-installing](../../configuration/tools/index.md#auto-installing-tools) the command binary. |
@z

@x
> [!TIP]
> **Auto-installation**
>
> If the `command` is not in your `PATH`, Docker Agent looks it up in the [aqua registry](https://github.com/aquaproj/aqua-registry) and installs it for you. Use `version: "false"` to opt out, or set `DOCKER_AGENT_AUTO_INSTALL=false` globally. See [Auto-Installing Tools](../../configuration/tools/index.md#auto-installing-tools).
@y
> [!TIP]
> **Auto-installation**
>
> If the `command` is not in your `PATH`, Docker Agent looks it up in the [aqua registry](https://github.com/aquaproj/aqua-registry) and installs it for you. Use `version: "false"` to opt out, or set `DOCKER_AGENT_AUTO_INSTALL=false` globally. See [Auto-Installing Tools](../../configuration/tools/index.md#auto-installing-tools).
@z

@x
## Remote MCP (Streamable HTTP / SSE)
@y
## Remote MCP (Streamable HTTP / SSE)
@z

@x
Connect to MCP servers over the network. OAuth flows (including [Dynamic Client Registration](https://datatracker.ietf.org/doc/html/rfc7591)) are handled automatically — Docker Agent opens your browser when authentication is required and caches tokens for subsequent sessions. Tokens are refreshed silently when they expire or are revoked server-side; if a silent refresh is not possible, the OAuth prompt reappears on the next message.
@y
Connect to MCP servers over the network. OAuth flows (including [Dynamic Client Registration](https://datatracker.ietf.org/doc/html/rfc7591)) are handled automatically — Docker Agent opens your browser when authentication is required and caches tokens for subsequent sessions. Tokens are refreshed silently when they expire or are revoked server-side; if a silent refresh is not possible, the OAuth prompt reappears on the next message.
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.linear.app/mcp"
      transport_type: "streamable"               # or "sse" for legacy servers
      headers:
        Authorization: "Bearer ${env.LINEAR_TOKEN}"
    # Optional: allow OAuth helper requests to reach private/internal IPs.
    allow_private_ips: false
    tools: ["search_issues", "create_issue"]
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.linear.app/mcp"
      transport_type: "streamable"               # or "sse" for legacy servers
      headers:
        Authorization: "Bearer ${env.LINEAR_TOKEN}"
    # Optional: allow OAuth helper requests to reach private/internal IPs.
    allow_private_ips: false
    tools: ["search_issues", "create_issue"]
```
@z

@x
| Property                | Type    | Description |
| ----------------------- | ------- | ----------- |
| `remote.url`            | string  | Base URL of the MCP server. |
| `remote.transport_type` | string  | `streamable` or `sse`. |
| `remote.headers`        | object  | HTTP headers sent on every request. Values support `${env.VAR}` and `${headers.NAME}` placeholders, resolved per request. See [Remote MCP Servers](../../features/remote-mcp/index.md#per-request-header-template-expansion) for details. |
| `remote.oauth`          | object  | Explicit OAuth client credentials for servers that don't support DCR. See [Remote MCP Servers](../../features/remote-mcp/index.md#oauth-for-servers-without-dynamic-client-registration). |
| `allow_private_ips`     | boolean | Permit remote MCP OAuth helper requests to dial non-public IP addresses. Use only for trusted internal servers. |
@y
| Property                | Type    | Description |
| ----------------------- | ------- | ----------- |
| `remote.url`            | string  | Base URL of the MCP server. |
| `remote.transport_type` | string  | `streamable` or `sse`. |
| `remote.headers`        | object  | HTTP headers sent on every request. Values support `${env.VAR}` and `${headers.NAME}` placeholders, resolved per request. See [Remote MCP Servers](../../features/remote-mcp/index.md#per-request-header-template-expansion) for details. |
| `remote.oauth`          | object  | Explicit OAuth client credentials for servers that don't support DCR. See [Remote MCP Servers](../../features/remote-mcp/index.md#oauth-for-servers-without-dynamic-client-registration). |
| `allow_private_ips`     | boolean | Permit remote MCP OAuth helper requests to dial non-public IP addresses. Use only for trusted internal servers. |
@z

@x
For a curated list of public remote MCP endpoints (Linear, GitHub, Vercel, Notion, …) and full OAuth configuration details, see [Remote MCP Servers](../../features/remote-mcp/index.md).
@y
For a curated list of public remote MCP endpoints (Linear, GitHub, Vercel, Notion, …) and full OAuth configuration details, see [Remote MCP Servers](../../features/remote-mcp/index.md).
@z

@x
## MCP Prompts
@y
## MCP Prompts
@z

@x
MCP servers can expose **prompts** — named, parameterized templates that the server provides via the `/prompts` endpoint. Docker Agent discovers these at toolset startup and registers them as **slash commands** in the TUI, so you can invoke them directly from the input box.
@y
MCP servers can expose **prompts** — named, parameterized templates that the server provides via the `/prompts` endpoint. Docker Agent discovers these at toolset startup and registers them as **slash commands** in the TUI, so you can invoke them directly from the input box.
@z

@x
```text
# Type / to see available prompts alongside built-in commands
/review         # invoke an MCP prompt named "review"
/summarize My text here   # invoke with the first argument filled in
```
@y
```text
# Type / to see available prompts alongside built-in commands
/review         # invoke an MCP prompt named "review"
/summarize My text here   # invoke with the first argument filled in
```
@z

@x
**How it works:**
@y
**How it works:**
@z

@x
- Each MCP prompt appears in the command palette (accessible via <kbd>Ctrl</kbd>+<kbd>K</kbd>) under the **MCP Prompts** category.
- Typing `/<prompt-name>` in the input box invokes the prompt immediately.
- If the prompt declares arguments and you provide text after the slash command, that text is mapped to the first declared argument.
- If a required argument is missing, Docker Agent opens the argument input dialog before running the prompt.
- When no argument is needed or all required arguments are supplied, the prompt runs immediately.
@y
- Each MCP prompt appears in the command palette (accessible via <kbd>Ctrl</kbd>+<kbd>K</kbd>) under the **MCP Prompts** category.
- Typing `/<prompt-name>` in the input box invokes the prompt immediately.
- If the prompt declares arguments and you provide text after the slash command, that text is mapped to the first declared argument.
- If a required argument is missing, Docker Agent opens the argument input dialog before running the prompt.
- When no argument is needed or all required arguments are supplied, the prompt runs immediately.
@z

@x
> [!NOTE]
> MCP prompt discovery requires a YAML-declared `mcp` toolset. Prompts from servers activated through the [Docker MCP Catalog](../../tools/mcp-catalog/index.md) (`ref: docker:<name>`) are not currently surfaced.
@y
> [!NOTE]
> MCP prompt discovery requires a YAML-declared `mcp` toolset. Prompts from servers activated through the [Docker MCP Catalog](../../tools/mcp-catalog/index.md) (`ref: docker:<name>`) are not currently surfaced.
@z

@x
## Embedded Resources
@y
## Embedded Resources
@z

@x
MCP tool results can include embedded resources — images, PDFs, and text files returned directly in the tool response. Docker Agent preserves these as attachments and forwards them to the model as native content blocks:
@y
MCP tool results can include embedded resources — images, PDFs, and text files returned directly in the tool response. Docker Agent preserves these as attachments and forwards them to the model as native content blocks:
@z

@x
- **Anthropic** — images become `image` blocks in the `tool_result`; PDFs and other documents become `document` blocks.
- **OpenAI** — images are forwarded as `input_image` data URIs; PDFs as `input_file` data URIs in the tool result content.
- **Bedrock** and **Gemini** — receive equivalent provider-native representations.
@y
- **Anthropic** — images become `image` blocks in the `tool_result`; PDFs and other documents become `document` blocks.
- **OpenAI** — images are forwarded as `input_image` data URIs; PDFs as `input_file` data URIs in the tool result content.
- **Bedrock** and **Gemini** — receive equivalent provider-native representations.
@z

@x
No configuration is required. When an MCP server returns an embedded resource alongside its text output, the resource is automatically attached and sent to the model on the next turn. This is useful for MCP servers that generate charts, export PDFs, or return binary data as part of their responses.
@y
No configuration is required. When an MCP server returns an embedded resource alongside its text output, the resource is automatically attached and sent to the model on the next turn. This is useful for MCP servers that generate charts, export PDFs, or return binary data as part of their responses.
@z

@x
## Reusable Definitions (`mcps:`)
@y
## Reusable Definitions (`mcps:`)
@z

@x
Repeated MCP server configurations can be hoisted into the top-level `mcps:` section and referenced by name with `{type: mcp, ref: <name>}`:
@y
Repeated MCP server configurations can be hoisted into the top-level `mcps:` section and referenced by name with `{type: mcp, ref: <name>}`:
@z

@x
```yaml
mcps:
  github:
    remote:
      url: https://api.githubcopilot.com/mcp
      transport_type: sse
  playwright:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-playwright"]
@y
```yaml
mcps:
  github:
    remote:
      url: https://api.githubcopilot.com/mcp
      transport_type: sse
  playwright:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-playwright"]
@z

@x
agents:
  root:
    model: openai/gpt-5
    toolsets:
      - type: mcp
        ref: github
      - type: mcp
        ref: playwright
```
@y
agents:
  root:
    model: openai/gpt-5
    toolsets:
      - type: mcp
        ref: github
      - type: mcp
        ref: playwright
```
@z

@x
See [Reusable MCP Servers](../../configuration/overview/index.md#reusable-mcp-servers-mcps) for the full reference.
@y
See [Reusable MCP Servers](../../configuration/overview/index.md#reusable-mcp-servers-mcps) for the full reference.
@z

@x
## Common Options
@y
## Common Options
@z

@x
These properties apply to every MCP toolset regardless of flavour:
@y
These properties apply to every MCP toolset regardless of flavour:
@z

@x
### Tool filtering
@y
### Tool filtering
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    tools: ["list_issues", "create_issue", "get_pull_request"]
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    tools: ["list_issues", "create_issue", "get_pull_request"]
```
@z

@x
Whitelisting tools improves model accuracy — fewer choices means less confusion.
@y
Whitelisting tools improves model accuracy — fewer choices means less confusion.
@z

@x
### Deferred loading
@y
### Deferred loading
@z

@x
Skip the toolset's startup cost until its tools are actually called:
@y
Skip the toolset's startup cost until its tools are actually called:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    defer: true
  # Or defer specific tools within a toolset:
  - type: mcp
    ref: docker:slack
    defer: ["list_channels", "search_messages"]
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    defer: true
  # Or defer specific tools within a toolset:
  - type: mcp
    ref: docker:slack
    defer: ["list_channels", "search_messages"]
```
@z

@x
### Custom instructions
@y
### Custom instructions
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    instruction: |
      Use these tools to manage GitHub issues.
      Always check for existing issues before creating new ones.
      Label new issues with 'triage' by default.
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    instruction: |
      Use these tools to manage GitHub issues.
      Always check for existing issues before creating new ones.
      Label new issues with 'triage' by default.
```
@z

@x
### TOON-encoded outputs
@y
### TOON-encoded outputs
@z

@x
Re-encode verbose JSON outputs as the compact [TOON](https://github.com/alpkeskin/gotoon) format to save context budget. Typically yields 30–60% smaller payloads on list/search tools.
@y
Re-encode verbose JSON outputs as the compact [TOON](https://github.com/alpkeskin/gotoon) format to save context budget. Typically yields 30–60% smaller payloads on list/search tools.
@z

@x
`toon` is a regex string that is matched against tool names. Any tool whose name matches the pattern has its JSON output transparently re-encoded as TOON before it is shown to the model. The re-encoding reduces schema verbosity, which is especially useful when a model struggles with large or repetitive tool output.
@y
`toon` is a regex string that is matched against tool names. Any tool whose name matches the pattern has its JSON output transparently re-encoded as TOON before it is shown to the model. The re-encoding reduces schema verbosity, which is especially useful when a model struggles with large or repetitive tool output.
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    toon: ".*"            # toonify every tool from this server
  - type: mcp
    command: my-server
    toon: "list_.*,get_.*" # only toonify list_/get_ tools
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    toon: ".*"            # toonify every tool from this server
  - type: mcp
    command: my-server
    toon: "list_.*,get_.*" # only toonify list_/get_ tools
```
@z

@x
The value is a comma-separated list of regexes (or a single regex). A tool name must match at least one pattern to be re-encoded. Setting `toon: ".*"` re-encodes all tools from that toolset.
@y
The value is a comma-separated list of regexes (or a single regex). A tool name must match at least one pattern to be re-encoded. Setting `toon: ".*"` re-encodes all tools from that toolset.
@z

@x
See [`examples/github-toon.yaml`](https://github.com/docker/docker-agent/blob/main/examples/github-toon.yaml) for a practical example using the GitHub MCP server.
@y
See [`examples/github-toon.yaml`](https://github.com/docker/docker-agent/blob/main/examples/github-toon.yaml) for a practical example using the GitHub MCP server.
@z

@x
### Per-toolset model routing
@y
### Per-toolset model routing
@z

@x
Process tool results from this toolset with a different (typically cheaper / faster) model. The override is one-shot — subsequent turns return to the agent's primary model:
@y
Process tool results from this toolset with a different (typically cheaper / faster) model. The override is one-shot — subsequent turns return to the agent's primary model:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    model: openai/gpt-4o-mini
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    model: openai/gpt-4o-mini
```
@z

@x
See [Per-Toolset Model Routing](../../configuration/tools/index.md#per-toolset-model-routing).
@y
See [Per-Toolset Model Routing](../../configuration/tools/index.md#per-toolset-model-routing).
@z

@x
### Lifecycle (auto-restart, profiles)
@y
### Lifecycle (auto-restart, profiles)
@z

@x
Local stdio and remote MCP servers are supervised: crashed servers reconnect automatically with exponential backoff. **Remote** MCP servers (Streamable HTTP / SSE) also reconnect after idle/clean connection closes — services like Notion and Linear periodically close idle connections, and Docker Agent reconnects transparently. Tune the policy with the `lifecycle` block:
@y
Local stdio and remote MCP servers are supervised: crashed servers reconnect automatically with exponential backoff. **Remote** MCP servers (Streamable HTTP / SSE) also reconnect after idle/clean connection closes — services like Notion and Linear periodically close idle connections, and Docker Agent reconnects transparently. Tune the policy with the `lifecycle` block:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:duckduckgo
    lifecycle:
      profile: resilient   # default; auto-restart with backoff
  - type: mcp
    command: docker
    args: ["mcp", "gateway"]
    lifecycle:
      profile: strict      # fail-fast: required, no retries
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:duckduckgo
    lifecycle:
      profile: resilient   # default; auto-restart with backoff
  - type: mcp
    command: docker
    args: ["mcp", "gateway"]
    lifecycle:
      profile: strict      # fail-fast: required, no retries
```
@z

@x
See [Toolset Lifecycle](../../configuration/tools/index.md#toolset-lifecycle) for all profiles and tuning knobs, and [`/toolset-restart`](../../features/tui/index.md) to force a reconnect from the TUI.
@y
See [Toolset Lifecycle](../../configuration/tools/index.md#toolset-lifecycle) for all profiles and tuning knobs, and [`/toolset-restart`](../../features/tui/index.md) to force a reconnect from the TUI.
@z

@x
## Combined Example
@y
## Combined Example
@z

@x
```yaml
mcps:
  github:
    remote:
      url: https://api.githubcopilot.com/mcp
      transport_type: sse
@y
```yaml
mcps:
  github:
    remote:
      url: https://api.githubcopilot.com/mcp
      transport_type: sse
@z

@x
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Full-featured developer assistant
    instruction: You are an expert developer.
    toolsets:
      # Docker MCP catalog entry
      - type: mcp
        ref: docker:duckduckgo
@y
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Full-featured developer assistant
    instruction: You are an expert developer.
    toolsets:
      # Docker MCP catalog entry
      - type: mcp
        ref: docker:duckduckgo
@z

@x
      # Reusable definition from the top-level mcps: block
      - type: mcp
        ref: github
        tools: ["list_issues", "create_issue"]
        toon: "list_.*"
@y
      # Reusable definition from the top-level mcps: block
      - type: mcp
        ref: github
        tools: ["list_issues", "create_issue"]
        toon: "list_.*"
@z

@x
      # Local stdio server with auto-install
      - type: mcp
        command: gopls
        version: "golang/tools@v0.21.0"
        args: ["mcp"]
@y
      # Local stdio server with auto-install
      - type: mcp
        command: gopls
        version: "golang/tools@v0.21.0"
        args: ["mcp"]
@z

@x
      # Remote MCP with OAuth (handled automatically)
      - type: mcp
        remote:
          url: "https://mcp.linear.app/mcp"
          transport_type: "streamable"
        instruction: Use Linear for issue tracking.
```
@y
      # Remote MCP with OAuth (handled automatically)
      - type: mcp
        remote:
          url: "https://mcp.linear.app/mcp"
          transport_type: "streamable"
        instruction: Use Linear for issue tracking.
```
@z

@x
> [!WARNING]
> **Toolset order matters**
>
> If multiple toolsets provide a tool with the same name, the first one wins: the duplicate from the later toolset is ignored and a warning identifies both toolsets. Order your toolsets intentionally. To keep both tools callable, give the MCP toolset a unique `name:` (its tools are then exposed as `<name>_<tool>`) or restrict the overlapping toolset with its `tools:` filter.
@y
> [!WARNING]
> **Toolset order matters**
>
> If multiple toolsets provide a tool with the same name, the first one wins: the duplicate from the later toolset is ignored and a warning identifies both toolsets. Order your toolsets intentionally. To keep both tools callable, give the MCP toolset a unique `name:` (its tools are then exposed as `<name>_<tool>`) or restrict the overlapping toolset with its `tools:` filter.
@z

@x
## See Also
@y
## See Also
@z

@x
- [Tool Configuration](../../configuration/tools/index.md) — full reference for every toolset type, plus shared options (lifecycle, TOON, model routing, …).
- [Reusable MCP Servers](../../configuration/overview/index.md#reusable-mcp-servers-mcps) — the top-level `mcps:` block.
- [Remote MCP Servers](../../features/remote-mcp/index.md) — catalog of public remote MCP endpoints + OAuth recipes.
- [MCP Mode](../../features/mcp-mode/index.md) — expose your own agents as MCP tools to Claude Desktop, Claude Code, etc.
- [Auto-Installing Tools](../../configuration/tools/index.md#auto-installing-tools) — automatic installation of MCP server binaries.
@y
- [Tool Configuration](../../configuration/tools/index.md) — full reference for every toolset type, plus shared options (lifecycle, TOON, model routing, …).
- [Reusable MCP Servers](../../configuration/overview/index.md#reusable-mcp-servers-mcps) — the top-level `mcps:` block.
- [Remote MCP Servers](../../features/remote-mcp/index.md) — catalog of public remote MCP endpoints + OAuth recipes.
- [MCP Mode](../../features/mcp-mode/index.md) — expose your own agents as MCP tools to Claude Desktop, Claude Code, etc.
- [Auto-Installing Tools](../../configuration/tools/index.md#auto-installing-tools) — automatic installation of MCP server binaries.
@z
