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
    rule to one transport. Deny rules take precedence over allow rules for the
    same hostname or CIDR. An allowed hostname isn't checked against CIDR rules
    for its resolved IP address.
@y
    RESOURCES takes the same forms as "sbx policy allow network": exact domains,
    wildcard subdomains, IP addresses, and CIDR prefixes, with optional port
    suffixes. Rules apply to TCP and UDP by default; use --protocol to restrict a
    rule to one transport. Deny rules take precedence over allow rules for the
    same hostname or CIDR. An allowed hostname isn't checked against CIDR rules
    for its resolved IP address.
@z

@x
    The rule applies globally to all sandboxes by default. Use --sandbox to add
    the rule to policy "local" scoped to a single sandbox instead.
@y
    The rule applies globally to all sandboxes by default. Use --sandbox to add
    the rule to policy "local" scoped to a single sandbox instead.
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

@x protocol
        Restrict the rule to one protocol: tcp or udp (default tcp,udp)
@y
        Restrict the rule to one protocol: tcp or udp (default tcp,udp)
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

% see_also:

@x
    - sbx policy deny - Add a deny rule for sandboxes
@y
    - sbx policy deny - Add a deny rule for sandboxes
@z
