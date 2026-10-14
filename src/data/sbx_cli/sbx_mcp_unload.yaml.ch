%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp unload
synopsis: Unload an MCP server from a running sandbox
description: |-
    Detach an MCP server from a running sandbox's gateway.
    Connected agents stop seeing the server's tools immediately via the standard
    MCP tools/list_changed notification — no agent restart required. The server
    is not restored when the sandbox is restarted.
@y
name: sbx mcp unload
synopsis: Unload an MCP server from a running sandbox
description: |-
    Detach an MCP server from a running sandbox's gateway.
    Connected agents stop seeing the server's tools immediately via the standard
    MCP tools/list_changed notification — no agent restart required. The server
    is not restored when the sandbox is restarted.
@z

@x
    The server stays registered in the local MCP store; load it again with
    'sbx mcp load', or remove the registration with 'sbx mcp rm'.
@y
    The server stays registered in the local MCP store; load it again with
    'sbx mcp load', or remove the registration with 'sbx mcp rm'.
@z

@x
usage: sbx mcp unload NAME --sandbox SANDBOX [flags]
@y
usage: sbx mcp unload NAME --sandbox SANDBOX [flags]
@z

% options:

@x help
      usage: help for unload
@y
      usage: help for unload
@z

@x sandbox
      usage: Target sandbox name (required)
@y
      usage: Target sandbox name (required)
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Unload the 'notion' server from the running sandbox 'my-sbx'.
      sbx mcp unload notion --sandbox my-sbx
@y
example: |4-
      # Unload the 'notion' server from the running sandbox 'my-sbx'.
      sbx mcp unload notion --sandbox my-sbx
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
