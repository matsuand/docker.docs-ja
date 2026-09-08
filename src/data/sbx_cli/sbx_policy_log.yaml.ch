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
@y
    Displays which hosts were allowed or blocked by the proxy, along with the
    matching rule, proxy type, and request count. Useful for debugging connectivity
    issues or auditing network activity.
@z

@x
usage: sbx policy log [SANDBOX] [flags]
@y
usage: sbx policy log [SANDBOX] [flags]
@z

% options:

@x help
      usage: help for log
@y
      usage: help for log
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x limit
      usage: Maximum number of log entries to show
@y
      usage: Maximum number of log entries to show
@z

@x quiet
      usage: Only display log entries
@y
      usage: Only display log entries
@z

@x type
      usage: |
        Filter logs by type: "all", "network", or "filesystem" (filesystem logs are not supported yet; default "all")
@y
      usage: |
        Filter logs by type: "all", "network", or "filesystem" (filesystem logs are not supported yet; default "all")
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Show all policy logs
      sbx policy log
@y
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
@y
      # Show the last 20 entries
      sbx policy log --limit 20
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
