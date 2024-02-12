%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
description: Compose pre-defined environment variables
keywords: fig, composition, compose, docker, orchestration, cli, reference
title: Set or change pre-defined environment variables in Docker Compose
aliases:
- /compose/reference/envvars/
---
@y
---
description: Compose pre-defined environment variables
keywords: fig, composition, compose, docker, orchestration, cli, reference
title: Set or change pre-defined environment variables in Docker Compose
aliases:
- /compose/reference/envvars/
---
@z

@x
Compose already comes with pre-defined environment variables. It also inherits common Docker CLI environment variables, such as `DOCKER_HOST` and `DOCKER_CONTEXT`. See [Docker CLI environment variable reference](/engine/reference/commandline/cli/#environment-variables) for details.
@y
Compose already comes with pre-defined environment variables. It also inherits common Docker CLI environment variables, such as `DOCKER_HOST` and `DOCKER_CONTEXT`. See [Docker CLI environment variable reference](__SUBDIR__/engine/reference/commandline/cli/#environment-variables) for details.
@z

@x
This page contains information on how you can set or change the following pre-defined environment variables if you need to:
@y
This page contains information on how you can set or change the following pre-defined environment variables if you need to:
@z

@x
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_FILE`
- `COMPOSE_PROFILES`
- `COMPOSE_PROJECT_NAME`
- `DOCKER_CERT_PATH`
- `COMPOSE_PARALLEL_LIMIT`
- `COMPOSE_IGNORE_ORPHANS`
- `COMPOSE_REMOVE_ORPHANS`
- `COMPOSE_PATH_SEPARATOR`
- `COMPOSE_ANSI`
- `COMPOSE_STATUS_STDOUT`
- `COMPOSE_ENV_FILES`
@y
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_FILE`
- `COMPOSE_PROFILES`
- `COMPOSE_PROJECT_NAME`
- `DOCKER_CERT_PATH`
- `COMPOSE_PARALLEL_LIMIT`
- `COMPOSE_IGNORE_ORPHANS`
- `COMPOSE_REMOVE_ORPHANS`
- `COMPOSE_PATH_SEPARATOR`
- `COMPOSE_ANSI`
- `COMPOSE_STATUS_STDOUT`
- `COMPOSE_ENV_FILES`
@z

@x
## Methods to override 
@y
## Methods to override 
@z

@x
You can set or change the pre-defined environment variables:
- Within your Compose file using the [`environment` attribute](set-environment-variables.md#use-the-environment-attribute)
- With an [environment file](env-file.md) 
- From the command line
- From your [shell](set-environment-variables.md#substitute-from-the-shell)
@y
You can set or change the pre-defined environment variables:
- Within your Compose file using the [`environment` attribute](set-environment-variables.md#use-the-environment-attribute)
- With an [environment file](env-file.md) 
- From the command line
- From your [shell](set-environment-variables.md#substitute-from-the-shell)
@z

@x
When changing or setting any environment variables, be aware of [Environment variable precedence](envvars-precedence.md).
@y
When changing or setting any environment variables, be aware of [Environment variable precedence](envvars-precedence.md).
@z

@x
## Configure
@y
## Configure
@z

@x
### COMPOSE\_PROJECT\_NAME
@y
### COMPOSE\_PROJECT\_NAME
@z

@x
Sets the project name. This value is prepended along with the service name to
the container's name on startup.
@y
Sets the project name. This value is prepended along with the service name to
the container's name on startup.
@z

@x
For example, if your project name is `myapp` and it includes two services `db` and `web`, 
then Compose starts containers named `myapp-db-1` and `myapp-web-1` respectively.
@y
For example, if your project name is `myapp` and it includes two services `db` and `web`, 
then Compose starts containers named `myapp-db-1` and `myapp-web-1` respectively.
@z

@x
Compose can set the project name in different ways. The level of precedence (from highest to lowest) for each method is as follows:
@y
Compose can set the project name in different ways. The level of precedence (from highest to lowest) for each method is as follows:
@z

@x
1. The `-p` command line flag 
2. `COMPOSE_PROJECT_NAME`
3. The top level `name:` variable from the config file (or the last `name:` from
  a series of config files specified using `-f`)
4. The `basename` of the project directory containing the config file (or
  containing the first config file specified using `-f`)
5. The `basename` of the current directory if no config file is specified
@y
1. The `-p` command line flag 
2. `COMPOSE_PROJECT_NAME`
3. The top level `name:` variable from the config file (or the last `name:` from
  a series of config files specified using `-f`)
4. The `basename` of the project directory containing the config file (or
  containing the first config file specified using `-f`)
5. The `basename` of the current directory if no config file is specified
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
See also the [command-line options overview](../reference/index.md#command-options-overview-and-help) and [using `-p` to specify a project name](../reference/index.md#use--p-to-specify-a-project-name).
@y
See also the [command-line options overview](../reference/index.md#command-options-overview-and-help) and [using `-p` to specify a project name](../reference/index.md#use--p-to-specify-a-project-name).
@z

@x
### COMPOSE\_FILE
@y
### COMPOSE\_FILE
@z

@x
Specifies the path to a Compose file. Specifying multiple Compose files is supported.
@y
Specifies the path to a Compose file. Specifying multiple Compose files is supported.
@z

@x
- Default behavior: If not provided, Compose looks for a file named `compose.yaml` or `docker-compose.yaml` in the current directory and, if not found, then Compose searches each parent directory recursively until a file by that name is found.
- Default separator: When specifying multiple Compose files, the path separators are, by default, on:
    * Mac and Linux: `:` (colon),
    * Windows: `;` (semicolon).
@y
- Default behavior: If not provided, Compose looks for a file named `compose.yaml` or `docker-compose.yaml` in the current directory and, if not found, then Compose searches each parent directory recursively until a file by that name is found.
- Default separator: When specifying multiple Compose files, the path separators are, by default, on:
    * Mac and Linux: `:` (colon),
    * Windows: `;` (semicolon).
@z

@x
The path separator can also be customized using `COMPOSE_PATH_SEPARATOR`.  
@y
The path separator can also be customized using `COMPOSE_PATH_SEPARATOR`.  
@z

@x
Example: `COMPOSE_FILE=docker-compose.yml:docker-compose.prod.yml`.  
@y
Example: `COMPOSE_FILE=docker-compose.yml:docker-compose.prod.yml`.  
@z

@x
See also the [command-line options overview](../reference/index.md#command-options-overview-and-help) and [using `-f` to specify name and path of one or more Compose files](../reference/index.md#use--f-to-specify-name-and-path-of-one-or-more-compose-files).
@y
See also the [command-line options overview](../reference/index.md#command-options-overview-and-help) and [using `-f` to specify name and path of one or more Compose files](../reference/index.md#use--f-to-specify-name-and-path-of-one-or-more-compose-files).
@z

@x
### COMPOSE\_PROFILES
@y
### COMPOSE\_PROFILES
@z

@x
Specifies one or more profiles to be enabled on `compose up` execution.
Services with matching profiles are started as well as any services for which no profile has been defined.
@y
Specifies one or more profiles to be enabled on `compose up` execution.
Services with matching profiles are started as well as any services for which no profile has been defined.
@z

@x
For example, calling `docker compose up`with `COMPOSE_PROFILES=frontend` selects services with the 
`frontend` profile as well as any services without a profile specified.
@y
For example, calling `docker compose up`with `COMPOSE_PROFILES=frontend` selects services with the 
`frontend` profile as well as any services without a profile specified.
@z

@x
* Default separator: specify a list of profiles using a comma as separator.
@y
* Default separator: specify a list of profiles using a comma as separator.
@z

@x
Example: `COMPOSE_PROFILES=frontend,debug`  
This example enables all services matching both the `frontend` and `debug` profiles and services without a profile.
@y
Example: `COMPOSE_PROFILES=frontend,debug`  
This example enables all services matching both the `frontend` and `debug` profiles and services without a profile.
@z

@x
See also [Using profiles with Compose](../profiles.md) and the [`--profile` command-line option](../reference/index.md#use---profile-to-specify-one-or-more-active-profiles).
@y
See also [Using profiles with Compose](../profiles.md) and the [`--profile` command-line option](../reference/index.md#use---profile-to-specify-one-or-more-active-profiles).
@z

@x
### COMPOSE\_CONVERT\_WINDOWS\_PATHS
@y
### COMPOSE\_CONVERT\_WINDOWS\_PATHS
@z

@x
When enabled, Compose performs path conversion from Windows-style to Unix-style in volume definitions.
@y
When enabled, Compose performs path conversion from Windows-style to Unix-style in volume definitions.
@z

@x
* Supported values: 
    * `true` or `1`, to enable,
    * `false` or `0`, to disable.
* Defaults to: `0`.
@y
* Supported values: 
    * `true` or `1`, to enable,
    * `false` or `0`, to disable.
* Defaults to: `0`.
@z

@x
### COMPOSE\_PATH\_SEPARATOR
@y
### COMPOSE\_PATH\_SEPARATOR
@z

@x
Specifies a different path separator for items listed in `COMPOSE_FILE`.
@y
Specifies a different path separator for items listed in `COMPOSE_FILE`.
@z

@x
* Defaults to:
    * On macOS and Linux to `:`,
    * On Windows to`;`.
@y
* Defaults to:
    * On macOS and Linux to `:`,
    * On Windows to`;`.
@z

@x
### COMPOSE\_IGNORE\_ORPHANS
@y
### COMPOSE\_IGNORE\_ORPHANS
@z

@x
When enabled, Compose doesn't try to detect orphaned containers for the project.
@y
When enabled, Compose doesn't try to detect orphaned containers for the project.
@z

@x
* Supported values: 
    * `true` or `1`, to enable,
    * `false` or `0`, to disable.
* Defaults to: `0`.
@y
* Supported values: 
    * `true` or `1`, to enable,
    * `false` or `0`, to disable.
* Defaults to: `0`.
@z

@x
### COMPOSE\_PARALLEL\_LIMIT
@y
### COMPOSE\_PARALLEL\_LIMIT
@z

@x
Specifies the maximum level of parallelism for concurrent engine calls.
@y
Specifies the maximum level of parallelism for concurrent engine calls.
@z

@x
### COMPOSE\_ANSI
@y
### COMPOSE\_ANSI
@z

@x
Specifies when to print ANSI control characters. 
@y
Specifies when to print ANSI control characters. 
@z

@x
* Supported values:
  * `auto`, Compose detects if TTY mode can be used. Otherwise, use plain text mode.
  * `never`, use plain text mode.
  * `always` or `0`, use TTY mode.
* Defaults to: `auto`.
@y
* Supported values:
  * `auto`, Compose detects if TTY mode can be used. Otherwise, use plain text mode.
  * `never`, use plain text mode.
  * `always` or `0`, use TTY mode.
* Defaults to: `auto`.
@z

@x
### COMPOSE\_STATUS\_STDOUT
@y
### COMPOSE\_STATUS\_STDOUT
@z

@x
When enabled, Compose writes its internal status and progress messages to `stdout` instead of `stderr`. 
The default value is false to clearly separate the output streams between Compose messages and your container's logs.
@y
When enabled, Compose writes its internal status and progress messages to `stdout` instead of `stderr`. 
The default value is false to clearly separate the output streams between Compose messages and your container's logs.
@z

@x
* Supported values:
  * `true` or `1`, to enable,
  * `false` or `0`, to disable.
* Defaults to: `0`.
@y
* Supported values:
  * `true` or `1`, to enable,
  * `false` or `0`, to disable.
* Defaults to: `0`.
@z

@x
### COMPOSE\_ENV\_FILES
@y
### COMPOSE\_ENV\_FILES
@z

@x
Lets you specify which environment files Compose should use if `--env-file` isn't used.
@y
Lets you specify which environment files Compose should use if `--env-file` isn't used.
@z

@x
When using multiple environment files, use a comma as a separator. For example, 
@y
When using multiple environment files, use a comma as a separator. For example, 
@z

@x
```console
COMPOSE_ENV_FILES=.env.envfile1, .env.envfile2
```
@y
```console
COMPOSE_ENV_FILES=.env.envfile1, .env.envfile2
```
@z

@x
If `COMPOSE_ENV_FILES` is not set, and you don't provide `--env-file` in the CLI, Docker Compose uses the default behavior, which is to look for an `.env` file in the project directory.
@y
If `COMPOSE_ENV_FILES` is not set, and you don't provide `--env-file` in the CLI, Docker Compose uses the default behavior, which is to look for an `.env` file in the project directory.
@z

@x
## Unsupported in Compose V2
@y
## Unsupported in Compose V2
@z

@x
The environment variables listed below have no effect in Compose V2.
For more information, see [Migrate to Compose V2](../migrate.md).
@y
The environment variables listed below have no effect in Compose V2.
For more information, see [Migrate to Compose V2](../migrate.md).
@z

@x
- `COMPOSE_API_VERSION`
    By default the API version is negotiated with the server. Use `DOCKER_API_VERSION`.  
    See the [Docker CLI environment variable reference](../../../engine/reference/commandline/cli/#environment-variables) page.
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_TLS_VERSION`
- `COMPOSE_FORCE_WINDOWS_HOST`
- `COMPOSE_INTERACTIVE_NO_CLI`
- `COMPOSE_DOCKER_CLI_BUILD`
    Use `DOCKER_BUILDKIT` to select between BuildKit and the classic builder. If `DOCKER_BUILDKIT=0` then `docker compose build` uses the classic builder to build images.
@y
- `COMPOSE_API_VERSION`
    By default the API version is negotiated with the server. Use `DOCKER_API_VERSION`.  
    See the [Docker CLI environment variable reference](../../../engine/reference/commandline/cli/#environment-variables) page.
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_TLS_VERSION`
- `COMPOSE_FORCE_WINDOWS_HOST`
- `COMPOSE_INTERACTIVE_NO_CLI`
- `COMPOSE_DOCKER_CLI_BUILD`
    Use `DOCKER_BUILDKIT` to select between BuildKit and the classic builder. If `DOCKER_BUILDKIT=0` then `docker compose build` uses the classic builder to build images.
@z
