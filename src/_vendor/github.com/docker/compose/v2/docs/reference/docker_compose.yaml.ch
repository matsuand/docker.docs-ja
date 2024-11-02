%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose
short: Docker Compose
long: Define and run multi-container applications with Docker
@y
command: docker compose
short: Docker Compose
long: Define and run multi-container applications with Docker
@z

@x
usage: docker compose
@y
usage: docker compose
@z

% cname:
% clink:
% options:

@x ansi
      description: |
        Control when to print ANSI control characters ("never"|"always"|"auto")
@y
      description: |
        ANSI 制御文字の出力を制御します。（"never"|"always"|"auto"）
@z

@x compatibility
      description: Run compose in backward compatibility mode
@y
      description: Run compose in backward compatibility mode
@z

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

@x env-file
      description: Specify an alternate environment file
@y
      description: 別の環境ファイルを指定します。
@z

@x file
      description: Compose configuration files
@y
      description: Compose 設定ファイル。
@z

@x no-ansi
      description: Do not print ANSI control characters (DEPRECATED)
@y
      description: ANSI 制御文字は表示しません。(廃止予定)
@z

@x parallel
      description: Control max parallelism, -1 for unlimited
@y
      description: Control max parallelism, -1 for unlimited
@z

@x profile
      description: Specify a profile to enable
@y
      description: プロファイルの有効化を指定します。
@z

@x progress
      description: Set type of progress output (auto, tty, plain, json, quiet)
@y
      description: Set type of progress output (auto, tty, plain, json, quiet)
@z

@x project-directory
      description: |-
        Specify an alternate working directory
        (default: the path of the, first specified, Compose file)
@y
      description: |-
        別のワーキングディレクトリを指定します。
        （デフォルトは初めに指定された Compose ファイルのあるパス。）
@z

@x project-name
      description: Project name
@y
      description: プロジェクト名。
@z

@x verbose
      description: Show more output
@y
      description: 詳細出力を行います。
@z

@x version
      description: Show the Docker Compose version information
@y
      description: Show the Docker Compose version information
@z

@x workdir
      description: |-
        DEPRECATED! USE --project-directory INSTEAD.
        Specify an alternate working directory
        (default: the path of the, first specified, Compose file)
@y
      description: |-
        **非推奨！** 代わりに --project-directory 利用すること。
        別のワーキングディレクトリを指定します。
        （デフォルトは初めに指定された Compose ファイルのあるパス。）
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

% snip command...

@x
    The `docker-compose.yml` file might specify a `webapp` service.
@y
    The `docker-compose.yml` file might specify a `webapp` service.
@z

% snip code...

@x
    If the `docker-compose.admin.yml` also specifies this same service, any matching fields override the previous file.
    New values, add to the `webapp` service configuration.
@y
    If the `docker-compose.admin.yml` also specifies this same service, any matching fields override the previous file.
    New values, add to the `webapp` service configuration.
@z

% snip code...

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

% snip command...

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

% snip command...

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
@y
    Use `--dry-run` flag to test a command without changing your application stack state.
    Dry Run mode shows you all the steps Compose applies when executing a command, for example:
@z

% snip command...

@x
    From the example above, you can see that the first step is to pull the image defined by `db` service, then build the `backend` service.
    Next, the containers are created. The `db` service is started, and the `backend` and `proxy` wait until the `db` service is healthy before starting.
@y
    From the example above, you can see that the first step is to pull the image defined by `db` service, then build the `backend` service.
    Next, the containers are created. The `db` service is started, and the `backend` and `proxy` wait until the `db` service is healthy before starting.
@z

@x
    Dry Run mode works with almost all commands. You cannot use Dry Run mode with a command that doesn't change the state of a Compose stack such as `ps`, `ls`, `logs` for example.
@y
    Dry Run mode works with almost all commands. You cannot use Dry Run mode with a command that doesn't change the state of a Compose stack such as `ps`, `ls`, `logs` for example.
@z

% snip directives...
