%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx secret ls
synopsis: List stored secrets
usage: sbx secret ls [SANDBOX] [flags]
@y
name: sbx secret ls
synopsis: List stored secrets
usage: sbx secret ls [SANDBOX] [flags]
@z

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
      sbx secret ls my-sandbox
@y
      # List secrets for a specific sandbox
      sbx secret ls my-sandbox
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
