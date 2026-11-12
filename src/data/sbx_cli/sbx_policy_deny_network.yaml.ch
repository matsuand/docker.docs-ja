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
    RESOURCES takes the same forms as "sbx policy allow network": exact domains,
    wildcard subdomains, IP addresses, and CIDR prefixes, with optional port
    suffixes. Rules apply to TCP and UDP by default; use --protocol to restrict a
    rule to one transport.
@y
    RESOURCES takes the same forms as "sbx policy allow network": exact domains,
    wildcard subdomains, IP addresses, and CIDR prefixes, with optional port
    suffixes. Rules apply to TCP and UDP by default; use --protocol to restrict a
    rule to one transport.
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
    The rule applies globally to all sandboxes by default. Use --sandbox to add
    the rule to policy "local" scoped to a single sandbox instead.
@y
    The rule applies globally to all sandboxes by default. Use --sandbox to add
    the rule to policy "local" scoped to a single sandbox instead.
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
    Use --method to add an HTTP rule. --method accepts comma-separated HTTP
    methods or ANY; --path defaults to /**. Repeat --query name=value to require
    query parameters.
@y
    Use --method to add an HTTP rule. --method accepts comma-separated HTTP
    methods or ANY; --path defaults to /**. Repeat --query name=value to require
    query parameters.
@z

@x
    HTTP paths, query parameter names, and query values match without regard to
    ASCII letter case. For example, /API/** matches /api/items, and Tag=PROD
    matches tag=prod.
@y
    HTTP paths, query parameter names, and query values match without regard to
    ASCII letter case. For example, /API/** matches /api/items, and Tag=PROD
    matches tag=prod.
@z

@x
    With --cloud:
    Block cloud sandbox network access to the specified hosts.
@y
    With --cloud:
    Block cloud sandbox network access to the specified hosts.
@z

@x
    A matching allow entry in the same scope is replaced by the deny entry.
@y
    A matching allow entry in the same scope is replaced by the deny entry.
@z

@x
    RESOURCES is a comma-separated list of network patterns, such as api.example.com,
    *.example.com, 10.0.0.0/8, or api.example.com:443. HTTP method, path, query, and
    transport protocol selectors are not supported.
@y
    RESOURCES is a comma-separated list of network patterns, such as api.example.com,
    *.example.com, 10.0.0.0/8, or api.example.com:443. HTTP method, path, query, and
    transport protocol selectors are not supported.
@z

@x
    Rules apply to the account by default. Use --sandbox with a sandbox name or ID
    to change one sandbox's policy. Use "sbx --cloud policy ls" to list the rules.
@y
    Rules apply to the account by default. Use --sandbox with a sandbox name or ID
    to change one sandbox's policy. Use "sbx --cloud policy ls" to list the rules.
@z

@x
usage: sbx policy deny network [--sandbox SANDBOX] RESOURCES [flags]
@y
usage: sbx policy deny network [--sandbox SANDBOX] RESOURCES [flags]
@z

% options:

@x help
      usage: help for network
@y
      usage: help for network
@z

@x method
      usage: |
        Restrict the rule to these HTTP methods (comma-separated); use ANY to match all methods
@y
      usage: |
        Restrict the rule to these HTTP methods (comma-separated); use ANY to match all methods
@z

@x path
      usage: |
        Restrict the rule to this HTTP path glob (e.g. /repos/**); defaults to /**
@y
      usage: |
        Restrict the rule to this HTTP path glob (e.g. /repos/**); defaults to /**
@z

@x protocol
        Network protocol: tcp or udp; repeat or comma-separate for both (default tcp,udp)
@y
        Network protocol: tcp or udp; repeat or comma-separate for both (default tcp,udp)
@z

@x query
      usage: |
        Require an HTTP query parameter (name=value pattern); repeatable
@y
      usage: |
        Require an HTTP query parameter (name=value pattern); repeatable
@z

@x sandbox
      usage: |
        Scope the rule to a specific sandbox (default: all sandboxes)
@y
      usage: |
        Scope the rule to a specific sandbox (default: all sandboxes)
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

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

@x
example: |4-
      # Block access to a host (all sandboxes)
      sbx policy deny network ads.example.com
@y
example: |4-
      # Block access to a host (all sandboxes)
      sbx policy deny network ads.example.com
@z

@x
      # Block a host only for a specific sandbox
      sbx policy deny network --sandbox my-sandbox ads.example.com
@y
      # Block a host only for a specific sandbox
      sbx policy deny network --sandbox my-sandbox ads.example.com
@z

@x
      # Block all outbound traffic, TCP and UDP
      sbx policy deny network "**"
@y
      # Block all outbound traffic, TCP and UDP
      sbx policy deny network "**"
@z

@x
      # Block only UDP to a host
      sbx policy deny network --protocol udp media.example.com
@y
      # Block only UDP to a host
      sbx policy deny network --protocol udp media.example.com
@z

@x
      # Block POST requests to a path
      sbx policy deny network api.example.com --method POST --path '/admin/**'
@y
      # Block POST requests to a path
      sbx policy deny network api.example.com --method POST --path '/admin/**'
@z

@x
      # Block a host in the account policy
      sbx --cloud policy deny network ads.example.com
@y
      # Block a host in the account policy
      sbx --cloud policy deny network ads.example.com
@z

@x
      # Block a host for one sandbox
      sbx --cloud policy deny network --sandbox my-sandbox ads.example.com
@y
      # Block a host for one sandbox
      sbx --cloud policy deny network --sandbox my-sandbox ads.example.com
@z

% see_also:

@x
    - sbx policy deny - Add a deny rule for sandboxes
@y
    - sbx policy deny - Add a deny rule for sandboxes
@z
