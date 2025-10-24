%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
title: MCP Gateway
description: "Docker's MCP Gateway provides secure, centralized, and scalable orchestration of AI tools through containerized MCP serversâ€”empowering developers, operators, and security teams."
keywords: MCP Gateway
@y
title: MCP Gateway
description: "Docker's MCP Gateway provides secure, centralized, and scalable orchestration of AI tools through containerized MCP serversâ€”empowering developers, operators, and security teams."
keywords: MCP Gateway
@z

@x
The MCP Gateway is Docker's open-source enterprise-ready solution for
orchestrating and managing [Model Context Protocol
(MCP)](https://spec.modelcontextprotocol.io/) servers securely across
development and production environments. It is designed to help organizations
connect MCP servers from the [Docker MCP Catalog](https://hub.docker.com/mcp) to
MCP Clients without compromising security, visibility, or control.
@y
The MCP Gateway is Docker's open-source enterprise-ready solution for
orchestrating and managing [Model Context Protocol
(MCP)](https://spec.modelcontextprotocol.io/) servers securely across
development and production environments. It is designed to help organizations
connect MCP servers from the [Docker MCP Catalog](https://hub.docker.com/mcp) to
MCP Clients without compromising security, visibility, or control.
@z

@x
By unifying multiple MCP servers into a single, secure endpoint, the MCP Gateway offers
the following benefits:
@y
By unifying multiple MCP servers into a single, secure endpoint, the MCP Gateway offers
the following benefits:
@z

@x
- Secure by default: MCP servers run in isolated Docker containers with restricted
  privileges, network access, and resource usage.
- Unified management: One gateway endpoint centralizes configuration, credentials,
  and access control for all MCP servers.
- Enterprise observability: Built-in monitoring, logging, and filtering tools ensure
  full visibility and governance of AI tool activity.
@y
- Secure by default: MCP servers run in isolated Docker containers with restricted
  privileges, network access, and resource usage.
- Unified management: One gateway endpoint centralizes configuration, credentials,
  and access control for all MCP servers.
- Enterprise observability: Built-in monitoring, logging, and filtering tools ensure
  full visibility and governance of AI tool activity.
@z

@x
> [!NOTE]
> E2B sandboxes now include direct access to the Docker MCP Catalog, giving developers
> access to over 200 tools and services to seamlessly build and run AI agents. For
> more information, see [E2B Sandboxes](sandboxes.md).
@y
> [!NOTE]
> E2B sandboxes now include direct access to the Docker MCP Catalog, giving developers
> access to over 200 tools and services to seamlessly build and run AI agents. For
> more information, see [E2B Sandboxes](sandboxes.md).
@z

@x
## Who is the MCP Gateway designed for?
@y
## Who is the MCP Gateway designed for?
@z

@x
The MCP Gateway solves problems encountered by various groups:
@y
The MCP Gateway solves problems encountered by various groups:
@z

@x
- Developers: Deploy MCP servers locally and in production using Docker Compose,
  with built-in support for protocol handling, credential management, and security policies.
- Security teams: Achieve enterprise-grade isolation and visibility into AI tool
  behavior and access patterns.
- Operators: Scale effortlessly from local development environments to production
  infrastructure with consistent, low-touch operations.
@y
- Developers: Deploy MCP servers locally and in production using Docker Compose,
  with built-in support for protocol handling, credential management, and security policies.
- Security teams: Achieve enterprise-grade isolation and visibility into AI tool
  behavior and access patterns.
- Operators: Scale effortlessly from local development environments to production
  infrastructure with consistent, low-touch operations.
@z

@x
## Key features
@y
## Key features
@z

@x
- Server management: List, inspect, and call MCP tools, resources and prompts from multiple servers
- Container-based servers: Run MCP servers as Docker containers with proper isolation
- Secrets management: Secure handling of API keys and credentials via Docker Desktop
- Dynamic discovery and reloading: Automatic tool, prompt, and resource discovery from running servers
- Monitoring: Built-in logging and call tracing capabilities
@y
- Server management: List, inspect, and call MCP tools, resources and prompts from multiple servers
- Container-based servers: Run MCP servers as Docker containers with proper isolation
- Secrets management: Secure handling of API keys and credentials via Docker Desktop
- Dynamic discovery and reloading: Automatic tool, prompt, and resource discovery from running servers
- Monitoring: Built-in logging and call tracing capabilities
@z

@x
## Install a pre-release version of the MCP Gateway
@y
## Install a pre-release version of the MCP Gateway
@z

@x
If you use Docker Desktop, the MCP Gateway is readily available. Use the
following instructions to test pre-release versions.
@y
If you use Docker Desktop, the MCP Gateway is readily available. Use the
following instructions to test pre-release versions.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- Docker Desktop with the [MCP Toolkit feature enabled](../mcp-catalog-and-toolkit/toolkit.md#enable-docker-mcp-toolkit).
- Go 1.24+ (for development)
@y
- Docker Desktop with the [MCP Toolkit feature enabled](../mcp-catalog-and-toolkit/toolkit.md#enable-docker-mcp-toolkit).
- Go 1.24+ (for development)
@z

@x
### Install using a pre-built binary
@y
### Install using a pre-built binary
@z

@x
You can download the latest binary from the [GitHub releases page](https://github.com/docker/mcp-gateway/releases/latest).
@y
You can download the latest binary from the [GitHub releases page](https://github.com/docker/mcp-gateway/releases/latest).
@z

@x
Rename the relevant binary and copy it to the destination matching your OS:
@y
Rename the relevant binary and copy it to the destination matching your OS:
@z

@x
| OS      | Binary name      | Destination folder                  |
|---------|------------------|-------------------------------------|
| Linux   | `docker-mcp`     | `$HOME/.docker/cli-plugins`         |
| macOS   | `docker-mcp`     | `$HOME/.docker/cli-plugins`         |
| Windows | `docker-mcp.exe` | `%USERPROFILE%\.docker\cli-plugins` |
@y
| OS      | Binary name      | Destination folder                  |
|---------|------------------|-------------------------------------|
| Linux   | `docker-mcp`     | `$HOME/.docker/cli-plugins`         |
| macOS   | `docker-mcp`     | `$HOME/.docker/cli-plugins`         |
| Windows | `docker-mcp.exe` | `%USERPROFILE%\.docker\cli-plugins` |
@z

@x
Or copy it into one of these folders for installing it system-wide:
@y
Or copy it into one of these folders for installing it system-wide:
@z

@x
{{< tabs group="" >}}
{{< tab name="On Unix environments">}}
@y
{{< tabs group="" >}}
{{< tab name="On Unix environments">}}
@z

@x
* `/usr/local/lib/docker/cli-plugins` OR `/usr/local/libexec/docker/cli-plugins`
* `/usr/lib/docker/cli-plugins` OR `/usr/libexec/docker/cli-plugins`
@y
* `/usr/local/lib/docker/cli-plugins` OR `/usr/local/libexec/docker/cli-plugins`
* `/usr/lib/docker/cli-plugins` OR `/usr/libexec/docker/cli-plugins`
@z

@x
> [!NOTE]
> You may have to make the binaries executable with `chmod +x`:
> ```bash
> $ chmod +x ~/.docker/cli-plugins/docker-mcp
> ```
@y
> [!NOTE]
> You may have to make the binaries executable with `chmod +x`:
> ```bash
> $ chmod +x ~/.docker/cli-plugins/docker-mcp
> ```
@z

@x
{{< /tab >}}
{{< tab name="On Windows">}}
@y
{{< /tab >}}
{{< tab name="On Windows">}}
@z

@x
* `C:\ProgramData\Docker\cli-plugins`
* `C:\Program Files\Docker\cli-plugins`
@y
* `C:\ProgramData\Docker\cli-plugins`
* `C:\Program Files\Docker\cli-plugins`
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
You can now use the `mcp` command:
@y
You can now use the `mcp` command:
@z

@x
```bash
docker mcp --help
```
@y
```bash
docker mcp --help
```
@z

@x
## Use the MCP Gateway
@y
## Use the MCP Gateway
@z

@x
1. Select a server of your choice from the [MCP Catalog](https://hub.docker.com/mcp)
   and copy the install command from the **Manual installation** section.
@y
1. Select a server of your choice from the [MCP Catalog](https://hub.docker.com/mcp)
   and copy the install command from the **Manual installation** section.
@z

@x
1. For example, run this command in your terminal to install the `duckduckgo`
   MCP server:
@y
1. For example, run this command in your terminal to install the `duckduckgo`
   MCP server:
@z

@x
   ```console
   docker mcp server enable duckduckgo
   ```
@y
   ```console
   docker mcp server enable duckduckgo
   ```
@z

@x
1. Connect a client, like Visual Studio Code:
@y
1. Connect a client, like Visual Studio Code:
@z

@x
   ```console
   docker mcp client connect vscode
   ```
@y
   ```console
   docker mcp client connect vscode
   ```
@z

@x
1. Run the gateway:
@y
1. Run the gateway:
@z

@x
   ```console
   docker mcp gateway run
   ```
@y
   ```console
   docker mcp gateway run
   ```
@z

@x
Now your MCP gateway is running and you can leverage all the servers set up
behind it from Visual Studio Code.
@y
Now your MCP gateway is running and you can leverage all the servers set up
behind it from Visual Studio Code.
@z

@x
[View the complete docs on GitHub.](https://github.com/docker/mcp-gateway?tab=readme-ov-file#usage)
@y
[View the complete docs on GitHub.](https://github.com/docker/mcp-gateway?tab=readme-ov-file#usage)
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [Docker MCP Toolkit and catalog](/manuals/ai/mcp-catalog-and-toolkit/_index.md)
@y
- [Docker MCP Toolkit and catalog](manuals/ai/mcp-catalog-and-toolkit/_index.md)
@z
