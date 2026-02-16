%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Verify a Docker Hardened Image or chart
linktitle: Verify an image or chart
description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images and charts.
@y
title: Verify a Docker Hardened Image or chart
linktitle: Verify an image or chart
description: Use Docker Scout or cosign to verify signed attestations like SBOMs, provenance, and vulnerability data for Docker Hardened Images and charts.
@z

@x
keywords: verify container image, docker scout attest, cosign verify, sbom validation, signed container attestations, helm chart verification
@y
keywords: verify container image, docker scout attest, cosign verify, sbom validation, signed container attestations, helm chart verification
@z

@x
Docker Hardened Images (DHI) and charts include signed attestations that verify
the build process, contents, and security posture.
@y
Docker Hardened Images (DHI) and charts include signed attestations that verify
the build process, contents, and security posture.
@z

@x
Docker's public key for DHI images and charts is published at:
@y
Docker's public key for DHI images and charts is published at:
@z

@x
- https://registry.scout.docker.com/keyring/dhi/latest.pub
- https://github.com/docker-hardened-images/keyring
@y
- https://registry.scout.docker.com/keyring/dhi/latest.pub
- https://github.com/docker-hardened-images/keyring
@z

@x
Docker recommends using [Docker Scout](/scout/), but you can use
[`regctl`](https://github.com/regclient/regclient) and
[`cosign`](https://docs.sigstore.dev/) to retrieve and verify attestations.
Docker Scout offers several key advantages: it understands DHI attestation
structures, automatically resolves platforms, provides human-readable summaries,
validates in one step with `--verify`, and integrates tightly with Docker's
attestation infrastructure.
@y
Docker recommends using [Docker Scout](__SUBDIR__/scout/), but you can use
[`regctl`](https://github.com/regclient/regclient) and
[`cosign`](https://docs.sigstore.dev/) to retrieve and verify attestations.
Docker Scout offers several key advantages: it understands DHI attestation
structures, automatically resolves platforms, provides human-readable summaries,
validates in one step with `--verify`, and integrates tightly with Docker's
attestation infrastructure.
@z

@x
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Images registry (`dhi.io`) to
> pull images. Use your Docker ID credentials (the same username and password
> you use for Docker Hub) when signing in. If you don't have a Docker account,
> [create one](../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@y
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Images registry (`dhi.io`) to
> pull images. Use your Docker ID credentials (the same username and password
> you use for Docker Hub) when signing in. If you don't have a Docker account,
> [create one](../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@z

@x
## Verify image attestations
@y
## Verify image attestations
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
### List available attestations
@y
### List available attestations
@z

@x
To list attestations for a mirrored DHI image:
@y
To list attestations for a mirrored DHI image:
@z

@x
{{< tabs group="tool" >}}
{{< tab name="Docker Scout" >}}
@y
{{< tabs group="tool" >}}
{{< tab name="Docker Scout" >}}
@z

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@z

% snip command...

@x
This command shows all available attestations, including SBOMs, provenance, vulnerability reports, and more.
@y
This command shows all available attestations, including SBOMs, provenance, vulnerability reports, and more.
@z

@x
{{< /tab >}}
{{< tab name="regctl" >}}
@y
{{< /tab >}}
{{< tab name="regctl" >}}
@z

@x
First, authenticate to both registries. Prepare a [personal access token
(PAT)](../../security/access-tokens.md) for your user with `read only` access:
@y
First, authenticate to both registries. Prepare a [personal access token
(PAT)](../../security/access-tokens.md) for your user with `read only` access:
@z

% snip command...

@x
Then list attestations using the `--external` flag. DHI repositories store image
layers on `dhi.io` (or `docker.io` for mirrored images) and signed attestations
in `registry.scout.docker.com`:
@y
Then list attestations using the `--external` flag. DHI repositories store image
layers on `dhi.io` (or `docker.io` for mirrored images) and signed attestations
in `registry.scout.docker.com`:
@z

% snip command...

@x
For example:
@y
For example:
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Retrieve a specific attestation
@y
### Retrieve a specific attestation
@z

@x
{{< tabs group="tool" >}}
{{< tab name="Docker Scout" >}}
@y
{{< tabs group="tool" >}}
{{< tab name="Docker Scout" >}}
@z

@x
To retrieve a specific attestation, use the `--predicate-type` flag with the full predicate type URI:
@y
To retrieve a specific attestation, use the `--predicate-type` flag with the full predicate type URI:
@z

% snip command...

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@z

@x
For example:
@y
For example:
@z

% snip command...

@x
To retrieve only the predicate body:
@y
To retrieve only the predicate body:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="regctl" >}}
@y
{{< /tab >}}
{{< tab name="regctl" >}}
@z

@x
Once you've listed attestations, download the full attestation artifact using the digest from the `Name` field:
@y
Once you've listed attestations, download the full attestation artifact using the digest from the `Name` field:
@z

% snip command...

@x
For example, to save a SLSA provenance attestation:
@y
For example, to save a SLSA provenance attestation:
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Validate the attestation
@y
### Validate the attestation
@z

@x
{{< tabs >}}
{{< tab name="Docker Scout" >}}
@y
{{< tabs >}}
{{< tab name="Docker Scout" >}}
@z

@x
To validate the attestation using Docker Scout, you can use the `--verify` flag:
@y
To validate the attestation using Docker Scout, you can use the `--verify` flag:
@z

% snip command...

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name
> with `registry://`. For example, use `registry://dhi.io/node:20.19-debian12`
> instead of `dhi.io/node:20.19-debian12`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name
> with `registry://`. For example, use `registry://dhi.io/node:20.19-debian12`
> instead of `dhi.io/node:20.19-debian12`.
@z

@x
For example, to verify the SBOM attestation for the `dhi.io/node:20.19-debian12` image:
@y
For example, to verify the SBOM attestation for the `dhi.io/node:20.19-debian12` image:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="cosign" >}}
@y
{{< /tab >}}
{{< tab name="cosign" >}}
@z

@x
Once you've listed the attestations and obtained the digest from the `Name` field, verify them using cosign:
@y
Once you've listed the attestations and obtained the digest from the `Name` field, verify them using cosign:
@z

% snip command...

@x
For example:
@y
For example:
@z

% snip command...

@x
> [!NOTE]
>
> The `--insecure-ignore-tlog=true` flag is needed because DHI attestations
> may not be recorded in the public Rekor transparency log to protect private
> customer information. The attestation signature is still verified against
> Docker's public key.
@y
> [!NOTE]
>
> The `--insecure-ignore-tlog=true` flag is needed because DHI attestations
> may not be recorded in the public Rekor transparency log to protect private
> customer information. The attestation signature is still verified against
> Docker's public key.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
#### Handle missing transparency log entries
@y
#### Handle missing transparency log entries
@z

@x
When using `--verify` with Docker Scout or `cosign verify`, you may sometimes
see an error like:
@y
When using `--verify` with Docker Scout or `cosign verify`, you may sometimes
see an error like:
@z

% snip output...

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

% snip command...

@x
> [!NOTE]
>
> The `--skip-tlog` flag is only available in Docker Scout CLI version 1.18.2 and
> later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@y
> [!NOTE]
>
> The `--skip-tlog` flag is only available in Docker Scout CLI version 1.18.2 and
> later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
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

% snip command...

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@z

@x
For example:
@y
For example:
@z

% snip command...

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

% snip command...

@x
> [!IMPORTANT]
>
> When using cosign, you must first authenticate to both the DHI registry
> and the Docker Scout registry.
>
> For example:
@y
> [!IMPORTANT]
>
> When using cosign, you must first authenticate to both the DHI registry
> and the Docker Scout registry.
>
> For example:
@z

% snip command...

@x
## Verify Helm chart attestations with Docker Scout
@y
## Verify Helm chart attestations with Docker Scout
@z

@x
Docker Hardened Image Helm charts include the same comprehensive attestations
as container images. The verification process for charts is identical to that
for images, using the same Docker Scout CLI commands.
@y
Docker Hardened Image Helm charts include the same comprehensive attestations
as container images. The verification process for charts is identical to that
for images, using the same Docker Scout CLI commands.
@z

@x
### List available chart attestations
@y
### List available chart attestations
@z

@x
To list attestations for a DHI Helm chart:
@y
To list attestations for a DHI Helm chart:
@z

% snip command...

@x
For example, to list attestations for the external-dns chart:
@y
For example, to list attestations for the external-dns chart:
@z

% snip command...

@x
This command shows all available chart attestations, including SBOMs, provenance, vulnerability reports, and more.
@y
This command shows all available chart attestations, including SBOMs, provenance, vulnerability reports, and more.
@z

@x
### Retrieve a specific chart attestation
@y
### Retrieve a specific chart attestation
@z

@x
To retrieve a specific attestation from a Helm chart, use the `--predicate-type` flag with the full predicate type URI:
@y
To retrieve a specific attestation from a Helm chart, use the `--predicate-type` flag with the full predicate type URI:
@z

% snip command...

@x
For example:
@y
For example:
@z

% snip command...

@x
To retrieve only the predicate body:
@y
To retrieve only the predicate body:
@z

% snip command...

@x
### Validate chart attestations with Docker Scout
@y
### Validate chart attestations with Docker Scout
@z

@x
To validate a chart attestation using Docker Scout, use the `--verify` flag:
@y
To validate a chart attestation using Docker Scout, use the `--verify` flag:
@z

% snip command...

@x
For example, to verify the SBOM attestation for the external-dns chart:
@y
For example, to verify the SBOM attestation for the external-dns chart:
@z

% snip command...

@x
The same `--skip-tlog` flag described in [Handle missing transparency log
entries](#handle-missing-transparency-log-entries) can also be used with chart
attestations when needed.
@y
The same `--skip-tlog` flag described in [Handle missing transparency log
entries](#handle-missing-transparency-log-entries) can also be used with chart
attestations when needed.
@z

@x
## Available DHI attestations
@y
## Available DHI attestations
@z

@x
See [available
attestations](../core-concepts/attestations.md#image-attestations) for a list
of attestations available for each DHI image and [Helm chart
attestations](../core-concepts/attestations.md#helm-chart-attestations) for a
list of attestations available for each DHI chart.
@y
See [available
attestations](../core-concepts/attestations.md#image-attestations) for a list
of attestations available for each DHI image and [Helm chart
attestations](../core-concepts/attestations.md#helm-chart-attestations) for a
list of attestations available for each DHI chart.
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
Hardened Image or chart build process.
@y
These attestations are generated and signed automatically as part of the Docker
Hardened Image or chart build process.
@z
