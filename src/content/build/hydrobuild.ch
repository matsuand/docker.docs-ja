%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Hydrobuild
description: Get started with Docker Hydrobuild
sitemap: false
---
@y
---
title: Hydrobuild
description: Get started with Docker Hydrobuild
sitemap: false
---
@z

@x
> **Early Access**
>
> Docker Hydrobuild is an early-access service that provides cloud-based
> builders for your Docker organization.
>
> If you want to get involved in testing Hydrobuild, you can
> [sign up for the early access program](https://www.docker.com/build-early-access-program/?utm_source=docs).
{ .restricted }
@y
> **Early Access**
>
> Docker Hydrobuild is an early-access service that provides cloud-based
> builders for your Docker organization.
>
> If you want to get involved in testing Hydrobuild, you can
> [sign up for the early access program](https://www.docker.com/build-early-access-program/?utm_source=docs).
{ .restricted }
@z

@x
Hydrobuild is a service that lets you build your container images faster, both
locally and in CI. Builds run on cloud infrastructure optimally dimensioned for
your workloads, no configuration required. The service uses a remote build
cache, ensuring fast builds anywhere and for all team members.
@y
Hydrobuild is a service that lets you build your container images faster, both
locally and in CI. Builds run on cloud infrastructure optimally dimensioned for
your workloads, no configuration required. The service uses a remote build
cache, ensuring fast builds anywhere and for all team members.
@z

@x
## How Hydrobuild works
@y
## How Hydrobuild works
@z

@x
Using Hydrobuild is no different from running a regular build. You invoke a
build the same way you normally would, using `docker buildx build`. The
difference is in where and how that build gets executed.
@y
Using Hydrobuild is no different from running a regular build. You invoke a
build the same way you normally would, using `docker buildx build`. The
difference is in where and how that build gets executed.
@z

@x
By default when you invoke a build command, the build runs on a local instance
of BuildKit, bundled with the Docker daemon. With Hydrobuild, you send the
build request to a BuildKit instance running remotely, in the cloud.
@y
By default when you invoke a build command, the build runs on a local instance
of BuildKit, bundled with the Docker daemon. With Hydrobuild, you send the
build request to a BuildKit instance running remotely, in the cloud.
@z

@x
The remote builder executes the build steps, and sends the resulting build
output to the destination that you specify. For example, back to your local
Docker Engine image store, or to an image registry.
@y
The remote builder executes the build steps, and sends the resulting build
output to the destination that you specify. For example, back to your local
Docker Engine image store, or to an image registry.
@z

@x
Hydrobuild provides several benefits over local builds:
@y
Hydrobuild provides several benefits over local builds:
@z

@x
- Improved build speed
- Shared build cache
- Native multi-platform builds
@y
- Improved build speed
- Shared build cache
- Native multi-platform builds
@z

@x
And the best part: you don't need to worry about managing builders or
infrastructure. Just connect to your builders, and start building.
@y
And the best part: you don't need to worry about managing builders or
infrastructure. Just connect to your builders, and start building.
@z

@x
## Setup
@y
## Setup
@z

@x
To get started with Hydrobuild, you need to:
@y
To get started with Hydrobuild, you need to:
@z

@x
- Download and install a version of Buildx that supports Hydrobuild.
@y
- Download and install a version of Buildx that supports Hydrobuild.
@z

@x
- Have a Docker ID that's part of a Docker organization participating in the
  [Hydrobuild early access program](https://www.docker.com/build-early-access-program/?utm_source=docs).
@y
- Have a Docker ID that's part of a Docker organization participating in the
  [Hydrobuild early access program](https://www.docker.com/build-early-access-program/?utm_source=docs).
@z

@x
Docker Desktop 4.23.0 and later versions ship with a Hydrobuild-compatible
Buildx binary. Alternatively, you can download and install the binary manually
from [this repository](https://github.com/docker/buildx-desktop).
@y
Docker Desktop 4.23.0 and later versions ship with a Hydrobuild-compatible
Buildx binary. Alternatively, you can download and install the binary manually
from [this repository](https://github.com/docker/buildx-desktop).
@z

@x
## Connect to Hydrobuild
@y
## Connect to Hydrobuild
@z

@x
To start using Hydrobuild, you must first add the builder's endpoint to your
local Docker configuration.
@y
To start using Hydrobuild, you must first add the builder's endpoint to your
local Docker configuration.
@z

@x
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@z

@x
1. Sign in to your Docker account
@y
1. Sign in to your Docker account
@z

@x
   ```console
   $ docker login
   ```
@y
   ```console
   $ docker login
   ```
@z

@x
2. Add the Hydrobuild endpoint.
@y
2. Add the Hydrobuild endpoint.
@z

@x
   ```console
   $ docker buildx create --driver cloud <ORG>/default
   ```
@y
   ```console
   $ docker buildx create --driver cloud <ORG>/default
   ```
@z

@x
   Replace `ORG` with the Docker Hub namespace of your Docker organization.
@y
   Replace `ORG` with the Docker Hub namespace of your Docker organization.
@z

@x
This creates a builder named `cloud-ORG-default`.
@y
This creates a builder named `cloud-ORG-default`.
@z

@x
{{< /tab >}}
{{< tab name="GUI" >}}
@y
{{< /tab >}}
{{< tab name="GUI" >}}
@z

@x
Enable the [Builds view](../desktop/use-desktop/builds.md) in Docker Desktop
and complete the following steps:
@y
Enable the [Builds view](../desktop/use-desktop/builds.md) in Docker Desktop
and complete the following steps:
@z

@x
1. Sign in to your Docker account using the **Sign in** button in Docker Desktop.
@y
1. Sign in to your Docker account using the **Sign in** button in Docker Desktop.
@z

@x
2. Open the Docker Desktop settings and navigate to the **Builders** tab.
@y
2. Open the Docker Desktop settings and navigate to the **Builders** tab.
@z

@x
3. Under **Available builders**, select **Create builder**.
@y
3. Under **Available builders**, select **Create builder**.
@z

@x
   ![Create builder GUI screenshot](./images/create-builder-gui.webp)
@y
   ![Create builder GUI screenshot](./images/create-builder-gui.webp)
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The builder has native support for the `linux/amd64` and `linux/arm64`
architectures. This gives you a high-performance build cluster for building
multi-platform images natively.
@y
The builder has native support for the `linux/amd64` and `linux/arm64`
architectures. This gives you a high-performance build cluster for building
multi-platform images natively.
@z

@x
## Use Hydrobuild from the CLI
@y
## Use Hydrobuild from the CLI
@z

@x
To build using Hydrobuild, invoke a build command and specify the name of the
builder using the `--builder` flag.
@y
To build using Hydrobuild, invoke a build command and specify the name of the
builder using the `--builder` flag.
@z

@x
```console
$ docker buildx build --builder cloud-<ORG>-default --tag <IMAGE> .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-default --tag <IMAGE> .
```
@z

@x
If you want to use Hydrobuild without having to specify the `--builder` flag
each time, you can set it as the default builder.
@y
If you want to use Hydrobuild without having to specify the `--builder` flag
each time, you can set it as the default builder.
@z

@x
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@z

@x
Run the following command:
@y
Run the following command:
@z

@x
```console
$ docker buildx use cloud-<ORG>-default --global
```
@y
```console
$ docker buildx use cloud-<ORG>-default --global
```
@z

@x
{{< /tab >}}
{{< tab name="GUI" >}}
@y
{{< /tab >}}
{{< tab name="GUI" >}}
@z

@x
1. Open the Docker Desktop settings and navigate to the **Builders** tab.
2. Find the Hydrobuild builder under **Available builders**.
3. Open the drop-down menu and select **Use**.
@y
1. Open the Docker Desktop settings and navigate to the **Builders** tab.
2. Find the Hydrobuild builder under **Available builders**.
3. Open the drop-down menu and select **Use**.
@z

@x
   ![Selecting Hydrobuild as default using the GUI](./images/set-default-builder-gui.webp)
@y
   ![Selecting Hydrobuild as default using the GUI](./images/set-default-builder-gui.webp)
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Changing your default builder with `docker buildx use` only changes the default
builder for the `docker buildx build` command. The `docker build` command still
uses the `default` builder, unless you specify the `--builder` flag explicitly.
@y
Changing your default builder with `docker buildx use` only changes the default
builder for the `docker buildx build` command. The `docker build` command still
uses the `default` builder, unless you specify the `--builder` flag explicitly.
@z

@x
If you use build scripts, such as `make`, we recommend that you update your
build commands from `docker build` to `docker buildx build`, to avoid any
confusion with regards to builder selection. Alternatively, you can run `docker
buildx install` to make the default `docker build` command behave like `docker
buildx build`, without discrepancies.
@y
If you use build scripts, such as `make`, we recommend that you update your
build commands from `docker build` to `docker buildx build`, to avoid any
confusion with regards to builder selection. Alternatively, you can run `docker
buildx install` to make the default `docker build` command behave like `docker
buildx build`, without discrepancies.
@z

@x
## Loading build results
@y
## Loading build results
@z

@x
Building with `--tag` loads the build result to the local image store
automatically when the build finishes. To build without a tag and load the
result, you must pass the `--load` flag.
@y
Building with `--tag` loads the build result to the local image store
automatically when the build finishes. To build without a tag and load the
result, you must pass the `--load` flag.
@z

@x
Loading the build result for multi-platform images is not supported. Use the
`docker buildx build --push` flag when building multi-platform images to push
the output to a registry.
@y
Loading the build result for multi-platform images is not supported. Use the
`docker buildx build --push` flag when building multi-platform images to push
the output to a registry.
@z

@x
```console
$ docker buildx build --builder cloud-<ORG>-default \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-default \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@z

@x
If you want to build with a tag, but you don't want to load the results to your
local image store, you can export the build results to the build cache only:
@y
If you want to build with a tag, but you don't want to load the results to your
local image store, you can export the build results to the build cache only:
@z

@x
```console
$ docker buildx build --builder cloud-<ORG>-default \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --output type=cacheonly .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-default \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --output type=cacheonly .
```
@z

@x
## Multi-platform builds
@y
## Multi-platform builds
@z

@x
To run multi-platform builds, you must specify all of the platforms that you
want to build for using the `--platform` flag.
@y
To run multi-platform builds, you must specify all of the platforms that you
want to build for using the `--platform` flag.
@z

@x
```console
$ docker buildx build --builder cloud-<ORG>-default \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-default \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@z

@x
If you don't specify the platform, Hydrobuild automatically builds for the
architecture matching your local environment.
@y
If you don't specify the platform, Hydrobuild automatically builds for the
architecture matching your local environment.
@z

@x
To learn more about building for multiple platforms, refer to [Multi-platform
builds](./building/multi-platform.md).
@y
To learn more about building for multiple platforms, refer to [Multi-platform
builds](./building/multi-platform.md).
@z

@x
## Use Hydrobuild in CI
@y
## Use Hydrobuild in CI
@z

@x
Using Hydrobuild in CI can speed up your build pipelines, which means less time
spent waiting and context switching. You control your CI workflows as usual,
and delegate the build execution to Hydrobuild.
@y
Using Hydrobuild in CI can speed up your build pipelines, which means less time
spent waiting and context switching. You control your CI workflows as usual,
and delegate the build execution to Hydrobuild.
@z

@x
Building with Hydrobuild in CI involve the following steps:
@y
Building with Hydrobuild in CI involve the following steps:
@z

@x
1. Sign in to a Docker account.
2. Set up Buildx and create the builder.
3. Run the build.
@y
1. Sign in to a Docker account.
2. Set up Buildx and create the builder.
3. Run the build.
@z

@x
When using Hydrobuild in CI, it's recommended that you push the result to a
registry directly, rather than loading the image and then pushing it. Pushing
directly speeds up your builds and avoids unnecessary file transfers.
@y
When using Hydrobuild in CI, it's recommended that you push the result to a
registry directly, rather than loading the image and then pushing it. Pushing
directly speeds up your builds and avoids unnecessary file transfers.
@z

@x
If you just want to build and discard the output, export the results to the
build cache or build without tagging the image. Hydrobuild automatically loads
the build result if you build a tagged image. See [Loading build
results](#loading-build-results) for details.
@y
If you just want to build and discard the output, export the results to the
build cache or build without tagging the image. Hydrobuild automatically loads
the build result if you build a tagged image. See [Loading build
results](#loading-build-results) for details.
@z

@x
{{< tabs >}}
{{< tab name="GitHub Actions" >}}
@y
{{< tabs >}}
{{< tab name="GitHub Actions" >}}
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
      - name: Checkout
        uses: actions/checkout@v4
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          version: "lab:latest"
          driver: cloud
          endpoint: "<ORG>/default"
          install: true
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          tags: "<IMAGE>"
          # For pull requests, export results to the build cache.
          # Otherwise, push to a registry.
          outputs: ${{ github.event_name == 'pull_request' && 'type=cacheonly' || 'type=registry,push=true' }}
```
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          version: "lab:latest"
          driver: cloud
          endpoint: "<ORG>/default"
          install: true
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          tags: "<IMAGE>"
          # For pull requests, export results to the build cache.
          # Otherwise, push to a registry.
          outputs: ${{ github.event_name == 'pull_request' && 'type=cacheonly' || 'type=registry,push=true' }}
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
        --push .
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
        --push .
```
@z

@x
{{< /tab >}}
{{< tab name="CircleCI" >}}
@y
{{< /tab >}}
{{< tab name="CircleCI" >}}
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
The following example sets up a Buildkite pipeline using Hydrobuild. The
example assumes that the pipeline name is `build-push-docker` and that you
manage the Docker access token using environment hooks, but feel free to adapt
this to your needs.
@y
The following example sets up a Buildkite pipeline using Hydrobuild. The
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
# Download docker buildx with Hyrdobuild support
curl --silent -L --output $DOCKER_DIR/cli-plugins/docker-buildx $BUILDX_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
@y
# Download docker buildx with Hyrdobuild support
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
# Download docker buildx with Hyrdobuild support
mkdir -vp ~/.docker/cli-plugins/
curl --silent -L --output ~/.docker/cli-plugins/docker-buildx $BUILDX_URL
chmod a+x ~/.docker/cli-plugins/docker-buildx
@y
# Download docker buildx with Hyrdobuild support
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
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Hydrobuild in Docker Desktop
@y
## Hydrobuild in Docker Desktop
@z

@x
The Docker Desktop [Builds view](../desktop/use-desktop/builds.md) works with
Hydrobuild out of the box. With Hydrobuild, the Builds view becomes a
collaboration tool, showing information about not only your own builds, but
also builds initiated by your team members using the same builder.
@y
The Docker Desktop [Builds view](../desktop/use-desktop/builds.md) works with
Hydrobuild out of the box. With Hydrobuild, the Builds view becomes a
collaboration tool, showing information about not only your own builds, but
also builds initiated by your team members using the same builder.
@z

@x
Teams using a shared builder get access to information such as:
@y
Teams using a shared builder get access to information such as:
@z

@x
- Ongoing and completed builds
- Build configuration, statistics, dependencies, and results
- Build source (Dockerfile)
- Build logs and errors
@y
- Ongoing and completed builds
- Build configuration, statistics, dependencies, and results
- Build source (Dockerfile)
- Build logs and errors
@z

@x
This lets you and your team can work collaboratively on troubleshooting and
improving build speeds, without having to send build logs and benchmarks back
and forth between each other.
@y
This lets you and your team can work collaboratively on troubleshooting and
improving build speeds, without having to send build logs and benchmarks back
and forth between each other.
@z

@x
## Optimize for building in the cloud
@y
## Optimize for building in the cloud
@z

@x
Hydrobuild runs your builds remotely, and not on the machine where you invoke
the build. This means that file transfers between the client and builder happens
over the network.
@y
Hydrobuild runs your builds remotely, and not on the machine where you invoke
the build. This means that file transfers between the client and builder happens
over the network.
@z

@x
Transferring files over the network has a higher latency and lower bandwidth
than local transfers. Hydrobuild has several features to mitigate this:
@y
Transferring files over the network has a higher latency and lower bandwidth
than local transfers. Hydrobuild has several features to mitigate this:
@z

@x
- It uses attached storage volumes for build cache, which makes reading and
  writing cache very fast.
- Loading build results back to the client only pulls the layers that were
  changed compared to previous builds.
@y
- It uses attached storage volumes for build cache, which makes reading and
  writing cache very fast.
- Loading build results back to the client only pulls the layers that were
  changed compared to previous builds.
@z

@x
Despite these optimizations, building remotely can still yield slow context
transfers and image loads, for large projects or if the network connection is
slow. Here are some ways that you can optimize your builds to make the transfer
more efficient:
@y
Despite these optimizations, building remotely can still yield slow context
transfers and image loads, for large projects or if the network connection is
slow. Here are some ways that you can optimize your builds to make the transfer
more efficient:
@z

@x
- [Dockerignore files](#dockerignore-files)
- [Slim base images](#slim-base-images)
- [Multi-stage builds](#multi-stage-builds)
- [Fetch remote files in build](#fetch-remote-files-in-build)
- [Multi-threaded tools](#multi-threaded-tools)
@y
- [Dockerignore files](#dockerignore-files)
- [Slim base images](#slim-base-images)
- [Multi-stage builds](#multi-stage-builds)
- [Fetch remote files in build](#fetch-remote-files-in-build)
- [Multi-threaded tools](#multi-threaded-tools)
@z

@x
### Dockerignore files
@y
### Dockerignore files
@z

@x
Using a [`.dockerignore` file](./building/context.md#dockerignore-files), you can be
explicit about which local files that you don’t want to include in the build
context. Files caught by the glob patterns you specify in your ignore-file are
not transferred to the remote builder.
@y
Using a [`.dockerignore` file](./building/context.md#dockerignore-files), you can be
explicit about which local files that you don’t want to include in the build
context. Files caught by the glob patterns you specify in your ignore-file are
not transferred to the remote builder.
@z

@x
Some examples of things you might want to add to your `.dockerignore` file are:
@y
Some examples of things you might want to add to your `.dockerignore` file are:
@z

@x
- `.git` — skip sending the version control history in the build context. Note
  that this means you won’t be able to run Git commands in your build steps,
  such as `git rev-parse` etc.
- Directories containing build artifacts, such as binaries. Build artifacts
  created locally during development.
- Vendor directories for package managers, such as `node_modules`.
@y
- `.git` — skip sending the version control history in the build context. Note
  that this means you won’t be able to run Git commands in your build steps,
  such as `git rev-parse` etc.
- Directories containing build artifacts, such as binaries. Build artifacts
  created locally during development.
- Vendor directories for package managers, such as `node_modules`.
@z

@x
In general, the contents of your `.dockerignore` file should be similar to what
you have in your `.gitignore`.
@y
In general, the contents of your `.dockerignore` file should be similar to what
you have in your `.gitignore`.
@z

@x
### Slim base images
@y
### Slim base images
@z

@x
Selecting smaller images for your `FROM` instructions in your Dockerfile can
help reduce the size of the final image. The [Alpine image](https://hub.docker.com/_/alpine)
is a good example of a minimal Docker image that provides all of the OS
utilities you would expect from a Linux container.
@y
Selecting smaller images for your `FROM` instructions in your Dockerfile can
help reduce the size of the final image. The [Alpine image](https://hub.docker.com/_/alpine)
is a good example of a minimal Docker image that provides all of the OS
utilities you would expect from a Linux container.
@z

@x
There’s also the [special `scratch` image](https://hub.docker.com/_/scratch),
which contains nothing at all. Useful for creating images of statically linked
binaries, for example.
@y
There’s also the [special `scratch` image](https://hub.docker.com/_/scratch),
which contains nothing at all. Useful for creating images of statically linked
binaries, for example.
@z

@x
### Multi-stage builds
@y
### Multi-stage builds
@z

@x
[Multi-stage builds](./guide/multi-stage.md) can make your build run faster,
because stages can run in parallel. It can also make your end-result smaller.
Write your Dockerfile in such a way that the final runtime stage uses the
smallest possible base image, with only the resources that your program requires
to run.
@y
[Multi-stage builds](./guide/multi-stage.md) can make your build run faster,
because stages can run in parallel. It can also make your end-result smaller.
Write your Dockerfile in such a way that the final runtime stage uses the
smallest possible base image, with only the resources that your program requires
to run.
@z

@x
It’s also possible to
[copy resources from other images or stages](./building/multi-stage.md#name-your-build-stages),
using the Dockerfile `COPY --from` instruction. This technique can reduce the
number of layers, and the size of those layers, in the final stage.
@y
It’s also possible to
[copy resources from other images or stages](./building/multi-stage.md#name-your-build-stages),
using the Dockerfile `COPY --from` instruction. This technique can reduce the
number of layers, and the size of those layers, in the final stage.
@z

@x
### Fetch remote files in build
@y
### Fetch remote files in build
@z

@x
When possible, you should fetch files from a remote location in the build,
rather than bundling the files into the build context. Downloading files on the
Hydrobuild server directly is better, because it will likely be faster than
transferring the files with the build context.
@y
When possible, you should fetch files from a remote location in the build,
rather than bundling the files into the build context. Downloading files on the
Hydrobuild server directly is better, because it will likely be faster than
transferring the files with the build context.
@z

@x
You can fetch remote files during the build using the
[Dockerfile `ADD` instruction](../engine/reference/builder.md#add),
or in your `RUN` instructions with tools like `wget` and `rsync`.
@y
You can fetch remote files during the build using the
[Dockerfile `ADD` instruction](../engine/reference/builder.md#add),
or in your `RUN` instructions with tools like `wget` and `rsync`.
@z

@x
### Multi-threaded tools
@y
### Multi-threaded tools
@z

@x
Some tools that you use in your build instructions may not utilize multiple
cores by default. One such example is `make` which uses a single thread by
default, unless you specify the `make --jobs=<n>` option. For build steps
involving such tools, try checking if you can optimize the execution with
parallelization.
@y
Some tools that you use in your build instructions may not utilize multiple
cores by default. One such example is `make` which uses a single thread by
default, unless you specify the `make --jobs=<n>` option. For build steps
involving such tools, try checking if you can optimize the execution with
parallelization.
@z

@x
## Frequently asked questions
@y
## Frequently asked questions
@z

@x
### How do I remove Hydrobuild from my system?
@y
### How do I remove Hydrobuild from my system?
@z

@x
If you want to stop using Hydrobuild, and remove it from your system, remove
the builder using the `docker buildx rm` command.
@y
If you want to stop using Hydrobuild, and remove it from your system, remove
the builder using the `docker buildx rm` command.
@z

@x
```console
$ docker buildx rm cloud-<ORG>-default
```
@y
```console
$ docker buildx rm cloud-<ORG>-default
```
@z

@x
This doesn't deprovision the builder backend, it only removes the builder from
your local Docker client.
@y
This doesn't deprovision the builder backend, it only removes the builder from
your local Docker client.
@z

@x
### Are builders shared between organizations?
@y
### Are builders shared between organizations?
@z

@x
No. Each Hydrobuild builder provisioned to an organization is completely
isolated to a single Amazon EC2 instance, with a dedicated EBS volume for build
cache, and end-to-end encryption. That means there are no shared processes or
data between Hydrobuild jobs.
@y
No. Each Hydrobuild builder provisioned to an organization is completely
isolated to a single Amazon EC2 instance, with a dedicated EBS volume for build
cache, and end-to-end encryption. That means there are no shared processes or
data between Hydrobuild jobs.
@z

@x
### Do I need to add my secrets the builder to access private resources?
@y
### Do I need to add my secrets the builder to access private resources?
@z

@x
No. Your interface to Hydrobuild is Buildx, and you can use the existing
`--secret` and `--ssh` CLI flags for managing build secrets.
@y
No. Your interface to Hydrobuild is Buildx, and you can use the existing
`--secret` and `--ssh` CLI flags for managing build secrets.
@z

@x
For more information, refer to:
@y
For more information, refer to:
@z

@x
- [docker buildx build --secret](../engine/reference/commandline/buildx_build.md#secret)
- [docker buildx build --ssh](../engine/reference/commandline/buildx_build.md#ssh)
@y
- [docker buildx build --secret](../engine/reference/commandline/buildx_build.md#secret)
- [docker buildx build --ssh](../engine/reference/commandline/buildx_build.md#ssh)
@z

@x
### How do I unset Hydrobuild as the default builder?
@y
### How do I unset Hydrobuild as the default builder?
@z

@x
If you've set Hydrobuild as the default builder and want to revert to using the
default `docker` builder, run the following command:
@y
If you've set Hydrobuild as the default builder and want to revert to using the
default `docker` builder, run the following command:
@z

@x
```console
$ docker context use default
```
@y
```console
$ docker context use default
```
@z

@x
### How do I manage the build cache with Hydrobuild?
@y
### How do I manage the build cache with Hydrobuild?
@z

@x
You don't need to manage the builder's cache manually. The system manages it
for you through [garbage collection](./cache/garbage-collection.md).
@y
You don't need to manage the builder's cache manually. The system manages it
for you through [garbage collection](./cache/garbage-collection.md).
@z

@x
Hydrobuild uses the following garbage collection limits:
@y
Hydrobuild uses the following garbage collection limits:
@z

@x
- Size: 90% of 1TB
- Age: cache not used in the past 180 days
- Number of build history records: 10 000
@y
- Size: 90% of 1TB
- Age: cache not used in the past 180 days
- Number of build history records: 10 000
@z

@x
Old cache is automatically removed if you hit any of these limits. You can
check your current cache state using the [`docker buildx du`
command](../engine/reference/commandline/buildx_du.md).
@y
Old cache is automatically removed if you hit any of these limits. You can
check your current cache state using the [`docker buildx du`
command](../engine/reference/commandline/buildx_du.md).
@z

@x
To clear the builder's cache manually, you can use the [`docker buildx prune`
command](../engine/reference/commandline/buildx_prune.md) command. This works
like pruning the cache for any other builder.
@y
To clear the builder's cache manually, you can use the [`docker buildx prune`
command](../engine/reference/commandline/buildx_prune.md) command. This works
like pruning the cache for any other builder.
@z

@x
> **Note**
>
> Pruning Hydrobuild cache also removes the cache for other team members using
> the same builder.
@y
> **Note**
>
> Pruning Hydrobuild cache also removes the cache for other team members using
> the same builder.
@z
