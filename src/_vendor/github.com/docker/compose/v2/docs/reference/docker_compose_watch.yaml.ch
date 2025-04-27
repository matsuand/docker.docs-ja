%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose watch
short: |
    Watch build context for service and rebuild/refresh containers when files are updated
long: |
    Watch build context for service and rebuild/refresh containers when files are updated
usage: docker compose watch [SERVICE...]
@y
command: docker compose watch
short: |
    Watch build context for service and rebuild/refresh containers when files are updated
long: |
    Watch build context for service and rebuild/refresh containers when files are updated
usage: docker compose watch [SERVICE...]
@z

% options:

@x no-up
      description: Do not build & start services before watching
@y
      description: Do not build & start services before watching
@z

@x prune
      description: Prune dangling images on rebuild
@y
      description: Prune dangling images on rebuild
@z

@x quiet
      description: hide build output
@y
      description: hide build output
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
