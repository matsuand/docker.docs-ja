%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 (icon svg ファイルについては no slash 対応)

@x
title: Docker MCP Catalog and Toolkit
linkTitle: MCP Catalog and Toolkit
@y
title: Docker MCP Catalog と Toolkit
linkTitle: MCP Catalog と Toolkit
@z

@x
      text: Beta
@y
      text: ベータ
@z

@x
description: Learn about Docker's MCP catalog on Docker Hub
keywords: Docker, ai, mcp servers, ai agents, extension, docker desktop, llm, docker hub
@y
description: Docker Hub 上における Docker MCP Catalog について学びます。
keywords: Docker, ai, mcp servers, ai agents, extension, docker desktop, llm, docker hub
@z

% grid:

@x
 - title: Get started
   description: Learn how to quickly install and use the MCP Toolkit to set up servers and clients.
   icon: explore
   link: /ai/mcp-catalog-and-toolkit/get-started/
@y
 - title: はじめよう
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
{{< summary-bar feature_name="Docker MCP Catalog and Toolkit" >}}
@y
{{< summary-bar feature_name="Docker MCP Catalog and Toolkit" >}}
@z

@x
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how AI applications access external tools and data sources. Through a client-server architecture, applications such as [Gordon](/manuals/ai/gordon/_index.md) or Claude Desktop act as clients that send requests to MCP servers, which then process these requests and deliver the necessary context to AI models.
@y
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how AI applications access external tools and data sources. Through a client-server architecture, applications such as [Gordon](manuals/ai/gordon/_index.md) or Claude Desktop act as clients that send requests to MCP servers, which then process these requests and deliver the necessary context to AI models.
@z

@x
Building and managing MCP tools can be complex. Docker MCP Catalog and Toolkit simplifies this by providing a secure, streamlined way to build, share, and run MCP tools, addressing common challenges developers face.
@y
Building and managing MCP tools can be complex. Docker MCP Catalog and Toolkit simplifies this by providing a secure, streamlined way to build, share, and run MCP tools, addressing common challenges developers face.
@z

@x
Docker MCP Catalog and Toolkit simplifies the developer experience across the following areas:
@y
Docker MCP Catalog and Toolkit simplifies the developer experience across the following areas:
@z

@x
- Discovery: Centralized discovery through a verified catalog of versioned tools.
- Credential management: Secure credential management with OAuth-based authentication.
- Execution: Safe execution by running tools in isolated, containerized environments.
- Portability: True portability. MCP tools work seamlessly across Claude, Cursor, Visual Studio Code, and other platforms without requiring code changes.
@y
- Discovery: Centralized discovery through a verified catalog of versioned tools.
- Credential management: Secure credential management with OAuth-based authentication.
- Execution: Safe execution by running tools in isolated, containerized environments.
- Portability: True portability. MCP tools work seamlessly across Claude, Cursor, Visual Studio Code, and other platforms without requiring code changes.
@z

@x
This integrated approach means you can launch MCP servers in seconds, add new tools through either CLI or GUI interfaces, and rely on Docker's pull-based infrastructure for trusted delivery of your tools.
@y
This integrated approach means you can launch MCP servers in seconds, add new tools through either CLI or GUI interfaces, and rely on Docker's pull-based infrastructure for trusted delivery of your tools.
@z

@x
  ![MCP overview](./images/mcp-overview.svg)
@y
  ![MCP overview](./images/mcp-overview.svg)
@z

@x
To understand how Docker MCP Catalog and Toolkit achieves this streamlined experience, let's explore the underlying architecture and how its key components work together.
@y
To understand how Docker MCP Catalog and Toolkit achieves this streamlined experience, let's explore the underlying architecture and how its key components work together.
@z

@x
## MCP architecture overview
@y
## MCP architecture overview
@z

@x
MCP follows a client-server architecture that enables standardized communication between AI applications and external tools. This foundational understanding helps you build and integrate MCP solutions effectively.
@y
MCP follows a client-server architecture that enables standardized communication between AI applications and external tools. This foundational understanding helps you build and integrate MCP solutions effectively.
@z

@x
### MCP servers
@y
### MCP servers
@z

