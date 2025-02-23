%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
usage: docker restart [OPTIONS] CONTAINER [CONTAINER...]
@y
command: docker restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
usage: docker restart [OPTIONS] CONTAINER [CONTAINER...]
@z

% options:

@x signal
      description: Signal to send to the container
@y
      description: Signal to send to the container
@z

@x time
      description: |
        Seconds to wait before killing the container (deprecated: use --timeout)
@y
      description: |
        Seconds to wait before killing the container (deprecated: use --timeout)
@z

@x timeout
      description: Seconds to wait before killing the container
@y
      description: Seconds to wait before killing the container
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
