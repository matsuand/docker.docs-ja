%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy deny
synopsis: Add a deny policy for sandboxes
description: |-
    Add a policy that blocks sandboxes from accessing specified resources.
@y
name: sbx policy deny
synopsis: Add a deny policy for sandboxes
description: |-
    Add a policy that blocks sandboxes from accessing specified resources.
@z

@x
    Deny rules always take precedence over allow rules. If a resource matches
    both an allow and a deny rule, the request is blocked.
usage: sbx policy deny COMMAND
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for deny
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@y
    Deny rules always take precedence over allow rules. If a resource matches
    both an allow and a deny rule, the request is blocked.
usage: sbx policy deny COMMAND
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for deny
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@z
