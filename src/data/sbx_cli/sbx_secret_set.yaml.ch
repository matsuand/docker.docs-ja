%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret set
synopsis: Create or update a secret
description: |-
    Create or update a service secret or registry credential.
@y
name: sbx secret set
synopsis: Create or update a secret
description: |-
    Create or update a service secret or registry credential.
@z

@x
    ### Service secrets
@y
    ### Service secrets
@z

@x
    Available services: anthropic, cursor, droid, github, google, groq, mistral, nebius, openai, openrouter, xai
@y
    Available services: anthropic, cursor, droid, github, google, groq, mistral, nebius, openai, openrouter, xai
@z

@x
    Service secrets apply globally by default. Use --sandbox to scope a secret to
    one sandbox. When SERVICE is omitted, an interactive prompt selects it.
@y
    Service secrets apply globally by default. Use --sandbox to scope a secret to
    one sandbox. When SERVICE is omitted, an interactive prompt selects it.
@z

@x
    ### Dynamic secrets
@y
    ### Dynamic secrets
@z

@x
    Use --ref or --command to store a secret source instead of the secret value.
    sbx resolves the source on the host when needed and caches the value according
    to the --refresh policy.
@y
    Use --ref or --command to store a secret source instead of the secret value.
    sbx resolves the source on the host when needed and caches the value according
    to the --refresh policy.
@z

@x
    --ref supports 1Password op:// references and AWS Secrets Manager ARNs. The
    corresponding op or aws CLI must be installed and authenticated. --command
    runs a shell command and uses its standard output as the secret value.
@y
    --ref supports 1Password op:// references and AWS Secrets Manager ARNs. The
    corresponding op or aws CLI must be installed and authenticated. --command
    runs a shell command and uses its standard output as the secret value.
@z

@x
    ### Registry credentials
@y
    ### Registry credentials
@z

@x
    Use --registry to store pull credentials for a container registry. Unlike
    service secrets, registry credentials are host-only by default:
@y
    Use --registry to store pull credentials for a container registry. Unlike
    service secrets, registry credentials are host-only by default:
@z

@x
    - By default, credentials are used for template and kit pulls on the host.
      They are never injected into a sandbox.
    - With --all-sandboxes, credentials are used for host pulls and injected by
      the proxy into every new sandbox's registry login. The credentials never
      enter the sandbox.
    - With --sandbox, credentials are injected into the specified sandbox only.
@y
    - By default, credentials are used for template and kit pulls on the host.
      They are never injected into a sandbox.
    - With --all-sandboxes, credentials are used for host pulls and injected by
      the proxy into every new sandbox's registry login. The credentials never
      enter the sandbox.
    - With --sandbox, credentials are injected into the specified sandbox only.
@z

@x
usage: sbx secret set [SERVICE] [flags]
@y
usage: sbx secret set [SERVICE] [flags]
@z

% options:

@x all-sandboxes
      usage: |
        Inject registry credentials into every sandbox (requires --registry)
@y
      usage: |
        Inject registry credentials into every sandbox (requires --registry)
@z

@x command
      usage: Use a command's standard output as the secret value
@y
      usage: Use a command's standard output as the secret value
@z

@x force
      usage: Overwrite an existing secret when --token is used
@y
      usage: Overwrite an existing secret when --token is used
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

@x sandbox
      usage: Scope the secret to one sandbox instead of its default scope
@y
      usage: Scope the secret to one sandbox instead of its default scope
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
      sbx secret set github
@y
example: |4-
      # Store a GitHub token globally (available to all sandboxes)
      sbx secret set github
@z

@x
      # Store an OpenAI key for a specific sandbox
      sbx secret set openai --sandbox my-sandbox
@y
      # Store an OpenAI key for a specific sandbox
      sbx secret set openai --sandbox my-sandbox
@z

@x
      # Non-interactive via stdin (e.g., from a secret manager or env var)
      echo "$ANTHROPIC_API_KEY" | sbx secret set anthropic
@y
      # Non-interactive via stdin (e.g., from a secret manager or env var)
      echo "$ANTHROPIC_API_KEY" | sbx secret set anthropic
@z

@x
      # Start OpenAI OAuth flow and store global OAuth tokens
      sbx secret set openai --oauth
@y
      # Start OpenAI OAuth flow and store global OAuth tokens
      sbx secret set openai --oauth
@z

@x
      # Resolve a 1Password reference at use time (requires an authenticated op CLI)
      sbx secret set anthropic --ref 'op://Private/Anthropic/api-key'
@y
      # Resolve a 1Password reference at use time (requires an authenticated op CLI)
      sbx secret set anthropic --ref 'op://Private/Anthropic/api-key'
@z

@x
      # Resolve an AWS Secrets Manager ARN at use time (requires an authenticated aws CLI)
      sbx secret set anthropic --ref 'arn:aws:secretsmanager:us-west-2:123456789012:secret:anthropic-api-key'
@y
      # Resolve an AWS Secrets Manager ARN at use time (requires an authenticated aws CLI)
      sbx secret set anthropic --ref 'arn:aws:secretsmanager:us-west-2:123456789012:secret:anthropic-api-key'
@z

@x
      # Resolve a secret using an arbitrary command
      sbx secret set github --command 'gh auth token'
@y
      # Resolve a secret using an arbitrary command
      sbx secret set github --command 'gh auth token'
@z

@x
      # Registry: host-only (template/kit pulls, not injected into sandboxes)
      gh auth token | sbx secret set --registry ghcr.io --password-stdin
@y
      # Registry: host-only (template/kit pulls, not injected into sandboxes)
      gh auth token | sbx secret set --registry ghcr.io --password-stdin
@z

@x
      # Registry: host pulls + injected into every new sandbox
      gh auth token | sbx secret set --all-sandboxes --registry ghcr.io --password-stdin
@y
      # Registry: host pulls + injected into every new sandbox
      gh auth token | sbx secret set --all-sandboxes --registry ghcr.io --password-stdin
@z

@x
      # Registry: specific sandbox only
      gh auth token | sbx secret set --sandbox my-sandbox --registry ghcr.io --password-stdin
@y
      # Registry: specific sandbox only
      gh auth token | sbx secret set --sandbox my-sandbox --registry ghcr.io --password-stdin
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
