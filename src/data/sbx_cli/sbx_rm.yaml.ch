%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx rm
synopsis: Remove one or more sandboxes
description: |-
    Remove one or more sandboxes and all associated resources. Or — with --cloud — the cloud sandbox
    ID (sbx_*) or name from "sbx --cloud ls".
@y
name: sbx rm
synopsis: Remove one or more sandboxes
description: |-
    Remove one or more sandboxes and all associated resources. Or — with --cloud — the cloud sandbox
    ID (sbx_*) or name from "sbx --cloud ls".
@z

@x
    For local sandboxes, stops them, removes their containers, cleans up any Git
    worktrees, deletes sandbox state, and deletes secrets scoped to each removed
    sandbox. This action cannot be undone. With --cloud, deletes
    the sandbox in Docker Sandboxes Cloud. This action cannot be undone. Once the
    server accepts the request, rm waits up to 60 seconds per sandbox for the
    deletion. A removal still completing after that exits 0. Verify it later with
    "sbx --cloud ls".
@y
    For local sandboxes, stops them, removes their containers, cleans up any Git
    worktrees, deletes sandbox state, and deletes secrets scoped to each removed
    sandbox. This action cannot be undone. With --cloud, deletes
    the sandbox in Docker Sandboxes Cloud. This action cannot be undone. Once the
    server accepts the request, rm waits up to 60 seconds per sandbox for the
    deletion. A removal still completing after that exits 0. Verify it later with
    "sbx --cloud ls".
@z

@x
    Removal requires confirmation; use --force to skip confirmation prompts
    (for non-interactive scripts) and to delete a sandbox that is in use
    (e.g. an open SSH connection). Use --all to remove every sandbox. With --cloud, --all is
    intentionally disabled as a safety gate — the blast radius covers every
    sandbox the credential can see, which may include shared or production
    workloads. Pass IDs explicitly in --cloud mode.
@y
    Removal requires confirmation; use --force to skip confirmation prompts
    (for non-interactive scripts) and to delete a sandbox that is in use
    (e.g. an open SSH connection). Use --all to remove every sandbox. With --cloud, --all is
    intentionally disabled as a safety gate — the blast radius covers every
    sandbox the credential can see, which may include shared or production
    workloads. Pass IDs explicitly in --cloud mode.
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
      usage: |
        Skip confirmation prompts and delete even if in use (e.g. an open SSH connection)
@y
      usage: |
        Skip confirmation prompts and delete even if in use (e.g. an open SSH connection)
@z

@x help
      usage: help for rm
@y
      usage: help for rm
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
@y
    - sbx - Manage AI coding agent sandboxes.
@z
