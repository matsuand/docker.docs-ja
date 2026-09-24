%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx env rm
synopsis: Remove a sandbox environment and its scoped resources
experimental: true
description: |-
    Remove the sandbox declared in sbxenv.yaml along with the
    secret values provisioned at its sandbox scope (service, custom, and registry
    credentials). Global credential bindings are left in place by default since
    they are user-wide and may be shared with other sandboxes; pass
    --prune-bindings to also remove the bindings this environment declares.
@y
name: sbx env rm
synopsis: Remove a sandbox environment and its scoped resources
experimental: true
description: |-
    Remove the sandbox declared in sbxenv.yaml along with the
    secret values provisioned at its sandbox scope (service, custom, and registry
    credentials). Global credential bindings are left in place by default since
    they are user-wide and may be shared with other sandboxes; pass
    --prune-bindings to also remove the bindings this environment declares.
@z

@x
    Each PATH may be a directory (the file is <PATH>/sbxenv.yaml) or the
    path to the environment file itself. Passing more than one PATH deep-merges them
    in order (docker-compose `-f` semantics), so the same set used to create the
    environment resolves to the same sandbox on removal.
@y
    Each PATH may be a directory (the file is <PATH>/sbxenv.yaml) or the
    path to the environment file itself. Passing more than one PATH deep-merges them
    in order (docker-compose `-f` semantics), so the same set used to create the
    environment resolves to the same sandbox on removal.
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
usage: sbx env rm [PATH...] [flags]
@y
usage: sbx env rm [PATH...] [flags]
@z

% options:

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
      usage: |
        Skip confirmation prompts and delete even if in use (e.g. an open SSH connection)
@y
      usage: |
        Skip confirmation prompts and delete even if in use (e.g. an open SSH connection)
@z

@x help
      usage: help for rm
@y
      usage: help for rm
@z

@x name
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@y
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@z

@x prune-bindings
      usage: |
        Also remove this environment's bindings from the global credentials.yaml
@y
      usage: |
        Also remove this environment's bindings from the global credentials.yaml
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
