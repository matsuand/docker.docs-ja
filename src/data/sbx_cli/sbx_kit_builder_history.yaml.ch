%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit builder history
synopsis: Inspect kit build history in the builder sandbox
experimental: true
description: |-
    Inspect kit build history in the builder sandbox.
@y
name: sbx kit builder history
synopsis: Inspect kit build history in the builder sandbox
experimental: true
description: |-
    Inspect kit build history in the builder sandbox.
@z

@x
    Each subcommand runs the matching docker buildx history command inside
    the builder sandbox, against the buildx instance kit builds use. Flags
    and arguments pass through verbatim.
@y
    Each subcommand runs the matching docker buildx history command inside
    the builder sandbox, against the buildx instance kit builds use. Flags
    and arguments pass through verbatim.
@z

@x
usage: sbx kit builder history COMMAND
@y
usage: sbx kit builder history COMMAND
@z

% options:

@x help
      usage: help for history
@y
      usage: help for history
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
    - sbx kit builder - Manage the kit builder sandbox
    - sbx kit builder history export - Export a kit build record into a bundle
    - sbx kit builder history inspect - Inspect a kit build record
    - sbx kit builder history logs - Print a kit build's logs
    - sbx kit builder history ls - List kit build records
    - sbx kit builder history rm - Remove kit build records
    - sbx kit builder history trace - Show the execution trace of a kit build
@y
    - sbx kit builder - Manage the kit builder sandbox
    - sbx kit builder history export - Export a kit build record into a bundle
    - sbx kit builder history inspect - Inspect a kit build record
    - sbx kit builder history logs - Print a kit build's logs
    - sbx kit builder history ls - List kit build records
    - sbx kit builder history rm - Remove kit build records
    - sbx kit builder history trace - Show the execution trace of a kit build
@z
