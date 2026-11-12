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
    The first positional argument may be a built-in agent name or a sandbox kit
    reference. Sandbox kit references may be local directories, ZIP files, git
    repositories, or OCI references. Relative local references must be explicit
    paths such as ./my-kit or ../my-kit.zip. A kit.shortcuts.<agent> setting
    (sbx settings set kit.shortcuts.claude myorg/claude:latest) makes that agent name
    resolve to the configured kit reference instead for local sandboxes; cloud
    sandboxes ignore it.
@y
    The first positional argument may be a built-in agent name or a sandbox kit
    reference. Sandbox kit references may be local directories, ZIP files, git
    repositories, or OCI references. Relative local references must be explicit
    paths such as ./my-kit or ../my-kit.zip. A kit.shortcuts.<agent> setting
    (sbx settings set kit.shortcuts.claude myorg/claude:latest) makes that agent name
    resolve to the configured kit reference instead for local sandboxes; cloud
    sandboxes ignore it.
@z

@x
    Omit the path to create a sandbox without a workspace bind mount: the agent
    then works in the container's own filesystem instead of on your files.
@y
    Omit the path to create a sandbox without a workspace bind mount: the agent
    then works in the container's own filesystem instead of on your files.
@z

@x
    Use "sbx run --name SANDBOX" to attach to the agent after creation.
@y
    Use "sbx run --name SANDBOX" to attach to the agent after creation.
@z

@x
    Available agents: claude, codex, copilot, cursor, devin, docker-agent, droid, kiro, opencode, shell
@y
    Available agents: claude, codex, copilot, cursor, devin, docker-agent, droid, kiro, opencode, shell
@z

@x
    With --cloud:
    Create a cloud sandbox for an agent.
@y
    With --cloud:
    Create a cloud sandbox for an agent.
@z

@x
    Cloud sandboxes have no host workspace, so no path follows the agent. Sizing
    comes from --cpus and --memory and must land on a billable shape; without them
    a cloud sandbox gets 2 CPUs and 4 GiB. A template named with -t / --template
    must already exist in the cloud registry.
@y
    Cloud sandboxes have no host workspace, so no path follows the agent. Sizing
    comes from --cpus and --memory and must land on a billable shape; without them
    a cloud sandbox gets 2 CPUs and 4 GiB. A template named with -t / --template
    must already exist in the cloud registry.
@z

@x
    Cloud sandboxes use cloud network policies. Host network and HTTP policies
    do not apply. Set cloud account defaults with
    "sbx --cloud policy init <allow-all|balanced|deny-all>".
@y
    Cloud sandboxes use cloud network policies. Host network and HTTP policies
    do not apply. Set cloud account defaults with
    "sbx --cloud policy init <allow-all|balanced|deny-all>".
@z

@x
    Use "sbx --cloud run <agent> --name SANDBOX" to attach to the agent after
    creation: cloud needs the agent, since a name alone is not a unique handle.
@y
    Use "sbx --cloud run <agent> --name SANDBOX" to attach to the agent after
    creation: cloud needs the agent, since a name alone is not a unique handle.
@z

@x
usage: sbx create AGENT|SANDBOX_KIT [PATH...] [flags]
@y
usage: sbx create AGENT|SANDBOX_KIT [PATH...] [flags]
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
        Run the agent on a private in-container clone of the host Git repository (mounted read-only) instead of bind-mounting the workspace; the agent's commits are accessible via the sandbox-<name> git remote on the host
@y
      usage: |
        Run the agent on a private in-container clone of the host Git repository (mounted read-only) instead of bind-mounting the workspace; the agent's commits are accessible via the sandbox-<name> git remote on the host
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

@x help
      usage: help for create
@y
      usage: help for create
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
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@y
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@z

@x pull
      usage: |
        Image pull policy (always|missing|never; default: never for saved local snapshots, missing for v3 kit compositions, otherwise always)
@y
      usage: |
        Image pull policy (always|missing|never; default: never for saved local snapshots, missing for v3 kit compositions, otherwise always)
@z

