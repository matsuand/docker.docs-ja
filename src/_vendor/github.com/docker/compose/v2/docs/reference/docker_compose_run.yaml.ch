%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
command: docker compose run
short: Run a one-off command on a service
long: |-
    Runs a one-time command against a service.
@y
command: docker compose run
short: Run a one-off command on a service
long: |-
    Runs a one-time command against a service.
@z

@x
    The following command starts the `web` service and runs `bash` as its command:
@y
    The following command starts the `web` service and runs `bash` as its command:
@z

% snip command...

@x
    Commands you use with run start in new containers with configuration defined by that of the service,
    including volumes, links, and other details. However, there are two important differences:
@y
    Commands you use with run start in new containers with configuration defined by that of the service,
    including volumes, links, and other details. However, there are two important differences:
@z

@x
    First, the command passed by `run` overrides the command defined in the service configuration. For example, if the
    `web` service configuration is started with `bash`, then `docker compose run web python app.py` overrides it with
    `python app.py`.
@y
    First, the command passed by `run` overrides the command defined in the service configuration. For example, if the
    `web` service configuration is started with `bash`, then `docker compose run web python app.py` overrides it with
    `python app.py`.
@z

@x
    The second difference is that the `docker compose run` command does not create any of the ports specified in the
    service configuration. This prevents port collisions with already-open ports. If you do want the service’s ports
    to be created and mapped to the host, specify the `--service-ports`
@y
    The second difference is that the `docker compose run` command does not create any of the ports specified in the
    service configuration. This prevents port collisions with already-open ports. If you do want the service’s ports
    to be created and mapped to the host, specify the `--service-ports`
@z

% snip command...

@x
    Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using docker run:
@y
    Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using docker run:
@z

% snip command...

@x
    If you start a service configured with links, the run command first checks to see if the linked service is running
    and starts the service if it is stopped. Once all the linked services are running, the run executes the command you
    passed it. For example, you could run:
@y
    If you start a service configured with links, the run command first checks to see if the linked service is running
    and starts the service if it is stopped. Once all the linked services are running, the run executes the command you
    passed it. For example, you could run:
@z

% snip command...

@x
    This opens an interactive PostgreSQL shell for the linked `db` container.
@y
    This opens an interactive PostgreSQL shell for the linked `db` container.
@z

@x
    If you do not want the run command to start linked containers, use the `--no-deps` flag:
@y
    If you do not want the run command to start linked containers, use the `--no-deps` flag:
@z

% snip command...

@x
    If you want to remove the container after running while overriding the container’s restart policy, use the `--rm` flag:
@y
    If you want to remove the container after running while overriding the container’s restart policy, use the `--rm` flag:
@z

% snip command...

@x
    This runs a database upgrade script, and removes the container when finished running, even if a restart policy is
    specified in the service configuration.
@y
    This runs a database upgrade script, and removes the container when finished running, even if a restart policy is
    specified in the service configuration.
@z

@x
usage: docker compose run [OPTIONS] SERVICE [COMMAND] [ARGS...]
@y
usage: docker compose run [OPTIONS] SERVICE [COMMAND] [ARGS...]
@z

% options:

@x build
      description: Build image before starting container
@y
      description: Build image before starting container
@z

@x cap-add
      description: Add Linux capabilities
@y
      description: Add Linux capabilities
@z

@x cap-drop
      description: Drop Linux capabilities
@y
      description: Drop Linux capabilities
@z

@x detach
      description: Run container in background and print container ID
@y
      description: Run container in background and print container ID
@z

@x entrypoint
      description: Override the entrypoint of the image
@y
      description: Override the entrypoint of the image
@z

@x env
      description: Set environment variables
@y
      description: Set environment variables
@z

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: Keep STDIN open even if not attached
@z

@x label
      description: Add or override a label
@y
      description: Add or override a label
@z

@x name
      description: Assign a name to the container
@y
      description: Assign a name to the container
@z

@x no-TTY
      description: 'Disable pseudo-TTY allocation (default: auto-detected)'
@y
      description: 'Disable pseudo-TTY allocation (default: auto-detected)'
@z

@x no-deps
      description: Don't start linked services
@y
      description: Don't start linked services
@z

@x publish
      description: Publish a container's port(s) to the host
@y
      description: Publish a container's port(s) to the host
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

@x rm
      description: Automatically remove the container when it exits
@y
      description: Automatically remove the container when it exits
@z

@x service-ports
      description: |
        Run command with all service's ports enabled and mapped to the host
@y
      description: |
        Run command with all service's ports enabled and mapped to the host
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: Allocate a pseudo-TTY
@z

@x use-aliases
      description: |
        Use the service's network useAliases in the network(s) the container connects to
@y
      description: |
        Use the service's network useAliases in the network(s) the container connects to
@z

@x user
      description: Run as specified username or uid
@y
      description: Run as specified username or uid
@z

@x volume
      description: Bind mount a volume
@y
      description: Bind mount a volume
@z

@x workdir
      description: Working directory inside the container
@y
      description: Working directory inside the container
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
