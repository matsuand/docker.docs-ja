%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp rm
synopsis: Remove a registered MCP server
description: |-
    Remove a registered MCP server and its OAuth credential.
@y
name: sbx mcp rm
synopsis: Remove a registered MCP server
description: |-
    Remove a registered MCP server and its OAuth credential.
@z

@x
    Use --registration-only to remove the local registration without starting the
    daemon or accessing credentials. This also removes the registration's saved
    environment ownership and approval, including damaged or orphaned registrations. Stored credentials are
    kept, and MCP processes already running in sandbox gateways are not stopped.
    For an untrusted registration, first stop the selected daemon; this interrupts
    all of its sandbox gateways. A later approved env run can register a declared
    server again.
@y
    Use --registration-only to remove the local registration without starting the
    daemon or accessing credentials. This also removes the registration's saved
    environment ownership and approval, including damaged or orphaned registrations. Stored credentials are
    kept, and MCP processes already running in sandbox gateways are not stopped.
    For an untrusted registration, first stop the selected daemon; this interrupts
    all of its sandbox gateways. A later approved env run can register a declared
    server again.
@z

@x
usage: sbx mcp rm NAME [flags]
@y
usage: sbx mcp rm NAME [flags]
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

@x registration-only
      usage: |
        Remove only the local registration without starting the daemon; keep credentials and running MCP processes
@y
      usage: |
        Remove only the local registration without starting the daemon; keep credentials and running MCP processes
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
      sbx mcp rm notion
      sbx mcp rm --registration-only notion
@y
example: |4-
      sbx mcp rm notion
      sbx mcp rm --registration-only notion
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
