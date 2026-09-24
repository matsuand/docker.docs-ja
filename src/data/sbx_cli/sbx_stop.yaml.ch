%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx stop
synopsis: Stop one or more sandboxes without removing them
description: |-
    Stop one or more running sandboxes without removing them. Or — with --cloud — the cloud sandbox
    ID (sbx_*) or name from "sbx --cloud ls".
@y
name: sbx stop
synopsis: Stop one or more sandboxes without removing them
description: |-
    Stop one or more running sandboxes without removing them. Or — with --cloud — the cloud sandbox
    ID (sbx_*) or name from "sbx --cloud ls".
@z

@x
    Stopped sandboxes retain their state and can be restarted with "sbx run".
@y
    Stopped sandboxes retain their state and can be restarted with "sbx run".
@z

@x
    With --cloud, stop suspends each sandbox in place: its full state (memory +
    disk) is preserved, the host is released, and the sandbox keeps its ID. Stop
    returns once the request is accepted. Watch the sandbox reach the stopped
    state with "sbx --cloud ls".
    Restart it — same ID — with "sbx --cloud attach SANDBOX", with
    "sbx --cloud run AGENT --name NAME" (also non-interactively with --detached),
    or by running its agent again and picking it from the prompt.
@y
    With --cloud, stop suspends each sandbox in place: its full state (memory +
    disk) is preserved, the host is released, and the sandbox keeps its ID. Stop
    returns once the request is accepted. Watch the sandbox reach the stopped
    state with "sbx --cloud ls".
    Restart it — same ID — with "sbx --cloud attach SANDBOX", with
    "sbx --cloud run AGENT --name NAME" (also non-interactively with --detached),
    or by running its agent again and picking it from the prompt.
@z

@x
    Stop does not create a template and does not delete the sandbox. To capture
    a durable, shareable template from a running sandbox instead, use
    "sbx --cloud template save SANDBOX TAG" (which leaves the sandbox
    running).
@y
    Stop does not create a template and does not delete the sandbox. To capture
    a durable, shareable template from a running sandbox instead, use
    "sbx --cloud template save SANDBOX TAG" (which leaves the sandbox
    running).
@z

@x
usage: sbx stop SANDBOX [SANDBOX...]
@y
usage: sbx stop SANDBOX [SANDBOX...]
@z

% options:

@x help
      usage: help for stop
@y
      usage: help for stop
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
