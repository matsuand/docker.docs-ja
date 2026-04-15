%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret set
synopsis: Create or update a secret
description: |-
    Create or update a secret for a service.
@y
name: sbx secret set
synopsis: Create or update a secret
description: |-
    Create or update a secret for a service.
@z

@x
    Available services: anthropic, aws, github, google, groq, mistral, nebius, openai, xai
@y
    Available services: anthropic, aws, github, google, groq, mistral, nebius, openai, xai
@z

@x
    When no arguments are provided, an interactive prompt guides you through
    scope and service selection.
@y
    When no arguments are provided, an interactive prompt guides you through
    scope and service selection.
@z

@x
usage: sbx secret set [-g | sandbox] [service] [flags]
@y
usage: sbx secret set [-g | sandbox] [service] [flags]
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

@x token
      usage: 'Secret value (less secure: visible in shell history)'
@y
      usage: 'Secret value (less secure: visible in shell history)'
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

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
