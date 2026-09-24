%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp rm
synopsis: Remove a registered MCP server
usage: sbx mcp rm <name> [flags]
@y
name: sbx mcp rm
synopsis: Remove a registered MCP server
usage: sbx mcp rm <name> [flags]
@z

% options:

@x force
      usage: Skip confirmation prompts
@y
      usage: Skip confirmation prompts
@z

@x help
      usage: help for rm
@y
      usage: help for rm
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
example: '  sbx mcp rm notion'
@y
example: '  sbx mcp rm notion'
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
