%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy rm network
synopsis: Remove a network rule
description: |-
    Remove a network rule by rule ID, resource, or both.
@y
name: sbx policy rm network
synopsis: Remove a network rule
description: |-
    Remove a network rule by rule ID, resource, or both.
@z

@x
    Use -g/--global to remove from the global policy, or provide SANDBOX to
    remove from policy "local" scoped to that sandbox.
@y
    Use -g/--global to remove from the global policy, or provide SANDBOX to
    remove from policy "local" scoped to that sandbox.
@z

@x
    Use "sbx policy ls" to see active policies and their IDs/resources.
@y
    Use "sbx policy ls" to see active policies and their IDs/resources.
@z

@x
usage: sbx policy rm network [-g | SANDBOX] [flags]
@y
usage: sbx policy rm network [-g | SANDBOX] [flags]
@z

% options:

@x global
      usage: Remove from the global policy
@y
      usage: Remove from the global policy
@z

@x help
      usage: help for network
@y
      usage: help for network
@z

@x id
      usage: Remove by rule ID
@y
      usage: Remove by rule ID
@z

@x resource
      usage: Remove by resource value(s), comma-separated
@y
      usage: Remove by resource value(s), comma-separated
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # List policies to find the ID or resource to remove
      sbx policy ls
@y
example: |4-
      # List policies to find the ID or resource to remove
      sbx policy ls
@z

@x
      # Remove a global rule by resource
      sbx policy rm network -g --resource api.example.com
@y
      # Remove a global rule by resource
      sbx policy rm network -g --resource api.example.com
@z

@x
      # Remove a global rule by ID
      sbx policy rm network -g --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
@y
      # Remove a global rule by ID
      sbx policy rm network -g --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
@z

@x
      # Remove a sandbox-scoped rule by resource
      sbx policy rm network my-sandbox --resource api.example.com
@y
      # Remove a sandbox-scoped rule by resource
      sbx policy rm network my-sandbox --resource api.example.com
@z

% see_also:

@x
    - sbx policy rm - Remove a policy rule
@y
    - sbx policy rm - Remove a policy rule
@z
