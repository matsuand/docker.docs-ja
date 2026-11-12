%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule run
synopsis: Start a run of a schedule now
description: |
    Start a run of a schedule now, outside its cron cadence. The schedule definition is unchanged.
usage: sbx schedule run SCHEDULE_ID [flags]
@y
name: sbx schedule run
synopsis: Start a run of a schedule now
description: |
    Start a run of a schedule now, outside its cron cadence. The schedule definition is unchanged.
usage: sbx schedule run SCHEDULE_ID [flags]
@z

% options:

@x help
      usage: help for run
@y
      usage: help for run
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
example: '  sbx --cloud schedule run SCHEDULE_ID'
@y
example: '  sbx --cloud schedule run SCHEDULE_ID'
@z

% see_also:

@x
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@y
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@z
