%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose start
short: Start services
long: Starts existing containers for a service
usage: docker compose start [SERVICE...]
@y
command: docker compose start
short: Start services
long: Starts existing containers for a service
usage: docker compose start [SERVICE...]
@z

% options:

@x wait
      description: Wait for services to be running|healthy. Implies detached mode.
@y
      description: Wait for services to be running|healthy. Implies detached mode.
@z

@x wait-timeout
      description: |
        Maximum duration in seconds to wait for the project to be running|healthy
@y
      description: |
        Maximum duration in seconds to wait for the project to be running|healthy
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
