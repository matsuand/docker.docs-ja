%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Build GitHub Actions
linkTitle: GitHub Actions
description: Build and publish images with Docker GitHub Builder or individual Docker GitHub Actions.
keywords: ci, github actions, gha,  build, introduction, tutorial
@y
title: Docker Build GitHub Actions
linkTitle: GitHub Actions
description: Build and publish images with Docker GitHub Builder or individual Docker GitHub Actions.
keywords: ci, github actions, gha,  build, introduction, tutorial
@z

@x
GitHub Actions automates your build, test, and deployment pipeline. Use
Docker GitHub Builder to build and publish images
with Docker-maintained reusable workflows. GitHub Builder manages Buildx setup,
platform distribution, metadata, and signing. Start with GitHub Builder for supported
build tasks, and compose individual actions when you need custom job steps or
controls outside the reusable workflow interface.
@y
GitHub Actions automates your build, test, and deployment pipeline. Use
Docker GitHub Builder to build and publish images
with Docker-maintained reusable workflows. GitHub Builder manages Buildx setup,
platform distribution, metadata, and signing. Start with GitHub Builder for supported
build tasks, and compose individual actions when you need custom job steps or
controls outside the reusable workflow interface.
@z

@x
## Get started
@y
## Get started
@z

@x
Build an image from your GitHub repository and push it to Docker Hub with the
following workflow.
@y
Build an image from your GitHub repository and push it to Docker Hub with the
following workflow.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- A GitHub repository with your application and a `Dockerfile` at its root.
- A Docker Hub account and a
  [personal access token](/manuals/security/access-tokens/personal-access-tokens.md)
  with permission to push images.
@y
- A GitHub repository with your application and a `Dockerfile` at its root.
- A Docker Hub account and a
  [personal access token](manuals/security/access-tokens/personal-access-tokens.md)
  with permission to push images.
@z

@x
### Configure your GitHub repository
@y
### Configure your GitHub repository
@z

@x
Add your Docker Hub credentials to your GitHub repository:
@y
Add your Docker Hub credentials to your GitHub repository:
@z

@x
1. Open your repository's **Settings**.
2. Under **Security**, go to **Secrets and variables > Actions**.
3. Under **Secrets**, create a repository secret named `DOCKERHUB_TOKEN`
   containing your Docker access token.
4. Under **Variables**, create a repository variable named `DOCKERHUB_USERNAME`
   containing your Docker Hub username.
@y
1. Open your repository's **Settings**.
2. Under **Security**, go to **Secrets and variables > Actions**.
3. Under **Secrets**, create a repository secret named `DOCKERHUB_TOKEN`
   containing your Docker access token.
4. Under **Variables**, create a repository variable named `DOCKERHUB_USERNAME`
   containing your Docker Hub username.
@z

@x
### Set up your GitHub Actions workflow {#call-a-reusable-workflow}
@y
### Set up your GitHub Actions workflow {#call-a-reusable-workflow}
@z

@x
Create `.github/workflows/docker-ci.yml` in your repository with the following
contents. Replace `my-image` with the name of your Docker Hub repository, and
change `main` if your default branch has a different name.
@y
Create `.github/workflows/docker-ci.yml` in your repository with the following
contents. Replace `my-image` with the name of your Docker Hub repository, and
change `main` if your default branch has a different name.
@z

% snip code...

@x
Call the reusable workflow with `uses` at the job level, rather than inside
`steps`. Grant `contents: read` to fetch the repository and `id-token: write`
for signing with GitHub's OpenID Connect token. With the default `sign: auto`,
GitHub Builder signs attestation manifests when pushing an image. See the
[Build workflow](build-workflow.md) for inputs and outputs.
@y
Call the reusable workflow with `uses` at the job level, rather than inside
`steps`. Grant `contents: read` to fetch the repository and `id-token: write`
for signing with GitHub's OpenID Connect token. With the default `sign: auto`,
GitHub Builder signs attestation manifests when pushing an image. See the
[Build workflow](build-workflow.md) for inputs and outputs.
@z

@x
Commit the workflow file and push it to your default branch to run it. The
workflow also runs on pull requests. With `push: false`, the default
`registry-login: auto` skips registry login and `sign: auto` skips signing.
Pull requests from forks can build without Docker Hub secrets or a writable
OpenID Connect token. Builds that need private dependencies still need access
to those dependencies.
@y
Commit the workflow file and push it to your default branch to run it. The
workflow also runs on pull requests. With `push: false`, the default
`registry-login: auto` skips registry login and `sign: auto` skips signing.
Pull requests from forks can build without Docker Hub secrets or a writable
OpenID Connect token. Builds that need private dependencies still need access
to those dependencies.
@z

@x
GitHub Builder builds from the repository at the triggering Git reference.
Files changed in a caller job aren't included in the build.
@y
GitHub Builder builds from the repository at the triggering Git reference.
Files changed in a caller job aren't included in the build.
@z

