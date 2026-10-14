%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit builder history logs
synopsis: Show a kit build's logs
experimental: true
usage: sbx kit builder history logs [ARGS...] [flags]
@y
name: sbx kit builder history logs
synopsis: Show a kit build's logs
experimental: true
usage: sbx kit builder history logs [ARGS...] [flags]
@z

% options:

@x help
      usage: help for logs
@y
      usage: help for logs
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
      sbx kit builder history logs
      sbx kit builder history logs 3b6l9x
@y
example: |4-
      sbx kit builder history logs
      sbx kit builder history logs 3b6l9x
@z

% see_also:

@x
    - sbx kit builder history - Show kit build history in the builder sandbox
@y
    - sbx kit builder history - Show kit build history in the builder sandbox
@z
