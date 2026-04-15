%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [-g | sandbox] [service] [flags]
@y
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [-g | sandbox] [service] [flags]
@z

% options:

@x force
      usage: Delete without confirmation prompt
@y
      usage: Delete without confirmation prompt
@z

@x global
      usage: Use global secret scope
@y
      usage: Use global secret scope
@z

@x help
      usage: help for rm
@y
      usage: help for rm
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Remove a global secret
      sbx secret rm -g github
@y
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
      # Remove OpenAI credential(s) from global scope
      sbx secret rm -g openai
@y
      # Remove OpenAI credential(s) from global scope
      sbx secret rm -g openai
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
