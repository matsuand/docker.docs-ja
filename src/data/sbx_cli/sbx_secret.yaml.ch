%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret
synopsis: Manage stored secrets
description: |-
    Manage stored secrets for sandbox environments.
@y
name: sbx secret
synopsis: Manage stored secrets
description: |-
    Manage stored secrets for sandbox environments.
@z

@x
    SERVICE SECRETS (e.g. "github", "anthropic", "openai")
      When a sandbox starts, the proxy uses stored secrets to authenticate API
      requests on behalf of the agent. The secret is never exposed directly.
      Scoped globally (shared across all sandboxes) or to a specific sandbox.
@y
    SERVICE SECRETS (e.g. "github", "anthropic", "openai")
      When a sandbox starts, the proxy uses stored secrets to authenticate API
      requests on behalf of the agent. The secret is never exposed directly.
      Scoped globally (shared across all sandboxes) or to a specific sandbox.
@z

@x
    REGISTRY SECRETS (e.g. "ghcr.io", "myregistry.azurecr.io")
      Used to pull private template images and kit artifacts before sandbox
      creation. Unlike service secrets, registry credentials are host-only by
      default. They are not injected into sandboxes unless --all-sandboxes or
      --sandbox is set (the credential never enters the sandbox filesystem).
      Use "sbx secret set --registry <host> --password-stdin" to store them.
@y
    REGISTRY SECRETS (e.g. "ghcr.io", "myregistry.azurecr.io")
      Used to pull private template images and kit artifacts before sandbox
      creation. Unlike service secrets, registry credentials are host-only by
      default. They are not injected into sandboxes unless --all-sandboxes or
      --sandbox is set (the credential never enters the sandbox filesystem).
      Use "sbx secret set --registry <host> --password-stdin" to store them.
@z

@x
usage: sbx secret COMMAND
@y
usage: sbx secret COMMAND
@z

% options:

@x help
      usage: help for secret
@y
      usage: help for secret
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx secret import - Import secrets detected in host environment variables
    - sbx secret ls - List stored secrets
    - sbx secret rm - Remove a secret
    - sbx secret set - Create or update a secret
    - sbx secret set-custom - (Experimental) Create or update a custom secret
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx secret import - Import secrets detected in host environment variables
    - sbx secret ls - List stored secrets
    - sbx secret rm - Remove a secret
    - sbx secret set - Create or update a secret
    - sbx secret set-custom - (Experimental) Create or update a custom secret
@z
