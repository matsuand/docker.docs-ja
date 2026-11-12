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
    retain their agent or sandbox-name meaning. A kit.shortcuts.<agent> setting (sbx
    settings set kit.shortcuts.claude myorg/claude:latest) makes that agent name
    resolve to the configured kit reference instead for local sandboxes; cloud
    sandboxes ignore it. To re-attach to an existing sandbox
    by name, use --name; the agent positional is optional when the named sandbox
    already exists and is read from its spec.
@y
    The first positional argument identifies the agent to run. It may be a built-in
    agent name or a sandbox kit reference. Sandbox kit references may be local
    directories, ZIP files, git repositories, or OCI references. Relative local
    references must be explicit paths such as ./my-kit or ../my-kit.zip; bare values
    retain their agent or sandbox-name meaning. A kit.shortcuts.<agent> setting (sbx
    settings set kit.shortcuts.claude myorg/claude:latest) makes that agent name
    resolve to the configured kit reference instead for local sandboxes; cloud
    sandboxes ignore it. To re-attach to an existing sandbox
    by name, use --name; the agent positional is optional when the named sandbox
    already exists and is read from its spec.
@z

@x
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments of the form PATH[:TARGET][:ro]. TARGET is an
    absolute path inside the sandbox; omit it to mount PATH at the same path as on
    the host. Append ":ro" to mount a workspace read-only; a read-only argument may
    name a single file, which holds that one path out of reach inside a workspace
    the sandbox can otherwise write.
@y
    Pass agent arguments after the "--" separator. Additional workspaces can be
    provided as extra arguments of the form PATH[:TARGET][:ro]. TARGET is an
    absolute path inside the sandbox; omit it to mount PATH at the same path as on
    the host. Append ":ro" to mount a workspace read-only; a read-only argument may
    name a single file, which holds that one path out of reach inside a workspace
    the sandbox can otherwise write.
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
    pass --detach (-d) to print the sandbox ID and exit without opening an
    interactive session.
@y
    To create a sandbox without attaching, use "sbx create" instead, or
    pass --detach (-d) to print the sandbox ID and exit without opening an
    interactive session.
@z

@x
    Available agents: claude, codex, copilot, cursor, devin, docker-agent, droid, kiro, opencode, shell
@y
    Available agents: claude, codex, copilot, cursor, devin, docker-agent, droid, kiro, opencode, shell
@z

@x
    With --cloud:
    Run an agent in a cloud sandbox, creating the sandbox if it does not already exist.
@y
    With --cloud:
    Run an agent in a cloud sandbox, creating the sandbox if it does not already exist.
@z

@x
    The first positional argument identifies the agent to run: a built-in agent
    name or a sandbox kit reference (a local directory, ZIP file, git repository,
    or OCI reference). Relative local references must be explicit paths such as
    ./my-kit or ../my-kit.zip. Cloud sandboxes have no host workspace, so no path
    follows the agent. Pass agent arguments after the "--" separator.
@y
    The first positional argument identifies the agent to run: a built-in agent
    name or a sandbox kit reference (a local directory, ZIP file, git repository,
    or OCI reference). Relative local references must be explicit paths such as
    ./my-kit or ../my-kit.zip. Cloud sandboxes have no host workspace, so no path
    follows the agent. Pass agent arguments after the "--" separator.
@z

@x
    Running an agent that has existing sandboxes, running or stopped, prompts you
    to pick one to reuse or to create a new one. Pass --new to skip the prompt and
    always create a fresh sandbox. --name NAME reuses and restarts the sandbox of
    that name when it exists and creates it otherwise. A sandbox kit launch always
    creates fresh, as does a launch that bakes a mixin with build content.
    --detach skips the prompt: with --name it restarts that sandbox when it
    exists, otherwise it creates a new one. A non-interactive run without
    --detach is refused, so scripts pass --detach (e.g.
    sbx --cloud run -d claude && sbx --cloud exec ...).
