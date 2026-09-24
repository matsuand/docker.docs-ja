%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx settings set
synopsis: Set a setting override
description: |-
    Set a user override for a setting.
@y
name: sbx settings set
synopsis: Set a setting override
description: |-
    Set a user override for a setting.
@z

@x
    The value is parsed according to the setting's type:
      bool   "true" or "false"
      int    integer value
      float  floating-point value
      string plain text
      json   raw JSON
@y
    The value is parsed according to the setting's type:
      bool   "true" or "false"
      int    integer value
      float  floating-point value
      string plain text
      json   raw JSON
@z

@x
    Environment variables take precedence over user overrides.
@y
    Environment variables take precedence over user overrides.
@z

@x
    Most changes take effect within about five seconds. If a daemon restart is
    required, this command tells you to run 'sbx daemon restart'.
@y
    Most changes take effect within about five seconds. If a daemon restart is
    required, this command tells you to run 'sbx daemon restart'.
@z

@x
usage: sbx settings set <key> <value> [flags]
@y
usage: sbx settings set <key> <value> [flags]
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
