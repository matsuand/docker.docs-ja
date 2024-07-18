%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose create
@y
# docker compose create
@z

@x
<!---MARKER_GEN_START-->
Creates containers for a service
@y
<!---MARKER_GEN_START-->
Creates containers for a service
@z

@x
### Options
@y
### Options
@z

@x
| Name               | Type          | Default  | Description                                                                                   |
|:-------------------|:--------------|:---------|:----------------------------------------------------------------------------------------------|
| `--build`          | `bool`        |          | Build images before starting containers                                                       |
| `--dry-run`        | `bool`        |          | Execute command in dry run mode                                                               |
| `--force-recreate` | `bool`        |          | Recreate containers even if their configuration and image haven't changed                     |
| `--no-build`       | `bool`        |          | Don't build an image, even if it's policy                                                     |
| `--no-recreate`    | `bool`        |          | If containers already exist, don't recreate them. Incompatible with --force-recreate.         |
| `--pull`           | `string`      | `policy` | Pull image before running ("always"\|"missing"\|"never"\|"build")                             |
| `--quiet-pull`     | `bool`        |          | Pull without printing progress information                                                    |
| `--remove-orphans` | `bool`        |          | Remove containers for services not defined in the Compose file                                |
| `--scale`          | `stringArray` |          | Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present. |
@y
| Name               | Type          | Default  | Description                                                                                   |
|:-------------------|:--------------|:---------|:----------------------------------------------------------------------------------------------|
| `--build`          | `bool`        |          | Build images before starting containers                                                       |
| `--dry-run`        | `bool`        |          | Execute command in dry run mode                                                               |
| `--force-recreate` | `bool`        |          | Recreate containers even if their configuration and image haven't changed                     |
| `--no-build`       | `bool`        |          | Don't build an image, even if it's policy                                                     |
| `--no-recreate`    | `bool`        |          | If containers already exist, don't recreate them. Incompatible with --force-recreate.         |
| `--pull`           | `string`      | `policy` | Pull image before running ("always"\|"missing"\|"never"\|"build")                             |
| `--quiet-pull`     | `bool`        |          | Pull without printing progress information                                                    |
| `--remove-orphans` | `bool`        |          | Remove containers for services not defined in the Compose file                                |
| `--scale`          | `stringArray` |          | Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present. |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
