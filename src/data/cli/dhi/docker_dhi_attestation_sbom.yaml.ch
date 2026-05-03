%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi attestation sbom
short: Display the SPDX SBOM for a Docker Hardened Image
long: |-
    Display the SPDX SBOM attestation attached to a Docker Hardened Image
    in a human-readable format.
@y
command: docker dhi attestation sbom
short: Display the SPDX SBOM for a Docker Hardened Image
long: |-
    Display the SPDX SBOM attestation attached to a Docker Hardened Image
    in a human-readable format.
@z

@x
    The command fetches the SPDX SBOM attestation from the OCI Referrers API,
    extracts the SPDX document, and displays a summary with a package table.
@y
    The command fetches the SPDX SBOM attestation from the OCI Referrers API,
    extracts the SPDX document, and displays a summary with a package table.
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
    Examples:
      # Display the SBOM for an image
      docker dhi attestation sbom dhi/nginx:1.27
@y
    Examples:
      # Display the SBOM for an image
      docker dhi attestation sbom dhi/nginx:1.27
@z

@x
      # Display the SBOM for a specific platform
      docker dhi attestation sbom dhi/nginx:1.27 --platform linux/amd64
usage: docker dhi attestation sbom <image>
pname: docker dhi attestation
plink: docker_dhi_attestation.yaml
options:
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
      # Display the SBOM for a specific platform
      docker dhi attestation sbom dhi/nginx:1.27 --platform linux/amd64
usage: docker dhi attestation sbom <image>
pname: docker dhi attestation
plink: docker_dhi_attestation.yaml
options:
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
