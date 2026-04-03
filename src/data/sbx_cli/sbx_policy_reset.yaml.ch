%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy reset
synopsis: Reset policies to defaults
description: |-
    Remove all custom policies and restart the daemon to restore defaults.
@y
name: sbx policy reset
synopsis: Reset policies to defaults
description: |-
    Remove all custom policies and restart the daemon to restore defaults.
@z

@x
    This deletes the local policy store and stops the daemon. When the daemon
    restarts (automatically on next command), the default policy is installed.
@y
    This deletes the local policy store and stops the daemon. When the daemon
    restarts (automatically on next command), the default policy is installed.
@z

@x
    If sandboxes are currently running, they will be stopped when the daemon
    shuts down. You will be prompted for confirmation unless --force is used.
usage: sbx policy reset [flags]
options:
    - name: force
      shorthand: f
      default_value: "false"
      usage: Skip confirmation prompt
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for reset
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Reset policies (prompts if sandboxes are running)
      sbx policy reset
@y
    If sandboxes are currently running, they will be stopped when the daemon
    shuts down. You will be prompted for confirmation unless --force is used.
usage: sbx policy reset [flags]
options:
    - name: force
      shorthand: f
      default_value: "false"
      usage: Skip confirmation prompt
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for reset
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Reset policies (prompts if sandboxes are running)
      sbx policy reset
@z

@x
      # Reset policies without confirmation
      sbx policy reset --force
see_also:
    - sbx policy - Manage sandbox policies
@y
      # Reset policies without confirmation
      sbx policy reset --force
see_also:
    - sbx policy - Manage sandbox policies
@z
