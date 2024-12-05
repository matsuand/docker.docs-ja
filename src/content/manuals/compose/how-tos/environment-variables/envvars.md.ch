%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Compose pre-defined environment variables
keywords: fig, composition, compose, docker, orchestration, cli, reference
title: Set or change pre-defined environment variables in Docker Compose
linkTitle: Pre-defined environment variables
@y
description: Compose pre-defined environment variables
keywords: fig, composition, compose, docker, orchestration, cli, reference
title: Set or change pre-defined environment variables in Docker Compose
linkTitle: Pre-defined environment variables
@z

@x
Compose already comes with pre-defined environment variables. It also inherits common Docker CLI environment variables, such as `DOCKER_HOST` and `DOCKER_CONTEXT`. See [Docker CLI environment variable reference](/reference/cli/docker/#environment-variables) for details.
@y
Compose already comes with pre-defined environment variables. It also inherits common Docker CLI environment variables, such as `DOCKER_HOST` and `DOCKER_CONTEXT`. See [Docker CLI environment variable reference](__SUBDIR__/reference/cli/docker/#environment-variables) for details.
@z

@x
This page contains information on how you can set or change the following pre-defined environment variables if you need to:
@y
This page contains information on how you can set or change the following pre-defined environment variables if you need to:
@z

@x
- `COMPOSE_PROJECT_NAME`
- `COMPOSE_FILE`
- `COMPOSE_PROFILES`
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_PATH_SEPARATOR`
- `COMPOSE_IGNORE_ORPHANS`
- `COMPOSE_REMOVE_ORPHANS`
- `COMPOSE_PARALLEL_LIMIT`
- `COMPOSE_ANSI`
- `COMPOSE_STATUS_STDOUT`
- `COMPOSE_ENV_FILES`
- `COMPOSE_MENU`
- `COMPOSE_EXPERIMENTAL`
@y
- `COMPOSE_PROJECT_NAME`
- `COMPOSE_FILE`
- `COMPOSE_PROFILES`
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_PATH_SEPARATOR`
- `COMPOSE_IGNORE_ORPHANS`
- `COMPOSE_REMOVE_ORPHANS`
- `COMPOSE_PARALLEL_LIMIT`
- `COMPOSE_ANSI`
- `COMPOSE_STATUS_STDOUT`
- `COMPOSE_ENV_FILES`
- `COMPOSE_MENU`
- `COMPOSE_EXPERIMENTAL`
@z

@x
## Methods to override 
@y
## Methods to override 
@z

@x
You can set or change the pre-defined environment variables:
- With an [`.env` file located in your working director](/manuals/compose/how-tos/environment-variables/variable-interpolation.md) 
- From the command line
- From your [shell](variable-interpolation.md#substitute-from-the-shell)
@y
You can set or change the pre-defined environment variables:
- With an [`.env` file located in your working director](manuals/compose/how-tos/environment-variables/variable-interpolation.md) 
- From the command line
- From your [shell](variable-interpolation.md#substitute-from-the-shell)
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
See also the [command-line options overview](/reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-p` to specify a project name](/reference/cli/docker/compose/_index.md#use--p-to-specify-a-project-name).
@y
See also the [command-line options overview](reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-p` to specify a project name](reference/cli/docker/compose/_index.md#use--p-to-specify-a-project-name).
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
- Default behavior: If not provided, Compose looks for a file named `compose.yaml` in the current directory and, if not found, then Compose searches each parent directory recursively until a file by that name is found.
- When specifying multiple Compose files, the path separators are, by default, on:
   - Mac and Linux: `:` (colon)
   - Windows: `;` (semicolon)
   For example:
@y
- Default behavior: If not provided, Compose looks for a file named `compose.yaml` in the current directory and, if not found, then Compose searches each parent directory recursively until a file by that name is found.
- When specifying multiple Compose files, the path separators are, by default, on:
   - Mac and Linux: `:` (colon)
   - Windows: `;` (semicolon)
   For example:
@z

% snip code...

@x
   The path separator can also be customized using [`COMPOSE_PATH_SEPARATOR`](#compose_path_separator).  
@y
   The path separator can also be customized using [`COMPOSE_PATH_SEPARATOR`](#compose_path_separator).  
@z

@x
See also the [command-line options overview](/reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-f` to specify name and path of one or more Compose files](/reference/cli/docker/compose/_index.md#use--f-to-specify-name-and-path-of-one-or-more-compose-files).
@y
See also the [command-line options overview](reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-f` to specify name and path of one or more Compose files](reference/cli/docker/compose/_index.md#use--f-to-specify-name-and-path-of-one-or-more-compose-files).
@z

@x
### COMPOSE\_PROFILES
@y
### COMPOSE\_PROFILES
@z

@x
Specifies one or more profiles to be enabled when `docker compose up` is run.
@y
Specifies one or more profiles to be enabled when `docker compose up` is run.
@z

@x
Services with matching profiles are started as well as any services for which no profile has been defined.
@y
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
If specifying multiple profiles, use a comma as a separator.
@y
If specifying multiple profiles, use a comma as a separator.
@z

@x
This following example enables all services matching both the `frontend` and `debug` profiles and services without a profile. 
@y
This following example enables all services matching both the `frontend` and `debug` profiles and services without a profile. 
@z

% snip code...

@x
See also [Using profiles with Compose](../profiles.md) and the [`--profile` command-line option](/reference/cli/docker/compose/_index.md#use---profile-to-specify-one-or-more-active-profiles).
@y
See also [Using profiles with Compose](../profiles.md) and the [`--profile` command-line option](reference/cli/docker/compose/_index.md#use---profile-to-specify-one-or-more-active-profiles).
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
- Supported values: 
    - `true` or `1`, to enable
    - `false` or `0`, to disable
- Defaults to: `0`
@y
- Supported values: 
    - `true` or `1`, to enable
    - `false` or `0`, to disable
- Defaults to: `0`
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
- Defaults to:
    - On macOS and Linux to `:`
    - On Windows to`;`
@y
- Defaults to:
    - On macOS and Linux to `:`
    - On Windows to`;`
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
- Supported values: 
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `0`
@y
- Supported values: 
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `0`
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
- Supported values:
   - `auto`, Compose detects if TTY mode can be used. Otherwise, use plain text mode
   - `never`, use plain text mode
   - `always` or `0`, use TTY mode
- Defaults to: `auto`
@y
- Supported values:
   - `auto`, Compose detects if TTY mode can be used. Otherwise, use plain text mode
   - `never`, use plain text mode
   - `always` or `0`, use TTY mode
- Defaults to: `auto`
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
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `0`
@y
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `0`
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
When using multiple environment files, use a comma as a separator. For example: 
@y
When using multiple environment files, use a comma as a separator. For example: 
@z

% snip code...

@x
If `COMPOSE_ENV_FILES` is not set, and you don't provide `--env-file` in the CLI, Docker Compose uses the default behavior, which is to look for an `.env` file in the project directory.
@y
If `COMPOSE_ENV_FILES` is not set, and you don't provide `--env-file` in the CLI, Docker Compose uses the default behavior, which is to look for an `.env` file in the project directory.
@z

@x
### COMPOSE\_MENU
@y
### COMPOSE\_MENU
@z

@x
{{< introduced compose 2.26.0 "/manuals/compose/releases/release-notes.md#2260" >}}
@y
{{< introduced compose 2.26.0 "manuals/compose/releases/release-notes.md#2260" >}}
@z

@x
When enabled, Compose displays a navigation menu where you can choose to open the Compose stack in Docker Desktop, switch on [`watch` mode](../file-watch.md), or use [Docker Debug](/reference/cli/docker/debug.md).
@y
When enabled, Compose displays a navigation menu where you can choose to open the Compose stack in Docker Desktop, switch on [`watch` mode](../file-watch.md), or use [Docker Debug](reference/cli/docker/debug.md).
@z

@x
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `1` if you obtained Docker Compose through Docker Desktop, otherwise default is `0`
@y
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `1` if you obtained Docker Compose through Docker Desktop, otherwise default is `0`
@z

@x
### COMPOSE\_EXPERIMENTAL
@y
### COMPOSE\_EXPERIMENTAL
@z

@x
{{< introduced compose 2.26.0 "/manuals/compose/releases/release-notes.md#2260" >}}
@y
{{< introduced compose 2.26.0 "manuals/compose/releases/release-notes.md#2260" >}}
@z

@x
This is an opt-out variable. When turned off it deactivates the experimental features such as the navigation menu or [Synchronized file shares](/manuals/desktop/features/synchronized-file-sharing.md).
@y
This is an opt-out variable. When turned off it deactivates the experimental features such as the navigation menu or [Synchronized file shares](manuals/desktop/features/synchronized-file-sharing.md).
@z

@x
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `1`
@y
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `1`
@z

@x
## Unsupported in Compose V2
@y
## Unsupported in Compose V2
@z

@x
The following environment variables have no effect in Compose V2.
For more information, see [Migrate to Compose V2](/manuals/compose/releases/migrate.md).
@y
The following environment variables have no effect in Compose V2.
For more information, see [Migrate to Compose V2](manuals/compose/releases/migrate.md).
@z

@x
- `COMPOSE_API_VERSION`
    By default the API version is negotiated with the server. Use `DOCKER_API_VERSION`.  
    See the [Docker CLI environment variable reference](/reference/cli/docker/#environment-variables) page.
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_TLS_VERSION`
- `COMPOSE_FORCE_WINDOWS_HOST`
- `COMPOSE_INTERACTIVE_NO_CLI`
- `COMPOSE_DOCKER_CLI_BUILD`
    Use `DOCKER_BUILDKIT` to select between BuildKit and the classic builder. If `DOCKER_BUILDKIT=0` then `docker compose build` uses the classic builder to build images.
@y
- `COMPOSE_API_VERSION`
    By default the API version is negotiated with the server. Use `DOCKER_API_VERSION`.  
    See the [Docker CLI environment variable reference](__SUBDIR__/reference/cli/docker/#environment-variables) page.
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_TLS_VERSION`
- `COMPOSE_FORCE_WINDOWS_HOST`
- `COMPOSE_INTERACTIVE_NO_CLI`
- `COMPOSE_DOCKER_CLI_BUILD`
    Use `DOCKER_BUILDKIT` to select between BuildKit and the classic builder. If `DOCKER_BUILDKIT=0` then `docker compose build` uses the classic builder to build images.
@z
