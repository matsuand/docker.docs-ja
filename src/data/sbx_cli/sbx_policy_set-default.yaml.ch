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
      balanced    Typical development traffic is allowed (AI services, package registries, etc.)
      deny-all    All outbound network traffic is blocked
@y
    Available policies:
      allow-all   All outbound network traffic is allowed
      balanced    Typical development traffic is allowed (AI services, package registries, etc.)
      deny-all    All outbound network traffic is blocked
@z

@x
    After setting defaults, use "sbx policy allow/deny" to add custom rules.
    Use "sbx policy reset" to clear all policies and start over.
@y
    After setting defaults, use "sbx policy allow/deny" to add custom rules.
    Use "sbx policy reset" to clear all policies and start over.
@z

@x
usage: sbx policy set-default <allow-all|balanced|deny-all> [flags]
@y
usage: sbx policy set-default <allow-all|balanced|deny-all> [flags]
@z

% options:

@x help
      usage: help for set-default
@y
      usage: help for set-default
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Set balanced defaults (recommended)
      sbx policy set-default balanced
@y
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
      sbx policy allow network -g api.example.com:443
@y
      # Block everything, then allow specific sites
      sbx policy set-default deny-all
      sbx policy allow network -g api.example.com:443
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
