%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Image digests
description: Learn how Docker Hardened Images help secure every stage of your software supply chain with signed metadata, provenance, and minimal attack surface.
keywords: docker image digest, pull image by digest, immutable container image, secure container reference, multi-platform manifest
@y
title: Image digests
description: Learn how Docker Hardened Images help secure every stage of your software supply chain with signed metadata, provenance, and minimal attack surface.
keywords: docker image digest, pull image by digest, immutable container image, secure container reference, multi-platform manifest
@z

@x
## What are Docker image digests?
@y
## What are Docker image digests?
@z

@x
A Docker image digest is a unique, cryptographic identifier (SHA-256 hash)
representing the content of a Docker image. Unlike tags, which can be reused or
changed, a digest is immutable and ensures that the exact same image is pulled
every time. This guarantees consistency across different environments and
deployments.
@y
A Docker image digest is a unique, cryptographic identifier (SHA-256 hash)
representing the content of a Docker image. Unlike tags, which can be reused or
changed, a digest is immutable and ensures that the exact same image is pulled
every time. This guarantees consistency across different environments and
deployments.
@z

@x
For example, the digest for the `nginx:latest` image might look like:
@y
For example, the digest for the `nginx:latest` image might look like:
@z

@x
```text
sha256:94a00394bc5a8ef503fb59db0a7d0ae9e1110866e8aee8ba40cd864cea69ea1a
```
@y
```text
sha256:94a00394bc5a8ef503fb59db0a7d0ae9e1110866e8aee8ba40cd864cea69ea1a
```
@z

@x
This digest uniquely identifies the specific version of the `nginx:latest` image,
ensuring that any changes to the image content result in a different digest.
@y
This digest uniquely identifies the specific version of the `nginx:latest` image,
ensuring that any changes to the image content result in a different digest.
@z

@x
## Why are image digests important?
@y
## Why are image digests important?
@z

@x
Using image digests instead of tags offers several advantages:
@y
Using image digests instead of tags offers several advantages:
@z

@x
- Immutability: Once an image is built and its digest is generated, the content
  tied to that digest cannot change. This means that if you pull an image using
  its digest, you can be confident that you are retrieving exactly the same
  image that was originally built.
@y
- Immutability: Once an image is built and its digest is generated, the content
  tied to that digest cannot change. This means that if you pull an image using
  its digest, you can be confident that you are retrieving exactly the same
  image that was originally built.
@z

@x
- Security: Digests help prevent supply chain attacks by ensuring that the image
  content has not been tampered with. Even a small change in the image content
  will result in a completely different digest.
@y
- Security: Digests help prevent supply chain attacks by ensuring that the image
  content has not been tampered with. Even a small change in the image content
  will result in a completely different digest.
@z

@x
- Consistency: Using digests ensures that the same image is used across
  different environments, reducing the risk of discrepancies between
  development, staging, and production environments.
@y
- Consistency: Using digests ensures that the same image is used across
  different environments, reducing the risk of discrepancies between
  development, staging, and production environments.
@z

@x
## Docker Hardened Image digests
@y
## Docker Hardened Image digests
@z

@x
By using image digests to reference DHIs, you can ensure that your applications are
always using the exact same secure image version, enhancing security and
compliance
@y
By using image digests to reference DHIs, you can ensure that your applications are
always using the exact same secure image version, enhancing security and
compliance
@z

@x
## View an image digest
@y
## View an image digest
@z

@x
### Use the Docker CLI
@y
### Use the Docker CLI
@z

@x
To view the image digest of a Docker image, you can use the following command. Replace
`<image-name>:<tag>` with the image name and tag.
@y
To view the image digest of a Docker image, you can use the following command. Replace
`<image-name>:<tag>` with the image name and tag.
@z

@x
```console
$ docker buildx imagetools inspect <image-name>:<tag>
```
@y
```console
$ docker buildx imagetools inspect <image-name>:<tag>
```
@z

@x
### Use the Docker Hub UI
@y
### Use the Docker Hub UI
@z

