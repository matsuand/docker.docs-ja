%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to integrate Docker Scout with GitHub Actions
keywords: supply chain, security, ci, continuous integration, github actions
title: Integrate Docker Scout with GitHub Actions
---
@y
---
description: How to integrate Docker Scout with GitHub Actions
keywords: supply chain, security, ci, continuous integration, github actions
title: Integrate Docker Scout with GitHub Actions
---
@z

@x
The following example shows how to set up a Docker Scout workflow with GitHub
Actions. Triggered by a pull request, the action builds the image and uses
Docker Scout to compare the new version to the version of that image running in
production.
@y
The following example shows how to set up a Docker Scout workflow with GitHub
Actions. Triggered by a pull request, the action builds the image and uses
Docker Scout to compare the new version to the version of that image running in
production.
@z

@x
This workflow uses the
[docker/scout-action](https://github.com/docker/scout-action) GitHub Action to
run the `docker scout compare` command to visualize how images for pull request
stack up against the image you run in production.
@y
This workflow uses the
[docker/scout-action](https://github.com/docker/scout-action) GitHub Action to
run the `docker scout compare` command to visualize how images for pull request
stack up against the image you run in production.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- This example assumes that you have an existing image repository, in Docker Hub
  or in another registry, where you've enabled Docker Scout.
- This example makes use of [environments](../environment/_index.md), to compare
  the image built in the pull request with a different version of the same image
  in an environment called `production`.
@y
- This example assumes that you have an existing image repository, in Docker Hub
  or in another registry, where you've enabled Docker Scout.
- This example makes use of [environments](../environment/_index.md), to compare
  the image built in the pull request with a different version of the same image
  in an environment called `production`.
@z

@x
## Steps
@y
## Steps
@z

@x
First, set up the GitHub Action workflow to build an image. This isn't specific
to Docker Scout here, but you'll need to create build an image to have
something to compare with.
@y
First, set up the GitHub Action workflow to build an image. This isn't specific
to Docker Scout here, but you'll need to create build an image to have
something to compare with.
@z

@x
Add the following to a GitHub Actions YAML file:
@y
Add the following to a GitHub Actions YAML file:
@z

@x
```yaml
name: Docker
@y
```yaml
name: Docker
@z

@x
on:
  push:
    tags: ["*"]
    branches:
      - "main"
  pull_request:
    branches: ["**"]
@y
on:
  push:
    tags: ["*"]
    branches:
      - "main"
  pull_request:
    branches: ["**"]
@z

@x
env:
  # Hostname of your registry
  REGISTRY: docker.io
  # Image repository, without hostname and tag
  IMAGE_NAME: ${{ github.repository }}
  SHA: ${{ github.event.pull_request.head.sha || github.event.after }}
@y
env:
  # Hostname of your registry
  REGISTRY: docker.io
  # Image repository, without hostname and tag
  IMAGE_NAME: ${{ github.repository }}
  SHA: ${{ github.event.pull_request.head.sha || github.event.after }}
@z

@x
jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
@y
jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
@z

@x
steps:
  - name: Checkout repository
    uses: actions/checkout@v4
    with:
      ref: ${{ env.SHA }}
@y
steps:
  - name: Checkout repository
    uses: actions/checkout@v4
    with:
      ref: ${{ env.SHA }}
@z

@x
  - name: Setup Docker buildx
    uses: docker/setup-buildx-action@v3
@y
  - name: Setup Docker buildx
    uses: docker/setup-buildx-action@v3
@z

@x
  # Authenticate to the container registry
  - name: Authenticate to registry ${{ env.REGISTRY }}
    uses: docker/login-action@v3
    with:
      registry: ${{ env.REGISTRY }}
      username: ${{ secrets.REGISTRY_USER }}
      password: ${{ secrets.REGISTRY_TOKEN }}
@y
  # Authenticate to the container registry
  - name: Authenticate to registry ${{ env.REGISTRY }}
    uses: docker/login-action@v3
    with:
      registry: ${{ env.REGISTRY }}
      username: ${{ secrets.REGISTRY_USER }}
      password: ${{ secrets.REGISTRY_TOKEN }}
@z

@x
  # Extract metadata (tags, labels) for Docker
  - name: Extract Docker metadata
    id: meta
    uses: docker/metadata-action@v5
    with:
      images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
      labels: |
        org.opencontainers.image.revision=${{ env.SHA }}
      tags: |
        type=edge,branch=$repo.default_branch
        type=semver,pattern=v{{version}}
        type=sha,prefix=,suffix=,format=short
@y
  # Extract metadata (tags, labels) for Docker
  - name: Extract Docker metadata
    id: meta
    uses: docker/metadata-action@v5
    with:
      images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
      labels: |
        org.opencontainers.image.revision=${{ env.SHA }}
      tags: |
        type=edge,branch=$repo.default_branch
        type=semver,pattern=v{{version}}
        type=sha,prefix=,suffix=,format=short
@z

@x
  # Build and push Docker image with Buildx
  # (don't push on PR, load instead)
  - name: Build and push Docker image
    id: build-and-push
    uses: docker/build-push-action@v5
    with:
      context: .
      sbom: ${{ github.event_name != 'pull_request' }}
      provenance: ${{ github.event_name != 'pull_request' }}
      push: ${{ github.event_name != 'pull_request' }}
      load: ${{ github.event_name == 'pull_request' }}
      tags: ${{ steps.meta.outputs.tags }}
      labels: ${{ steps.meta.outputs.labels }}
      cache-from: type=gha
      cache-to: type=gha,mode=max
```
@y
  # Build and push Docker image with Buildx
  # (don't push on PR, load instead)
  - name: Build and push Docker image
    id: build-and-push
    uses: docker/build-push-action@v5
    with:
      context: .
      sbom: ${{ github.event_name != 'pull_request' }}
      provenance: ${{ github.event_name != 'pull_request' }}
      push: ${{ github.event_name != 'pull_request' }}
      load: ${{ github.event_name == 'pull_request' }}
      tags: ${{ steps.meta.outputs.tags }}
      labels: ${{ steps.meta.outputs.labels }}
      cache-from: type=gha
      cache-to: type=gha,mode=max
```
@z

@x
This creates workflow steps to:
@y
This creates workflow steps to:
@z

@x
1. Check out the repository.
2. Set up Docker buildx.
3. Authenticate to the registry.
4. Extract metadata from Git reference and GitHub events.
5. Build and push the Docker image to the registry.
@y
1. Check out the repository.
2. Set up Docker buildx.
3. Authenticate to the registry.
4. Extract metadata from Git reference and GitHub events.
5. Build and push the Docker image to the registry.
@z

@x
> **Note**
>
> This CI workflow runs a local analysis and evaluation of your image. To
> evaluate the image locally, you must ensure that the image is loaded the
> local image store of your runner.
>
> This comparison doesn't work if you push the image to a registry, or if you
> build an image that can't be loaded to the runner's local image store. For
> example, multi-platform images or images with SBOM or provenance attestation
> can't be loaded to the local image store.
@y
> **Note**
>
> This CI workflow runs a local analysis and evaluation of your image. To
> evaluate the image locally, you must ensure that the image is loaded the
> local image store of your runner.
>
> This comparison doesn't work if you push the image to a registry, or if you
> build an image that can't be loaded to the runner's local image store. For
> example, multi-platform images or images with SBOM or provenance attestation
> can't be loaded to the local image store.
@z

@x
With this setup out of the way, you can add the following steps to run the
image comparison:
@y
With this setup out of the way, you can add the following steps to run the
image comparison:
@z

@x
```yaml
# You can skip this step if Docker Hub is your registry
# and you already authenticated before
- name: Authenticate to Docker
  uses: docker/login-action@v3
  with:
    username: ${{ secrets.DOCKER_USER }}
    password: ${{ secrets.DOCKER_PAT }}
@y
```yaml
# You can skip this step if Docker Hub is your registry
# and you already authenticated before
- name: Authenticate to Docker
  uses: docker/login-action@v3
  with:
    username: ${{ secrets.DOCKER_USER }}
    password: ${{ secrets.DOCKER_PAT }}
@z

@x
# Compare the image built in the pull request with the one in production
- name: Docker Scout
  id: docker-scout
  if: ${{ github.event_name == 'pull_request' }}
  uses: docker/scout-action@v1
  with:
    command: compare
    image: ${{ steps.meta.outputs.tags }}
    to-env: production
    ignore-unchanged: true
    only-severities: critical,high
    github-token: ${{ secrets.GITHUB_TOKEN }}
```
@y
# Compare the image built in the pull request with the one in production
- name: Docker Scout
  id: docker-scout
  if: ${{ github.event_name == 'pull_request' }}
  uses: docker/scout-action@v1
  with:
    command: compare
    image: ${{ steps.meta.outputs.tags }}
    to-env: production
    ignore-unchanged: true
    only-severities: critical,high
    github-token: ${{ secrets.GITHUB_TOKEN }}
```
@z

@x
The compare command analyzes the image and evaluates policy compliance, and
cross-references the results with the corresponding image in the `production`
environment. This example only includes critical and high-severity
vulnerabilities, and excludes vulnerabilities that exist in both images,
showing only what's changed.
@y
The compare command analyzes the image and evaluates policy compliance, and
cross-references the results with the corresponding image in the `production`
environment. This example only includes critical and high-severity
vulnerabilities, and excludes vulnerabilities that exist in both images,
showing only what's changed.
@z

@x
The GitHub Action outputs the comparison results in a pull request comment by
default.
@y
The GitHub Action outputs the comparison results in a pull request comment by
default.
@z

@x
![A screenshot showing the results of Docker Scout output in a GitHub Action](../../images/gha-output.webp)
@y
![A screenshot showing the results of Docker Scout output in a GitHub Action](../../images/gha-output.webp)
@z

@x
Expand the **Policies** section to view the difference in policy compliance
between the two images. Note that while the new image in this example isn't
fully compliant, the output shows that the standing for the new image has
improved compared to the baseline.
@y
Expand the **Policies** section to view the difference in policy compliance
between the two images. Note that while the new image in this example isn't
fully compliant, the output shows that the standing for the new image has
improved compared to the baseline.
@z

@x
![GHA policy evaluation output](../../images/gha-policy-eval.webp)
@y
![GHA policy evaluation output](../../images/gha-policy-eval.webp)
@z
