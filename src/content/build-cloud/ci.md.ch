%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use Docker Build Cloud in CI
description: Speed up your continuous integration pipelines with Docker Build Cloud in CI
keywords: build, cloud build, ci, gha, gitlab, buildkite, jenkins, circle ci
@y
title: Use Docker Build Cloud in CI
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
{{< tabs >}}
{{< tab name="GitHub Actions" >}}
@y
{{< tabs >}}
{{< tab name="GitHub Actions" >}}
@z

@x
> [!NOTE]
>
> Version 4.0.0 and later of `docker/build-push-action` and
> `docker/bake-action` builds images with [provenance attestations by
> default](/build/ci/github-actions/attestations.md#default-provenance). Docker
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
> default](build/ci/github-actions/attestations.md#default-provenance). Docker
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
    branches:
      - "main"
@y
on:
  push:
    branches:
      - "main"
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          version: "lab:latest"
          driver: cloud
          endpoint: "<ORG>/default"
          install: true
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          tags: "<IMAGE>"
          # For pull requests, export results to the build cache.
          # Otherwise, push to a registry.
          outputs: ${{ github.event_name == 'pull_request' && 'type=cacheonly' || 'type=registry' }}
```
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          version: "lab:latest"
          driver: cloud
          endpoint: "<ORG>/default"
          install: true
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          tags: "<IMAGE>"
          # For pull requests, export results to the build cache.
          # Otherwise, push to a registry.
          outputs: ${{ github.event_name == 'pull_request' && 'type=cacheonly' || 'type=registry' }}
```
@z

@x
{{< /tab >}}
{{< tab name="GitLab" >}}
@y
{{< /tab >}}
{{< tab name="GitLab" >}}
@z

@x
```yaml
default:
  image: docker:24-dind
  services:
    - docker:24-dind
  before_script:
    - docker info
    - echo "$DOCKER_PAT" | docker login --username "$DOCKER_USER" --password-stdin
    - |
      apk add curl jq
      ARCH=${CI_RUNNER_EXECUTABLE_ARCH#*/}
      BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
      mkdir -vp ~/.docker/cli-plugins/
      curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
      chmod a+x ~/.docker/cli-plugins/docker-buildx
    - docker buildx create --use --driver cloud ${DOCKER_ORG}/default
@y
```yaml
default:
  image: docker:24-dind
  services:
    - docker:24-dind
  before_script:
    - docker info
    - echo "$DOCKER_PAT" | docker login --username "$DOCKER_USER" --password-stdin
    - |
      apk add curl jq
      ARCH=${CI_RUNNER_EXECUTABLE_ARCH#*/}
      BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
      mkdir -vp ~/.docker/cli-plugins/
      curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
      chmod a+x ~/.docker/cli-plugins/docker-buildx
    - docker buildx create --use --driver cloud ${DOCKER_ORG}/default
@z

@x
variables:
  IMAGE_NAME: <IMAGE>
  DOCKER_ORG: <ORG>
@y
variables:
  IMAGE_NAME: <IMAGE>
  DOCKER_ORG: <ORG>
@z

@x
# Build multi-platform image and push to a registry
build_push:
  stage: build
  script:
    - |
      docker buildx build \
        --platform linux/amd64,linux/arm64 \
        --tag "${IMAGE_NAME}:${CI_COMMIT_SHORT_SHA}" \
        --push .
@y
# Build multi-platform image and push to a registry
build_push:
  stage: build
  script:
    - |
      docker buildx build \
        --platform linux/amd64,linux/arm64 \
        --tag "${IMAGE_NAME}:${CI_COMMIT_SHORT_SHA}" \
        --push .
@z

@x
# Build an image and discard the result
build_cache:
  stage: build
  script:
    - |
      docker buildx build \
        --platform linux/amd64,linux/arm64 \
        --tag "${IMAGE_NAME}:${CI_COMMIT_SHORT_SHA}" \
        --output type=cacheonly \
        .
```
@y
# Build an image and discard the result
build_cache:
  stage: build
  script:
    - |
      docker buildx build \
        --platform linux/amd64,linux/arm64 \
        --tag "${IMAGE_NAME}:${CI_COMMIT_SHORT_SHA}" \
        --output type=cacheonly \
        .
```
@z

@x
{{< /tab >}}
{{< tab name="Circle CI" >}}
@y
{{< /tab >}}
{{< tab name="Circle CI" >}}
@z

@x
```yaml
version: 2.1
@y
```yaml
version: 2.1
@z

@x
jobs:
  # Build multi-platform image and push to a registry
  build_push:
    machine:
      image: ubuntu-2204:current
    steps:
      - checkout
@y
jobs:
  # Build multi-platform image and push to a registry
  build_push:
    machine:
      image: ubuntu-2204:current
    steps:
      - checkout
@z

@x
      - run: |
          mkdir -vp ~/.docker/cli-plugins/
          ARCH=amd64
          BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
          curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
          chmod a+x ~/.docker/cli-plugins/docker-buildx
@y
      - run: |
          mkdir -vp ~/.docker/cli-plugins/
          ARCH=amd64
          BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
          curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
          chmod a+x ~/.docker/cli-plugins/docker-buildx
@z

@x
      - run: echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
      - run: docker buildx create --use --driver cloud "<ORG>/default"
@y
      - run: echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
      - run: docker buildx create --use --driver cloud "<ORG>/default"
@z

@x
      - run: |
          docker buildx build \
          --platform linux/amd64,linux/arm64 \
          --push \
          --tag "<IMAGE>" .
@y
      - run: |
          docker buildx build \
          --platform linux/amd64,linux/arm64 \
          --push \
          --tag "<IMAGE>" .
@z

@x
  # Build an image and discard the result
  build_cache:
    machine:
      image: ubuntu-2204:current
    steps:
      - checkout
@y
  # Build an image and discard the result
  build_cache:
    machine:
      image: ubuntu-2204:current
    steps:
      - checkout
@z

@x
      - run: |
          mkdir -vp ~/.docker/cli-plugins/
          ARCH=amd64
          BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
          curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
          chmod a+x ~/.docker/cli-plugins/docker-buildx
@y
      - run: |
          mkdir -vp ~/.docker/cli-plugins/
          ARCH=amd64
          BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$ARCH\"))")
          curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
          chmod a+x ~/.docker/cli-plugins/docker-buildx
@z

@x
      - run: echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
      - run: docker buildx create --use --driver cloud "<ORG>/default"
@y
      - run: echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
      - run: docker buildx create --use --driver cloud "<ORG>/default"
@z

@x
      - run: |
          docker buildx build \
          --tag temp \
          --output type=cacheonly \
          .
@y
      - run: |
          docker buildx build \
          --tag temp \
          --output type=cacheonly \
          .
@z

@x
workflows:
  pull_request:
    jobs:
      - build_cache
  release:
    jobs:
      - build_push
```
@y
workflows:
  pull_request:
    jobs:
      - build_cache
  release:
    jobs:
      - build_push
```
@z

@x
{{< /tab >}}
{{< tab name="Buildkite" >}}
@y
{{< /tab >}}
{{< tab name="Buildkite" >}}
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

@x
```bash
#!/bin/bash
set -euo pipefail
@y
```bash
#!/bin/bash
set -euo pipefail
@z

@x
if [[ "$BUILDKITE_PIPELINE_NAME" == "build-push-docker" ]]; then
 export DOCKER_PAT="<DOCKER_PERSONAL_ACCESS_TOKEN>"
fi
```
@y
if [[ "$BUILDKITE_PIPELINE_NAME" == "build-push-docker" ]]; then
 export DOCKER_PAT="<DOCKER_PERSONAL_ACCESS_TOKEN>"
fi
```
@z

@x
Create a `pipeline.yml` that uses the `docker-login` plugin:
@y
Create a `pipeline.yml` that uses the `docker-login` plugin:
@z

@x
```yaml
env:
  DOCKER_ORG: <ORG>
  IMAGE_NAME: <IMAGE>
@y
```yaml
env:
  DOCKER_ORG: <ORG>
  IMAGE_NAME: <IMAGE>
@z

@x
steps:
  - command: ./build.sh
    key: build-push
    plugins:
      - docker-login#v2.1.0:
          username: <DOCKER_USER>
          password-env: DOCKER_PAT # the variable name in the environment hook
```
@y
steps:
  - command: ./build.sh
    key: build-push
    plugins:
      - docker-login#v2.1.0:
          username: <DOCKER_USER>
          password-env: DOCKER_PAT # the variable name in the environment hook
```
@z

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
docker buildx create --use --driver cloud "$DOCKER_ORG/default"
@y
# Connect to your builder and set it as the default builder
docker buildx create --use --driver cloud "$DOCKER_ORG/default"
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
{{< /tab >}}
{{< tab name="Jenkins" >}}
@y
{{< /tab >}}
{{< tab name="Jenkins" >}}
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
    DOCKER_PAT = credentials('docker-personal-access-token')
    DOCKER_USER = credentials('docker-username')
    DOCKER_ORG = '<ORG>'
    IMAGE_NAME = '<IMAGE>'
  }
