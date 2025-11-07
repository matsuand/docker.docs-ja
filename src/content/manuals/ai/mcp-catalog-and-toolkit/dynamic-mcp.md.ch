%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Dynamic MCP
linkTitle: Dynamic MCP
description: Discover and add MCP servers on-demand using natural language with Dynamic MCP servers
keywords: dynamic mcps, mcp discovery, mcp-find, mcp-add, code-mode, ai agents, model context protocol
@y
title: Dynamic MCP
linkTitle: Dynamic MCP
description: Discover and add MCP servers on-demand using natural language with Dynamic MCP servers
keywords: dynamic mcps, mcp discovery, mcp-find, mcp-add, code-mode, ai agents, model context protocol
@z

@x
Dynamic MCP enables AI agents to discover and add MCP servers on-demand during
a conversation, without manual configuration. Instead of pre-configuring every
MCP server before starting your agent session, clients can search the
[MCP Catalog](/manuals/ai/mcp-catalog-and-toolkit/catalog.md) and add servers
as needed.
@y
Dynamic MCP enables AI agents to discover and add MCP servers on-demand during
a conversation, without manual configuration. Instead of pre-configuring every
MCP server before starting your agent session, clients can search the
[MCP Catalog](manuals/ai/mcp-catalog-and-toolkit/catalog.md) and add servers
as needed.
@z

@x
This capability is enabled automatically when you connect an MCP client to the
[MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md). The gateway
provides a set of primordial tools that agents use to discover and manage
servers during runtime.
@y
This capability is enabled automatically when you connect an MCP client to the
[MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/toolkit.md). The gateway
provides a set of primordial tools that agents use to discover and manage
servers during runtime.
@z

@x
{{% experimental %}}
@y
{{% experimental %}}
@z

