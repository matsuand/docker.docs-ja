%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp
synopsis: Manage MCP servers
description: |
    Register and manage MCP servers for use with sandbox sessions.
usage: sbx mcp COMMAND
@y
name: sbx mcp
synopsis: Manage MCP servers
description: |
    Register and manage MCP servers for use with sandbox sessions.
usage: sbx mcp COMMAND
@z

% options:

@x help
      usage: help for mcp
@y
      usage: help for mcp
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

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx mcp add - Register an MCP server
    - sbx mcp auth - Authorize MCP servers
    - sbx mcp inspect - Show MCP server details
    - sbx mcp load - Load an already-registered MCP server into a running sandbox
    - sbx mcp ls - List MCP servers
    - sbx mcp rm - Remove a registered MCP server
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx mcp add - Register an MCP server
    - sbx mcp auth - Authorize MCP servers
    - sbx mcp inspect - Show MCP server details
    - sbx mcp load - Load an already-registered MCP server into a running sandbox
    - sbx mcp ls - List MCP servers
    - sbx mcp rm - Remove a registered MCP server
@z
