%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx completion fish
synopsis: Generate the autocompletion script for fish
description: |
    Generate the autocompletion script for the fish shell.
@y
name: sbx completion fish
synopsis: Generate the autocompletion script for fish
description: |
    Generate the autocompletion script for the fish shell.
@z

@x
    To load completions in your current shell session:
@y
    To load completions in your current shell session:
@z

@x
    	sbx completion fish | source
@y
    	sbx completion fish | source
@z

@x
    To load completions for every new session, execute once:
@y
    To load completions for every new session, execute once:
@z

@x
    	sbx completion fish > ~/.config/fish/completions/sbx.fish
@y
    	sbx completion fish > ~/.config/fish/completions/sbx.fish
@z

@x
    You will need to start a new shell for this setup to take effect.
@y
    You will need to start a new shell for this setup to take effect.
@z

@x
usage: sbx completion fish [flags]
@y
usage: sbx completion fish [flags]
@z

% options:

@x help
      usage: help for fish
@y
      usage: help for fish
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
