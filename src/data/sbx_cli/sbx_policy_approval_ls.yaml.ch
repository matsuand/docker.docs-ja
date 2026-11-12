%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy approval ls
synopsis: List pending approvals
description: |
    List pending approvals from the local daemon, including their IDs, sandboxes, and available options.
usage: sbx policy approval ls [flags]
@y
name: sbx policy approval ls
synopsis: List pending approvals
description: |
    List pending approvals from the local daemon, including their IDs, sandboxes, and available options.
usage: sbx policy approval ls [flags]
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

@x quiet
      usage: Only display approval IDs
@y
      usage: Only display approval IDs
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
      # List pending approvals
      sbx policy approval ls
@y
example: |4-
      # List pending approvals
      sbx policy approval ls
@z

@x
      # List only approval IDs
      sbx policy approval ls -q
@y
      # List only approval IDs
      sbx policy approval ls -q
@z

% see_also:

@x
    - sbx policy approval - Review and respond to pending approvals
@y
    - sbx policy approval - Review and respond to pending approvals
@z
