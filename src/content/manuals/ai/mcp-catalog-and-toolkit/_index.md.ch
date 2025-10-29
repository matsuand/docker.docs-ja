%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 (icon svg ファイルについては no slash 対応)

@x
title: Docker MCP Catalog and Toolkit
linkTitle: MCP Catalog and Toolkit
@y
title: Docker MCP Catalog and Toolkit
linkTitle: MCP Catalog and Toolkit
@z

@x
description: Learn about Docker's MCP catalog on Docker Hub
keywords: Docker, ai, mcp servers, ai agents, extension, docker desktop, llm, docker hub
@y
description: Learn about Docker's MCP catalog on Docker Hub
keywords: Docker, ai, mcp servers, ai agents, extension, docker desktop, llm, docker hub
@z

% grid:

@x
 - title: Get started with MCP Toolkit
   description: Learn how to quickly install and use the MCP Toolkit to set up servers and clients.
   icon: explore
   link: /ai/mcp-catalog-and-toolkit/get-started/
@y
 - title: Get started with MCP Toolkit
   description: Learn how to quickly install and use the MCP Toolkit to set up servers and clients.
   icon: explore
   link: __SUBDIR__/ai/mcp-catalog-and-toolkit/get-started/
@z

@x
 - title: MCP Catalog
   description: Learn about the benefits of the MCP Catalog, how you can use it, and how you can contribute
   icon: hub
   link: /ai/mcp-catalog-and-toolkit/catalog/
@y
 - title: MCP Catalog
   description: Learn about the benefits of the MCP Catalog, how you can use it, and how you can contribute
   icon: hub
   link: __SUBDIR__/ai/mcp-catalog-and-toolkit/catalog/
@z

@x
 - title: MCP Toolkit
   description: Learn about the MCP Toolkit to manage MCP servers and clients
   icon: /icons/toolkit.svg
   link: /ai/mcp-catalog-and-toolkit/toolkit/
@y
 - title: MCP Toolkit
   description: Learn about the MCP Toolkit to manage MCP servers and clients
   icon: icons/toolkit.svg
   link: __SUBDIR__/ai/mcp-catalog-and-toolkit/toolkit/
@z

@x
 - title: MCP Gateway
   description: Learn about the underlying technology that powers the MCP Toolkit
   icon: developer_board
   link: /ai/mcp-catalog-and-toolkit/toolkit/
@y
 - title: MCP Gateway
   description: Learn about the underlying technology that powers the MCP Toolkit
   icon: developer_board
   link: __SUBDIR__/ai/mcp-catalog-and-toolkit/toolkit/
@z

@x
 - title: Docker Hub MCP server
   description: Explore about the Docker Hub server for searching images, managing repositories, and more
   icon: device_hub
   link: /ai/mcp-catalog-and-toolkit/toolkit/
@y
 - title: Docker Hub MCP server
   description: Explore about the Docker Hub server for searching images, managing repositories, and more
   icon: device_hub
   link: __SUBDIR__/ai/mcp-catalog-and-toolkit/toolkit/
@z

@x
{{< summary-bar feature_name="Docker MCP Catalog and Toolkit" >}}
@y
{{< summary-bar feature_name="Docker MCP Catalog and Toolkit" >}}
@z

@x
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how AI applications access external tools
and data sources. By connecting LLMs to local development tools, databases,
APIs, and other resources, MCP extends their capabilities beyond their base
training.
@y
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how AI applications access external tools
and data sources. By connecting LLMs to local development tools, databases,
APIs, and other resources, MCP extends their capabilities beyond their base
training.
@z

@x
Through a client-server architecture, applications such as Claude, ChatGPT, and
[Gordon](/manuals/ai/gordon/_index.md) act as clients that send requests to MCP
servers, which then process these requests and deliver the necessary context to
AI models.
@y
Through a client-server architecture, applications such as Claude, ChatGPT, and
[Gordon](manuals/ai/gordon/_index.md) act as clients that send requests to MCP
servers, which then process these requests and deliver the necessary context to
AI models.
@z

@x
MCP servers extend the utility of AI applications, but running servers locally
also presents several operational challenges. Typically, servers must be
installed directly on your machine and configured individually for each
application. Running untrusted code locally requires careful vetting, and the
responsibility of keeping servers up-to-date and resolving environment
conflicts falls on the user.
@y
MCP servers extend the utility of AI applications, but running servers locally
also presents several operational challenges. Typically, servers must be
installed directly on your machine and configured individually for each
application. Running untrusted code locally requires careful vetting, and the
responsibility of keeping servers up-to-date and resolving environment
conflicts falls on the user.
@z

@x
## Docker MCP features
@y
## Docker MCP features
@z

@x
Docker provides three integrated components that address the challenges of
running local MCP servers:
@y
Docker provides three integrated components that address the challenges of
running local MCP servers:
@z

@x
MCP Catalog
: A curated collection of verified MCP servers, packaged and distributed as
container images via Docker Hub. All servers are versioned, come with full
provenance and SBOM metadata, and are continuously maintained and updated with
security patches.
@y
MCP Catalog
: A curated collection of verified MCP servers, packaged and distributed as
container images via Docker Hub. All servers are versioned, come with full
provenance and SBOM metadata, and are continuously maintained and updated with
security patches.
@z

@x
MCP Toolkit
: A graphical interface in Docker Desktop for discovering, configuring, and
managing MCP servers. The Toolkit provides a unified way to search for servers,
handle authentication, and connect them to AI applications.
@y
MCP Toolkit
: A graphical interface in Docker Desktop for discovering, configuring, and
managing MCP servers. The Toolkit provides a unified way to search for servers,
handle authentication, and connect them to AI applications.
@z

@x
MCP Gateway
: The core open source component that powers the MCP Toolkit. The MCP Gateway
manages MCP containers provides a unified endpoint that exposes your enabled
servers to all AI applications you use.
@y
MCP Gateway
: The core open source component that powers the MCP Toolkit. The MCP Gateway
manages MCP containers provides a unified endpoint that exposes your enabled
servers to all AI applications you use.
@z

@x
This integrated approach ensures:
@y
This integrated approach ensures:
@z

@x
- Simplified discovery and setup of trusted MCP servers from a curated catalog
  of tools
- Centralized configuration and authentication from within Docker Desktop
- A secure, consistent execution environment by default
- Improved performance since applications can share a single server runtime,
  compared to having to spin up duplicate servers for each application.
@y
- Simplified discovery and setup of trusted MCP servers from a curated catalog
  of tools
- Centralized configuration and authentication from within Docker Desktop
- A secure, consistent execution environment by default
- Improved performance since applications can share a single server runtime,
  compared to having to spin up duplicate servers for each application.
@z

@x
![MCP overview](./images/mcp-overview.svg)
@y
![MCP overview](./images/mcp-overview.svg)
@z

@x
## Learn more
@y
## Learn more
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
