%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy
synopsis: Manage sandbox policies
description: |-
    Manage persistent access policies for sandboxes.
@y
name: sbx policy
synopsis: Manage sandbox policies
description: |-
    Manage persistent access policies for sandboxes.
@z

@x
    Policies contain rules that control what sandboxes can access. Local rules
    can apply globally across all sandboxes or be scoped to one sandbox. Use
    subcommands to allow, deny, list, or remove rules.
@y
    Policies contain rules that control what sandboxes can access. Local rules
    can apply globally across all sandboxes or be scoped to one sandbox. Use
    subcommands to allow, deny, list, or remove rules.
@z

@x
usage: sbx policy COMMAND
@y
usage: sbx policy COMMAND
@z

% options:

@x help
      usage: help for policy
@y
      usage: help for policy
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
    - sbx policy allow - Add an allow rule for sandboxes
    - sbx policy check - Check whether policy allows an access request
    - sbx policy deny - Add a deny rule for sandboxes
    - sbx policy init - Initialize the global network policy
    - sbx policy inspect - Inspect policy or rule details
    - sbx policy log - Show sandbox policy logs
    - sbx policy ls - List sandbox policies
    - sbx policy reset - Reset policies to defaults
    - sbx policy rm - Remove a policy rule
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx policy allow - Add an allow rule for sandboxes
    - sbx policy check - Check whether policy allows an access request
    - sbx policy deny - Add a deny rule for sandboxes
    - sbx policy init - Initialize the global network policy
    - sbx policy inspect - Inspect policy or rule details
    - sbx policy log - Show sandbox policy logs
    - sbx policy ls - List sandbox policies
    - sbx policy reset - Reset policies to defaults
    - sbx policy rm - Remove a policy rule
@z
