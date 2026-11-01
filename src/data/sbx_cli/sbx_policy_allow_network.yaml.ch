%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy allow network
synopsis: Allow network access to specified hosts
description: |-
    Allow sandbox network access to the specified hosts.
@y
name: sbx policy allow network
synopsis: Allow network access to specified hosts
description: |-
    Allow sandbox network access to the specified hosts.
@z

@x
    RESOURCES is a comma-separated list of hostnames, domains, IP addresses, or
    CIDR prefixes. Rules apply to TCP by default; use --protocol to select UDP or
    both transports. Supports exact domains (example.com), wildcard subdomains
    (*.example.com), multi-label wildcards (**.example.com), single-character
    globs (api?.example.com), character classes (api[12].example.com,
    api[!1].example.com), and optional port suffixes (example.com:443). An IPv6
    address takes a port in brackets ([2001:db8::1]:443) or a CIDR prefix
    (2001:db8::1/128); a bare one is refused. Use "**" to allow all hosts. A bare
    "*", an escaped glob character such as "\*", and any other pattern outside
    these forms are rejected rather than stored as a rule that matches nothing.
@y
    RESOURCES is a comma-separated list of hostnames, domains, IP addresses, or
    CIDR prefixes. Rules apply to TCP by default; use --protocol to select UDP or
    both transports. Supports exact domains (example.com), wildcard subdomains
    (*.example.com), multi-label wildcards (**.example.com), single-character
    globs (api?.example.com), character classes (api[12].example.com,
    api[!1].example.com), and optional port suffixes (example.com:443). An IPv6
    address takes a port in brackets ([2001:db8::1]:443) or a CIDR prefix
    (2001:db8::1/128); a bare one is refused. Use "**" to allow all hosts. A bare
    "*", an escaped glob character such as "\*", and any other pattern outside
    these forms are rejected rather than stored as a rule that matches nothing.
@z

@x
    The rule applies globally to all sandboxes by default. Use --sandbox to add
    the rule to policy "local" scoped to a single sandbox instead.
@y
    The rule applies globally to all sandboxes by default. Use --sandbox to add
    the rule to policy "local" scoped to a single sandbox instead.
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
usage: sbx policy allow network [--sandbox SANDBOX] RESOURCES [flags]
@y
usage: sbx policy allow network [--sandbox SANDBOX] RESOURCES [flags]
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
      usage: |
        Network protocol: tcp or udp; repeat or comma-separate for both
@y
      usage: |
        Network protocol: tcp or udp; repeat or comma-separate for both
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

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Allow access to a single host (all sandboxes)
      sbx policy allow network api.example.com
@y
example: |4-
      # Allow access to a single host (all sandboxes)
      sbx policy allow network api.example.com
@z

@x
      # Allow access to multiple hosts
      sbx policy allow network "api.example.com,cdn.example.com"
@y
      # Allow access to multiple hosts
      sbx policy allow network "api.example.com,cdn.example.com"
@z

@x
      # Allow a host only for a specific sandbox
      sbx policy allow network --sandbox my-sandbox api.example.com
@y
      # Allow a host only for a specific sandbox
      sbx policy allow network --sandbox my-sandbox api.example.com
@z

@x
      # Allow all subdomains of a host
      sbx policy allow network "*.npmjs.org"
@y
      # Allow all subdomains of a host
      sbx policy allow network "*.npmjs.org"
@z

@x
      # Allow all outbound traffic on both transports
      sbx policy allow network --protocol tcp,udp "**"
@y
      # Allow all outbound traffic on both transports
      sbx policy allow network --protocol tcp,udp "**"
@z

@x
      # Allow GET and HEAD requests to a path
      sbx policy allow network api.example.com --method GET,HEAD --path '/v1/**'
@y
      # Allow GET and HEAD requests to a path
      sbx policy allow network api.example.com --method GET,HEAD --path '/v1/**'
@z

% see_also:

@x
    - sbx policy allow - Add an allow rule for sandboxes
@y
    - sbx policy allow - Add an allow rule for sandboxes
@z
