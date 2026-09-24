%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills
synopsis: Manage skills available in sandboxes
experimental: true
description: |-
    Manage skills available to agents in Docker Sandboxes.
@y
name: sbx skills
synopsis: Manage skills available in sandboxes
experimental: true
description: |-
    Manage skills available to agents in Docker Sandboxes.
@z

@x
    Skills are shared across sandboxes by default, mounted read-only. Use
    --skills=off when creating a sandbox to opt out, or --skills=readwrite to
    mount the store read-write.
@y
    Skills are shared across sandboxes by default, mounted read-only. Use
    --skills=off when creating a sandbox to opt out, or --skills=readwrite to
    mount the store read-write.
@z

@x
usage: sbx skills COMMAND
@y
usage: sbx skills COMMAND
@z

% options:

@x help
      usage: help for skills
@y
      usage: help for skills
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
    - sbx skills add - Add skills from a Git repository
    - sbx skills import - Import skills from supported agent directories
    - sbx skills ls - List installed skills
    - sbx skills rm - Remove installed skills
    - sbx skills update - Update skills added from repositories
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx skills add - Add skills from a Git repository
    - sbx skills import - Import skills from supported agent directories
    - sbx skills ls - List installed skills
    - sbx skills rm - Remove installed skills
    - sbx skills update - Update skills added from repositories
@z
