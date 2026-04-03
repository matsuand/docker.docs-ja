%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy set-default
synopsis: Set the default network policy
description: |-
    Set the default network policy for all sandboxes.
@y
name: sbx policy set-default
synopsis: Set the default network policy
description: |-
    Set the default network policy for all sandboxes.
@z

@x
    This must be run before adding custom allow/deny rules or starting a sandbox
    for the first time. The default policy determines the baseline network access.
@y
    This must be run before adding custom allow/deny rules or starting a sandbox
    for the first time. The default policy determines the baseline network access.
@z

@x
    Available policies:
      allow-all   All outbound network traffic is allowed
      balanced    Common dev traffic allowed (AI services, package registries, etc.)
      deny-all    All outbound network traffic is blocked
@y
    Available policies:
      allow-all   All outbound network traffic is allowed
      balanced    Common dev traffic allowed (AI services, package registries, etc.)
      deny-all    All outbound network traffic is blocked
@z

@x
    After setting defaults, use "sbx policy allow/deny" to add custom rules.
    Use "sbx policy reset" to clear all policies and start over.
usage: sbx policy set-default <allow-all|balanced|deny-all> [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for set-default
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Set balanced defaults (recommended)
      sbx policy set-default balanced
@y
    After setting defaults, use "sbx policy allow/deny" to add custom rules.
    Use "sbx policy reset" to clear all policies and start over.
usage: sbx policy set-default <allow-all|balanced|deny-all> [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for set-default
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Set balanced defaults (recommended)
      sbx policy set-default balanced
@z

@x
      # Allow all traffic
      sbx policy set-default allow-all
@y
      # Allow all traffic
      sbx policy set-default allow-all
@z

@x
      # Block everything, then allow specific sites
      sbx policy set-default deny-all
      sbx policy allow network api.example.com:443
see_also:
    - sbx policy - Manage sandbox policies
@y
      # Block everything, then allow specific sites
      sbx policy set-default deny-all
      sbx policy allow network api.example.com:443
see_also:
    - sbx policy - Manage sandbox policies
@z
