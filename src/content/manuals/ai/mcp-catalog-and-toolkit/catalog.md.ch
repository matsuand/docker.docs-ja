%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker MCP Catalog
linkTitle: MCP Catalog
description: Learn about the benefits of the MCP Catalog, how you can use it, and how you can contribute
keywords: docker hub, mcp, mcp servers, ai agents, catalog, docker
@y
title: Docker MCP Catalog
linkTitle: MCP Catalog
description: Learn about the benefits of the MCP Catalog, how you can use it, and how you can contribute
keywords: docker hub, mcp, mcp servers, ai agents, catalog, docker
@z

@x
{{< summary-bar feature_name="Docker MCP Catalog" >}}
@y
{{< summary-bar feature_name="Docker MCP Catalog" >}}
@z

@x
The [Docker MCP Catalog](https://hub.docker.com/mcp) is a centralized, trusted
registry for discovering, sharing, and running MCP-compatible tools. Integrated
with Docker Hub, it offers verified, versioned, and curated MCP servers
packaged as Docker images. The catalog is also available in Docker Desktop.
@y
The [Docker MCP Catalog](https://hub.docker.com/mcp) is a centralized, trusted
registry for discovering, sharing, and running MCP-compatible tools. Integrated
with Docker Hub, it offers verified, versioned, and curated MCP servers
packaged as Docker images. The catalog is also available in Docker Desktop.
@z

@x
The catalog solves common MCP server challenges:
@y
The catalog solves common MCP server challenges:
@z

@x
- Environment conflicts. Tools often need specific runtimes that might clash
  with existing setups.
- Lack of isolation. Traditional setups risk exposing the host system.
- Setup complexity. Manual installation and configuration slow adoption.
- Inconsistency across platforms. Tools might behave unpredictably on different
  operating systems.
@y
- Environment conflicts. Tools often need specific runtimes that might clash
  with existing setups.
- Lack of isolation. Traditional setups risk exposing the host system.
- Setup complexity. Manual installation and configuration slow adoption.
- Inconsistency across platforms. Tools might behave unpredictably on different
  operating systems.
@z

@x
With Docker, each MCP server runs as a self-contained container. This makes it
portable, isolated, and consistent. You can launch tools instantly using the
Docker CLI or Docker Desktop, without worrying about dependencies or
compatibility.
@y
With Docker, each MCP server runs as a self-contained container. This makes it
portable, isolated, and consistent. You can launch tools instantly using the
Docker CLI or Docker Desktop, without worrying about dependencies or
compatibility.
@z

@x
## Key features
@y
## Key features
@z

@x
- Over 100 verified MCP servers in one place.
- Publisher verification and versioned releases.
- Pull-based distribution using Docker infrastructure.
- Tools provided by partners such as New Relic, Stripe, Grafana, and more.
@y
- Over 100 verified MCP servers in one place.
- Publisher verification and versioned releases.
- Pull-based distribution using Docker infrastructure.
- Tools provided by partners such as New Relic, Stripe, Grafana, and more.
@z

@x
## How it works
@y
## How it works
@z

@x
Each tool in the MCP Catalog is packaged as a Docker image with metadata.
@y
Each tool in the MCP Catalog is packaged as a Docker image with metadata.
@z

@x
- Discover tools on Docker Hub under the `mcp/` namespace.
- Connect tools to your preferred agents with simple configuration through the
  [MCP Toolkit](toolkit.md).
- Pull and run tools using Docker Desktop or the CLI.
@y
- Discover tools on Docker Hub under the `mcp/` namespace.
- Connect tools to your preferred agents with simple configuration through the
  [MCP Toolkit](toolkit.md).
- Pull and run tools using Docker Desktop or the CLI.
@z

@x
Each catalog entry displays:
@y
Each catalog entry displays:
@z

@x
- Tool description and metadata.
- Version history.
- List of tools provided by the MCP server.
- Example configuration for agent integration.
@y
- Tool description and metadata.
- Version history.
- List of tools provided by the MCP server.
- Example configuration for agent integration.
@z

@x
## Use an MCP server from the catalog
@y
## Use an MCP server from the catalog
@z

@x
To use an MCP server from the catalog, see [MCP Toolkit](toolkit.md).
@y
To use an MCP server from the catalog, see [MCP Toolkit](toolkit.md).
@z

@x
## Contribute an MCP server to the catalog
@y
## Contribute an MCP server to the catalog
@z

@x
The MCP server registry is available at
https://github.com/docker/mcp-registry. To submit an MCP server, follow the
[contributing guidelines](https://github.com/docker/mcp-registry/blob/main/CONTRIBUTING.md).
@y
The MCP server registry is available at
https://github.com/docker/mcp-registry. To submit an MCP server, follow the
[contributing guidelines](https://github.com/docker/mcp-registry/blob/main/CONTRIBUTING.md).
@z

@x
When your pull request is reviewed and approved, your MCP server is available
within 24 hours on:
@y
When your pull request is reviewed and approved, your MCP server is available
within 24 hours on:
@z

@x
- Docker Desktop's [MCP Toolkit feature](toolkit.md).
- The [Docker MCP Catalog](https://hub.docker.com/mcp).
- The [Docker Hub](https://hub.docker.com/u/mcp) `mcp` namespace (for MCP
  servers built by Docker).
@y
- Docker Desktop's [MCP Toolkit feature](toolkit.md).
- The [Docker MCP Catalog](https://hub.docker.com/mcp).
- The [Docker Hub](https://hub.docker.com/u/mcp) `mcp` namespace (for MCP
  servers built by Docker).
@z
