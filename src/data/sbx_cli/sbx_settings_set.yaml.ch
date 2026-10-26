%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx settings set
synopsis: Set a setting override
description: |-
    Set a user override for a setting. Values are parsed according to the
    setting's type: bool (true or false), int, float, string, or raw JSON.
@y
name: sbx settings set
synopsis: Set a setting override
description: |-
    Set a user override for a setting. Values are parsed according to the
    setting's type: bool (true or false), int, float, string, or raw JSON.
@z

@x
    Administrator constraints apply; conflicting values are rejected.
    Environment variables take precedence over user overrides.
@y
    Administrator constraints apply; conflicting values are rejected.
    Environment variables take precedence over user overrides.
@z

@x
    Most changes take effect within about five seconds. This command reports
    when a daemon restart is required.
@y
    Most changes take effect within about five seconds. This command reports
    when a daemon restart is required.
@z

@x
usage: sbx settings set KEY VALUE [flags]
@y
usage: sbx settings set KEY VALUE [flags]
@z

% options:

@x help
      usage: help for set
@y
      usage: help for set
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
      # Route sandbox, daemon, and CLI egress through an upstream proxy
      sbx settings set proxy http://proxy.example.com:3128
@y
example: |4-
      # Route sandbox, daemon, and CLI egress through an upstream proxy
      sbx settings set proxy http://proxy.example.com:3128
@z

@x
      # Pull template and kit images through a registry mirror
      sbx settings set platform.images.registryMirror artifactory.corp/docker-remote
@y
      # Pull template and kit images through a registry mirror
      sbx settings set platform.images.registryMirror artifactory.corp/docker-remote
@z

% see_also:

@x
    - sbx settings - Manage Docker Sandboxes settings
@y
    - sbx settings - Manage Docker Sandboxes settings
@z
