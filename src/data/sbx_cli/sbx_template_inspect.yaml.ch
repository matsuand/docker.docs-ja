%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template inspect
synopsis: Show full metadata for a single template
description: |-
    Show full metadata for a single template.
@y
name: sbx template inspect
synopsis: Show full metadata for a single template
description: |-
    Show full metadata for a single template.
@z

@x
    NAME|ID can be either a template name (resolved to its ID via the server's
    ?name= filter) or a template ID (tmpl_*).
@y
    NAME|ID can be either a template name (resolved to its ID via the server's
    ?name= filter) or a template ID (tmpl_*).
@z

@x
    Cloud-only in v1: requires --cloud.
@y
    Cloud-only in v1: requires --cloud.
@z

@x
usage: sbx template inspect NAME|ID [flags]
@y
usage: sbx template inspect NAME|ID [flags]
@z

% options:

@x help
      usage: help for inspect
@y
      usage: help for inspect
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
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
      sbx --cloud template inspect my-template
      sbx --cloud template inspect tmpl_abc123
@y
example: |4-
      sbx --cloud template inspect my-template
      sbx --cloud template inspect tmpl_abc123
@z

@x
      # Output in JSON format
      sbx --cloud template inspect my-template --json
@y
      # Output in JSON format
      sbx --cloud template inspect my-template --json
@z

% see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
