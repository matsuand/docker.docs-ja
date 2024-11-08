%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Set up a dev Environments
keywords: Dev Environments, share, docker dev, Docker Desktop
title: Use the docker dev CLI plugin
@y
description: Set up a dev Environments
keywords: Dev Environments, share, docker dev, Docker Desktop
title: Use the docker dev CLI plugin
@z

@x
{{< include "dev-envs-changing.md" >}}
@y
{{< include "dev-envs-changing.md" >}}
@z

@x
Use the new `docker dev` CLI plugin to get the full Dev Environments experience from the terminal in addition to the Dashboard.
@y
Use the new `docker dev` CLI plugin to get the full Dev Environments experience from the terminal in addition to the Dashboard.
@z

@x
It is available with [Docker Desktop 4.13.0 and later](/manuals/desktop/release-notes.md). 
@y
It is available with [Docker Desktop 4.13.0 and later](manuals/desktop/release-notes.md). 
@z

@x
### Usage
@y
### Usage
@z

@x
```bash
docker dev [OPTIONS] COMMAND
```
@y
```bash
docker dev [OPTIONS] COMMAND
```
@z

@x
### Commands
@y
### Commands
@z

@x
| Command              | Description                              |
|:---------------------|:-----------------------------------------|
| `check`              | Check Dev Environments                   |
| `create`             | Create a new dev environment             |
| `list`               | Lists all dev environments               |
| `logs`               | Traces logs from a dev environment       |
| `open`               | Open Dev Environment with the IDE        |
| `rm`                 | Removes a dev environment                |
| `start`              | Starts a dev environment                 |
| `stop`               | Stops a dev environment                  |
| `version`            | Shows the Docker Dev version information |
@y
| Command              | Description                              |
|:---------------------|:-----------------------------------------|
| `check`              | Check Dev Environments                   |
| `create`             | Create a new dev environment             |
| `list`               | Lists all dev environments               |
| `logs`               | Traces logs from a dev environment       |
| `open`               | Open Dev Environment with the IDE        |
| `rm`                 | Removes a dev environment                |
| `start`              | Starts a dev environment                 |
| `stop`               | Stops a dev environment                  |
| `version`            | Shows the Docker Dev version information |
@z

@x
### `docker dev check`
@y
### `docker dev check`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev check [OPTIONS]`
@y
`docker dev check [OPTIONS]`
@z

@x
#### Options
@y
#### Options
@z

@x
| Name, shorthand      | Description                         |
|:---------------------|:------------------------------------|
| `--format`,`-f`      | Format the output.                  |
@y
| Name, shorthand      | Description                         |
|:---------------------|:------------------------------------|
| `--format`,`-f`      | Format the output.                  |
@z

@x
### `docker dev create`
@y
### `docker dev create`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev create [OPTIONS] REPOSITORY_URL`
@y
`docker dev create [OPTIONS] REPOSITORY_URL`
@z

@x
#### Options
@y
#### Options
@z

@x
| Name, shorthand      | Description                                               |
|:---------------------|:----------------------------------------------------------|
| `--detach`,`-d`      | Detach creates a Dev Env without attaching to it's logs.  |
| `--open`,`-o`        | Open IDE after a successful creation                      |
@y
| Name, shorthand      | Description                                               |
|:---------------------|:----------------------------------------------------------|
| `--detach`,`-d`      | Detach creates a Dev Env without attaching to it's logs.  |
| `--open`,`-o`        | Open IDE after a successful creation                      |
@z

@x
### `docker dev list`
@y
### `docker dev list`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev list [OPTIONS]`
@y
`docker dev list [OPTIONS]`
@z

@x
#### Options
@y
#### Options
@z

@x
| Name, shorthand      | Description                   |
|:---------------------|:------------------------------|
| `--format`,`-f`      | Format the output             |
| `--quiet`,`-q`       | Only show dev environments names  |
@y
| Name, shorthand      | Description                   |
|:---------------------|:------------------------------|
| `--format`,`-f`      | Format the output             |
| `--quiet`,`-q`       | Only show dev environments names  |
@z

@x
### `docker dev logs`
@y
### `docker dev logs`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev logs [OPTIONS] DEV_ENV_NAME`
@y
`docker dev logs [OPTIONS] DEV_ENV_NAME`
@z

@x
### `docker dev open`
@y
### `docker dev open`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev open DEV_ENV_NAME CONTAINER_REF [OPTIONS]`
@y
`docker dev open DEV_ENV_NAME CONTAINER_REF [OPTIONS]`
@z

@x
#### Options
@y
#### Options
@z

@x
| Name, shorthand      | Description           |
|:---------------------|:----------------------|
| `--editor`,`-e`      | Editor.               |
@y
| Name, shorthand      | Description           |
|:---------------------|:----------------------|
| `--editor`,`-e`      | Editor.               |
@z

@x
### `docker dev rm`
@y
### `docker dev rm`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev rm DEV_ENV_NAME`
@y
`docker dev rm DEV_ENV_NAME`
@z

@x
### `docker dev start`
@y
### `docker dev start`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev start DEV_ENV_NAME`
@y
`docker dev start DEV_ENV_NAME`
@z

@x
### `docker dev stop`
@y
### `docker dev stop`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev stop DEV_ENV_NAME`
@y
`docker dev stop DEV_ENV_NAME`
@z

@x
### `docker dev version`
@y
### `docker dev version`
@z

@x
#### Usage
@y
#### Usage
@z

@x
`docker dev version [OPTIONS]`
@y
`docker dev version [OPTIONS]`
@z

@x
#### Options
@y
#### Options
@z

@x
| Name, shorthand      | Description                                   |
|:---------------------|:----------------------------------------------|
| `--format`,`-f`      | Format the output.                            |
| `--short`,`-s`       | Shows only Docker Dev's version number.       |
@y
| Name, shorthand      | Description                                   |
|:---------------------|:----------------------------------------------|
| `--format`,`-f`      | Format the output.                            |
| `--short`,`-s`       | Shows only Docker Dev's version number.       |
@z
