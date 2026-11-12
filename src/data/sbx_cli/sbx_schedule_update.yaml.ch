%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx schedule update
synopsis: Update a schedule's settings or what it runs
description: |-
    Update a schedule's settings or what it runs.
@y
name: sbx schedule update
synopsis: Update a schedule's settings or what it runs
description: |-
    Update a schedule's settings or what it runs.
@z

@x
    --name, --description, --cron, --timezone and --enabled change only those settings.
    Any other flag, or KIT, rebuilds what each run executes from the flags given, so
    restate --prompt or --command and every run flag to keep: --static-mcp, the
    network flags, --max-run-duration, --cpus, --memory, --platform, --env and
    --working-dir not given again are reset, with a warning. Without KIT, the schedule's current kit is resolved again.
@y
    --name, --description, --cron, --timezone and --enabled change only those settings.
    Any other flag, or KIT, rebuilds what each run executes from the flags given, so
    restate --prompt or --command and every run flag to keep: --static-mcp, the
    network flags, --max-run-duration, --cpus, --memory, --platform, --env and
    --working-dir not given again are reset, with a warning. Without KIT, the schedule's current kit is resolved again.
@z

@x
usage: sbx schedule update SCHEDULE_ID [KIT] [flags]
@y
usage: sbx schedule update SCHEDULE_ID [KIT] [flags]
@z

% options:

@x allow-network
      usage: |
        Network pattern each run's sandbox may reach (can be repeated); other egress is denied
@y
      usage: |
        Network pattern each run's sandbox may reach (can be repeated); other egress is denied
@z

@x command
      usage: Shell command each run executes
@y
      usage: Shell command each run executes
@z

@x cpus
      usage: 'CPUs for each run''s sandbox (default: the kit''s)'
@y
      usage: 'CPUs for each run''s sandbox (default: the kit''s)'
@z

@x cron
      usage: |
        Five-field cron expression for when runs start, e.g. "0 9 * * 1-5"
@y
      usage: |
        Five-field cron expression for when runs start, e.g. "0 9 * * 1-5"
@z

@x deny-network
      usage: |
        Network pattern to deny within --allow-network (can be repeated)
@y
      usage: |
        Network pattern to deny within --allow-network (can be repeated)
@z

@x description
      usage: Description of the schedule
@y
      usage: Description of the schedule
@z

@x enabled
      usage: |
        Start runs on the cron cadence; --enabled=false pauses the schedule
@y
      usage: |
        Start runs on the cron cadence; --enabled=false pauses the schedule
@z

@x env
      usage: |
        Set an environment variable for each run (can be repeated): KEY=VALUE
@y
      usage: |
        Set an environment variable for each run (can be repeated): KEY=VALUE
@z

@x env-file
      usage: |
        Read environment variables from a file (can be repeated). --env wins over any file; a later file wins over an earlier one
@y
      usage: |
        Read environment variables from a file (can be repeated). --env wins over any file; a later file wins over an earlier one
@z

@x help
      usage: help for update
@y
      usage: help for update
@z

@x max-run-duration
      usage: |
        Longest a run may take, at least 1h, e.g. 2h30m (default: 1h)
@y
      usage: |
        Longest a run may take, at least 1h, e.g. 2h30m (default: 1h)
@z

@x memory
      usage: 'Memory for each run''s sandbox, e.g. 8g (default: the kit''s)'
@y
      usage: 'Memory for each run''s sandbox, e.g. 8g (default: the kit''s)'
@z

@x name
      usage: Name of the schedule
@y
      usage: Name of the schedule
@z

@x platform
      usage: 'Platform for each run''s sandbox: linux/amd64 or linux/arm64'
@y
      usage: 'Platform for each run''s sandbox: linux/amd64 or linux/arm64'
@z

@x prompt
      usage: Prompt each run passes to the kit's agent
@y
      usage: Prompt each run passes to the kit's agent
@z

@x static-mcp
      usage: |
        Cloud MCP gateway servers each run's sandbox gets, comma-separated or repeated
@y
      usage: |
        Cloud MCP gateway servers each run's sandbox gets, comma-separated or repeated
@z

@x timezone
      usage: |
        IANA time zone the cron expression is evaluated in, e.g. Europe/Berlin
@y
      usage: |
        IANA time zone the cron expression is evaluated in, e.g. Europe/Berlin
@z

@x working-dir
      usage: Directory the prompt or command runs in
@y
      usage: Directory the prompt or command runs in
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
      sbx --cloud schedule update SCHEDULE_ID --enabled=false
      sbx --cloud schedule update SCHEDULE_ID --cron "0 6 * * 1-5" --timezone America/New_York
      sbx --cloud schedule update SCHEDULE_ID --prompt "Triage new issues" --static-mcp github
@y
example: |4-
      sbx --cloud schedule update SCHEDULE_ID --enabled=false
      sbx --cloud schedule update SCHEDULE_ID --cron "0 6 * * 1-5" --timezone America/New_York
      sbx --cloud schedule update SCHEDULE_ID --prompt "Triage new issues" --static-mcp github
@z

% see_also:

@x
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@y
    - sbx schedule - Manage scheduled cloud sandbox runs (cloud-only)
@z
