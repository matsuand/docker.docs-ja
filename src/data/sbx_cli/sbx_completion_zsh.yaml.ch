%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx completion zsh
synopsis: Generate the autocompletion script for zsh
description: |
    Generate the autocompletion script for the zsh shell.
@y
name: sbx completion zsh
synopsis: Generate the autocompletion script for zsh
description: |
    Generate the autocompletion script for the zsh shell.
@z

@x
    If shell completion is not already enabled in your environment you will need
    to enable it.  You can execute the following once:
@y
    If shell completion is not already enabled in your environment you will need
    to enable it.  You can execute the following once:
@z

@x
    	echo "autoload -U compinit; compinit" >> ~/.zshrc
@y
    	echo "autoload -U compinit; compinit" >> ~/.zshrc
@z

@x
    To load completions in your current shell session:
@y
    To load completions in your current shell session:
@z

@x
    	source <(sbx completion zsh)
@y
    	source <(sbx completion zsh)
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
    	sbx completion zsh > "${fpath[1]}/_sbx"
@y
    	sbx completion zsh > "${fpath[1]}/_sbx"
@z

@x
    #### macOS:
@y
    #### macOS:
@z

@x
    	sbx completion zsh > $(brew --prefix)/share/zsh/site-functions/_sbx
@y
    	sbx completion zsh > $(brew --prefix)/share/zsh/site-functions/_sbx
@z

@x
    You will need to start a new shell for this setup to take effect.
usage: sbx completion zsh [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for zsh
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
usage: sbx completion zsh [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for zsh
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
