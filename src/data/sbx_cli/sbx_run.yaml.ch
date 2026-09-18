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
    The first positional argument identifies the agent to run. It may be a built-in
    agent name or a sandbox kit reference. Sandbox kit references may be local
    directories, ZIP files, git repositories, or OCI references. Relative local
    references must be explicit paths such as ./my-kit or ../my-kit.zip; bare values
    retain their agent or sandbox-name meaning. To re-attach to an existing sandbox
    by name, use --name; the agent positional is optional when the named sandbox
    already exists and is read from its spec.
@y
    The first positional argument identifies the agent to run. It may be a built-in
    agent name or a sandbox kit reference. Sandbox kit references may be local
    directories, ZIP files, git repositories, or OCI references. Relative local
    references must be explicit paths such as ./my-kit or ../my-kit.zip; bare values
    retain their agent or sandbox-name meaning. To re-attach to an existing sandbox
    by name, use --name; the agent positional is optional when the named sandbox
    already exists and is read from its spec.
@z

@x
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments. Append ":ro" to mount them read-only; a read-only
    argument may name a single file, which holds that one path out of reach inside a
    workspace the sandbox can otherwise write.
@y
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments. Append ":ro" to mount them read-only; a read-only
    argument may name a single file, which holds that one path out of reach inside a
    workspace the sandbox can otherwise write.
@z

@x
    Omit the path to mount the current directory. Pass a path to mount a different
    workspace.
@y
    Omit the path to mount the current directory. Pass a path to mount a different
    workspace.
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
    With --cloud: the agent runs in the cloud sandbox image (started server-side).
    Running an agent that has existing sandboxes (running or stopped) prompts you
    to pick one to reuse or to create a new one. Pass --new to skip the prompt and
    always create a fresh sandbox. --detached also skips the prompt and always
    creates a new sandbox; a non-interactive run without --detached is refused.
    Use --detached for non-interactive scripting (e.g.
    sbx --cloud run -d claude && sbx --cloud exec ...).
    Without --cpus/--memory a cloud sandbox defaults to 2 CPUs and 4 GiB.
    Templates referenced via -t / --template must already exist in the cloud registry;
    the CLI does not upload them automatically. See https://docs.docker.com/ai/sandboxes/ for the cloud sandbox model.
@y
    With --cloud: the agent runs in the cloud sandbox image (started server-side).
    Running an agent that has existing sandboxes (running or stopped) prompts you
    to pick one to reuse or to create a new one. Pass --new to skip the prompt and
    always create a fresh sandbox. --detached also skips the prompt and always
    creates a new sandbox; a non-interactive run without --detached is refused.
    Use --detached for non-interactive scripting (e.g.
    sbx --cloud run -d claude && sbx --cloud exec ...).
    Without --cpus/--memory a cloud sandbox defaults to 2 CPUs and 4 GiB.
    Templates referenced via -t / --template must already exist in the cloud registry;
    the CLI does not upload them automatically. See https://docs.docker.com/ai/sandboxes/ for the cloud sandbox model.
@z

@x
    Available agents: claude, codex, copilot, cursor, devin, docker-agent, droid, gemini, kiro, opencode, shell
@y
    Available agents: claude, codex, copilot, cursor, devin, docker-agent, droid, gemini, kiro, opencode, shell
@z

@x
usage: sbx run [flags] [AGENT|SANDBOX_KIT] [PATH...] [-- AGENT_ARGS...]
@y
usage: sbx run [flags] [AGENT|SANDBOX_KIT] [PATH...] [-- AGENT_ARGS...]
@z

% options:

@x allow-network
      usage: |
        Network pattern to allow for cloud sandbox egress (cloud only; can be specified multiple times)
@y
      usage: |
        Network pattern to allow for cloud sandbox egress (cloud only; can be specified multiple times)
@z

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

