%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx diagnose
synopsis: Diagnose common issues with your sbx installation
usage: sbx diagnose [flags]
@y
name: sbx diagnose
synopsis: Diagnose common issues with your sbx installation
usage: sbx diagnose [flags]
@z

% options:

@x
    - name: format
      usage: 'Output format: table, json, yaml or github-issue'
@y
    - name: format
      usage: 'Output format: table, json, yaml or github-issue'
@z

@x help
      usage: help for diagnose
@y
      usage: help for diagnose
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x upload
      usage: Upload diagnostics to Docker support
@y
      usage: Upload diagnostics to Docker support
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

@x
example: |4-
      sbx diagnose
@y
example: |4-
      sbx diagnose
@z

@x
      # Print the report as JSON
      sbx diagnose --format json
@y
      # Print the report as JSON
      sbx diagnose --format json
@z

@x
      # Upload the report to Docker support
      sbx diagnose --upload
@y
      # Upload the report to Docker support
      sbx diagnose --upload
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
