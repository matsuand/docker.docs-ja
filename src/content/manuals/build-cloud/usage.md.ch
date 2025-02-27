%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Building with Docker Build Cloud
linkTitle: Usage
@y
title: Building with Docker Build Cloud
linkTitle: Usage
@z

@x
description: Invoke your cloud builds with the Buildx CLI client
keywords: build, cloud build, usage, cli, buildx, client
@y
description: Invoke your cloud builds with the Buildx CLI client
keywords: build, cloud build, usage, cli, buildx, client
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
   ![Selecting the cloud builder as default using the Docker Desktop GUI](__SUBDIR__/build/images/set-default-builder-gui.webp)
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
## Use with Docker Compose
@y
## Use with Docker Compose
@z

@x
To build with Docker Build Cloud using `docker compose build`, first set the
cloud builder as your selected builder, then run your build.
@y
To build with Docker Build Cloud using `docker compose build`, first set the
cloud builder as your selected builder, then run your build.
@z

@x
> [!NOTE]
>
> Make sure you're using a supported version of Docker Compose, see
> [Prerequisites](setup.md#prerequisites).
@y
> [!NOTE]
>
> Make sure you're using a supported version of Docker Compose, see
> [Prerequisites](setup.md#prerequisites).
@z

@x
```console
$ docker buildx use cloud-<ORG>-<BUILDER_NAME>
$ docker compose build
```
@y
```console
$ docker buildx use cloud-<ORG>-<BUILDER_NAME>
$ docker compose build
```
@z

@x
In addition to `docker buildx use`, you can also use the `docker compose build
--builder` flag or the [`BUILDX_BUILDER` environment
variable](/manuals/build/building/variables.md#buildx_builder) to select the cloud builder.
@y
In addition to `docker buildx use`, you can also use the `docker compose build
--builder` flag or the [`BUILDX_BUILDER` environment
variable](manuals/build/building/variables.md#buildx_builder) to select the cloud builder.
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
builds](__SUBDIR__/build/building/multi-platform/).
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
The Docker Desktop [Builds view](__SUBDIR__/desktop/use-desktop/builds/) works with
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

@x
## Use secrets with Docker Build Cloud
@y
## Use secrets with Docker Build Cloud
@z

@x
To use build secrets with Docker Build Cloud,
such as authentication credentials or tokens,
use the `--secret` and `--ssh` CLI flags for the `docker buildx` command.
The traffic is encrypted and secrets are never stored in the build cache.
@y
To use build secrets with Docker Build Cloud,
such as authentication credentials or tokens,
use the `--secret` and `--ssh` CLI flags for the `docker buildx` command.
The traffic is encrypted and secrets are never stored in the build cache.
@z

@x
> [!WARNING]
>
> If you're misusing build arguments to pass credentials, authentication
> tokens, or other secrets, you should refactor your build to pass the secrets using
> [secret mounts](/reference/cli/docker/buildx/build.md#secret) instead.
> Build arguments are stored in the cache and their values are exposed through attestations.
> Secret mounts don't leak outside of the build and are never included in attestations.
@y
> [!WARNING]
>
> If you're misusing build arguments to pass credentials, authentication
> tokens, or other secrets, you should refactor your build to pass the secrets using
> [secret mounts](reference/cli/docker/buildx/build.md#secret) instead.
> Build arguments are stored in the cache and their values are exposed through attestations.
> Secret mounts don't leak outside of the build and are never included in attestations.
@z

@x
For more information, refer to:
@y
For more information, refer to:
@z

@x
- [`docker buildx build --secret`](/reference/cli/docker/buildx/build/#secret)
- [`docker buildx build --ssh`](/reference/cli/docker/buildx/build/#ssh)
@y
- [`docker buildx build --secret`](__SUBDIR__/reference/cli/docker/buildx/build/#secret)
- [`docker buildx build --ssh`](__SUBDIR__/reference/cli/docker/buildx/build/#ssh)
@z

@x
## Managing build cache
@y
## Managing build cache
@z

@x
You don't need to manage Docker Build Cloud cache manually.
The system manages it for you through [garbage collection](/build/cache/garbage-collection/).
@y
You don't need to manage Docker Build Cloud cache manually.
The system manages it for you through [garbage collection](__SUBDIR__/build/cache/garbage-collection/).
@z

@x
Old cache is automatically removed if you hit your storage limit.
You can check your current cache state using the
[`docker buildx du` command](/reference/cli/docker/buildx/du/).
@y
Old cache is automatically removed if you hit your storage limit.
You can check your current cache state using the
[`docker buildx du` command](__SUBDIR__/reference/cli/docker/buildx/du/).
@z

@x
To clear the builder's cache manually,
use the [`docker buildx prune` command](/reference/cli/docker/buildx/prune/).
This works like pruning the cache for any other builder.
@y
To clear the builder's cache manually,
use the [`docker buildx prune` command](__SUBDIR__/reference/cli/docker/buildx/prune/).
This works like pruning the cache for any other builder.
@z

@x
> [!WARNING]
>
> Pruning a cloud builder's cache also removes the cache for other team members
> using the same builder.
@y
> [!WARNING]
>
> Pruning a cloud builder's cache also removes the cache for other team members
> using the same builder.
@z

@x
## Unset Docker Build Cloud as the default builder
@y
## Unset Docker Build Cloud as the default builder
@z

@x
If you've set a cloud builder as the default builder
and want to revert to the default `docker` builder,
run the following command:
@y
If you've set a cloud builder as the default builder
and want to revert to the default `docker` builder,
run the following command:
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
This doesn't remove the builder from your system.
It only changes the builder that's automatically selected to run your builds.
@y
This doesn't remove the builder from your system.
It only changes the builder that's automatically selected to run your builds.
@z

@x
## Registries on internal networks
@y
## Registries on internal networks
@z

@x
It is possible to use Docker Build Cloud with a [private registry](/manuals/build-cloud/builder-settings.md#private-resource-access)
or registry mirror on an internal network.
@y
It is possible to use Docker Build Cloud with a [private registry](manuals/build-cloud/builder-settings.md#private-resource-access)
or registry mirror on an internal network.
@z
