%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx env
synopsis: |
    Manage sandboxes declaratively from an sbxenv.yaml file
experimental: true
description: |-
    Manage a sandbox declared in an sbxenv.yaml file. The file selects the agent,
    kits, workspace mounts, environment variables, secrets, and credential bindings.
@y
name: sbx env
synopsis: |
    Manage sandboxes declaratively from an sbxenv.yaml file
experimental: true
description: |-
    Manage a sandbox declared in an sbxenv.yaml file. The file selects the agent,
    kits, workspace mounts, environment variables, secrets, and credential bindings.
@z

@x
    Use create to provision the sandbox, run to start or join its agent session,
    exec to run a command, and rm to remove it and its provisioned secrets.
    Use plan to preview changes. Changes require approval; --force skips the prompt.
@y
    Use create to provision the sandbox, run to start or join its agent session,
    exec to run a command, and rm to remove it and its provisioned secrets.
    Use plan to preview changes. Changes require approval; --force skips the prompt.
@z

@x
    Lifecycle commands and command-based secrets execute on the host with your
    permissions. Keep secret helpers and their dependencies outside writable
    sandbox mounts, and use absolute helper paths.
@y
    Lifecycle commands and command-based secrets execute on the host with your
    permissions. Keep secret helpers and their dependencies outside writable
    sandbox mounts, and use absolute helper paths.
@z

@x
    The environment file is mounted read-only by default when shared with the
    sandbox. Set sandboxOptions.writableEnvFiles only when you trust the agent
    to change what future invocations run on the host.
@y
    The environment file is mounted read-only by default when shared with the
    sandbox. Set sandboxOptions.writableEnvFiles only when you trust the agent
    to change what future invocations run on the host.
@z

@x
    With --cloud, manage a cloud sandbox from the same file. Host workspace mounts,
    host port bindings, MCP definitions, registry credentials, and unsnapshotted
    dynamic secret sources are unsupported. Clone the project inside the sandbox instead.
@y
    With --cloud, manage a cloud sandbox from the same file. Host workspace mounts,
    host port bindings, MCP definitions, registry credentials, and unsnapshotted
    dynamic secret sources are unsupported. Clone the project inside the sandbox instead.
@z

@x
    Secrets and bindings are provisioned at creation; changes require recreating
    the sandbox. Removal deletes secrets provisioned by this environment; bindings
    are retained unless --prune-bindings is passed. Use the same cloud target,
    identity, and ordered files for subsequent commands.
@y
    Secrets and bindings are provisioned at creation; changes require recreating
    the sandbox. Removal deletes secrets provisioned by this environment; bindings
    are retained unless --prune-bindings is passed. Use the same cloud target,
    identity, and ordered files for subsequent commands.
@z

@x
    For file syntax and workflows, see:
    https://docs.docker.com/ai/sandboxes/configuration/environment-files/
@y
    For file syntax and workflows, see:
    https://docs.docker.com/ai/sandboxes/configuration/environment-files/
@z

@x
usage: sbx env COMMAND
@y
usage: sbx env COMMAND
@z

% options:

@x help
      usage: help for env
@y
      usage: help for env
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

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx env create - Create a sandbox environment from sbxenv.yaml
    - sbx env exec - Execute a command inside a sandbox environment
    - sbx env plan - Show what an environment would change outside the sandbox
    - sbx env rm - Remove a sandbox environment and its scoped resources
    - sbx env run - Create (if needed) and attach to a sandbox environment
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx env create - Create a sandbox environment from sbxenv.yaml
    - sbx env exec - Execute a command inside a sandbox environment
    - sbx env plan - Show what an environment would change outside the sandbox
    - sbx env rm - Remove a sandbox environment and its scoped resources
    - sbx env run - Create (if needed) and attach to a sandbox environment
@z
