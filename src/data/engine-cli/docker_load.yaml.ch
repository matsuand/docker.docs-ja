%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: Load an image from a tar archive or STDIN
usage: docker load [OPTIONS]
@y
command: docker load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: Load an image from a tar archive or STDIN
usage: docker load [OPTIONS]
@z

% options:

@x input
      description: Read from tar archive file, instead of STDIN
@y
      description: Read from tar archive file, instead of STDIN
@z

@x platform
      description: |
        Load only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
      description: |
        Load only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@z

@x quiet
      description: Suppress the load output
@y
      description: Suppress the load output
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
