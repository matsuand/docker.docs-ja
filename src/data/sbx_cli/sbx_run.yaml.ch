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
    The first positional argument is the agent to run. To re-attach to an existing
    sandbox by name, use --name; the agent positional is optional when the named
    sandbox already exists and is read from its spec.
@y
    The first positional argument is the agent to run. To re-attach to an existing
    sandbox by name, use --name; the agent positional is optional when the named
    sandbox already exists and is read from its spec.
@z

@x
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments. Append ":ro" to mount them read-only.
@y
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments. Append ":ro" to mount them read-only.
@z

@x
    To create a sandbox without attaching, use "sbx create" instead, or
    pass --detached (-d) to print the sandbox ID and exit without opening an
    interactive session.
@y
    To create a sandbox without attaching, use "sbx create" instead, or
    pass --detached (-d) to print the sandbox ID and exit without opening an
    interactive session.
@z

@x
    Available agents: claude, codex, copilot, cursor, docker-agent, droid, gemini, kiro, opencode, shell
@y
    Available agents: claude, codex, copilot, cursor, docker-agent, droid, gemini, kiro, opencode, shell
@z

@x
usage: sbx run [flags] [AGENT] [PATH...] [-- AGENT_ARGS...]
@y
usage: sbx run [flags] [AGENT] [PATH...] [-- AGENT_ARGS...]
@z

% options:

@x clone
      usage: |
        Run the agent on a private in-container clone of the host Git repository; must be set at sandbox creation time (no-op when re-attaching to an existing clone-mode sandbox)
@y
      usage: |
        Run the agent on a private in-container clone of the host Git repository; must be set at sandbox creation time (no-op when re-attaching to an existing clone-mode sandbox)
@z

@x cpus
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: all host CPUs)
@y
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: all host CPUs)
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
        Set an environment variable in the sandbox (can be repeated): KEY=VALUE, or a bare KEY to take the value from the current environment. Applies to the agent session, so it takes effect on a re-attach too; also baked into the sandbox when this run creates it
@y
      usage: |
        Set an environment variable in the sandbox (can be repeated): KEY=VALUE, or a bare KEY to take the value from the current environment. Applies to the agent session, so it takes effect on a re-attach too; also baked into the sandbox when this run creates it
@z

@x env-file
      usage: |
        Read environment variables from a file (can be repeated). --env wins over any file; a later file wins over an earlier one. Applies to the agent session, so it takes effect on a re-attach too; also baked into the sandbox when this run creates it
@y
      usage: |
        Read environment variables from a file (can be repeated). --env wins over any file; a later file wins over an earlier one. Applies to the agent session, so it takes effect on a re-attach too; also baked into the sandbox when this run creates it
@z

@x help
      usage: help for run
@y
      usage: help for run
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
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
@y
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
@z

@x publish
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]. Applied when the sandbox is created; ignored when re-attaching (use "sbx ports")
@y
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]. Applied when the sandbox is created; ignored when re-attaching (use "sbx ports")
@z

@x template
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
@y
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
@z

% inherited_options:

@x
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
      # Re-attach to an existing sandbox by name (agent read from its spec)
      sbx run --name existing-sandbox
@y
      # Re-attach to an existing sandbox by name (agent read from its spec)
      sbx run --name existing-sandbox
@z

@x
      # Re-attach to an existing sandbox by name and verify the expected agent
      sbx run claude --name existing-sandbox
@y
      # Re-attach to an existing sandbox by name and verify the expected agent
      sbx run claude --name existing-sandbox
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
