%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx completion bash
synopsis: Generate the autocompletion script for bash
description: |
    Generate the autocompletion script for the bash shell.
@y
name: sbx completion bash
synopsis: Generate the autocompletion script for bash
description: |
    Generate the autocompletion script for the bash shell.
@z

@x
    This script depends on the 'bash-completion' package.
    If it is not installed already, you can install it via your OS's package manager.
@y
    This script depends on the 'bash-completion' package.
    If it is not installed already, you can install it via your OS's package manager.
@z

@x
    To load completions in your current shell session:
@y
    To load completions in your current shell session:
@z

@x
    	source <(sbx completion bash)
@y
    	source <(sbx completion bash)
@z

@x
    To load completions for every new session, execute once:
@y
    To load completions for every new session, execute once:
@z

@x
    #### Linux:
@y
    #### Linux:
@z

@x
    	sbx completion bash > /etc/bash_completion.d/sbx
@y
    	sbx completion bash > /etc/bash_completion.d/sbx
@z

@x
    #### macOS:
@y
    #### macOS:
@z

@x
    	sbx completion bash > $(brew --prefix)/etc/bash_completion.d/sbx
@y
    	sbx completion bash > $(brew --prefix)/etc/bash_completion.d/sbx
@z

@x
    You will need to start a new shell for this setup to take effect.
@y
    You will need to start a new shell for this setup to take effect.
@z

@x
usage: sbx completion bash
@y
usage: sbx completion bash
@z

% options:

@x help
      usage: help for bash
@y
      usage: help for bash
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
