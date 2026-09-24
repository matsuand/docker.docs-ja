%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx attach
synopsis: |
    Attach to a cloud sandbox, starting it first if it is stopped
description: |-
    Attach an interactive terminal session to a cloud sandbox.
@y
name: sbx attach
synopsis: |
    Attach to a cloud sandbox, starting it first if it is stopped
description: |-
    Attach an interactive terminal session to a cloud sandbox.
@z

@x
    SANDBOX is the cloud sandbox ID (sbx_*) or name from "sbx --cloud ls".
@y
    SANDBOX is the cloud sandbox ID (sbx_*) or name from "sbx --cloud ls".
@z

@x
    Opens a PTY-backed exec session against the sandbox's agent process. The
    sandbox must already exist; a stopped one is started first. Use
    `sbx --cloud run` to create a sandbox and attach in one step.
@y
    Opens a PTY-backed exec session against the sandbox's agent process. The
    sandbox must already exist; a stopped one is started first. Use
    `sbx --cloud run` to create a sandbox and attach in one step.
@z

@x
    Only supported with --cloud. See https://docs.docker.com/ai/sandboxes/ for the cloud sandbox model.
@y
    Only supported with --cloud. See https://docs.docker.com/ai/sandboxes/ for the cloud sandbox model.
@z

@x
usage: sbx attach SANDBOX [flags]
@y
usage: sbx attach SANDBOX [flags]
@z

% options:

@x detach-keys
      usage: |
        Override the detach gesture that leaves the session running (Docker-style, e.g. "ctrl-\", "ctrl-x,ctrl-d"). Default: Ctrl-\. Use this when the default collides with an agent's keymap (cloud only).
@y
      usage: |
        Override the detach gesture that leaves the session running (Docker-style, e.g. "ctrl-\", "ctrl-x,ctrl-d"). Default: Ctrl-\. Use this when the default collides with an agent's keymap (cloud only).
@z

@x help
      usage: help for attach
@y
      usage: help for attach
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
      # Attach to a sandbox by ID or name
      sbx --cloud attach sbx_abc123
      sbx --cloud attach claude/my-sandbox
@y
example: |4-
      # Attach to a sandbox by ID or name
      sbx --cloud attach sbx_abc123
      sbx --cloud attach claude/my-sandbox
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
