%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx setup
synopsis: |
    Detect host configuration and prepare Docker Sandboxes
experimental: true
description: |-
    Detect what is already configured on your host and prepare Docker Sandboxes.
@y
name: sbx setup
synopsis: |
    Detect host configuration and prepare Docker Sandboxes
experimental: true
description: |-
    Detect what is already configured on your host and prepare Docker Sandboxes.
@z

@x
    Agent secrets are detected from the built-in agent kit specs and the
    env vars set on this host, and accepted secrets are imported into the global
    secrets store (the same store as "sbx secret set"). Setup can enable SSH-agent
    forwarding using each client's SSH_AUTH_SOCK, or the native Windows OpenSSH
    agent pipe when that variable is unset. A fixed endpoint can also be configured.
@y
    Agent secrets are detected from the built-in agent kit specs and the
    env vars set on this host, and accepted secrets are imported into the global
    secrets store (the same store as "sbx secret set"). Setup can enable SSH-agent
    forwarding using each client's SSH_AUTH_SOCK, or the native Windows OpenSSH
    agent pipe when that variable is unset. A fixed endpoint can also be configured.
@z

@x
usage: sbx setup [COMMAND]
@y
usage: sbx setup [COMMAND]
@z

% options:

@x help
      usage: help for setup
@y
      usage: help for setup
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
    - sbx setup ssh - Set up SSH client config for the sandbox endpoint
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx setup ssh - Set up SSH client config for the sandbox endpoint
@z
