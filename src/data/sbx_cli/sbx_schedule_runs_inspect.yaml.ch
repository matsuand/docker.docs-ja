%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule runs inspect
synopsis: Show the details of a schedule run
usage: sbx schedule runs inspect SCHEDULE_ID RUN_ID [flags]
@y
name: sbx schedule runs inspect
synopsis: Show the details of a schedule run
usage: sbx schedule runs inspect SCHEDULE_ID RUN_ID [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for inspect
@y
      usage: help for inspect
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
      sbx --cloud schedule runs inspect SCHEDULE_ID RUN_ID
      sbx --cloud schedule runs inspect SCHEDULE_ID RUN_ID --json
@y
example: |4-
      sbx --cloud schedule runs inspect SCHEDULE_ID RUN_ID
      sbx --cloud schedule runs inspect SCHEDULE_ID RUN_ID --json
@z

% see_also:

@x
    - sbx schedule runs - List the runs of a schedule
@y
    - sbx schedule runs - List the runs of a schedule
@z
