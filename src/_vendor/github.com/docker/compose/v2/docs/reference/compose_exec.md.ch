%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose exec
@y
# docker compose exec
@z

@x
Execute a command in a running container
@y
Execute a command in a running container
@z

@x
### Options
@y
### オプション {#options}
@z

@x
| Name              | Type          | Default | Description                                                                      |
|:------------------|:--------------|:--------|:---------------------------------------------------------------------------------|
| `-d`, `--detach`  |               |         | Detached mode: Run command in the background                                     |
| `--dry-run`       |               |         | Execute command in dry run mode                                                  |
| `-e`, `--env`     | `stringArray` |         | Set environment variables                                                        |
| `--index`         | `int`         | `0`     | Index of the container if service has multiple replicas                          |
| `-T`, `--no-TTY`  | `bool`        | `true`  | Disable pseudo-TTY allocation. By default `docker compose exec` allocates a TTY. |
| `--privileged`    |               |         | Give extended privileges to the process                                          |
| `-u`, `--user`    | `string`      |         | Run the command as this user                                                     |
| `-w`, `--workdir` | `string`      |         | Path to workdir directory for this command                                       |
@y
| Name              | Type          | Default | Description                                                                      |
|:------------------|:--------------|:--------|:---------------------------------------------------------------------------------|
| `-d`, `--detach`  |               |         | Detached mode: Run command in the background                                     |
| `--dry-run`       |               |         | Execute command in dry run mode                                                  |
| `-e`, `--env`     | `stringArray` |         | Set environment variables                                                        |
| `--index`         | `int`         | `0`     | Index of the container if service has multiple replicas                          |
| `-T`, `--no-TTY`  | `bool`        | `true`  | Disable pseudo-TTY allocation. By default `docker compose exec` allocates a TTY. |
| `--privileged`    |               |         | Give extended privileges to the process                                          |
| `-u`, `--user`    | `string`      |         | Run the command as this user                                                     |
| `-w`, `--workdir` | `string`      |         | Path to workdir directory for this command                                       |
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
This is the equivalent of `docker exec` targeting a Compose service.
@y
This is the equivalent of `docker exec` targeting a Compose service.
@z

@x
With this subcommand, you can run arbitrary commands in your services. Commands allocate a TTY by default, so
you can use a command such as `docker compose exec web sh` to get an interactive prompt.
@y
With this subcommand, you can run arbitrary commands in your services. Commands allocate a TTY by default, so
you can use a command such as `docker compose exec web sh` to get an interactive prompt.
@z
