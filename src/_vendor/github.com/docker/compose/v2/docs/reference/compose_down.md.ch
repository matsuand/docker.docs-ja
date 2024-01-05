%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose down
@y
# docker compose down
@z

@x
<!---MARKER_GEN_START-->
Stop and remove containers, networks
@y
<!---MARKER_GEN_START-->
Stop and remove containers, networks
@z

@x
### Options
@y
### Options
@z

@x
| Name               | Type     | Default | Description                                                                                                              |
|:-------------------|:---------|:--------|:-------------------------------------------------------------------------------------------------------------------------|
| `--dry-run`        |          |         | Execute command in dry run mode                                                                                          |
| `--remove-orphans` |          |         | Remove containers for services not defined in the Compose file.                                                          |
| `--rmi`            | `string` |         | Remove images used by services. "local" remove only images that don't have a custom tag ("local"\|"all")                 |
| `-t`, `--timeout`  | `int`    | `0`     | Specify a shutdown timeout in seconds                                                                                    |
| `-v`, `--volumes`  |          |         | Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers. |
@y
| Name               | Type     | Default | Description                                                                                                              |
|:-------------------|:---------|:--------|:-------------------------------------------------------------------------------------------------------------------------|
| `--dry-run`        |          |         | Execute command in dry run mode                                                                                          |
| `--remove-orphans` |          |         | Remove containers for services not defined in the Compose file.                                                          |
| `--rmi`            | `string` |         | Remove images used by services. "local" remove only images that don't have a custom tag ("local"\|"all")                 |
| `-t`, `--timeout`  | `int`    | `0`     | Specify a shutdown timeout in seconds                                                                                    |
| `-v`, `--volumes`  |          |         | Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers. |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
Stops containers and removes containers, networks, volumes, and images created by `up`.
@y
Stops containers and removes containers, networks, volumes, and images created by `up`.
@z

@x
By default, the only things removed are:
@y
By default, the only things removed are:
@z

@x
- Containers for services defined in the Compose file.
- Networks defined in the networks section of the Compose file.
- The default network, if one is used.
@y
- Containers for services defined in the Compose file.
- Networks defined in the networks section of the Compose file.
- The default network, if one is used.
@z

@x
Networks and volumes defined as external are never removed.
@y
Networks and volumes defined as external are never removed.
@z

@x
Anonymous volumes are not removed by default. However, as they don’t have a stable name, they are not automatically
mounted by a subsequent `up`. For data that needs to persist between updates, use explicit paths as bind mounts or
named volumes.
@y
Anonymous volumes are not removed by default. However, as they don’t have a stable name, they are not automatically
mounted by a subsequent `up`. For data that needs to persist between updates, use explicit paths as bind mounts or
named volumes.
@z
