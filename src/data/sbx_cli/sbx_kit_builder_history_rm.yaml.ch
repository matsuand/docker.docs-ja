%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit builder history rm
synopsis: Remove kit build records
experimental: true
usage: sbx kit builder history rm [ARGS...] [flags]
@y
name: sbx kit builder history rm
synopsis: Remove kit build records
experimental: true
usage: sbx kit builder history rm [ARGS...] [flags]
@z

% options:

@x help
      usage: help for rm
@y
      usage: help for rm
@z

@x "yes"
      usage: |
        Skip confirmation prompt (buildx --force still controls running build records)
@y
      usage: |
        Skip confirmation prompt (buildx --force still controls running build records)
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
    - sbx kit builder history - Inspect kit build history in the builder sandbox
@y
    - sbx kit builder history - Inspect kit build history in the builder sandbox
@z
