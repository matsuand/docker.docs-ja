%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template ls
synopsis: List template images
description: |
    List all template images stored in the sandbox runtime's image store.
usage: sbx template ls [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ls
    - name: json
      default_value: "false"
      usage: Output in JSON format
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # List all template images
      sbx template ls
@y
name: sbx template ls
synopsis: List template images
description: |
    List all template images stored in the sandbox runtime's image store.
usage: sbx template ls [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ls
    - name: json
      default_value: "false"
      usage: Output in JSON format
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # List all template images
      sbx template ls
@z

@x
      # Output in JSON format
      sbx template ls --json
see_also:
    - sbx template - Manage sandbox templates
@y
      # Output in JSON format
      sbx template ls --json
see_also:
    - sbx template - Manage sandbox templates
@z
