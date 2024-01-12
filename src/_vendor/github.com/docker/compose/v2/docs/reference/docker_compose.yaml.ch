%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose
short: Docker Compose
long: |-
    You can use the compose subcommand, `docker compose [-f <arg>...] [options] [COMMAND] [ARGS...]`, to build and manage
    multiple services in Docker containers.
@y
command: docker compose
short: Docker Compose
long: |-
    You can use the compose subcommand, `docker compose [-f <arg>...] [options] [COMMAND] [ARGS...]`, to build and manage
    multiple services in Docker containers.
@z

@x
    ### Use `-f` to specify the name and path of one or more Compose files
    Use the `-f` flag to specify the location of a Compose configuration file.
@y
    ### Use `-f` to specify the name and path of one or more Compose files
    Use the `-f` flag to specify the location of a Compose configuration file.
@z

@x
    #### Specifying multiple Compose files
    You can supply multiple `-f` configuration files. When you supply multiple files, Compose combines them into a single
    configuration. Compose builds the configuration in the order you supply the files. Subsequent files override and add
    to their predecessors.
@y
    #### Specifying multiple Compose files
    You can supply multiple `-f` configuration files. When you supply multiple files, Compose combines them into a single
    configuration. Compose builds the configuration in the order you supply the files. Subsequent files override and add
    to their predecessors.
@z

@x
    For example, consider this command line:
@y
    For example, consider this command line:
@z

@x
    ```console
    $ docker compose -f docker-compose.yml -f docker-compose.admin.yml run backup_db
    ```
@y
    ```console
    $ docker compose -f docker-compose.yml -f docker-compose.admin.yml run backup_db
    ```
@z

@x
    The `docker-compose.yml` file might specify a `webapp` service.
@y
    The `docker-compose.yml` file might specify a `webapp` service.
@z

@x
    ```yaml
    services:
      webapp:
        image: examples/web
        ports:
          - "8000:8000"
        volumes:
          - "/data"
    ```
    If the `docker-compose.admin.yml` also specifies this same service, any matching fields override the previous file.
    New values, add to the `webapp` service configuration.
@y
    ```yaml
    services:
      webapp:
        image: examples/web
        ports:
          - "8000:8000"
        volumes:
          - "/data"
    ```
    If the `docker-compose.admin.yml` also specifies this same service, any matching fields override the previous file.
    New values, add to the `webapp` service configuration.
@z

@x
    ```yaml
    services:
      webapp:
        build: .
        environment:
          - DEBUG=1
    ```
@y
    ```yaml
    services:
      webapp:
        build: .
        environment:
          - DEBUG=1
    ```
@z

@x
    When you use multiple Compose files, all paths in the files are relative to the first configuration file specified
    with `-f`. You can use the `--project-directory` option to override this base path.
@y
    When you use multiple Compose files, all paths in the files are relative to the first configuration file specified
    with `-f`. You can use the `--project-directory` option to override this base path.
@z

@x
    Use a `-f` with `-` (dash) as the filename to read the configuration from stdin. When stdin is used all paths in the
    configuration are relative to the current working directory.
@y
    Use a `-f` with `-` (dash) as the filename to read the configuration from stdin. When stdin is used all paths in the
    configuration are relative to the current working directory.
@z

@x
    The `-f` flag is optional. If you don’t provide this flag on the command line, Compose traverses the working directory
    and its parent directories looking for a `compose.yaml` or `docker-compose.yaml` file.
@y
    The `-f` flag is optional. If you don’t provide this flag on the command line, Compose traverses the working directory
    and its parent directories looking for a `compose.yaml` or `docker-compose.yaml` file.
@z

@x
    #### Specifying a path to a single Compose file
    You can use the `-f` flag to specify a path to a Compose file that is not located in the current directory, either
    from the command line or by setting up a `COMPOSE_FILE` environment variable in your shell or in an environment file.
