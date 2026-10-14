%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx daemon status
synopsis: Show sandboxd daemon status
usage: sbx daemon status [flags]
@y
name: sbx daemon status
synopsis: Show sandboxd daemon status
usage: sbx daemon status [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for status
@y
      usage: help for status
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

@x
example: |4-
      sbx daemon status
@y
example: |4-
      sbx daemon status
@z

@x
      # Machine-readable output
      sbx daemon status --format json
@y
      # Machine-readable output
      sbx daemon status --format json
@z

% see_also:

@x
    - sbx daemon - Manage sandboxd daemon
@y
    - sbx daemon - Manage sandboxd daemon
@z