@x skills
      usage: |
        Shared skills store mode for the agent's skills directory (e.g. ~/.claude/skills): off, readonly (store linked in read-only, directory stays writable), or readwrite (store mounted over it, writes are shared). Default: readonly, or the configured skills.defaultMode setting.
@y
      usage: |
        Shared skills store mode for the agent's skills directory (e.g. ~/.claude/skills): off, readonly (store linked in read-only, directory stays writable), or readwrite (store mounted over it, writes are shared). Default: readonly, or the configured skills.defaultMode setting.
@z

@x static-mcp
      usage: |
        MCP server names that form the sandbox's fixed (static) MCP set. Accepts a comma-separated list (--static-mcp notion,atlassian), repeated flags (--static-mcp notion --static-mcp atlassian), or a mix; all forms accumulate into the same set. Use none for a static set with no servers, local sandboxes only. The set is chosen once at creation time. Local sandboxes take names registered with 'sbx mcp add'. Cloud sandboxes resolve names on the cloud MCP gateway.
@y
      usage: |
        MCP server names that form the sandbox's fixed (static) MCP set. Accepts a comma-separated list (--static-mcp notion,atlassian), repeated flags (--static-mcp notion --static-mcp atlassian), or a mix; all forms accumulate into the same set. Use none for a static set with no servers, local sandboxes only. The set is chosen once at creation time. Local sandboxes take names registered with 'sbx mcp add'. Cloud sandboxes resolve names on the cloud MCP gateway.
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
      # Mount an additional workspace at a chosen path inside the sandbox
      sbx create claude . /path/to/data:/workspace/data
@y
      # Mount an additional workspace at a chosen path inside the sandbox
      sbx create claude . /path/to/data:/workspace/data
@z

@x
      # Create without a workspace bind mount
      sbx create claude
@y
      # Create without a workspace bind mount
      sbx create claude
@z

@x
      # Create from a local sandbox kit
      sbx create ../path/to/my-agent/
@y
      # Create from a local sandbox kit
      sbx create ../path/to/my-agent/
@z

@x
      # Add a mixin from a local directory or ZIP file
      sbx create claude --kit ./my-mixin/
      sbx create claude --kit ./my-mixin.zip
@y
      # Add a mixin from a local directory or ZIP file
      sbx create claude --kit ./my-mixin/
      sbx create claude --kit ./my-mixin.zip
@z

@x
      # Add a mixin from Docker Hub
      sbx create claude --kit org/my-mixin:latest
@y
      # Add a mixin from Docker Hub
      sbx create claude --kit org/my-mixin:latest
@z

@x
      # Add a mixin from an OCI reference
      sbx create claude --kit ghcr.io/org/my-mixin:latest
@y
      # Add a mixin from an OCI reference
      sbx create claude --kit ghcr.io/org/my-mixin:latest
@z

@x
      # Add a mixin from a git repository (git+https:// or git+ssh://, optionally pinned to a ref and/or subdirectory)
      sbx create claude --kit "git+https://github.com/org/repo.git#ref=v1.0&dir=mixins/foo"
@y
      # Add a mixin from a git repository (git+https:// or git+ssh://, optionally pinned to a ref and/or subdirectory)
      sbx create claude --kit "git+https://github.com/org/repo.git#ref=v1.0&dir=mixins/foo"
@z

@x
      # Run the agent on an in-container clone of the host repo, wired back via a git-daemon
      sbx create --clone claude .
@y
      # Run the agent on an in-container clone of the host repo, wired back via a git-daemon
      sbx create --clone claude .
@z

@x
      # Create a cloud sandbox for claude
      sbx --cloud create claude
@y
      # Create a cloud sandbox for claude
      sbx --cloud create claude
@z

@x
      # Create a named cloud sandbox with a mixin baked in
      sbx --cloud create --name my-project claude --kit ./my-mixin/
@y
      # Create a named cloud sandbox with a mixin baked in
      sbx --cloud create --name my-project claude --kit ./my-mixin/
@z

@x
      # Create from a template that already exists in the cloud registry
      sbx --cloud create -t TEMPLATE
@y
      # Create from a template that already exists in the cloud registry
      sbx --cloud create -t TEMPLATE
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
