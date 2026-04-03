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
usage: sbx completion fish [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for fish
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
usage: sbx completion fish [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for fish
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
