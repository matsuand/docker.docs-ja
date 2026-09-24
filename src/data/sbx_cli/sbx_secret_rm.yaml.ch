%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [SERVICE] [flags]
@y
name: sbx secret rm
synopsis: Remove a secret
usage: sbx secret rm [SERVICE] [flags]
@z

% options:

@x all-sandboxes
      usage: |
        Remove registry credentials injected into every sandbox (requires --registry)
@y
      usage: |
        Remove registry credentials injected into every sandbox (requires --registry)
@z

@x force
      usage: Delete without confirmation prompt
@y
      usage: Delete without confirmation prompt
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

@x sandbox
      usage: |
        Scope the removal to one sandbox (default: all scopes when choosing interactively, global with SERVICE)
@y
      usage: |
        Scope the removal to one sandbox (default: all scopes when choosing interactively, global with SERVICE)
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Choose an existing secret to remove with the arrow keys
      sbx secret rm
@y
example: |4-
      # Choose an existing secret to remove with the arrow keys
      sbx secret rm
@z

@x
      # Remove a global secret
      sbx secret rm github
@y
      # Remove a global secret
      sbx secret rm github
@z

@x
      # Remove a sandbox-scoped secret
      sbx secret rm openai --sandbox my-sandbox
@y
      # Remove a sandbox-scoped secret
      sbx secret rm openai --sandbox my-sandbox
@z

@x
      # Remove without confirmation prompt
      sbx secret rm github -f
@y
      # Remove without confirmation prompt
      sbx secret rm github -f
@z

@x
      # Remove OpenAI or Anthropic credential(s) from global scope (OAuth and/or API key)
      sbx secret rm openai
      sbx secret rm anthropic
@y
      # Remove OpenAI or Anthropic credential(s) from global scope (OAuth and/or API key)
      sbx secret rm openai
      sbx secret rm anthropic
@z

@x
      # Remove custom secret by specifying the placeholder value
      sbx secret rm --placeholder docker-placeholder-value
@y
      # Remove custom secret by specifying the placeholder value
      sbx secret rm --placeholder docker-placeholder-value
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
      sbx secret rm --all-sandboxes --registry ghcr.io -f
@y
      # Remove only the global (all-sandboxes) registry credential
      sbx secret rm --all-sandboxes --registry ghcr.io -f
@z

@x
      # Remove a cloud custom secret by its name, or by a host it routes
      sbx --cloud secret rm api-example-com
      sbx --cloud secret rm --host api.example.com
@y
      # Remove a cloud custom secret by its name, or by a host it routes
      sbx --cloud secret rm api-example-com
      sbx --cloud secret rm --host api.example.com
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
