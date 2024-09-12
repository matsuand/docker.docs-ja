%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Add SBOM and provenance attestations with GitHub Actions
linkTitle: Attestations
description: Add SBOM and provenance attestations to your images with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, attestations, sbom, provenance, slsa
@y
title: Add SBOM and provenance attestations with GitHub Actions
linkTitle: Attestations
description: Add SBOM and provenance attestations to your images with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, attestations, sbom, provenance, slsa
@z

@x
Software Bill of Material (SBOM) and provenance
[attestations](../../metadata/attestations/_index.md) add metadata about the contents of
your image, and how it was built.
@y
Software Bill of Material (SBOM) and provenance
[attestations](../../metadata/attestations/_index.md) add metadata about the contents of
your image, and how it was built.
@z

@x
Attestations are supported with version 4 and later of the
`docker/build-push-action`.
@y
Attestations are supported with version 4 and later of the
`docker/build-push-action`.
@z

@x
## Default provenance
@y
## Default provenance
@z

@x
The `docker/build-push-action` GitHub Action automatically adds provenance
attestations to your image, with the following conditions:
@y
The `docker/build-push-action` GitHub Action automatically adds provenance
attestations to your image, with the following conditions:
@z

@x
- If the GitHub repository is public, provenance attestations with `mode=max`
  are automatically added to the image.
- If the GitHub repository is private, provenance attestations with `mode=min`
  are automatically added to the image.
- If you're using the [`docker` exporter](../../exporters/oci-docker.md), or
  you're loading the build results to the runner with `load: true`, no
  attestations are added to the image. These output formats don't support
  attestations.
@y
- If the GitHub repository is public, provenance attestations with `mode=max`
  are automatically added to the image.
- If the GitHub repository is private, provenance attestations with `mode=min`
  are automatically added to the image.
- If you're using the [`docker` exporter](../../exporters/oci-docker.md), or
  you're loading the build results to the runner with `load: true`, no
  attestations are added to the image. These output formats don't support
  attestations.
@z

@x
> [!WARNING]
>
> If you're using `docker/build-push-action` to build images for code in a
> public GitHub repository, the provenance attestations attached to your image
> by default contains the values of build arguments. If you're misusing build
> arguments to pass secrets to your build, such as user credentials or
> authentication tokens, those secrets are exposed in the provenance
> attestation. Refactor your build to pass those secrets using
> [secret mounts](/reference/cli/docker/buildx/build.md#secret)
> instead. Also remember to rotate any secrets you may have exposed.
@y
> [!WARNING]
>
> If you're using `docker/build-push-action` to build images for code in a
> public GitHub repository, the provenance attestations attached to your image
> by default contains the values of build arguments. If you're misusing build
> arguments to pass secrets to your build, such as user credentials or
> authentication tokens, those secrets are exposed in the provenance
> attestation. Refactor your build to pass those secrets using
> [secret mounts](reference/cli/docker/buildx/build.md#secret)
> instead. Also remember to rotate any secrets you may have exposed.
@z

@x
## Max-level provenance
@y
## Max-level provenance
@z

@x
It's recommended that you build your images with max-level provenance
attestations. Private repositories only add min-level provenance by default,
but you can manually override the provenance level by setting the `provenance`
input on the `docker/build-push-action` GitHub Action to `mode=max`.
@y
It's recommended that you build your images with max-level provenance
attestations. Private repositories only add min-level provenance by default,
but you can manually override the provenance level by setting the `provenance`
input on the `docker/build-push-action` GitHub Action to `mode=max`.
@z

@x
Note that adding attestations to an image means you must push the image to a
registry directly, as opposed to loading the image to the local image store of
the runner. This is because the local image store doesn't support loading
images with attestations.
@y
Note that adding attestations to an image means you must push the image to a
registry directly, as opposed to loading the image to the local image store of
the runner. This is because the local image store doesn't support loading
images with attestations.
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
env:
  IMAGE_NAME: user/app
@y
env:
  IMAGE_NAME: user/app
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.IMAGE_NAME }}
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Build and push image
        uses: docker/build-push-action@v6
        with:
          push: true
          provenance: mode=max
          tags: ${{ steps.meta.outputs.tags }}
```
@y
      - name: Build and push image
        uses: docker/build-push-action@v6
        with:
          push: true
          provenance: mode=max
          tags: ${{ steps.meta.outputs.tags }}
```
@z

@x
## SBOM
@y
## SBOM
@z

@x
SBOM attestations aren't automatically added to the image. To add SBOM
attestations, set the `sbom` input of the `docker/build-push-action` to true.
@y
SBOM attestations aren't automatically added to the image. To add SBOM
attestations, set the `sbom` input of the `docker/build-push-action` to true.
@z

@x
Note that adding attestations to an image means you must push the image to a
registry directly, as opposed to loading the image to the local image store of
the runner. This is because the local image store doesn't support loading
images with attestations.
@y
Note that adding attestations to an image means you must push the image to a
registry directly, as opposed to loading the image to the local image store of
the runner. This is because the local image store doesn't support loading
images with attestations.
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
env:
  IMAGE_NAME: user/app
@y
env:
  IMAGE_NAME: user/app
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.IMAGE_NAME }}
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Build and push image
        uses: docker/build-push-action@v6
        with:
          sbom: true
          push: true
          tags: ${{ steps.meta.outputs.tags }}
```
@y
      - name: Build and push image
        uses: docker/build-push-action@v6
        with:
          sbom: true
          push: true
          tags: ${{ steps.meta.outputs.tags }}
```
@z
