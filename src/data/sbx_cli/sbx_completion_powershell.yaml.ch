%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx completion powershell
synopsis: Generate the autocompletion script for powershell
description: |
    Generate the autocompletion script for powershell.
@y
name: sbx completion powershell
synopsis: Generate the autocompletion script for powershell
description: |
    Generate the autocompletion script for powershell.
@z

@x
    To load completions in your current shell session:
@y
    To load completions in your current shell session:
@z

@x
    	sbx completion powershell | Out-String | Invoke-Expression
@y
    	sbx completion powershell | Out-String | Invoke-Expression
@z

@x
    To load completions for every new session, add the output of the above command
    to your powershell profile.
@y
    To load completions for every new session, add the output of the above command
    to your powershell profile.
@z

@x
usage: sbx completion powershell [flags]
@y
usage: sbx completion powershell [flags]
@z

% options:

@x help
      usage: help for powershell
@y
      usage: help for powershell
@z

@x no-descriptions
      usage: disable completion descriptions
@y
      usage: disable completion descriptions
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
    - sbx completion - Generate the autocompletion script for the specified shell
@y
    - sbx completion - Generate the autocompletion script for the specified shell
@z