@y
    #### Specifying a path to a single Compose file
    You can use the `-f` flag to specify a path to a Compose file that is not located in the current directory, either
    from the command line or by setting up a `COMPOSE_FILE` environment variable in your shell or in an environment file.
@z

@x
    For an example of using the `-f` option at the command line, suppose you are running the Compose Rails sample, and
    have a `compose.yaml` file in a directory called `sandbox/rails`. You can use a command like `docker compose pull` to
    get the postgres image for the db service from anywhere by using the `-f` flag as follows:
@y
    For an example of using the `-f` option at the command line, suppose you are running the Compose Rails sample, and
    have a `compose.yaml` file in a directory called `sandbox/rails`. You can use a command like `docker compose pull` to
    get the postgres image for the db service from anywhere by using the `-f` flag as follows:
@z

@x
    ```console
    $ docker compose -f ~/sandbox/rails/compose.yaml pull db
    ```
@y
    ```console
    $ docker compose -f ~/sandbox/rails/compose.yaml pull db
    ```
@z

@x
    ### Use `-p` to specify a project name
@y
    ### Use `-p` to specify a project name
@z

@x
    Each configuration has a project name. Compose sets the project name using
    the following mechanisms, in order of precedence:
    - The `-p` command line flag
    - The `COMPOSE_PROJECT_NAME` environment variable
    - The top level `name:` variable from the config file (or the last `name:`
    from a series of config files specified using `-f`)
    - The `basename` of the project directory containing the config file (or
    containing the first config file specified using `-f`)
    - The `basename` of the current directory if no config file is specified
    Project names must contain only lowercase letters, decimal digits, dashes,
    and underscores, and must begin with a lowercase letter or decimal digit. If
    the `basename` of the project directory or current directory violates this
    constraint, you must use one of the other mechanisms.
@y
    Each configuration has a project name. Compose sets the project name using
    the following mechanisms, in order of precedence:
    - The `-p` command line flag
    - The `COMPOSE_PROJECT_NAME` environment variable
    - The top level `name:` variable from the config file (or the last `name:`
    from a series of config files specified using `-f`)
    - The `basename` of the project directory containing the config file (or
    containing the first config file specified using `-f`)
    - The `basename` of the current directory if no config file is specified
    Project names must contain only lowercase letters, decimal digits, dashes,
    and underscores, and must begin with a lowercase letter or decimal digit. If
    the `basename` of the project directory or current directory violates this
    constraint, you must use one of the other mechanisms.
@z

@x
    ```console
    $ docker compose -p my_project ps -a
    NAME                 SERVICE    STATUS     PORTS
    my_project_demo_1    demo       running
@y
    ```console
    $ docker compose -p my_project ps -a
    NAME                 SERVICE    STATUS     PORTS
    my_project_demo_1    demo       running
@z

@x
    $ docker compose -p my_project logs
    demo_1  | PING localhost (127.0.0.1): 56 data bytes
    demo_1  | 64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.095 ms
    ```
@y
    $ docker compose -p my_project logs
    demo_1  | PING localhost (127.0.0.1): 56 data bytes
    demo_1  | 64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.095 ms
    ```
@z

@x
    ### Use profiles to enable optional services
@y
    ### Use profiles to enable optional services
@z

@x
    Use `--profile` to specify one or more active profiles
    Calling `docker compose --profile frontend up` starts the services with the profile `frontend` and services
    without any specified profiles.
    You can also enable multiple profiles, e.g. with `docker compose --profile frontend --profile debug up` the profiles `frontend` and `debug` is enabled.
@y
    Use `--profile` to specify one or more active profiles
    Calling `docker compose --profile frontend up` starts the services with the profile `frontend` and services
    without any specified profiles.
    You can also enable multiple profiles, e.g. with `docker compose --profile frontend --profile debug up` the profiles `frontend` and `debug` is enabled.
@z

@x
    Profiles can also be set by `COMPOSE_PROFILES` environment variable.
