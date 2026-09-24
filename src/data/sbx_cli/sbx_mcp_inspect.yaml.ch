%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp inspect
synopsis: Show MCP server details
usage: sbx mcp inspect <name> [flags]
@y
name: sbx mcp inspect
synopsis: Show MCP server details
usage: sbx mcp inspect <name> [flags]
@z

% options:

@x help
      usage: help for inspect
@y
      usage: help for inspect
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
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
      sbx mcp inspect notion
@y
example: |4-
      sbx mcp inspect notion
@z

@x
      # Machine-readable output for scripting
      sbx mcp inspect notion --json
@y
      # Machine-readable output for scripting
      sbx mcp inspect notion --json
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
