%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx stop
synopsis: Stop one or more sandboxes without removing them
description: |-
    Stop one or more running sandboxes without removing them.
@y
name: sbx stop
synopsis: Stop one or more sandboxes without removing them
description: |-
    Stop one or more running sandboxes without removing them.
@z

@x
    Stopped sandboxes retain their state and can be restarted with "sbx run".
usage: sbx stop SANDBOX [SANDBOX...]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for stop
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
@y
    Stopped sandboxes retain their state and can be restarted with "sbx run".
usage: sbx stop SANDBOX [SANDBOX...]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for stop
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
@z
