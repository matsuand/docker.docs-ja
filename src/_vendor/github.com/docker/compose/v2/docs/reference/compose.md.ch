%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose
@y
# docker compose
@z

@x
```text
docker compose [-f <arg>...] [options] [COMMAND] [ARGS...]
```
@y
```text
docker compose [-f <arg>...] [options] [COMMAND] [ARGS...]
```
@z

@x
<!---MARKER_GEN_START-->
Define and run multi-container applications with Docker
@y
<!---MARKER_GEN_START-->
Define and run multi-container applications with Docker
@z

@x
### Subcommands
@y
### Subcommands
@z

@x
| Name                            | Description                                                                             |
|:--------------------------------|:----------------------------------------------------------------------------------------|
| [`attach`](compose_attach.md)   | Attach local standard input, output, and error streams to a service's running container |
| [`build`](compose_build.md)     | Build or rebuild services                                                               |
| [`config`](compose_config.md)   | Parse, resolve and render compose file in canonical format                              |
| [`cp`](compose_cp.md)           | Copy files/folders between a service container and the local filesystem                 |
| [`create`](compose_create.md)   | Creates containers for a service                                                        |
| [`down`](compose_down.md)       | Stop and remove containers, networks                                                    |
| [`events`](compose_events.md)   | Receive real time events from containers                                                |
| [`exec`](compose_exec.md)       | Execute a command in a running container                                                |
| [`export`](compose_export.md)   | Export a service container's filesystem as a tar archive                                |
| [`images`](compose_images.md)   | List images used by the created containers                                              |
| [`kill`](compose_kill.md)       | Force stop service containers                                                           |
| [`logs`](compose_logs.md)       | View output from containers                                                             |
| [`ls`](compose_ls.md)           | List running compose projects                                                           |
| [`pause`](compose_pause.md)     | Pause services                                                                          |
| [`port`](compose_port.md)       | Print the public port for a port binding                                                |
| [`ps`](compose_ps.md)           | List containers                                                                         |
| [`pull`](compose_pull.md)       | Pull service images                                                                     |
| [`push`](compose_push.md)       | Push service images                                                                     |
| [`restart`](compose_restart.md) | Restart service containers                                                              |
| [`rm`](compose_rm.md)           | Removes stopped service containers                                                      |
| [`run`](compose_run.md)         | Run a one-off command on a service                                                      |
| [`scale`](compose_scale.md)     | Scale services                                                                          |
| [`start`](compose_start.md)     | Start services                                                                          |
| [`stats`](compose_stats.md)     | Display a live stream of container(s) resource usage statistics                         |
| [`stop`](compose_stop.md)       | Stop services                                                                           |
| [`top`](compose_top.md)         | Display the running processes                                                           |
| [`unpause`](compose_unpause.md) | Unpause services                                                                        |
| [`up`](compose_up.md)           | Create and start containers                                                             |
| [`version`](compose_version.md) | Show the Docker Compose version information                                             |
| [`wait`](compose_wait.md)       | Block until containers of all (or specified) services stop.                             |
| [`watch`](compose_watch.md)     | Watch build context for service and rebuild/refresh containers when files are updated   |
@y
| Name                            | Description                                                                             |
|:--------------------------------|:----------------------------------------------------------------------------------------|
| [`attach`](compose_attach.md)   | Attach local standard input, output, and error streams to a service's running container |
| [`build`](compose_build.md)     | Build or rebuild services                                                               |
| [`config`](compose_config.md)   | Parse, resolve and render compose file in canonical format                              |
| [`cp`](compose_cp.md)           | Copy files/folders between a service container and the local filesystem                 |
| [`create`](compose_create.md)   | Creates containers for a service                                                        |
| [`down`](compose_down.md)       | Stop and remove containers, networks                                                    |
| [`events`](compose_events.md)   | Receive real time events from containers                                                |
| [`exec`](compose_exec.md)       | Execute a command in a running container                                                |
| [`export`](compose_export.md)   | Export a service container's filesystem as a tar archive                                |
| [`images`](compose_images.md)   | List images used by the created containers                                              |
| [`kill`](compose_kill.md)       | Force stop service containers                                                           |
| [`logs`](compose_logs.md)       | View output from containers                                                             |
| [`ls`](compose_ls.md)           | List running compose projects                                                           |
| [`pause`](compose_pause.md)     | Pause services                                                                          |
| [`port`](compose_port.md)       | Print the public port for a port binding                                                |
| [`ps`](compose_ps.md)           | List containers                                                                         |
| [`pull`](compose_pull.md)       | Pull service images                                                                     |
| [`push`](compose_push.md)       | Push service images                                                                     |
| [`restart`](compose_restart.md) | Restart service containers                                                              |
| [`rm`](compose_rm.md)           | Removes stopped service containers                                                      |
| [`run`](compose_run.md)         | Run a one-off command on a service                                                      |
| [`scale`](compose_scale.md)     | Scale services                                                                          |
| [`start`](compose_start.md)     | Start services                                                                          |
| [`stats`](compose_stats.md)     | Display a live stream of container(s) resource usage statistics                         |
| [`stop`](compose_stop.md)       | Stop services                                                                           |
| [`top`](compose_top.md)         | Display the running processes                                                           |
| [`unpause`](compose_unpause.md) | Unpause services                                                                        |
| [`up`](compose_up.md)           | Create and start containers                                                             |
| [`version`](compose_version.md) | Show the Docker Compose version information                                             |
| [`wait`](compose_wait.md)       | Block until containers of all (or specified) services stop.                             |
| [`watch`](compose_watch.md)     | Watch build context for service and rebuild/refresh containers when files are updated   |
@z

