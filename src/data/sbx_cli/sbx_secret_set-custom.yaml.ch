%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret set-custom
synopsis: Create or update a custom secret
experimental: true
description: |-
    Create or update a custom secret for a service not built into sbx.
@y
name: sbx secret set-custom
synopsis: Create or update a custom secret
experimental: true
description: |-
    Create or update a custom secret for a service not built into sbx.
@z

@x
    Custom secrets work via a placeholder: the sandbox sees the placeholder value
    instead of the real secret. When the sandbox makes an outbound request to the
    target host, the proxy replaces the placeholder with the real secret in the
    request headers — the secret never enters the sandbox directly.
@y
    Custom secrets work via a placeholder: the sandbox sees the placeholder value
    instead of the real secret. When the sandbox makes an outbound request to the
    target host, the proxy replaces the placeholder with the real secret in the
    request headers — the secret never enters the sandbox directly.
@z

@x
    --host accepts an exact host, IP address, or wildcard pattern. Repeat --host
    to cover multiple unrelated domains with one secret. "*" matches a single label
    and "**" matches any number of labels. For example "*.example.com" covers
    "cli.example.com" and "ide.example.com" with one entry.
@y
    --host accepts an exact host, IP address, or wildcard pattern. Repeat --host
    to cover multiple unrelated domains with one secret. "*" matches a single label
    and "**" matches any number of labels. For example "*.example.com" covers
    "cli.example.com" and "ide.example.com" with one entry.
@z

@x
    Custom secrets apply globally by default. Use --sandbox to scope one to a
    specific sandbox.
@y
    Custom secrets apply globally by default. Use --sandbox to scope one to a
    specific sandbox.
@z

@x
    With --cloud, --host takes exact DNS names only (no IP addresses or wildcards)
    and the proxy sets --header on requests to those hosts instead of substituting
    the placeholder.
@y
    With --cloud, --host takes exact DNS names only (no IP addresses or wildcards)
    and the proxy sets --header on requests to those hosts instead of substituting
    the placeholder.
@z

@x
usage: sbx secret set-custom [flags]
@y
usage: sbx secret set-custom [flags]
@z

% options:

@x command
      usage: Use a command's standard output as the secret value
@y
      usage: Use a command's standard output as the secret value
@z

@x env
      usage: Set this env var in the sandbox to the placeholder value
@y
      usage: Set this env var in the sandbox to the placeholder value
@z

@x format
      usage: |
        How the value fills the header, with one %s; default "Bearer %s" when --header is omitted (with --cloud)
@y
      usage: |
        How the value fills the header, with one %s; default "Bearer %s" when --header is omitted (with --cloud)
@z

@x header
      usage: |
        HTTP header the proxy sets to the secret on requests to --host; default Authorization (with --cloud)
@y
      usage: |
        HTTP header the proxy sets to the secret on requests to --host; default Authorization (with --cloud)
@z

@x help
      usage: help for set-custom
@y
      usage: help for set-custom
@z

@x host
      usage: |
        Host, IP, or wildcard pattern (e.g. *.example.com); repeatable; with --cloud, exact DNS names only
@y
      usage: |
        Host, IP, or wildcard pattern (e.g. *.example.com); repeatable; with --cloud, exact DNS names only
@z

@x name
        Secret name; default derived from the first --host (with --cloud)
@y
        Secret name; default derived from the first --host (with --cloud)
@z

@x no-verify
      usage: Skip checking the --ref or --command source when storing it
@y
      usage: Skip checking the --ref or --command source when storing it
@z

@x placeholder
      usage: |
        Placeholder value; use {rand} for a random suffix (e.g. sk-{rand})
@y
      usage: |
        Placeholder value; use {rand} for a random suffix (e.g. sk-{rand})
@z

@x ref
      usage: |
        Use a 1Password op:// reference or AWS Secrets Manager ARN as the secret source
@y
      usage: |
        Use a 1Password op:// reference or AWS Secrets Manager ARN as the secret source
@z

@x refresh
      usage: |
        Secret refresh policy: on-demand (default) or after a duration
@y
      usage: |
        Secret refresh policy: on-demand (default) or after a duration
@z

@x sandbox
      usage: 'Scope the secret to one sandbox (default: all sandboxes)'
@y
      usage: 'Scope the secret to one sandbox (default: all sandboxes)'
@z

@x show-error
      usage: |
        Show resolver standard error if the initial check fails (may contain secrets)
@y
      usage: |
        Show resolver standard error if the initial check fails (may contain secrets)
@z

@x token
      shorthand: t
      usage: 'Secret value (less secure: visible in shell history)'
@y
      shorthand: t
      usage: 'Secret value (less secure: visible in shell history)'
@z

@x value
      usage: 'Secret value (less secure: visible in shell history)'
@y
      usage: 'Secret value (less secure: visible in shell history)'
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Create a global custom secret. A unique placeholder is generated automatically.
      # The sandbox env var API_KEY is set to the placeholder value; outbound requests
      # to the host have the placeholder replaced with the real secret.
      sbx secret set-custom --host api.example.com --env API_KEY --value secret123
@y
example: |4-
      # Create a global custom secret. A unique placeholder is generated automatically.
      # The sandbox env var API_KEY is set to the placeholder value; outbound requests
      # to the host have the placeholder replaced with the real secret.
      sbx secret set-custom --host api.example.com --env API_KEY --value secret123
@z

@x
      # Use a wildcard host to cover multiple subdomains that share one key.
      sbx secret set-custom --host '*.coderabbit.ai' --env CODERABBIT_API_KEY --value secret123
@y
      # Use a wildcard host to cover multiple subdomains that share one key.
      sbx secret set-custom --host '*.coderabbit.ai' --env CODERABBIT_API_KEY --value secret123
@z

@x
      # Use multiple --host flags to cover unrelated domains with the same key.
      sbx secret set-custom --host api.example.com --host api.other.io --env API_KEY --value secret123
@y
      # Use multiple --host flags to cover unrelated domains with the same key.
      sbx secret set-custom --host api.example.com --host api.other.io --env API_KEY --value secret123
@z

@x
      # Scope to a specific sandbox instead of globally.
      sbx secret set-custom --sandbox my-sandbox --host api.example.com --env API_KEY --value secret123
@y
      # Scope to a specific sandbox instead of globally.
      sbx secret set-custom --sandbox my-sandbox --host api.example.com --env API_KEY --value secret123
@z

@x
      # Custom placeholder with {rand} suffix; the CLI prints the generated value.
      sbx secret set-custom --host api.example.com --placeholder sk-{rand} --value secret123
@y
      # Custom placeholder with {rand} suffix; the CLI prints the generated value.
      sbx secret set-custom --host api.example.com --placeholder sk-{rand} --value secret123
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