@x
MCP servers are specialized programs that provide specific tools and capabilities to AI models through [Model Context Protocol](https://modelcontextprotocol.io/introduction). Each server focuses on a particular domain, like GitHub integration, database access, or file management. You can think of them as extensions that give AI models the ability to interact with external systems and data sources.
@y
MCP servers are specialized programs that provide specific tools and capabilities to AI models through [Model Context Protocol](https://modelcontextprotocol.io/introduction). Each server focuses on a particular domain, like GitHub integration, database access, or file management. You can think of them as extensions that give AI models the ability to interact with external systems and data sources.
@z

@x
### MCP clients
@y
### MCP clients
@z

@x
MCP clients are the bridge between AI applications and MCP servers. They enable AI systems to discover, connect to, and interact with external tools and data sources through the standardized MCP protocol. A single client can connect to multiple MCP servers, while each server can also serve multiple clients, creating a flexible many-to-many relationship that allows for rich integration possibilities.
@y
MCP clients are the bridge between AI applications and MCP servers. They enable AI systems to discover, connect to, and interact with external tools and data sources through the standardized MCP protocol. A single client can connect to multiple MCP servers, while each server can also serve multiple clients, creating a flexible many-to-many relationship that allows for rich integration possibilities.
@z

@x
When you interact with an AI application that supports MCP, the client establishes connections to configured servers, discovers available tools and resources from all connected servers, executes requests when needed, and manages contextual information to enhance AI responses.
@y
When you interact with an AI application that supports MCP, the client establishes connections to configured servers, discovers available tools and resources from all connected servers, executes requests when needed, and manages contextual information to enhance AI responses.
@z

@x
### MCP Gateway
@y
### MCP Gateway
@z

@x
The [MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md) is Docker's open-source solution which connects MCP servers to MCP clients. It provides a unified endpoint that consolidates multiple MCP servers from the Docker MCP Catalog into a single, manageable connection point. Instead of clients connecting directly to individual MCP servers, the MCP Gateway sits in between, providing centralized connectivity, secure layer, and enterprise controls.
@y
The [MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md) is Docker's open-source solution which connects MCP servers to MCP clients. It provides a unified endpoint that consolidates multiple MCP servers from the Docker MCP Catalog into a single, manageable connection point. Instead of clients connecting directly to individual MCP servers, the MCP Gateway sits in between, providing centralized connectivity, secure layer, and enterprise controls.
@z

@x
In the context of Docker's MCP ecosystem:
@y
In the context of Docker's MCP ecosystem:
@z

@x
-  MCP Catalog hosts the MCP servers (the tools/capabilities)
-  MCP Gateway orchestrates and secures those servers
-  MCP clients connect through the Gateway to access cataloged servers
@y
-  MCP Catalog hosts the MCP servers (the tools/capabilities)
-  MCP Gateway orchestrates and secures those servers
-  MCP clients connect through the Gateway to access cataloged servers
@z

@x
## How MCP components work together
@y
## How MCP components work together
@z

@x
MCP components communicate through a structured flow that connects your development environment to external services. The following diagram shows how MCP works in practice with the key components:
@y
MCP components communicate through a structured flow that connects your development environment to external services. The following diagram shows how MCP works in practice with the key components:
@z

@x
1. The MCP client (VS Code) serves as your development environment where you interact with AI assistance.
2. The MCP Gateway acts as a secure orchestration layer, managing and routing connection between the client (VS Code) and the GitHub Official MCP server.
3. The MCP server acts as the bridge, providing specialized capabilities. In the following example, the GitHub Official server offers tools like creating pull requests, creating branches, and retrieving issues.
4. The data source (GitHub) provides the actual service or platform that the MCP server connects to for real-time information and actions.
@y
1. The MCP client (VS Code) serves as your development environment where you interact with AI assistance.
2. The MCP Gateway acts as a secure orchestration layer, managing and routing connection between the client (VS Code) and the GitHub Official MCP server.
3. The MCP server acts as the bridge, providing specialized capabilities. In the following example, the GitHub Official server offers tools like creating pull requests, creating branches, and retrieving issues.
4. The data source (GitHub) provides the actual service or platform that the MCP server connects to for real-time information and actions.
@z

@x
This architecture enables seamless integration where you can access GitHub functionality directly from VS Code through standardized MCP communication. The server translates requests between your development environment and external services, making it easy to incorporate various tools and data sources into your AI-assisted workflow without complex custom integrations.
@y
This architecture enables seamless integration where you can access GitHub functionality directly from VS Code through standardized MCP communication. The server translates requests between your development environment and external services, making it easy to incorporate various tools and data sources into your AI-assisted workflow without complex custom integrations.
@z

@x
  ![Example of the GitHub MCP server](./images/mcp-toolkit-overview.png)
@y
  ![Example of the GitHub MCP server](./images/mcp-toolkit-overview.png)
@z

@x
> [!TIP]
> Example:
> If you work in Visual Studio Code's _agent mode_ and ask it to create a
> branch in GitHub, it needs an MCP server provided by GitHub to do that.
@y
> [!TIP]
> Example:
> If you work in Visual Studio Code's _agent mode_ and ask it to create a
> branch in GitHub, it needs an MCP server provided by GitHub to do that.
@z

@x
> The MCP server provided by GitHub provides _tools_ to your model to perform
> atomic actions, like:
@y
> The MCP server provided by GitHub provides _tools_ to your model to perform
> atomic actions, like:
@z

@x
> - `Create a PR`
> - `Create a branch`
> - ...
@y
> - `Create a PR`
> - `Create a branch`
> - ...
@z

@x
## Learn more
@y
## Learn more
@z

% grid