@y
  environment {
    ARCH = 'amd64'
    DOCKER_PAT = credentials('docker-personal-access-token')
    DOCKER_USER = credentials('docker-username')
    DOCKER_ORG = '<ORG>'
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
        sh 'echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin'
        sh 'docker buildx create --use --driver cloud "$DOCKER_ORG/default"'
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
        sh 'echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin'
        sh 'docker buildx create --use --driver cloud "$DOCKER_ORG/default"'
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
{{< /tab >}}
{{< tab name="Travis CI" >}}
@y
{{< /tab >}}
{{< tab name="Travis CI" >}}
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
    - IMAGE_NAME=username/repo
@y
env:
  global:
    - IMAGE_NAME=username/repo
@z

@x
before_install: |
  echo "$DOCKER_PAT" | docker login --username "$DOCKER_USER" --password-stdin
@y
before_install: |
  echo "$DOCKER_PAT" | docker login --username "$DOCKER_USER" --password-stdin
@z

@x
install: |
  set -e 
  BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$TRAVIS_CPU_ARCH\"))")
  mkdir -vp ~/.docker/cli-plugins/
  curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
  chmod a+x ~/.docker/cli-plugins/docker-buildx
  docker buildx create --use --driver cloud "<ORG>/default"
@y
install: |
  set -e 
  BUILDX_URL=$(curl -s https://raw.githubusercontent.com/docker/actions-toolkit/main/.github/buildx-lab-releases.json | jq -r ".latest.assets[] | select(endswith(\"linux-$TRAVIS_CPU_ARCH\"))")
  mkdir -vp ~/.docker/cli-plugins/
  curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
  chmod a+x ~/.docker/cli-plugins/docker-buildx
  docker buildx create --use --driver cloud "<ORG>/default"
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
{{< /tab >}}
{{< tab name="BitBucket Pipelines" >}}
@y
{{< /tab >}}
{{< tab name="BitBucket Pipelines" >}}
@z

@x
```yaml
# Prerequisites: $DOCKER_USER, $DOCKER_PAT setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
# Replace <ORG> in the `docker buildx create` command with your Docker org
@y
```yaml
# Prerequisites: $DOCKER_USER, $DOCKER_PAT setup as deployment variables
# This pipeline assumes $BITBUCKET_REPO_SLUG as the image name
# Replace <ORG> in the `docker buildx create` command with your Docker org
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
          - echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
          - docker buildx create --use --driver cloud "<ORG>/default"
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
          - echo "$DOCKER_PAT" | docker login --username $DOCKER_USER --password-stdin
          - docker buildx create --use --driver cloud "<ORG>/default"
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
{{< /tab >}}
{{< tab name="Shell" >}}
@y
{{< /tab >}}
{{< tab name="Shell" >}}
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
{{< /tab >}}
{{< tab name="Docker Compose" >}}
@y
{{< /tab >}}
{{< tab name="Docker Compose" >}}
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

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
