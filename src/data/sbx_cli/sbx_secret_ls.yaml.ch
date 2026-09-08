%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret ls
synopsis: List stored secrets
description: |-
    List stored secrets across global and sandbox scopes.

    With no scope flag, all stored secrets are shown. Use --global to show only
    global secrets, or --sandbox to show only secrets scoped to one sandbox.
@y
name: sbx secret ls
synopsis: List stored secrets
description: |-
    List stored secrets across global and sandbox scopes.

    With no scope flag, all stored secrets are shown. Use --global to show only
    global secrets, or --sandbox to show only secrets scoped to one sandbox.
@z

@x
usage: sbx secret ls [flags]
@y
usage: sbx secret ls [flags]
@zs	

% options:

@x global
      usage: Only list global secrets
@y
      usage: Only list global secrets
@z

@x help
      usage: help for ls
@y
      usage: help for ls
@z

@x sandbox
      usage: Only list secrets for one sandbox
@y
      usage: Only list secrets for one sandbox
@z

@x service
      usage: Filter by secret service name
@y
      usage: Filter by secret service name
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # List all secrets
      sbx secret ls
@y
example: |4-
      # List all secrets
      sbx secret ls
@z

@x
      # List only global secrets
      sbx secret ls -g
@y
      # List only global secrets
      sbx secret ls -g
@z

@x
      # List secrets for a specific sandbox
      sbx secret ls --sandbox my-sandbox
@y
      # List secrets for a specific sandbox
      sbx secret ls --sandbox my-sandbox
@z

@x
      # Filter by service
      sbx secret ls --service github
@y
      # Filter by service
      sbx secret ls --service github
@z

% see_also:

@x
    - sbx secret - Manage stored secrets
@y
    - sbx secret - Manage stored secrets
@z
