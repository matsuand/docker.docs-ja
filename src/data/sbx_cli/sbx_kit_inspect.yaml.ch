%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit inspect
synopsis: Show kit artifact details
experimental: true
description: |-
    Load and display details about a kit artifact.
@y
name: sbx kit inspect
synopsis: Show kit artifact details
experimental: true
description: |-
    Load and display details about a kit artifact.
@z

@x
    The reference can be a local directory, ZIP file path, OCI registry reference, or git repository.
@y
    The reference can be a local directory, ZIP file path, OCI registry reference, or git repository.
@z

@x
usage: sbx kit inspect REFERENCE [flags]
@y
usage: sbx kit inspect REFERENCE [flags]
@z

% options:

@x format
      usage: 'Output format: table, json or yaml'
@y
      usage: 'Output format: table, json or yaml'
@z

@x help
      usage: help for inspect
@y
      usage: help for inspect
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      sbx kit inspect ./my-kit
      sbx kit inspect ghcr.io/myorg/my-kit:1.0
@y
example: |4-
      sbx kit inspect ./my-kit
      sbx kit inspect ghcr.io/myorg/my-kit:1.0
@z

@x
      # Machine-readable output
      sbx kit inspect ghcr.io/myorg/my-kit:1.0 --format json
@y
      # Machine-readable output
      sbx kit inspect ghcr.io/myorg/my-kit:1.0 --format json
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
