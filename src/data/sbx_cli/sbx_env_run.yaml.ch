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
    A directory resolves to the sbxenv.yaml in it and to no other name; any
    other file is read only when a PATH names it. The hidden .sbxenv.yaml was once
    read as a directory's own environment too, so a project still holding one now
    reads as having none.
@y
    A directory resolves to the sbxenv.yaml in it and to no other name; any
    other file is read only when a PATH names it. The hidden .sbxenv.yaml was once
    read as a directory's own environment too, so a project still holding one now
    reads as having none.
@z

@x
    With no PATH, an existing .sbxenv.yaml in your home directory is merged
    underneath as a base layer for defaults shared across projects; naming any
    PATH skips the layer. It may not set "name:", which identifies a single
    project, and its "workspace:" must be rooted at ${{ env.projectDir }} — for
    the base that is always the directory the invocation runs from, since naming
    any PATH skips it — so the base mounts each project's own directory rather
    than one directory under all of them. Changing its "agent:"
    changes the derived <agent>-<directory-basename> sandbox name, leaving
    sandboxes created under the previous name for "sbx env rm" to miss.
@y
    With no PATH, an existing .sbxenv.yaml in your home directory is merged
    underneath as a base layer for defaults shared across projects; naming any
    PATH skips the layer. It may not set "name:", which identifies a single
    project, and its "workspace:" must be rooted at ${{ env.projectDir }} — for
    the base that is always the directory the invocation runs from, since naming
    any PATH skips it — so the base mounts each project's own directory rather
    than one directory under all of them. Changing its "agent:"
    changes the derived <agent>-<directory-basename> sandbox name, leaving
    sandboxes created under the previous name for "sbx env rm" to miss.
@z

@x
    A list such as "ports" or "mcp.servers" concatenates across layers rather
    than overriding, so an entry declared in both appears twice.
@y
    A list such as "ports" or "mcp.servers" concatenates across layers rather
    than overriding, so an entry declared in both appears twice.
@z

@x
usage: sbx env run [PATH...] [flags]
@y
usage: sbx env run [PATH...] [flags]
@z

% options:

@x auto-approve
      usage: Apply the environment plan without asking
@y
      usage: Apply the environment plan without asking
@z

@x clone
      usage: |
        Override workspace.clone in sbxenv.yaml (see 'sbx create --clone')
@y
      usage: |
        Override workspace.clone in sbxenv.yaml (see 'sbx create --clone')
@z

@x detached
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

@x skip-host-commands
      usage: Skip the host lifecycle commands the environment declares
@y
      usage: Skip the host lifecycle commands the environment declares
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
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@y
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@z
