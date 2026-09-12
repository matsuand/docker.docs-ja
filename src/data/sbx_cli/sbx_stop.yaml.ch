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
    disk) is preserved, the host is released, and the sandbox keeps its ID.
    Restart it — same ID — by running its agent again ("sbx --cloud run <agent>")
    and picking the stopped sandbox from the prompt. A detached run (--detached)
    creates a new sandbox instead of restarting a stopped one.
@y
    With --cloud, stop suspends each sandbox in place: its full state (memory +
    disk) is preserved, the host is released, and the sandbox keeps its ID.
    Restart it — same ID — by running its agent again ("sbx --cloud run <agent>")
    and picking the stopped sandbox from the prompt. A detached run (--detached)
    creates a new sandbox instead of restarting a stopped one.
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

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
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
