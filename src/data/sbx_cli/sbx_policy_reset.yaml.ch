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
    This deletes the local policy store and stops the daemon. The daemon restarts
    automatically on the next command, then prompts you to initialize the global
    network policy again.
@y
    This deletes the local policy store and stops the daemon. The daemon restarts
    automatically on the next command, then prompts you to initialize the global
    network policy again.
@z

@x
    If sandboxes are currently running, they will be stopped when the daemon
    shuts down. You will be prompted for confirmation unless --force is used.
@y
    If sandboxes are currently running, they will be stopped when the daemon
    shuts down. You will be prompted for confirmation unless --force is used.
@z

@x
usage: sbx policy reset [flags]
@y
usage: sbx policy reset [flags]
@z

% options:

@x force
      usage: Skip confirmation prompt
@y
      usage: Skip confirmation prompt
@z

@x help
      usage: help for reset
@y
      usage: help for reset
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Reset policies — prompts if sandboxes are running
      sbx policy reset
@y
example: |4-
      # Reset policies — prompts if sandboxes are running
      sbx policy reset
@z

@x
      # Reset policies without confirmation
      sbx policy reset --force
@y
      # Reset policies without confirmation
      sbx policy reset --force
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
