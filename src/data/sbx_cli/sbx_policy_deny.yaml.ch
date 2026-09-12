%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy deny
synopsis: Add a deny rule for sandboxes
description: |-
    Add a rule that blocks sandboxes from accessing specified resources.
@y
name: sbx policy deny
synopsis: Add a deny rule for sandboxes
description: |-
    Add a rule that blocks sandboxes from accessing specified resources.
@z

@x
    Deny rules take precedence over allow rules for the same hostname or CIDR. An
    allowed hostname isn't checked against CIDR rules for its resolved IP address.
@y
    Deny rules take precedence over allow rules for the same hostname or CIDR. An
    allowed hostname isn't checked against CIDR rules for its resolved IP address.
@z

@x
usage: sbx policy deny COMMAND
@y
usage: sbx policy deny COMMAND
@z

% options:

@x help
      usage: help for deny
@y
      usage: help for deny
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

@x
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@y
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@z
