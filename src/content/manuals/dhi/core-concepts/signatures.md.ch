%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Code signing
description: Understand how Docker Hardened Images are cryptographically signed using Cosign to verify authenticity, integrity, and secure provenance.
keywords: container image signing, cosign docker image, verify image signature, signed container image, sigstore cosign
@y
title: Code signing
description: Understand how Docker Hardened Images are cryptographically signed using Cosign to verify authenticity, integrity, and secure provenance.
keywords: container image signing, cosign docker image, verify image signature, signed container image, sigstore cosign
@z

@x
## What is code signing?
@y
## What is code signing?
@z

@x
Code signing is the process of applying a cryptographic signature to software
artifacts, such as Docker images, to verify their integrity and authenticity. By
signing an image, you ensure that it has not been altered since it was signed
and that it originates from a trusted source.
@y
Code signing is the process of applying a cryptographic signature to software
artifacts, such as Docker images, to verify their integrity and authenticity. By
signing an image, you ensure that it has not been altered since it was signed
and that it originates from a trusted source.
@z

@x
In the context of Docker Hardened Images (DHIs), code signing is achieved using
[Cosign](https://docs.sigstore.dev/), a tool developed by the Sigstore project.
Cosign enables secure and verifiable signing of container images, enhancing
trust and security in the software supply chain.
@y
In the context of Docker Hardened Images (DHIs), code signing is achieved using
[Cosign](https://docs.sigstore.dev/), a tool developed by the Sigstore project.
Cosign enables secure and verifiable signing of container images, enhancing
trust and security in the software supply chain.
@z

@x
## Why is code signing important?
@y
## Why is code signing important?
@z

@x
Code signing plays a crucial role in modern software development and
cybersecurity:
@y
Code signing plays a crucial role in modern software development and
cybersecurity:
@z

@x
- Authenticity: Verifies that the image was created by a trusted source.
- Integrity: Ensures that the image has not been tampered with since it was
  signed.
- Compliance: Helps meet regulatory and organizational security requirements.
@y
- Authenticity: Verifies that the image was created by a trusted source.
- Integrity: Ensures that the image has not been tampered with since it was
  signed.
- Compliance: Helps meet regulatory and organizational security requirements.
@z

@x
## Docker Hardened Image code signing
@y
## Docker Hardened Image code signing
@z

@x
Each DHI is cryptographically signed using Cosign, ensuring that the images have
not been tampered with and originate from a trusted source.
@y
Each DHI is cryptographically signed using Cosign, ensuring that the images have
not been tampered with and originate from a trusted source.
@z

@x
## Why sign your own images?
@y
## Why sign your own images?
@z

@x
Docker Hardened Images are signed by Docker to prove their origin and integrity,
but if you're building application images that extend or use DHIs as a base, you
should sign your own images as well.
@y
Docker Hardened Images are signed by Docker to prove their origin and integrity,
but if you're building application images that extend or use DHIs as a base, you
should sign your own images as well.
@z

@x
By signing your own images, you can:
@y
By signing your own images, you can:
@z

@x
- Prove the image was built by your team or pipeline
- Ensure your build hasn't been tampered with after it's pushed
- Support software supply chain frameworks like SLSA
- Enable image verification in deployment workflows
@y
- Prove the image was built by your team or pipeline
- Ensure your build hasn't been tampered with after it's pushed
- Support software supply chain frameworks like SLSA
- Enable image verification in deployment workflows
@z

@x
This is especially important in CI/CD environments where you build and push
images frequently, or in any scenario where image provenance must be auditable.
@y
This is especially important in CI/CD environments where you build and push
images frequently, or in any scenario where image provenance must be auditable.
@z

@x
## How to view and use code signatures
@y
## How to view and use code signatures
@z

@x
### View signatures
@y
### View signatures
@z

@x
You can verify that a Docker Hardened Image is signed and trusted using either Docker Scout or Cosign.
@y
You can verify that a Docker Hardened Image is signed and trusted using either Docker Scout or Cosign.
@z

@x
To lists all attestations, including signature metadata, attached to the image, use the following command:
@y
To lists all attestations, including signature metadata, attached to the image, use the following command:
@z

@x
```console
$ docker scout attest list <image-name>:<tag>
```
@y
```console
$ docker scout attest list <image-name>:<tag>
```
@z

@x
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python` instead of `dhi.io/python`.
@y
> [!NOTE]
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python` instead of `dhi.io/python`.
@z

@x
To verify a specific signed attestation (e.g., SBOM, VEX, provenance):
@y
To verify a specific signed attestation (e.g., SBOM, VEX, provenance):
@z

@x
```console
$ docker scout attest get \
  --predicate-type <predicate-uri> \
  --verify \
  <image-name>:<tag>
```
@y
```console
$ docker scout attest get \
  --predicate-type <predicate-uri> \
  --verify \
  <image-name>:<tag>
```
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

@x
For example:
@y
For example:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://openvex.dev/ns/v0.2.0 \
  --verify \
  dhi.io/python:3.13
```
@y
```console
$ docker scout attest get \
  --predicate-type https://openvex.dev/ns/v0.2.0 \
  --verify \
  dhi.io/python:3.13
```
@z

@x
If valid, Docker Scout will confirm the signature and display signature payload, as well as the equivalent Cosign command to verify the image.
@y
If valid, Docker Scout will confirm the signature and display signature payload, as well as the equivalent Cosign command to verify the image.
@z

@x
### Sign images
@y
### Sign images
@z

@x
To sign a Docker image, use [Cosign](https://docs.sigstore.dev/). Replace
`<image-name>:<tag>` with the image name and tag.
@y
To sign a Docker image, use [Cosign](https://docs.sigstore.dev/). Replace
`<image-name>:<tag>` with the image name and tag.
@z

@x
```console
$ cosign sign <image-name>:<tag>
```
@y
```console
$ cosign sign <image-name>:<tag>
```
@z

@x
This command will prompt you to authenticate via an OIDC provider (such as
GitHub, Google, or Microsoft). Upon successful authentication, Cosign will
generate a short-lived certificate and sign the image. The signature will be
stored in a transparency log and associated with the image in the registry.
@y
This command will prompt you to authenticate via an OIDC provider (such as
GitHub, Google, or Microsoft). Upon successful authentication, Cosign will
generate a short-lived certificate and sign the image. The signature will be
stored in a transparency log and associated with the image in the registry.
@z
