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
    Skills are shared across sandboxes by default: the store's entries are linked
    into the agent's skills directory read-only, which stays writable so kits can
    install skills beside them. Linking happens at container start, so editing an
    existing skill is live through the link, while adding a store entry reaches a
    running sandbox only on its next start. Removing one takes effect immediately:
    the link in a running sandbox stops resolving at once, and the next start is
    what clears the stale link away. Use --skills=off when creating a sandbox to
    opt out, or --skills=readwrite to mount the store over that directory so the
    sandbox's own writes are shared.
@y
    Skills are shared across sandboxes by default: the store's entries are linked
    into the agent's skills directory read-only, which stays writable so kits can
    install skills beside them. Linking happens at container start, so editing an
    existing skill is live through the link, while adding a store entry reaches a
    running sandbox only on its next start. Removing one takes effect immediately:
    the link in a running sandbox stops resolving at once, and the next start is
    what clears the stale link away. Use --skills=off when creating a sandbox to
    opt out, or --skills=readwrite to mount the store over that directory so the
    sandbox's own writes are shared.
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
