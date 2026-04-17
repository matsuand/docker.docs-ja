%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [-g | sandbox] [service] [flags]
options:
    - name: force
      shorthand: f
      default_value: "false"
      usage: Delete without confirmation prompt
    - name: global
      shorthand: g
      default_value: "false"
      usage: Use global secret scope
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for rm
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Remove a global secret
      sbx secret rm -g github
@y
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [-g | sandbox] [service] [flags]
options:
    - name: force
      shorthand: f
      default_value: "false"
      usage: Delete without confirmation prompt
    - name: global
      shorthand: g
      default_value: "false"
      usage: Use global secret scope
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for rm
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Remove a global secret
      sbx secret rm -g github
@z

@x
      # Remove a sandbox-scoped secret
      sbx secret rm my-sandbox openai
@y
      # Remove a sandbox-scoped secret
      sbx secret rm my-sandbox openai
@z

@x
      # Remove without confirmation prompt
      sbx secret rm -g github -f
@y
      # Remove without confirmation prompt
      sbx secret rm -g github -f
@z

@x
      # Remove OpenAI or Anthropic credential(s) from global scope (OAuth and/or API key)
      sbx secret rm -g openai
      sbx secret rm -g anthropic
see_also:
    - sbx secret - Manage stored secrets
@y
      # Remove OpenAI or Anthropic credential(s) from global scope (OAuth and/or API key)
      sbx secret rm -g openai
      sbx secret rm -g anthropic
see_also:
    - sbx secret - Manage stored secrets
@z
