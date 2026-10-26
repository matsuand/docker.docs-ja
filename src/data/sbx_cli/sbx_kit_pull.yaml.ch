%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit pull
synopsis: Pull a kit artifact from an OCI registry
experimental: true
description: |-
    Pull a kit artifact from an OCI registry and save its payload to a file.
    Use a registry/repo:tag or registry/repo@sha256:digest reference.
@y
name: sbx kit pull
synopsis: Pull a kit artifact from an OCI registry
experimental: true
description: |-
    Pull a kit artifact from an OCI registry and save its payload to a file.
    Use a registry/repo:tag or registry/repo@sha256:digest reference.
@z

@x
    The output extension follows the resolved artifact format: .zip for v1,
    or .tar.gz for v2. Use --output to choose the file path.
@y
    The output extension follows the resolved artifact format: .zip for v1,
    or .tar.gz for v2. Use --output to choose the file path.
@z

@x
    For Docker Hub, the sbx login session takes priority. Other registries use
    secrets set with sbx secret set --registry. Both fall back to Docker credentials.
    The registry must support HTTPS.
@y
    For Docker Hub, the sbx login session takes priority. Other registries use
    secrets set with sbx secret set --registry. Both fall back to Docker credentials.
    The registry must support HTTPS.
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
