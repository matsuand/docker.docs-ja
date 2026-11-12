%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx df
synopsis: Show runtime disk usage
description: |-
    Show disk usage for local images, containers, and managed volumes.
@y
name: sbx df
synopsis: Show runtime disk usage
description: |-
    Show disk usage for local images, containers, and managed volumes.
@z

@x
    Image totals include stored blobs and snapshots, count shared layers once,
    and include retained data without tags. Active images and volumes are referenced
    by a container, including stopped containers. Active containers are running or
    paused.
@y
    Image totals include stored blobs and snapshots, count shared layers once,
    and include retained data without tags. Active images and volumes are referenced
    by a container, including stopped containers. Active containers are running or
    paused.
@z

@x
    Reclaimable space is an estimate for removing unused resources of each type,
    not the space that "sbx prune" alone removes. Detached writable layers are
    included in the container total. Shared filesystem blocks, leases,
    and concurrent activity can reduce or delay space recovered. Host bind mounts,
    logs, and caches are excluded. Unavailable measurements show as unknown.
    Cloud disk usage is not supported.
@y
    Reclaimable space is an estimate for removing unused resources of each type,
    not the space that "sbx prune" alone removes. Detached writable layers are
    included in the container total. Shared filesystem blocks, leases,
    and concurrent activity can reduce or delay space recovered. Host bind mounts,
    logs, and caches are excluded. Unavailable measurements show as unknown.
    Cloud disk usage is not supported.
@z

@x
usage: sbx df [flags]
@y
usage: sbx df [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for df
@y
      usage: help for df
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x verbose
      usage: Show individual images, containers, and volumes
@y
      usage: Show individual images, containers, and volumes
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

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

@x
example: |4-
      # Show a disk usage summary
      sbx df
@y
example: |4-
      # Show a disk usage summary
      sbx df
@z

@x
      # Show individual images, containers, and volumes
      sbx df --verbose
@y
      # Show individual images, containers, and volumes
      sbx df --verbose
@z

@x
      # Output in JSON format
      sbx df --format json
@y
      # Output in JSON format
      sbx df --format json
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
