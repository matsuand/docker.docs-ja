%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills update
synopsis: Update skills added from repositories
experimental: true
description: |-
    Download the latest versions of skills installed with 'sbx skills add'.
@y
name: sbx skills update
synopsis: Update skills added from repositories
experimental: true
description: |-
    Download the latest versions of skills installed with 'sbx skills add'.
@z

@x
    With no names, every skill added from a repository is updated. Specify one or
    more names to update only those skills. Skills installed with 'sbx skills
    import' must be added from a repository before they can be updated.
@y
    With no names, every skill added from a repository is updated. Specify one or
    more names to update only those skills. Skills installed with 'sbx skills
    import' must be added from a repository before they can be updated.
@z

@x
usage: sbx skills update [skill]... [flags]
@y
usage: sbx skills update [skill]... [flags]
@z

% options:

@x help
      usage: help for update
@y
      usage: help for update
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
