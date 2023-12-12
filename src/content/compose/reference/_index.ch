%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Overview of the Docker Compose CLI
keywords: fig, composition, compose, docker, orchestration, cli, reference, docker-compose
title: Overview of docker compose CLI
aliases:
- /compose/reference/overview/
---
@y
---
description: Overview of the Docker Compose CLI
keywords: fig, composition, compose, docker, orchestration, cli, reference, docker-compose
title: Overview of docker compose CLI
aliases:
- /compose/reference/overview/
---
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
This page provides usage information for the `docker compose` command.
@y
This page provides usage information for the `docker compose` command.
@z

@x
## Command options overview and help
@y
## Command options overview and help
@z

@x
You can also see this information by running `docker compose --help` from the
command line.
@y
You can also see this information by running `docker compose --help` from the
command line.
@z

@x
```none
Usage:  docker compose [OPTIONS] COMMAND
@y
```none
Usage:  docker compose [OPTIONS] COMMAND
@z

@x
Define and run multi-container applications with Docker.
@y
Define and run multi-container applications with Docker.
@z

@x
Options:
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first specified, Compose file)
  -p, --project-name string        Project name
@y
Options:
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first specified, Compose file)
  -p, --project-name string        Project name
@z

@x
Commands:
  build       Build or rebuild services
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  images      List images used by the created containers
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
@y
Commands:
  build       Build or rebuild services
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  images      List images used by the created containers
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
@z

@x
Run 'docker compose COMMAND --help' for more information on a command.
```
@y
Run 'docker compose COMMAND --help' for more information on a command.
```
@z

@x
You can use Docker Compose binary, `docker compose [-f <arg>...] [options]
[COMMAND] [ARGS...]`, to build and manage multiple services in Docker containers.
@y
You can use Docker Compose binary, `docker compose [-f <arg>...] [options]
[COMMAND] [ARGS...]`, to build and manage multiple services in Docker containers.
@z

@x
## Use `-f` to specify name and path of one or more Compose files
@y
## Use `-f` to specify name and path of one or more Compose files
@z

@x
Use the `-f` flag to specify the location of a Compose configuration file.
@y
Use the `-f` flag to specify the location of a Compose configuration file.
@z

@x
### Specifying multiple Compose files
@y
### Specifying multiple Compose files
@z

@x
You can supply multiple `-f` configuration files. When you supply multiple
files, Compose combines them into a single configuration. Compose builds the
configuration in the order you supply the files. Subsequent files override and
add to their predecessors.
@y
You can supply multiple `-f` configuration files. When you supply multiple
files, Compose combines them into a single configuration. Compose builds the
configuration in the order you supply the files. Subsequent files override and
add to their predecessors.
@z

@x
For example, consider this command line:
@y
For example, consider this command line:
@z

@x
```console
$ docker compose -f compose.yml -f compose.admin.yml run backup_db
```
@y
```console
$ docker compose -f compose.yml -f compose.admin.yml run backup_db
```
@z

@x
The `compose.yml` file might specify a `webapp` service.
@y
The `compose.yml` file might specify a `webapp` service.
@z

@x
```yaml
webapp:
  image: examples/web
  ports:
    - "8000:8000"
  volumes:
    - "/data"
```
@y
```yaml
webapp:
  image: examples/web
  ports:
    - "8000:8000"
  volumes:
    - "/data"
```
@z

@x
If the `compose.admin.yml` also specifies this same service, any matching
fields override the previous file. New values, add to the `webapp` service
configuration.
@y
If the `compose.admin.yml` also specifies this same service, any matching
fields override the previous file. New values, add to the `webapp` service
configuration.
@z

@x
```yaml
webapp:
  build: .
  environment:
    - DEBUG=1
```
@y
```yaml
webapp:
  build: .
  environment:
    - DEBUG=1
```
@z

@x
When you use multiple Compose files, all paths in the files are relative to the
first configuration file specified with `-f`. You can use the
`--project-directory` option to override this base path.
@y
When you use multiple Compose files, all paths in the files are relative to the
first configuration file specified with `-f`. You can use the
`--project-directory` option to override this base path.
@z

