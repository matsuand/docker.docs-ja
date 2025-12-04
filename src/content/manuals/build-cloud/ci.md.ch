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
- If you are an organization administrator or have permission to create [organization access tokens (OAT)](/manuals/enterprise/security/access-tokens.md), use an OAT and set `DOCKER_ACCOUNT` to your Docker Hub organization name.
- If you do not have permission to create OATs or are using a personal account, use a [personal access token (PAT)](/security/access-tokens/) and set `DOCKER_ACCOUNT` to your Docker Hub username.
@y
- If you are an organization administrator or have permission to create [organization access tokens (OAT)](manuals/enterprise/security/access-tokens.md), use an OAT and set `DOCKER_ACCOUNT` to your Docker Hub organization name.
- If you do not have permission to create OATs or are using a personal account, use a [personal access token (PAT)](__SUBDIR__/security/access-tokens/) and set `DOCKER_ACCOUNT` to your Docker Hub username.
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
- Create an [organization access token (OAT)](/manuals/enterprise/security/access-tokens.md). The token must have these permissions:
    1. **cloud-connect** scope
    2. **Read public repositories** permission
    3. **Repository access** with **Image push** permission for the target repository:
        - Expand the **Repository** drop-down.
        - Select **Add repository** and choose your target repository.
        - Set the **Image push** permission for the repository.
@y
- Create an [organization access token (OAT)](manuals/enterprise/security/access-tokens.md). The token must have these permissions:
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
- Create a [personal access token (PAT)](/security/access-tokens/) with the following permissions:
   1. **Read & write** access.
        - Note: Building with Docker Build Cloud only requires read access, but you need write access to push images to a Docker Hub repository.
@y
- Create a [personal access token (PAT)](__SUBDIR__/security/access-tokens/) with the following permissions:
   1. **Read & write** access.
        - Note: Building with Docker Build Cloud only requires read access, but you need write access to push images to a Docker Hub repository.
@z

@x
## CI platform examples
@y
## CI platform examples
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

% snip code...

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

% snip code...

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

% snip code...

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

@x
```bash
DOCKER_DIR=/usr/libexec/docker
@y
```bash
DOCKER_DIR=/usr/libexec/docker
@z

@x
# Get download link for latest buildx binary.
# Set $ARCH to the CPU architecture (e.g. amd64, arm64)
UNAME_ARCH=`uname -m`
case $UNAME_ARCH in
  aarch64)
    ARCH="arm64";
    ;;
  amd64)
    ARCH="amd64";
    ;;
  *)
    ARCH="amd64";
    ;;
esac
BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
@y
# Get download link for latest buildx binary.
# Set $ARCH to the CPU architecture (e.g. amd64, arm64)
UNAME_ARCH=`uname -m`
case $UNAME_ARCH in
  aarch64)
    ARCH="arm64";
    ;;
  amd64)
    ARCH="amd64";
    ;;
  *)
    ARCH="amd64";
    ;;
esac
BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
@z

@x
# Download docker buildx with Build Cloud support
curl --silent -L --output $DOCKER_DIR/cli-plugins/docker-buildx $BUILDX_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
@y
# Download docker buildx with Build Cloud support
curl --silent -L --output $DOCKER_DIR/cli-plugins/docker-buildx $BUILDX_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
@z

@x
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@y
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@z

@x
# Cache-only image build
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag "$IMAGE_NAME:$BUILDKITE_COMMIT" \
    --output type=cacheonly \
    .
@y
# Cache-only image build
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag "$IMAGE_NAME:$BUILDKITE_COMMIT" \
    --output type=cacheonly \
    .
@z

@x
# Build, tag, and push a multi-arch docker image
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag "$IMAGE_NAME:$BUILDKITE_COMMIT" \
    .
```
@y
# Build, tag, and push a multi-arch docker image
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag "$IMAGE_NAME:$BUILDKITE_COMMIT" \
    .
```
@z

@x
### Jenkins
@y
### Jenkins
@z

@x
```groovy
pipeline {
  agent any
@y
```groovy
pipeline {
  agent any
@z

@x
  environment {
    ARCH = 'amd64'
    DOCKER_ACCESS_TOKEN = credentials('docker-access-token')
    DOCKER_ACCOUNT = credentials('docker-account')
    CLOUD_BUILDER_NAME = '<CLOUD_BUILDER_NAME>'
    IMAGE_NAME = '<IMAGE>'
  }
@y
  environment {
    ARCH = 'amd64'
    DOCKER_ACCESS_TOKEN = credentials('docker-access-token')
    DOCKER_ACCOUNT = credentials('docker-account')
    CLOUD_BUILDER_NAME = '<CLOUD_BUILDER_NAME>'
    IMAGE_NAME = '<IMAGE>'
  }
@z

@x
  stages {
    stage('Build') {
      environment {
        BUILDX_URL = sh (returnStdout: true, script: 'curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\\"linux-$ARCH\\"))"').trim()
      }
      steps {
        sh 'mkdir -vp ~/.docker/cli-plugins/'
        sh 'curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL'
        sh 'chmod a+x ~/.docker/cli-plugins/docker-buildx'
        sh 'echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin'
        sh 'docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"'
        // Cache-only build
        sh 'docker buildx build --platform linux/amd64,linux/arm64 --tag "$IMAGE_NAME" --output type=cacheonly .'
        // Build and push a multi-platform image
        sh 'docker buildx build --platform linux/amd64,linux/arm64 --push --tag "$IMAGE_NAME" .'
      }
    }
  }
}
```
@y
  stages {
    stage('Build') {
      environment {
        BUILDX_URL = sh (returnStdout: true, script: 'curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\\"linux-$ARCH\\"))"').trim()
      }
      steps {
        sh 'mkdir -vp ~/.docker/cli-plugins/'
        sh 'curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL'
        sh 'chmod a+x ~/.docker/cli-plugins/docker-buildx'
        sh 'echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin'
        sh 'docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"'
        // Cache-only build
        sh 'docker buildx build --platform linux/amd64,linux/arm64 --tag "$IMAGE_NAME" --output type=cacheonly .'
        // Build and push a multi-platform image
        sh 'docker buildx build --platform linux/amd64,linux/arm64 --push --tag "$IMAGE_NAME" .'
      }
    }
  }
}
```
@z

