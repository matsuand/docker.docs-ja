%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: MCP Gateway
description: "Docker's MCP Gateway provides secure, centralized, and scalable orchestration of AI tools through containerized MCP servers—empowering developers, operators, and security teams."
keywords: MCP Gateway
@y
title: MCP Gateway
description: "Docker's MCP Gateway provides secure, centralized, and scalable orchestration of AI tools through containerized MCP servers—empowering developers, operators, and security teams."
keywords: MCP Gateway
@z

@x
The MCP Gateway is Docker's open source solution for orchestrating Model
Context Protocol (MCP) servers. It acts as a centralized proxy between clients
and servers, managing configuration, credentials, and access control.
@y
The MCP Gateway is Docker's open source solution for orchestrating Model
Context Protocol (MCP) servers. It acts as a centralized proxy between clients
and servers, managing configuration, credentials, and access control.
@z

@x
When using MCP servers without the MCP Gateway, you need to configure
applications individually for each AI application. With the MCP Gateway, you
configure applications to connect to the Gateway. The Gateway then handles
server lifecycle, routing, and authentication across all your servers.
@y
When using MCP servers without the MCP Gateway, you need to configure
applications individually for each AI application. With the MCP Gateway, you
configure applications to connect to the Gateway. The Gateway then handles
server lifecycle, routing, and authentication across all your servers.
@z

@x
> [!NOTE]
> If you use Docker Desktop with MCP Toolkit enabled, the Gateway runs
> automatically in the background. You don't need to start or configure it
> manually. This documentation is for users who want to understand how the
> Gateway works or run it directly for advanced use cases.
@y
> [!NOTE]
> If you use Docker Desktop with MCP Toolkit enabled, the Gateway runs
> automatically in the background. You don't need to start or configure it
> manually. This documentation is for users who want to understand how the
> Gateway works or run it directly for advanced use cases.
@z

@x
> [!TIP]
> E2B sandboxes now include direct access to the Docker MCP Catalog, giving developers
> access to over 200 tools and services to seamlessly build and run AI agents. For
> more information, see [E2B Sandboxes](sandboxes.md).
@y
> [!TIP]
> E2B sandboxes now include direct access to the Docker MCP Catalog, giving developers
> access to over 200 tools and services to seamlessly build and run AI agents. For
> more information, see [E2B Sandboxes](sandboxes.md).
@z

@x
## How it works
@y
## How it works
@z

@x
MCP Gateway runs MCP servers in isolated Docker containers with restricted
privileges, network access, and resource usage. It includes built-in logging
and call-tracing capabilities to ensure full visibility and governance of AI
tool activity.
@y
MCP Gateway runs MCP servers in isolated Docker containers with restricted
privileges, network access, and resource usage. It includes built-in logging
and call-tracing capabilities to ensure full visibility and governance of AI
tool activity.
@z

@x
The MCP Gateway manages the server's entire lifecycle. When an AI application
needs to use a tool, it sends a request to the Gateway. The Gateway identifies
which server handles that tool and, if the server isn't already running, starts
it as a Docker container. The Gateway then injects any required credentials,
applies security restrictions, and forwards the request to the server. The
server processes the request and returns the result through the Gateway back to
the AI application.
@y
The MCP Gateway manages the server's entire lifecycle. When an AI application
needs to use a tool, it sends a request to the Gateway. The Gateway identifies
which server handles that tool and, if the server isn't already running, starts
it as a Docker container. The Gateway then injects any required credentials,
applies security restrictions, and forwards the request to the server. The
server processes the request and returns the result through the Gateway back to
the AI application.
@z

@x
The MCP Gateway solves a fundamental problem: MCP servers are just programs
that need to run somewhere. Running them directly on your machine means dealing
with installation, dependencies, updates, and security risks. By running them
as containers managed by the Gateway, you get isolation, consistent
environments, and centralized control.
@y
The MCP Gateway solves a fundamental problem: MCP servers are just programs
that need to run somewhere. Running them directly on your machine means dealing
with installation, dependencies, updates, and security risks. By running them
as containers managed by the Gateway, you get isolation, consistent
environments, and centralized control.
@z

@x
## Usage
@y
## Usage
@z

