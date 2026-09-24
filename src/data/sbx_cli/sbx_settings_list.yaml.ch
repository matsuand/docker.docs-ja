%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx settings list
synopsis: List settings
description: |-
    List known settings with their evaluated value, type, source, and description.
@y
name: sbx settings list
synopsis: List settings
description: |-
    List known settings with their evaluated value, type, source, and description.
@z

@x
    The SOURCE column shows where the value came from (default, envvar, or
    override). RESTART identifies settings that require 'sbx daemon restart' for
    existing daemon-side consumers. Long values and descriptions are truncated to
    keep the table readable; use --no-trunc or --json for complete output. Use
    'sbx settings get <key>' to print one value in full.
@y
    The SOURCE column shows where the value came from (default, envvar, or
    override). RESTART identifies settings that require 'sbx daemon restart' for
    existing daemon-side consumers. Long values and descriptions are truncated to
    keep the table readable; use --no-trunc or --json for complete output. Use
    'sbx settings get <key>' to print one value in full.
@z

@x
usage: sbx settings list [flags]
@y
usage: sbx settings list [flags]
@z

% options:

@x help
      usage: help for list
@y
      usage: help for list
@z

@x json
      usage: Print complete setting records as JSON
@y
      usage: Print complete setting records as JSON
@z

@x no-trunc
      usage: Show full values and descriptions, one setting per block
@y
      usage: Show full values and descriptions, one setting per block
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
      # List settings as a table
      sbx settings list
@y
example: |4-
      # List settings as a table
      sbx settings list
@z

@x
      # List settings as JSON
      sbx settings list --json
@y
      # List settings as JSON
      sbx settings list --json
@z

% see_also:

@x
    - sbx settings - Manage Docker Sandboxes settings
@y
    - sbx settings - Manage Docker Sandboxes settings
@z
