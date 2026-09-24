%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx settings
synopsis: Manage Docker Sandboxes settings
description: |-
    View and manage settings for Docker Sandboxes.
@y
name: sbx settings
synopsis: Manage Docker Sandboxes settings
description: |-
    View and manage settings for Docker Sandboxes.
@z

@x
    Settings can come from defaults, environment variables, or user overrides.
    These commands use the local daemon to read evaluated values and manage
    overrides, starting it if necessary.
@y
    Settings can come from defaults, environment variables, or user overrides.
    These commands use the local daemon to read evaluated values and manage
    overrides, starting it if necessary.
@z

@x
    Most changes take effect within about five seconds. Some require a daemon
    restart.
@y
    Most changes take effect within about five seconds. Some require a daemon
    restart.
@z

@x
usage: sbx settings COMMAND
@y
usage: sbx settings COMMAND
@z

% options:

@x help
      usage: help for settings
@y
      usage: help for settings
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
    - sbx settings get - Get the value of a setting
    - sbx settings list - List settings
    - sbx settings set - Set a setting override
    - sbx settings unset - Remove a setting override
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx settings get - Get the value of a setting
    - sbx settings list - List settings
    - sbx settings set - Set a setting override
    - sbx settings unset - Remove a setting override
@z
