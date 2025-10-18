%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Verify a Docker Hardened Image
linktitle: Verify an image
description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images.
@y
title: Verify a Docker Hardened Image
linktitle: Verify an image
description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images.
@z

@x
keywords: verify container image, docker scout attest, cosign verify, sbom validation, signed container attestations
@y
keywords: verify container image, docker scout attest, cosign verify, sbom validation, signed container attestations
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHI) include signed attestations that verify the image’s
build process, contents, and security posture. These attestations are available
for each image variant and can be verified using
[cosign](https://docs.sigstore.dev/) or the Docker Scout CLI.
@y
Docker Hardened Images (DHI) include signed attestations that verify the image’s
build process, contents, and security posture. These attestations are available
for each image variant and can be verified using
[cosign](https://docs.sigstore.dev/) or the Docker Scout CLI.
@z

@x
Docker's public key for DHI images is published at:
@y
Docker's public key for DHI images is published at:
@z

@x
- https://registry.scout.docker.com/keyring/dhi/latest.pub
- https://github.com/docker-hardened-images/keyring
@y
- https://registry.scout.docker.com/keyring/dhi/latest.pub
- https://github.com/docker-hardened-images/keyring
@z

@x
## Verify attestations with Docker Scout
@y
## Verify attestations with Docker Scout
@z

@x
You can use the [Docker Scout](/scout/) CLI to list and retrieve attestations for Docker
Hardened Images, including images mirrored into your organization's namespace.
@y
You can use the [Docker Scout](__SUBDIR__/scout/) CLI to list and retrieve attestations for Docker
Hardened Images, including images mirrored into your organization's namespace.
@z

@x
> [!NOTE]
>
> Before you run `docker scout attest` commands, ensure any image that you have
> pulled locally is up to date with the remote image. You can do this by running
> `docker pull`. If you don't do this, you may see `No attestation found`.
@y
> [!NOTE]
>
> Before you run `docker scout attest` commands, ensure any image that you have
> pulled locally is up to date with the remote image. You can do this by running
> `docker pull`. If you don't do this, you may see `No attestation found`.
@z

@x
### Why use Docker Scout instead of cosign directly?
@y
### Why use Docker Scout instead of cosign directly?
@z

@x
While you can use cosign to verify attestations manually, the Docker Scout CLI
offers several key advantages when working with Docker Hardened Images:
@y
While you can use cosign to verify attestations manually, the Docker Scout CLI
offers several key advantages when working with Docker Hardened Images:
@z

@x
- Purpose-built experience: Docker Scout understands the structure of DHI
  attestations and image naming conventions, so you don't have to construct full
  image digests or URIs manually.
@y
- Purpose-built experience: Docker Scout understands the structure of DHI
  attestations and image naming conventions, so you don't have to construct full
  image digests or URIs manually.
@z

@x
- Automatic platform resolution: With Scout, you can specify the platform (e.g.,
  `--platform linux/amd64`), and it automatically verifies the correct image
  variant. Cosign requires you to look up the digest yourself.
@y
- Automatic platform resolution: With Scout, you can specify the platform (e.g.,
  `--platform linux/amd64`), and it automatically verifies the correct image
  variant. Cosign requires you to look up the digest yourself.
@z

@x
- Human-readable summaries: Scout returns summaries of attestation contents
  (e.g., package counts, provenance steps), whereas cosign only returns raw
  signature validation output.
@y
- Human-readable summaries: Scout returns summaries of attestation contents
  (e.g., package counts, provenance steps), whereas cosign only returns raw
  signature validation output.
@z

@x
- One-step validation: The `--verify` flag in `docker scout attest get` validates
  the attestation and shows the equivalent cosign command, making it easier to
  understand what's happening behind the scenes.
@y
- One-step validation: The `--verify` flag in `docker scout attest get` validates
  the attestation and shows the equivalent cosign command, making it easier to
  understand what's happening behind the scenes.
@z

@x
- Integrated with Docker Hub and DHI trust model: Docker Scout is tightly
  integrated with Docker’s attestation infrastructure and public keyring,
  ensuring compatibility and simplifying verification for users within the
  Docker ecosystem.
@y
- Integrated with Docker Hub and DHI trust model: Docker Scout is tightly
  integrated with Docker’s attestation infrastructure and public keyring,
  ensuring compatibility and simplifying verification for users within the
  Docker ecosystem.
@z

@x
In short, Docker Scout streamlines the verification process and reduces the chances of human error, while still giving
you full visibility and the option to fall back to cosign when needed.
@y
In short, Docker Scout streamlines the verification process and reduces the chances of human error, while still giving
you full visibility and the option to fall back to cosign when needed.
@z

@x
### List available attestations
@y
### List available attestations
@z

@x
To list attestations for a mirrored DHI:
@y
To list attestations for a mirrored DHI:
@z

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@z

@x
```console
$ docker scout attest list <your-org-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker scout attest list <your-org-namespace>/dhi-<image>:<tag>
```
@z

@x
This command shows all available attestations, including SBOMs, provenance, vulnerability reports, and more.
@y
This command shows all available attestations, including SBOMs, provenance, vulnerability reports, and more.
@z

@x
### Retrieve a specific attestation
@y
### Retrieve a specific attestation
@z

@x
To retrieve a specific attestation, use the `--predicate-type` flag with the full predicate type URI:
@y
To retrieve a specific attestation, use the `--predicate-type` flag with the full predicate type URI:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  <your-org-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  <your-org-namespace>/dhi-<image>:<tag>
```
@z

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  docs/dhi-python:3.13
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  docs/dhi-python:3.13
```
@z

@x
To retrieve only the predicate body:
@y
To retrieve only the predicate body:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --predicate \
  <your-org-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --predicate \
  <your-org-namespace>/dhi-<image>:<tag>
```
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --predicate \
  docs/dhi-python:3.13
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --predicate \
  docs/dhi-python:3.13
```
@z

@x
### Validate the attestation with Docker Scout
@y
### Validate the attestation with Docker Scout
@z

@x
To validate the attestation using Docker Scout, you can use the `--verify` flag:
@y
To validate the attestation using Docker Scout, you can use the `--verify` flag:
@z

@x
```console
$ docker scout attest get <image-name>:<tag> \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify
```
@y
```console
$ docker scout attest get <image-name>:<tag> \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify
```
@z

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-node:20.19-debian12-fips-20250701182639` instead of
> `docs/dhi-node:20.19-debian12-fips-20250701182639`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-node:20.19-debian12-fips-20250701182639` instead of
> `docs/dhi-node:20.19-debian12-fips-20250701182639`.
@z

@x
For example, to verify the SBOM attestation for the `dhi/node:20.19-debian12-fips-20250701182639` image:
@y
For example, to verify the SBOM attestation for the `dhi/node:20.19-debian12-fips-20250701182639` image:
@z

@x
```console
$ docker scout attest get docs/dhi-node:20.19-debian12-fips-20250701182639 \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify
```
@y
```console
$ docker scout attest get docs/dhi-node:20.19-debian12-fips-20250701182639 \
   --predicate-type https://scout.docker.com/sbom/v0.1 --verify
```
@z

@x
#### Handle missing transparency log entries
@y
#### Handle missing transparency log entries
@z

@x
When using `--verify`, you may sometimes see an error like:
@y
When using `--verify`, you may sometimes see an error like:
@z

@x
```text
ERROR no matching signatures: signature not found in transparency log
```
@y
```text
ERROR no matching signatures: signature not found in transparency log
```
@z

@x
This occurs because Docker Hardened Images don't always record attestations in
the public [Rekor](https://docs.sigstore.dev/logging/overview/) transparency
log. In cases where an attestation would contain private user information (for
example, your organization's namespace in the image reference), writing it to
Rekor would expose that information publicly.
@y
This occurs because Docker Hardened Images don't always record attestations in
the public [Rekor](https://docs.sigstore.dev/logging/overview/) transparency
log. In cases where an attestation would contain private user information (for
example, your organization's namespace in the image reference), writing it to
Rekor would expose that information publicly.
@z

@x
Even if the Rekor entry is missing, the attestation is still signed with
Docker's public key and can be verified offline by skipping the Rekor
transparency log check.
@y
Even if the Rekor entry is missing, the attestation is still signed with
Docker's public key and can be verified offline by skipping the Rekor
transparency log check.
@z

@x
To skip the transparency log check and validate against Docker's key, use the
`--skip-tlog` flag:
@y
To skip the transparency log check and validate against Docker's key, use the
`--skip-tlog` flag:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  <your-org-namespace>/dhi-<image>:<tag> \
  --verify --skip-tlog
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  <your-org-namespace>/dhi-<image>:<tag> \
  --verify --skip-tlog
```
@z

@x
> [!NOTE]
>
> The `--skip-tlog` flag is only available in Docker Scout CLI version 1.18.2 and
> later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@y
> [!NOTE]
>
> The `--skip-tlog` flag is only available in Docker Scout CLI version 1.18.2 and
> later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@z

@x
This is equivalent to using `cosign` with the `--insecure-ignore-tlog=true`
flag, which validates the signature against Docker's published public key, but
ignores the transparency log check.
@y
This is equivalent to using `cosign` with the `--insecure-ignore-tlog=true`
flag, which validates the signature against Docker's published public key, but
ignores the transparency log check.
@z

@x
### Show the equivalent cosign command
@y
### Show the equivalent cosign command
@z

@x
When using the `--verify` flag, it also prints the corresponding
[cosign](https://docs.sigstore.dev/) command to verify the image signature:
@y
When using the `--verify` flag, it also prints the corresponding
[cosign](https://docs.sigstore.dev/) command to verify the image signature:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --verify \
  <your-org-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --verify \
  <your-org-namespace>/dhi-<image>:<tag>
```
@z

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --verify \
  docs/dhi-python:3.13
```
@y
```console
$ docker scout attest get \
  --predicate-type https://cyclonedx.org/bom/v1.6 \
  --verify \
  docs/dhi-python:3.13
```
@z

@x
If verification succeeds, Docker Scout prints the full `cosign verify` command.
@y
If verification succeeds, Docker Scout prints the full `cosign verify` command.
@z

@x
Example output:
@y
Example output:
@z

@x
```console
    v SBOM obtained from attestation, 101 packages found
    v Provenance obtained from attestation
    v cosign verify registry.scout.docker.com/docker/dhi-python@sha256:b5418da893ada6272add2268573a3d5f595b5c486fb7ec58370a93217a9785ae \
        --key https://registry.scout.docker.com/keyring/dhi/latest.pub --experimental-oci11
    ...
```
@y
```console
    v SBOM obtained from attestation, 101 packages found
    v Provenance obtained from attestation
    v cosign verify registry.scout.docker.com/docker/dhi-python@sha256:b5418da893ada6272add2268573a3d5f595b5c486fb7ec58370a93217a9785ae \
        --key https://registry.scout.docker.com/keyring/dhi/latest.pub --experimental-oci11
    ...
```
@z

@x
> [!IMPORTANT]
>
> When using cosign, you must first authenticate to both the Docker Hub registry
> and the Docker Scout registry.
>
> For example:
>
> ```console
> $ docker login
> $ docker login registry.scout.docker.com
> $ cosign verify \
>     registry.scout.docker.com/docker/dhi-python@sha256:b5418da893ada6272add2268573a3d5f595b5c486fb7ec58370a93217a9785ae \
>     --key https://registry.scout.docker.com/keyring/dhi/latest.pub --experimental-oci11
> ```
@y
> [!IMPORTANT]
>
> When using cosign, you must first authenticate to both the Docker Hub registry
> and the Docker Scout registry.
>
> For example:
>
> ```console
> $ docker login
> $ docker login registry.scout.docker.com
> $ cosign verify \
>     registry.scout.docker.com/docker/dhi-python@sha256:b5418da893ada6272add2268573a3d5f595b5c486fb7ec58370a93217a9785ae \
>     --key https://registry.scout.docker.com/keyring/dhi/latest.pub --experimental-oci11
> ```
@z

@x
## Available DHI attestations
@y
## Available DHI attestations
@z

@x
See [available
attestations](../core-concepts/attestations.md#available-attestations) for list
of attestations available for each DHI.
@y
See [available
attestations](../core-concepts/attestations.md#available-attestations) for list
of attestations available for each DHI.
@z

@x
## Explore attestations on Docker Hub
@y
## Explore attestations on Docker Hub
@z

@x
You can also browse attestations visually when [exploring an image
variant](./explore.md#view-image-variant-details). The **Attestations** section
lists each available attestation with its:
@y
You can also browse attestations visually when [exploring an image
variant](./explore.md#view-image-variant-details). The **Attestations** section
lists each available attestation with its:
@z

@x
- Type (e.g. SBOM, VEX)
- Predicate type URI
- Digest reference for use with `cosign`
@y
- Type (e.g. SBOM, VEX)
- Predicate type URI
- Digest reference for use with `cosign`
@z

@x
These attestations are generated and signed automatically as part of the Docker
Hardened Image build process.
@y
These attestations are generated and signed automatically as part of the Docker
Hardened Image build process.
@z
