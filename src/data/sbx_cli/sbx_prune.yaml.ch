%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx prune
synopsis: Remove all stopped sandboxes
description: |-
    Remove all stopped sandboxes and their associated resources.
@y
name: sbx prune
synopsis: Remove all stopped sandboxes
description: |-
    Remove all stopped sandboxes and their associated resources.
@z

@x
    Only stopped sandboxes are candidates — a running sandbox is never removed,
    which makes this safe to run habitually. Stop a sandbox first with
    "sbx stop" if you want it pruned. To remove a specific sandbox regardless of
    state, use "sbx rm SANDBOX".
@y
    Only stopped sandboxes are candidates — a running sandbox is never removed,
    which makes this safe to run habitually. Stop a sandbox first with
    "sbx stop" if you want it pruned. To remove a specific sandbox regardless of
    state, use "sbx rm SANDBOX".
@z

@x
    Use --filter since=DURATION to narrow the set to sandboxes that have been
    stopped for longer than DURATION (e.g. since=168h to keep anything stopped
    within the last week). A sandbox whose stop time the daemon cannot report is
    left alone, since how long it has been stopped cannot be established.
@y
    Use --filter since=DURATION to narrow the set to sandboxes that have been
    stopped for longer than DURATION (e.g. since=168h to keep anything stopped
    within the last week). A sandbox whose stop time the daemon cannot report is
    left alone, since how long it has been stopped cannot be established.
@z

@x
    Use --dry-run to list what would be removed without removing anything.
@y
    Use --dry-run to list what would be removed without removing anything.
@z

@x
    Pruning requires confirmation; use --force to skip the confirmation prompt
    (for non-interactive scripts) and to remove a sandbox that is in use (e.g. an
    open SSH connection). This action cannot be undone.
@y
    Pruning requires confirmation; use --force to skip the confirmation prompt
    (for non-interactive scripts) and to remove a sandbox that is in use (e.g. an
    open SSH connection). This action cannot be undone.
@z

@x
    Local-only: cloud sandboxes expire via their TTL.
usage: sbx prune [flags]
options:
    - name: dry-run
      default_value: "false"
      usage: |
        List the sandboxes that would be removed without removing them
    - name: filter
      default_value: '[]'
      usage: |
        Filter candidates (supported: since=DURATION — stopped for longer than DURATION)
    - name: force
      shorthand: f
      default_value: "false"
      usage: |
        Skip confirmation prompts and remove even if in use (e.g. an open SSH connection)
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for prune
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
@y
    Local-only: cloud sandboxes expire via their TTL.
usage: sbx prune [flags]
options:
    - name: dry-run
      default_value: "false"
      usage: |
        List the sandboxes that would be removed without removing them
    - name: filter
      default_value: '[]'
      usage: |
        Filter candidates (supported: since=DURATION — stopped for longer than DURATION)
    - name: force
      shorthand: f
      default_value: "false"
      usage: |
        Skip confirmation prompts and remove even if in use (e.g. an open SSH connection)
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for prune
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
@z
