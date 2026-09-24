%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret import
synopsis: Import secrets detected in host environment variables
description: |-
    Import secrets that sbx detects in your host environment
    variables (e.g. OPENAI_API_KEY, ANTHROPIC_API_KEY, GH_TOKEN) into the
    global keychain. Once imported, the secret is available to every
    sandbox without needing the env var on each shell.
@y
name: sbx secret import
synopsis: Import secrets detected in host environment variables
description: |-
    Import secrets that sbx detects in your host environment
    variables (e.g. OPENAI_API_KEY, ANTHROPIC_API_KEY, GH_TOKEN) into the
    global keychain. Once imported, the secret is available to every
    sandbox without needing the env var on each shell.
@z

@x
    Each detected env var is offered interactively with a Y/n prompt and a
    last-4-char preview of the value. Existing stored entries are never
    overwritten silently:
@y
    Each detected env var is offered interactively with a Y/n prompt and a
    last-4-char preview of the value. Existing stored entries are never
    overwritten silently:
@z

@x
      - Interactive mode prompts for confirmation before overwriting.
      - --all imports new entries without prompting but SKIPS overwrites
        (use --force when you actually want to replace stored values).
      - --force imports unconditionally, including overwriting.
@y
      - Interactive mode prompts for confirmation before overwriting.
      - --all imports new entries without prompting but SKIPS overwrites
        (use --force when you actually want to replace stored values).
      - --force imports unconditionally, including overwriting.
@z

@x
    Services that already have an OAuth token configured (e.g. anthropic
    after `sbx run claude … -- auth login`) are skipped: the OAuth token
    takes precedence at runtime so any api-key import would never be used.
    Run `sbx secret rm <service>` first if you want to switch from
    OAuth to api-key auth.
@y
    Services that already have an OAuth token configured (e.g. anthropic
    after `sbx run claude … -- auth login`) are skipped: the OAuth token
    takes precedence at runtime so any api-key import would never be used.
    Run `sbx secret rm <service>` first if you want to switch from
    OAuth to api-key auth.
@z

@x
    Available services: anthropic, copilot, cursor, devin, droid, github, google, groq, mistral, nebius, openai, openrouter, xai
@y
    Available services: anthropic, copilot, cursor, devin, droid, github, google, groq, mistral, nebius, openai, openrouter, xai
@z

@x
usage: sbx secret import [SERVICE] [flags]
@y
usage: sbx secret import [SERVICE] [flags]
@z

% options:

@x all
      usage: Import every detected env var without prompting
@y
      usage: Import every detected env var without prompting
@z

@x dry-run
      usage: Show what would be imported without writing
@y
      usage: Show what would be imported without writing
@z

@x force
      usage: Overwrite an existing stored entry without confirmation
@y
      usage: Overwrite an existing stored entry without confirmation
@z

@x help
      usage: help for import
@y
      usage: help for import
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
      # Walk every detected env var, prompting before each import
      sbx secret import
@y
example: |4-
      # Walk every detected env var, prompting before each import
      sbx secret import
@z

@x
      # Import only the openai service (uses OPENAI_API_KEY)
      sbx secret import openai
@y
      # Import only the openai service (uses OPENAI_API_KEY)
      sbx secret import openai
@z

@x
      # Non-interactive: import everything detected without prompting
      sbx secret import --all
@y
      # Non-interactive: import everything detected without prompting
      sbx secret import --all
@z

@x
      # Overwrite an existing stored entry without confirmation
      sbx secret import openai --force
@y
      # Overwrite an existing stored entry without confirmation
      sbx secret import openai --force
@z

@x
      # Preview what would be imported without writing
      sbx secret import --dry-run
@y
      # Preview what would be imported without writing
      sbx secret import --dry-run
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
