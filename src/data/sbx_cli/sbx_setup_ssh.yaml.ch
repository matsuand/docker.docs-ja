%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx setup ssh
synopsis: Set up SSH client config for the sandbox endpoint
experimental: true
description: |-
    Write a generated SSH config + known_hosts and include it from
    ~/.ssh/config so "ssh <name>.sbx" connects with no prompts. Named app instances
    use "ssh <name>.sbx-<app>" instead. Re-run any time; it's idempotent.
@y
name: sbx setup ssh
synopsis: Set up SSH client config for the sandbox endpoint
experimental: true
description: |-
    Write a generated SSH config + known_hosts and include it from
    ~/.ssh/config so "ssh <name>.sbx" connects with no prompts. Named app instances
    use "ssh <name>.sbx-<app>" instead. Re-run any time; it's idempotent.
@z

@x
    No SSH client key is needed — authentication is handled by the daemon's local
    socket or named pipe (OS user boundary) combined with an active Docker login. Sign in first
    (sbx login). On macOS and Windows, use --auto-create to install the fixed codex.sbx and
    claude.sbx desktop profiles. Sandboxes are created with the standard resource defaults.
@y
    No SSH client key is needed — authentication is handled by the daemon's local
    socket or named pipe (OS user boundary) combined with an active Docker login. Sign in first
    (sbx login). On macOS and Windows, use --auto-create to install the fixed codex.sbx and
    claude.sbx desktop profiles. Sandboxes are created with the standard resource defaults.
@z

@x
usage: sbx setup ssh [flags]
@y
usage: sbx setup ssh [flags]
@z

% options:

@x alias
      usage: ssh_config Host pattern to write
@y
      usage: ssh_config Host pattern to write
@z

@x auto-create
      usage: |
        enable managed Codex and Claude Desktop profiles on macOS and Windows
@y
      usage: |
        enable managed Codex and Claude Desktop profiles on macOS and Windows
@z

@x help
      usage: help for ssh
@y
      usage: help for ssh
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
      sbx setup ssh
      ssh my-sandbox.sbx -- echo hello
@y
example: |4-
      sbx setup ssh
      ssh my-sandbox.sbx -- echo hello
@z

% see_also:

@x
    - sbx setup - (Experimental) Detect host configuration and prepare Docker Sandboxes
    - sbx setup ssh remove - Remove SSH config and desktop targets; keep sandboxes
@y
    - sbx setup - (Experimental) Detect host configuration and prepare Docker Sandboxes
    - sbx setup ssh remove - Remove SSH config and desktop targets; keep sandboxes
@z
