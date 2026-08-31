%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy deny
synopsis: Add a deny rule for sandboxes
description: |-
    Add a rule that blocks sandboxes from accessing specified resources.
@y
name: sbx policy deny
synopsis: Add a deny rule for sandboxes
description: |-
    Add a rule that blocks sandboxes from accessing specified resources.
@z

@x
    Deny rules always take precedence over allow rules. If a resource matches
    both an allow and a deny rule, the request is blocked.
@y
    Deny rules always take precedence over allow rules. If a resource matches
    both an allow and a deny rule, the request is blocked.
@z

@x
usage: sbx policy deny COMMAND
@y
usage: sbx policy deny COMMAND
@z

% options:

@x help
      usage: help for deny
@y
      usage: help for deny
@z

% inherited_options:

@x
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@y
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@z
