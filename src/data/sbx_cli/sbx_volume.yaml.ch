%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx volume
synopsis: Manage persistent volumes (cloud-only)
description: |-
    Manage persistent volumes for cloud sandboxes.
@y
name: sbx volume
synopsis: Manage persistent volumes (cloud-only)
description: |-
    Manage persistent volumes for cloud sandboxes.
@z

@x
    Volumes provide persistent storage that survives across sandbox runs.
    Data is saved as a snapshot when a sandbox exits, not continuously
    synced. If multiple sandboxes mount the same volume concurrently, the
    last sandbox to exit wins — its snapshot overwrites the others.
@y
    Volumes provide persistent storage that survives across sandbox runs.
    Data is saved as a snapshot when a sandbox exits, not continuously
    synced. If multiple sandboxes mount the same volume concurrently, the
    last sandbox to exit wins — its snapshot overwrites the others.
@z

@x
    Volumes are a cloud-only feature; every subcommand requires --cloud.
@y
    Volumes are a cloud-only feature; every subcommand requires --cloud.
@z

@x
usage: sbx volume COMMAND
@y
usage: sbx volume COMMAND
@z

% options:

@x help
      usage: help for volume
@y
      usage: help for volume
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx volume create - Create a new persistent volume
    - sbx volume inspect - Show details for a volume
    - sbx volume ls - List persistent volumes
    - sbx volume rm - Delete a persistent volume
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx volume create - Create a new persistent volume
    - sbx volume inspect - Show details for a volume
    - sbx volume ls - List persistent volumes
    - sbx volume rm - Delete a persistent volume
@z
