%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx exec
synopsis: Execute a command inside a sandbox
description: |-
    Execute a command in a sandbox. If the sandbox is stopped, it is started first. Or — with --cloud — the cloud sandbox
    ID (sbx_*) or name from "sbx --cloud ls".
@y
name: sbx exec
synopsis: Execute a command inside a sandbox
description: |-
    Execute a command in a sandbox. If the sandbox is stopped, it is started first. Or — with --cloud — the cloud sandbox
    ID (sbx_*) or name from "sbx --cloud ls".
@z

@x
    Flags match the behavior of "docker exec". Some flags (-d, --user, --privileged)
    are not supported with --cloud and are rejected rather than silently ignored.
    --detach-keys applies only to an interactive (-i/-t) cloud exec.
@y
    Flags match the behavior of "docker exec". Some flags (-d, --user, --privileged)
    are not supported with --cloud and are rejected rather than silently ignored.
    --detach-keys applies only to an interactive (-i/-t) cloud exec.
@z

@x
usage: sbx exec [flags] SANDBOX COMMAND [ARG...]
@y
usage: sbx exec [flags] SANDBOX COMMAND [ARG...]
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
      # Open a shell inside a sandbox
      sbx exec -it my-sandbox bash
@y
example: |4-
      # Open a shell inside a sandbox
      sbx exec -it my-sandbox bash
@z

@x
      # Run a command in the background
      sbx exec -d my-sandbox npm start
@y
      # Run a command in the background
      sbx exec -d my-sandbox npm start
@z

@x
      # Run as root
      sbx exec -u root my-sandbox apt-get update
@y
      # Run as root
      sbx exec -u root my-sandbox apt-get update
@z

@x
      # Cloud: run a command in a cloud sandbox by ID or name
      sbx --cloud exec -it sbx_abc123 bash
      sbx --cloud exec -it claude/my-sandbox bash
@y
      # Cloud: run a command in a cloud sandbox by ID or name
      sbx --cloud exec -it sbx_abc123 bash
      sbx --cloud exec -it claude/my-sandbox bash
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
