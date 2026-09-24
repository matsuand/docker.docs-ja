%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx daemon log-level set
synopsis: 'Set a category''s log level (target: proxy, general, or all)'
usage: sbx daemon log-level set <target> <level> [flags]
@y
name: sbx daemon log-level set
synopsis: 'Set a category''s log level (target: proxy, general, or all)'
usage: sbx daemon log-level set <target> <level> [flags]
@z

% options:

@x help
      usage: help for set
@y
      usage: help for set
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
    - sbx daemon log-level - Inspect or change sandboxd's per-category log levels
@y
    - sbx daemon log-level - Inspect or change sandboxd's per-category log levels
@z
