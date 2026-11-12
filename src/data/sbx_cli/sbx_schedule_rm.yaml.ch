%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule rm
synopsis: Remove a schedule
description: |-
    Remove a schedule so it starts no further runs.
@y
name: sbx schedule rm
synopsis: Remove a schedule
description: |-
    Remove a schedule so it starts no further runs.
@z

@x
    The removal fails if the schedule changed after it was read; inspect it and
    retry.
@y
    The removal fails if the schedule changed after it was read; inspect it and
    retry.
@z

@x
usage: sbx schedule rm SCHEDULE_ID [flags]
@y
usage: sbx schedule rm SCHEDULE_ID [flags]
@z

% options:

@x force
      usage: Skip confirmation prompt
@y
      usage: Skip confirmation prompt
@z

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for rm
@y
      usage: help for rm
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
example: '  sbx --cloud schedule rm 0b5c6f3e-1d2a-4c8e-9f70-2a6d1e4b8c31'
@y
example: '  sbx --cloud schedule rm 0b5c6f3e-1d2a-4c8e-9f70-2a6d1e4b8c31'
@z

% see_also:

@x
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@y
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@z
