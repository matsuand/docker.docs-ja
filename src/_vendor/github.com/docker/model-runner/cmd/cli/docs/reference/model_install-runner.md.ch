%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model install-runner
@y
# docker model install-runner
@z

@x
Install Docker Model Runner (Docker Engine only)
@y
Install Docker Model Runner (Docker Engine only)
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default | Description                                                                                        |
|:-----------------|:---------|:--------|:---------------------------------------------------------------------------------------------------|
| `--do-not-track` | `bool`   |         | Do not track models usage in Docker Model Runner                                                   |
| `--gpu`          | `string` | `auto`  | Specify GPU support (none\|auto\|cuda)                                                             |
| `--port`         | `uint16` | `0`     | Docker container port for Docker Model Runner (default: 12434 for Docker CE, 12435 for Cloud mode) |
@y
| Name             | Type     | Default | Description                                                                                        |
|:-----------------|:---------|:--------|:---------------------------------------------------------------------------------------------------|
| `--do-not-track` | `bool`   |         | Do not track models usage in Docker Model Runner                                                   |
| `--gpu`          | `string` | `auto`  | Specify GPU support (none\|auto\|cuda)                                                             |
| `--port`         | `uint16` | `0`     | Docker container port for Docker Model Runner (default: 12434 for Docker CE, 12435 for Cloud mode) |
@z

@x
## Description
@y
## Description
@z

@x
 This command runs implicitly when a docker model command is executed. You can run this command explicitly to add a new configuration.
@y
 This command runs implicitly when a docker model command is executed. You can run this command explicitly to add a new configuration.
@z
