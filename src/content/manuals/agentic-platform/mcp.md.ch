%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: MCP
description: Connect predefined and custom MCP servers for Docker Agentic Platform sandboxes.
keywords: docker agentic platform, mcp servers, mcp tools, authorization, remote url
@y
title: MCP
description: Connect predefined and custom MCP servers for Docker Agentic Platform sandboxes.
keywords: docker agentic platform, mcp servers, mcp tools, authorization, remote url
@z

@x
Connect Model Context Protocol (MCP) servers to give your agent tools for
working with external services. From **MCP**, choose a predefined server or
add a custom server by URL. Authorize access if prompted.
@y
Connect Model Context Protocol (MCP) servers to give your agent tools for
working with external services. From **MCP**, choose a predefined server or
add a custom server by URL. Authorize access if prompted.
@z

@x
You can also select or connect servers from the tools control in the sandbox
launcher. Select a server to use it in the sandbox, and authorize access if
prompted. To connect a custom server there, enter its URL and
select **Connect**.
@y
You can also select or connect servers from the tools control in the sandbox
launcher. Select a server to use it in the sandbox, and authorize access if
prompted. To connect a custom server there, enter its URL and
select **Connect**.
@z

@x
Connecting an MCP server doesn't restrict or inspect the sandbox's other
network traffic. To control which hosts and services the sandbox can reach,
use [network policies](/manuals/agentic-platform/policies.md). The initial
release doesn't support MCP-specific policies.
@y
Connecting an MCP server doesn't restrict or inspect the sandbox's other
network traffic. To control which hosts and services the sandbox can reach,
use [network policies](manuals/agentic-platform/policies.md). The initial
release doesn't support MCP-specific policies.
@z

@x
## Connect a predefined server
@y
## Connect a predefined server
@z

@x
1. Open **MCP** and choose a predefined server.
2. Connect the server.
3. Authorize access if prompted.
@y
1. Open **MCP** and choose a predefined server.
2. Connect the server.
3. Authorize access if prompted.
@z

@x
## Add a server by URL
@y
## Add a server by URL
@z

@x
To connect a server that is not predefined:
@y
To connect a server that is not predefined:
@z

@x
1. Open **MCP** and find **Add a server**.
2. Enter a streamable HTTP MCP endpoint in **Remote MCP URL**.
3. Select **Add**. Public servers are ready immediately. For servers that
   require an account, authorize access after adding the server.
@y
1. Open **MCP** and find **Add a server**.
2. Enter a streamable HTTP MCP endpoint in **Remote MCP URL**.
3. Select **Add**. Public servers are ready immediately. For servers that
   require an account, authorize access after adding the server.
@z

@x
## Use tools from another client
@y
## Use tools from another client
@z

@x
On the **MCP** page, use **MCP Gateway endpoint URL** to connect your external
MCP client to the gateway. Select **Add to your client**, choose your
client, and follow the connection and authorization instructions. Supported
options are Docker Sandboxes (SBX), Claude Code, Codex CLI, Cursor, VS Code,
and MCP Inspector. The first connection opens browser sign-in. There is no
token to copy.
@y
On the **MCP** page, use **MCP Gateway endpoint URL** to connect your external
MCP client to the gateway. Select **Add to your client**, choose your
client, and follow the connection and authorization instructions. Supported
options are Docker Sandboxes (SBX), Claude Code, Codex CLI, Cursor, VS Code,
and MCP Inspector. The first connection opens browser sign-in. There is no
token to copy.
@z

@x
Sign-in is confirmed only for the listed clients. Follow the instructions for
your client, including any exact flag or setting shown. Other clients may
fail sign-in with an error page that looks like a password problem.
@y
Sign-in is confirmed only for the listed clients. Follow the instructions for
your client, including any exact flag or setting shown. Other clients may
fail sign-in with an error page that looks like a password problem.
@z
