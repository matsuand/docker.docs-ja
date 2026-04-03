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
usage: sbx completion bash
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for bash
    - name: no-descriptions
      default_value: "false"
      usage: disable completion descriptions
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx completion - Generate the autocompletion script for the specified shell
@y
    You will need to start a new shell for this setup to take effect.
usage: sbx completion bash
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for bash
    - name: no-descriptions
      default_value: "false"
      usage: disable completion descriptions
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx completion - Generate the autocompletion script for the specified shell
@z