@x
Use a `-f` with `-` (dash) as the filename to read the configuration from
`stdin`. When `stdin` is used all paths in the configuration are
relative to the current working directory.
@y
Use a `-f` with `-` (dash) as the filename to read the configuration from
`stdin`. When `stdin` is used all paths in the configuration are
relative to the current working directory.
@z

@x
The `-f` flag is optional. If you don't provide this flag on the command line,
Compose traverses the working directory and its parent directories looking for a
`compose.yml` and a `compose.override.yml` file. You must supply
at least the `compose.yml` file. If both files are present on the same
directory level, Compose combines the two files into a single configuration.
@y
The `-f` flag is optional. If you don't provide this flag on the command line,
Compose traverses the working directory and its parent directories looking for a
`compose.yml` and a `compose.override.yml` file. You must supply
at least the `compose.yml` file. If both files are present on the same
directory level, Compose combines the two files into a single configuration.
@z

@x
The configuration in the `compose.override.yml` file is applied over and
in addition to the values in the `compose.yml` file.
@y
The configuration in the `compose.override.yml` file is applied over and
in addition to the values in the `compose.yml` file.
@z

@x
### Specifying a path to a single Compose file
@y
### Specifying a path to a single Compose file
@z

@x
You can use the `-f` flag to specify a path to a Compose file that is not
located in the current directory, either from the command line or by setting up
a [COMPOSE_FILE environment variable](../environment-variables/envvars.md#compose_file) in your shell or
in an environment file.
@y
You can use the `-f` flag to specify a path to a Compose file that is not
located in the current directory, either from the command line or by setting up
a [COMPOSE_FILE environment variable](../environment-variables/envvars.md#compose_file) in your shell or
in an environment file.
@z

@x
For an example of using the `-f` option at the command line, suppose you are
running the [Compose Rails sample](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/README.md), and
have a `compose.yml` file in a directory called `sandbox/rails`. You can
use a command like [docker compose pull](../../engine/reference/commandline/compose_pull.md) to get the
postgres image for the `db` service from anywhere by using the `-f` flag as
follows: `docker compose -f ~/sandbox/rails/compose.yml pull db`
@y
For an example of using the `-f` option at the command line, suppose you are
running the [Compose Rails sample](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/README.md), and
have a `compose.yml` file in a directory called `sandbox/rails`. You can
use a command like [docker compose pull](../../engine/reference/commandline/compose_pull.md) to get the
postgres image for the `db` service from anywhere by using the `-f` flag as
follows: `docker compose -f ~/sandbox/rails/compose.yml pull db`
@z

@x
Here's the full example:
@y
Here's the full example:
@z

@x
```console
$ docker compose -f ~/sandbox/rails/compose.yml pull db
Pulling db (postgres:latest)...
latest: Pulling from library/postgres
ef0380f84d05: Pull complete
50cf91dc1db8: Pull complete
d3add4cd115c: Pull complete
467830d8a616: Pull complete
089b9db7dc57: Pull complete
6fba0a36935c: Pull complete
81ef0e73c953: Pull complete
338a6c4894dc: Pull complete
15853f32f67c: Pull complete
044c83d92898: Pull complete
17301519f133: Pull complete
dcca70822752: Pull complete
cecf11b8ccf3: Pull complete
Digest: sha256:1364924c753d5ff7e2260cd34dc4ba05ebd40ee8193391220be0f9901d4e1651
Status: Downloaded newer image for postgres:latest
```
@y
```console
$ docker compose -f ~/sandbox/rails/compose.yml pull db
Pulling db (postgres:latest)...
latest: Pulling from library/postgres
ef0380f84d05: Pull complete
50cf91dc1db8: Pull complete
d3add4cd115c: Pull complete
467830d8a616: Pull complete
089b9db7dc57: Pull complete
6fba0a36935c: Pull complete
81ef0e73c953: Pull complete
338a6c4894dc: Pull complete
15853f32f67c: Pull complete
044c83d92898: Pull complete
17301519f133: Pull complete
dcca70822752: Pull complete
cecf11b8ccf3: Pull complete
Digest: sha256:1364924c753d5ff7e2260cd34dc4ba05ebd40ee8193391220be0f9901d4e1651
Status: Downloaded newer image for postgres:latest
```
@z

@x
## Use `-p` to specify a project name
@y
## Use `-p` to specify a project name
@z

@x
Each configuration has a project name which Compose can set in different ways. The level of precedence (from highest to lowest) for each method is as follows: 
@y
Each configuration has a project name which Compose can set in different ways. The level of precedence (from highest to lowest) for each method is as follows: 
@z

@x
1. The `-p` command line flag 
2. The [COMPOSE_PROJECT_NAME environment variable][]
3. The top level `name:` variable from the config file (or the last `name:` from
  a series of config files specified using `-f`)
4. The `basename` of the project directory containing the config file (or
  containing the first config file specified using `-f`)
5. The `basename` of the current directory if no config file is specified
@y
1. The `-p` command line flag 
2. The [COMPOSE_PROJECT_NAME environment variable][]
3. The top level `name:` variable from the config file (or the last `name:` from
  a series of config files specified using `-f`)
4. The `basename` of the project directory containing the config file (or
  containing the first config file specified using `-f`)
5. The `basename` of the current directory if no config file is specified
@z

@x
[COMPOSE_PROJECT_NAME environment variable]: ../environment-variables/envvars.md#compose_project_name
@y
[COMPOSE_PROJECT_NAME environment variable]: ../environment-variables/envvars.md#compose_project_name
@z

@x
Project names must contain only lowercase letters, decimal digits, dashes, and
underscores, and must begin with a lowercase letter or decimal digit. If the
`basename` of the project directory or current directory violates this
constraint, you must use one of the other mechanisms.
@y
Project names must contain only lowercase letters, decimal digits, dashes, and
underscores, and must begin with a lowercase letter or decimal digit. If the
`basename` of the project directory or current directory violates this
constraint, you must use one of the other mechanisms.
@z

@x
## Use `--profile` to specify one or more active profiles
@y
## Use `--profile` to specify one or more active profiles
@z

@x
Calling `docker compose --profile frontend up` will start the services with the
profile `frontend` and services without specified profiles. You can also enable
multiple profiles, e.g. with `docker compose --profile frontend --profile debug up`
the profiles `frontend` and `debug` will be enabled.
@y
Calling `docker compose --profile frontend up` will start the services with the
profile `frontend` and services without specified profiles. You can also enable
multiple profiles, e.g. with `docker compose --profile frontend --profile debug up`
the profiles `frontend` and `debug` will be enabled.
@z

@x
See also [_Using profiles with Compose_](../profiles.md) and the
[`COMPOSE_PROFILES` environment variable](../environment-variables/envvars.md#compose_profiles).
@y
See also [_Using profiles with Compose_](../profiles.md) and the
[`COMPOSE_PROFILES` environment variable](../environment-variables/envvars.md#compose_profiles).
@z

@x
## Set up environment variables
@y
## Set up environment variables
@z

@x
You can set [environment variables](../environment-variables/envvars.md) for various
`docker compose` options, including the `-f` and `-p` flags.
@y
You can set [environment variables](../environment-variables/envvars.md) for various
`docker compose` options, including the `-f` and `-p` flags.
@z

@x
For example, the [COMPOSE_FILE environment variable](../environment-variables/envvars.md#compose_file)
relates to the `-f` flag, and `COMPOSE_PROJECT_NAME`
[environment variable](../environment-variables/envvars.md#compose_project_name) relates to the `-p` flag.
@y
For example, the [COMPOSE_FILE environment variable](../environment-variables/envvars.md#compose_file)
relates to the `-f` flag, and `COMPOSE_PROJECT_NAME`
[environment variable](../environment-variables/envvars.md#compose_project_name) relates to the `-p` flag.
@z

@x
Also, you can set some of these variables in an [environment file](../environment-variables/env-file.md).
@y
Also, you can set some of these variables in an [environment file](../environment-variables/env-file.md).
@z

@x
## Where to go next
@y
## Where to go next
@z

@x
* [CLI environment variables](../environment-variables/envvars.md)
* [Declare default environment variables in file](../environment-variables/env-file.md)
@y
* [CLI environment variables](../environment-variables/envvars.md)
* [Declare default environment variables in file](../environment-variables/env-file.md)
@z
