%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx port ls
synopsis: List published ports
description: |-
    List the published ports of a sandbox.
@y
name: sbx port ls
synopsis: List published ports
description: |-
    List the published ports of a sandbox.
@z

@x
    With --cloud:
    List the exposed ports of a cloud sandbox given by ID (sbx_*) or name, each
    with its publicly reachable URL.
@y
    With --cloud:
    List the exposed ports of a cloud sandbox given by ID (sbx_*) or name, each
    with its publicly reachable URL.
@z

@x
usage: sbx port ls SANDBOX [flags]
@y
usage: sbx port ls SANDBOX [flags]
@z

% options:

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
      sbx port ls my-sandbox
@y
example: |4-
      sbx port ls my-sandbox
@z

@x
      # Machine-readable output
      sbx port ls my-sandbox --format json
@y
      # Machine-readable output
      sbx port ls my-sandbox --format json
@z

% see_also:

@x
    - sbx port - Manage sandbox port publishing
@y
    - sbx port - Manage sandbox port publishing
@z
