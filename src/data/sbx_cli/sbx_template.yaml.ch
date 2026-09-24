%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template
synopsis: Manage sandbox templates
description: |-
    Manage sandbox templates.
@y
name: sbx template
synopsis: Manage sandbox templates
description: |-
    Manage sandbox templates.
@z

@x
    Templates are saved snapshots of sandboxes that can be reused to create new
    sandboxes with: sbx run --pull never -t TAG AGENT [WORKSPACE]
@y
    Templates are saved snapshots of sandboxes that can be reused to create new
    sandboxes with: sbx run --pull never -t TAG AGENT [WORKSPACE]
@z

@x
    With --cloud:
    Manage cloud sandbox templates.
@y
    With --cloud:
    Manage cloud sandbox templates.
@z

@x
    Reuse a saved template with: sbx --cloud run --template TEMPLATE
@y
    Reuse a saved template with: sbx --cloud run --template TEMPLATE
@z

@x
    Cloud snapshots and loads typically produce multi-GB artifacts and take
    several minutes. See https://docs.docker.com/ai/sandboxes/ for details.
@y
    Cloud snapshots and loads typically produce multi-GB artifacts and take
    several minutes. See https://docs.docker.com/ai/sandboxes/ for details.
@z

@x
usage: sbx template COMMAND
@y
usage: sbx template COMMAND
@z

% options:

@x help
      usage: help for template
@y
      usage: help for template
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
    - sbx template inspect - Show full metadata for a single template
    - sbx template load - Load an image from a tar file into the sandbox runtime
    - sbx template ls - List template images
    - sbx template rm - Remove a template image
    - sbx template save - Save a snapshot of the sandbox as a template
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx template inspect - Show full metadata for a single template
    - sbx template load - Load an image from a tar file into the sandbox runtime
    - sbx template ls - List template images
    - sbx template rm - Remove a template image
    - sbx template save - Save a snapshot of the sandbox as a template
@z
