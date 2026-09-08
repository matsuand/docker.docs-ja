%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit pull
synopsis: Pull a kit artifact from an OCI registry
experimental: true
description: |-
    Pull a kit artifact from an OCI registry and save its layer payload to a file.
@y
name: sbx kit pull
synopsis: Pull a kit artifact from an OCI registry
experimental: true
description: |-
    Pull a kit artifact from an OCI registry and save its layer payload to a file.
@z

@x
    The reference should be in the format "registry/repo:tag" or
    "registry/repo@sha256:digest" (e.g., "ghcr.io/myorg/my-plugin:1.0").
@y
    The reference should be in the format "registry/repo:tag" or
    "registry/repo@sha256:digest" (e.g., "ghcr.io/myorg/my-plugin:1.0").
@z

@x
    The file extension is chosen automatically based on the kit's format:
      schemaVersion: "1"  → <name>.zip      (legacy ZIP archive)
      schemaVersion: "2"  → <name>.tar.gz   (standard OCI tar+gzip layer)
@y
    The file extension is chosen automatically based on the kit's format:
      schemaVersion: "1"  → <name>.zip      (legacy ZIP archive)
      schemaVersion: "2"  → <name>.tar.gz   (standard OCI tar+gzip layer)
@z

@x
    The registry must support HTTPS.
@y
    The registry must support HTTPS.
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
      usage: 'Output file path (default: derived from reference + format)'
@y
      usage: 'Output file path (default: derived from reference + format)'
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
