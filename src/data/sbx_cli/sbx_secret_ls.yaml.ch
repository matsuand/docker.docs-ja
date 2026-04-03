%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret ls
synopsis: List stored secrets
usage: sbx secret ls [sandbox] [OPTIONS] [flags]
options:
    - name: global
      shorthand: g
      default_value: "false"
      usage: Only list global secrets
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ls
    - name: service
      usage: Filter by secret service name
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # List all secrets
      sbx secret ls
@y
name: sbx secret ls
synopsis: List stored secrets
usage: sbx secret ls [sandbox] [OPTIONS] [flags]
options:
    - name: global
      shorthand: g
      default_value: "false"
      usage: Only list global secrets
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ls
    - name: service
      usage: Filter by secret service name
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # List all secrets
      sbx secret ls
@z

@x
      # List only global secrets
      sbx secret ls -g
@y
      # List only global secrets
      sbx secret ls -g
@z

@x
      # List secrets for a specific sandbox
      sbx secret ls my-sandbox
@y
      # List secrets for a specific sandbox
      sbx secret ls my-sandbox
@z

@x
      # Filter by service
      sbx secret ls --service github
see_also:
    - sbx secret - Manage stored secrets
@y
      # Filter by service
      sbx secret ls --service github
see_also:
    - sbx secret - Manage stored secrets
@z
