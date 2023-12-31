%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Building with Docker Build Cloud
description: Invoke your cloud builds with the Buildx CLI client
keywords: build, cloud build, usage, cli, buildx, client
aliases:
  - /hydrobuild/usage/
---
@y
---
title: Building with Docker Build Cloud
description: Invoke your cloud builds with the Buildx CLI client
keywords: build, cloud build, usage, cli, buildx, client
aliases:
  - /hydrobuild/usage/
---
@z

@x
To build using Docker Build Cloud, invoke a build command and specify the name of the
builder using the `--builder` flag.
@y
To build using Docker Build Cloud, invoke a build command and specify the name of the
builder using the `--builder` flag.
@z

@x
```console
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> --tag <IMAGE> .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> --tag <IMAGE> .
```
@z

@x
## Use by default
@y
## Use by default
@z

@x
If you want to use Docker Build Cloud without having to specify the `--builder` flag
each time, you can set it as the default builder.
@y
If you want to use Docker Build Cloud without having to specify the `--builder` flag
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
$ docker buildx use cloud-<ORG>-<BUILDER_NAME> --global
```
@y
```console
$ docker buildx use cloud-<ORG>-<BUILDER_NAME> --global
```
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
1. Open the Docker Desktop settings and navigate to the **Builders** tab.
2. Find the cloud builder under **Available builders**.
3. Open the drop-down menu and select **Use**.
@y
1. Open the Docker Desktop settings and navigate to the **Builders** tab.
2. Find the cloud builder under **Available builders**.
3. Open the drop-down menu and select **Use**.
@z

@x
   ![Selecting the cloud builder as default using the Docker Desktop GUI](/build/images/set-default-builder-gui.webp)
@y
   ![Selecting the cloud builder as default using the Docker Desktop GUI](/build/images/set-default-builder-gui.webp)
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
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> \
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
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --output type=cacheonly .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> \
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
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@y
```console
$ docker buildx build --builder cloud-<ORG>-<BUILDER_NAME> \
  --platform linux/amd64,linux/arm64 \
  --tag <IMAGE> \
  --push .
```
@z

@x
If you don't specify the platform, the cloud builder automatically builds for the
architecture matching your local environment.
@y
If you don't specify the platform, the cloud builder automatically builds for the
architecture matching your local environment.
@z

@x
To learn more about building for multiple platforms, refer to [Multi-platform
builds](/build/building/multi-platform/).
@y
To learn more about building for multiple platforms, refer to [Multi-platform
builds](/build/building/multi-platform/).
@z

@x
## Cloud builds in Docker Desktop
@y
## Cloud builds in Docker Desktop
@z

@x
The Docker Desktop [Builds view](/desktop/use-desktop/builds/) works with
Docker Build Cloud out of the box. This view can show information about not only your
own builds, but also builds initiated by your team members using the same
builder.
@y
The Docker Desktop [Builds view](/desktop/use-desktop/builds/) works with
Docker Build Cloud out of the box. This view can show information about not only your
own builds, but also builds initiated by your team members using the same
builder.
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
This lets you and your team work collaboratively on troubleshooting and
improving build speeds, without having to send build logs and benchmarks back
and forth between each other.
@y
This lets you and your team work collaboratively on troubleshooting and
improving build speeds, without having to send build logs and benchmarks back
and forth between each other.
@z
