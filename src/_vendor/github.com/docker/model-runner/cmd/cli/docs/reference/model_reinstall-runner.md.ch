%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model reinstall-runner
@y
# docker model reinstall-runner
@z

@x
<!---MARKER_GEN_START-->
Reinstall Docker Model Runner (Docker Engine only)
@y
<!---MARKER_GEN_START-->
Reinstall Docker Model Runner (Docker Engine only)
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default     | Description                                                                                            |
|:-----------------|:---------|:------------|:-------------------------------------------------------------------------------------------------------|
| `--backend`      | `string` |             | Specify backend (llama.cpp\|vllm). Default: llama.cpp                                                  |
| `--debug`        | `bool`   |             | Enable debug logging                                                                                   |
| `--do-not-track` | `bool`   |             | Do not track models usage in Docker Model Runner                                                       |
| `--gpu`          | `string` | `auto`      | Specify GPU support (none\|auto\|cuda\|rocm\|musa\|cann)                                               |
| `--host`         | `string` | `127.0.0.1` | Host address to bind Docker Model Runner                                                               |
| `--port`         | `uint16` | `0`         | Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode) |
@y
| Name             | Type     | Default     | Description                                                                                            |
|:-----------------|:---------|:------------|:-------------------------------------------------------------------------------------------------------|
| `--backend`      | `string` |             | Specify backend (llama.cpp\|vllm). Default: llama.cpp                                                  |
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
This command removes the existing Docker Model Runner container and reinstalls it with the specified configuration. Models and images are preserved during reinstallation.
@y
This command removes the existing Docker Model Runner container and reinstalls it with the specified configuration. Models and images are preserved during reinstallation.
@z
