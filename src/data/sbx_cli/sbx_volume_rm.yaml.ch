%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx volume rm
synopsis: Delete a persistent volume
description: |-
    Delete a persistent volume by name.
@y
name: sbx volume rm
synopsis: Delete a persistent volume
description: |-
    Delete a persistent volume by name.
@z

@x
    Volumes attached to active sandboxes cannot be deleted; detach them
    first by stopping or deleting the sandbox(es) that mount the volume.
@y
    Volumes attached to active sandboxes cannot be deleted; detach them
    first by stopping or deleting the sandbox(es) that mount the volume.
@z

@x
usage: sbx volume rm NAME [flags]
@y
usage: sbx volume rm NAME [flags]
@z

% options:

@x force
      usage: Skip confirmation prompt
@y
      usage: Skip confirmation prompt
@z

@x help
      usage: help for rm
@y
      usage: help for rm
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

@x
example: '  sbx --cloud volume rm my-cache'
@y
example: '  sbx --cloud volume rm my-cache'
@z

% see_also:

@x
    - sbx volume - Manage persistent volumes (cloud-only)
@y
    - sbx volume - Manage persistent volumes (cloud-only)
@z