@x
To use the MCP Gateway, you'll need Docker Desktop with MCP Toolkit enabled.
Follow the [MCP Toolkit guide](toolkit.md) to enable and configure servers
through the graphical interface.
@y
To use the MCP Gateway, you'll need Docker Desktop with MCP Toolkit enabled.
Follow the [MCP Toolkit guide](toolkit.md) to enable and configure servers
through the graphical interface.
@z

@x
### Manage the MCP Gateway from the CLI
@y
### Manage the MCP Gateway from the CLI
@z

@x
With MCP Toolkit enabled, you can also interact with the MCP Gateway using the
CLI. The `docker mcp` suite of commands lets you manage servers and tools
directly from your terminal. You can also manually run Gateways with custom
configurations, including security restrictions, server catalogs, and more.
@y
With MCP Toolkit enabled, you can also interact with the MCP Gateway using the
CLI. The `docker mcp` suite of commands lets you manage servers and tools
directly from your terminal. You can also manually run Gateways with custom
configurations, including security restrictions, server catalogs, and more.
@z

@x
To run an MCP Gateway manually, with customized parameters, use the `docker
mcp` suite of commands.
@y
To run an MCP Gateway manually, with customized parameters, use the `docker
mcp` suite of commands.
@z

@x
1. Browse the [MCP Catalog](https://hub.docker.com/mcp) for a server that you
   want to use, and copy the install command from the **Manual installation**
   section.
@y
1. Browse the [MCP Catalog](https://hub.docker.com/mcp) for a server that you
   want to use, and copy the install command from the **Manual installation**
   section.
@z

@x
   For example, run this command in your terminal to install the `duckduckgo`
   MCP server:
@y
   For example, run this command in your terminal to install the `duckduckgo`
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
2. Connect a client, like Claude Code:
@y
2. Connect a client, like Claude Code:
@z

@x
   ```console
   docker mcp client connect claude-code
   ```
@y
   ```console
   docker mcp client connect claude-code
   ```
@z

@x
3. Run the gateway:
@y
3. Run the gateway:
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
behind it from Claude Code.
@y
Now your MCP gateway is running and you can leverage all the servers set up
behind it from Claude Code.
@z

@x
### Install the MCP Gateway manually
@y
### Install the MCP Gateway manually
@z

@x
For Docker Engine without Docker Desktop, you'll need to download and install
the MCP Gateway separately before you can run it.
@y
For Docker Engine without Docker Desktop, you'll need to download and install
the MCP Gateway separately before you can run it.
@z

@x
1. Download the latest binary from the [GitHub releases page](https://github.com/docker/mcp-gateway/releases/latest).
@y
1. Download the latest binary from the [GitHub releases page](https://github.com/docker/mcp-gateway/releases/latest).
@z

@x
2. Move or symlink the binary to the destination matching your OS:
@y
2. Move or symlink the binary to the destination matching your OS:
@z

@x
   | OS      | Binary destination                  |
   | ------- | ----------------------------------- |
   | Linux   | `~/.docker/cli-plugins/docker-mcp`  |
   | macOS   | `~/.docker/cli-plugins/docker-mcp`  |
   | Windows | `%USERPROFILE%\.docker\cli-plugins` |
@y
   | OS      | Binary destination                  |
   | ------- | ----------------------------------- |
   | Linux   | `~/.docker/cli-plugins/docker-mcp`  |
   | macOS   | `~/.docker/cli-plugins/docker-mcp`  |
   | Windows | `%USERPROFILE%\.docker\cli-plugins` |
@z

@x
3. Make the binaries executable:
@y
3. Make the binaries executable:
@z

@x
   ```bash
   $ chmod +x ~/.docker/cli-plugins/docker-mcp
   ```
@y
   ```bash
   $ chmod +x ~/.docker/cli-plugins/docker-mcp
   ```
@z

@x
You can now use the `docker mcp` command:
@y
You can now use the `docker mcp` command:
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
## Additional information
@y
## Additional information
@z

@x
For more details on how the MCP Gateway works and available customization
options, see the complete documentation [on GitHub](https://github.com/docker/mcp-gateway).
@y
For more details on how the MCP Gateway works and available customization
options, see the complete documentation [on GitHub](https://github.com/docker/mcp-gateway).
@z
