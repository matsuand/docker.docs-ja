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
Model Context Protocol (MCP) servers connect agents to external services and
expose operations from those services as tools. From the **MCP** page, connect a
predefined server or add a custom server by URL. Complete authorization when a
server requires it.
@y
Model Context Protocol (MCP) servers connect agents to external services and
expose operations from those services as tools. From the **MCP** page, connect a
predefined server or add a custom server by URL. Complete authorization when a
server requires it.
@z

@x
MCP configuration grants agents tools they can invoke. It does not restrict or
inspect ordinary network access from a sandbox. Use
[network policies](/manuals/agentic-platform/policies.md) to control outbound
destinations. MCP-specific policies are not part of the initial release.
@y
MCP configuration grants agents tools they can invoke. It does not restrict or
inspect ordinary network access from a sandbox. Use
[network policies](manuals/agentic-platform/policies.md) to control outbound
destinations. MCP-specific policies are not part of the initial release.
@z

@x
## Connect a predefined server
@y
## Connect a predefined server
@z

@x
1. Open **MCP** and choose a predefined server.
2. Connect the server.
3. Complete authorization if prompted.
@y
1. Open **MCP** and choose a predefined server.
2. Connect the server.
3. Complete authorization if prompted.
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
1. Open **MCP**.
2. Choose the option to add a server and enter its URL.
3. Connect the server and complete authorization if prompted.
@y
1. Open **MCP**.
2. Choose the option to add a server and enter its URL.
3. Connect the server and complete authorization if prompted.
@z
