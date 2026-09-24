%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp ls
synopsis: List MCP servers
description: |-
    List registered MCP servers under the gateway that serves them.
@y
name: sbx mcp ls
synopsis: List MCP servers
description: |-
    List registered MCP servers under the gateway that serves them.
@z

@x
    The GATEWAY column reports where each server runs, who controls it, and the
    signed-in identity; each row also reports its transport and whether it is usable now.
    Servers needing authorization carry the 'sbx mcp auth' next step.
@y
    The GATEWAY column reports where each server runs, who controls it, and the
    signed-in identity; each row also reports its transport and whether it is usable now.
    Servers needing authorization carry the 'sbx mcp auth' next step.
@z

@x
    A server registered with custom headers is marked as such; one whose header
    placeholder has no stored value carries the 'sbx secret set' next step, and one
    whose headers this gateway cannot send is flagged unsupported. Either way the
    server cannot connect as it stands. Run 'sbx mcp inspect <name>' for the headers
    themselves and the state of each placeholder.
@y
    A server registered with custom headers is marked as such; one whose header
    placeholder has no stored value carries the 'sbx secret set' next step, and one
    whose headers this gateway cannot send is flagged unsupported. Either way the
    server cannot connect as it stands. Run 'sbx mcp inspect <name>' for the headers
    themselves and the state of each placeholder.
@z

@x
    Auth status is read without starting an OAuth flow — from the local token store
    in local data-plane mode, otherwise from the hosted control plane.
@y
    Auth status is read without starting an OAuth flow — from the local token store
    in local data-plane mode, otherwise from the hosted control plane.
@z

@x
    With --cloud:
    List MCP servers reported by existing cloud sandbox gateways, with the
    sandboxes that reference each server. Servers skipped by a gateway are excluded.
    This is not a complete inventory of configured servers: unused configurations
    and gateways that do not report server names are absent, including with --quiet.
@y
    With --cloud:
    List MCP servers reported by existing cloud sandbox gateways, with the
    sandboxes that reference each server. Servers skipped by a gateway are excluded.
    This is not a complete inventory of configured servers: unused configurations
    and gateways that do not report server names are absent, including with --quiet.
@z

@x
    Specify a sandbox to show its gateway state and host, requested servers, and
    skipped servers.
@y
    Specify a sandbox to show its gateway state and host, requested servers, and
    skipped servers.
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

@x quiet
      usage: Only display MCP server names
@y
      usage: Only display MCP server names
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

@x
      # Cloud: list servers reported across existing sandboxes
      sbx --cloud mcp ls
@y
      # Cloud: list servers reported across existing sandboxes
      sbx --cloud mcp ls
@z

@x
      # Cloud: show a cloud sandbox's gateway by name or sbx_ ID
      sbx --cloud mcp ls my-sbx
@y
      # Cloud: show a cloud sandbox's gateway by name or sbx_ ID
      sbx --cloud mcp ls my-sbx
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
