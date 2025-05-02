%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gordon as an MCP server
description: How to use Gordon as an MCP server
keywords: ai, mcp, gordon
@y
title: Gordon as an MCP server
description: How to use Gordon as an MCP server
keywords: ai, mcp, gordon
@z

@x
## Gordon as an MCP server
@y
## Gordon as an MCP server
@z

@x
In addition to functioning as an MCP client, Gordon can also act as an MCP
server. This means that all the tools configured in the toolbox section of
Gordon can be exposed to another MCP client like Claude Desktop, Cursor and
others.
@y
In addition to functioning as an MCP client, Gordon can also act as an MCP
server. This means that all the tools configured in the toolbox section of
Gordon can be exposed to another MCP client like Claude Desktop, Cursor and
others.
@z

@x
To use Gordon’s built-in tools in other MCP clients, configure your client of
choice to use the `docker ai mcpserver` command. This allows Gordon to serve its
built-in tools via the MCP protocol for various clients.
@y
To use Gordon’s built-in tools in other MCP clients, configure your client of
choice to use the `docker ai mcpserver` command. This allows Gordon to serve its
built-in tools via the MCP protocol for various clients.
@z

@x
For example, to enable Gordon’s tools in Claude Desktop, add the following
configuration to the Claude configuration file:
@y
For example, to enable Gordon’s tools in Claude Desktop, add the following
configuration to the Claude configuration file:
@z

@x
```json
{
  "mcpServers": {
    "gordon": {
      "command": "docker",
      "args": ["ai", "mcpserver"]
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "gordon": {
      "command": "docker",
      "args": ["ai", "mcpserver"]
    }
  }
}
```
@z

@x
This setup ensures that Claude Desktop can communicate with Gordon as an MCP
server, leveraging its built-in tools. You can follow the [Claude Desktop
documentation](https://modelcontextprotocol.io/quickstart/user) to explore
further.
@y
This setup ensures that Claude Desktop can communicate with Gordon as an MCP
server, leveraging its built-in tools. You can follow the [Claude Desktop
documentation](https://modelcontextprotocol.io/quickstart/user) to explore
further.
@z

@x
### Tool permissions and security
@y
### Tool permissions and security
@z

@x
These tools operate with the same permissions as the user running the
application.
@y
These tools operate with the same permissions as the user running the
application.
@z

@x
Any potentially destructive tool call, changing files, deleting images or
stopping containers will ask for your confirmation before proceeding.
@y
Any potentially destructive tool call, changing files, deleting images or
stopping containers will ask for your confirmation before proceeding.
@z

@x
![Gordon page with the delete confirmation question](../images/delete.webp)
@y
![Gordon page with the delete confirmation question](../images/delete.webp)
@z