@y
    Profiles can also be set by `COMPOSE_PROFILES` environment variable.
@z

@x
    ### Configuring parallelism
@y
    ### Configuring parallelism
@z

@x
    Use `--parallel` to specify the maximum level of parallelism for concurrent engine calls.
    Calling `docker compose --parallel 1 pull` pulls the pullable images defined in the Compose file
    one at a time. This can also be used to control build concurrency.
@y
    Use `--parallel` to specify the maximum level of parallelism for concurrent engine calls.
    Calling `docker compose --parallel 1 pull` pulls the pullable images defined in the Compose file
    one at a time. This can also be used to control build concurrency.
@z

@x
    Parallelism can also be set by the `COMPOSE_PARALLEL_LIMIT` environment variable.
@y
    Parallelism can also be set by the `COMPOSE_PARALLEL_LIMIT` environment variable.
@z

@x
    ### Set up environment variables
@y
    ### Set up environment variables
@z

@x
    You can set environment variables for various docker compose options, including the `-f`, `-p` and `--profiles` flags.
@y
    You can set environment variables for various docker compose options, including the `-f`, `-p` and `--profiles` flags.
@z

@x
    Setting the `COMPOSE_FILE` environment variable is equivalent to passing the `-f` flag,
    `COMPOSE_PROJECT_NAME` environment variable does the same as the `-p` flag,
    `COMPOSE_PROFILES` environment variable is equivalent to the `--profiles` flag
    and `COMPOSE_PARALLEL_LIMIT` does the same as the `--parallel` flag.
@y
    Setting the `COMPOSE_FILE` environment variable is equivalent to passing the `-f` flag,
    `COMPOSE_PROJECT_NAME` environment variable does the same as the `-p` flag,
    `COMPOSE_PROFILES` environment variable is equivalent to the `--profiles` flag
    and `COMPOSE_PARALLEL_LIMIT` does the same as the `--parallel` flag.
@z

@x
    If flags are explicitly set on the command line, the associated environment variable is ignored.
@y
    If flags are explicitly set on the command line, the associated environment variable is ignored.
@z

@x
    Setting the `COMPOSE_IGNORE_ORPHANS` environment variable to `true` stops docker compose from detecting orphaned
    containers for the project.
@y
    Setting the `COMPOSE_IGNORE_ORPHANS` environment variable to `true` stops docker compose from detecting orphaned
    containers for the project.
@z

@x
    ### Use Dry Run mode to test your command
@y
    ### Use Dry Run mode to test your command
@z

@x
    Use `--dry-run` flag to test a command without changing your application stack state.
    Dry Run mode shows you all the steps Compose applies when executing a command, for example:
    ```console
    $ docker compose --dry-run up --build -d
    [+] Pulling 1/1
     ✔ DRY-RUN MODE -  db Pulled                                                                                                                                                                                                               0.9s
    [+] Running 10/8
     ✔ DRY-RUN MODE -    build service backend                                                                                                                                                                                                 0.0s
     ✔ DRY-RUN MODE -  ==> ==> writing image dryRun-754a08ddf8bcb1cf22f310f09206dd783d42f7dd                                                                                                                                                   0.0s
     ✔ DRY-RUN MODE -  ==> ==> naming to nginx-golang-mysql-backend                                                                                                                                                                            0.0s
     ✔ DRY-RUN MODE -  Network nginx-golang-mysql_default                                    Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-db-1                                     Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-backend-1                                Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-proxy-1                                  Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-db-1                                     Healthy                                                                                                                                           0.5s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-backend-1                                Started                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-proxy-1                                  Started                                     Started
    ```
    From the example above, you can see that the first step is to pull the image defined by `db` service, then build the `backend` service.
    Next, the containers are created. The `db` service is started, and the `backend` and `proxy` wait until the `db` service is healthy before starting.