@x
### Travis CI
@y
### Travis CI
@z

@x
```yaml
language: minimal 
dist: jammy 
@y
```yaml
language: minimal 
dist: jammy 
@z

@x
services:
  - docker
@y
services:
  - docker
@z

@x
env:
  global:
    - IMAGE_NAME=<IMAGE> # for example, "acme/my-image:latest"
@y
env:
  global:
    - IMAGE_NAME=<IMAGE> # for example, "acme/my-image:latest"
@z

@x
before_install: |
  echo "$DOCKER_ACCESS_TOKEN" | docker login --username "$DOCKER_ACCOUNT" --password-stdin
@y
before_install: |
  echo "$DOCKER_ACCESS_TOKEN" | docker login --username "$DOCKER_ACCOUNT" --password-stdin
@z

@x
install: |
  set -e 
  BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$TRAVIS_CPU_ARCH\"))")
  mkdir -vp ~/.docker/cli-plugins/
  curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
  chmod a+x ~/.docker/cli-plugins/docker-buildx
  docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@y
install: |
  set -e 
  BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$TRAVIS_CPU_ARCH\"))")
  mkdir -vp ~/.docker/cli-plugins/
  curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
  chmod a+x ~/.docker/cli-plugins/docker-buildx
  docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@z

@x
script: |
  docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --push \
  --tag "$IMAGE_NAME" .
```
@y
script: |
  docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --push \
  --tag "$IMAGE_NAME" .
```
@z

@x
### BitBucket Pipelines 
@y
### BitBucket Pipelines 
@z

@x
```yaml
# Prerequisites: $DOCKER_ACCOUNT, $CLOUD_BUILDER_NAME, $DOCKER_ACCESS_TOKEN setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
@y
```yaml
# Prerequisites: $DOCKER_ACCOUNT, $CLOUD_BUILDER_NAME, $DOCKER_ACCESS_TOKEN setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
@z

@x
image: atlassian/default-image:3
@y
image: atlassian/default-image:3
@z

@x
pipelines:
  default:
    - step:
        name: Build multi-platform image
        script:
          - mkdir -vp ~/.docker/cli-plugins/
          - ARCH=amd64
          - BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
          - curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
          - chmod a+x ~/.docker/cli-plugins/docker-buildx
          - echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin
          - docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
          - IMAGE_NAME=$BITBUCKET_REPO_SLUG
          - docker buildx build
            --platform linux/amd64,linux/arm64
            --push
            --tag "$IMAGE_NAME" .
        services:
          - docker
```
@y
pipelines:
  default:
    - step:
        name: Build multi-platform image
        script:
          - mkdir -vp ~/.docker/cli-plugins/
          - ARCH=amd64
          - BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
          - curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
          - chmod a+x ~/.docker/cli-plugins/docker-buildx
          - echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin
          - docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
          - IMAGE_NAME=$BITBUCKET_REPO_SLUG
          - docker buildx build
            --platform linux/amd64,linux/arm64
            --push
            --tag "$IMAGE_NAME" .
        services:
          - docker
```
@z

@x
### Shell script
@y
### Shell script
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
@y
# Get download link for latest buildx binary. Set $ARCH to the CPU architecture (e.g. amd64, arm64)
ARCH=amd64
BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
@z

@x
# Download docker buildx with Build Cloud support
mkdir -vp ~/.docker/cli-plugins/
curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
@y
# Download docker buildx with Build Cloud support
mkdir -vp ~/.docker/cli-plugins/
curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
@z

@x
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin
@y
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin
@z

@x
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@y
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@z

@x
# Cache-only image build
docker buildx build \
    --tag temp \
    --output type=cacheonly \
    .
@y
# Cache-only image build
docker buildx build \
    --tag temp \
    --output type=cacheonly \
    .
@z

@x
# Build, tag, and push a multi-arch docker image
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag "<IMAGE>" \
    .
```
@y
# Build, tag, and push a multi-arch docker image
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag "<IMAGE>" \
    .
```
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
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin
@y
# Login to Docker Hub with an access token. See https://docs.docker.com/build-cloud/ci/#creating-access-tokens
echo "$DOCKER_ACCESS_TOKEN" | docker login --username $DOCKER_ACCOUNT --password-stdin
@z

@x
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
@y
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "${DOCKER_ACCOUNT}/${CLOUD_BUILDER_NAME}"
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
