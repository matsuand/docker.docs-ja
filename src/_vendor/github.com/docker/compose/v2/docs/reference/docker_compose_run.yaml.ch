%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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

@x
    ```console
    $ docker compose run web bash
    ```
@y
    ```console
    $ docker compose run web bash
    ```
@z

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

@x
    ```console
    $ docker compose run --service-ports web python manage.py shell
    ```
@y
    ```console
    $ docker compose run --service-ports web python manage.py shell
    ```
@z

@x
    Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using docker run:
@y
    Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using docker run:
@z

@x
    ```console
    $ docker compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
    ```
@y
    ```console
    $ docker compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
    ```
@z

@x
    If you start a service configured with links, the run command first checks to see if the linked service is running
    and starts the service if it is stopped. Once all the linked services are running, the run executes the command you
    passed it. For example, you could run:
@y
    If you start a service configured with links, the run command first checks to see if the linked service is running
    and starts the service if it is stopped. Once all the linked services are running, the run executes the command you
    passed it. For example, you could run:
@z

@x
    ```console
    $ docker compose run db psql -h db -U docker
    ```
@y
    ```console
    $ docker compose run db psql -h db -U docker
    ```
@z

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

@x
    ```console
    $ docker compose run --no-deps web python manage.py shell
    ```
@y
    ```console
    $ docker compose run --no-deps web python manage.py shell
    ```
@z

@x
    If you want to remove the container after running while overriding the container’s restart policy, use the `--rm` flag:
@y
    If you want to remove the container after running while overriding the container’s restart policy, use the `--rm` flag:
@z

@x
    ```console
    $ docker compose run --rm web python manage.py db upgrade
    ```
@y
    ```console
    $ docker compose run --rm web python manage.py db upgrade
    ```
@z

@x
    This runs a database upgrade script, and removes the container when finished running, even if a restart policy is
    specified in the service configuration.
usage: docker compose run [OPTIONS] SERVICE [COMMAND] [ARGS...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: build
      value_type: bool
      default_value: "false"
      description: Build image before starting container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-add
      value_type: list
      description: Add Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-drop
      value_type: list
      description: Drop Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Run container in background and print container ID
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: entrypoint
      value_type: string
      description: Override the entrypoint of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env
      shorthand: e
      value_type: stringArray
      default_value: '[]'
      description: Set environment variables
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interactive
      shorthand: i
      value_type: bool
      default_value: "true"
      description: Keep STDIN open even if not attached
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      shorthand: l
      value_type: stringArray
      default_value: '[]'
      description: Add or override a label
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Assign a name to the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-TTY
      shorthand: T
      value_type: bool
      default_value: "true"
      description: 'Disable pseudo-TTY allocation (default: auto-detected)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-deps
      value_type: bool
      default_value: "false"
      description: Don't start linked services
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish
      shorthand: p
      value_type: stringArray
      default_value: '[]'
      description: Publish a container's port(s) to the host
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet-pull
      value_type: bool
      default_value: "false"
      description: Pull without printing progress information
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: remove-orphans
      value_type: bool
      default_value: "false"
      description: Remove containers for services not defined in the Compose file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "false"
      description: Automatically remove the container when it exits
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: service-ports
      shorthand: P
      value_type: bool
      default_value: "false"
      description: |
        Run command with all service's ports enabled and mapped to the host
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tty
      shorthand: t
      value_type: bool
      default_value: "true"
      description: Allocate a pseudo-TTY
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: use-aliases
      value_type: bool
      default_value: "false"
      description: |
        Use the service's network useAliases in the network(s) the container connects to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: user
      shorthand: u
      value_type: string
      description: Run as specified username or uid
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volume
      shorthand: v
      value_type: stringArray
      default_value: '[]'
      description: Bind mount a volume
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      shorthand: w
      value_type: string
      description: Working directory inside the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    This runs a database upgrade script, and removes the container when finished running, even if a restart policy is
    specified in the service configuration.
usage: docker compose run [OPTIONS] SERVICE [COMMAND] [ARGS...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: build
      value_type: bool
      default_value: "false"
      description: Build image before starting container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-add
      value_type: list
      description: Add Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-drop
      value_type: list
      description: Drop Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Run container in background and print container ID
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: entrypoint
      value_type: string
      description: Override the entrypoint of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env
      shorthand: e
      value_type: stringArray
      default_value: '[]'
      description: Set environment variables
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interactive
      shorthand: i
      value_type: bool
      default_value: "true"
      description: Keep STDIN open even if not attached
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      shorthand: l
      value_type: stringArray
      default_value: '[]'
      description: Add or override a label
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Assign a name to the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-TTY
      shorthand: T
      value_type: bool
      default_value: "true"
      description: 'Disable pseudo-TTY allocation (default: auto-detected)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-deps
      value_type: bool
      default_value: "false"
      description: Don't start linked services
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish
      shorthand: p
      value_type: stringArray
      default_value: '[]'
      description: Publish a container's port(s) to the host
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet-pull
      value_type: bool
      default_value: "false"
      description: Pull without printing progress information
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: remove-orphans
      value_type: bool
      default_value: "false"
      description: Remove containers for services not defined in the Compose file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "false"
      description: Automatically remove the container when it exits
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: service-ports
      shorthand: P
      value_type: bool
      default_value: "false"
      description: |
        Run command with all service's ports enabled and mapped to the host
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tty
      shorthand: t
      value_type: bool
      default_value: "true"
      description: Allocate a pseudo-TTY
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: use-aliases
      value_type: bool
      default_value: "false"
      description: |
        Use the service's network useAliases in the network(s) the container connects to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: user
      shorthand: u
      value_type: string
      description: Run as specified username or uid
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volume
      shorthand: v
      value_type: stringArray
      default_value: '[]'
      description: Bind mount a volume
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      shorthand: w
      value_type: string
      description: Working directory inside the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
