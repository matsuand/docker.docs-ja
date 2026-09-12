%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx ttl
synopsis: Inspect or extend a cloud sandbox's TTL
description: |-
    Inspect or extend a cloud sandbox's TTL.
@y
name: sbx ttl
synopsis: Inspect or extend a cloud sandbox's TTL
description: |-
    Inspect or extend a cloud sandbox's TTL.
@z

@x
    With one argument, prints the current expiration and the maximum
    remaining time before the sandbox's hard 24h-from-creation ceiling.
@y
    With one argument, prints the current expiration and the maximum
    remaining time before the sandbox's hard 24h-from-creation ceiling.
@z

@x
    With two arguments — a duration prefixed with '+' followed by a sandbox
    ID or name — extends the TTL by that amount, subject to the server-enforced
    ceiling. The server cannot shorten an expiration, so DURATION must be
    positive.
@y
    With two arguments — a duration prefixed with '+' followed by a sandbox
    ID or name — extends the TTL by that amount, subject to the server-enforced
    ceiling. The server cannot shorten an expiration, so DURATION must be
    positive.
@z

@x
    SANDBOX may be given by ID (sbx_*) or name, as shown by "sbx --cloud ls".
@y
    SANDBOX may be given by ID (sbx_*) or name, as shown by "sbx --cloud ls".
@z

@x
    Cloud-only: local sandboxes are not TTL-managed.
@y
    Cloud-only: local sandboxes are not TTL-managed.
@z

@x
usage: sbx ttl [+DURATION] SANDBOX
@y
usage: sbx ttl [+DURATION] SANDBOX
@z

% options:

@x help
      usage: help for ttl
@y
      usage: help for ttl
@z

@x json
      usage: Output as JSON
@y
      usage: Output as JSON
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
