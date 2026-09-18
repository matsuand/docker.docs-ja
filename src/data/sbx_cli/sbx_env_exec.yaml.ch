%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx env exec
synopsis: Execute a command inside a sandbox environment
experimental: true
description: |-
    Run COMMAND in the sandbox declared in sbxenv.yaml. The sandbox
    must already exist (see "sbx env create" and "sbx env run"); a stopped sandbox is
    started first.
@y
name: sbx env exec
synopsis: Execute a command inside a sandbox environment
experimental: true
description: |-
    Run COMMAND in the sandbox declared in sbxenv.yaml. The sandbox
    must already exist (see "sbx env create" and "sbx env run"); a stopped sandbox is
    started first.
@z

@x
    Arguments before `--` are environment-file paths, following the same rules as
    the other "sbx env" subcommands: each PATH may be a directory (the file is
    <PATH>/sbxenv.yaml) or the path to the environment file itself, and passing
    more than one deep-merges them in order. Without a `--` every positional
    argument forms the command and the environment file is read from the current
    directory.
@y
    Arguments before `--` are environment-file paths, following the same rules as
    the other "sbx env" subcommands: each PATH may be a directory (the file is
    <PATH>/sbxenv.yaml) or the path to the environment file itself, and passing
    more than one deep-merges them in order. Without a `--` every positional
    argument forms the command and the environment file is read from the current
    directory.
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
    Flags match the behavior of "sbx exec".
@y
    Flags match the behavior of "sbx exec".
@z

@x
usage: sbx env exec [flags] [PATH...] -- COMMAND [ARG...]
@y
usage: sbx env exec [flags] [PATH...] -- COMMAND [ARG...]
@z

% options:

@x detach
      usage: 'Detached mode: run command in the background'
@y
      usage: 'Detached mode: run command in the background'
@z

@x detach-keys
      usage: Override the key sequence for detaching a container
@y
      usage: Override the key sequence for detaching a container
@z

@x env
      usage: Set environment variables
@y
      usage: Set environment variables
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

@x env-file
      usage: Read in a file of environment variables
@y
      usage: Read in a file of environment variables
@z

@x help
      usage: help for exec
@y
      usage: help for exec
@z

@x interactive
      usage: Keep STDIN open even if not attached
@y
      usage: Keep STDIN open even if not attached
@z

@x name
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@y
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@z

@x privileged
      usage: Give extended privileges to the command
@y
      usage: Give extended privileges to the command
@z

@x tty
      usage: Allocate a pseudo-TTY
@y
      usage: Allocate a pseudo-TTY
@z

@x user
      usage: 'Username or UID (format: <name|uid>[:<group|gid>])'
@y
      usage: 'Username or UID (format: <name|uid>[:<group|gid>])'
@z

@x workdir
      usage: Working directory inside the container
@y
      usage: Working directory inside the container
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
      # Run a command in the environment declared in the current directory
      sbx env exec go test ./...
@y
example: |4-
      # Run a command in the environment declared in the current directory
      sbx env exec go test ./...
@z

@x
      # Open a shell
      sbx env exec -it -- bash
@y
      # Open a shell
      sbx env exec -it -- bash
@z

@x
      # Run against explicitly merged environment files
      sbx env exec sbxenv.yaml override.yaml -- npm test
@y
      # Run against explicitly merged environment files
      sbx env exec sbxenv.yaml override.yaml -- npm test
@z

% see_also:

@x
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@y
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@z
