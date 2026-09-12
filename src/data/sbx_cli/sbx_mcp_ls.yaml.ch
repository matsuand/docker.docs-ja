%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp ls
synopsis: List MCP servers, grouped by the gateway that serves them
description: |-
    List registered MCP servers under the gateway that serves them.
@y
name: sbx mcp ls
synopsis: List MCP servers, grouped by the gateway that serves them
description: |-
    List registered MCP servers under the gateway that serves them.
@z

@x
    The gateway header reports where it runs, who controls it, and whether you are
    signed in; each server row reports its transport and whether it is usable now.
    Servers needing authorization carry the 'sbx mcp auth' next step.
@y
    The gateway header reports where it runs, who controls it, and whether you are
    signed in; each server row reports its transport and whether it is usable now.
    Servers needing authorization carry the 'sbx mcp auth' next step.
@z

@x
    Auth status is read without starting an OAuth flow — from the local token store
    in local data-plane mode, otherwise from the hosted control plane.
@y
    Auth status is read without starting an OAuth flow — from the local token store
    in local data-plane mode, otherwise from the hosted control plane.
@z

@x
usage: sbx mcp ls [flags]
@y
usage: sbx mcp ls [flags]
@z

% options:

@x help
      usage: help for ls
@y
      usage: help for ls
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
      sbx mcp ls
@y
example: |4-
      sbx mcp ls
@z

@x
      # Machine-readable output for scripting
      sbx mcp ls --json
@y
      # Machine-readable output for scripting
      sbx mcp ls --json
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