@y
    Use `--dry-run` flag to test a command without changing your application stack state.
    Dry Run mode shows you all the steps Compose applies when executing a command, for example:
    ```console
    $ docker compose --dry-run up --build -d
    [+] Pulling 1/1
     ✔ DRY-RUN MODE -  db Pulled                                                                                                                                                                                                               0.9s
    [+] Running 10/8
     ✔ DRY-RUN MODE -    build service backend                                                                                                                                                                                                 0.0s
     ✔ DRY-RUN MODE -  ==> ==> writing image dryRun-754a08ddf8bcb1cf22f310f09206dd783d42f7dd                                                                                                                                                   0.0s
     ✔ DRY-RUN MODE -  ==> ==> naming to nginx-golang-mysql-backend                                                                                                                                                                            0.0s
     ✔ DRY-RUN MODE -  Network nginx-golang-mysql_default                                    Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-db-1                                     Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-backend-1                                Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-proxy-1                                  Created                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-db-1                                     Healthy                                                                                                                                           0.5s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-backend-1                                Started                                                                                                                                           0.0s
     ✔ DRY-RUN MODE -  Container nginx-golang-mysql-proxy-1                                  Started                                     Started
    ```
    From the example above, you can see that the first step is to pull the image defined by `db` service, then build the `backend` service.
    Next, the containers are created. The `db` service is started, and the `backend` and `proxy` wait until the `db` service is healthy before starting.
@z

@x
    Dry Run mode works with almost all commands. You cannot use Dry Run mode with a command that doesn't change the state of a Compose stack such as `ps`, `ls`, `logs` for example.
usage: docker compose
pname: docker
plink: docker.yaml
cname:
    - docker compose attach
    - docker compose build
    - docker compose config
    - docker compose cp
    - docker compose create
    - docker compose down
    - docker compose events
    - docker compose exec
    - docker compose images
    - docker compose kill
    - docker compose logs
    - docker compose ls
    - docker compose pause
    - docker compose port
    - docker compose ps
    - docker compose pull
    - docker compose push
    - docker compose restart
    - docker compose rm
    - docker compose run
    - docker compose scale
    - docker compose start
    - docker compose stats
    - docker compose stop
    - docker compose top
    - docker compose unpause
    - docker compose up
    - docker compose version
    - docker compose wait
    - docker compose watch
clink:
    - docker_compose_attach.yaml
    - docker_compose_build.yaml
    - docker_compose_config.yaml
    - docker_compose_cp.yaml
    - docker_compose_create.yaml
    - docker_compose_down.yaml
    - docker_compose_events.yaml
    - docker_compose_exec.yaml
    - docker_compose_images.yaml
    - docker_compose_kill.yaml
    - docker_compose_logs.yaml
    - docker_compose_ls.yaml
    - docker_compose_pause.yaml
    - docker_compose_port.yaml
    - docker_compose_ps.yaml
    - docker_compose_pull.yaml
    - docker_compose_push.yaml
    - docker_compose_restart.yaml
    - docker_compose_rm.yaml
    - docker_compose_run.yaml
    - docker_compose_scale.yaml
    - docker_compose_start.yaml
    - docker_compose_stats.yaml
    - docker_compose_stop.yaml
    - docker_compose_top.yaml
    - docker_compose_unpause.yaml
    - docker_compose_up.yaml
    - docker_compose_version.yaml
    - docker_compose_wait.yaml
    - docker_compose_watch.yaml