@x
Dynamic MCP is an experimental feature in early development. While you're
welcome to try it out and explore its capabilities, you may encounter
unexpected behavior or limitations. Feedback is welcome via at [GitHub
issues](https://github.com/docker/mcp-gateway/issues) for bug reports and
[GitHub discussions](https://github.com/docker/mcp-gateway/discussions) for
general questions and feature requests.
@y
Dynamic MCP is an experimental feature in early development. While you're
welcome to try it out and explore its capabilities, you may encounter
unexpected behavior or limitations. Feedback is welcome via at [GitHub
issues](https://github.com/docker/mcp-gateway/issues) for bug reports and
[GitHub discussions](https://github.com/docker/mcp-gateway/discussions) for
general questions and feature requests.
@z

@x
{{% /experimental %}}
@y
{{% /experimental %}}
@z

@x
## How it works
@y
## How it works
@z

@x
When you connect a client to the MCP Gateway, the gateway exposes a small set
of management tools alongside any MCP servers you've already enabled. These
management tools let agents interact with the gateway's configuration:
@y
When you connect a client to the MCP Gateway, the gateway exposes a small set
of management tools alongside any MCP servers you've already enabled. These
management tools let agents interact with the gateway's configuration:
@z

@x
| Tool             | Description                                                              |
| ---------------- | ------------------------------------------------------------------------ |
| `mcp-find`       | Search for MCP servers in the catalog by name or description             |
| `mcp-add`        | Add a new MCP server to the current session                              |
| `mcp-config-set` | Configure settings for an MCP server                                     |
| `mcp-remove`     | Remove an MCP server from the session                                    |
| `mcp-exec`       | Execute a tool by name that exists in the current session                |
| `code-mode`      | Create a JavaScript-enabled tool that combines multiple MCP server tools |
@y
| Tool             | Description                                                              |
| ---------------- | ------------------------------------------------------------------------ |
| `mcp-find`       | Search for MCP servers in the catalog by name or description             |
| `mcp-add`        | Add a new MCP server to the current session                              |
| `mcp-config-set` | Configure settings for an MCP server                                     |
| `mcp-remove`     | Remove an MCP server from the session                                    |
| `mcp-exec`       | Execute a tool by name that exists in the current session                |
| `code-mode`      | Create a JavaScript-enabled tool that combines multiple MCP server tools |
@z

@x
With these tools available, an agent can search the catalog, add servers,
handle authentication, and use newly added tools directly without requiring a
restart or manual configuration.
@y
With these tools available, an agent can search the catalog, add servers,
handle authentication, and use newly added tools directly without requiring a
restart or manual configuration.
@z

@x
Dynamically added servers and tools are associated with your _current session
only_. When you start a new session, previously added servers are not
automatically included.
@y
Dynamically added servers and tools are associated with your _current session
only_. When you start a new session, previously added servers are not
automatically included.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To use Dynamic MCP, you need:
@y
To use Dynamic MCP, you need:
@z

@x
- Docker Desktop version 4.50 or later, with [MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md) enabled
- An LLM application that supports MCP (such as Claude Desktop, Visual Studio Code, or Claude Code)
- Your client configured to connect to the MCP Gateway
@y
- Docker Desktop version 4.50 or later, with [MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/toolkit.md) enabled
- An LLM application that supports MCP (such as Claude Desktop, Visual Studio Code, or Claude Code)
- Your client configured to connect to the MCP Gateway
@z

@x
See [Get started with Docker MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/get-started.md)
for setup instructions.
@y
See [Get started with Docker MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/get-started.md)
for setup instructions.
@z

@x
## Usage
@y
## Usage
@z

@x
Dynamic MCP is enabled automatically when you use the MCP Toolkit. Your
connected clients can now use `mcp-find`, `mcp-add`, and other management tools
during conversations.
@y
Dynamic MCP is enabled automatically when you use the MCP Toolkit. Your
connected clients can now use `mcp-find`, `mcp-add`, and other management tools
during conversations.
@z

@x
To see Dynamic MCP in action, connect your AI client to the Docker MCP Toolkit
and try this prompt:
@y
To see Dynamic MCP in action, connect your AI client to the Docker MCP Toolkit
and try this prompt:
@z

@x
```plaintext
What MCP servers can I use for working with SQL databases?
```
@y
```plaintext
What MCP servers can I use for working with SQL databases?
```
@z

@x
Given this prompt, your agent will use the `mcp-find` tool provided by MCP
Toolkit to search for SQL-related servers in the [MCP Catalog](./catalog.md).
@y
Given this prompt, your agent will use the `mcp-find` tool provided by MCP
Toolkit to search for SQL-related servers in the [MCP Catalog](./catalog.md).
@z

@x
And to add a server to a session, simply write a prompt and the MCP Toolkit
takes care of installing and running the server:
@y
And to add a server to a session, simply write a prompt and the MCP Toolkit
takes care of installing and running the server:
@z

@x
```plaintext
Add the postgres mcp server
```
@y
```plaintext
Add the postgres mcp server
```
@z

@x
## Tool composition with code mode
@y
## Tool composition with code mode
@z

@x
The `code-mode` tool is available as an experimental capability for creating
custom JavaScript functions that combine multiple MCP server tools. The
intended use case is to enable workflows that coordinate multiple services
in a single operation.
@y
The `code-mode` tool is available as an experimental capability for creating
custom JavaScript functions that combine multiple MCP server tools. The
intended use case is to enable workflows that coordinate multiple services
in a single operation.
@z

@x
> **Note**
>
> Code mode is in early development and is not yet reliable for general use.
> The documentation intentionally omits usage examples at this time.
>
> The core Dynamic MCP capabilities (`mcp-find`, `mcp-add`, `mcp-config-set`,
> `mcp-remove`) work as documented and are the recommended focus for current
> use.
@y
> **Note**
>
> Code mode is in early development and is not yet reliable for general use.
> The documentation intentionally omits usage examples at this time.
>
> The core Dynamic MCP capabilities (`mcp-find`, `mcp-add`, `mcp-config-set`,
> `mcp-remove`) work as documented and are the recommended focus for current
> use.
@z

@x
The architecture works as follows:
@y
The architecture works as follows:
@z

@x
1. The agent calls `code-mode` with a list of server names and a tool name
2. The gateway creates a sandbox with access to those servers' tools
3. A new tool is registered in the current session with the specified name
4. The agent calls the newly created tool
5. The code executes in the sandbox with access to the specified tools
6. Results are returned to the agent
@y
1. The agent calls `code-mode` with a list of server names and a tool name
2. The gateway creates a sandbox with access to those servers' tools
3. A new tool is registered in the current session with the specified name
4. The agent calls the newly created tool
5. The code executes in the sandbox with access to the specified tools
6. Results are returned to the agent
@z

@x
The sandbox can only interact with the outside world through MCP tools,
which are already running in isolated containers with restricted privileges.
@y
The sandbox can only interact with the outside world through MCP tools,
which are already running in isolated containers with restricted privileges.
@z

@x
## Security considerations
@y
## Security considerations
@z

@x
Dynamic MCP maintains the same security model as static MCP server
configuration in MCP Toolkit:
@y
Dynamic MCP maintains the same security model as static MCP server
configuration in MCP Toolkit:
@z

@x
- All servers in the MCP Catalog are built, signed, and maintained by Docker
- Servers run in isolated containers with restricted resources
- Code mode runs agent-written JavaScript in an isolated sandbox that can only
  interact through MCP tools
- Credentials are managed by the gateway and injected securely into containers
@y
- All servers in the MCP Catalog are built, signed, and maintained by Docker
- Servers run in isolated containers with restricted resources
- Code mode runs agent-written JavaScript in an isolated sandbox that can only
  interact through MCP tools
- Credentials are managed by the gateway and injected securely into containers
@z

@x
The key difference with dynamic capabilities is that agents can add new tools
during runtime.
@y
The key difference with dynamic capabilities is that agents can add new tools
during runtime.
@z

@x
## Disabling Dynamic MCP
@y
## Disabling Dynamic MCP
@z

@x
Dynamic MCP is enabled by default in the MCP Toolkit. If you prefer to use only
statically configured MCP servers, you can disable the dynamic tools feature:
@y
Dynamic MCP is enabled by default in the MCP Toolkit. If you prefer to use only
statically configured MCP servers, you can disable the dynamic tools feature:
@z

@x
```console
$ docker mcp feature disable dynamic-tools
```
@y
```console
$ docker mcp feature disable dynamic-tools
```
@z

@x
To re-enable the feature later:
@y
To re-enable the feature later:
@z

@x
```console
$ docker mcp feature enable dynamic-tools
```
@y
```console
$ docker mcp feature enable dynamic-tools
```
@z

@x
After changing this setting, you may need to restart any connected MCP clients.
@y
After changing this setting, you may need to restart any connected MCP clients.
@z

@x
## Further reading
@y
## Further reading
@z

@x
Check out the [Dynamic MCP servers with Docker](https://docker.com/blog) blog
post for more examples and inspiration on how you can use dynamic tools.
@y
Check out the [Dynamic MCP servers with Docker](https://docker.com/blog) blog
post for more examples and inspiration on how you can use dynamic tools.
@z
