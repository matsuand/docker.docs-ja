%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit builder
synopsis: Manage the kit builder sandbox
experimental: true
description: |-
    Manage the kit builder sandbox.
@y
name: sbx kit builder
synopsis: Manage the kit builder sandbox
experimental: true
description: |-
    Manage the kit builder sandbox.
@z

@x
    Source-form kit builds (a local directory or git reference) run inside a
    shared builder sandbox named sbx-kit-builder, created on first
    use. Its Docker engine store doubles as the kit build cache, so removing
    the builder is how the cache is reclaimed; the next source-form build
    recreates it.
@y
    Source-form kit builds (a local directory or git reference) run inside a
    shared builder sandbox named sbx-kit-builder, created on first
    use. Its Docker engine store doubles as the kit build cache, so removing
    the builder is how the cache is reclaimed; the next source-form build
    recreates it.
@z

@x
usage: sbx kit builder COMMAND
@y
usage: sbx kit builder COMMAND
@z

% options:

@x help
      usage: help for builder
@y
      usage: help for builder
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
    - sbx kit - (Experimental) Manage kit artifacts
    - sbx kit builder history - Inspect kit build history in the builder sandbox
    - sbx kit builder rm - Remove the kit builder sandbox and its build cache
    - sbx kit builder status - Show the kit builder sandbox and build-cache state
@y
    - sbx kit - (Experimental) Manage kit artifacts
    - sbx kit builder history - Inspect kit build history in the builder sandbox
    - sbx kit builder rm - Remove the kit builder sandbox and its build cache
    - sbx kit builder status - Show the kit builder sandbox and build-cache state
@z
