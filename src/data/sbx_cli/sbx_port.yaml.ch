%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx port
synopsis: Manage sandbox port publishing
description: |-
    Manage sandbox port publishing.
@y
name: sbx port
synopsis: Manage sandbox port publishing
description: |-
    Manage sandbox port publishing.
@z

@x
    List, publish, or unpublish the ports of a sandbox.
@y
    List, publish, or unpublish the ports of a sandbox.
@z

@x
usage: sbx port COMMAND
@y
usage: sbx port COMMAND
@z

% options:

@x help
      usage: help for port
@y
      usage: help for port
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

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx port ls - List published ports
    - sbx port publish - Publish ports
    - sbx port unpublish - Unpublish ports
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx port ls - List published ports
    - sbx port publish - Publish ports
    - sbx port unpublish - Unpublish ports
@z
