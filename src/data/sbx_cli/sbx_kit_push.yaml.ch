%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit push
synopsis: Push a kit artifact to an OCI registry
experimental: true
description: |-
    Package and push a kit artifact directory to an OCI registry.
@y
name: sbx kit push
synopsis: Push a kit artifact to an OCI registry
experimental: true
description: |-
    Package and push a kit artifact directory to an OCI registry.
@z

@x
    The directory must contain a valid spec.yaml. The reference should be
    in the format "registry/repo:tag" (e.g., "ghcr.io/myorg/my-plugin:1.0").
@y
    The directory must contain a valid spec.yaml. The reference should be
    in the format "registry/repo:tag" (e.g., "ghcr.io/myorg/my-plugin:1.0").
@z

@x
    Authentication uses the Docker credential store.
@y
    Authentication uses the Docker credential store.
@z

@x
usage: sbx kit push DIRECTORY REFERENCE [flags]
@y
usage: sbx kit push DIRECTORY REFERENCE [flags]
@z

% options:

@x help
      usage: help for push
@y
      usage: help for push
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
