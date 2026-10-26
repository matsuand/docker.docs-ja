%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy refresh
synopsis: Force an immediate policy refresh
description: |-
    Force sandboxd to fetch and apply governance policy immediately.
@y
name: sbx policy refresh
synopsis: Force an immediate policy refresh
description: |-
    Force sandboxd to fetch and apply governance policy immediately.
@z

@x
    The daemon normally polls for policy changes on a regular interval. Use this
    after changing an org policy setting (for example, toggling AI Governance) so
    the change takes effect without waiting for the next poll. This also
    invalidates the cached registry credential; it never restarts the daemon or
    stops running sandboxes.
@y
    The daemon normally polls for policy changes on a regular interval. Use this
    after changing an org policy setting (for example, toggling AI Governance) so
    the change takes effect without waiting for the next poll. This also
    invalidates the cached registry credential; it never restarts the daemon or
    stops running sandboxes.
@z

@x
    The refreshed policy applies to new connections only. Connections a sandbox
    opened while the previous policy allowed them stay open even if the new
    policy denies them; restart the sandbox to drop them.
@y
    The refreshed policy applies to new connections only. Connections a sandbox
    opened while the previous policy allowed them stay open even if the new
    policy denies them; restart the sandbox to drop them.
@z

@x
usage: sbx policy refresh [flags]
@y
usage: sbx policy refresh [flags]
@z

% options:

@x help
      usage: help for refresh
@y
      usage: help for refresh
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
example: '  sbx policy refresh'
@y
example: '  sbx policy refresh'
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
