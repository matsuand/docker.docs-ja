%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker save
aliases: docker image save, docker save
short: Save one or more images to a tar archive (streamed to STDOUT by default)
long: Save one or more images to a tar archive (streamed to STDOUT by default)
usage: docker save [OPTIONS] IMAGE [IMAGE...]
@y
command: docker save
aliases: docker image save, docker save
short: Save one or more images to a tar archive (streamed to STDOUT by default)
long: Save one or more images to a tar archive (streamed to STDOUT by default)
usage: docker save [OPTIONS] IMAGE [IMAGE...]
@z

% options:

@x output
      description: Write to a file, instead of STDOUT
@y
      description: Write to a file, instead of STDOUT
@z

@x platform
      description: |
        Save only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
      description: |
        Save only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
