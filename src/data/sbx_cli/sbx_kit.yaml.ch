%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit
synopsis: Manage kit artifacts
experimental: true
description: |-
    Manage kit artifacts.
@y
name: sbx kit
synopsis: Manage kit artifacts
experimental: true
description: |-
    Manage kit artifacts.
@z

@x
    Kits are declarative YAML artifacts that define sandbox agents or extend them
    with additional credentials, network policies, environment variables, startup
    commands, and files.
@y
    Kits are declarative YAML artifacts that define sandbox agents or extend them
    with additional credentials, network policies, environment variables, startup
    commands, and files.
@z

@x
usage: sbx kit COMMAND
@y
usage: sbx kit COMMAND
@z

% options:

@x help
      usage: help for kit
@y
      usage: help for kit
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
    - sbx kit add - Add a mixin to a sandbox
    - sbx kit builder - Manage the kit builder sandbox
    - sbx kit inspect - Display details about a kit artifact
    - sbx kit pack - Package a directory as a kit artifact
    - sbx kit provenance - Show the SLSA provenance attached to a kit
    - sbx kit pull - Pull a kit artifact from an OCI registry
    - sbx kit push - Push a kit artifact to an OCI registry
    - sbx kit sign - Sign a kit artifact
    - sbx kit validate - Validate a kit artifact
    - sbx kit verify - Verify a kit artifact's signature
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx kit add - Add a mixin to a sandbox
    - sbx kit builder - Manage the kit builder sandbox
    - sbx kit inspect - Display details about a kit artifact
    - sbx kit pack - Package a directory as a kit artifact
    - sbx kit provenance - Show the SLSA provenance attached to a kit
    - sbx kit pull - Pull a kit artifact from an OCI registry
    - sbx kit push - Push a kit artifact to an OCI registry
    - sbx kit sign - Sign a kit artifact
    - sbx kit validate - Validate a kit artifact
    - sbx kit verify - Verify a kit artifact's signature
@z
