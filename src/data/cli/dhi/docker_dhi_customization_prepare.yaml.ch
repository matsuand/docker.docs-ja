%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization prepare
short: Prepare a new customization YAML file from a DHI base image tag
long: |-
    Prepare a new customization YAML file by fetching tag details from a Docker Hardened Images repository.
    This creates a scaffold YAML file that can be used with the create command.
@y
command: docker dhi customization prepare
short: Prepare a new customization YAML file from a DHI base image tag
long: |-
    Prepare a new customization YAML file by fetching tag details from a Docker Hardened Images repository.
    This creates a scaffold YAML file that can be used with the create command.
@z

@x
    The repository argument must be a DHI source repository name, not a mirrored destination repository.
    Supported formats:
      - golang
      - dhi/golang
      - dhi.io/golang
@y
    The repository argument must be a DHI source repository name, not a mirrored destination repository.
    Supported formats:
      - golang
      - dhi/golang
      - dhi.io/golang
@z

@x
usage: docker dhi customization prepare <dhi-repository> <tag>
@y
usage: docker dhi customization prepare <dhi-repository> <tag>
@z

% options

@x destination
      description: Destination repository (e.g. myorg/dhi-golang)
@y
      description: Destination repository (e.g. myorg/dhi-golang)
@z

@x name
      description: Name for the customization
@y
      description: Name for the customization
@z

@x output
      description: Output file path (if not specified, outputs to stdout)
@y
      description: Output file path (if not specified, outputs to stdout)
@z

% inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
