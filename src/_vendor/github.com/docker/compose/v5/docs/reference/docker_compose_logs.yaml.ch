%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose logs
short: View output from containers
long: Displays log output from services
usage: docker compose logs [OPTIONS] [SERVICE...]
@y
command: docker compose logs
short: View output from containers
long: Displays log output from services
usage: docker compose logs [OPTIONS] [SERVICE...]
@z

% options:

@x follow
      description: Follow log output
@y
      description: Follow log output
@z

@x index
      description: index of the container if service has multiple replicas
@y
      description: index of the container if service has multiple replicas
@z

@x no-color
      description: Produce monochrome output
@y
      description: Produce monochrome output
@z

@x no-log-prefix
      description: Don't print prefix in logs
@y
      description: Don't print prefix in logs
@z

@x since
      description: |
        Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
@y
      description: |
        Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
@z

@x tail
      description: |
        Number of lines to show from the end of the logs for each container
@y
      description: |
        Number of lines to show from the end of the logs for each container
@z

@x timestamps
      description: Show timestamps
@y
      description: Show timestamps
@z

@x until
      description: |
        Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
@y
      description: |
        Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z
