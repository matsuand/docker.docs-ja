%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Scout SBOMs
description: Use Docker Scout to extract the SBOM for your project.
keywords: scout, supply chain, sbom, software bill of material, spdx
---
@y
---
title: Docker Scout SBOMs
description: Use Docker Scout to extract the SBOM for your project.
keywords: scout, supply chain, sbom, software bill of material, spdx
---
@z

@x
As part of [image analysis](./image-analysis.md), Docker Scout generates a
Software Bill of Material (SBOM) for your project. The SBOM uses the Software
Package Data Exchange (SPDX) format.
@y
As part of [image analysis](./image-analysis.md), Docker Scout generates a
Software Bill of Material (SBOM) for your project. The SBOM uses the Software
Package Data Exchange (SPDX) format.
@z

@x
## View from CLI
@y
## View from CLI
@z

@x
To view the contents of the SBOM that Docker Scout generates, you can use the
`docker scout sbom` command.
@y
To view the contents of the SBOM that Docker Scout generates, you can use the
`docker scout sbom` command.
@z

@x
```console
$ docker scout sbom [IMAGE]
```
@y
```console
$ docker scout sbom [IMAGE]
```
@z

@x
By default, this prints the SBOM in a JSON format to stdout.
@y
By default, this prints the SBOM in a JSON format to stdout.
@z

@x
> **Note**
>
> The JSON format produced by `docker scout sbom` isn't SPDX-JSON. To generate
> SPDX, use the SBOM generator plugin for BuildKit, see [Attach the SBOM as a
> build attestation](#attest).
@y
> **Note**
>
> The JSON format produced by `docker scout sbom` isn't SPDX-JSON. To generate
> SPDX, use the SBOM generator plugin for BuildKit, see [Attach the SBOM as a
> build attestation](#attest).
@z

@x
Use the `--format list` flag to generate a human-readable output.
@y
Use the `--format list` flag to generate a human-readable output.
@z

@x
```console
$ docker scout sbom --format list alpine
@y
```console
$ docker scout sbom --format list alpine
@z

@x
           Name             Version    Type
───────────────────────────────────────────────
  alpine-baselayout       3.4.3-r1     apk
  alpine-baselayout-data  3.4.3-r1     apk
  alpine-keys             2.4-r1       apk
  apk-tools               2.14.0-r2    apk
  busybox                 1.36.1-r2    apk
  busybox-binsh           1.36.1-r2    apk
  ca-certificates         20230506-r0  apk
  ca-certificates-bundle  20230506-r0  apk
  libc-dev                0.7.2-r5     apk
  libc-utils              0.7.2-r5     apk
  libcrypto3              3.1.2-r0     apk
  libssl3                 3.1.2-r0     apk
  musl                    1.2.4-r1     apk
  musl-utils              1.2.4-r1     apk
  openssl                 3.1.2-r0     apk
  pax-utils               1.3.7-r1     apk
  scanelf                 1.3.7-r1     apk
  ssl_client              1.36.1-r2    apk
  zlib                    1.2.13-r1    apk
```
@y
           Name             Version    Type
───────────────────────────────────────────────
  alpine-baselayout       3.4.3-r1     apk
  alpine-baselayout-data  3.4.3-r1     apk
  alpine-keys             2.4-r1       apk
  apk-tools               2.14.0-r2    apk
  busybox                 1.36.1-r2    apk
  busybox-binsh           1.36.1-r2    apk
  ca-certificates         20230506-r0  apk
  ca-certificates-bundle  20230506-r0  apk
  libc-dev                0.7.2-r5     apk
  libc-utils              0.7.2-r5     apk
  libcrypto3              3.1.2-r0     apk
  libssl3                 3.1.2-r0     apk
  musl                    1.2.4-r1     apk
  musl-utils              1.2.4-r1     apk
  openssl                 3.1.2-r0     apk
  pax-utils               1.3.7-r1     apk
  scanelf                 1.3.7-r1     apk
  ssl_client              1.36.1-r2    apk
  zlib                    1.2.13-r1    apk
```
@z

@x
For more information about the `docker scout sbom` command, refer to the [CLI
reference](../reference/cli/docker/scout/sbom.md).
@y
For more information about the `docker scout sbom` command, refer to the [CLI
reference](../reference/cli/docker/scout/sbom.md).
@z

@x
## Attach as build attestation {#attest}
@y
## Attach as build attestation {#attest}
@z

@x
You can generate the SBOM and attach it to the image at build-time as an
[attestation](../build/attestations/_index.md). BuildKit provides a default
SBOM generator which is different from what Docker Scout uses. You can swap out
the default generator and replace it with the Docker Scout SBOM generator,
which creates richer results and ensures better compatibility with the Docker
Scout image analysis.
@y
You can generate the SBOM and attach it to the image at build-time as an
[attestation](../build/attestations/_index.md). BuildKit provides a default
SBOM generator which is different from what Docker Scout uses. You can swap out
the default generator and replace it with the Docker Scout SBOM generator,
which creates richer results and ensures better compatibility with the Docker
Scout image analysis.
@z

@x
```console
$ docker build --tag <org>/<image> \
  --attest type=sbom,generator=docker/scout-sbom-indexer:latest \
  --push .
```
@y
```console
$ docker build --tag <org>/<image> \
  --attest type=sbom,generator=docker/scout-sbom-indexer:latest \
  --push .
```
@z

@x
The default, non-containerd image store doesn't currently support images with
attestations. To build images with SBOM attestations, you can either turn on
the [containerd image store](../desktop/containerd.md) feature, or use a
`docker-container` builder together with the `--push` flag to push the image
(with attestations) directly to a registry.
@y
The default, non-containerd image store doesn't currently support images with
attestations. To build images with SBOM attestations, you can either turn on
the [containerd image store](../desktop/containerd.md) feature, or use a
`docker-container` builder together with the `--push` flag to push the image
(with attestations) directly to a registry.
@z

@x
## Extract to file
@y
## Extract to file
@z

@x
The command for extracting the SBOM of an image to an SPDX JSON file is
different depending on whether the image has been pushed to a registry or if
it's a local image.
@y
The command for extracting the SBOM of an image to an SPDX JSON file is
different depending on whether the image has been pushed to a registry or if
it's a local image.
@z

@x
### Remote image
@y
### Remote image
@z

@x
To extract the SBOM of an image and save it to a file, you can use the `docker
buildx imagetools inspect` command. This command only works for images in a
registry.
@y
To extract the SBOM of an image and save it to a file, you can use the `docker
buildx imagetools inspect` command. This command only works for images in a
registry.
@z

@x
```console
$ docker buildx imagetools inspect <image> --format "{{ json .SBOM }}" > sbom.spdx.json
```
@y
```console
$ docker buildx imagetools inspect <image> --format "{{ json .SBOM }}" > sbom.spdx.json
```
@z

@x
### Local image
@y
### Local image
@z

@x
To extract the SPDX file for a local image, build the image with the `local`
exporter and use the `scout-sbom-indexer` SBOM generator plugin.
@y
To extract the SPDX file for a local image, build the image with the `local`
exporter and use the `scout-sbom-indexer` SBOM generator plugin.
@z

@x
The following command saves the SBOM to a file at `build/sbom.spdx.json`.
@y
The following command saves the SBOM to a file at `build/sbom.spdx.json`.
@z

@x
```console
$ docker build --attest type=sbom,generator=docker/scout-sbom-indexer:latest \
  --output build .
```
@y
```console
$ docker build --attest type=sbom,generator=docker/scout-sbom-indexer:latest \
  --output build .
```
@z
