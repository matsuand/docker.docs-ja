%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy ls
synopsis: List sandbox policies
description: |-
    List active sandbox policies.
@y
name: sbx policy ls
synopsis: List sandbox policies
description: |-
    List active sandbox policies.
@z

@x
    Without SANDBOX, the command shows one overview row per policy with its source,
    where it applies, and a summary of decisions by resource type. With SANDBOX, it
    summarizes active rules that apply to that sandbox.
@y
    Without SANDBOX, the command shows one overview row per policy with its source,
    where it applies, and a summary of decisions by resource type. With SANDBOX, it
    summarizes active rules that apply to that sandbox.
@z

@x
    Use --wide to show the detailed rule-level table with separate POLICY,
    POLICY_ID, RULE, and RULE_ID columns plus resources, status, and rule
    metadata. RULE_ID is the identifier accepted by "sbx policy rm network --id"
    (local rules only). Use --json for the filtered daemon response.
@y
    Use --wide to show the detailed rule-level table with separate POLICY,
    POLICY_ID, RULE, and RULE_ID columns plus resources, status, and rule
    metadata. RULE_ID is the identifier accepted by "sbx policy rm network --id"
    (local rules only). Use --json for the filtered daemon response.
@z

@x
    When remote governance is active, inactive policy rules are hidden by default.
    Use --include-inactive to show inactive rules for troubleshooting.
    Use "sbx policy inspect <policy-or-rule>" for full detail on a selected policy or
    rule.
@y
    When remote governance is active, inactive policy rules are hidden by default.
    Use --include-inactive to show inactive rules for troubleshooting.
    Use "sbx policy inspect <policy-or-rule>" for full detail on a selected policy or
    rule.
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

@x include-inactive
      usage: Show inactive policy rules hidden by remote governance
@y
      usage: Show inactive policy rules hidden by remote governance
@z

@x json
      usage: Output filtered policy rules as JSON
@y
      usage: Output filtered policy rules as JSON
@z

@x source
      usage: 'Filter policies by source: "local", "org", or "kit"'
@y
      usage: 'Filter policies by source: "local", "org", or "kit"'
@z

@x type
      usage: |
        Filter policies by type: "all", "network", or "filesystem" (default "all")
@y
      usage: |
        Filter policies by type: "all", "network", or "filesystem" (default "all")
@z

@x wide
      usage: Show detailed rule-level output with rule IDs and resources
@y
      usage: Show detailed rule-level output with rule IDs and resources
@z

% inherited_options:

@x debug
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
      # List the policies that apply to one sandbox
      sbx policy ls my-sandbox
@y
      # List the policies that apply to one sandbox
      sbx policy ls my-sandbox
@z

@x
      # Show detailed rule-level rows with rule IDs and resources
      sbx policy ls --wide
@y
      # Show detailed rule-level rows with rule IDs and resources
      sbx policy ls --wide
@z

@x
      # Output filtered rules as JSON
      sbx policy ls --json
@y
      # Output filtered rules as JSON
      sbx policy ls --json
@z

@x
      # List only network policies
      sbx policy ls --type network
@y
      # List only network policies
      sbx policy ls --type network
@z

@x
      # List organization policies that deny access
      sbx policy ls --source org --decision deny
@y
      # List organization policies that deny access
      sbx policy ls --source org --decision deny
@z

@x
      # Include inactive rules hidden by remote governance
      sbx policy ls --include-inactive
@y
      # Include inactive rules hidden by remote governance
      sbx policy ls --include-inactive
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
