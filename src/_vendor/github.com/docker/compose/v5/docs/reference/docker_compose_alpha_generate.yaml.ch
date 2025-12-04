%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose alpha generate
short: EXPERIMENTAL - Generate a Compose file from existing containers
long: EXPERIMENTAL - Generate a Compose file from existing containers
usage: docker compose alpha generate [OPTIONS] [CONTAINERS...]
@y
command: docker compose alpha generate
short: EXPERIMENTAL - Generate a Compose file from existing containers
long: EXPERIMENTAL - Generate a Compose file from existing containers
usage: docker compose alpha generate [OPTIONS] [CONTAINERS...]
@z

% options:

@x format
      description: 'Format the output. Values: [yaml | json]'
@y
      description: 'Format the output. Values: [yaml | json]'
@z

@x name
      description: Project name to set in the Compose file
@y
      description: Project name to set in the Compose file
@z

@x project-dir
      description: Directory to use for the project
@y
      description: Directory to use for the project
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
