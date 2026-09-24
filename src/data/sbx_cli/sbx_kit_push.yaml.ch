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
    The OCI artifact format is selected from the kit's spec.yaml:
      schemaVersion: "1"  → legacy ZIP-based artifact
      schemaVersion: "2"  → v2 tar+gzip layer with the spec in the manifest
                            config blob and standard OCI annotations (so
                            distribution tooling can read kit metadata
                            without pulling layers)
@y
    The OCI artifact format is selected from the kit's spec.yaml:
      schemaVersion: "1"  → legacy ZIP-based artifact
      schemaVersion: "2"  → v2 tar+gzip layer with the spec in the manifest
                            config blob and standard OCI annotations (so
                            distribution tooling can read kit metadata
                            without pulling layers)
@z

@x
    With --sign, the pushed manifest is signed and the Sigstore bundle is
    attached to the kit as an OCI referrer. Signing is keyless (Fulcio +
    Rekor) unless --key is given for key-based signing.
@y
    With --sign, the pushed manifest is signed and the Sigstore bundle is
    attached to the kit as an OCI referrer. Signing is keyless (Fulcio +
    Rekor) unless --key is given for key-based signing.
@z

@x
    Every push also attaches a SLSA provenance attestation as an OCI
    referrer, recording the kit's content digests, the declared sandbox
    image, and the source git commit when the directory is a working tree.
    The provenance is unsigned unless --sign is given, in which case it is
    signed as a DSSE in-toto attestation with the same identity or key.
@y
    Every push also attaches a SLSA provenance attestation as an OCI
    referrer, recording the kit's content digests, the declared sandbox
    image, and the source git commit when the directory is a working tree.
    The provenance is unsigned unless --sign is given, in which case it is
    signed as a DSSE in-toto attestation with the same identity or key.
@z

@x
    Authentication: the Docker Hub session from sbx login and sbx registry
    secrets (sbx secret set --registry) take priority, falling back to the
    Docker credential store.
@y
    Authentication: the Docker Hub session from sbx login and sbx registry
    secrets (sbx secret set --registry) take priority, falling back to the
    Docker credential store.
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

@x sign
      usage: |
        Sign the pushed kit and attach the signature as an OCI referrer
@y
      usage: |
        Sign the pushed kit and attach the signature as an OCI referrer
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

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
