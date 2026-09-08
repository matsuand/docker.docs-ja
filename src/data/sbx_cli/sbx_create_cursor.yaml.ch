%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create cursor
synopsis: Create a sandbox for cursor
description: |-
    Create a sandbox with access to a host workspace for cursor.
@y
name: sbx create cursor
synopsis: Create a sandbox for cursor
description: |-
    Create a sandbox with access to a host workspace for cursor.
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
    Use "sbx run --name SANDBOX" to attach to the agent after creation.
@y
    Use "sbx run --name SANDBOX" to attach to the agent after creation.
@z

@x
usage: sbx create cursor PATH [PATH...] [flags]
@y
usage: sbx create cursor PATH [PATH...] [flags]
@z

%options:

@x help
      usage: help for cursor
@y
      usage: help for cursor
@z

%inherited_options:

@x clone
      usage: |
        Run the agent on a private in-container clone of the host Git repository (mounted read-only) instead of bind-mounting the workspace; the agent's commits are accessible via the sandbox-<name> git remote on the host
@y
      usage: |
        Run the agent on a private in-container clone of the host Git repository (mounted read-only) instead of bind-mounting the workspace; the agent's commits are accessible via the sandbox-<name> git remote on the host
@z

@x cpus
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: all host CPUs)
@y
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: all host CPUs)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x deny-network
      usage: |
        Add a per-sandbox network deny rule at creation time. Can be specified multiple times. The rule applies only to the new sandbox and can be listed or removed later with `sbx policy ls <NAME>` / `sbx policy rm network --sandbox <NAME> --resource <HOST>`. Safe under centralized governance because a local deny can only narrow, never widen, egress.
@y
      usage: |
        Add a per-sandbox network deny rule at creation time. Can be specified multiple times. The rule applies only to the new sandbox and can be listed or removed later with `sbx policy ls <NAME>` / `sbx policy rm network --sandbox <NAME> --resource <HOST>`. Safe under centralized governance because a local deny can only narrow, never widen, egress.
@z

@x env
      usage: |
        Set an environment variable in the sandbox (can be repeated): KEY=VALUE, or a bare KEY to take the value from the current environment
@y
      usage: |
        Set an environment variable in the sandbox (can be repeated): KEY=VALUE, or a bare KEY to take the value from the current environment
@z

@x env-file
      usage: |
        Read environment variables from a file (can be repeated). --env wins over any file; a later file wins over an earlier one
@y
      usage: |
        Read environment variables from a file (can be repeated). --env wins over any file; a later file wins over an earlier one
@z

@x kit
      usage: |
        Kit reference (directory, ZIP, or OCI). Can be specified multiple times
@y
      usage: |
        Kit reference (directory, ZIP, or OCI). Can be specified multiple times
@z

@x memory
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
@y
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
@z

@x name
      usage: |
        Name for the sandbox (defaults to <agent>-<workdir>; at least two characters, starting with a letter or number, containing only letters, numbers, hyphens and periods; 'default' is reserved)
@y
      usage: |
        Name for the sandbox (defaults to <agent>-<workdir>; at least two characters, starting with a letter or number, containing only letters, numbers, hyphens and periods; 'default' is reserved)
@z

@x publish
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@y
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@z

@x quiet
      usage: Suppress verbose output
@y
      usage: Suppress verbose output
@z

@x template
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
@y
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
@z

@x
example: |4-
      # Create in the current directory
      sbx create cursor .
@y
example: |4-
      # Create in the current directory
      sbx create cursor .
@z

@x
      # Create with a specific path
      sbx create cursor /path/to/project
@y
      # Create with a specific path
      sbx create cursor /path/to/project
@z

@x
      # Create with additional read-only workspaces
      sbx create cursor . /path/to/docs:ro
@y
      # Create with additional read-only workspaces
      sbx create cursor . /path/to/docs:ro
@z

%see_also:

@x
    - sbx create - Create a sandbox for an agent
@y
    - sbx create - Create a sandbox for an agent
@z
