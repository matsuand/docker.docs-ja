%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx inspect
synopsis: Show details for a sandbox
description: |-
    Show a human-readable summary of a sandbox: its agent, kits, state, auth mode, workspace and mounts, network policy, secrets, published ports, and active sessions.
@y
name: sbx inspect
synopsis: Show details for a sandbox
description: |-
    Show a human-readable summary of a sandbox: its agent, kits, state, auth mode, workspace and mounts, network policy, secrets, published ports, and active sessions.
@z

@x
    With --cloud, SANDBOX is the cloud sandbox ID (sbx_*) or name from
    "sbx --cloud ls", and the summary reports what the cloud records: template,
    sizing, timeout behavior, and the URL each published port is reached at.
@y
    With --cloud, SANDBOX is the cloud sandbox ID (sbx_*) or name from
    "sbx --cloud ls", and the summary reports what the cloud records: template,
    sizing, timeout behavior, and the URL each published port is reached at.
@z

@x
usage: sbx inspect SANDBOX [flags]
@y
usage: sbx inspect SANDBOX [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for inspect
@y
      usage: help for inspect
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
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

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

@x
example: |4-
      sbx inspect my-sandbox
      sbx inspect my-sandbox --format json
@y
example: |4-
      sbx inspect my-sandbox
      sbx inspect my-sandbox --format json
@z

@x
      sbx --cloud inspect my-sandbox
      sbx --cloud inspect my-sandbox --format json
@y
      sbx --cloud inspect my-sandbox
      sbx --cloud inspect my-sandbox --format json
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