@x detach-keys
      usage: |
        Override the detach gesture that leaves the agent running (Docker-style, e.g. "ctrl-\", "ctrl-x,ctrl-d"). Default: Ctrl-\. Use this when the default collides with an agent's keymap (cloud only).
@y
      usage: |
        Override the detach gesture that leaves the agent running (Docker-style, e.g. "ctrl-\", "ctrl-x,ctrl-d"). Default: Ctrl-\. Use this when the default collides with an agent's keymap (cloud only).
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

@x image-ref
      usage: |
        OCI image reference for inline-mode cloud create (mutually exclusive with --template; requires --cpus and --memory)
@y
      usage: |
        OCI image reference for inline-mode cloud create (mutually exclusive with --template; requires --cpus and --memory)
@z

@x kit
      usage: |
        Additional kit reference (must be a mixin; directory, ZIP, git, or OCI). Can be specified multiple times
@y
      usage: |
        Additional kit reference (must be a mixin; directory, ZIP, git, or OCI). Can be specified multiple times
@z

@x kit-arg
      usage: |
        Value for an argument the kit declares, as name=value for every kit or kit.name=value for one (can be repeated)
@y
      usage: |
        Value for an argument the kit declares, as name=value for every kit or kit.name=value for one (can be repeated)
@z

@x kit-args-file
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@y
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@z

@x memory
      usage: |
        Memory limit in binary units (e.g., 512m, 8g). Minimum: 512 MiB. Default: 50% of host memory, clamped to 512 MiB–32 GiB. Maximum: max(75% of host memory, 512 MiB)
@y
      usage: |
        Memory limit in binary units (e.g., 512m, 8g). Minimum: 512 MiB. Default: 50% of host memory, clamped to 512 MiB–32 GiB. Maximum: max(75% of host memory, 512 MiB)
@z

@x name
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
@y
      usage: 'Name for the sandbox (default: <agent>-<workdir>)'
@z

@x new
      usage: |
        Always create a new cloud sandbox instead of prompting to reuse an existing one (cloud only)
@y
      usage: |
        Always create a new cloud sandbox instead of prompting to reuse an existing one (cloud only)
@z

@x on-timeout
      usage: |
        What happens when --ttl lapses: 'delete' (default) tombstones the sandbox, or 'stop' stops it in place so it can be started again later (cloud only; 'stop' requires your account to be entitled to it).
@y
      usage: |
        What happens when --ttl lapses: 'delete' (default) tombstones the sandbox, or 'stop' stops it in place so it can be started again later (cloud only; 'stop' requires your account to be entitled to it).
@z

@x publish
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]. Applied when the sandbox is created; ignored when re-attaching (use "sbx ports")
@y
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]. Applied when the sandbox is created; ignored when re-attaching (use "sbx ports")
@z

@x skills
      usage: |
        Shared skills store mode: off, readonly, or readwrite (mounted at the agent's skills directory, e.g. ~/.claude/skills). Default: readonly, or the configured skills.defaultMode setting. Can only be used when creating a new sandbox.
@y
      usage: |
        Shared skills store mode: off, readonly, or readwrite (mounted at the agent's skills directory, e.g. ~/.claude/skills). Default: readonly, or the configured skills.defaultMode setting. Can only be used when creating a new sandbox.
@z

@x template
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
@y
      usage: |
        Container image to use for the sandbox (default: agent-specific image)
@z

@x ttl
      usage: |
        Cloud sandbox time-to-live before it times out (e.g. 30m, 2h; cloud only; default: server-side)
@y
      usage: |
        Cloud sandbox time-to-live before it times out (e.g. 30m, 2h; cloud only; default: server-side)
@z

@x volume
      usage: |
        Attach an existing persistent volume, NAME:MOUNTPATH (cloud only, experimental; repeatable)
@y
      usage: |
        Attach an existing persistent volume, NAME:MOUNTPATH (cloud only, experimental; repeatable)
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Create and run a sandbox with claude in the current directory
      sbx run claude
@y
example: |4-
      # Create and run a sandbox with claude in the current directory
      sbx run claude
@z

@x
      # Create and run from a local sandbox kit
      sbx run ../path/to/my-agent/
@y
      # Create and run from a local sandbox kit
      sbx run ../path/to/my-agent/
@z

@x
      # Create and run from an OCI sandbox kit
      sbx run ghcr.io/foo/my-agent:latest
@y
      # Create and run from an OCI sandbox kit
      sbx run ghcr.io/foo/my-agent:latest
@z

@x
      # Add a mixin to a built-in agent
      sbx run claude --kit ./my-mixin/
@y
      # Add a mixin to a built-in agent
      sbx run claude --kit ./my-mixin/
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

@x
      # Create a cloud sandbox non-interactively and print its ID
      sbx --cloud run --detached claude
@y
      # Create a cloud sandbox non-interactively and print its ID
      sbx --cloud run --detached claude
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
