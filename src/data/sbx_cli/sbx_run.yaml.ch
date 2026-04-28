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
    Available agents: claude, codex, copilot, docker-agent, droid, gemini, kiro, opencode, shell
@y
    Available agents: claude, codex, copilot, docker-agent, droid, gemini, kiro, opencode, shell
@z

@x
usage: sbx run [flags] SANDBOX | AGENT [PATH...] [-- AGENT_ARGS...]
@y
usage: sbx run [flags] SANDBOX | AGENT [PATH...] [-- AGENT_ARGS...]
@z

%options:

@x branch
      usage: |
        Create a Git worktree on the given branch (use --branch auto to auto-generate)
@y
      usage: |
        Create a Git worktree on the given branch (use --branch auto to auto-generate)
@z

@x cpus
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: N-1 host CPUs, min 1)
@y
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: N-1 host CPUs, min 1)
@z

@x help
      usage: help for run
@y
      usage: help for run
@z

@x memory
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
@y
      usage: |
        Memory limit in binary units (e.g., 1024m, 8g). Default: 50% of host memory, max 32 GiB
@z

@x name
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
@y
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
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
      # Create and run a sandbox with claude in current directory
      sbx run claude
@y
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
@y
      # Run a sandbox with agent arguments
      sbx run claude -- --continue
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
