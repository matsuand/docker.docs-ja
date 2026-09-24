%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Access controls
@y
title: Access controls
@z

@x
description: Configure local and organization controls for sandbox network, filesystem, and MCP access.
keywords: docker sandboxes, access controls, governance, network access, filesystem access, MCP access
@y
description: Configure local and organization controls for sandbox network, filesystem, and MCP access.
keywords: docker sandboxes, access controls, governance, network access, filesystem access, MCP access
@z

@x
Access controls are expressed as policies. Local and organization pages
describe where policies apply. Network and filesystem pages describe the rules
inside those policies. MCP policies use Cedar statements instead of the network
and filesystem rule format.
@y
Access controls are expressed as policies. Local and organization pages
describe where policies apply. Network and filesystem pages describe the rules
inside those policies. MCP policies use Cedar statements instead of the network
and filesystem rule format.
@z

@x
## Policy scope
@y
## Policy scope
@z

@x
- [Local policy](local.md): configure network rules on a developer machine with
  the `sbx policy` CLI.
- [Organization policies](organization.md): manage centralized policies for an
  organization or team.
@y
- [Local policy](local.md): configure network rules on a developer machine with
  the `sbx policy` CLI.
- [Organization policies](organization.md): manage centralized policies for an
  organization or team.
@z

@x
## Access surfaces
@y
## Access surfaces
@z

@x
- [Network access policies](network.md): control outbound network access from
  sandboxes. A local policy rule can match a host, or an HTTP method and path.
- [Filesystem access policies](filesystem.md): control which host paths
  sandboxes can mount as workspaces.
- [MCP access policies](mcp.md): control MCP server registration, tool calls,
  resources, prompts, and approval gates with Cedar policy.
@y
- [Network access policies](network.md): control outbound network access from
  sandboxes. A local policy rule can match a host, or an HTTP method and path.
- [Filesystem access policies](filesystem.md): control which host paths
  sandboxes can mount as workspaces.
- [MCP access policies](mcp.md): control MCP server registration, tool calls,
  resources, prompts, and approval gates with Cedar policy.
@z
