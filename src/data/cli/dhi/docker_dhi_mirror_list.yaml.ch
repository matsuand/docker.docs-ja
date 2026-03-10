%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi mirror list
short: List all mirrored Docker Hardened Images
long: |-
    List all Docker Hardened Images currently being mirrored to your organization's registry.
@y
command: docker dhi mirror list
short: List all mirrored Docker Hardened Images
long: |-
    List all Docker Hardened Images currently being mirrored to your organization's registry.
@z

@x
    Shows the source repositories, destination repositories, and mirroring status.
@y
    Shows the source repositories, destination repositories, and mirroring status.
@z

@x
    Examples:
      # List all mirrored repositories
      dhictl mirror list --org myorg
@y
    Examples:
      # List all mirrored repositories
      dhictl mirror list --org myorg
@z

@x
      # List only image repositories
      dhictl mirror list --org myorg --type image
@y
      # List only image repositories
      dhictl mirror list --org myorg --type image
@z

@x
      # List only helm chart repositories
      dhictl mirror list --org myorg --type helm-chart
@y
      # List only helm chart repositories
      dhictl mirror list --org myorg --type helm-chart
@z

@x
      # Search for a specific repository by name
      dhictl mirror list --org myorg --filter dhi-python
@y
      # Search for a specific repository by name
      dhictl mirror list --org myorg --filter dhi-python
@z

@x
      # Output in JSON format
      dhictl mirror list --org myorg --json
@y
      # Output in JSON format
      dhictl mirror list --org myorg --json
@z

@x
usage: docker dhi mirror list
@y
usage: docker dhi mirror list
@z

% options

@x filter
      description: Filter by repository name (partial match)
@y
      description: Filter by repository name (partial match)
@z

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x type
      description: Filter by repository type (image or helm-chart)
@y
      description: Filter by repository type (image or helm-chart)
@z

% inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
