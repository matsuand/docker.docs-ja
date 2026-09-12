%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx volume create
synopsis: Create a new persistent volume
description: |-
    Create a new persistent volume.
@y
name: sbx volume create
synopsis: Create a new persistent volume
description: |-
    Create a new persistent volume.
@z

@x
    The volume name must be unique per account; an attempt to create a volume
    with a name already in use is rejected.
@y
    The volume name must be unique per account; an attempt to create a volume
    with a name already in use is rejected.
@z

@x
usage: sbx volume create NAME [flags]
@y
usage: sbx volume create NAME [flags]
@z

% options:

@x help
      usage: help for create
@y
      usage: help for create
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: '  sbx --cloud volume create my-cache'
@y
example: '  sbx --cloud volume create my-cache'
@z

% see_also:

@x
    - sbx volume - Manage persistent volumes (cloud-only)
@y
    - sbx volume - Manage persistent volumes (cloud-only)
@z
