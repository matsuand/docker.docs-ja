%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret set
synopsis: Create or update a secret
description: |-
    Create or update a secret for a service or registry.
@y
name: sbx secret set
synopsis: Create or update a secret
description: |-
    Create or update a secret for a service or registry.
@z

@x
    Available services: anthropic, aws, bedrock, cursor, droid, github, google, groq, mistral, nebius, openai, xai
@y
    Available services: anthropic, aws, bedrock, cursor, droid, github, google, groq, mistral, nebius, openai, xai
@z

@x
    When no arguments are provided, an interactive prompt guides you through
    scope and service selection.
@y
    When no arguments are provided, an interactive prompt guides you through
    scope and service selection.
@z

@x
    Use --registry to store pull credentials for a container registry:
      Without -g: host-only — used for template/kit pulls, not injected into sandboxes.
      With -g:    global   — host pulls AND written as ~/.docker/config.json in every new sandbox.
      With SANDBOX as the first argument: scoped to that specific sandbox only.
@y
    Use --registry to store pull credentials for a container registry:
      Without -g: host-only — used for template/kit pulls, not injected into sandboxes.
      With -g:    global   — host pulls AND written as ~/.docker/config.json in every new sandbox.
      With SANDBOX as the first argument: scoped to that specific sandbox only.
@z

@x
usage: sbx secret set [-g | SANDBOX] [SERVICE] [flags]
@y
usage: sbx secret set [-g | SANDBOX] [SERVICE] [flags]
@z

% options:

@x force
      usage: Overwrite an existing secret when --token is used
@y
      usage: Overwrite an existing secret when --token is used
@z

@x global
      usage: Use global secret scope
@y
      usage: Use global secret scope
@z

@x help
      usage: help for set
@y
      usage: help for set
@z

@x oauth
      usage: Start OAuth flow and store OAuth tokens (openai/global only)
@y
      usage: Start OAuth flow and store OAuth tokens (openai/global only)
@z

@x password-stdin
      usage: |
        Read registry password or token from stdin (use with --registry)
@y
      usage: |
        Read registry password or token from stdin (use with --registry)
@z

@x registry
      usage: Registry hostname for pull credentials (e.g. ghcr.io)
@y
      usage: Registry hostname for pull credentials (e.g. ghcr.io)
@z

@x token
      usage: 'Secret value (less secure: visible in shell history)'
@y
      usage: 'Secret value (less secure: visible in shell history)'
@z

@x username
      usage: |
        Registry username (use with --registry; omit for token-only auth)
@y
      usage: |
        Registry username (use with --registry; omit for token-only auth)
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Store a GitHub token globally (available to all sandboxes)
      sbx secret set -g github
@y
example: |4-
      # Store a GitHub token globally (available to all sandboxes)
      sbx secret set -g github
@z

@x
      # Store an OpenAI key for a specific sandbox
      sbx secret set my-sandbox openai
@y
      # Store an OpenAI key for a specific sandbox
      sbx secret set my-sandbox openai
@z

@x
      # Non-interactive via stdin (e.g., from a secret manager or env var)
      echo "$ANTHROPIC_API_KEY" | sbx secret set -g anthropic
@y
      # Non-interactive via stdin (e.g., from a secret manager or env var)
      echo "$ANTHROPIC_API_KEY" | sbx secret set -g anthropic
@z

@x
      # Start OpenAI OAuth flow and store global OAuth tokens
      sbx secret set -g openai --oauth
@y
      # Start OpenAI OAuth flow and store global OAuth tokens
      sbx secret set -g openai --oauth
@z

@x
      # Registry: host-only (template/kit pulls, not injected into sandboxes)
      gh auth token | sbx secret set --registry ghcr.io --password-stdin
@y
      # Registry: host-only (template/kit pulls, not injected into sandboxes)
      gh auth token | sbx secret set --registry ghcr.io --password-stdin
@z

@x
      # Registry: global (host pulls + injected into every new sandbox)
      gh auth token | sbx secret set -g --registry ghcr.io --password-stdin
@y
      # Registry: global (host pulls + injected into every new sandbox)
      gh auth token | sbx secret set -g --registry ghcr.io --password-stdin
@z

@x
      # Registry: specific sandbox only
      gh auth token | sbx secret set my-sandbox --registry ghcr.io --password-stdin
@y
      # Registry: specific sandbox only
      gh auth token | sbx secret set my-sandbox --registry ghcr.io --password-stdin
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
