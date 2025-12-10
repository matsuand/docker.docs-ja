%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model stop-runner
@y
# docker model stop-runner
@z

@x
<!---MARKER_GEN_START-->
Stop Docker Model Runner (Docker Engine only)
@y
<!---MARKER_GEN_START-->
Stop Docker Model Runner (Docker Engine only)
@z

@x
### Options
@y
### Options
@z

@x
| Name       | Type   | Default | Description                 |
|:-----------|:-------|:--------|:----------------------------|
| `--models` | `bool` |         | Remove model storage volume |
@y
| Name       | Type   | Default | Description                 |
|:-----------|:-------|:--------|:----------------------------|
| `--models` | `bool` |         | Remove model storage volume |
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
This command stops the Docker Model Runner by removing the running containers, but preserves the container images on disk. Use this command when you want to temporarily stop the runner but plan to start it again later.
@y
This command stops the Docker Model Runner by removing the running containers, but preserves the container images on disk. Use this command when you want to temporarily stop the runner but plan to start it again later.
@z

@x
To completely remove the runner including images, use `docker model uninstall-runner --images` instead.
@y
To completely remove the runner including images, use `docker model uninstall-runner --images` instead.
@z
