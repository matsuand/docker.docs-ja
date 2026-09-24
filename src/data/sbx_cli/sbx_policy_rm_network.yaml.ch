%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy rm network
synopsis: Remove a network rule
description: |-
    Remove a network rule by rule ID, resource, or both.
@y
name: sbx policy rm network
synopsis: Remove a network rule
description: |-
    Remove a network rule by rule ID, resource, or both.
@z

@x
    --id takes the RULE_ID value shown by "sbx policy ls --wide" and
    "sbx policy inspect" — the rule's identifier, not its name. Passing a rule
    name fails with an error that names the actual rule ID and, for removable
    rules, the exact corrected command.
@y
    --id takes the RULE_ID value shown by "sbx policy ls --wide" and
    "sbx policy inspect" — the rule's identifier, not its name. Passing a rule
    name fails with an error that names the actual rule ID and, for removable
    rules, the exact corrected command.
@z

@x
    The rule is removed from the global policy by default. Use --sandbox to
    remove from policy "local" scoped to a single sandbox instead.
@y
    The rule is removed from the global policy by default. Use --sandbox to
    remove from policy "local" scoped to a single sandbox instead.
@z

@x
    Use "sbx policy ls --wide" to see active rule IDs and resources, or
    "sbx policy ls --json" for the filtered rules; network values are printed in
    the form the CLI accepts back.
@y
    Use "sbx policy ls --wide" to see active rule IDs and resources, or
    "sbx policy ls --json" for the filtered rules; network values are printed in
    the form the CLI accepts back.
@z

@x
    With --cloud:
    Remove a cloud network rule by pattern.
@y
    With --cloud:
    Remove a cloud network rule by pattern.
@z

@x
    Cloud rules have no IDs: --resource removes the pattern from both the allow
    and deny lists, and the output names each list it was removed from. The rule
    leaves the account policy by default; use --sandbox to scope the removal to one
    sandbox. Use "sbx --cloud policy ls" to see the current rules.
@y
    Cloud rules have no IDs: --resource removes the pattern from both the allow
    and deny lists, and the output names each list it was removed from. The rule
    leaves the account policy by default; use --sandbox to scope the removal to one
    sandbox. Use "sbx --cloud policy ls" to see the current rules.
@z

@x
usage: sbx policy rm network [--sandbox SANDBOX] [flags]
@y
usage: sbx policy rm network [--sandbox SANDBOX] [flags]
@z

% options:

@x force
      usage: Skip confirmation prompts
@y
      usage: Skip confirmation prompts
@z

@x help
      usage: help for network
@y
      usage: help for network
@z

@x id
      usage: Remove by rule ID
@y
      usage: Remove by rule ID
@z

@x resource
      usage: Remove by resource value(s), comma-separated
@y
      usage: Remove by resource value(s), comma-separated
@z

@x sandbox
      usage: |
        Scope the removal to a specific sandbox (default: global policy)
@y
      usage: |
        Scope the removal to a specific sandbox (default: global policy)
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # List rules to find the ID or resource to remove
      sbx policy ls --wide
@y
example: |4-
      # List rules to find the ID or resource to remove
      sbx policy ls --wide
@z

@x
      # Remove a global rule by resource
      sbx policy rm network --resource api.example.com
@y
      # Remove a global rule by resource
      sbx policy rm network --resource api.example.com
@z

@x
      # Remove a global rule by ID
      sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
@y
      # Remove a global rule by ID
      sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
@z

@x
      # Remove a sandbox-scoped rule by resource
      sbx policy rm network --sandbox my-sandbox --resource api.example.com
@y
      # Remove a sandbox-scoped rule by resource
      sbx policy rm network --sandbox my-sandbox --resource api.example.com
@z

@x
      # Remove a cloud rule by pattern, from the allow or deny list it is in
      sbx --cloud policy rm network --resource api.example.com
@y
      # Remove a cloud rule by pattern, from the allow or deny list it is in
      sbx --cloud policy rm network --resource api.example.com
@z

@x
      # Remove a pattern from one cloud sandbox's rules
      sbx --cloud policy rm network --sandbox my-sandbox --resource api.example.com
@y
      # Remove a pattern from one cloud sandbox's rules
      sbx --cloud policy rm network --sandbox my-sandbox --resource api.example.com
@z

% see_also:

@x
    - sbx policy rm - Remove a policy rule
@y
    - sbx policy rm - Remove a policy rule
@z
