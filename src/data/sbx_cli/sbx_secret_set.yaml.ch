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
usage: sbx secret set [-g | sandbox] [service] [flags]
options:
    - name: force
      shorthand: f
      default_value: "false"
      usage: Overwrite an existing secret when --token is used
    - name: global
      shorthand: g
      default_value: "false"
      usage: Use global secret scope
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for set
    - name: token
      shorthand: t
      usage: 'Secret value (less secure: visible in shell history)'
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Store a GitHub token globally (available to all sandboxes)
      sbx secret set -g github
@y
    When no arguments are provided, an interactive prompt guides you through
    scope and service selection.
usage: sbx secret set [-g | sandbox] [service] [flags]
options:
    - name: force
      shorthand: f
      default_value: "false"
      usage: Overwrite an existing secret when --token is used
    - name: global
      shorthand: g
      default_value: "false"
      usage: Use global secret scope
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for set
    - name: token
      shorthand: t
      usage: 'Secret value (less secure: visible in shell history)'
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
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
see_also:
    - sbx secret - Manage stored secrets
@y
      # Non-interactive via stdin (e.g., from a secret manager or env var)
      echo "$ANTHROPIC_API_KEY" | sbx secret set -g anthropic
see_also:
    - sbx secret - Manage stored secrets
@z
