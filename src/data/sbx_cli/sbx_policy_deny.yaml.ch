%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy deny
synopsis: Add a deny rule for sandboxes
description: |-
    Add a rule that blocks sandboxes from accessing specified resources.
@y
name: sbx policy deny
synopsis: Add a deny rule for sandboxes
description: |-
    Add a rule that blocks sandboxes from accessing specified resources.
@z

@x
    Deny rules take precedence over allow rules for the same hostname or CIDR. A
    direct connection to an allowed hostname is also checked against CIDR rules for
    its resolved IP address, and a deny on either takes precedence. Connections
    through an upstream proxy that resolves the hostname are checked by hostname
    only.
@y
    Deny rules take precedence over allow rules for the same hostname or CIDR. A
    direct connection to an allowed hostname is also checked against CIDR rules for
    its resolved IP address, and a deny on either takes precedence. Connections
    through an upstream proxy that resolves the hostname are checked by hostname
    only.
@z

@x
    Without --cloud, a rule is refused, and nothing is added, when the same scope
    already holds the opposite decision for the same resource on any of the same
    protocols (for HTTP rules, the same methods, path, and query constraints).
    Remove the existing rule with "sbx policy rm network --id RULE_ID" first, adding
    --sandbox SANDBOX if the rule is sandbox-scoped. Rules in different scopes, such
    as a global allow and a sandbox-scoped deny, can coexist, and the deny rule
    takes precedence. Rules from your organization's policy never cause this
    refusal. With --cloud, the new rule replaces the opposite rule in the same scope
    instead.
@y
    Without --cloud, a rule is refused, and nothing is added, when the same scope
    already holds the opposite decision for the same resource on any of the same
    protocols (for HTTP rules, the same methods, path, and query constraints).
    Remove the existing rule with "sbx policy rm network --id RULE_ID" first, adding
    --sandbox SANDBOX if the rule is sandbox-scoped. Rules in different scopes, such
    as a global allow and a sandbox-scoped deny, can coexist, and the deny rule
    takes precedence. Rules from your organization's policy never cause this
    refusal. With --cloud, the new rule replaces the opposite rule in the same scope
    instead.
@z

@x
usage: sbx policy deny COMMAND
@y
usage: sbx policy deny COMMAND
@z

% options:

@x help
      usage: help for deny
@y
      usage: help for deny
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@y
    - sbx policy - Manage sandbox policies
    - sbx policy deny network - Deny network access to specified hosts
@z
