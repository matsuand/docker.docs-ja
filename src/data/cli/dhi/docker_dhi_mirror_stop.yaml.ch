%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi mirror stop
short: Stop mirroring one or more Docker Hardened Images
long: |-
    Stop mirroring one or more Docker Hardened Image repositories.
@y
command: docker dhi mirror stop
short: Stop mirroring one or more Docker Hardened Images
long: |-
    Stop mirroring one or more Docker Hardened Image repositories.
@z

@x
    Multiple repositories can be specified as positional arguments.
@y
    Multiple repositories can be specified as positional arguments.
@z

@x
    Each repository can be specified as:
      - namespace/name (e.g., myorg/dhi-python) - org must match --org flag or config
      - name only (e.g., dhi-python) - the namespace can be omitted for simplicity
        and the command will default to the current org automatically
@y
    Each repository can be specified as:
      - namespace/name (e.g., myorg/dhi-python) - org must match --org flag or config
      - name only (e.g., dhi-python) - the namespace can be omitted for simplicity
        and the command will default to the current org automatically
@z

@x
    Examples:
      # Stop mirroring a single repository
      docker dhi mirror stop myorg/dhi-python --org myorg
@y
    Examples:
      # Stop mirroring a single repository
      docker dhi mirror stop myorg/dhi-python --org myorg
@z

@x
      # Stop mirroring using just the name (defaults to current org)
      docker dhi mirror stop dhi-python --org myorg
@y
      # Stop mirroring using just the name (defaults to current org)
      docker dhi mirror stop dhi-python --org myorg
@z

@x
      # Stop mirroring multiple repositories
      docker dhi mirror stop dhi-python dhi-golang dhi-node --org myorg
@y
      # Stop mirroring multiple repositories
      docker dhi mirror stop dhi-python dhi-golang dhi-node --org myorg
@z

@x
      # Stop mirroring and delete the repositories
      docker dhi mirror stop dhi-python dhi-golang --org myorg --delete
@y
      # Stop mirroring and delete the repositories
      docker dhi mirror stop dhi-python dhi-golang --org myorg --delete
@z

@x
      # Stop mirroring, delete without confirmation prompt
      docker dhi mirror stop dhi-python dhi-golang --org myorg --delete --force
@y
      # Stop mirroring, delete without confirmation prompt
      docker dhi mirror stop dhi-python dhi-golang --org myorg --delete --force
@z

@x
      # Stop mirroring all repositories matching a filter (using shell substitution)
      docker dhi mirror stop $(docker dhi mirror list --org myorg --filter golang --json | jq -r '.[].repository') --org myorg
@y
      # Stop mirroring all repositories matching a filter (using shell substitution)
      docker dhi mirror stop $(docker dhi mirror list --org myorg --filter golang --json | jq -r '.[].repository') --org myorg
@z

@x
usage: docker dhi mirror stop <repository> [repository...]
@y
usage: docker dhi mirror stop <repository> [repository...]
@z

% options

@x delete
      description: Delete the repositories after stopping mirroring
@y
      description: Delete the repositories after stopping mirroring
@z

@x  force
      description: Skip confirmation prompt when deleting repositories
@y
      description: Skip confirmation prompt when deleting repositories
@z

% inherited_options

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
