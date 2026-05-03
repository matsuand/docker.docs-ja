%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi attestation get
short: Get attestation for a Docker Hardened Image
long: |-
    Get an attestation attached to a Docker Hardened Image.
@y
command: docker dhi attestation get
short: Get attestation for a Docker Hardened Image
long: |-
    Get an attestation attached to a Docker Hardened Image.
@z

@x
    Returns the in-toto statement extracted from the attestation referrer.
    The referrer digest must be provided to select which attestation to retrieve.
    Use 'docker dhi attestation list' to discover available attestation digests.
@y
    Returns the in-toto statement extracted from the attestation referrer.
    The referrer digest must be provided to select which attestation to retrieve.
    Use 'docker dhi attestation list' to discover available attestation digests.
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
      # Get attestation by referrer digest
      docker dhi attestation get dhi/nginx:1.27 sha256:abc123...
@y
    Examples:
      # Get attestation by referrer digest
      docker dhi attestation get dhi/nginx:1.27 sha256:abc123...
@z

@x
      # Save attestation to a file
      docker dhi attestation get dhi/nginx:1.27 sha256:abc123... -o provenance.json
@y
      # Save attestation to a file
      docker dhi attestation get dhi/nginx:1.27 sha256:abc123... -o provenance.json
@z

@x
      # Extract only the predicate using jq
      docker dhi attestation get dhi/nginx:1.27 sha256:abc123... | jq .predicate
usage: docker dhi attestation get <image> <digest>
pname: docker dhi attestation
plink: docker_dhi_attestation.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: Write output to file instead of stdout
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
      # Extract only the predicate using jq
      docker dhi attestation get dhi/nginx:1.27 sha256:abc123... | jq .predicate
usage: docker dhi attestation get <image> <digest>
pname: docker dhi attestation
plink: docker_dhi_attestation.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: Write output to file instead of stdout
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
