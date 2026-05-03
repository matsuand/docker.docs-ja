%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi attestation list
short: List attestations for a Docker Hardened Image
long: |-
    List all attestations attached to a Docker Hardened Image.
@y
command: docker dhi attestation list
short: List attestations for a Docker Hardened Image
long: |-
    List all attestations attached to a Docker Hardened Image.
@z

@x
    The image can be specified as:
      - name:tag (e.g., nginx:1.27)
      - namespace/name:tag (e.g., dhi/nginx:1.27)
      - name@sha256:digest (e.g., nginx@sha256:abc123...)
@y
    The image can be specified as:
      - name:tag (e.g., nginx:1.27)
      - namespace/name:tag (e.g., dhi/nginx:1.27)
      - name@sha256:digest (e.g., nginx@sha256:abc123...)
@z

@x
    When a tag is provided, the digest is resolved from the container registry.
    Use --platform to select a specific platform manifest when the image is a multi-platform index.
@y
    When a tag is provided, the digest is resolved from the container registry.
    Use --platform to select a specific platform manifest when the image is a multi-platform index.
@z

@x
    Attestations are retrieved via the OCI Referrers API from the Docker Scout referrer registry.
@y
    Attestations are retrieved via the OCI Referrers API from the Docker Scout referrer registry.
@z

@x
    Examples:
      # List attestations for an image by tag
      docker dhi attestation list dhi/nginx:1.27
@y
    Examples:
      # List attestations for an image by tag
      docker dhi attestation list dhi/nginx:1.27
@z

@x
      # List attestations for a specific platform
      docker dhi attestation list dhi/nginx:1.27 --platform linux/amd64
@y
      # List attestations for a specific platform
      docker dhi attestation list dhi/nginx:1.27 --platform linux/amd64
@z

@x
      # List attestations for an image by digest
      docker dhi attestation list dhi/nginx@sha256:abc123...
@y
      # List attestations for an image by digest
      docker dhi attestation list dhi/nginx@sha256:abc123...
@z

@x
      # Filter by predicate type
      docker dhi attestation list dhi/nginx:1.27 --predicate-type https://spdx.dev/Document
@y
      # Filter by predicate type
      docker dhi attestation list dhi/nginx:1.27 --predicate-type https://spdx.dev/Document
@z

@x
      # Filter by multiple predicate types
      docker dhi attestation list dhi/nginx:1.27 --predicate-type https://spdx.dev/Document --predicate-type https://slsa.dev/provenance/v1
@y
      # Filter by multiple predicate types
      docker dhi attestation list dhi/nginx:1.27 --predicate-type https://spdx.dev/Document --predicate-type https://slsa.dev/provenance/v1
@z

@x
      # Output in JSON format
      docker dhi attestation list dhi/nginx:1.27 --json
usage: docker dhi attestation list <image>
pname: docker dhi attestation
plink: docker_dhi_attestation.yaml
options:
    - option: json
      value_type: bool
      default_value: "false"
      description: Output in JSON format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: |
        Platform to filter by (e.g., linux/amd64). Defaults to the Docker daemon platform
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: predicate-type
      value_type: stringArray
      default_value: '[]'
      description: Filter by predicate type (can be specified multiple times)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: org
      value_type: string
      description: Docker Hub organization (overrides config)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      # Output in JSON format
      docker dhi attestation list dhi/nginx:1.27 --json
usage: docker dhi attestation list <image>
pname: docker dhi attestation
plink: docker_dhi_attestation.yaml
options:
    - option: json
      value_type: bool
      default_value: "false"
      description: Output in JSON format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: |
        Platform to filter by (e.g., linux/amd64). Defaults to the Docker daemon platform
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: predicate-type
      value_type: stringArray
      default_value: '[]'
      description: Filter by predicate type (can be specified multiple times)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: org
      value_type: string
      description: Docker Hub organization (overrides config)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
