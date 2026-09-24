%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy init
synopsis: Initialize the global network policy
description: |-
    Initialize the global network policy that applies to all sandboxes.
@y
name: sbx policy init
synopsis: Initialize the global network policy
description: |-
    Initialize the global network policy that applies to all sandboxes.
@z

@x
    This sets the initial global network policy and must be run before adding
    custom allow/deny rules or starting a sandbox for the first time. It is a
    one-time setup: once initialized, use "sbx policy reset" to start over.
@y
    This sets the initial global network policy and must be run before adding
    custom allow/deny rules or starting a sandbox for the first time. It is a
    one-time setup: once initialized, use "sbx policy reset" to start over.
@z

@x
    This is the initial global policy, not a per-sandbox default; you can change
    it later. Per-sandbox rules, including those added by kits such as the
    built-in agent kits, apply on top for individual sandboxes.
@y
    This is the initial global policy, not a per-sandbox default; you can change
    it later. Per-sandbox rules, including those added by kits such as the
    built-in agent kits, apply on top for individual sandboxes.
@z

@x
    Available policies:
      allow-all   All outbound network traffic is allowed
      balanced    Typical development traffic is allowed, such as AI services and package registries
      deny-all    All outbound network traffic is blocked
@y
    Available policies:
      allow-all   All outbound network traffic is allowed
      balanced    Typical development traffic is allowed, such as AI services and package registries
      deny-all    All outbound network traffic is blocked
@z

@x
    After initializing, use "sbx policy allow/deny/rm" to change the global policy.
    Use "sbx policy reset" to clear all policies and start over.
@y
    After initializing, use "sbx policy allow/deny/rm" to change the global policy.
    Use "sbx policy reset" to clear all policies and start over.
@z

@x
    With --cloud:
    Set the default network mode of the cloud policy.
@y
    With --cloud:
    Set the default network mode of the cloud policy.
@z

@x
    There is no one-time setup: init sets the default mode for the account, or for
    one sandbox with --sandbox, keeps the existing allow and deny rules, and can be
    run again. balanced is deny-all plus the balanced allow list added to the scope.
    Use "sbx --cloud policy reset" to clear the rules first.
@y
    There is no one-time setup: init sets the default mode for the account, or for
    one sandbox with --sandbox, keeps the existing allow and deny rules, and can be
    run again. balanced is deny-all plus the balanced allow list added to the scope.
    Use "sbx --cloud policy reset" to clear the rules first.
@z

@x
usage: sbx policy init <allow-all|balanced|deny-all> [flags]
@y
usage: sbx policy init <allow-all|balanced|deny-all> [flags]
@z

% options:

@x help
      usage: help for init
@y
      usage: help for init
@z

@x sandbox
      usage: Target a single cloud sandbox's policy (cloud only)
@y
      usage: Target a single cloud sandbox's policy (cloud only)
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
      # Initialize with the balanced policy — recommended
      sbx policy init balanced
@y
example: |4-
      # Initialize with the balanced policy — recommended
      sbx policy init balanced
@z

@x
      # Allow all traffic
      sbx policy init allow-all
@y
      # Allow all traffic
      sbx policy init allow-all
@z

@x
      # Block everything, then allow specific sites
      sbx policy init deny-all
      sbx policy allow network api.example.com:443
@y
      # Block everything, then allow specific sites
      sbx policy init deny-all
      sbx policy allow network api.example.com:443
@z

@x
      # Set the account default to balanced
      sbx --cloud policy init balanced
@y
      # Set the account default to balanced
      sbx --cloud policy init balanced
@z

@x
      # Block everything for one sandbox, keeping its allow rules
      sbx --cloud policy init deny-all --sandbox my-sandbox
@y
      # Block everything for one sandbox, keeping its allow rules
      sbx --cloud policy init deny-all --sandbox my-sandbox
@z

% see_also:

@x
    - sbx policy - Manage sandbox policies
@y
    - sbx policy - Manage sandbox policies
@z
