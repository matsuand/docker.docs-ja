%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy approval inspect
synopsis: Inspect a pending approval
description: |-
    Show the request and available option IDs for a pending approval.
@y
name: sbx policy approval inspect
synopsis: Inspect a pending approval
description: |-
    Show the request and available option IDs for a pending approval.
@z

@x
    Get APPROVAL-ID from "sbx policy approval ls". Only pending approvals
    can be inspected.
@y
    Get APPROVAL-ID from "sbx policy approval ls". Only pending approvals
    can be inspected.
@z

@x
usage: sbx policy approval inspect APPROVAL-ID [flags]
@y
usage: sbx policy approval inspect APPROVAL-ID [flags]
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

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

@x
example: '  sbx policy approval inspect APPROVAL-ID'
@y
example: '  sbx policy approval inspect APPROVAL-ID'
@z

% see_also:

@x
    - sbx policy approval - Review and respond to pending approvals
@y
    - sbx policy approval - Review and respond to pending approvals
@z
