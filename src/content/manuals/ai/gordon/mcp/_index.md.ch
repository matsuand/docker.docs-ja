%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Model Context Protocol (MCP)
description: Learn how to use Model Context Protocol (MCP) servers with Gordon to extend AI capabilities in Docker Desktop.
keywords: ai, mcp, gordon, docker desktop, docker, llm, model context protocol
@y
title: Model Context Protocol (MCP)
description: Learn how to use Model Context Protocol (MCP) servers with Gordon to extend AI capabilities in Docker Desktop.
keywords: ai, mcp, gordon, docker desktop, docker, llm, model context protocol
@z

% grid:

@x
- title: Built-in tools
  description: Use the built-in tools.
  icon: construction
  link: /ai/gordon/mcp/built-in-tools
@y
- title: Built-in tools
  description: Use the built-in tools.
  icon: construction
  link: __SUBDIR__/ai/gordon/mcp/built-in-tools
@z

@x
- title: MCP configuration
  description: Configure MCP tools on a per-project basis.
  icon: manufacturing
  link: /ai/gordon/mcp/yaml
@y
- title: MCP configuration
  description: Configure MCP tools on a per-project basis.
  icon: manufacturing
  link: __SUBDIR__/ai/gordon/mcp/yaml
@z

@x
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how applications provide context and
additional functionality to large language models. MCP functions as a
client-server protocol, where the client, for example an application like
Gordon, sends requests, and the server processes those requests to deliver the
necessary context to the AI. This context may be gathered by the MCP server by
executing code to perform an action and retrieving the result, calling external
APIs, or other similar operations.
@y
[Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) is
an open protocol that standardizes how applications provide context and
additional functionality to large language models. MCP functions as a
client-server protocol, where the client, for example an application like
Gordon, sends requests, and the server processes those requests to deliver the
necessary context to the AI. This context may be gathered by the MCP server by
executing code to perform an action and retrieving the result, calling external
APIs, or other similar operations.
@z

@x
Gordon, along with other MCP clients like Claude Desktop or Cursor, can interact
with MCP servers running as containers.
@y
Gordon, along with other MCP clients like Claude Desktop or Cursor, can interact
with MCP servers running as containers.
@z

% grid
