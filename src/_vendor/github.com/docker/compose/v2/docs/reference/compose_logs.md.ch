%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose logs
@y
# docker compose logs
@z

@x
<!---MARKER_GEN_START-->
View output from containers
@y
<!---MARKER_GEN_START-->
View output from containers
@z

@x
### Options
@y
### Options
@z

@x
| Name                 | Type     | Default | Description                                                                                    |
|:---------------------|:---------|:--------|:-----------------------------------------------------------------------------------------------|
| `--dry-run`          |          |         | Execute command in dry run mode                                                                |
| `-f`, `--follow`     |          |         | Follow log output                                                                              |
| `--index`            | `int`    | `0`     | index of the container if service has multiple replicas                                        |
| `--no-color`         |          |         | Produce monochrome output                                                                      |
| `--no-log-prefix`    |          |         | Don't print prefix in logs                                                                     |
| `--since`            | `string` |         | Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)    |
| `-n`, `--tail`       | `string` | `all`   | Number of lines to show from the end of the logs for each container                            |
| `-t`, `--timestamps` |          |         | Show timestamps                                                                                |
| `--until`            | `string` |         | Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes) |
@y
| Name                 | Type     | Default | Description                                                                                    |
|:---------------------|:---------|:--------|:-----------------------------------------------------------------------------------------------|
| `--dry-run`          |          |         | Execute command in dry run mode                                                                |
| `-f`, `--follow`     |          |         | Follow log output                                                                              |
| `--index`            | `int`    | `0`     | index of the container if service has multiple replicas                                        |
| `--no-color`         |          |         | Produce monochrome output                                                                      |
| `--no-log-prefix`    |          |         | Don't print prefix in logs                                                                     |
| `--since`            | `string` |         | Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)    |
| `-n`, `--tail`       | `string` | `all`   | Number of lines to show from the end of the logs for each container                            |
| `-t`, `--timestamps` |          |         | Show timestamps                                                                                |
| `--until`            | `string` |         | Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes) |
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
Displays log output from services
@y
Displays log output from services
@z