@y
    Running an agent that has existing sandboxes, running or stopped, prompts you
    to pick one to reuse or to create a new one. Pass --new to skip the prompt and
    always create a fresh sandbox. --name NAME reuses and restarts the sandbox of
    that name when it exists and creates it otherwise. A sandbox kit launch always
    creates fresh, as does a launch that bakes a mixin with build content.
    --detach skips the prompt: with --name it restarts that sandbox when it
    exists, otherwise it creates a new one. A non-interactive run without
    --detach is refused, so scripts pass --detach (e.g.
    sbx --cloud run -d claude && sbx --cloud exec ...).
@z

@x
    When the positional argument identifies an existing sandbox, omit --name.
@y
    When the positional argument identifies an existing sandbox, omit --name.
@z

@x
    With --cloud, --env and --env-file only apply when creating a sandbox.
    Existing sandboxes keep their original environment; drop these flags to
    reattach, or pass --new to create a sandbox with the new values.
@y
    With --cloud, --env and --env-file only apply when creating a sandbox.
    Existing sandboxes keep their original environment; drop these flags to
    reattach, or pass --new to create a sandbox with the new values.
@z

@x
    Sizing comes from --cpus and --memory and must land on a billable shape; without
    them a cloud sandbox gets 2 CPUs and 4 GiB. A template named with -t / --template
    must already exist in the cloud registry; the CLI does not upload it. See
    https://docs.docker.com/ai/sandboxes/ for the cloud sandbox model.
@y
    Sizing comes from --cpus and --memory and must land on a billable shape; without
    them a cloud sandbox gets 2 CPUs and 4 GiB. A template named with -t / --template
    must already exist in the cloud registry; the CLI does not upload it. See
    https://docs.docker.com/ai/sandboxes/ for the cloud sandbox model.
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
        Number of CPUs to allocate to the sandbox (0 = auto: all host CPUs, at most 16 on Linux arm64)
@y
      usage: |
        Number of CPUs to allocate to the sandbox (0 = auto: all host CPUs, at most 16 on Linux arm64)
@z

@x deny-network
      usage: |
        Add a per-sandbox network deny rule at creation time. Can be specified multiple times. The rule applies only to the new sandbox and can be listed or removed later with 'sbx policy ls <NAME>' or 'sbx policy rm network --sandbox <NAME> --resource <HOST>'. Safe under centralized governance because a local deny can only narrow, never widen, egress.
@y
      usage: |
        Add a per-sandbox network deny rule at creation time. Can be specified multiple times. The rule applies only to the new sandbox and can be listed or removed later with 'sbx policy ls <NAME>' or 'sbx policy rm network --sandbox <NAME> --resource <HOST>'. Safe under centralized governance because a local deny can only narrow, never widen, egress.
@z

@x detach
      usage: |
        Start the sandbox and print its ID without opening an agent session
@y
      usage: |
        Start the sandbox and print its ID without opening an agent session
@z

