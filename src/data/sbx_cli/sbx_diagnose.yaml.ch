%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx diagnose
synopsis: Diagnose common issues with your sbx installation
usage: sbx diagnose
@y
name: sbx diagnose
synopsis: Diagnose common issues with your sbx installation
usage: sbx diagnose
@z

% options:

@x help
      usage: help for diagnose
@y
      usage: help for diagnose
@z

@x json
      usage: Output in JSON format (alias for --output json)
@y
      usage: Output in JSON format (alias for --output json)
@z

@x output
      usage: 'Output format: "json" or "github-issue"'
@y
      usage: 'Output format: "json" or "github-issue"'
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

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
