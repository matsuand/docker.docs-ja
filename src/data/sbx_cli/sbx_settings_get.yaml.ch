%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx settings get
synopsis: Get the value of a setting
description: |-
    Print the evaluated value of a setting.
@y
name: sbx settings get
synopsis: Get the value of a setting
description: |-
    Print the evaluated value of a setting.
@z

@x
    Use --json to print the complete setting record, including its source, type,
    default, and description.
@y
    Use --json to print the complete setting record, including its source, type,
    default, and description.
@z

@x
usage: sbx settings get <key> [flags]
@y
usage: sbx settings get <key> [flags]
@z

% options:

@x help
      usage: help for get
@y
      usage: help for get
@z

@x json
      usage: Print the complete setting record as JSON
@y
      usage: Print the complete setting record as JSON
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
      # Get a setting value
      sbx settings get proxy.daemon
@y
example: |4-
      # Get a setting value
      sbx settings get proxy.daemon
@z

@x
      # Get in JSON format with source info
      sbx settings get --json proxy.daemon
@y
      # Get in JSON format with source info
      sbx settings get --json proxy.daemon
@z

% see_also:

@x
    - sbx settings - Manage Docker Sandboxes settings
@y
    - sbx settings - Manage Docker Sandboxes settings
@z
