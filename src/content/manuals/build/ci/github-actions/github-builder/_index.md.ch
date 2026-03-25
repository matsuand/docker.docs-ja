%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker GitHub Builder
linkTitle: GitHub Builder
description: Use Docker-maintained reusable GitHub Actions workflows to build images and artifacts with BuildKit.
keywords: ci, github actions, gha, buildkit, buildx, bake, reusable workflows
@y
title: Docker GitHub Builder
linkTitle: GitHub Builder
description: Use Docker-maintained reusable GitHub Actions workflows to build images and artifacts with BuildKit.
keywords: ci, github actions, gha, buildkit, buildx, bake, reusable workflows
@z

@x
Docker GitHub Builder is a set of [reusable workflows](https://docs.github.com/en/actions/how-tos/reuse-automations/reuse-workflows)
in the [`docker/github-builder` repository](https://github.com/docker/github-builder)
for building container images and local artifacts with [BuildKit](../../../buildkit/_index.md).
This section explains what the workflows solve, how they differ from wiring
together individual GitHub Actions in each repository, and when to use
[`build.yml`](build.md) or [`bake.yml`](bake.md).
@y
Docker GitHub Builder is a set of [reusable workflows](https://docs.github.com/en/actions/how-tos/reuse-automations/reuse-workflows)
in the [`docker/github-builder` repository](https://github.com/docker/github-builder)
for building container images and local artifacts with [BuildKit](../../../buildkit/_index.md).
This section explains what the workflows solve, how they differ from wiring
together individual GitHub Actions in each repository, and when to use
[`build.yml`](build.md) or [`bake.yml`](bake.md).
@z

@x
If you compose a build job from `docker/login-action`, `docker/setup-buildx-action`,
`docker/metadata-action`, and either `docker/build-push-action` or
`docker/bake-action`, your repository owns every detail of how the build runs.
That approach works, but it also means every repository has to maintain its own
runner selection, [cache setup](../cache.md), [Provenance settings](../attestations.md),
signing behavior, and [multi-platform manifest handling](../multi-platform.md).
Docker GitHub Builder moves that implementation into Docker-maintained reusable
workflows, so your workflow only decides when to build and which inputs to pass.
@y
If you compose a build job from `docker/login-action`, `docker/setup-buildx-action`,
`docker/metadata-action`, and either `docker/build-push-action` or
`docker/bake-action`, your repository owns every detail of how the build runs.
That approach works, but it also means every repository has to maintain its own
runner selection, [cache setup](../cache.md), [Provenance settings](../attestations.md),
signing behavior, and [multi-platform manifest handling](../multi-platform.md).
Docker GitHub Builder moves that implementation into Docker-maintained reusable
workflows, so your workflow only decides when to build and which inputs to pass.
@z

@x
The difference is easiest to see in the job definition. A conventional workflow
spells out each action step:
@y
The difference is easiest to see in the job definition. A conventional workflow
spells out each action step:
@z

@x
```yaml
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@{{% param "login_action_version" %}}
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
```yaml
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@{{% param "login_action_version" %}}
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Set up QEMU
        uses: docker/setup-qemu-action@{{% param "setup_qemu_action_version" %}}
@y
      - name: Set up QEMU
        uses: docker/setup-qemu-action@{{% param "setup_qemu_action_version" %}}
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@{{% param "setup_buildx_action_version" %}}
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@{{% param "setup_buildx_action_version" %}}
@z

@x
      - name: Docker meta
        uses: docker/metadata-action@{{% param "metadata_action_version" %}}
        id: meta
        with:
          images: name/app
@y
      - name: Docker meta
        uses: docker/metadata-action@{{% param "metadata_action_version" %}}
        id: meta
        with:
          images: name/app
@z

@x
      - name: Build and push
        uses: docker/build-push-action@{{% param "build_push_action_version" %}}
        with:
          push: ${{ github.event_name != 'pull_request' }}
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha
```
@y
      - name: Build and push
        uses: docker/build-push-action@{{% param "build_push_action_version" %}}
        with:
          push: ${{ github.event_name != 'pull_request' }}
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha
```
@z

@x
With Docker GitHub Builder, the same build is a reusable workflow call:
@y
With Docker GitHub Builder, the same build is a reusable workflow call:
@z

@x
```yaml
jobs:
  build:
    uses: docker/github-builder/.github/workflows/build.yml@{{% param "github_builder_version" %}}
    permissions:
      contents: read # to fetch the repository content
      id-token: write # for signing attestation(s) with GitHub OIDC Token
    with:
      output: image
      push: ${{ github.event_name != 'pull_request' }}
      meta-images: name/app
    secrets:
      registry-auths: |
        - registry: docker.io
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
```
@y
```yaml
jobs:
  build:
    uses: docker/github-builder/.github/workflows/build.yml@{{% param "github_builder_version" %}}
    permissions:
      contents: read # to fetch the repository content
      id-token: write # for signing attestation(s) with GitHub OIDC Token
    with:
      output: image
      push: ${{ github.event_name != 'pull_request' }}
      meta-images: name/app
    secrets:
      registry-auths: |
        - registry: docker.io
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
```
@z

@x
This model gives you a build pipeline that is maintained in the Docker
organization, uses a pinned [BuildKit](../../../buildkit/_index.md) environment,
distributes [multi-platform builds](../../../building/multi-platform.md) across
runners when that helps, and emits signed [SLSA provenance](../../../metadata/attestations/slsa-provenance.md)
that records both the source commit and the builder identity.
@y
This model gives you a build pipeline that is maintained in the Docker
organization, uses a pinned [BuildKit](../../../buildkit/_index.md) environment,
distributes [multi-platform builds](../../../building/multi-platform.md) across
runners when that helps, and emits signed [SLSA provenance](../../../metadata/attestations/slsa-provenance.md)
that records both the source commit and the builder identity.
@z

@x
That tradeoff is intentional. You keep control of when the build runs and which
inputs it uses, but the build implementation itself lives in the
Docker-maintained workflow rather than in per-repository job steps.
@y
That tradeoff is intentional. You keep control of when the build runs and which
inputs it uses, but the build implementation itself lives in the
Docker-maintained workflow rather than in per-repository job steps.
@z

@x
Use [`build.yml`](build.md) when your repository builds from a Dockerfile and
the familiar `build-push-action` inputs map cleanly to your workflow. Use
[`bake.yml`](bake.md) when your repository already describes builds in a
[Bake definition](../../../bake/_index.md), or when you want Bake targets,
overrides, and variables to stay as the source of truth.
@y
Use [`build.yml`](build.md) when your repository builds from a Dockerfile and
the familiar `build-push-action` inputs map cleanly to your workflow. Use
[`bake.yml`](bake.md) when your repository already describes builds in a
[Bake definition](../../../bake/_index.md), or when you want Bake targets,
overrides, and variables to stay as the source of truth.
@z

@x
Both workflows support image output, local output, cache export to the
[GitHub Actions cache backend](../../../cache/backends/gha.md),
[SBOM generation](../../../metadata/attestations/sbom.md), and signing. The
Bake workflow adds Bake definition validation and builds one target per workflow
call.
@y
Both workflows support image output, local output, cache export to the
[GitHub Actions cache backend](../../../cache/backends/gha.md),
[SBOM generation](../../../metadata/attestations/sbom.md), and signing. The
Bake workflow adds Bake definition validation and builds one target per workflow
call.
@z

@x
{{% sectionlinks %}}
@y
{{% sectionlinks %}}
@z
