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
usage: sbx policy allow network RESOURCES [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for network
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Allow access to a single host
      sbx policy allow network api.example.com
@y
    RESOURCES is a comma-separated list of hostnames, domains, or IP addresses.
    Supports exact domains (example.com), wildcard subdomains (*.example.com),
    and optional port suffixes (example.com:443). Use "**" to allow all hosts.
usage: sbx policy allow network RESOURCES [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for network
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Allow access to a single host
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
      # Allow all subdomains of a host
      sbx policy allow network "*.npmjs.org"
@y
      # Allow all subdomains of a host
      sbx policy allow network "*.npmjs.org"
@z

@x
      # Allow all outbound traffic
      sbx policy allow network "**"
see_also:
    - sbx policy allow - Add an allow policy for sandboxes
@y
      # Allow all outbound traffic
      sbx policy allow network "**"
see_also:
    - sbx policy allow - Add an allow policy for sandboxes
@z
