%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx policy rm network
synopsis: Remove a network policy
description: |-
    Remove a network policy by rule ID, resource, or both.
@y
name: sbx policy rm network
synopsis: Remove a network policy
description: |-
    Remove a network policy by rule ID, resource, or both.
@z

@x
    Use "sbx policy ls" to see active policies and their IDs/resources.
@y
    Use "sbx policy ls" to see active policies and their IDs/resources.
@z

@x
usage: sbx policy rm network [flags]
@y
usage: sbx policy rm network [flags]
@z

%options:

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

%inherited_options:

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
      # Remove a rule by resource
      sbx policy rm network --resource api.example.com
@y
      # Remove a rule by resource
      sbx policy rm network --resource api.example.com
@z

@x
      # Remove a rule by ID
      sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
@y
      # Remove a rule by ID
      sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
@z

@x
      # Remove by ID and resource using one filter
      sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67 --resource "api.example.com,cdn.example.com"
see_also:
    - sbx policy rm - Remove a policy
@y
      # Remove by ID and resource using one filter
      sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67 --resource "api.example.com,cdn.example.com"
see_also:
    - sbx policy rm - Remove a policy
@z
