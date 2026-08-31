%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy ls
synopsis: List sandbox policy rules
description: |-
    List all active policy rules.
@y
name: sbx policy ls
synopsis: List sandbox policy rules
description: |-
    List all active policy rules.
@z

@x
    Displays the provenance, scope, rule name (or ID if no name is set), type,
    decision (allow/deny), and the associated resources for each rule.
@y
    Displays the provenance, scope, rule name (or ID if no name is set), type,
    decision (allow/deny), and the associated resources for each rule.
@z

@x
    When SANDBOX is specified, only policies that apply to that sandbox are shown
    (global rules plus rules scoped to that sandbox).
@y
    When SANDBOX is specified, only policies that apply to that sandbox are shown
    (global rules plus rules scoped to that sandbox).
@z

@x
usage: sbx policy ls [SANDBOX] [flags]
@y
usage: sbx policy ls [SANDBOX] [flags]
@z

% options:

@x help
      usage: help for ls
@y
      usage: help for ls
@z

@x type
      usage: 'Filter policies by type: "all" or "network" (default "all")'
@y
      usage: 'Filter policies by type: "all" or "network" (default "all")'
@z

% inherited_options:

@x
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # List all policies
      sbx policy ls
@y
example: |4-
      # List all policies
      sbx policy ls
@z

@x
      # List only network policies
      sbx policy ls --type network
@y
      # List only network policies
      sbx policy ls --type network
@z

@x
      # List policies that apply to a specific sandbox
      sbx policy ls my-sandbox
@y
      # List policies that apply to a specific sandbox
      sbx policy ls my-sandbox
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
