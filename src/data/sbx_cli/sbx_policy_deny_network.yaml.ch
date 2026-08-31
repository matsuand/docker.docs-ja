%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy deny network
synopsis: Deny network access to specified hosts
description: |-
    Block sandbox network access to the specified hosts.
@y
name: sbx policy deny network
synopsis: Deny network access to specified hosts
description: |-
    Block sandbox network access to the specified hosts.
@z

@x
    RESOURCES is a comma-separated list of hostnames, domains, or IP addresses.
    Deny rules always take precedence over allow rules.
@y
    RESOURCES is a comma-separated list of hostnames, domains, or IP addresses.
    Deny rules always take precedence over allow rules.
@z

@x
    Use -g/--global to apply the rule globally to all sandboxes, or provide
    SANDBOX before RESOURCES to add the rule to policy "local" scoped to that
    sandbox.
@y
    Use -g/--global to apply the rule globally to all sandboxes, or provide
    SANDBOX before RESOURCES to add the rule to policy "local" scoped to that
    sandbox.
@z

@x
usage: sbx policy deny network [-g | SANDBOX] RESOURCES [flags]
@y
usage: sbx policy deny network [-g | SANDBOX] RESOURCES [flags]
@z

% options:

@x global
      usage: Apply the rule globally to all sandboxes
@y
      usage: Apply the rule globally to all sandboxes
@z

@x help
      usage: help for network
@y
      usage: help for network
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Block access to a host globally
      sbx policy deny network -g ads.example.com
@y
example: |4-
      # Block access to a host globally
      sbx policy deny network -g ads.example.com
@z

@x
      # Block a host only for a specific sandbox
      sbx policy deny network my-sandbox ads.example.com
@y
      # Block a host only for a specific sandbox
      sbx policy deny network my-sandbox ads.example.com
@z

@x
      # Block all outbound traffic globally
      sbx policy deny network -g "**"
@y
      # Block all outbound traffic globally
      sbx policy deny network -g "**"
@z

% see_also:

@x
    - sbx policy deny - Add a deny rule for sandboxes
@y
    - sbx policy deny - Add a deny rule for sandboxes
@z
