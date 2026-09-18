%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create devin
synopsis: Create a sandbox for devin
description: |-
    Create a sandbox with access to a host workspace for devin.
@y
name: sbx create devin
synopsis: Create a sandbox for devin
description: |-
    Create a sandbox with access to a host workspace for devin.
@z

@x
    The workspace path is mounted inside the sandbox at the same path as on the
    host. Additional workspaces can be provided as extra arguments. Append ":ro" to
    mount them read-only; a read-only argument may name a single file, which holds
    that one path out of reach inside a workspace the sandbox can otherwise write.
@y
    The workspace path is mounted inside the sandbox at the same path as on the
    host. Additional workspaces can be provided as extra arguments. Append ":ro" to
    mount them read-only; a read-only argument may name a single file, which holds
    that one path out of reach inside a workspace the sandbox can otherwise write.
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
    Without --cpus/--memory a cloud sandbox defaults to 2 CPUs and 4 GiB.
@y
    Without --cpus/--memory a cloud sandbox defaults to 2 CPUs and 4 GiB.
@z

@x
usage: sbx create devin [PATH...] [flags]
@y
usage: sbx create devin [PATH...] [flags]
@z

% options:

@x help
      usage: help for devin
@y
      usage: help for devin
@z

% inherited_options:

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
      usage: |
        Name for the sandbox (defaults to <agent>-<workdir>; at least two characters, starting with a letter or number, containing only letters, numbers, hyphens and periods; 'default' is reserved)
@y
      usage: |
        Name for the sandbox (defaults to <agent>-<workdir>; at least two characters, starting with a letter or number, containing only letters, numbers, hyphens and periods; 'default' is reserved)
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

@x skills
      usage: |
        Shared skills store mode: off, readonly, or readwrite (mounted at the agent's skills directory, e.g. ~/.claude/skills). Default: readonly, or the configured skills.defaultMode setting.
@y
      usage: |
        Shared skills store mode: off, readonly, or readwrite (mounted at the agent's skills directory, e.g. ~/.claude/skills). Default: readonly, or the configured skills.defaultMode setting.
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

@x
example: |4-
      # Create in the current directory
      sbx create devin .
@y
example: |4-
      # Create in the current directory
      sbx create devin .
@z

@x
      # Create with a specific path
      sbx create devin /path/to/project
@y
      # Create with a specific path
      sbx create devin /path/to/project
@z

@x
      # Create with additional read-only workspaces
      sbx create devin . /path/to/docs:ro
@y
      # Create with additional read-only workspaces
      sbx create devin . /path/to/docs:ro
@z

@x
      # Create without a workspace bind mount
      sbx create devin
@y
      # Create without a workspace bind mount
      sbx create devin
@z

% see_also:

@x
    - sbx create - Create a sandbox for an agent
@y
    - sbx create - Create a sandbox for an agent
@z
