%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create
synopsis: Create a sandbox for an agent
description: |-
    Create a sandbox with access to a host workspace for an agent.

    Use "sbx run SANDBOX" to attach to the agent after creation.
@y
name: sbx create
synopsis: Create a sandbox for an agent
description: |-
    Create a sandbox with access to a host workspace for an agent.

    Use "sbx run SANDBOX" to attach to the agent after creation.
@z

@x
usage: sbx create [flags] AGENT PATH [PATH...]
@y
usage: sbx create [flags] AGENT PATH [PATH...]
@z

%options:

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

@x help
      usage: help for create
@y
      usage: help for create
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

%inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Create a sandbox for Claude in the current directory
      sbx create claude .
@y
example: |4-
      # Create a sandbox for Claude in the current directory
      sbx create claude .
@z

@x
      # Create a sandbox with a custom name
      sbx create --name my-project claude /path/to/project
@y
      # Create a sandbox with a custom name
      sbx create --name my-project claude /path/to/project
@z

@x
      # Create with additional read-only workspaces
      sbx create claude . /path/to/docs:ro
@y
      # Create with additional read-only workspaces
      sbx create claude . /path/to/docs:ro
@z

@x
      # Create with a Git worktree for isolated changes
      sbx create --branch=feature/login claude .
@y
      # Create with a Git worktree for isolated changes
      sbx create --branch=feature/login claude .
@z

%see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx create claude - Create a sandbox for claude
    - sbx create codex - Create a sandbox for codex
    - sbx create copilot - Create a sandbox for copilot
    - sbx create cursor - Create a sandbox for cursor
    - sbx create docker-agent - Create a sandbox for docker-agent
    - sbx create droid - Create a sandbox for droid
    - sbx create gemini - Create a sandbox for gemini
    - sbx create kiro - Create a sandbox for kiro
    - sbx create opencode - Create a sandbox for opencode
    - sbx create shell - Create a sandbox for shell
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx create claude - Create a sandbox for claude
    - sbx create codex - Create a sandbox for codex
    - sbx create copilot - Create a sandbox for copilot
    - sbx create cursor - Create a sandbox for cursor
    - sbx create docker-agent - Create a sandbox for docker-agent
    - sbx create droid - Create a sandbox for droid
    - sbx create gemini - Create a sandbox for gemini
    - sbx create kiro - Create a sandbox for kiro
    - sbx create opencode - Create a sandbox for opencode
    - sbx create shell - Create a sandbox for shell
@z
