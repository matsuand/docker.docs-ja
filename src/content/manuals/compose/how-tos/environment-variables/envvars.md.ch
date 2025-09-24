%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Compose pre-defined environment variables
keywords: fig, composition, compose, docker, orchestration, cli, reference, compose environment configuration, docker env variables
title: Configure pre-defined environment variables in Docker Compose
linkTitle: Pre-defined environment variables
@y
description: Compose pre-defined environment variables
keywords: fig, composition, compose, docker, orchestration, cli, reference, compose environment configuration, docker env variables
title: Configure pre-defined environment variables in Docker Compose
linkTitle: Pre-defined environment variables
@z

@x
Docker Compose includes several pre-defined environment variables. It also inherits common Docker CLI environment variables, such as `DOCKER_HOST` and `DOCKER_CONTEXT`. See [Docker CLI environment variable reference](/reference/cli/docker/#environment-variables) for details.
@y
Docker Compose includes several pre-defined environment variables. It also inherits common Docker CLI environment variables, such as `DOCKER_HOST` and `DOCKER_CONTEXT`. See [Docker CLI environment variable reference](/reference/cli/docker/#environment-variables) for details.
@z

@x
This page explains how to set or change the following pre-defined environment variables:
@y
This page explains how to set or change the following pre-defined environment variables:
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
- `COMPOSE_DISABLE_ENV_FILE`
- `COMPOSE_MENU`
- `COMPOSE_EXPERIMENTAL`
- `COMPOSE_PROGRESS`
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
- `COMPOSE_DISABLE_ENV_FILE`
- `COMPOSE_MENU`
- `COMPOSE_EXPERIMENTAL`
- `COMPOSE_PROGRESS`
@z

@x
## Methods to override 
@y
## Methods to override 
@z

@x
| Method      | Description                                  |
| ----------- | -------------------------------------------- |
| [`.env` file](/manuals/compose/how-tos/environment-variables/variable-interpolation.md) | Located in the working directory.            |
| [Shell](variable-interpolation.md#substitute-from-the-shell)       | Defined in the host operating system shell.  |
| CLI         | Passed with `--env` or `-e` flag at runtime. |
@y
| Method      | Description                                  |
| ----------- | -------------------------------------------- |
| [`.env` file](manuals/compose/how-tos/environment-variables/variable-interpolation.md) | Located in the working directory.            |
| [Shell](variable-interpolation.md#substitute-from-the-shell)       | Defined in the host operating system shell.  |
| CLI         | Passed with `--env` or `-e` flag at runtime. |
@z

@x
When changing or setting any environment variables, be aware of [Environment variable precedence](envvars-precedence.md).
@y
When changing or setting any environment variables, be aware of [Environment variable precedence](envvars-precedence.md).
@z

@x
## Configuration details
@y
## Configuration details
@z

@x
### Project and file configuration
@y
### Project and file configuration
@z

@x
#### COMPOSE\_PROJECT\_NAME
@y
#### COMPOSE\_PROJECT\_NAME
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
3. The top-level `name:` variable from the config file (or the last `name:` from
  a series of config files specified using `-f`)
4. The `basename` of the project directory containing the config file (or
  containing the first config file specified using `-f`)
5. The `basename` of the current directory if no config file is specified
@y
1. The `-p` command line flag 
2. `COMPOSE_PROJECT_NAME`
3. The top-level `name:` variable from the config file (or the last `name:` from
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
See also the [command-line options overview](/reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-p` to specify a project name](/reference/cli/docker/compose/_index.md#use--p-to-specify-a-project-name).
@z

@x
#### COMPOSE\_FILE
@y
#### COMPOSE\_FILE
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

@x
      ```console
      COMPOSE_FILE=compose.yaml:compose.prod.yaml
      ```  
   The path separator can also be customized using [`COMPOSE_PATH_SEPARATOR`](#compose_path_separator).  
@y
      ```console
      COMPOSE_FILE=compose.yaml:compose.prod.yaml
      ```  
   The path separator can also be customized using [`COMPOSE_PATH_SEPARATOR`](#compose_path_separator).  
@z

@x
See also the [command-line options overview](/reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-f` to specify name and path of one or more Compose files](/reference/cli/docker/compose/_index.md#use--f-to-specify-the-name-and-path-of-one-or-more-compose-files).
@y
See also the [command-line options overview](/reference/cli/docker/compose/_index.md#command-options-overview-and-help) and [using `-f` to specify name and path of one or more Compose files](/reference/cli/docker/compose/_index.md#use--f-to-specify-the-name-and-path-of-one-or-more-compose-files).
@z

@x
#### COMPOSE\_PROFILES
@y
#### COMPOSE\_PROFILES
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
For example, calling `docker compose up` with `COMPOSE_PROFILES=frontend` selects services with the 
`frontend` profile as well as any services without a profile specified.
@y
For example, calling `docker compose up` with `COMPOSE_PROFILES=frontend` selects services with the 
`frontend` profile as well as any services without a profile specified.
@z

@x
If specifying multiple profiles, use a comma as a separator.
@y
If specifying multiple profiles, use a comma as a separator.
@z

@x
The following example enables all services matching both the `frontend` and `debug` profiles and services without a profile. 
@y
The following example enables all services matching both the `frontend` and `debug` profiles and services without a profile. 
@z

@x
```console
COMPOSE_PROFILES=frontend,debug
```
@y
```console
COMPOSE_PROFILES=frontend,debug
```
@z

@x
See also [Using profiles with Compose](../profiles.md) and the [`--profile` command-line option](/reference/cli/docker/compose/_index.md#use-profiles-to-enable-optional-services).
@y
See also [Using profiles with Compose](../profiles.md) and the [`--profile` command-line option](/reference/cli/docker/compose/_index.md#use-profiles-to-enable-optional-services).
@z

@x
#### COMPOSE\_PATH\_SEPARATOR
@y
#### COMPOSE\_PATH\_SEPARATOR
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
#### COMPOSE\_ENV\_FILES
@y
#### COMPOSE\_ENV\_FILES
@z

@x
Specifies which environment files Compose should use if `--env-file` isn't used.
@y
Specifies which environment files Compose should use if `--env-file` isn't used.
@z

@x
When using multiple environment files, use a comma as a separator. For example: 
@y
When using multiple environment files, use a comma as a separator. For example: 
@z

@x
```console
COMPOSE_ENV_FILES=.env.envfile1,.env.envfile2
```
@y
```console
COMPOSE_ENV_FILES=.env.envfile1,.env.envfile2
```
@z

@x
If `COMPOSE_ENV_FILES` is not set, and you don't provide `--env-file` in the CLI, Docker Compose uses the default behavior, which is to look for an `.env` file in the project directory.
@y
If `COMPOSE_ENV_FILES` is not set, and you don't provide `--env-file` in the CLI, Docker Compose uses the default behavior, which is to look for an `.env` file in the project directory.
@z

@x
#### COMPOSE\_DISABLE\_ENV\_FILE
@y
#### COMPOSE\_DISABLE\_ENV\_FILE
@z

@x
Lets you disable the use of the default `.env` file. 
@y
Lets you disable the use of the default `.env` file. 
@z

@x
- Supported values: 
    - `true` or `1`, Compose ignores the `.env` file
    - `false` or `0`, Compose looks for an `.env` file in the project directory
- Defaults to: `0`
@y
- Supported values: 
    - `true` or `1`, Compose ignores the `.env` file
    - `false` or `0`, Compose looks for an `.env` file in the project directory
- Defaults to: `0`
@z

@x
### Environment handling and container lifecycle
@y
### Environment handling and container lifecycle
@z

@x
#### COMPOSE\_CONVERT\_WINDOWS\_PATHS
@y
#### COMPOSE\_CONVERT\_WINDOWS\_PATHS
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
#### COMPOSE\_IGNORE\_ORPHANS
@y
#### COMPOSE\_IGNORE\_ORPHANS
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
#### COMPOSE\_REMOVE\_ORPHANS
@y
#### COMPOSE\_REMOVE\_ORPHANS
@z

@x
When enabled, Compose automatically removes orphaned containers when updating a service or stack. Orphaned containers are those that were created by a previous configuration but are no longer defined in the current `compose.yaml` file.
@y
When enabled, Compose automatically removes orphaned containers when updating a service or stack. Orphaned containers are those that were created by a previous configuration but are no longer defined in the current `compose.yaml` file.
@z

@x
- Supported values:
   - `true` or `1`, to enable automatic removal of orphaned containers
   - `false` or `0`, to disable automatic removal. Compose displays a warning about orphaned containers instead.
- Defaults to: `0`
@y
- Supported values:
   - `true` or `1`, to enable automatic removal of orphaned containers
   - `false` or `0`, to disable automatic removal. Compose displays a warning about orphaned containers instead.
- Defaults to: `0`
@z

@x
#### COMPOSE\_PARALLEL\_LIMIT
@y
#### COMPOSE\_PARALLEL\_LIMIT
@z

@x
Specifies the maximum level of parallelism for concurrent engine calls.
@y
Specifies the maximum level of parallelism for concurrent engine calls.
@z

@x
### Output 
@y
### Output 
@z

@x
#### COMPOSE\_ANSI
@y
#### COMPOSE\_ANSI
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
#### COMPOSE\_STATUS\_STDOUT
@y
#### COMPOSE\_STATUS\_STDOUT
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
#### COMPOSE\_PROGRESS
@y
#### COMPOSE\_PROGRESS
@z

@x
{{< summary-bar feature_name="Compose progress" >}}
@y
{{< summary-bar feature_name="Compose progress" >}}
@z

@x
Defines the type of progress output, if `--progress` isn't used. 
@y
Defines the type of progress output, if `--progress` isn't used. 
@z

@x
Supported values are `auto`, `tty`, `plain`, `json`, and `quiet`.
Default is `auto`. 
@y
Supported values are `auto`, `tty`, `plain`, `json`, and `quiet`.
Default is `auto`. 
@z

@x
### User experience
@y
### User experience
@z

@x
#### COMPOSE\_MENU
@y
#### COMPOSE\_MENU
@z

@x
{{< summary-bar feature_name="Compose menu" >}}
@y
{{< summary-bar feature_name="Compose menu" >}}
@z

@x
When enabled, Compose displays a navigation menu where you can choose to open the Compose stack in Docker Desktop, switch on [`watch` mode](../file-watch.md), or use [Docker Debug](/reference/cli/docker/debug.md).
@y
When enabled, Compose displays a navigation menu where you can choose to open the Compose stack in Docker Desktop, switch on [`watch` mode](../file-watch.md), or use [Docker Debug](/reference/cli/docker/debug.md).
@z

@x
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `1` if you obtained Docker Compose through Docker Desktop, otherwise the default is `0`
@y
- Supported values:
   - `true` or `1`, to enable
   - `false` or `0`, to disable
- Defaults to: `1` if you obtained Docker Compose through Docker Desktop, otherwise the default is `0`
@z

@x
#### COMPOSE\_EXPERIMENTAL
@y
#### COMPOSE\_EXPERIMENTAL
@z

@x
{{< summary-bar feature_name="Compose experimental" >}}
@y
{{< summary-bar feature_name="Compose experimental" >}}
@z

@x
This is an opt-out variable. When turned off it deactivates the experimental features.
@y
This is an opt-out variable. When turned off it deactivates the experimental features.
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
For more information, see [Migrate to Compose V2](/manuals/compose/releases/migrate.md).
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
    See the [Docker CLI environment variable reference](/reference/cli/docker/#environment-variables) page.
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_TLS_VERSION`
- `COMPOSE_FORCE_WINDOWS_HOST`
- `COMPOSE_INTERACTIVE_NO_CLI`
- `COMPOSE_DOCKER_CLI_BUILD`
    Use `DOCKER_BUILDKIT` to select between BuildKit and the classic builder. If `DOCKER_BUILDKIT=0` then `docker compose build` uses the classic builder to build images.
@z
