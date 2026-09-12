%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills import
synopsis: Import skills from supported agent directories
experimental: true
description: |-
    Import skills already installed for supported coding agents on this
    machine.
@y
name: sbx skills import
synopsis: Import skills from supported agent directories
experimental: true
description: |-
    Import skills already installed for supported coding agents on this
    machine.
@z

@x
    The following directories are checked in order:
      ~/.agents/skills
      ~/.claude/skills
      ~/.config/opencode/skills
      ~/.copilot/skills
      ~/.cursor/skills
      ~/.factory/skills
@y
    The following directories are checked in order:
      ~/.agents/skills
      ~/.claude/skills
      ~/.config/opencode/skills
      ~/.copilot/skills
      ~/.cursor/skills
      ~/.factory/skills
@z

@x
    When the same skill appears in more than one directory, the first copy is used
    and the others are skipped with a warning.
@y
    When the same skill appears in more than one directory, the first copy is used
    and the others are skipped with a warning.
@z

@x
    Importing a skill that is already installed replaces it completely, including
    removing files that are no longer present. You will be prompted before a skill
    is replaced; use --force to skip all prompts.
@y
    Importing a skill that is already installed replaces it completely, including
    removing files that are no longer present. You will be prompted before a skill
    is replaced; use --force to skip all prompts.
@z

@x
    Symlinks at the top level are followed if they point to a directory. Symlinks
    within skill folders and loose files at the top level are skipped.
@y
    Symlinks at the top level are followed if they point to a directory. Symlinks
    within skill folders and loose files at the top level are skipped.
@z

@x
    Imported skills are available to Claude, Codex, Copilot, Cursor, Droid, and
    OpenCode.
@y
    Imported skills are available to Claude, Codex, Copilot, Cursor, Droid, and
    OpenCode.
@z

@x
usage: sbx skills import [flags]
@y
usage: sbx skills import [flags]
@z

% options:

@x dry-run
      usage: |
        Preview which skills would be imported without copying anything
@y
      usage: |
        Preview which skills would be imported without copying anything
@z

@x force
      usage: Overwrite existing skills without prompting
@y
      usage: Overwrite existing skills without prompting
@z

@x help
      usage: help for import
@y
      usage: help for import
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
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
