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
usage: sbx completion powershell [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for powershell
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
    To load completions for every new session, add the output of the above command
    to your powershell profile.
usage: sbx completion powershell [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for powershell
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
