%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi mirror stop
short: Stop mirroring a Docker Hardened Image
long: |-
    Stop mirroring a Docker Hardened Image repository.
@y
command: docker dhi mirror stop
short: Stop mirroring a Docker Hardened Image
long: |-
    Stop mirroring a Docker Hardened Image repository.
@z

@x
    The repository can be specified as:
      - Just the repository name (e.g., dhi-python) - uses --org flag or config
      - Full path with org (e.g., myorg/dhi-python) - org must match --org flag or config
@y
    The repository can be specified as:
      - Just the repository name (e.g., dhi-python) - uses --org flag or config
      - Full path with org (e.g., myorg/dhi-python) - org must match --org flag or config
@z

@x
    Examples:
      # Stop mirroring using --org flag
      dhictl mirror stop dhi-python --org myorg
@y
    Examples:
      # Stop mirroring using --org flag
      dhictl mirror stop dhi-python --org myorg
@z

@x
      # Stop mirroring with full path (org must match)
      dhictl mirror stop myorg/dhi-python --org myorg
@y
      # Stop mirroring with full path (org must match)
      dhictl mirror stop myorg/dhi-python --org myorg
@z

@x
      # Stop mirroring and delete the repository
      dhictl mirror stop dhi-python --org myorg --delete
@y
      # Stop mirroring and delete the repository
      dhictl mirror stop dhi-python --org myorg --delete
@z

@x
usage: docker dhi mirror stop <repository>
@y
usage: docker dhi mirror stop <repository>
@z

% options

@x delete
      description: Delete the repository after stopping mirroring
@y
      description: Delete the repository after stopping mirroring
@z

% inherited_options

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
