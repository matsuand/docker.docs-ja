%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker MCP Catalog
description: Learn about the benefits of the MCP Catalog, how you can use it, and how you can contribute
keywords: docker hub, mcp, mcp servers, ai agents, calatog, docker
@y
title: Docker MCP Catalog
description: Learn about the benefits of the MCP Catalog, how you can use it, and how you can contribute
keywords: docker hub, mcp, mcp servers, ai agents, calatog, docker
@z

@x
The [Docker MCP Catalog](https://hub.docker.com/catalogs/mcp) is a centralized, trusted registry for discovering, sharing, and running MCP-compatible tools. Seamlessly integrated into Docker Hub, it offers verified, versioned, and curated MCP servers packaged as Docker images. 
@y
The [Docker MCP Catalog](https://hub.docker.com/catalogs/mcp) is a centralized, trusted registry for discovering, sharing, and running MCP-compatible tools. Seamlessly integrated into Docker Hub, it offers verified, versioned, and curated MCP servers packaged as Docker images. 
@z

@x
The catalog also solves common MCP server challenges:
@y
The catalog also solves common MCP server challenges:
@z

@x
- Environment conflicts: Tools often need specific runtimes that may clash with existing setups.
- Lack of isolation: Traditional setups risk exposing the host system.
- Setup complexity: Manual installation and configuration result in slow adoption.
- Inconsistency across platforms: Tools may behave unpredictably on different OSes.
@y
- Environment conflicts: Tools often need specific runtimes that may clash with existing setups.
- Lack of isolation: Traditional setups risk exposing the host system.
- Setup complexity: Manual installation and configuration result in slow adoption.
- Inconsistency across platforms: Tools may behave unpredictably on different OSes.
@z

@x
With Docker, each MCP server runs as a self-contained container so it is portable, isolated, and consistent. You can launch tools instantly using Docker CLI or Docker Desktop, without worrying about dependencies or compatibility.
@y
With Docker, each MCP server runs as a self-contained container so it is portable, isolated, and consistent. You can launch tools instantly using Docker CLI or Docker Desktop, without worrying about dependencies or compatibility.
@z

@x
## Key features
@y
## Key features
@z

@x
- Over 100 verified MCP servers in one place
- Publisher verification and versioned releases
- Pull-based distribution using Docker’s infrastructure
- Tools provided by partners such as New Relic, Stripe, Grafana, and more
@y
- Over 100 verified MCP servers in one place
- Publisher verification and versioned releases
- Pull-based distribution using Docker’s infrastructure
- Tools provided by partners such as New Relic, Stripe, Grafana, and more
@z

@x
## How it works
@y
## How it works
@z

@x
Each tool in the MCP Catalog is packaged as a Docker image with metadata. Developers can:
@y
Each tool in the MCP Catalog is packaged as a Docker image with metadata. Developers can:
@z

@x
- Discover tools via Docker Hub under the mcp/ namespace.
- Connect tools to their preferred agents with simple configuration through the [MCP Toolkit](toolkit.md)
- Pull and run tools using Docker Desktop or the CLI.
@y
- Discover tools via Docker Hub under the mcp/ namespace.
- Connect tools to their preferred agents with simple configuration through the [MCP Toolkit](toolkit.md)
- Pull and run tools using Docker Desktop or the CLI.
@z

@x
Each catalog entry provides:
@y
Each catalog entry provides:
@z

@x
- Tool description and metadata
- Version history
- Example configuration for agent integration
@y
- Tool description and metadata
- Version history
- Example configuration for agent integration
@z

@x
## Example: How to use an MCP server from Docker Hub
@y
## Example: How to use an MCP server from Docker Hub
@z

@x
The following example uses the Puppeteer MCP server to take a screenshot of a website and invert the colors using Claude Desktop.
@y
The following example uses the Puppeteer MCP server to take a screenshot of a website and invert the colors using Claude Desktop.
@z

@x
{{< tabs >}}
{{< tab name="Using the MCP Toolkit (Recommended)" >}}
@y
{{< tabs >}}
{{< tab name="Using the MCP Toolkit (Recommended)" >}}
@z

@x
1. Make sure you have [installed the Docker Desktop Docker MCP Toolkit extension](toolkit.md).
2. From the extension, search for the Puppeteer MCP server in the **MCP Servers** tab, and toggle it on to enable.
3. From the **MCP Clients** tab, select the **Connect** button for Claude Desktop. 
4. Within Claude Desktop, submit the following prompt using the Sonnet 3.5 model:
@y
1. Make sure you have [installed the Docker Desktop Docker MCP Toolkit extension](toolkit.md).
2. From the extension, search for the Puppeteer MCP server in the **MCP Servers** tab, and toggle it on to enable.
3. From the **MCP Clients** tab, select the **Connect** button for Claude Desktop. 
4. Within Claude Desktop, submit the following prompt using the Sonnet 3.5 model:
@z

@x
   ```text
   Take a screenshot of docs.docker.com and then invert the colors
   ```
@y
   ```text
   Take a screenshot of docs.docker.com and then invert the colors
   ```
@z

@x
{{< /tab >}}
{{< tab name="Manually set it up" >}}
@y
{{< /tab >}}
{{< tab name="Manually set it up" >}}
@z

@x
1. Update the `claude_desktop_config.json` file to include the following configuration:
@y
1. Update the `claude_desktop_config.json` file to include the following configuration:
@z

@x
   ```json
   {
     "mcpServers": {
       "puppeteer": {
         "command": "docker",
         "args": [
           "run",
           "-i",
           "--rm",
           "-e",
           "DOCKER_CONTAINER",
           "mcp/puppeteer"
         ],
         "env": {
           "DOCKER_CONTAINER": "true"
         }
       }
     }
   }
   ```
2. Restart Claude Desktop to apply the changed config file.
3. Submit the following prompt using the Sonnet 3.5 model:
@y
   ```json
   {
     "mcpServers": {
       "puppeteer": {
         "command": "docker",
         "args": [
           "run",
           "-i",
           "--rm",
           "-e",
           "DOCKER_CONTAINER",
           "mcp/puppeteer"
         ],
         "env": {
           "DOCKER_CONTAINER": "true"
         }
       }
     }
   }
   ```
2. Restart Claude Desktop to apply the changed config file.
3. Submit the following prompt using the Sonnet 3.5 model:
@z

@x
   ```text
   Take a screenshot of docs.docker.com and then invert the colors
   ```
@y
   ```text
   Take a screenshot of docs.docker.com and then invert the colors
   ```
@z

@x
Once you've given your consent to use the new tools, Claude spins up the Puppeteer MCP server inside a container, navigates to the target URL, captures and modify the page, and returns the screenshot.
@y
Once you've given your consent to use the new tools, Claude spins up the Puppeteer MCP server inside a container, navigates to the target URL, captures and modify the page, and returns the screenshot.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Contribute an MCP server to the catalog
@y
## Contribute an MCP server to the catalog
@z

@x
If you would like to add you MCP server to the Docker MCP Catalog, fill out the Docker [MCP submission form](https://www.docker.com/products/mcp-catalog-and-toolkit/#get_updates).
@y
If you would like to add you MCP server to the Docker MCP Catalog, fill out the Docker [MCP submission form](https://www.docker.com/products/mcp-catalog-and-toolkit/#get_updates).
@z
