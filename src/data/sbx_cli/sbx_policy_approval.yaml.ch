%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy approval
synopsis: Review and respond to pending approvals
description: |-
    Review and respond to pending approvals from the local daemon.
@y
name: sbx policy approval
synopsis: Review and respond to pending approvals
description: |-
    Review and respond to pending approvals from the local daemon.
@z

@x
    Use "sbx policy approval ls" to find an approval ID, then inspect it to see
    the available options. Respond with an option ID shown by that approval.
@y
    Use "sbx policy approval ls" to find an approval ID, then inspect it to see
    the available options. Respond with an option ID shown by that approval.
@z

@x
    A persistent grant applies to matching requests in the approval's sandbox.
    Retry the blocked operation after granting access. Dismissing an approval
    does not grant access; a later request can prompt again.
@y
    A persistent grant applies to matching requests in the approval's sandbox.
    Retry the blocked operation after granting access. Dismissing an approval
    does not grant access; a later request can prompt again.
@z

@x
usage: sbx policy approval COMMAND
@y
usage: sbx policy approval COMMAND
@z

% options:

@x help
      usage: help for approval
@y
      usage: help for approval
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

% see_also:

@x
    - sbx policy - Manage sandbox policies
    - sbx policy approval inspect - Inspect a pending approval
    - sbx policy approval ls - List pending approvals
    - sbx policy approval respond - Respond to a pending approval
@y
    - sbx policy - Manage sandbox policies
    - sbx policy approval inspect - Inspect a pending approval
    - sbx policy approval ls - List pending approvals
    - sbx policy approval respond - Respond to a pending approval
@z