@x
1. Go to [Docker Hub](https://hub.docker.com/) and sign in.
2. Navigate to your organization's namespace and open the mirrored DHI repository.
3. Select the **Tags** tab to view image variants.
4. Each tag in the list includes a **Digest** field showing the image's SHA-256 value.
@y
1. Go to [Docker Hub](https://hub.docker.com/) and sign in.
2. Navigate to your organization's namespace and open the mirrored DHI repository.
3. Select the **Tags** tab to view image variants.
4. Each tag in the list includes a **Digest** field showing the image's SHA-256 value.
@z

@x
## Pull an image by digest
@y
## Pull an image by digest
@z

@x
Pulling an image by digest ensures that you are pulling the exact image version
identified by the specified digest.
@y
Pulling an image by digest ensures that you are pulling the exact image version
identified by the specified digest.
@z

@x
To pull a Docker image using its digest, use the following command. Replace
`<image-name>` with the image name and `<digest>` with the image digest.
@y
To pull a Docker image using its digest, use the following command. Replace
`<image-name>` with the image name and `<digest>` with the image digest.
@z

@x
```console
$ docker pull <image-name>@sha256:<digest>
```
@y
```console
$ docker pull <image-name>@sha256:<digest>
```
@z

@x
For example, to pull a `docs/dhi-python:3.13` image using its digest of
`94a00394bc5a8ef503fb59db0a7d0ae9e1110866e8aee8ba40cd864cea69ea1a`, you would
run:
@y
For example, to pull a `docs/dhi-python:3.13` image using its digest of
`94a00394bc5a8ef503fb59db0a7d0ae9e1110866e8aee8ba40cd864cea69ea1a`, you would
run:
@z

@x
```console
$ docker pull docs/dhi-python@sha256:94a00394bc5a8ef503fb59db0a7d0ae9e1110866e8aee8ba40cd864cea69ea1a
```
@y
```console
$ docker pull docs/dhi-python@sha256:94a00394bc5a8ef503fb59db0a7d0ae9e1110866e8aee8ba40cd864cea69ea1a
```
@z

@x
## Multi-platform images and manifests
@y
## Multi-platform images and manifests
@z

@x
Docker Hardened Images are published as multi-platform images, which means
a single image tag (like `docs/dhi-python:3.13`) can support multiple operating
systems and CPU architectures, such as `linux/amd64`, `linux/arm64`, and more.
@y
Docker Hardened Images are published as multi-platform images, which means
a single image tag (like `docs/dhi-python:3.13`) can support multiple operating
systems and CPU architectures, such as `linux/amd64`, `linux/arm64`, and more.
@z

@x
Instead of pointing to a single image, a multi-platform tag points to a manifest
list (also called an index), which is a higher-level object that references
multiple image digests, one for each supported platform.
@y
Instead of pointing to a single image, a multi-platform tag points to a manifest
list (also called an index), which is a higher-level object that references
multiple image digests, one for each supported platform.
@z

@x
When you inspect a multi-platform image using `docker buildx imagetools inspect`, you'll see something like this:
@y
When you inspect a multi-platform image using `docker buildx imagetools inspect`, you'll see something like this:
@z

@x
```text
Name:      docs/dhi-python:3.13
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:6e05...d231
@y
```text
Name:      docs/dhi-python:3.13
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:6e05...d231
@z

@x
Manifests:
  Name:        docs/dhi-python:3.13@sha256:94a0...ea1a
  Platform:    linux/amd64
  ...
@y
Manifests:
  Name:        docs/dhi-python:3.13@sha256:94a0...ea1a
  Platform:    linux/amd64
  ...
@z

@x
  Name:        docs/dhi-python:3.13@sha256:7f1d...bc43
  Platform:    linux/arm64
  ...
```
@y
  Name:        docs/dhi-python:3.13@sha256:7f1d...bc43
  Platform:    linux/arm64
  ...
```
@z

@x
- The manifest list digest (`sha256:6e05...d231`) identifies the overall
  multi-platform image.
- Each platform-specific image has its own digest (e.g., `sha256:94a0...ea1a`
  for `linux/amd64`).
@y
- The manifest list digest (`sha256:6e05...d231`) identifies the overall
  multi-platform image.
- Each platform-specific image has its own digest (e.g., `sha256:94a0...ea1a`
  for `linux/amd64`).
@z

@x
### Why this matters
@y
### Why this matters
@z

@x
- Reproducibility: If you're building or running containers on different
  architectures, using a tag alone will resolve to the appropriate image digest
  for your platform.
- Verification: You can pull and verify a specific image digest for your
  platform to ensure you're using the exact image version, not just the manifest
  list.
- Policy enforcement: When enforcing digest-based policies with Docker Scout,
  each platform variant is evaluated individually using its digest.
@y
- Reproducibility: If you're building or running containers on different
  architectures, using a tag alone will resolve to the appropriate image digest
  for your platform.
- Verification: You can pull and verify a specific image digest for your
  platform to ensure you're using the exact image version, not just the manifest
  list.
- Policy enforcement: When enforcing digest-based policies with Docker Scout,
  each platform variant is evaluated individually using its digest.
@z
