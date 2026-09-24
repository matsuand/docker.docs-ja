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
    Use --filter until=TIMESTAMP to narrow the set to sandboxes that stopped before
    TIMESTAMP. The value can be an RFC 3339 timestamp, Unix timestamp, or Go duration
    relative to now (e.g. until=168h keeps anything stopped within the last week).
    A sandbox whose stop time the daemon cannot report is left alone, since how long
    it has been stopped cannot be established.
@y
    Use --filter until=TIMESTAMP to narrow the set to sandboxes that stopped before
    TIMESTAMP. The value can be an RFC 3339 timestamp, Unix timestamp, or Go duration
    relative to now (e.g. until=168h keeps anything stopped within the last week).
    A sandbox whose stop time the daemon cannot report is left alone, since how long
    it has been stopped cannot be established.
@z

@x
    Use --dry-run to list what would be removed without removing anything, and
    --json with it for machine-readable output.
@y
    Use --dry-run to list what would be removed without removing anything, and
    --json with it for machine-readable output.
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
    Secrets scoped to each successfully pruned sandbox are also deleted.
@y
    Secrets scoped to each successfully pruned sandbox are also deleted.
@z

@x
    Local-only: cloud sandboxes expire via their TTL.
@y
    Local-only: cloud sandboxes expire via their TTL.
@z

@x
usage: sbx prune [flags]
@y
usage: sbx prune [flags]
@z

% options:

@x dry-run
      usage: |
        List the sandboxes that would be removed without removing them
@y
      usage: |
        List the sandboxes that would be removed without removing them
@z

@x filter
      usage: |
        Filter candidates (supported: until=TIMESTAMP — stopped before TIMESTAMP)
@y
      usage: |
        Filter candidates (supported: until=TIMESTAMP — stopped before TIMESTAMP)
@z

@x force
      usage: |
        Skip confirmation prompts and remove even if in use (e.g. an open SSH connection)
@y
      usage: |
        Skip confirmation prompts and remove even if in use (e.g. an open SSH connection)
@z

@x help
      usage: help for prune
@y
      usage: help for prune
@z

@x json
      usage: Output the --dry-run listing in JSON format
@y
      usage: Output the --dry-run listing in JSON format
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
