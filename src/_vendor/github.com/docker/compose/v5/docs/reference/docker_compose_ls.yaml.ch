%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose ls
short: List running compose projects
long: Lists running Compose projects
usage: docker compose ls [OPTIONS]
@y
command: docker compose ls
short: List running compose projects
long: Lists running Compose projects
usage: docker compose ls [OPTIONS]
@z

% options:

@x all
      description: Show all stopped Compose projects
@y
      description: Show all stopped Compose projects
@z

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: 'Format the output. Values: [table | json]'
@y
      description: 'Format the output. Values: [table | json]'
@z

@x quiet
      description: Only display project names
@y
      description: Only display project names
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
