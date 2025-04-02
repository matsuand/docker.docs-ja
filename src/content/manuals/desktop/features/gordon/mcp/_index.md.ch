%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: MCP
description: Learn how to use MCP servers with Gordon
keywords: ai, mcp, gordon, docker desktop, docker, llm, 
@y
title: MCP
description: Learn how to use MCP servers with Gordon
keywords: ai, mcp, gordon, docker desktop, docker, llm, 
@z

% grid:

@x
- title: Built-in tools
  description: Use the built-in tools.
  icon: construction
  link: /desktop/features/gordon/mcp/built-in-tools
- title: MCP configuration
  description: Configure MCP tools on a per-project basis.
  icon: manufacturing
  link: /desktop/features/gordon/mcp/yaml
- title: MCP Server
  description: Use Gordon as an MCP server
  icon: dns
  link: /desktop/features/gordon/mcp/gordon-mcp-server/
@y
- title: Built-in tools
  description: Use the built-in tools.
  icon: construction
  link: __SUBDIR__/desktop/features/gordon/mcp/built-in-tools
- title: MCP configuration
  description: Configure MCP tools on a per-project basis.
  icon: manufacturing
  link: __SUBDIR__/desktop/features/gordon/mcp/yaml
- title: MCP Server
  description: Use Gordon as an MCP server
  icon: dns
  link: __SUBDIR__/desktop/features/gordon/mcp/gordon-mcp-server/
---
@z

@x
## What is MCP?
@y
## What is MCP?
@z

@x
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how applications provide context and extra
functionality to large language models. MCP functions as a client-server
protocol, where the client, for example an application like Gordon, sends
requests, and the server processes those requests to deliver the necessary
context to the AI. This context may be gathered by the MCP server by executing
some code to perform an action and getting the result of the action, calling
external APIs, etc.
@y
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how applications provide context and extra
functionality to large language models. MCP functions as a client-server
protocol, where the client, for example an application like Gordon, sends
requests, and the server processes those requests to deliver the necessary
context to the AI. This context may be gathered by the MCP server by executing
some code to perform an action and getting the result of the action, calling
external APIs, etc.
@z

@x
Gordon, along with other MCP clients like Claude Desktop or Cursor, can interact
with MCP servers running as containers.
@y
Gordon, along with other MCP clients like Claude Desktop or Cursor, can interact
with MCP servers running as containers.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
