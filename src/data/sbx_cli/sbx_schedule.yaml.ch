%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule
synopsis: Manage scheduled cloud sandbox runs (cloud-only)
description: |-
    Manage schedules that start cloud sandboxes on a cron cadence.
@y
name: sbx schedule
synopsis: Manage scheduled cloud sandbox runs (cloud-only)
description: |-
    Manage schedules that start cloud sandboxes on a cron cadence.
@z

@x
    Schedules are a cloud-only feature; every subcommand requires --cloud.
@y
    Schedules are a cloud-only feature; every subcommand requires --cloud.
@z

@x
usage: sbx schedule COMMAND
@y
usage: sbx schedule COMMAND
@z

% options:

@x help
      usage: help for schedule
@y
      usage: help for schedule
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
    - sbx schedule create - Create a schedule that runs a kit on a cron cadence
    - sbx schedule inspect - Show schedule details
    - sbx schedule ls - List schedules
    - sbx schedule rm - Remove a schedule
    - sbx schedule run - Start a run of a schedule now
    - sbx schedule runs - List the runs of a schedule
    - sbx schedule update - Update a schedule's settings or what it runs
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx schedule create - Create a schedule that runs a kit on a cron cadence
    - sbx schedule inspect - Show schedule details
    - sbx schedule ls - List schedules
    - sbx schedule rm - Remove a schedule
    - sbx schedule run - Start a run of a schedule now
    - sbx schedule runs - List the runs of a schedule
    - sbx schedule update - Update a schedule's settings or what it runs
@z