@x
    - name: detach-keys
      usage: |
        Override the detach gesture that leaves the session running (Docker-style, e.g. "ctrl-\", "ctrl-x,ctrl-d"). Default: Ctrl-\. Use this when the default collides with an agent's keymap (cloud only).
@y
    - name: detach-keys
      usage: |
        Override the detach gesture that leaves the session running (Docker-style, e.g. "ctrl-\", "ctrl-x,ctrl-d"). Default: Ctrl-\. Use this when the default collides with an agent's keymap (cloud only).
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
        Memory limit in binary units (e.g., 512m, 8g). Minimum: 512 MiB. Default: 50% of host memory, clamped to 512 MiB–32 GiB. Maximum: host memory. Warns above 75% of host memory
@y
      usage: |
        Memory limit in binary units (e.g., 512m, 8g). Minimum: 512 MiB. Default: 50% of host memory, clamped to 512 MiB–32 GiB. Maximum: host memory. Warns above 75% of host memory
@z

@x mount
      usage: |
        Bind a host directory to a kit host-mount@1 path (can be repeated): HOST:SANDBOX_PATH. Can only be used when creating a new sandbox.
@y
      usage: |
        Bind a host directory to a kit host-mount@1 path (can be repeated): HOST:SANDBOX_PATH. Can only be used when creating a new sandbox.
@z

@x name
      usage: |
        Name for the sandbox (default: <agent>-<workdir>; 2–63 ASCII letters, numbers, hyphens or periods; each dot-separated part must start and end with a letter or number; periods are rejected with --cloud; 'default' is reserved)
@y
      usage: |
        Name for the sandbox (default: <agent>-<workdir>; 2–63 ASCII letters, numbers, hyphens or periods; each dot-separated part must start and end with a letter or number; periods are rejected with --cloud; 'default' is reserved)
@z

@x new
      usage: |
        Always create a new cloud sandbox instead of prompting to reuse an existing one (cloud only)
@y
      usage: |
        Always create a new cloud sandbox instead of prompting to reuse an existing one (cloud only)
@z

@x no-progress
      usage: Suppress progress output
@y
      usage: Suppress progress output
@z

@x on-timeout
      usage: |
        What happens when --ttl lapses: 'stop' stops the sandbox in place so it can be started again later, 'restart' keeps it running by stopping and immediately starting it, or 'delete' removes it. Omit the flag and the server stops the sandbox when it can be started again later, and deletes it otherwise. With 'restart' a supplied --ttl must be at least 1h (cloud only).
@y
      usage: |
        What happens when --ttl lapses: 'stop' stops the sandbox in place so it can be started again later, 'restart' keeps it running by stopping and immediately starting it, or 'delete' removes it. Omit the flag and the server stops the sandbox when it can be started again later, and deletes it otherwise. With 'restart' a supplied --ttl must be at least 1h (cloud only).
@z

@x platform
      usage: |
        Target platform: linux/amd64 or linux/arm64 (cloud only). With --image-ref, omitting it lets the server resolve the platform from the image and the CLI sends the local CPU as a hint for multi-platform images. With --template, omitting it inherits the template platform. With a sandbox kit, the kit's template is built for this platform and cached apart from other platforms; omitting it keeps the server's choice.
@y
      usage: |
        Target platform: linux/amd64 or linux/arm64 (cloud only). With --image-ref, omitting it lets the server resolve the platform from the image and the CLI sends the local CPU as a hint for multi-platform images. With --template, omitting it inherits the template platform. With a sandbox kit, the kit's template is built for this platform and cached apart from other platforms; omitting it keeps the server's choice.
@z

@x publish
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]. Applied when the sandbox is created; ignored when re-attaching (use "sbx ports")
@y
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]. Applied when the sandbox is created; ignored when re-attaching (use "sbx ports")
@z

@x pull
      usage: |
        Image pull policy (always|missing|never; default: never for saved local snapshots, missing for v3 kit compositions, otherwise always)
@y
      usage: |
        Image pull policy (always|missing|never; default: never for saved local snapshots, missing for v3 kit compositions, otherwise always)
@z

@x rm
      usage: Remove the sandbox after the agent session exits
@y
      usage: Remove the sandbox after the agent session exits
@z

@x skills
      usage: |
        Shared skills store mode for the agent's skills directory (e.g. ~/.claude/skills): off, readonly (store linked in read-only, directory stays writable), or readwrite (store mounted over it, writes are shared). Default: readonly, or the configured skills.defaultMode setting. Can only be used when creating a new sandbox.
@y
      usage: |
        Shared skills store mode for the agent's skills directory (e.g. ~/.claude/skills): off, readonly (store linked in read-only, directory stays writable), or readwrite (store mounted over it, writes are shared). Default: readonly, or the configured skills.defaultMode setting. Can only be used when creating a new sandbox.
@z

@x static-mcp
      usage: |
        MCP server names that form the sandbox's fixed (static) MCP set. Accepts a comma-separated list (--static-mcp notion,atlassian), repeated flags (--static-mcp notion --static-mcp atlassian), or a mix; all forms accumulate into the same set. Use none for a static set with no servers, local sandboxes only. The set is chosen once at creation time and cannot be changed when re-attaching to an existing sandbox. Local sandboxes take names registered with 'sbx mcp add'. Cloud sandboxes resolve names on the cloud MCP gateway.
