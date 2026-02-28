%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker rmi
aliases: docker image rm, docker image remove, docker rmi
short: Remove one or more images
long: Remove one or more images
usage: docker rmi [OPTIONS] IMAGE [IMAGE...]
@y
command: docker rmi
aliases: docker image rm, docker image remove, docker rmi
short: Remove one or more images
long: Remove one or more images
usage: docker rmi [OPTIONS] IMAGE [IMAGE...]
@z

% options:

@x force
      description: Force removal of the image
@y
      description: Force removal of the image
@z

@x no-prune
      description: Do not delete untagged parents
@y
      description: Do not delete untagged parents
@z

@x platform
      description: |
        Remove only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
      description: |
        Remove only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
