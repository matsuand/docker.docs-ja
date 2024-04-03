%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose up
short: Create and start containers
long: |-
    Builds, (re)creates, starts, and attaches to containers for a service.
@y
command: docker compose up
short: Create and start containers
long: |-
    Builds, (re)creates, starts, and attaches to containers for a service.
@z

@x
    Unless they are already running, this command also starts any linked services.
@y
    Unless they are already running, this command also starts any linked services.
@z

@x
    The `docker compose up` command aggregates the output of each container (like `docker compose logs --follow` does).
    One can optionally select a subset of services to attach to using `--attach` flag, or exclude some services using
    `--no-attach` to prevent output to be flooded by some verbose services.
@y
    The `docker compose up` command aggregates the output of each container (like `docker compose logs --follow` does).
    One can optionally select a subset of services to attach to using `--attach` flag, or exclude some services using
    `--no-attach` to prevent output to be flooded by some verbose services.
@z

@x
    When the command exits, all containers are stopped. Running `docker compose up --detach` starts the containers in the
    background and leaves them running.
@y
    When the command exits, all containers are stopped. Running `docker compose up --detach` starts the containers in the
    background and leaves them running.
@z

@x
    If there are existing containers for a service, and the service’s configuration or image was changed after the
    container’s creation, `docker compose up` picks up the changes by stopping and recreating the containers
    (preserving mounted volumes). To prevent Compose from picking up changes, use the `--no-recreate` flag.
@y
    If there are existing containers for a service, and the service’s configuration or image was changed after the
    container’s creation, `docker compose up` picks up the changes by stopping and recreating the containers
    (preserving mounted volumes). To prevent Compose from picking up changes, use the `--no-recreate` flag.
@z

@x
    If you want to force Compose to stop and recreate all containers, use the `--force-recreate` flag.
@y
    If you want to force Compose to stop and recreate all containers, use the `--force-recreate` flag.
@z

@x
    If the process encounters an error, the exit code for this command is `1`.
    If the process is interrupted using `SIGINT` (ctrl + C) or `SIGTERM`, the containers are stopped, and the exit code is `0`.
@y
    If the process encounters an error, the exit code for this command is `1`.
    If the process is interrupted using `SIGINT` (ctrl + C) or `SIGTERM`, the containers are stopped, and the exit code is `0`.
@z

@x
usage: docker compose up [OPTIONS] [SERVICE...]
@y
usage: docker compose up [OPTIONS] [SERVICE...]
@z

% options:

@x abort-on-container-exit
      description: |
        Stops all containers if any container was stopped. Incompatible with -d
@y
      description: |
        Stops all containers if any container was stopped. Incompatible with -d
@z

@x always-recreate-deps
      description: Recreate dependent containers. Incompatible with --no-recreate.
@y
      description: Recreate dependent containers. Incompatible with --no-recreate.
@z

@x attach
      description: |
        Restrict attaching to the specified services. Incompatible with --attach-dependencies.
@y
      description: |
        Restrict attaching to the specified services. Incompatible with --attach-dependencies.
@z

@x attach-dependencies
      description: Automatically attach to log output of dependent services
@y
      description: Automatically attach to log output of dependent services
@z

@x build
      description: Build images before starting containers
@y
      description: Build images before starting containers
@z

@x detach
      description: 'Detached mode: Run containers in the background'
@y
      description: 'Detached mode: Run containers in the background'
@z

@x exit-code-from
      description: |
        Return the exit code of the selected service container. Implies --abort-on-container-exit
@y
      description: |
        Return the exit code of the selected service container. Implies --abort-on-container-exit
@z

@x force-recreate
      description: |
        Recreate containers even if their configuration and image haven't changed
@y
      description: |
        Recreate containers even if their configuration and image haven't changed
@z

@x no-attach
      description: Do not attach (stream logs) to the specified services
@y
      description: Do not attach (stream logs) to the specified services
@z

@x no-build
      description: Don't build an image, even if it's policy
@y
      description: Don't build an image, even if it's policy
@z

@x no-color
      description: Produce monochrome output
@y
      description: Produce monochrome output
@z

@x no-deps
      description: Don't start linked services
@y
      description: Don't start linked services
@z

@x no-log-prefix
      description: Don't print prefix in logs
@y
      description: Don't print prefix in logs
@z

@x no-recreate
      description: |
        If containers already exist, don't recreate them. Incompatible with --force-recreate.
@y
      description: |
        If containers already exist, don't recreate them. Incompatible with --force-recreate.
@z

@x no-start
      description: Don't start the services after creating them
@y
      description: Don't start the services after creating them
@z

@x pull
      description: Pull image before running ("always"|"missing"|"never")
@y
      description: Pull image before running ("always"|"missing"|"never")
@z

@x quiet-pull
      description: Pull without printing progress information
@y
      description: Pull without printing progress information
@z

@x remove-orphans
      description: Remove containers for services not defined in the Compose file
@y
      description: Remove containers for services not defined in the Compose file
@z

@x renew-anon-volumes
      description: |
        Recreate anonymous volumes instead of retrieving data from the previous containers
@y
      description: |
        Recreate anonymous volumes instead of retrieving data from the previous containers
@z

@x scale
      description: |
        Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.
@y
      description: |
        Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.
@z

@x timeout
      description: |
        Use this timeout in seconds for container shutdown when attached or when containers are already running
@y
      description: |
        Use this timeout in seconds for container shutdown when attached or when containers are already running
@z

@x timestamps
      description: Show timestamps
@y
      description: Show timestamps
@z

@x wait
      description: Wait for services to be running|healthy. Implies detached mode.
@y
      description: Wait for services to be running|healthy. Implies detached mode.
@z

@x wait-timeout
      description: Maximum duration to wait for the project to be running|healthy
@y
      description: Maximum duration to wait for the project to be running|healthy
@z

@x watch
      description: |
        Watch source code and rebuild/refresh containers when files are updated.
@y
      description: |
        Watch source code and rebuild/refresh containers when files are updated.
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