@y
      usage: |
        MCP server names that form the sandbox's fixed (static) MCP set. Accepts a comma-separated list (--static-mcp notion,atlassian), repeated flags (--static-mcp notion --static-mcp atlassian), or a mix; all forms accumulate into the same set. Use none for a static set with no servers, local sandboxes only. The set is chosen once at creation time and cannot be changed when re-attaching to an existing sandbox. Local sandboxes take names registered with 'sbx mcp add'. Cloud sandboxes resolve names on the cloud MCP gateway.
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
        Cloud sandbox time-to-live before it times out (e.g. 30m, 2h, 1h30m; units are case-insensitive; cloud only; default: server-side)
@y
      usage: |
        Cloud sandbox time-to-live before it times out (e.g. 30m, 2h, 1h30m; units are case-insensitive; cloud only; default: server-side)
@z

@x volume
      usage: |
        Attach an existing persistent volume, NAME:MOUNTPATH (cloud only, experimental; repeatable)
@y
      usage: |
        Attach an existing persistent volume, NAME:MOUNTPATH (cloud only, experimental; repeatable)
@z

@x workdir
      usage: |
        Directory to start the agent session in: absolute, or relative to the sandbox workspace. Applies to this session only, so it works on a re-attach too
@y
      usage: |
        Directory to start the agent session in: absolute, or relative to the sandbox workspace. Applies to this session only, so it works on a re-attach too
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
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
      # Add a mixin from a local directory or ZIP file
      sbx run claude --kit ./my-mixin/
      sbx run claude --kit ./my-mixin.zip
@y
      # Add a mixin from a local directory or ZIP file
      sbx run claude --kit ./my-mixin/
      sbx run claude --kit ./my-mixin.zip
@z

@x
      # Add a mixin from Docker Hub
      sbx run claude --kit org/my-mixin:latest
@y
      # Add a mixin from Docker Hub
      sbx run claude --kit org/my-mixin:latest
@z

@x
      # Add a mixin from an OCI reference
      sbx run claude --kit ghcr.io/org/my-mixin:latest
@y
      # Add a mixin from an OCI reference
      sbx run claude --kit ghcr.io/org/my-mixin:latest
@z

@x
      # Add a mixin from a git repository (git+https:// or git+ssh://, optionally pinned to a ref and/or subdirectory)
      sbx run claude --kit "git+https://github.com/org/repo.git#ref=v1.0&dir=mixins/foo"
@y
      # Add a mixin from a git repository (git+https:// or git+ssh://, optionally pinned to a ref and/or subdirectory)
      sbx run claude --kit "git+https://github.com/org/repo.git#ref=v1.0&dir=mixins/foo"
@z

@x
      # Create and run with additional workspaces (read-only)
      sbx run claude . /path/to/docs:ro
@y
      # Create and run with additional workspaces (read-only)
      sbx run claude . /path/to/docs:ro
@z

@x
      # Mount an additional workspace at a chosen path inside the sandbox
      sbx run claude . /path/to/data:/workspace/data
@y
      # Mount an additional workspace at a chosen path inside the sandbox
      sbx run claude . /path/to/data:/workspace/data
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
      # Run claude in a new cloud sandbox
      sbx --cloud run claude
@y
      # Run claude in a new cloud sandbox
      sbx --cloud run claude
@z

@x
      # Create a cloud sandbox non-interactively and print its ID
      sbx --cloud run --detach claude
@y
      # Create a cloud sandbox non-interactively and print its ID
      sbx --cloud run --detach claude
@z

@x
      # Reuse the cloud sandbox of that name, creating it when it does not exist
      sbx --cloud run --name my-project claude
@y
      # Reuse the cloud sandbox of that name, creating it when it does not exist
      sbx --cloud run --name my-project claude
@z

@x
      # Run with agent arguments
      sbx --cloud run claude -- --continue
@y
      # Run with agent arguments
      sbx --cloud run claude -- --continue
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
