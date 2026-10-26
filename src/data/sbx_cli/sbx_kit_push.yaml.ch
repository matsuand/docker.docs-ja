%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit push
synopsis: Push a kit artifact to an OCI registry
experimental: true
description: |-
    Package a kit directory containing spec.yaml and push it to an OCI registry.
    Use a registry/repo:tag reference. The kit's schema selects the artifact format.
@y
name: sbx kit push
synopsis: Push a kit artifact to an OCI registry
experimental: true
description: |-
    Package a kit directory containing spec.yaml and push it to an OCI registry.
    Use a registry/repo:tag reference. The kit's schema selects the artifact format.
@z

@x
    Every push attaches provenance. Use --sign to also sign the manifest and
    provenance; signing is keyless unless --key is supplied.
@y
    Every push attaches provenance. Use --sign to also sign the manifest and
    provenance; signing is keyless unless --key is supplied.
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
