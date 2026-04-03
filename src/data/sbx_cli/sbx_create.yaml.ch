%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create
synopsis: Create a sandbox for an agent
description: |-
    Create a sandbox with access to a host workspace for an agent.
@y
name: sbx create
synopsis: Create a sandbox for an agent
description: |-
    Create a sandbox with access to a host workspace for an agent.
@z

@x
    Use "sbx run SANDBOX" to attach to the agent after creation.
usage: sbx create [flags] AGENT PATH [PATH...]
options:
    - name: branch
      usage: Create a Git worktree on the given branch
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for create
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
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Create a sandbox for Claude in the current directory
      sbx create claude .
@y
    Use "sbx run SANDBOX" to attach to the agent after creation.
usage: sbx create [flags] AGENT PATH [PATH...]
options:
    - name: branch
      usage: Create a Git worktree on the given branch
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for create
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
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
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
see_also:
    - sbx - Manage AI coding agent sandboxes.
    - sbx create claude - Create a sandbox for claude
    - sbx create codex - Create a sandbox for codex
    - sbx create copilot - Create a sandbox for copilot
    - sbx create docker-agent - Create a sandbox for docker-agent
    - sbx create gemini - Create a sandbox for gemini
    - sbx create kiro - Create a sandbox for kiro
    - sbx create opencode - Create a sandbox for opencode
    - sbx create shell - Create a sandbox for shell
@y
      # Create with a Git worktree for isolated changes
      sbx create --branch=feature/login claude .
see_also:
    - sbx - Manage AI coding agent sandboxes.
    - sbx create claude - Create a sandbox for claude
    - sbx create codex - Create a sandbox for codex
    - sbx create copilot - Create a sandbox for copilot
    - sbx create docker-agent - Create a sandbox for docker-agent
    - sbx create gemini - Create a sandbox for gemini
    - sbx create kiro - Create a sandbox for kiro
    - sbx create opencode - Create a sandbox for opencode
    - sbx create shell - Create a sandbox for shell
@z
