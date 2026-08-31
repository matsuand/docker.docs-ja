%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit add
synopsis: Add a kit to a running sandbox
experimental: true
description: |-
    Inject a kit artifact into an already-running sandbox.
@y
name: sbx kit add
synopsis: Add a kit to a running sandbox
experimental: true
description: |-
    Inject a kit artifact into an already-running sandbox.
@z

@x
    The kit's files, init files, and startup commands are applied to the
    running container. This allows extending a sandbox without recreating it.
@y
    The kit's files, init files, and startup commands are applied to the
    running container. This allows extending a sandbox without recreating it.
@z

@x
    The sandbox must already exist (created or running). The reference can be a local directory,
    ZIP file path, OCI registry reference, or git repository.
@y
    The sandbox must already exist (created or running). The reference can be a local directory,
    ZIP file path, OCI registry reference, or git repository.
@z

@x
usage: sbx kit add SANDBOX REFERENCE [flags]
@y
usage: sbx kit add SANDBOX REFERENCE [flags]
@z

% options:

@x help
      usage: help for add
@y
      usage: help for add
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Add a local kit directory to a sandbox
      sbx kit add my-sandbox ./mcp-postgres/
@y
example: |4-
      # Add a local kit directory to a sandbox
      sbx kit add my-sandbox ./mcp-postgres/
@z

@x
      # Add a kit from a ZIP file
      sbx kit add my-sandbox ./mcp-postgres.zip
@y
      # Add a kit from a ZIP file
      sbx kit add my-sandbox ./mcp-postgres.zip
@z

@x
      # Add a kit from an OCI registry
      sbx kit add my-sandbox ghcr.io/myorg/mcp-postgres:1.0
@y
      # Add a kit from an OCI registry
      sbx kit add my-sandbox ghcr.io/myorg/mcp-postgres:1.0
@z

@x
      # Add a kit from a git repository
      sbx kit add my-sandbox git+https://github.com/org/kits.git#dir=mcp-postgres
@y
      # Add a kit from a git repository
      sbx kit add my-sandbox git+https://github.com/org/kits.git#dir=mcp-postgres
@z

% see_also:

@x
    - sbx kit - Manage kit artifacts
@y
    - sbx kit - Manage kit artifacts
@z