@x
GitHub Builder uses the metadata action to generate tags from the GitHub event.
For example, a push to `main` publishes `DOCKERHUB_USERNAME/my-image:main`.
The `set-meta-labels` and `set-meta-annotations` switches also apply generated
labels and annotations; both are disabled by default. See
[Manage tags and labels](manage-tags-labels.md) and [Annotations](annotations.md)
to customize this metadata.
@y
GitHub Builder uses the metadata action to generate tags from the GitHub event.
For example, a push to `main` publishes `DOCKERHUB_USERNAME/my-image:main`.
The `set-meta-labels` and `set-meta-annotations` switches also apply generated
labels and annotations; both are disabled by default. See
[Manage tags and labels](manage-tags-labels.md) and [Annotations](annotations.md)
to customize this metadata.
@z

@x
This workflow builds images but doesn't run application tests. To add tests,
see [Test before push](test-before-push.md). For additional build options, see
[Multi-platform images](multi-platform.md) and
[SBOM and provenance attestations](attestations.md).
@y
This workflow builds images but doesn't run application tests. To add tests,
see [Test before push](test-before-push.md). For additional build options, see
[Multi-platform images](multi-platform.md) and
[SBOM and provenance attestations](attestations.md).
@z

@x
Use the [Build workflow](build-workflow.md) for Dockerfile inputs, or the
[Bake workflow](bake-workflow.md) for a build defined in Bake. Both support
image and local file output. For details on platform distribution and outputs,
see [GitHub Builder architecture](github-builder-architecture/index.md).
@y
Use the [Build workflow](build-workflow.md) for Dockerfile inputs, or the
[Bake workflow](bake-workflow.md) for a build defined in Bake. Both support
image and local file output. For details on platform distribution and outputs,
see [GitHub Builder architecture](github-builder-architecture/index.md).
@z

@x
## Build with individual actions {#compose-individual-actions}
@y
## Build with individual actions {#compose-individual-actions}
@z

@x
Use individual actions to load images into a job's Docker image store, run
steps before or after a build on the same runner, or configure the builder
directly. GitHub Builder's `image` output publishes to a registry; its `local` output
exports files. Neither loads an image into the caller's Docker image store or
exports a Docker image archive. The following alternative uses the same
credentials, triggers, and metadata as the GitHub Builder example:
@y
Use individual actions to load images into a job's Docker image store, run
steps before or after a build on the same runner, or configure the builder
directly. GitHub Builder's `image` output publishes to a registry; its `local` output
exports files. Neither loads an image into the caller's Docker image store or
exports a Docker image archive. The following alternative uses the same
credentials, triggers, and metadata as the GitHub Builder example:
@z

% snip code...

@x
The build action uses Git context by default: BuildKit fetches the repository
at the triggering Git reference. No checkout step is needed, and changes made
by earlier steps aren't included. Use a checkout and a path context when the
build needs files changed by earlier steps.
@y
The build action uses Git context by default: BuildKit fetches the repository
at the triggering Git reference. No checkout step is needed, and changes made
by earlier steps aren't included. Use a checkout and a path context when the
build needs files changed by earlier steps.
@z

@x
### Available actions
@y
### Available actions
@z

@x
The following GitHub Actions are available:
@y
The following GitHub Actions are available:
@z

@x
- [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images):
  build and push Docker images with BuildKit.
- [Docker Buildx Bake](https://github.com/marketplace/actions/docker-buildx-bake):
  enables using high-level builds with [Bake](../../bake/_index.md).
- [Docker Login](https://github.com/marketplace/actions/docker-login):
  sign in to a Docker registry.
- [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx):
  creates and boots a BuildKit builder.
- [Docker Metadata action](https://github.com/marketplace/actions/docker-metadata-action):
  extracts metadata from Git reference and GitHub events to generate tags,
  labels, and annotations.
- [Docker Setup Compose](https://github.com/marketplace/actions/docker-setup-compose):
  installs and sets up [Compose](../../../compose).
- [Docker Setup Docker](https://github.com/marketplace/actions/docker-setup-docker):
  installs Docker Engine.
- [Docker Setup QEMU](https://github.com/marketplace/actions/docker-setup-qemu):
  installs [QEMU](https://github.com/qemu/qemu) static binaries for
  multi-platform builds.
- [Docker Scout](https://github.com/docker/scout-action):
  analyze Docker images for security vulnerabilities.
@y
- [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images):
  build and push Docker images with BuildKit.
- [Docker Buildx Bake](https://github.com/marketplace/actions/docker-buildx-bake):
  enables using high-level builds with [Bake](../../bake/_index.md).
- [Docker Login](https://github.com/marketplace/actions/docker-login):
  sign in to a Docker registry.
- [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx):
  creates and boots a BuildKit builder.
- [Docker Metadata action](https://github.com/marketplace/actions/docker-metadata-action):
  extracts metadata from Git reference and GitHub events to generate tags,
  labels, and annotations.
- [Docker Setup Compose](https://github.com/marketplace/actions/docker-setup-compose):
  installs and sets up [Compose](../../../compose).
- [Docker Setup Docker](https://github.com/marketplace/actions/docker-setup-docker):
  installs Docker Engine.
- [Docker Setup QEMU](https://github.com/marketplace/actions/docker-setup-qemu):
  installs [QEMU](https://github.com/qemu/qemu) static binaries for
  multi-platform builds.
- [Docker Scout](https://github.com/docker/scout-action):
  analyze Docker images for security vulnerabilities.
@z
