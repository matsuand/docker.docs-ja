%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Use Docker Build Cloud in CI
linkTitle: Continuous integration
@y
title: Use Docker Build Cloud in CI
linkTitle: Continuous integration
@z

@x
description: Speed up your continuous integration pipelines with Docker Build Cloud in CI
keywords: build, cloud build, ci, gha, gitlab, buildkite, jenkins, circle ci
@y
description: Speed up your continuous integration pipelines with Docker Build Cloud in CI
keywords: build, cloud build, ci, gha, gitlab, buildkite, jenkins, circle ci
@z

@x
Using Docker Build Cloud in CI can speed up your build pipelines, which means less time
spent waiting and context switching. You control your CI workflows as usual,
and delegate the build execution to Docker Build Cloud.
@y
Using Docker Build Cloud in CI can speed up your build pipelines, which means less time
spent waiting and context switching. You control your CI workflows as usual,
and delegate the build execution to Docker Build Cloud.
@z

@x
Building with Docker Build Cloud in CI involves the following steps:
@y
Building with Docker Build Cloud in CI involves the following steps:
@z

@x
1. Sign in to a Docker account.
2. Set up Buildx and connect to the builder.
3. Run the build.
@y
1. Sign in to a Docker account.
2. Set up Buildx and connect to the builder.
3. Run the build.
@z

@x
When using Docker Build Cloud in CI, it's recommended that you push the result to a
registry directly, rather than loading the image and then pushing it. Pushing
directly speeds up your builds and avoids unnecessary file transfers.
@y
When using Docker Build Cloud in CI, it's recommended that you push the result to a
registry directly, rather than loading the image and then pushing it. Pushing
directly speeds up your builds and avoids unnecessary file transfers.
@z

