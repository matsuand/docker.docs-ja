%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template ls
synopsis: List template images
description: |-
    List tagged template images stored in the sandbox runtime's image store.
@y
name: sbx template ls
synopsis: List template images
description: |-
    List tagged template images stored in the sandbox runtime's image store.
@z

@x
    With --cloud:
    List cloud sandbox templates.
@y
    With --cloud:
    List cloud sandbox templates.
@z

@x
usage: sbx template ls [flags]
@y
usage: sbx template ls [flags]
@z

% options:

@x all
      usage: Include digest-only and untagged images
@y
      usage: Include digest-only and untagged images
@z

@x digests
      usage: Show image digests
@y
      usage: Show image digests
@z

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for ls
@y
      usage: help for ls
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x no-trunc
      usage: Show full image IDs
@y
      usage: Show full image IDs
@z

@x quiet
      usage: Only display template names
@y
      usage: Only display template names
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
example: |4-
      # List tagged template images
      sbx template ls
@y
example: |4-
      # List tagged template images
      sbx template ls
@z

@x
      # Include digest-only and untagged images with their digests and full IDs
      sbx template ls --all --digests --no-trunc
@y
      # Include digest-only and untagged images with their digests and full IDs
      sbx template ls --all --digests --no-trunc
@z

@x
      # Output in JSON format
      sbx template ls --json
@y
      # Output in JSON format
      sbx template ls --json
@z

@x
      # Cloud: list templates
      sbx --cloud template ls
@y
      # Cloud: list templates
      sbx --cloud template ls
@z

@x
      # Cloud: output in JSON format
      sbx --cloud template ls --json
@y
      # Cloud: output in JSON format
      sbx --cloud template ls --json
@z

% see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
