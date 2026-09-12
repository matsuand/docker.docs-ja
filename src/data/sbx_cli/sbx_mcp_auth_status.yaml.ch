%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp auth status
synopsis: Show MCP server OAuth status
description: |-
    Show hosted OAuth credential status for registered MCP servers.
@y
name: sbx mcp auth status
synopsis: Show MCP server OAuth status
description: |-
    Show hosted OAuth credential status for registered MCP servers.
@z

@x
    This command does not start OAuth or refresh expired credentials.
@y
    This command does not start OAuth or refresh expired credentials.
@z

@x
usage: sbx mcp auth status [server-name] [flags]
@y
usage: sbx mcp auth status [server-name] [flags]
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
      usage: help for status
@y
      usage: help for status
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
      sbx mcp auth status --all
      sbx mcp auth status notion
      sbx mcp auth status --all --format=json
@y
example: |4-
      sbx mcp auth status --all
      sbx mcp auth status notion
      sbx mcp auth status --all --format=json
@z

% see_also:

@x
    - sbx mcp auth - Authorize MCP servers
@y
    - sbx mcp auth - Authorize MCP servers
@z
