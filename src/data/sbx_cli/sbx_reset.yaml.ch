%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx reset
synopsis: Reset all sandboxes and clean up state
description: |-
    Reset Docker Sandboxes to a freshly-installed state.
@y
name: sbx reset
synopsis: Reset all sandboxes and clean up state
description: |-
    Reset Docker Sandboxes to a freshly-installed state.
@z

@x
    This command will:
    - Stop all running sandboxes gracefully (30s timeout)
    - Clear image cache
    - Clear all internal registries
    - Delete all sandbox state
    - Remove all policies
    - Remove the managed SSH configuration
    - Clear the Gordon assistant's sessions and history
    - Delete all stored secrets
    - Sign out of Docker Sandboxes
    - Stop the daemon
    - Remove all state, cache, and config directories
@y
    This command will:
    - Stop all running sandboxes gracefully (30s timeout)
    - Clear image cache
    - Clear all internal registries
    - Delete all sandbox state
    - Remove all policies
    - Remove the managed SSH configuration
    - Clear the Gordon assistant's sessions and history
    - Delete all stored secrets
    - Sign out of Docker Sandboxes
    - Stop the daemon
    - Remove all state, cache, and config directories
@z

@x
    WARNING: This is destructive and cannot be undone.
    Running agents will be terminated and their work lost.
    Cached images will be deleted and recreated on next use.
    Stored secrets will need to be re-entered.
@y
    WARNING: This is destructive and cannot be undone.
    Running agents will be terminated and their work lost.
    Cached images will be deleted and recreated on next use.
    Stored secrets will need to be re-entered.
@z

@x
    Use --preserve-secrets to keep stored secrets.
    By default, you will be prompted to confirm (y/N).
    Use --force to skip the confirmation prompt.
@y
    Use --preserve-secrets to keep stored secrets.
    By default, you will be prompted to confirm (y/N).
    Use --force to skip the confirmation prompt.
@z

@x
usage: sbx reset [flags]
@y
usage: sbx reset [flags]
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

@x preserve-secrets
      usage: Keep stored secrets
@y
      usage: Keep stored secrets
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
