%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model stop-runner
short: Stop Docker Model Runner (Docker Engine only)
long: |-
    This command stops the Docker Model Runner by removing the running containers, but preserves the container images on disk. Use this command when you want to temporarily stop the runner but plan to start it again later.

    To completely remove the runner including images, use `docker model uninstall-runner --images` instead.
@y
command: docker model stop-runner
short: Stop Docker Model Runner (Docker Engine only)
long: |-
    This command stops the Docker Model Runner by removing the running containers, but preserves the container images on disk. Use this command when you want to temporarily stop the runner but plan to start it again later.

    To completely remove the runner including images, use `docker model uninstall-runner --images` instead.
@z

@x
usage: docker model stop-runner
@y
usage: docker model stop-runner
@z

% options:

@x models
      description: Remove model storage volume
@y
      description: Remove model storage volume
@z

% snip directives...
