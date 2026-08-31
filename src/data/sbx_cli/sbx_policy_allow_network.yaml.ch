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
    RESOURCES is a comma-separated list of hostnames, domains, or IP addresses.
    Supports exact domains (example.com), wildcard subdomains (*.example.com),
    and optional port suffixes (example.com:443). Use "**" to allow all hosts.
@y
    RESOURCES is a comma-separated list of hostnames, domains, or IP addresses.
    Supports exact domains (example.com), wildcard subdomains (*.example.com),
    and optional port suffixes (example.com:443). Use "**" to allow all hosts.
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
usage: sbx policy allow network [-g | SANDBOX] RESOURCES [flags]
@y
usage: sbx policy allow network [-g | SANDBOX] RESOURCES [flags]
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
      # Allow access to a single host globally
      sbx policy allow network -g api.example.com
@y
example: |4-
      # Allow access to a single host globally
      sbx policy allow network -g api.example.com
@z

@x
      # Allow access to multiple hosts globally
      sbx policy allow network -g "api.example.com,cdn.example.com"
@y
      # Allow access to multiple hosts globally
      sbx policy allow network -g "api.example.com,cdn.example.com"
@z

@x
      # Allow a host only for a specific sandbox
      sbx policy allow network my-sandbox api.example.com
@y
      # Allow a host only for a specific sandbox
      sbx policy allow network my-sandbox api.example.com
@z

@x
      # Allow all subdomains of a host
      sbx policy allow network -g "*.npmjs.org"
@y
      # Allow all subdomains of a host
      sbx policy allow network -g "*.npmjs.org"
@z

@x
      # Allow all outbound traffic globally
      sbx policy allow network -g "**"
@y
      # Allow all outbound traffic globally
      sbx policy allow network -g "**"
@z

% see_also:

@x
    - sbx policy allow - Add an allow rule for sandboxes
@y
    - sbx policy allow - Add an allow rule for sandboxes
@z
