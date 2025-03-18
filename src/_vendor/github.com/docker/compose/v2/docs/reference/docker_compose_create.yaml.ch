%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose create
short: Creates containers for a service
long: Creates containers for a service
usage: docker compose create [OPTIONS] [SERVICE...]
@y
command: docker compose create
short: Creates containers for a service
long: Creates containers for a service
usage: docker compose create [OPTIONS] [SERVICE...]
@z

% options:

@x build
      description: Build images before starting containers
@y
      description: Build images before starting containers
@z

@x force-recreate
      description: |
        Recreate containers even if their configuration and image haven't changed
@y
      description: |
        Recreate containers even if their configuration and image haven't changed
@z

@x no-build
      description: Don't build an image, even if it's policy
@y
      description: Don't build an image, even if it's policy
@z

@x no-recreate
      description: |
        If containers already exist, don't recreate them. Incompatible with --force-recreate.
@y
      description: |
        If containers already exist, don't recreate them. Incompatible with --force-recreate.
@z

@x pull
      description: Pull image before running ("always"|"missing"|"never"|"build")
@y
      description: Pull image before running ("always"|"missing"|"never"|"build")
@z

@x quiet-pull
      description: Pull without printing progress information
@y
      description: Pull without printing progress information
@z

@x remove-orphans
      description: Remove containers for services not defined in the Compose file
@y
      description: Remove containers for services not defined in the Compose file
@z

@x scale
      description: |
        Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.
@y
      description: |
        Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.
@z

@x "y"
      description: Assume "yes" as answer to all prompts and run non-interactively
@y
      description: Assume "yes" as answer to all prompts and run non-interactively
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
