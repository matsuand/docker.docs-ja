%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template ls
synopsis: List template images
description: |
    List all template images stored in the sandbox runtime's image store.
@y
name: sbx template ls
synopsis: List template images
description: |
    List all template images stored in the sandbox runtime's image store.
@z

@x
usage: sbx template ls [flags]
@y
usage: sbx template ls [flags]
@z

% options:

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
      # List all template images
      sbx template ls
@y
example: |4-
      # List all template images
      sbx template ls
@z

@x
      # Output in JSON format
      sbx template ls --json
@y
      # Output in JSON format
      sbx template ls --json
@z

% see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
