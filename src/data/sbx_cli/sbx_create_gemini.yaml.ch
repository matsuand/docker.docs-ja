%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx create gemini
synopsis: Create a sandbox for gemini
description: |-
    Create a sandbox with access to a host workspace for gemini.
@y
name: sbx create gemini
synopsis: Create a sandbox for gemini
description: |-
    Create a sandbox with access to a host workspace for gemini.
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
    With --cloud:
    Create a cloud sandbox for gemini.
@y
    With --cloud:
    Create a cloud sandbox for gemini.
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
    Use "sbx --cloud run --name SANDBOX" to attach to the agent after creation.
@y
    Use "sbx --cloud run --name SANDBOX" to attach to the agent after creation.
@z

@x
usage: sbx create gemini [PATH...] [flags]
@y
usage: sbx create gemini [PATH...] [flags]
@z

% options:

@x help
      usage: help for gemini
@y
      usage: help for gemini
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
        Name for the sandbox (defaults to <agent>-<workdir>; at least two characters, starting with a letter or number, containing only letters, numbers, hyphens and periods (periods are rejected with --cloud); 'default' is reserved)
@y
      usage: |
        Name for the sandbox (defaults to <agent>-<workdir>; at least two characters, starting with a letter or number, containing only letters, numbers, hyphens and periods (periods are rejected with --cloud); 'default' is reserved)
@z

@x on-timeout
      usage: |
        What happens when --ttl lapses: 'stop' stops the sandbox in place so it can be started again later, 'restart' keeps it running by stopping and immediately starting it, or 'delete' removes it. Omit the flag and the server stops the sandbox when it can be started again later, and deletes it otherwise. With 'restart' a supplied --ttl must be at least 1h (cloud only).
@y
      usage: |
        What happens when --ttl lapses: 'stop' stops the sandbox in place so it can be started again later, 'restart' keeps it running by stopping and immediately starting it, or 'delete' removes it. Omit the flag and the server stops the sandbox when it can be started again later, and deletes it otherwise. With 'restart' a supplied --ttl must be at least 1h (cloud only).
@z

@x publish
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@y
      usage: |
        Publish a sandbox port to the host (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@z

@x pull
      usage: Image pull policy (always|missing|never)
@y
      usage: Image pull policy (always|missing|never)
@z

@x quiet
      usage: Suppress verbose output
@y
      usage: Suppress verbose output
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
        MCP server names that form the sandbox's fixed (static) MCP set. Accepts a comma-separated list (--static-mcp notion,atlassian), repeated flags (--static-mcp notion --static-mcp atlassian), or a mix; all forms accumulate into the same set. The set is chosen once at creation time. Local sandboxes take names registered with 'sbx mcp add'. Cloud sandboxes resolve names on the cloud MCP gateway.
@y
      usage: |
        MCP server names that form the sandbox's fixed (static) MCP set. Accepts a comma-separated list (--static-mcp notion,atlassian), repeated flags (--static-mcp notion --static-mcp atlassian), or a mix; all forms accumulate into the same set. The set is chosen once at creation time. Local sandboxes take names registered with 'sbx mcp add'. Cloud sandboxes resolve names on the cloud MCP gateway.
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

@x
example: |4-
      # Create in the current directory
      sbx create gemini .
@y
example: |4-
      # Create in the current directory
      sbx create gemini .
@z

@x
      # Create with a specific path
      sbx create gemini /path/to/project
@y
      # Create with a specific path
      sbx create gemini /path/to/project
@z

@x
      # Create with additional read-only workspaces
      sbx create gemini . /path/to/docs:ro
@y
      # Create with additional read-only workspaces
      sbx create gemini . /path/to/docs:ro
@z

@x
      # Create without a workspace bind mount
      sbx create gemini
@y
      # Create without a workspace bind mount
      sbx create gemini
@z

@x
      # Create a cloud sandbox for gemini
      sbx --cloud create gemini
@y
      # Create a cloud sandbox for gemini
      sbx --cloud create gemini
@z

@x
      # Create a named cloud sandbox with a mixin baked in
      sbx --cloud create --name my-project gemini --kit ./my-mixin/
@y
      # Create a named cloud sandbox with a mixin baked in
      sbx --cloud create --name my-project gemini --kit ./my-mixin/
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
    - sbx create - Create a sandbox for an agent
@y
    - sbx create - Create a sandbox for an agent
@z
