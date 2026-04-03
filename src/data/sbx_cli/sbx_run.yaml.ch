%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx run
synopsis: Run an agent in a sandbox
description: |-
    Run an agent in a sandbox, creating the sandbox if it does not already exist.
@y
name: sbx run
synopsis: Run an agent in a sandbox
description: |-
    Run an agent in a sandbox, creating the sandbox if it does not already exist.
@z

@x
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments. Append ":ro" to mount them read-only.
@y
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments. Append ":ro" to mount them read-only.
@z

@x
    To create a sandbox without attaching, use "sbx create" instead.
@y
    To create a sandbox without attaching, use "sbx create" instead.
@z

@x
    Available agents: claude, codex, copilot, docker-agent, gemini, kiro, opencode, shell
usage: sbx run [flags] SANDBOX | AGENT [PATH...] [-- AGENT_ARGS...]
options:
    - name: branch
      usage: |
        Create a Git worktree on the given branch (use --branch auto to auto-generate)
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for run
    - name: memory
      shorthand: m
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
    - name: name
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
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
      # Create and run a sandbox with claude in current directory
      sbx run claude
@y
    Available agents: claude, codex, copilot, docker-agent, gemini, kiro, opencode, shell
usage: sbx run [flags] SANDBOX | AGENT [PATH...] [-- AGENT_ARGS...]
options:
    - name: branch
      usage: |
        Create a Git worktree on the given branch (use --branch auto to auto-generate)
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for run
    - name: memory
      shorthand: m
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
    - name: name
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
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
      # Create and run a sandbox with claude in current directory
      sbx run claude
@z

@x
      # Create and run with additional workspaces (read-only)
      sbx run claude . /path/to/docs:ro
@y
      # Create and run with additional workspaces (read-only)
      sbx run claude . /path/to/docs:ro
@z

@x
      # Run an existing sandbox
      sbx run existing-sandbox
@y
      # Run an existing sandbox
      sbx run existing-sandbox
@z

@x
      # Run a sandbox with agent arguments
      sbx run claude -- --continue
see_also:
    - sbx - Manage AI coding agent sandboxes.
@y
      # Run a sandbox with agent arguments
      sbx run claude -- --continue
see_also:
    - sbx - Manage AI coding agent sandboxes.
@z
