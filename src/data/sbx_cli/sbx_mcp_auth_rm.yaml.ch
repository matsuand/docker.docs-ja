%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp auth rm
synopsis: Remove MCP server OAuth credentials
description: |-
    Remove hosted OAuth credentials for registered MCP servers.
@y
name: sbx mcp auth rm
synopsis: Remove MCP server OAuth credentials
description: |-
    Remove hosted OAuth credentials for registered MCP servers.
@z

@x
    This command does not remove local MCP server registrations. Use 'sbx mcp rm'
    to remove a registration.
@y
    This command does not remove local MCP server registrations. Use 'sbx mcp rm'
    to remove a registration.
@z

@x
usage: sbx mcp auth rm [server-name] [flags]
@y
usage: sbx mcp auth rm [server-name] [flags]
@z

% options:

@x all
      usage: Apply to all registered OAuth servers
@y
      usage: Apply to all registered OAuth servers
@z

@x format
      usage: 'Output format: "text" or "json"'
@y
      usage: 'Output format: "text" or "json"'
@z

@x help
      usage: help for rm
@y
      usage: help for rm
@z

@x json
      usage: Output in JSON format (alias for --format json)
@y
      usage: Output in JSON format (alias for --format json)
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      sbx mcp auth rm --all
      sbx mcp auth rm notion
      sbx mcp auth rm notion --format=json
@y
example: |4-
      sbx mcp auth rm --all
      sbx mcp auth rm notion
      sbx mcp auth rm notion --format=json
@z

% see_also:

@x
    - sbx mcp auth - Authorize MCP servers
@y
    - sbx mcp auth - Authorize MCP servers
@z
