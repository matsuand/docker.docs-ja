%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit provenance
synopsis: Show the SLSA provenance attached to a kit
experimental: true
description: |-
    Print the SLSA provenance attestation attached to an OCI kit.
@y
name: sbx kit provenance
synopsis: Show the SLSA provenance attached to a kit
experimental: true
description: |-
    Print the SLSA provenance attestation attached to an OCI kit.
@z

@x
    Provenance is attached by `sbx kit push` as an OCI referrer of the kit
    manifest. It records the kit's content digests, the sandbox image its spec
    declares, and the source git commit the kit was pushed from.
@y
    Provenance is attached by `sbx kit push` as an OCI referrer of the kit
    manifest. It records the kit's content digests, the sandbox image its spec
    declares, and the source git commit the kit was pushed from.
@z

@x
    Provenance pushed without --sign is unsigned: it is printed but marked
    UNSIGNED, because anyone with push access to the repository could have
    written it. To verify a signed attestation, pass --key for a key-based
    signature, or --certificate-identity (or --certificate-identity-regexp)
    together with --certificate-oidc-issuer (or its regexp form) for a keyless
    one; only attestations that verify and whose subject matches the kit's own
    digest are reported as VERIFIED.
@y
    Provenance pushed without --sign is unsigned: it is printed but marked
    UNSIGNED, because anyone with push access to the repository could have
    written it. To verify a signed attestation, pass --key for a key-based
    signature, or --certificate-identity (or --certificate-identity-regexp)
    together with --certificate-oidc-issuer (or its regexp form) for a keyless
    one; only attestations that verify and whose subject matches the kit's own
    digest are reported as VERIFIED.
@z

@x
usage: sbx kit provenance REFERENCE [flags]
@y
usage: sbx kit provenance REFERENCE [flags]
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
      usage: help for provenance
@y
      usage: help for provenance
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
      # Show provenance (unsigned attestations are printed as-is)
      sbx kit provenance ghcr.io/org/my-kit:1.0
@y
example: |4-
      # Show provenance (unsigned attestations are printed as-is)
      sbx kit provenance ghcr.io/org/my-kit:1.0
@z

@x
      # Verify a signed attestation before printing it
      sbx kit provenance \
        --certificate-identity user@example.com \
        --certificate-oidc-issuer https://accounts.google.com \
        ghcr.io/org/my-kit:1.0
@y
      # Verify a signed attestation before printing it
      sbx kit provenance \
        --certificate-identity user@example.com \
        --certificate-oidc-issuer https://accounts.google.com \
        ghcr.io/org/my-kit:1.0
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
