%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker MCP Catalog
linkTitle: Catalog
description: Browse Docker's curated collection of verified MCP servers, and create custom catalogs for your team or organization.
keywords: docker hub, mcp, mcp servers, ai agents, catalog, custom catalog, docker
@y
title: Docker MCP Catalog
linkTitle: Catalog
description: Browse Docker's curated collection of verified MCP servers, and create custom catalogs for your team or organization.
keywords: docker hub, mcp, mcp servers, ai agents, catalog, custom catalog, docker
@z

@x
{{< summary-bar feature_name="Docker MCP Catalog" >}}
@y
{{< summary-bar feature_name="Docker MCP Catalog" >}}
@z

@x
The [Docker MCP Catalog](https://hub.docker.com/mcp) is a curated collection of
verified MCP servers, packaged as Docker images and distributed through Docker
Hub. It solves common challenges with running MCP servers locally: environment
conflicts, setup complexity, and security concerns.
@y
The [Docker MCP Catalog](https://hub.docker.com/mcp) is a curated collection of
verified MCP servers, packaged as Docker images and distributed through Docker
Hub. It solves common challenges with running MCP servers locally: environment
conflicts, setup complexity, and security concerns.
@z

@x
The catalog serves as the source of available MCP servers. When you add servers
to your [profiles](/manuals/ai/mcp-catalog-and-toolkit/profiles.md), you select
them from the catalog. Each server runs as an isolated container, making it
portable and consistent across different environments.
@y
The catalog serves as the source of available MCP servers. When you add servers
to your [profiles](manuals/ai/mcp-catalog-and-toolkit/profiles.md), you select
them from the catalog. Each server runs as an isolated container, making it
portable and consistent across different environments.
@z

@x
> [!NOTE]
> E2B sandboxes now include direct access to the Docker MCP Catalog, giving
> developers access to over 200 tools and services to seamlessly build and run
> AI agents. For more information, see [E2B Sandboxes](e2b-sandboxes.md).
@y
> [!NOTE]
> E2B sandboxes now include direct access to the Docker MCP Catalog, giving
> developers access to over 200 tools and services to seamlessly build and run
> AI agents. For more information, see [E2B Sandboxes](e2b-sandboxes.md).
@z

@x
## What's in the catalog
@y
## What's in the catalog
@z

@x
The Docker MCP Catalog includes:
@y
The Docker MCP Catalog includes:
@z

@x
- Verified servers: All servers are versioned with full provenance and SBOM
  metadata
- Partner tools: Servers from New Relic, Stripe, Grafana, and other trusted
  partners
- Docker-built servers: Locally-running servers built and digitally signed by
  Docker for enhanced security
- Remote services: Cloud-hosted servers that connect to external services like
  GitHub, Notion, and Linear
@y
- Verified servers: All servers are versioned with full provenance and SBOM
  metadata
- Partner tools: Servers from New Relic, Stripe, Grafana, and other trusted
  partners
- Docker-built servers: Locally-running servers built and digitally signed by
  Docker for enhanced security
- Remote services: Cloud-hosted servers that connect to external services like
  GitHub, Notion, and Linear
@z

@x
### Local versus remote servers
@y
### Local versus remote servers
@z

@x
The catalog contains two types of servers based on where they run:
@y
The catalog contains two types of servers based on where they run:
@z

@x
Local servers run as containers on your machine. They work offline once
downloaded and offer predictable performance and complete data privacy. Docker
builds and signs all local servers in the catalog.
@y
Local servers run as containers on your machine. They work offline once
downloaded and offer predictable performance and complete data privacy. Docker
builds and signs all local servers in the catalog.
@z

@x
Remote servers run on the provider's infrastructure and connect to external
services. Many remote servers use OAuth authentication, which the MCP Toolkit
handles automatically through your browser.
@y
Remote servers run on the provider's infrastructure and connect to external
services. Many remote servers use OAuth authentication, which the MCP Toolkit
handles automatically through your browser.
@z

@x
## Browse the catalog
@y
## Browse the catalog
@z

@x
Browse available MCP servers at [hub.docker.com/mcp](https://hub.docker.com/mcp)
or directly in Docker Desktop:
@y
Browse available MCP servers at [hub.docker.com/mcp](https://hub.docker.com/mcp)
or directly in Docker Desktop:
@z

@x
1. In Docker Desktop, select **MCP Toolkit**.
2. Select the **Catalog** tab to browse available servers.
3. Select a server to view its description, tools, and configuration options.
@y
1. In Docker Desktop, select **MCP Toolkit**.
2. Select the **Catalog** tab to browse available servers.
3. Select a server to view its description, tools, and configuration options.
@z

@x
## Add servers to a profile
@y
## Add servers to a profile
@z

@x
To add a server from the catalog to a profile:
@y
To add a server from the catalog to a profile:
@z

@x
1. In the **Catalog** tab, select the checkbox next to a server.
2. Choose the profile to add it to from the drop-down.
@y
1. In the **Catalog** tab, select the checkbox next to a server.
2. Choose the profile to add it to from the drop-down.
@z

@x
For step-by-step instructions and client connection, see
[Get started with MCP Toolkit](get-started.md) or
[MCP Profiles](profiles.md).
@y
For step-by-step instructions and client connection, see
[Get started with MCP Toolkit](get-started.md) or
[MCP Profiles](profiles.md).
@z

@x
## Custom catalogs
@y
## Custom catalogs
@z

@x
Custom catalogs let you curate focused collections of servers for your team or
organization. Instead of exposing all 300+ servers in the Docker catalog, you
define exactly which servers are available.
@y
Custom catalogs let you curate focused collections of servers for your team or
organization. Instead of exposing all 300+ servers in the Docker catalog, you
define exactly which servers are available.
@z

@x
Common use cases:
@y
Common use cases:
@z

@x
- Restrict which servers your organization approves for use
- Add your organization's private MCP servers alongside public ones
- Control which server versions your team uses
- Define the server set available to AI agents using [Dynamic MCP](dynamic-mcp.md)
@y
- Restrict which servers your organization approves for use
- Add your organization's private MCP servers alongside public ones
- Control which server versions your team uses
- Define the server set available to AI agents using [Dynamic MCP](dynamic-mcp.md)
@z

@x
### Custom catalogs with Dynamic MCP
@y
### Custom catalogs with Dynamic MCP
@z

@x
Custom catalogs work particularly well with
[Dynamic MCP](/ai/mcp-catalog-and-toolkit/dynamic-mcp/), where agents discover
and add MCP servers on-demand during conversations. When you run the gateway
with a custom catalog, the `mcp-find` tool searches only within that catalog.
If your catalog contains 20 servers instead of 300+, agents work within that
focused set, discovering and enabling tools as needed without manual
configuration each time.
@y
Custom catalogs work particularly well with
[Dynamic MCP](__SUBDIR__/ai/mcp-catalog-and-toolkit/dynamic-mcp/), where agents discover
and add MCP servers on-demand during conversations. When you run the gateway
with a custom catalog, the `mcp-find` tool searches only within that catalog.
If your catalog contains 20 servers instead of 300+, agents work within that
focused set, discovering and enabling tools as needed without manual
configuration each time.
@z

@x
### Import a custom catalog
@y
### Import a custom catalog
@z

@x
If someone on your team has created and published a catalog, you can import it
using its OCI registry reference.
@y
If someone on your team has created and published a catalog, you can import it
using its OCI registry reference.
@z

@x
In Docker Desktop:
@y
In Docker Desktop:
@z

@x
1. Select **MCP Toolkit** and select the **Catalog** tab.
2. Select **Import catalog**.
3. Enter the OCI reference for the catalog (for example,
   `registry.example.com/mcp/team-catalog:latest`).
4. Select **Import**.
@y
1. Select **MCP Toolkit** and select the **Catalog** tab.
2. Select **Import catalog**.
3. Enter the OCI reference for the catalog (for example,
   `registry.example.com/mcp/team-catalog:latest`).
4. Select **Import**.
@z

@x
Using the CLI:
@y
Using the CLI:
@z

@x
```console
$ docker mcp catalog pull <oci-reference>
```
@y
```console
$ docker mcp catalog pull <oci-reference>
```
@z

@x
Once imported, the catalog appears alongside the Docker catalog and you can add
its servers to your profiles.
@y
Once imported, the catalog appears alongside the Docker catalog and you can add
its servers to your profiles.
@z

@x
### Create and manage custom catalogs
@y
### Create and manage custom catalogs
@z

@x
Creating and managing custom catalogs requires the CLI. See
[Custom catalogs](/manuals/ai/mcp-catalog-and-toolkit/cli.md#custom-catalogs)
in the CLI how-to for step-by-step instructions, including:
@y
Creating and managing custom catalogs requires the CLI. See
[Custom catalogs](manuals/ai/mcp-catalog-and-toolkit/cli.md#custom-catalogs)
in the CLI how-to for step-by-step instructions, including:
@z

@x
- Curating a subset of the Docker catalog
- Adding private servers to a catalog
- Building a focused catalog from scratch
- Pushing a catalog to a registry for your team to import
@y
- Curating a subset of the Docker catalog
- Adding private servers to a catalog
- Building a focused catalog from scratch
- Pushing a catalog to a registry for your team to import
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
