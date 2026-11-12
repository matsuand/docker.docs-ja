%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy approval respond
synopsis: Respond to a pending approval
description: |-
    Respond to a pending approval using one of its offered options.
@y
name: sbx policy approval respond
synopsis: Respond to a pending approval
description: |-
    Respond to a pending approval using one of its offered options.
@z

@x
    Use "sbx policy approval inspect APPROVAL-ID" to review the request and
    option IDs before responding. An approval that has already been answered
    or is no longer pending cannot be answered again.
@y
    Use "sbx policy approval inspect APPROVAL-ID" to review the request and
    option IDs before responding. An approval that has already been answered
    or is no longer pending cannot be answered again.
@z

@x
    After granting access, retry the blocked operation.
@y
    After granting access, retry the blocked operation.
@z

@x
usage: sbx policy approval respond APPROVAL-ID --option OPTION-ID [flags]
@y
usage: sbx policy approval respond APPROVAL-ID --option OPTION-ID [flags]
@z

% options:

@x help
      usage: help for respond
@y
      usage: help for respond
@z

@x option
      usage: Option ID offered by the approval
@y
      usage: Option ID offered by the approval
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
example: |4-
      sbx policy approval inspect APPROVAL-ID
      sbx policy approval respond APPROVAL-ID --option OPTION-ID
@y
example: |4-
      sbx policy approval inspect APPROVAL-ID
      sbx policy approval respond APPROVAL-ID --option OPTION-ID
@z

% see_also:

@x
    - sbx policy approval - Review and respond to pending approvals
@y
    - sbx policy approval - Review and respond to pending approvals
@z
