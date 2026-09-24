%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills add
synopsis: Add skills from a Git repository
experimental: true
description: |-
    Install skills from a Git repository for use in Docker Sandboxes. The
    repository must contain one or more valid SKILL.md files.
@y
name: sbx skills add
synopsis: Add skills from a Git repository
experimental: true
description: |-
    Install skills from a Git repository for use in Docker Sandboxes. The
    repository must contain one or more valid SKILL.md files.
@z

@x
    All discovered skills are installed when --skill is omitted. Use --skill one
    or more times, or pass a comma-separated list, to install only named skills.
    Replacing an installed skill requires confirmation; use --force to skip
    prompts.
@y
    All discovered skills are installed when --skill is omitted. Use --skill one
    or more times, or pass a comma-separated list, to install only named skills.
    Replacing an installed skill requires confirmation; use --force to skip
    prompts.
@z

@x
    The repository can be specified as a Git URL or as GitHub owner/repository
    shorthand. Skills installed with this command can later be refreshed with
    'sbx skills update'.
@y
    The repository can be specified as a Git URL or as GitHub owner/repository
    shorthand. Skills installed with this command can later be refreshed with
    'sbx skills update'.
@z

@x
usage: sbx skills add <repository> [flags]
@y
usage: sbx skills add <repository> [flags]
@z

% options:

@x force
      usage: Overwrite existing skills without prompting
@y
      usage: Overwrite existing skills without prompting
@z

@x help
      usage: help for add
@y
      usage: help for add
@z

@x skill
      usage: Add only the named skill (repeatable or comma-separated)
@y
      usage: Add only the named skill (repeatable or comma-separated)
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

@x
example: |4-
      sbx skills add https://github.com/anthropics/skills --skill frontend-design
      sbx skills add anthropics/skills --skill frontend-design --skill pdf
      sbx skills add https://github.com/anthropics/skills --force
@y
example: |4-
      sbx skills add https://github.com/anthropics/skills --skill frontend-design
      sbx skills add anthropics/skills --skill frontend-design --skill pdf
      sbx skills add https://github.com/anthropics/skills --force
@z

% see_also:

@x
    - sbx skills - (Experimental) Manage skills available in sandboxes
@y
    - sbx skills - (Experimental) Manage skills available in sandboxes
@z
