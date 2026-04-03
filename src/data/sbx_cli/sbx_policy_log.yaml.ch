%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy log
synopsis: Show sandbox policy logs
description: |-
    Show policy logs for all sandboxes, or filter by a specific sandbox name.
@y
name: sbx policy log
synopsis: Show sandbox policy logs
description: |-
    Show policy logs for all sandboxes, or filter by a specific sandbox name.
@z

@x
    Displays which hosts were allowed or blocked by the proxy, along with the
    matching rule, proxy type, and request count. Useful for debugging connectivity
    issues or auditing network activity.
usage: sbx policy log [SANDBOX] [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for log
    - name: json
      default_value: "false"
      usage: Output in JSON format
    - name: limit
      default_value: "0"
      usage: Maximum number of log entries to show
    - name: quiet
      shorthand: q
      default_value: "false"
      usage: Only display log entries
    - name: type
      default_value: all
      usage: 'Filter logs by type: "all" or "network" (default "all")'
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Show all policy logs
      sbx policy log
@y
    Displays which hosts were allowed or blocked by the proxy, along with the
    matching rule, proxy type, and request count. Useful for debugging connectivity
    issues or auditing network activity.
usage: sbx policy log [SANDBOX] [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for log
    - name: json
      default_value: "false"
      usage: Output in JSON format
    - name: limit
      default_value: "0"
      usage: Maximum number of log entries to show
    - name: quiet
      shorthand: q
      default_value: "false"
      usage: Only display log entries
    - name: type
      default_value: all
      usage: 'Filter logs by type: "all" or "network" (default "all")'
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Show all policy logs
      sbx policy log
@z

@x
      # Show logs for a specific sandbox
      sbx policy log my-sandbox
@y
      # Show logs for a specific sandbox
      sbx policy log my-sandbox
@z

@x
      # Output in JSON format
      sbx policy log --json
@y
      # Output in JSON format
      sbx policy log --json
@z

@x
      # Show the last 20 entries
      sbx policy log --limit 20
see_also:
    - sbx policy - Manage sandbox policies
@y
      # Show the last 20 entries
      sbx policy log --limit 20
see_also:
    - sbx policy - Manage sandbox policies
@z
