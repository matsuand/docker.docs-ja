%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx env run
synopsis: Create (if needed) and attach to a sandbox environment
experimental: true
description: |-
    Read the environment file from PATH (default: current directory)
    and drop into the sandbox shell. If the sandbox already exists it is started
    and re-attached without re-provisioning; otherwise it is created first
    (provisioning secrets and bindings) and then attached.
@y
name: sbx env run
synopsis: Create (if needed) and attach to a sandbox environment
experimental: true
description: |-
    Read the environment file from PATH (default: current directory)
    and drop into the sandbox shell. If the sandbox already exists it is started
    and re-attached without re-provisioning; otherwise it is created first
    (provisioning secrets and bindings) and then attached.
@z

@x
    Each PATH may be a directory (the file is <PATH>/sbxenv.yaml) or the
    path to the environment file itself. Passing more than one PATH deep-merges them
    in order (docker-compose `-f` semantics): later files override earlier ones.
    Values may reference the arguments the file declares with ${{ env.args.NAME }},
    supplied by --env-arg, plus ${{ env.projectDir }} and ${{ env.fileDir }}.
    Nothing else is expanded, so a "$" is literal text.
@y
    Each PATH may be a directory (the file is <PATH>/sbxenv.yaml) or the
    path to the environment file itself. Passing more than one PATH deep-merges them
    in order (docker-compose `-f` semantics): later files override earlier ones.
    Values may reference the arguments the file declares with ${{ env.args.NAME }},
    supplied by --env-arg, plus ${{ env.projectDir }} and ${{ env.fileDir }}.
    Nothing else is expanded, so a "$" is literal text.
@z

@x
    A directory PATH selects sbxenv.yaml; a file PATH selects that file.
    With no PATH, ~/.sbxenv.yaml supplies shared defaults when present.
    Explicit PATHs skip those defaults. Later files override earlier values;
    lists such as ports and mcp.servers are concatenated.
@y
    A directory PATH selects sbxenv.yaml; a file PATH selects that file.
    With no PATH, ~/.sbxenv.yaml supplies shared defaults when present.
    Explicit PATHs skip those defaults. Later files override earlier values;
    lists such as ports and mcp.servers are concatenated.
@z

@x
usage: sbx env run [PATH...] [flags]
@y
usage: sbx env run [PATH...] [flags]
@z

% options:

@x clone
      usage: |
        Override workspace.clone in sbxenv.yaml (see 'sbx create --clone')
@y
      usage: |
        Override workspace.clone in sbxenv.yaml (see 'sbx create --clone')
@z

@x detach
      usage: Create/start the sandbox without attaching
@y
      usage: Create/start the sandbox without attaching
@z

@x env-arg
      usage: |
        Value for an argument the environment file declares, as name=value (can be repeated)
@y
      usage: |
        Value for an argument the environment file declares, as name=value (can be repeated)
@z

@x env-args-file
      usage: |
        File of name=value environment arguments, one per line (can be repeated); --env-arg overrides
@y
      usage: |
        File of name=value environment arguments, one per line (can be repeated); --env-arg overrides
@z

@x force
      usage: Apply the environment plan without asking
@y
      usage: Apply the environment plan without asking
@z

@x help
      usage: help for run
@y
      usage: help for run
@z

@x kit-arg
      usage: |
        Value for an argument a kit declares, as name=value for every kit or kit.name=value for one (can be repeated); overrides the args a kits: entry pins in sbxenv.yaml
@y
      usage: |
        Value for an argument a kit declares, as name=value for every kit or kit.name=value for one (can be repeated); overrides the args a kits: entry pins in sbxenv.yaml
@z

@x kit-args-file
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@y
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@z

@x name
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@y
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@z

@x
    - name: on-timeout
      usage: |
        What happens when --ttl lapses: 'stop' stops the sandbox in place so it can be started again later, 'restart' keeps it running by stopping and immediately starting it, or 'delete' removes it. Omit the flag and the server stops the sandbox when it can be started again later, and deletes it otherwise. With 'restart' a supplied --ttl must be at least 1h (cloud only). Only applies when the sandbox is created; 'sbx --cloud env run' refuses it when attaching to an existing one.
@y
    - name: on-timeout
      usage: |
        What happens when --ttl lapses: 'stop' stops the sandbox in place so it can be started again later, 'restart' keeps it running by stopping and immediately starting it, or 'delete' removes it. Omit the flag and the server stops the sandbox when it can be started again later, and deletes it otherwise. With 'restart' a supplied --ttl must be at least 1h (cloud only). Only applies when the sandbox is created; 'sbx --cloud env run' refuses it when attaching to an existing one.
@z

@x skip-host-commands
      usage: Skip the host lifecycle commands the environment declares
@y
      usage: Skip the host lifecycle commands the environment declares
@z

@x
    - name: ttl
      usage: |
        Cloud sandbox time-to-live before it times out (e.g. 30m, 2h, 1h30m; units are case-insensitive; cloud only; default: server-side). Only applies when the sandbox is created; 'sbx --cloud env run' refuses it when attaching to an existing one
@y
    - name: ttl
      usage: |
        Cloud sandbox time-to-live before it times out (e.g. 30m, 2h, 1h30m; units are case-insensitive; cloud only; default: server-side). Only applies when the sandbox is created; 'sbx --cloud env run' refuses it when attaching to an existing one
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

@x
example: |4-
      sbx env run
@y
example: |4-
      sbx env run
@z

@x
      # Start without attaching
      sbx env run --detach ./project
@y
      # Start without attaching
      sbx env run --detach ./project
@z

% see_also:

@x
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@y
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@z
