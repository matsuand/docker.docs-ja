%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp load
synopsis: Load an already-registered MCP server into a running sandbox
description: |-
    Attach a previously-registered MCP server to a running sandbox's gateway.
    Connected agents see the new server's tools immediately via the standard MCP
    tools/list_changed notification — no agent restart required.
@y
name: sbx mcp load
synopsis: Load an already-registered MCP server into a running sandbox
description: |-
    Attach a previously-registered MCP server to a running sandbox's gateway.
    Connected agents see the new server's tools immediately via the standard MCP
    tools/list_changed notification — no agent restart required.
@z

@x
    The server must already exist in the local MCP store (register first with
    'sbx mcp add'). Both remote/hosted and local-stdio servers are supported.
@y
    The server must already exist in the local MCP store (register first with
    'sbx mcp add'). Both remote/hosted and local-stdio servers are supported.
@z

@x
usage: sbx mcp load <name> --sandbox <sandbox> [flags]
@y
usage: sbx mcp load <name> --sandbox <sandbox> [flags]
@z

% options:

@x help
      usage: help for load
@y
      usage: help for load
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
      # Register, then load into the running sandbox 'my-sbx'.
      sbx mcp add notion --url https://mcp.notion.com/mcp
      sbx mcp load notion --sandbox my-sbx
@y
example: |4-
      # Register, then load into the running sandbox 'my-sbx'.
      sbx mcp add notion --url https://mcp.notion.com/mcp
      sbx mcp load notion --sandbox my-sbx
@z

@x
      # Local stdio server.
      sbx mcp add github --command npx --args @modelcontextprotocol/server-github
      sbx mcp load github --sandbox my-sbx
@y
      # Local stdio server.
      sbx mcp add github --command npx --args @modelcontextprotocol/server-github
      sbx mcp load github --sandbox my-sbx
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
