%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx daemon
synopsis: Manage sandboxd daemon
usage: sbx daemon COMMAND
@y
name: sbx daemon
synopsis: Manage sandboxd daemon
usage: sbx daemon COMMAND
@z

% options:

@x help
      usage: help for daemon
@y
      usage: help for daemon
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

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx daemon log-level - Inspect or change sandboxd's per-category log levels
    - sbx daemon restart - Restart the sandboxd daemon
    - sbx daemon start - Start the sandboxd daemon
    - sbx daemon status - Check sandboxd daemon status
    - sbx daemon stop - Stop the sandboxd daemon
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx daemon log-level - Inspect or change sandboxd's per-category log levels
    - sbx daemon restart - Restart the sandboxd daemon
    - sbx daemon start - Start the sandboxd daemon
    - sbx daemon status - Check sandboxd daemon status
    - sbx daemon stop - Stop the sandboxd daemon
@z
