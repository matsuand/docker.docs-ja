%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx volume inspect
synopsis: Show details for a volume
usage: sbx volume inspect NAME [flags]
@y
name: sbx volume inspect
synopsis: Show details for a volume
usage: sbx volume inspect NAME [flags]
@z

% options:

@x help
      usage: help for inspect
@y
      usage: help for inspect
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
example: '  sbx --cloud volume inspect my-cache'
@y
example: '  sbx --cloud volume inspect my-cache'
@z

% see_also:

@x
    - sbx volume - Manage persistent volumes (cloud-only)
@y
    - sbx volume - Manage persistent volumes (cloud-only)
@z
