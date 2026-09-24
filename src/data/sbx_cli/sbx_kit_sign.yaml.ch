%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit sign
synopsis: Sign a kit artifact
experimental: true
description: |-
    Sign a kit artifact with cosign-compatible Sigstore signatures.
@y
name: sbx kit sign
synopsis: Sign a kit artifact
experimental: true
description: |-
    Sign a kit artifact with cosign-compatible Sigstore signatures.
@z

@x
    For a local directory, a detached signature bundle is written to
    kit.sig.bundle next to spec.yaml. For an OCI reference, the
    signature is attached to the kit manifest as an OCI referrer.
@y
    For a local directory, a detached signature bundle is written to
    kit.sig.bundle next to spec.yaml. For an OCI reference, the
    signature is attached to the kit manifest as an OCI referrer.
@z

@x
    Signing is keyless by default (Fulcio + Rekor), which requires an OIDC
    identity token. In CI the token is minted automatically by the detected
    platform (GitHub Actions, Buildkite, GCP, SPIFFE, or a projected
    service-account token on disk). Elsewhere, supply one with
    --identity-token-file or --identity-token, or complete an interactive
    browser login. Prefer the file form: process arguments are readable by
    other local users and are recorded in shell history. A token is never
    read from SIGSTORE_ID_TOKEN, so it cannot be chosen by anything that can
    set an environment variable. Use --key for key-based signing with an
    unencrypted PEM private key.
@y
    Signing is keyless by default (Fulcio + Rekor), which requires an OIDC
    identity token. In CI the token is minted automatically by the detected
    platform (GitHub Actions, Buildkite, GCP, SPIFFE, or a projected
    service-account token on disk). Elsewhere, supply one with
    --identity-token-file or --identity-token, or complete an interactive
    browser login. Prefer the file form: process arguments are readable by
    other local users and are recorded in shell history. A token is never
    read from SIGSTORE_ID_TOKEN, so it cannot be chosen by anything that can
    set an environment variable. Use --key for key-based signing with an
    unencrypted PEM private key.
@z

@x
    For private kits whose signing event must not leak to a public log, pass
    --tlog-upload=false to skip the Rekor transparency log. This only affects
    keyless signing (key-based signing never uploads to Rekor) and requires
    the signing config to provide a timestamp authority so the signature stays
    verifiable after the short-lived certificate expires. For fully offline,
    private signing, prefer key-based signing with --key.
@y
    For private kits whose signing event must not leak to a public log, pass
    --tlog-upload=false to skip the Rekor transparency log. This only affects
    keyless signing (key-based signing never uploads to Rekor) and requires
    the signing config to provide a timestamp authority so the signature stays
    verifiable after the short-lived certificate expires. For fully offline,
    private signing, prefer key-based signing with --key.
@z

@x
usage: sbx kit sign REFERENCE [flags]
@y
usage: sbx kit sign REFERENCE [flags]
@z

% options:

@x help
      usage: help for sign
@y
      usage: help for sign
@z

@x identity-token
      usage: |
        OIDC identity token for keyless signing; defaults to the ambient CI provider, then an interactive browser login
@y
      usage: |
        OIDC identity token for keyless signing; defaults to the ambient CI provider, then an interactive browser login
@z

@x identity-token-file
      usage: |
        File holding the OIDC identity token; keeps it out of the process arguments
@y
      usage: |
        File holding the OIDC identity token; keeps it out of the process arguments
@z

@x key
      usage: |
        Private key for key-based signing (PEM); omit for keyless signing
@y
      usage: |
        Private key for key-based signing (PEM); omit for keyless signing
@z

@x tlog-upload
      usage: |
        Upload the keyless signature to the Rekor transparency log; set false for private kits
@y
      usage: |
        Upload the keyless signature to the Rekor transparency log; set false for private kits
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Keyless-sign a local kit directory
      sbx kit sign ./my-kit/
@y
example: |4-
      # Keyless-sign a local kit directory
      sbx kit sign ./my-kit/
@z

@x
      # Key-based sign an OCI kit
      sbx kit sign --key cosign.key ghcr.io/org/my-kit:1.0
@y
      # Key-based sign an OCI kit
      sbx kit sign --key cosign.key ghcr.io/org/my-kit:1.0
@z

@x
      # Keyless-sign without uploading to the public transparency log
      sbx kit sign --tlog-upload=false ghcr.io/org/private-kit:1.0
@y
      # Keyless-sign without uploading to the public transparency log
      sbx kit sign --tlog-upload=false ghcr.io/org/private-kit:1.0
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
