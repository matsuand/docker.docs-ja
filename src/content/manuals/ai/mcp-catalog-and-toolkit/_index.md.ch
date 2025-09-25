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
an open protocol that standardizes how applications provide context and
additional functionality to large language models. MCP functions as a
client-server protocol, where the client, for example an application such as [Gordon](/manuals/ai/gordon/_index.md) or Claude Desktop, sends requests, and the server processes those requests to deliver the necessary context to the AI.
@y
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how applications provide context and
additional functionality to large language models. MCP functions as a
client-server protocol, where the client, for example an application such as [Gordon](manuals/ai/gordon/_index.md) or Claude Desktop, sends requests, and the server processes those requests to deliver the necessary context to the AI.
@z

@x
Docker MCP Catalog and Toolkit is a solution for securely building, sharing, and
running MCP tools. It simplifies the developer experience across the following areas:
@y
Docker MCP Catalog and Toolkit is a solution for securely building, sharing, and
running MCP tools. It simplifies the developer experience across the following areas:
@z

@x
- Discovery: A central catalog with verified, versioned tools.
- Credential management: OAuth-based and secure by default.
- Execution: Tools run in isolated, containerized environments.
- Portability: Use MCP tools across Claude, Cursor, Visual Studio Code, and more窶馬o code
  changes needed.
@y
- Discovery: A central catalog with verified, versioned tools.
- Credential management: OAuth-based and secure by default.
- Execution: Tools run in isolated, containerized environments.
- Portability: Use MCP tools across Claude, Cursor, Visual Studio Code, and more窶馬o code
  changes needed.
@z

@x
With Docker Hub and the MCP Toolkit, you can:
@y
With Docker Hub and the MCP Toolkit, you can:
@z

@x
- Launch MCP servers in seconds.
- Add tools using the CLI or GUI.
- Rely on Docker's pull-based infrastructure for trusted delivery.
@y
- Launch MCP servers in seconds.
- Add tools using the CLI or GUI.
- Rely on Docker's pull-based infrastructure for trusted delivery.
@z

@x
![MCP overview](./images/mcp-overview.svg)
@y
![MCP overview](./images/mcp-overview.svg)
@z

@x
## MCP servers
@y
## MCP servers
@z

@x
MCP servers are systems that use the [Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) to help manage
and run AI or machine learning models more efficiently. MCP allows different
parts of a system, like the model, data, and runtime environment, to
communicate in a standardized way. You can see them as
add-ons that provide specific tools to an LLM.
@y
MCP servers are systems that use the [Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) to help manage
and run AI or machine learning models more efficiently. MCP allows different
parts of a system, like the model, data, and runtime environment, to
communicate in a standardized way. You can see them as
add-ons that provide specific tools to an LLM.
@z

@x
![Example of the GitHub MCP server](./images/mcp-servers-overview.svg)
@y
![Example of the GitHub MCP server](./images/mcp-servers-overview.svg)
@z

@x
> [!TIP]
> Example:
> If you work in Visual Studio Code's _agent mode_ and ask it to create a
> branch in GitHub, it needs an MCP server provided by GitHub to do that.
>
> The MCP server provided by GitHub provides _tools_ to your model to perform
> atomic actions, like:
>
> - `Create a PR`
> - `Create a branch`
> - ...
>
@y
> [!TIP]
> Example:
> If you work in Visual Studio Code's _agent mode_ and ask it to create a
> branch in GitHub, it needs an MCP server provided by GitHub to do that.
>
> The MCP server provided by GitHub provides _tools_ to your model to perform
> atomic actions, like:
>
> - `Create a PR`
> - `Create a branch`
> - ...
>
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
