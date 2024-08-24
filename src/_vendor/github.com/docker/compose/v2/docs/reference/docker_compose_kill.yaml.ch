%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose kill
short: Force stop service containers
long: |-
    Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@y
command: docker compose kill
short: Force stop service containers
long: |-
    Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@z

% snip command...

@x
usage: docker compose kill [OPTIONS] [SERVICE...]
@y
usage: docker compose kill [OPTIONS] [SERVICE...]
@z

% options:

@x remove-orphans
      description: Remove containers for services not defined in the Compose file
@y
      description: Remove containers for services not defined in the Compose file
@z

@x signal
      description: SIGNAL to send to the container
@y
      description: SIGNAL to send to the container
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

snip directives...
