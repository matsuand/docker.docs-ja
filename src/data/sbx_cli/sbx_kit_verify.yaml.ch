%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit verify
synopsis: Verify a kit artifact's signature
experimental: true
description: |-
    Verify a kit artifact's cosign-compatible signature.
@y
name: sbx kit verify
synopsis: Verify a kit artifact's signature
experimental: true
description: |-
    Verify a kit artifact's cosign-compatible signature.
@z

@x
    For a local directory, the kit.sig.bundle sidecar is checked
    against the kit's content. For a git reference, the repository is cloned and
    its committed kit.sig.bundle sidecar is checked the same way.
    For an OCI reference, signatures attached as OCI referrers are checked against
    the kit manifest.
@y
    For a local directory, the kit.sig.bundle sidecar is checked
    against the kit's content. For a git reference, the repository is cloned and
    its committed kit.sig.bundle sidecar is checked the same way.
    For an OCI reference, signatures attached as OCI referrers are checked against
    the kit manifest.
@z

@x
    Use --key to verify a key-based signature against a PEM public key. For
    keyless signatures, supply the accepted signer identity with
    --certificate-identity (or --certificate-identity-regexp) and
    --certificate-oidc-issuer (or --certificate-oidc-issuer-regexp).
@y
    Use --key to verify a key-based signature against a PEM public key. For
    keyless signatures, supply the accepted signer identity with
    --certificate-identity (or --certificate-identity-regexp) and
    --certificate-oidc-issuer (or --certificate-oidc-issuer-regexp).
@z

@x
    Pass --insecure-ignore-tlog to verify a private keyless signature made
    with --tlog-upload=false: it drops the requirement for a Rekor
    transparency-log entry and relies on the timestamp-authority timestamp
    instead. It has no effect on key-based verification.
@y
    Pass --insecure-ignore-tlog to verify a private keyless signature made
    with --tlog-upload=false: it drops the requirement for a Rekor
    transparency-log entry and relies on the timestamp-authority timestamp
    instead. It has no effect on key-based verification.
@z

@x
usage: sbx kit verify REFERENCE [flags]
@y
usage: sbx kit verify REFERENCE [flags]
@z

% options:

@x certificate-identity
      usage: Exact keyless signer identity (certificate SAN)
@y
      usage: Exact keyless signer identity (certificate SAN)
@z

@x certificate-identity-regexp
      usage: Keyless signer identity regexp (certificate SAN)
@y
      usage: Keyless signer identity regexp (certificate SAN)
@z

@x certificate-oidc-issuer
      usage: Exact keyless OIDC issuer
@y
      usage: Exact keyless OIDC issuer
@z

@x certificate-oidc-issuer-regexp
      usage: Keyless OIDC issuer regexp
@y
      usage: Keyless OIDC issuer regexp
@z

@x help
      usage: help for verify
@y
      usage: help for verify
@z

@x insecure-ignore-tlog
      usage: |
        Do not require a Rekor transparency-log entry (for private keyless signatures)
@y
      usage: |
        Do not require a Rekor transparency-log entry (for private keyless signatures)
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x key
      usage: Public key for key-based verification (PEM)
@y
      usage: Public key for key-based verification (PEM)
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Verify a key-based signature
      sbx kit verify --key cosign.pub ghcr.io/org/my-kit:1.0
@y
example: |4-
      # Verify a key-based signature
      sbx kit verify --key cosign.pub ghcr.io/org/my-kit:1.0
@z

@x
      # Verify a keyless signature by identity
      sbx kit verify \
        --certificate-identity user@example.com \
        --certificate-oidc-issuer https://accounts.google.com \
        ./my-kit/
@y
      # Verify a keyless signature by identity
      sbx kit verify \
        --certificate-identity user@example.com \
        --certificate-oidc-issuer https://accounts.google.com \
        ./my-kit/
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
