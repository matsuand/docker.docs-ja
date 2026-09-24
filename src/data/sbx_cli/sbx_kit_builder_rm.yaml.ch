%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit builder rm
synopsis: Remove the kit builder sandbox and its build cache
experimental: true
usage: sbx kit builder rm [flags]
@y
name: sbx kit builder rm
synopsis: Remove the kit builder sandbox and its build cache
experimental: true
usage: sbx kit builder rm [flags]
@z

% options:

@x force
      usage: Skip confirmation prompts and delete even if in use
@y
      usage: Skip confirmation prompts and delete even if in use
@z

@x help
      usage: help for rm
@y
      usage: help for rm
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
@y
    - sbx kit builder - Manage the kit builder sandbox
@z
