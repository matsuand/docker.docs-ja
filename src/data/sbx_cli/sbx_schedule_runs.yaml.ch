%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule runs
synopsis: List the runs of a schedule
description: List the runs of a schedule, newest first.
usage: sbx schedule runs SCHEDULE_ID [flags]
@y
name: sbx schedule runs
synopsis: List the runs of a schedule
description: List the runs of a schedule, newest first.
usage: sbx schedule runs SCHEDULE_ID [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for runs
@y
      usage: help for runs
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x limit
      usage: Maximum number of runs to show; 0 shows all
@y
      usage: Maximum number of runs to show; 0 shows all
@z

@x quiet
      usage: Only display run IDs
@y
      usage: Only display run IDs
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
      sbx --cloud schedule runs SCHEDULE_ID
      sbx --cloud schedule runs SCHEDULE_ID --limit 0 --json
@y
example: |4-
      sbx --cloud schedule runs SCHEDULE_ID
      sbx --cloud schedule runs SCHEDULE_ID --limit 0 --json
@z

% see_also:

@x
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
    - sbx schedule runs inspect - Show the details of a schedule run
@y
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
    - sbx schedule runs inspect - Show the details of a schedule run
@z
