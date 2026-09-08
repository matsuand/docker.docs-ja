%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx setup
synopsis: |
    Detect host configuration and prepare Docker Sandboxes
experimental: true
description: |-
    Detect what is already configured on your host and prepare Docker Sandboxes.
@y
name: sbx setup
synopsis: |
    Detect host configuration and prepare Docker Sandboxes
experimental: true
description: |-
    Detect what is already configured on your host and prepare Docker Sandboxes.
@z

@x
    Agent secrets are detected from the built-in agent kit specs and the
    env vars set on this host, and accepted secrets are imported into the global
    secrets store (the same store as "sbx secret set").
usage: sbx setup [COMMAND]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for setup
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
    - sbx setup ssh - Set up SSH client config for the sandbox endpoint
@y
    Agent secrets are detected from the built-in agent kit specs and the
    env vars set on this host, and accepted secrets are imported into the global
    secrets store (the same store as "sbx secret set").
usage: sbx setup [COMMAND]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for setup
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
    - sbx setup ssh - Set up SSH client config for the sandbox endpoint
@z
