%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills rm
synopsis: Remove installed skills
experimental: true
description: |-
    Remove one or more installed skills from Docker Sandboxes.
@y
name: sbx skills rm
synopsis: Remove installed skills
experimental: true
description: |-
    Remove one or more installed skills from Docker Sandboxes.
@z

@x
    Running agents may be reading installed skills. Removal cannot be undone and
    requires confirmation; use --force to skip confirmation in scripts.
@y
    Running agents may be reading installed skills. Removal cannot be undone and
    requires confirmation; use --force to skip confirmation in scripts.
@z

@x
usage: sbx skills rm <skill>... [flags]
@y
usage: sbx skills rm <skill>... [flags]
@z

% options:

@x force
      usage: Skip confirmation prompts
@y
      usage: Skip confirmation prompts
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
    - sbx skills - (Experimental) Manage skills available in sandboxes
@y
    - sbx skills - (Experimental) Manage skills available in sandboxes
@z
