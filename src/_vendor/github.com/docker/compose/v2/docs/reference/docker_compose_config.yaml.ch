%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose config
aliases: docker compose config, docker compose convert
short: Parse, resolve and render compose file in canonical format
@y
command: docker compose config
aliases: docker compose config, docker compose convert
short: Parse, resolve and render compose file in canonical format
@z

@x
long: |-
    `docker compose config` renders the actual data model to be applied on the Docker Engine.
    It merges the Compose files set by `-f` flags, resolves variables in the Compose file, and expands short-notation into
    the canonical format.
@y
long: |-
    `docker compose config` renders the actual data model to be applied on the Docker Engine.
    It merges the Compose files set by `-f` flags, resolves variables in the Compose file, and expands short-notation into
    the canonical format.
@z

@x
usage: docker compose config [OPTIONS] [SERVICE...]
@y
usage: docker compose config [OPTIONS] [SERVICE...]
@z

% options:

@x format
      description: 'Format the output. Values: [yaml | json]'
@y
      description: 'Format the output. Values: [yaml | json]'
@z

@x hash
      description: Print the service config hash, one per line.
@y
      description: Print the service config hash, one per line.
@z

@x images
      description: Print the image names, one per line.
@y
      description: Print the image names, one per line.
@z

@x no-consistency
      description: |
        Don't check model consistency - warning: may produce invalid Compose output
@y
      description: |
        Don't check model consistency - warning: may produce invalid Compose output
@z

@x no-interpolate
      description: Don't interpolate environment variables
@y
      description: Don't interpolate environment variables
@z

@x no-normalize
      description: Don't normalize compose model
@y
      description: Don't normalize compose model
@z

@x no-path-resolution
      description: Don't resolve file paths
@y
      description: Don't resolve file paths
@z

@x output
      description: Save to file (default to stdout)
@y
      description: Save to file (default to stdout)
@z

@x profiles
      description: Print the profile names, one per line.
@y
      description: Print the profile names, one per line.
@z

@x quiet
      description: Only validate the configuration, don't print anything
@y
      description: Only validate the configuration, don't print anything
@z

@x resolve-image-digests
      description: Pin image tags to digests
@y
      description: Pin image tags to digests
@z

@x services
      description: Print the service names, one per line.
@y
      description: Print the service names, one per line.
@z

@x variables
      description: Print model variables and default values.
@y
      description: Print model variables and default values.
@z

@x volumes
      description: Print the volume names, one per line.
@y
      description: Print the volume names, one per line.
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
