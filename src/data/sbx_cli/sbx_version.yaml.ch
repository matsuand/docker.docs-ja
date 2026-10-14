%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx version
synopsis: Show Docker Sandboxes version information
@y
name: sbx version
synopsis: Show Docker Sandboxes version information
@z

@x
usage: sbx version [flags]
@y
usage: sbx version [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for version
@y
      usage: help for version
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
      sbx version
@y
example: |4-
      sbx version
@z

@x
      # Include daemon and build details
      sbx version --debug
@y
      # Include daemon and build details
      sbx version --debug
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