@x
### Options
@y
### Options
@z

@x
| Name                   | Type          | Default | Description                                                                                         |
|:-----------------------|:--------------|:--------|:----------------------------------------------------------------------------------------------------|
| `--all-resources`      | `bool`        |         | Include all resources, even those not used by services                                              |
| `--ansi`               | `string`      | `auto`  | Control when to print ANSI control characters ("never"\|"always"\|"auto")                           |
| `--compatibility`      | `bool`        |         | Run compose in backward compatibility mode                                                          |
| `--dry-run`            | `bool`        |         | Execute command in dry run mode                                                                     |
| `--env-file`           | `stringArray` |         | Specify an alternate environment file                                                               |
| `-f`, `--file`         | `stringArray` |         | Compose configuration files                                                                         |
| `--parallel`           | `int`         | `-1`    | Control max parallelism, -1 for unlimited                                                           |
| `--profile`            | `stringArray` |         | Specify a profile to enable                                                                         |
| `--progress`           | `string`      | `auto`  | Set type of progress output (auto, tty, plain, json, quiet)                                         |
| `--project-directory`  | `string`      |         | Specify an alternate working directory<br>(default: the path of the, first specified, Compose file) |
| `-p`, `--project-name` | `string`      |         | Project name                                                                                        |
@y
| Name                   | Type          | Default | Description                                                                                         |
|:-----------------------|:--------------|:--------|:----------------------------------------------------------------------------------------------------|
| `--all-resources`      | `bool`        |         | Include all resources, even those not used by services                                              |
| `--ansi`               | `string`      | `auto`  | Control when to print ANSI control characters ("never"\|"always"\|"auto")                           |
| `--compatibility`      | `bool`        |         | Run compose in backward compatibility mode                                                          |
| `--dry-run`            | `bool`        |         | Execute command in dry run mode                                                                     |
| `--env-file`           | `stringArray` |         | Specify an alternate environment file                                                               |
| `-f`, `--file`         | `stringArray` |         | Compose configuration files                                                                         |
| `--parallel`           | `int`         | `-1`    | Control max parallelism, -1 for unlimited                                                           |
| `--profile`            | `stringArray` |         | Specify a profile to enable                                                                         |
| `--progress`           | `string`      | `auto`  | Set type of progress output (auto, tty, plain, json, quiet)                                         |
| `--project-directory`  | `string`      |         | Specify an alternate working directory<br>(default: the path of the, first specified, Compose file) |
| `-p`, `--project-name` | `string`      |         | Project name                                                                                        |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Examples
@y
## Examples
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
Setting the `COMPOSE_MENU` environment variable to `false` disables the helper menu when running `docker compose up`
in attached mode. Alternatively, you can also run `docker compose up --menu=false` to disable the helper menu.
@y
Setting the `COMPOSE_MENU` environment variable to `false` disables the helper menu when running `docker compose up`
in attached mode. Alternatively, you can also run `docker compose up --menu=false` to disable the helper menu.
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
@y
Dry Run mode works with almost all commands. You cannot use Dry Run mode with a command that doesn't change the state of a Compose stack such as `ps`, `ls`, `logs` for example.  
@z
