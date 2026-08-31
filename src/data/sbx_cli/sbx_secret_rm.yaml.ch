%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [-g | SANDBOX] [SERVICE] [flags]
@y
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [-g | SANDBOX] [SERVICE] [flags]
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

@x registry
      usage: Registry hostname to remove pull credentials for
@y
      usage: Registry hostname to remove pull credentials for
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
      # Remove OpenAI or Anthropic credential(s) from global scope (OAuth and/or API key)
      sbx secret rm -g openai
      sbx secret rm -g anthropic
@y
      # Remove OpenAI or Anthropic credential(s) from global scope (OAuth and/or API key)
      sbx secret rm -g openai
      sbx secret rm -g anthropic
@z

@x
      # Remove registry pull credentials (removes host-only and global entries)
      sbx secret rm --registry ghcr.io -f
@y
      # Remove registry pull credentials (removes host-only and global entries)
      sbx secret rm --registry ghcr.io -f
@z

@x
      # Remove only the global (all-sandboxes) registry credential
      sbx secret rm -g --registry ghcr.io -f
@y
      # Remove only the global (all-sandboxes) registry credential
      sbx secret rm -g --registry ghcr.io -f
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
