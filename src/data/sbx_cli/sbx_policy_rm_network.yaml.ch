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
usage: sbx policy rm network [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for network
    - name: id
      usage: Remove by rule ID
    - name: resource
      usage: Remove by resource value(s), comma-separated
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Remove a rule by resource
      sbx policy rm network --resource api.example.com
@y
    Use "sbx policy ls" to see active policies and their IDs/resources.
usage: sbx policy rm network [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for network
    - name: id
      usage: Remove by rule ID
    - name: resource
      usage: Remove by resource value(s), comma-separated
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
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