@x
If you just want to build and discard the output, export the results to the
build cache or build without tagging the image. When you use Docker Build Cloud,
Buildx automatically loads the build result if you build a tagged image.
See [Loading build results](./usage/#loading-build-results) for details.
@y
If you just want to build and discard the output, export the results to the
build cache or build without tagging the image. When you use Docker Build Cloud,
Buildx automatically loads the build result if you build a tagged image.
See [Loading build results](./usage/#loading-build-results) for details.
@z

@x
> [!NOTE]
>
> Builds on Docker Build Cloud have a timeout limit of two hours. Builds that
> run for longer than two hours are automatically cancelled.
@y
> [!NOTE]
>
> Builds on Docker Build Cloud have a timeout limit of two hours. Builds that
> run for longer than two hours are automatically cancelled.
@z

@x
## CI platform examples
@y
## CI platform examples
@z

@x
### GitHub Actions
@y
### GitHub Actions
@z

@x
> [!NOTE]
>
> Version 4.0.0 and later of `docker/build-push-action` and
> `docker/bake-action` builds images with [provenance attestations by
> default](/manuals/build/ci/github-actions/attestations.md#default-provenance). Docker
> Build Cloud automatically attempts to load images to the local image store if
> you don't explicitly push them to a registry.
>
> This results in a conflicting scenario where if you build a tagged image
> without pushing it to a registry, Docker Build Cloud attempts to load images
> containing attestations. But the local image store on the GitHub runner
> doesn't support attestations, and the image load fails as a result.
>
> If you want to load images built with `docker/build-push-action` together
> with Docker Build Cloud, you must disable provenance attestations by setting
> `provenance: false` in the GitHub Action inputs (or in `docker-bake.hcl` if
> you use Bake).
@y
> [!NOTE]
>
> Version 4.0.0 and later of `docker/build-push-action` and
> `docker/bake-action` builds images with [provenance attestations by
> default](manuals/build/ci/github-actions/attestations.md#default-provenance). Docker
> Build Cloud automatically attempts to load images to the local image store if
> you don't explicitly push them to a registry.
>
> This results in a conflicting scenario where if you build a tagged image
> without pushing it to a registry, Docker Build Cloud attempts to load images
> containing attestations. But the local image store on the GitHub runner
> doesn't support attestations, and the image load fails as a result.
>
> If you want to load images built with `docker/build-push-action` together
> with Docker Build Cloud, you must disable provenance attestations by setting
> `provenance: false` in the GitHub Action inputs (or in `docker-bake.hcl` if
> you use Bake).
@z

% snip code...

@x
### GitLab
@y
### GitLab
@z

@x within code
# Build multi-platform image and push to a registry
@y
# Build multi-platform image and push to a registry
@z
@x
# Build an image and discard the result
@y
# Build an image and discard the result
@z

@x
### Circle CI
@y
### Circle CI
@z

@x within code...
  # Build multi-platform image and push to a registry
@y
  # Build multi-platform image and push to a registry
@z
@x
  # Build an image and discard the result
@y
  # Build an image and discard the result
@z

@x
### Buildkite
@y
### Buildkite
@z

@x
The following example sets up a Buildkite pipeline using Docker Build Cloud. The
example assumes that the pipeline name is `build-push-docker` and that you
manage the Docker access token using environment hooks, but feel free to adapt
this to your needs.
@y
The following example sets up a Buildkite pipeline using Docker Build Cloud. The
example assumes that the pipeline name is `build-push-docker` and that you
manage the Docker access token using environment hooks, but feel free to adapt
this to your needs.
@z

@x
Add the following `environment` hook agent's hook directory:
@y
Add the following `environment` hook agent's hook directory:
@z

% snip code...

@x
Create a `pipeline.yml` that uses the `docker-login` plugin:
@y
Create a `pipeline.yml` that uses the `docker-login` plugin:
@z

% snip code...

@x
Create the `build.sh` script:
@y
Create the `build.sh` script:
@z

@x within code
# Get download link for latest buildx binary.
# Set $ARCH to the CPU architecture (e.g. amd64, arm64)
@y
# Get download link for latest buildx binary.
# Set $ARCH to the CPU architecture (e.g. amd64, arm64)
@z
@x
# Download docker buildx with Build Cloud support
@y
# Download docker buildx with Build Cloud support
@z
@x
# Connect to your builder and set it as the default builder
@y
# Connect to your builder and set it as the default builder
@z
@x
# Cache-only image build
@y
# Cache-only image build
@z
@x
# Build, tag, and push a multi-arch docker image
@y
# Build, tag, and push a multi-arch docker image
@z

@x
### Jenkins
@y
### Jenkins
@z

% snip code...

@x
### Travis CI
@y
### Travis CI
@z

% snip code...

@x
### BitBucket Pipelines 
@y
### BitBucket Pipelines 
@z

@x within code
# Prerequisites: $DOCKER_USER, $DOCKER_PAT setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
# Replace <ORG> in the `docker buildx create` command with your Docker org
@y
# Prerequisites: $DOCKER_USER, $DOCKER_PAT setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
# Replace <ORG> in the `docker buildx create` command with your Docker org
@z

@x
### Shell script
@y
### Shell script
@z

@x within code
# Get download link for latest buildx binary. Set $ARCH to the CPU architecture (e.g. amd64, arm64)
@y
# Get download link for latest buildx binary. Set $ARCH to the CPU architecture (e.g. amd64, arm64)
@z
@x
# Download docker buildx with Build Cloud support
@y
# Download docker buildx with Build Cloud support
@z
@x
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/security/for-developers/access-tokens/
@y
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/security/for-developers/access-tokens/
@z
@x
# Connect to your builder and set it as the default builder
@y
# Connect to your builder and set it as the default builder
@z
@x
# Cache-only image build
@y
# Cache-only image build
@z
@x
# Build, tag, and push a multi-arch docker image
@y
# Build, tag, and push a multi-arch docker image
@z

@x
### Docker Compose
@y
### Docker Compose
@z

@x
Use this implementation if you want to use `docker compose build` with
Docker Build Cloud in CI.
@y
Use this implementation if you want to use `docker compose build` with
Docker Build Cloud in CI.
@z

@x
```bash
#!/bin/bash
@y
```bash
#!/bin/bash
@z

@x
# Get download link for latest buildx binary. Set $ARCH to the CPU architecture (e.g. amd64, arm64)
ARCH=amd64
BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
COMPOSE_URL=$(curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <GITHUB_TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/docker/compose-desktop/releases \
  | jq "[ .[] | select(.prerelease==false and .draft==false) ] | .[0].assets.[] | select(.name | endswith(\"linux-${ARCH}\")) | .browser_download_url")
@y
# Get download link for latest buildx binary. Set $ARCH to the CPU architecture (e.g. amd64, arm64)
ARCH=amd64
BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
COMPOSE_URL=$(curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <GITHUB_TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/docker/compose-desktop/releases \
  | jq "[ .[] | select(.prerelease==false and .draft==false) ] | .[0].assets.[] | select(.name | endswith(\"linux-${ARCH}\")) | .browser_download_url")
@z

@x
# Download docker buildx with Build Cloud support
mkdir -vp ~/.docker/cli-plugins/
curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
curl --silent -L --output ~/.docker/cli-plugins/docker-compose $COMPOSE_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
chmod a+x ~/.docker/cli-plugins/docker-compose
@y
# Download docker buildx with Build Cloud support
mkdir -vp ~/.docker/cli-plugins/
curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
curl --silent -L --output ~/.docker/cli-plugins/docker-compose $COMPOSE_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
chmod a+x ~/.docker/cli-plugins/docker-compose
@z

@x
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/security/for-developers/access-tokens/
echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
@y
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/security/for-developers/access-tokens/
echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
@z

@x
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "<ORG>/default"
@y
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "<ORG>/default"
@z

@x
# Build the image build
docker compose build
```
@y
# Build the image build
docker compose build
```
@z
