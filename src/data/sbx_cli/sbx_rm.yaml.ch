%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx rm
synopsis: Remove one or more sandboxes
description: |-
    Remove one or more sandboxes and all associated resources.
@y
name: sbx rm
synopsis: Remove one or more sandboxes
description: |-
    Remove one or more sandboxes and all associated resources.
@z

@x
    Stops running sandboxes, removes their containers, cleans up any Git
    worktrees, and deletes sandbox state. This action cannot be undone.
@y
    Stops running sandboxes, removes their containers, cleans up any Git
    worktrees, and deletes sandbox state. This action cannot be undone.
@z

@x
    Removal requires confirmation; use --force to skip confirmation prompts
    (for non-interactive scripts). Use --all to remove every sandbox.
@y
    Removal requires confirmation; use --force to skip confirmation prompts
    (for non-interactive scripts). Use --all to remove every sandbox.
@z

@x
usage: sbx rm [SANDBOX...] [flags]
@y
usage: sbx rm [SANDBOX...] [flags]
@z

% options:

@x all
      usage: Remove all sandboxes
@y
      usage: Remove all sandboxes
@z

@x force
      usage: Skip confirmation prompts
@y
      usage: Skip confirmation prompts
@z

@x help
      usage: help for rm
@y
      usage: help for rm
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
