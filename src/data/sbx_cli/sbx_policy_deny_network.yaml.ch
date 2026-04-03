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
usage: sbx policy deny network RESOURCES [flags]
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
      # Block access to a host
      sbx policy deny network ads.example.com
@y
    RESOURCES is a comma-separated list of hostnames, domains, or IP addresses.
    Deny rules always take precedence over allow rules.
usage: sbx policy deny network RESOURCES [flags]
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
      # Block access to a host
      sbx policy deny network ads.example.com
@z

@x
      # Block all outbound traffic
      sbx policy deny network "**"
see_also:
    - sbx policy deny - Add a deny policy for sandboxes
@y
      # Block all outbound traffic
      sbx policy deny network "**"
see_also:
    - sbx policy deny - Add a deny policy for sandboxes
@z
