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
```text
Usage:  docker compose [OPTIONS] COMMAND
@y
```text
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
      --dry-run                    Execute command in dry run mode
      --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --progress string            Set type of progress output (auto, tty, plain, quiet) (default "auto")
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first specified, Compose file)
  -p, --project-name string        Project name
@y
Options:
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --dry-run                    Execute command in dry run mode
      --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --progress string            Set type of progress output (auto, tty, plain, quiet) (default "auto")
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first specified, Compose file)
  -p, --project-name string        Project name
@z

@x
Commands:
  attach      Attach local standard input, output, and error streams to a service's running container.
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
  scale       Scale services
  start       Start services
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
  wait        Block until the first service container stops
  watch       Watch build context for service and rebuild/refresh containers when files are updated
@y
Commands:
  attach      Attach local standard input, output, and error streams to a service's running container.
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
  scale       Scale services
  start       Start services
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
  wait        Block until the first service container stops
  watch       Watch build context for service and rebuild/refresh containers when files are updated
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
## Useful resources
@y
## Useful resources
@z

@x
- [How Compose works](../compose-application-model.md)
- [Try Compose](../gettingstarted.md)
- [Specify a project name](../project-name.md)
- [Using environment variables](../environment-variables/_index.md)
- [Working with multiple Compose files](../multiple-compose-files/_index.md)
- [Compose Specification](../compose-file/_index.md)
@y
- [How Compose works](../compose-application-model.md)
- [Try Compose](../gettingstarted.md)
- [Specify a project name](../project-name.md)
- [Using environment variables](../environment-variables/_index.md)
- [Working with multiple Compose files](../multiple-compose-files/_index.md)
- [Compose Specification](../compose-file/_index.md)
@z
