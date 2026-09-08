%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "MCP Catalog Tool"
description: "Let the agent discover and activate remote MCP servers from the Docker MCP Catalog on demand."
keywords: docker agent, ai agents, tools, toolsets, mcp catalog tool
linkTitle: "MCP Catalog"
@y
title: "MCP Catalog Tool"
description: "Let the agent discover and activate remote MCP servers from the Docker MCP Catalog on demand."
keywords: docker agent, ai agents, tools, toolsets, mcp catalog tool
linkTitle: "MCP Catalog"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/mcp-catalog/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/mcp-catalog/
@z

@x
_Let the agent discover and activate remote MCP servers from the Docker MCP Catalog on demand._
@y
_Let the agent discover and activate remote MCP servers from the Docker MCP Catalog on demand._
@z

@x
## Overview
@y
## Overview
@z

@x
The `mcp_catalog` toolset gives an agent access to a curated subset of the [Docker MCP Catalog](https://hub.docker.com/search?q=&type=mcp) — every server in this subset is reachable over the **streamable-http** transport, so Docker Agent can talk to it directly without the MCP gateway or a local subprocess.
@y
The `mcp_catalog` toolset gives an agent access to a curated subset of the [Docker MCP Catalog](https://hub.docker.com/search?q=&type=mcp) — every server in this subset is reachable over the **streamable-http** transport, so Docker Agent can talk to it directly without the MCP gateway or a local subprocess.
@z

@x
Servers are **not** active by default. Instead, the toolset exposes a small set of meta-tools the agent uses to search, enable, and disable servers as a turn unfolds. Tools from un-enabled servers stay hidden, so the prompt is not flooded with hundreds of tool definitions the agent will never use.
@y
Servers are **not** active by default. Instead, the toolset exposes a small set of meta-tools the agent uses to search, enable, and disable servers as a turn unfolds. Tools from un-enabled servers stay hidden, so the prompt is not flooded with hundreds of tool definitions the agent will never use.
@z

@x
> [!NOTE]
> **When to use it**
>
> Use `mcp_catalog` when you want the agent to _decide at runtime_ which third-party services it needs (Notion, Stripe, Brave Search, …) instead of pinning that decision in YAML up front. For a fixed set of servers, declare each one with [`type: mcp`](../../configuration/tools/index.md#mcp-tools) directly — the catalog adds an extra layer of meta-tools that pure `type: mcp` entries do not need.
@y
> [!NOTE]
> **When to use it**
>
> Use `mcp_catalog` when you want the agent to _decide at runtime_ which third-party services it needs (Notion, Stripe, Brave Search, …) instead of pinning that decision in YAML up front. For a fixed set of servers, declare each one with [`type: mcp`](../../configuration/tools/index.md#mcp-tools) directly — the catalog adds an extra layer of meta-tools that pure `type: mcp` entries do not need.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: mcp_catalog
```
@y
```yaml
toolsets:
  - type: mcp_catalog
```
@z

@x
The catalog is embedded in the `docker-agent` binary and refreshed with each release. By default every server in the embedded subset is offered.
@y
The catalog is embedded in the `docker-agent` binary and refreshed with each release. By default every server in the embedded subset is offered.
@z

@x
### Restricting the offered servers
@y
### Restricting the offered servers
@z

@x
Two optional lists narrow what the toolset offers, so an agent sees a focused, predictable menu instead of the full catalog:
@y
Two optional lists narrow what the toolset offers, so an agent sees a focused, predictable menu instead of the full catalog:
@z

@x
- **`allowed_servers`** — when non-empty, **only** these catalog server ids are searchable and enableable; every other entry is hidden.
- **`blocked_servers`** — removes individual ids from the offered set. It is applied **after** `allowed_servers`, so a server listed in both is blocked (block wins over allow).
@y
- **`allowed_servers`** — when non-empty, **only** these catalog server ids are searchable and enableable; every other entry is hidden.
- **`blocked_servers`** — removes individual ids from the offered set. It is applied **after** `allowed_servers`, so a server listed in both is blocked (block wins over allow).
@z

@x
Both take server ids (the `id` field returned by `search_remote_mcp_servers`). An empty or omitted list disables that filter.
@y
Both take server ids (the `id` field returned by `search_remote_mcp_servers`). An empty or omitted list disables that filter.
@z

@x
```yaml
toolsets:
  - type: mcp_catalog
    allowed_servers:
      - docker-docs
      - microsoft-learn
      - hugging-face
    blocked_servers:
      - gitmcp
```
@y
```yaml
toolsets:
  - type: mcp_catalog
    allowed_servers:
      - docker-docs
      - microsoft-learn
      - hugging-face
    blocked_servers:
      - gitmcp
```
@z

@x
## Meta-Tools
@y
## Meta-Tools
@z

@x
Up to five tools are exposed to the model. The disable / reset-auth pair only appears once at least one server is enabled, so the meta-tool surface stays minimal until the agent activates something.
@y
Up to five tools are exposed to the model. The disable / reset-auth pair only appears once at least one server is enabled, so the meta-tool surface stays minimal until the agent activates something.
@z

@x
| Tool                            | When visible            | Description                                                                                                                                          |
| ------------------------------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `search_remote_mcp_servers`     | Always                  | Case-insensitive fuzzy search over id, title, description, category and tags. Returns id, auth requirements (`oauth` / `none`) and URL. |
| `enable_remote_mcp_server`      | Always                  | Activate a server by id. **Blocks** until the connection (and any required OAuth handshake) completes; on success the server's tools are immediately live and the model continues with the user's original request in the same turn. |
| `list_remote_mcp_servers`       | Always                  | Show currently enabled servers and their connection state.                                                                                           |
| `disable_remote_mcp_server`     | After first enable      | Stop a server and remove its tools from the active set.                                                                                              |
| `reset_remote_mcp_server_auth`  | After first enable      | Drop persisted OAuth credentials so the next enable triggers a fresh authorization flow. No-op for `none` servers.                       |
@y
| Tool                            | When visible            | Description                                                                                                                                          |
| ------------------------------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `search_remote_mcp_servers`     | Always                  | Case-insensitive fuzzy search over id, title, description, category and tags. Returns id, auth requirements (`oauth` / `none`) and URL. |
| `enable_remote_mcp_server`      | Always                  | Activate a server by id. **Blocks** until the connection (and any required OAuth handshake) completes; on success the server's tools are immediately live and the model continues with the user's original request in the same turn. |
| `list_remote_mcp_servers`       | Always                  | Show currently enabled servers and their connection state.                                                                                           |
| `disable_remote_mcp_server`     | After first enable      | Stop a server and remove its tools from the active set.                                                                                              |
| `reset_remote_mcp_server_auth`  | After first enable      | Drop persisted OAuth credentials so the next enable triggers a fresh authorization flow. No-op for `none` servers.                       |
@z

@x
### Workflow
@y
### Workflow
@z

@x
1. The agent calls `search_remote_mcp_servers` with a keyword matching the user's intent (`"notion"`, `"stripe"`, `"docs"`, `"browser"`, `"grafana"`, …).
2. It picks a matching server id and calls `enable_remote_mcp_server`. **`enable` blocks** until the MCP handshake (and any required OAuth flow) completes:
   - on success the server's tools are available **in the same turn** — the agent goes straight to the user's original request, no re-ask required;
   - on failure (user dismissed the authorization dialog, server refused) the tool returns an error result naming the specific reason so the agent can recover instead of pretending the server is connected.
3. It uses the newly activated tools as it would any other.
4. When done, it calls `disable_remote_mcp_server` to remove the server from the active set.
@y
1. The agent calls `search_remote_mcp_servers` with a keyword matching the user's intent (`"notion"`, `"stripe"`, `"docs"`, `"browser"`, `"grafana"`, …).
2. It picks a matching server id and calls `enable_remote_mcp_server`. **`enable` blocks** until the MCP handshake (and any required OAuth flow) completes:
   - on success the server's tools are available **in the same turn** — the agent goes straight to the user's original request, no re-ask required;
   - on failure (user dismissed the authorization dialog, server refused) the tool returns an error result naming the specific reason so the agent can recover instead of pretending the server is connected.
3. It uses the newly activated tools as it would any other.
4. When done, it calls `disable_remote_mcp_server` to remove the server from the active set.
@z

@x
## Authentication
@y
## Authentication
@z

@x
The catalog only includes servers Docker Agent can authenticate itself, so there are two auth flavours:
@y
The catalog only includes servers Docker Agent can authenticate itself, so there are two auth flavours:
@z

@x
- **`oauth`** — `enable_remote_mcp_server` surfaces an authorization URL through the elicitation pipeline (the same one used by YAML-declared remote MCP toolsets) and blocks until the user either authorizes or cancels. Once the user authorizes, tokens are persisted in the OS keyring and re-used on subsequent runs. Use `reset_remote_mcp_server_auth` to wipe them. If the user dismisses the dialog, `enable` returns an error result naming the decline so the agent can ask whether to retry.
- **`none`** — No authentication. The server is reachable as soon as it is enabled.
@y
- **`oauth`** — `enable_remote_mcp_server` surfaces an authorization URL through the elicitation pipeline (the same one used by YAML-declared remote MCP toolsets) and blocks until the user either authorizes or cancels. Once the user authorizes, tokens are persisted in the OS keyring and re-used on subsequent runs. Use `reset_remote_mcp_server_auth` to wipe them. If the user dismisses the dialog, `enable` returns an error result naming the decline so the agent can ask whether to retry.
- **`none`** — No authentication. The server is reachable as soon as it is enabled.
@z

@x
Servers that require a caller-provided API key are intentionally excluded from the catalog. To use one, declare it explicitly with [`type: mcp`](../../configuration/tools/index.md#mcp-tools) and supply the key via an environment variable.
@y
Servers that require a caller-provided API key are intentionally excluded from the catalog. To use one, declare it explicitly with [`type: mcp`](../../configuration/tools/index.md#mcp-tools) and supply the key via an environment variable.
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
    model: anthropic/claude-sonnet-4-5
    description: Agent that can on-demand connect to remote MCP servers from the Docker MCP Catalog.
    instruction: |
      You can discover and activate remote MCP servers on demand.
      Use search_remote_mcp_servers to find a server matching the
      user's intent, then enable_remote_mcp_server to activate it.
      Be conservative: enable only the servers you actually need for
      the task at hand. Disable a server with disable_remote_mcp_server
      once you are done with it.
    toolsets:
      - type: mcp_catalog
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Agent that can on-demand connect to remote MCP servers from the Docker MCP Catalog.
    instruction: |
      You can discover and activate remote MCP servers on demand.
      Use search_remote_mcp_servers to find a server matching the
      user's intent, then enable_remote_mcp_server to activate it.
      Be conservative: enable only the servers you actually need for
      the task at hand. Disable a server with disable_remote_mcp_server
      once you are done with it.
    toolsets:
      - type: mcp_catalog
```
@z

@x
A complete, runnable configuration lives in [`examples/mcp_catalog.yaml`](https://github.com/docker/docker-agent/blob/main/examples/mcp_catalog.yaml). A curated, allow/block-listed variant lives in [`examples/mcp_catalog_filtered.yaml`](https://github.com/docker/docker-agent/blob/main/examples/mcp_catalog_filtered.yaml).
@y
A complete, runnable configuration lives in [`examples/mcp_catalog.yaml`](https://github.com/docker/docker-agent/blob/main/examples/mcp_catalog.yaml). A curated, allow/block-listed variant lives in [`examples/mcp_catalog_filtered.yaml`](https://github.com/docker/docker-agent/blob/main/examples/mcp_catalog_filtered.yaml).
@z

@x
## Notes and Limitations
@y
## Notes and Limitations
@z

@x
- **Streamable-http only.** The catalog deliberately excludes servers that require a local subprocess or the MCP gateway — declare those with [`type: mcp`](../../configuration/tools/index.md#mcp-tools) instead.
- **Catalog membership changes between releases.** The set of available servers is updated with each Docker Agent release as integrations are added or removed. Servers present in one release may not appear in the next.
- **Blocking enable.** DNS, TCP, MCP handshake and any OAuth flow happen synchronously inside `enable_remote_mcp_server` so the agent gets a deterministic result in the same turn. On startup, however, the runtime probes tools non-interactively (`mcp.WithoutInteractivePrompts`); OAuth-pending servers fail fast there and are silently deferred to the next interactive turn — including the sidebar-only tool-count pass, where a dialog would be impossible.
- **No prompt discovery.** MCP prompt lookups (`/prompts`) walk YAML-declared `mcp` toolsets directly; prompts exposed by servers activated through the catalog are not surfaced. Tools — the primary interface — work fine.
- **Frozen at build time.** The list of servers is embedded in the binary. New entries land with each Docker Agent release.
@y
- **Streamable-http only.** The catalog deliberately excludes servers that require a local subprocess or the MCP gateway — declare those with [`type: mcp`](../../configuration/tools/index.md#mcp-tools) instead.
- **Catalog membership changes between releases.** The set of available servers is updated with each Docker Agent release as integrations are added or removed. Servers present in one release may not appear in the next.
- **Blocking enable.** DNS, TCP, MCP handshake and any OAuth flow happen synchronously inside `enable_remote_mcp_server` so the agent gets a deterministic result in the same turn. On startup, however, the runtime probes tools non-interactively (`mcp.WithoutInteractivePrompts`); OAuth-pending servers fail fast there and are silently deferred to the next interactive turn — including the sidebar-only tool-count pass, where a dialog would be impossible.
- **No prompt discovery.** MCP prompt lookups (`/prompts`) walk YAML-declared `mcp` toolsets directly; prompts exposed by servers activated through the catalog are not surfaced. Tools — the primary interface — work fine.
- **Frozen at build time.** The list of servers is embedded in the binary. New entries land with each Docker Agent release.
@z

@x
> [!TIP]
> **Pair with permissions**
>
> Because the agent decides which third-party services to talk to, this toolset works best with explicit [permissions](../../configuration/permissions/index.md) on the surrounding tools (filesystem writes, shell commands) so a misrouted server cannot exfiltrate data unnoticed.
@y
> [!TIP]
> **Pair with permissions**
>
> Because the agent decides which third-party services to talk to, this toolset works best with explicit [permissions](../../configuration/permissions/index.md) on the surrounding tools (filesystem writes, shell commands) so a misrouted server cannot exfiltrate data unnoticed.
@z
