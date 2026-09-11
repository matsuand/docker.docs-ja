%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
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
build cache or build without tagging the image. With no explicit output, Buildx
leaves an untagged result in the cloud build cache and automatically loads
eligible tagged images. See
[Loading build results](./usage/#loading-build-results) for details.
@y
If you just want to build and discard the output, export the results to the
build cache or build without tagging the image. With no explicit output, Buildx
leaves an untagged result in the cloud build cache and automatically loads
eligible tagged images. See
[Loading build results](./usage/#loading-build-results) for details.
@z

@x
> [!NOTE]
>
> Builds on Docker Build Cloud have a timeout limit that depends on your
> subscription plan. Builds that run for longer than your limit are
> automatically cancelled.
@y
> [!NOTE]
>
> Builds on Docker Build Cloud have a timeout limit that depends on your
> subscription plan. Builds that run for longer than your limit are
> automatically cancelled.
@z

@x
## Setting up credentials for CI/CD
@y
## Setting up credentials for CI/CD
@z

@x
To enable your CI/CD system to build and push images using Docker Build Cloud, provide both an access token and a username. The type of token and the username you use depend on your account type and permissions.
@y
To enable your CI/CD system to build and push images using Docker Build Cloud, provide both an access token and a username. The type of token and the username you use depend on your account type and permissions.
@z

@x
- If you are an organization administrator or have permission to create [organization access tokens (OAT)](/manuals/security/access-tokens/organization-access-tokens.md), use an OAT and set `DOCKER_ACCOUNT` to your Docker Hub organization name.
- If you do not have permission to create OATs or are using a personal account, use a [personal access token (PAT)](/security/access-tokens/personal-access-tokens/) and set `DOCKER_ACCOUNT` to your Docker Hub username.
@y
- If you are an organization administrator or have permission to create [organization access tokens (OAT)](manuals/security/access-tokens/organization-access-tokens.md), use an OAT and set `DOCKER_ACCOUNT` to your Docker Hub organization name.
- If you do not have permission to create OATs or are using a personal account, use a [personal access token (PAT)](__SUBDIR__/security/access-tokens/personal-access-tokens/) and set `DOCKER_ACCOUNT` to your Docker Hub username.
@z

@x
### Creating access tokens
@y
### Creating access tokens
@z

@x
#### For organization accounts
@y
#### For organization accounts
@z

@x
If you are an organization administrator:
@y
If you are an organization administrator:
@z

@x
- Create an [organization access token (OAT)](/manuals/security/access-tokens/organization-access-tokens.md). The token must have these permissions:
    1. **cloud-connect** scope
    2. **Read public repositories** permission
    3. **Repository access** with **Image push** permission for the target repository:
        - Expand the **Repository** drop-down.
        - Select **Add repository** and choose your target repository.
        - Set the **Image push** permission for the repository.
@y
- Create an [organization access token (OAT)](manuals/security/access-tokens/organization-access-tokens.md). The token must have these permissions:
    1. **cloud-connect** scope
    2. **Read public repositories** permission
    3. **Repository access** with **Image push** permission for the target repository:
        - Expand the **Repository** drop-down.
        - Select **Add repository** and choose your target repository.
        - Set the **Image push** permission for the repository.
@z

@x
If you are not an organization administrator:
@y
If you are not an organization administrator:
@z

@x
- Ask your organization administrator for an access token with the permissions listed above, or use a personal access token.
@y
- Ask your organization administrator for an access token with the permissions listed above, or use a personal access token.
@z

@x
#### For personal accounts
@y
#### For personal accounts
@z

@x
- Create a [personal access token (PAT)](/security/access-tokens/personal-access-tokens/) with the following permissions:
   1. **Read & write** access.
        - Note: Building with Docker Build Cloud only requires read access, but you need write access to push images to a Docker Hub repository.
@y
- Create a [personal access token (PAT)](__SUBDIR__/security/access-tokens/personal-access-tokens/) with the following permissions:
   1. **Read & write** access.
        - Note: Building with Docker Build Cloud only requires read access, but you need write access to push images to a Docker Hub repository.
@z

@x
## CI platform examples
@y
## CI platform examples
@z

@x
> [!IMPORTANT]
>
> These examples require Buildx version 0.37.0 or later, which includes the
> `cloud` driver. The Docker CLI version doesn't determine the installed Buildx
> plugin version, and CI runner images may include an earlier Buildx release.
>
> Check the installed version:
@y
> [!IMPORTANT]
>
> These examples require Buildx version 0.37.0 or later, which includes the
> `cloud` driver. The Docker CLI version doesn't determine the installed Buildx
> plugin version, and CI runner images may include an earlier Buildx release.
>
> Check the installed version:
@z

% snip command...

@x
> If the version is earlier than 0.37.0, install Buildx as a
> [Docker CLI plugin](https://github.com/docker/buildx#manual-download).
@y
> If the version is earlier than 0.37.0, install Buildx as a
> [Docker CLI plugin](https://github.com/docker/buildx#manual-download).
@z

@x
> [!NOTE]
>
> In your CI/CD configuration, set the following variables/secrets:
> - `DOCKER_ACCESS_TOKEN` — your access token (PAT or OAT). Use a secret to store the token.
> - `DOCKER_ACCOUNT` — your Docker Hub organization name (for OAT) or username (for PAT)
> - `CLOUD_BUILDER_NAME` — the name of the cloud builder you created in the [Docker Build Cloud Dashboard](https://app.docker.com/build/)
>
> This ensures your builds authenticate correctly with Docker Build Cloud.
@y
> [!NOTE]
>
> In your CI/CD configuration, set the following variables/secrets:
> - `DOCKER_ACCESS_TOKEN` — your access token (PAT or OAT). Use a secret to store the token.
> - `DOCKER_ACCOUNT` — your Docker Hub organization name (for OAT) or username (for PAT)
> - `CLOUD_BUILDER_NAME` — the name of the cloud builder you created in the [Docker Build Cloud Dashboard](https://app.docker.com/build/)
>
> This ensures your builds authenticate correctly with Docker Build Cloud.
@z

@x
### GitHub Actions
@y
### GitHub Actions
@z

@x
<!-- TODO: Confirm whether standard Buildx requires a minimum setup-buildx-action version. -->
@y
<!-- TODO: Confirm whether standard Buildx requires a minimum setup-buildx-action version. -->
@z

@x within code
          endpoint: "${{ vars.DOCKER_ACCOUNT }}/${{ vars.CLOUD_BUILDER_NAME }}" # for example, "acme/default"
@y
          endpoint: "${{ vars.DOCKER_ACCOUNT }}/${{ vars.CLOUD_BUILDER_NAME }}" # for example, "acme/default"
@z
@x
          tags: "<IMAGE>" # for example, "acme/my-image:latest"
          # For pull requests, export results to the build cache.
          # Otherwise, push to a registry.
@y
          tags: "<IMAGE>" # for example, "acme/my-image:latest"
          # For pull requests, export results to the build cache.
          # Otherwise, push to a registry.
@z

@x
The example above uses `docker/build-push-action`, which automatically uses the
builder set up by `setup-buildx-action`. If you need to use the `docker build`
command directly instead, you have two options:
@y
The example above uses `docker/build-push-action`, which automatically uses the
builder set up by `setup-buildx-action`. If you need to use the `docker build`
command directly instead, you have two options:
@z

@x
- Use `docker buildx build` instead of `docker build`
- Set the `BUILDX_BUILDER` environment variable to use the cloud builder:
@y
- Use `docker buildx build` instead of `docker build`
- Set the `BUILDX_BUILDER` environment variable to use the cloud builder:
@z

% snip code...

@x
For more information about the `BUILDX_BUILDER` environment variable, see
[Build variables](/manuals/build/building/variables.md#buildx_builder).
@y
For more information about the `BUILDX_BUILDER` environment variable, see
[Build variables](manuals/build/building/variables.md#buildx_builder).
@z

@x
### GitLab
@y
### GitLab
@z

@x within code
  DOCKER_ACCOUNT: <DOCKER_ACCOUNT> # your Docker Hub organization name (or username when using a personal account)
  CLOUD_BUILDER_NAME: <CLOUD_BUILDER_NAME> # the name of the cloud builder you created in the [Docker Build Cloud Dashboard](https://app.docker.com/build/)
@y
  DOCKER_ACCOUNT: <DOCKER_ACCOUNT> # your Docker Hub organization name (or username when using a personal account)
  CLOUD_BUILDER_NAME: <CLOUD_BUILDER_NAME> # the name of the cloud builder you created in the [Docker Build Cloud Dashboard](https://app.docker.com/build/)
@z
@x
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

% snip command...

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

@x within code
        // Cache-only build
@y
        // Cache-only build
@z
@x
        // Build and push a multi-platform image
@y
        // Build and push a multi-platform image
@z

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
# Prerequisites: $DOCKER_ACCOUNT, $CLOUD_BUILDER_NAME, $DOCKER_ACCESS_TOKEN setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
@y
# Prerequisites: $DOCKER_ACCOUNT, $CLOUD_BUILDER_NAME, $DOCKER_ACCESS_TOKEN setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
@z

@x
### Shell script
@y
### Shell script
@z

@x within code
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
@y
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
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
This example requires Buildx version 0.37.0 or later. Set the cloud builder as
the default builder before running `docker compose build` in CI:
@y
This example requires Buildx version 0.37.0 or later. Set the cloud builder as
the default builder before running `docker compose build` in CI:
@z

@x within code
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
@y
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
@z
@x
# Connect to your builder and set it as the default builder
@y
# Connect to your builder and set it as the default builder
@z
@x
# Build the images
@y
# Build the images
@z
