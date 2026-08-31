%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy allow
synopsis: Add an allow rule for sandboxes
description: |-
    Add a rule that permits sandboxes to access specified resources.
@y
name: sbx policy allow
synopsis: Add an allow rule for sandboxes
description: |-
    Add a rule that permits sandboxes to access specified resources.
@z

@x
    Allowed resources are accessible within the selected policy scope. If a
    resource matches both an allow and a deny rule, the deny rule takes
    precedence.
@y
    Allowed resources are accessible within the selected policy scope. If a
    resource matches both an allow and a deny rule, the deny rule takes
    precedence.
@z

@x
usage: sbx policy allow COMMAND
@y
usage: sbx policy allow COMMAND
@z

% options:

@x help
      usage: help for allow
@y
      usage: help for allow
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
    - sbx policy allow network - Allow network access to specified hosts
@y
    - sbx policy - Manage sandbox policies
    - sbx policy allow network - Allow network access to specified hosts
@z
