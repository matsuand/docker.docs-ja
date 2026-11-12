%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule ls
synopsis: List schedules
usage: sbx schedule ls [flags]
@y
name: sbx schedule ls
synopsis: List schedules
usage: sbx schedule ls [flags]
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
      usage: Only display schedule IDs
@y
      usage: Only display schedule IDs
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
example: '  sbx --cloud schedule ls'
@y
example: '  sbx --cloud schedule ls'
@z

% see_also:

@x
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@y
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@z
