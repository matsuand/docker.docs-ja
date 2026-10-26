%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills import
synopsis: Import skills from supported agent directories
experimental: true
description: |-
    Import skills installed for supported coding agents on this machine.
    Directories are checked in order:
@y
name: sbx skills import
synopsis: Import skills from supported agent directories
experimental: true
description: |-
    Import skills installed for supported coding agents on this machine.
    Directories are checked in order:
@z

@x
    1. ~/.agents/skills
    2. ~/.claude/skills
    3. ~/.config/opencode/skills
    4. ~/.copilot/skills
    5. ~/.cursor/skills
    6. ~/.factory/skills
@y
    1. ~/.agents/skills
    2. ~/.claude/skills
    3. ~/.config/opencode/skills
    4. ~/.copilot/skills
    5. ~/.cursor/skills
    6. ~/.factory/skills
@z

@x
    The first copy of each skill is used. Importing replaces an existing skill
    completely, including removing obsolete files; --force skips confirmation.
    Top-level directory symlinks are followed; symlinks within skills are skipped.
@y
    The first copy of each skill is used. Importing replaces an existing skill
    completely, including removing obsolete files; --force skips confirmation.
    Top-level directory symlinks are followed; symlinks within skills are skipped.
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
