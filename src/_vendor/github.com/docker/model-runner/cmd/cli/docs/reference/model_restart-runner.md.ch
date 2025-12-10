%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model restart-runner
@y
# docker model restart-runner
@z

@x
<!---MARKER_GEN_START-->
Restart Docker Model Runner (Docker Engine only)
@y
<!---MARKER_GEN_START-->
Restart Docker Model Runner (Docker Engine only)
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default     | Description                                                                                            |
|:-----------------|:---------|:------------|:-------------------------------------------------------------------------------------------------------|
| `--debug`        | `bool`   |             | Enable debug logging                                                                                   |
| `--do-not-track` | `bool`   |             | Do not track models usage in Docker Model Runner                                                       |
| `--gpu`          | `string` | `auto`      | Specify GPU support (none\|auto\|cuda\|rocm\|musa\|cann)                                               |
| `--host`         | `string` | `127.0.0.1` | Host address to bind Docker Model Runner                                                               |
| `--port`         | `uint16` | `0`         | Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode) |
@y
| Name             | Type     | Default     | Description                                                                                            |
|:-----------------|:---------|:------------|:-------------------------------------------------------------------------------------------------------|
| `--debug`        | `bool`   |             | Enable debug logging                                                                                   |
| `--do-not-track` | `bool`   |             | Do not track models usage in Docker Model Runner                                                       |
| `--gpu`          | `string` | `auto`      | Specify GPU support (none\|auto\|cuda\|rocm\|musa\|cann)                                               |
| `--host`         | `string` | `127.0.0.1` | Host address to bind Docker Model Runner                                                               |
| `--port`         | `uint16` | `0`         | Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode) |
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
This command restarts the Docker Model Runner without pulling container images. Use this command to restart the runner when you already have the required images locally.
@y
This command restarts the Docker Model Runner without pulling container images. Use this command to restart the runner when you already have the required images locally.
@z

@x
For the first-time setup or to ensure you have the latest images, use `docker model install-runner` instead.
@y
For the first-time setup or to ensure you have the latest images, use `docker model install-runner` instead.
@z
