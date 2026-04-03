%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create opencode
synopsis: Create a sandbox for opencode
description: |-
    Create a sandbox with access to a host workspace for opencode.
@y
name: sbx create opencode
synopsis: Create a sandbox for opencode
description: |-
    Create a sandbox with access to a host workspace for opencode.
@z

@x
    The workspace path is required and will be mounted inside the sandbox at the
    same path as on the host. Additional workspaces can be provided as extra
    arguments. Append ":ro" to mount them read-only.
@y
    The workspace path is required and will be mounted inside the sandbox at the
    same path as on the host. Additional workspaces can be provided as extra
    arguments. Append ":ro" to mount them read-only.
@z

@x
    Use "sbx run SANDBOX" to attach to the agent after creation.
usage: sbx create opencode PATH [PATH...] [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for opencode
inherited_options:
    - name: branch
      usage: Create a Git worktree on the given branch
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
    - name: memory
      shorthand: m
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
    - name: name
      usage: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, periods, plus signs and minus signs only)
    - name: quiet
      shorthand: q
      default_value: "false"
      usage: Suppress verbose output
    - name: template
      shorthand: t
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
example: |4-
      # Create in the current directory
      sbx create opencode .
@y
    Use "sbx run SANDBOX" to attach to the agent after creation.
usage: sbx create opencode PATH [PATH...] [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for opencode
inherited_options:
    - name: branch
      usage: Create a Git worktree on the given branch
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
    - name: memory
      shorthand: m
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
    - name: name
      usage: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, periods, plus signs and minus signs only)
    - name: quiet
      shorthand: q
      default_value: "false"
      usage: Suppress verbose output
    - name: template
      shorthand: t
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
example: |4-
      # Create in the current directory
      sbx create opencode .
@z

@x
      # Create with a specific path
      sbx create opencode /path/to/project
@y
      # Create with a specific path
      sbx create opencode /path/to/project
@z

@x
      # Create with additional read-only workspaces
      sbx create opencode . /path/to/docs:ro
see_also:
    - sbx create - Create a sandbox for an agent
@y
      # Create with additional read-only workspaces
      sbx create opencode . /path/to/docs:ro
see_also:
    - sbx create - Create a sandbox for an agent
@z
