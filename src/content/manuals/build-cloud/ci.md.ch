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
> Builds on Docker Build Cloud have a timeout limit of 90 minutes. Builds that
> run for longer than 90 minutes are automatically cancelled.
@y
> [!NOTE]
>
> Builds on Docker Build Cloud have a timeout limit of 90 minutes. Builds that
> run for longer than 90 minutes are automatically cancelled.
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
- If you are an organization administrator or have permission to create [organization access tokens (OAT)](../security/for-admins/access-tokens.md), use an OAT and set `DOCKER_USER` to your Docker Hub organization name.
- If you do not have permission to create OATs or are using a personal account, use a [personal access token (PAT)](/security/for-developers/access-tokens/) and set `DOCKER_USER` to your Docker Hub username.
@y
- If you are an organization administrator or have permission to create [organization access tokens (OAT)](../security/for-admins/access-tokens.md), use an OAT and set `DOCKER_USER` to your Docker Hub organization name.
- If you do not have permission to create OATs or are using a personal account, use a [personal access token (PAT)](__SUBDIR__/security/for-developers/access-tokens/) and set `DOCKER_USER` to your Docker Hub username.
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
1. Create an [organization access token (OAT)](../security/for-admins/access-tokens.md):
@y
1. Create an [organization access token (OAT)](../security/for-admins/access-tokens.md):
@z

@x
   - The token must have these permissions:
     - **cloud-connect** scope
     - **Read public repositories** permission
     - **Repository access** with **Image push** permission for the target repository:
       - Expand the **Repository** drop-down.
       - Select **Add repository** and choose your target repository.
       - Set the **Image push** permission for the repository.
@y
   - The token must have these permissions:
     - **cloud-connect** scope
     - **Read public repositories** permission
     - **Repository access** with **Image push** permission for the target repository:
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
1. Create a [personal access token (PAT)](/security/for-developers/access-tokens/):
@y
1. Create a [personal access token (PAT)](__SUBDIR__/security/for-developers/access-tokens/):
@z

@x
   - Create a new token with **Read & write** access.
     - Note: Building with Docker Build Cloud only requires read access, but you need write access to push images to a Docker Hub repository.
@y
   - Create a new token with **Read & write** access.
     - Note: Building with Docker Build Cloud only requires read access, but you need write access to push images to a Docker Hub repository.
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
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
@y
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
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
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
@y
# Login to Docker Hub. For security reasons $DOCKER_PAT should be a Personal Access Token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
@z
@x
# Connect to your builder and set it as the default builder
@y
# Connect to your builder and set it as the default builder
@z

@x
# Build the image build
@y
# Build the image build
@z
