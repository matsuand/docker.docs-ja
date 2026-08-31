%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit pull
synopsis: Pull a kit artifact from an OCI registry
experimental: true
description: |-
    Pull a kit artifact from an OCI registry and save it as a ZIP file.
@y
name: sbx kit pull
synopsis: Pull a kit artifact from an OCI registry
experimental: true
description: |-
    Pull a kit artifact from an OCI registry and save it as a ZIP file.
@z

@x
    The reference should be in the format "registry/repo:tag" or
    "registry/repo@sha256:digest" (e.g., "ghcr.io/myorg/my-plugin:1.0").
@y
    The reference should be in the format "registry/repo:tag" or
    "registry/repo@sha256:digest" (e.g., "ghcr.io/myorg/my-plugin:1.0").
@z

@x
    Authentication: sbx registry secrets (sbx secret set --registry) take priority, falling back to the Docker credential store.
@y
    Authentication: sbx registry secrets (sbx secret set --registry) take priority, falling back to the Docker credential store.
@z

@x
usage: sbx kit pull REFERENCE [flags]
@y
usage: sbx kit pull REFERENCE [flags]
@z

% options:

@x help
      usage: help for pull
@y
      usage: help for pull
@z

@x output
      usage: 'Output ZIP file path (default: derived from reference)'
@y
      usage: 'Output ZIP file path (default: derived from reference)'
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx kit - Manage kit artifacts
@y
    - sbx kit - Manage kit artifacts
@z
