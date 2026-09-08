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
usage: sbx mcp ls [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ls
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: '  sbx mcp ls'
see_also:
    - sbx mcp - Manage MCP servers
@y
    Auth status is read without starting an OAuth flow — from the local token store
    in local data-plane mode, otherwise from the hosted control plane.
usage: sbx mcp ls [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ls
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: '  sbx mcp ls'
see_also:
    - sbx mcp - Manage MCP servers
@z