options:
    - option: ansi
      value_type: string
      default_value: auto
      description: |
        Control when to print ANSI control characters ("never"|"always"|"auto")
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compatibility
      value_type: bool
      default_value: "false"
      description: Run compose in backward compatibility mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: env-file
      value_type: stringArray
      default_value: '[]'
      description: Specify an alternate environment file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Compose configuration files
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-ansi
      value_type: bool
      default_value: "false"
      description: Do not print ANSI control characters (DEPRECATED)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: parallel
      value_type: int
      default_value: "-1"
      description: Control max parallelism, -1 for unlimited
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: profile
      value_type: stringArray
      default_value: '[]'
      description: Specify a profile to enable
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: Set type of progress output (auto, tty, plain, quiet)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: project-directory
      value_type: string
      description: |-
        Specify an alternate working directory
        (default: the path of the, first specified, Compose file)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: project-name
      shorthand: p
      value_type: string
      description: Project name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Show more output
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: version
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Show the Docker Compose version information
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      value_type: string
      description: |-
        DEPRECATED! USE --project-directory INSTEAD.
        Specify an alternate working directory
        (default: the path of the, first specified, Compose file)
      deprecated: false
      hidden: true
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
    Dry Run mode works with almost all commands. You cannot use Dry Run mode with a command that doesn't change the state of a Compose stack such as `ps`, `ls`, `logs` for example.
usage: docker compose
pname: docker
plink: docker.yaml
cname:
    - docker compose attach
    - docker compose build
    - docker compose config
    - docker compose cp
    - docker compose create
    - docker compose down
    - docker compose events
    - docker compose exec
    - docker compose images
    - docker compose kill
    - docker compose logs
    - docker compose ls
    - docker compose pause
    - docker compose port
    - docker compose ps
    - docker compose pull
    - docker compose push
    - docker compose restart
    - docker compose rm
    - docker compose run
    - docker compose scale
    - docker compose start
    - docker compose stats
    - docker compose stop
    - docker compose top
    - docker compose unpause
    - docker compose up
    - docker compose version
    - docker compose wait
    - docker compose watch
clink:
    - docker_compose_attach.yaml
    - docker_compose_build.yaml
    - docker_compose_config.yaml
    - docker_compose_cp.yaml
    - docker_compose_create.yaml
    - docker_compose_down.yaml
    - docker_compose_events.yaml
    - docker_compose_exec.yaml
    - docker_compose_images.yaml
    - docker_compose_kill.yaml
    - docker_compose_logs.yaml
    - docker_compose_ls.yaml
    - docker_compose_pause.yaml
    - docker_compose_port.yaml
    - docker_compose_ps.yaml
    - docker_compose_pull.yaml
    - docker_compose_push.yaml
    - docker_compose_restart.yaml
    - docker_compose_rm.yaml
    - docker_compose_run.yaml
    - docker_compose_scale.yaml
    - docker_compose_start.yaml
    - docker_compose_stats.yaml
    - docker_compose_stop.yaml
    - docker_compose_top.yaml
    - docker_compose_unpause.yaml
    - docker_compose_up.yaml
    - docker_compose_version.yaml
    - docker_compose_wait.yaml
    - docker_compose_watch.yaml
options:
    - option: ansi
      value_type: string
      default_value: auto
      description: |
        Control when to print ANSI control characters ("never"|"always"|"auto")
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compatibility
      value_type: bool
      default_value: "false"
      description: Run compose in backward compatibility mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: env-file
      value_type: stringArray
      default_value: '[]'
      description: Specify an alternate environment file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Compose configuration files
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-ansi
      value_type: bool
      default_value: "false"
      description: Do not print ANSI control characters (DEPRECATED)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: parallel
      value_type: int
      default_value: "-1"
      description: Control max parallelism, -1 for unlimited
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: profile
      value_type: stringArray
      default_value: '[]'
      description: Specify a profile to enable
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: Set type of progress output (auto, tty, plain, quiet)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: project-directory
      value_type: string
      description: |-
        Specify an alternate working directory
        (default: the path of the, first specified, Compose file)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: project-name
      shorthand: p
      value_type: string
      description: Project name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Show more output
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: version
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Show the Docker Compose version information
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      value_type: string
      description: |-
        DEPRECATED! USE --project-directory INSTEAD.
        Specify an alternate working directory
        (default: the path of the, first specified, Compose file)
      deprecated: false
      hidden: true
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
