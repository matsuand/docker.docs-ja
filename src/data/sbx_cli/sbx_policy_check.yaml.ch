%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy check
synopsis: Check whether policy allows an access request
description: |-
    Check whether the current sandbox policy would authorize an access request.
@y
name: sbx policy check
synopsis: Check whether policy allows an access request
description: |-
    Check whether the current sandbox policy would authorize an access request.
@z

@x
    The check is read-only and evaluates the same daemon-side policy authorizer
    used by sandbox network enforcement.
@y
    The check is read-only and evaluates the same daemon-side policy authorizer
    used by sandbox network enforcement.
@z

@x
usage: sbx policy check COMMAND
@y
usage: sbx policy check COMMAND
@z

% options:

@x help
      usage: help for check
@y
      usage: help for check
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
    - sbx policy - Manage sandbox policies
    - sbx policy check network - Check network access to a host
@y
    - sbx policy - Manage sandbox policies
    - sbx policy check network - Check network access to a host
@z
