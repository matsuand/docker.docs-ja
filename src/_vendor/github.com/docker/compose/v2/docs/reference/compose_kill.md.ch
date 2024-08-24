%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose kill
@y
# docker compose kill
@z

@x
<!---MARKER_GEN_START-->
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@y
<!---MARKER_GEN_START-->
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@z

@x
```console
$ docker compose kill -s SIGINT
```
@y
```console
$ docker compose kill -s SIGINT
```
@z

@x
### Options
@y
### Options
@z

@x
| Name               | Type     | Default   | Description                                                    |
|:-------------------|:---------|:----------|:---------------------------------------------------------------|
| `--dry-run`        | `bool`   |           | Execute command in dry run mode                                |
| `--remove-orphans` | `bool`   |           | Remove containers for services not defined in the Compose file |
| `-s`, `--signal`   | `string` | `SIGKILL` | SIGNAL to send to the container                                |
@y
| Name               | Type     | Default   | Description                                                    |
|:-------------------|:---------|:----------|:---------------------------------------------------------------|
| `--dry-run`        | `bool`   |           | Execute command in dry run mode                                |
| `--remove-orphans` | `bool`   |           | Remove containers for services not defined in the Compose file |
| `-s`, `--signal`   | `string` | `SIGKILL` | SIGNAL to send to the container                                |
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
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@y
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@z

@x
```console
$ docker compose kill -s SIGINT
```
@y
```console
$ docker compose kill -s SIGINT
```
@z
