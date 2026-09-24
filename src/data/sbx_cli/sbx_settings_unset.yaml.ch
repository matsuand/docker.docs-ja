%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx settings unset
synopsis: Remove a setting override
description: |-
    Remove the user override for a setting.
@y
name: sbx settings unset
synopsis: Remove a setting override
description: |-
    Remove the user override for a setting.
@z

@x
    The setting then evaluates from its environment variable or default value.
@y
    The setting then evaluates from its environment variable or default value.
@z

@x
usage: sbx settings unset <key> [flags]
@y
usage: sbx settings unset <key> [flags]
@z

% options:

@x help
      usage: help for unset
@y
      usage: help for unset
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
      # Remove the override for a setting
      sbx settings unset proxy.daemon
@y
example: |4-
      # Remove the override for a setting
      sbx settings unset proxy.daemon
@z

% see_also:

@x
    - sbx settings - Manage Docker Sandboxes settings
@y
    - sbx settings - Manage Docker Sandboxes settings
@z
