%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create codex
synopsis: Create a sandbox for codex
description: |-
    Create a sandbox with access to a host workspace for codex.
@y
name: sbx create codex
synopsis: Create a sandbox for codex
description: |-
    Create a sandbox with access to a host workspace for codex.
@z

@x
    The workspace path is required and will be mounted inside the sandbox at the
    same path as on the host. Additional workspaces can be provided as extra
    arguments. Append ":ro" to mount them read-only.

    Use "sbx run SANDBOX" to attach to the agent after creation.
@y
    The workspace path is required and will be mounted inside the sandbox at the
    same path as on the host. Additional workspaces can be provided as extra
    arguments. Append ":ro" to mount them read-only.

    Use "sbx run SANDBOX" to attach to the agent after creation.
@z

@x
usage: sbx create codex PATH [PATH...] [flags]
@y
usage: sbx create codex PATH [PATH...] [flags]
@z

% options:

@x help
      usage: help for codex
@y
      usage: help for codex
@z

% inherited_options:

@x branch
      usage: Create a Git worktree on the given branch
@y
      usage: Create a Git worktree on the given branch
@z

@x cpus
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: N-1 host CPUs, min 1)
@y
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: N-1 host CPUs, min 1)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
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
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, periods, plus signs and minus signs only)
@y
      usage: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, periods, plus signs and minus signs only)
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
      sbx create codex .
@y
example: |4-
      # Create in the current directory
      sbx create codex .
@z

@x
      # Create with a specific path
      sbx create codex /path/to/project
@y
      # Create with a specific path
      sbx create codex /path/to/project
@z

@x
      # Create with additional read-only workspaces
      sbx create codex . /path/to/docs:ro
@y
      # Create with additional read-only workspaces
      sbx create codex . /path/to/docs:ro
@z

%see_also:

@x
    - sbx create - Create a sandbox for an agent
@y
    - sbx create - Create a sandbox for an agent
@z
