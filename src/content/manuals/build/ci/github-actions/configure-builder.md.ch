%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configuring your GitHub Actions builder
linkTitle: BuildKit configuration
description: Configuring BuildKit instances for building in CI with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx
@y
title: Configuring your GitHub Actions builder
linkTitle: BuildKit configuration
description: Configuring BuildKit instances for building in CI with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx
@z

@x
This page contains instructions on configuring your BuildKit instances when
using our [Setup Buildx Action](https://github.com/docker/setup-buildx-action).
@y
This page contains instructions on configuring your BuildKit instances when
using our [Setup Buildx Action](https://github.com/docker/setup-buildx-action).
@z

@x
## Version pinning
@y
## Version pinning
@z

@x
By default, the action will attempt to use the latest version of [Buildx](https://github.com/docker/buildx)
available on the GitHub Runner (the build client) and the latest release of
[BuildKit](https://github.com/moby/buildkit) (the build server).
@y
By default, the action will attempt to use the latest version of [Buildx](https://github.com/docker/buildx)
available on the GitHub Runner (the build client) and the latest release of
[BuildKit](https://github.com/moby/buildkit) (the build server).
@z

@x
To pin to a specific version of Buildx, use the `version` input. For example,
to pin to Buildx v0.10.0:
@y
To pin to a specific version of Buildx, use the `version` input. For example,
to pin to Buildx v0.10.0:
@z

@x
```yaml
- name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v3
  with:
    version: v0.10.0
```
@y
```yaml
- name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v3
  with:
    version: v0.10.0
```
@z

@x
To pin to a specific version of BuildKit, use the `image` option in the
`driver-opts` input. For example, to pin to BuildKit v0.11.0:
@y
To pin to a specific version of BuildKit, use the `image` option in the
`driver-opts` input. For example, to pin to BuildKit v0.11.0:
@z

@x
```yaml
- name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v3
  with:
    driver-opts: image=moby/buildkit:v0.11.0
```
@y
```yaml
- name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v3
  with:
    driver-opts: image=moby/buildkit:v0.11.0
```
@z

@x
## BuildKit container logs
@y
## BuildKit container logs
@z

@x
To display BuildKit container logs when using the `docker-container` driver,
you must either [enable step debug logging](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging),
or set the `--debug` buildkitd flag in the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx) action:
@y
To display BuildKit container logs when using the `docker-container` driver,
you must either [enable step debug logging](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging),
or set the `--debug` buildkitd flag in the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx) action:
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          buildkitd-flags: --debug
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          buildkitd-flags: --debug
@z

@x
      - name: Build
        uses: docker/build-push-action@v6
```
@y
      - name: Build
        uses: docker/build-push-action@v6
```
@z

@x
Logs will be available at the end of a job:
@y
Logs will be available at the end of a job:
@z

@x
![BuildKit container logs](images/buildkit-container-logs.png)
@y
![BuildKit container logs](images/buildkit-container-logs.png)
@z

@x
## BuildKit Daemon configuration
@y
## BuildKit Daemon configuration
@z

@x
You can provide a [BuildKit configuration](../../buildkit/toml-configuration.md)
to your builder if you're using the [`docker-container` driver](/manuals/build/builders/drivers/docker-container.md)
(default) with the `config` or `config-inline` inputs:
@y
You can provide a [BuildKit configuration](../../buildkit/toml-configuration.md)
to your builder if you're using the [`docker-container` driver](manuals/build/builders/drivers/docker-container.md)
(default) with the `config` or `config-inline` inputs:
@z

@x
### Registry mirror
@y
### Registry mirror
@z

@x
You can configure a registry mirror using an inline block directly in your
workflow with the `config-inline` input:
@y
You can configure a registry mirror using an inline block directly in your
workflow with the `config-inline` input:
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          config-inline: |
            [registry."docker.io"]
              mirrors = ["mirror.gcr.io"]
```
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          config-inline: |
            [registry."docker.io"]
              mirrors = ["mirror.gcr.io"]
```
@z

@x
For more information about using a registry mirror, see [Registry mirror](../../buildkit/configure.md#registry-mirror).
@y
For more information about using a registry mirror, see [Registry mirror](../../buildkit/configure.md#registry-mirror).
@z

@x
### Max parallelism
@y
### Max parallelism
@z

@x
You can limit the parallelism of the BuildKit solver which is particularly
useful for low-powered machines.
@y
You can limit the parallelism of the BuildKit solver which is particularly
useful for low-powered machines.
@z

@x
You can use the `config-inline` input like the previous example, or you can use
a dedicated BuildKit config file from your repository if you want with the
`config` input:
@y
You can use the `config-inline` input like the previous example, or you can use
a dedicated BuildKit config file from your repository if you want with the
`config` input:
@z

@x
```toml
# .github/buildkitd.toml
[worker.oci]
  max-parallelism = 4
```
@y
```toml
# .github/buildkitd.toml
[worker.oci]
  max-parallelism = 4
```
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          config: .github/buildkitd.toml
```
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          config: .github/buildkitd.toml
```
@z

@x
## Append additional nodes to the builder
@y
## Append additional nodes to the builder
@z

@x
Buildx supports running builds on multiple machines. This is useful for building
[multi-platform images](../../building/multi-platform.md) on native nodes for
more complicated cases that aren't handled by QEMU. Building on native nodes
generally has better performance, and allows you to distribute the build across
multiple machines.
@y
Buildx supports running builds on multiple machines. This is useful for building
[multi-platform images](../../building/multi-platform.md) on native nodes for
more complicated cases that aren't handled by QEMU. Building on native nodes
generally has better performance, and allows you to distribute the build across
multiple machines.
@z

@x
You can append nodes to the builder you're creating using the `append` option.
It takes input in the form of a YAML string document to remove limitations
intrinsically linked to GitHub Actions: you can only use strings in the input
fields:
@y
You can append nodes to the builder you're creating using the `append` option.
It takes input in the form of a YAML string document to remove limitations
intrinsically linked to GitHub Actions: you can only use strings in the input
fields:
@z

@x
| Name              | Type   | Description                                                                                                                                                                                                                                                             |
| ----------------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`            | String | [Name of the node](/reference/cli/docker/buildx/create.md#node). If empty, it's the name of the builder it belongs to, with an index number suffix. This is useful to set it if you want to modify/remove a node in an underlying step of you workflow. |
| `endpoint`        | String | [Docker context or endpoint](/reference/cli/docker/buildx/create.md#description) of the node to add to the builder                                                                                                                                      |
| `driver-opts`     | List   | List of additional [driver-specific options](/reference/cli/docker/buildx/create.md#driver-opt)                                                                                                                                                         |
| `buildkitd-flags` | String | [Flags for buildkitd](/reference/cli/docker/buildx/create.md#buildkitd-flags) daemon                                                                                                                                                                    |
| `platforms`       | String | Fixed [platforms](/reference/cli/docker/buildx/create.md#platform) for the node. If not empty, values take priority over the detected ones.                                                                                                             |
@y
| Name              | Type   | Description                                                                                                                                                                                                                                                             |
| ----------------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`            | String | [Name of the node](reference/cli/docker/buildx/create.md#node). If empty, it's the name of the builder it belongs to, with an index number suffix. This is useful to set it if you want to modify/remove a node in an underlying step of you workflow. |
| `endpoint`        | String | [Docker context or endpoint](reference/cli/docker/buildx/create.md#description) of the node to add to the builder                                                                                                                                      |
| `driver-opts`     | List   | List of additional [driver-specific options](reference/cli/docker/buildx/create.md#driver-opt)                                                                                                                                                         |
| `buildkitd-flags` | String | [Flags for buildkitd](reference/cli/docker/buildx/create.md#buildkitd-flags) daemon                                                                                                                                                                    |
| `platforms`       | String | Fixed [platforms](reference/cli/docker/buildx/create.md#platform) for the node. If not empty, values take priority over the detected ones.                                                                                                             |
@z

@x
Here is an example using remote nodes with the [`remote` driver](/manuals/build/builders/drivers/remote.md)
and [TLS authentication](#tls-authentication):
@y
Here is an example using remote nodes with the [`remote` driver](manuals/build/builders/drivers/remote.md)
and [TLS authentication](#tls-authentication):
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver: remote
          endpoint: tcp://oneprovider:1234
          append: |
            - endpoint: tcp://graviton2:1234
              platforms: linux/arm64
            - endpoint: tcp://linuxone:1234
              platforms: linux/s390x
        env:
          BUILDER_NODE_0_AUTH_TLS_CACERT: ${{ secrets.ONEPROVIDER_CA }}
          BUILDER_NODE_0_AUTH_TLS_CERT: ${{ secrets.ONEPROVIDER_CERT }}
          BUILDER_NODE_0_AUTH_TLS_KEY: ${{ secrets.ONEPROVIDER_KEY }}
          BUILDER_NODE_1_AUTH_TLS_CACERT: ${{ secrets.GRAVITON2_CA }}
          BUILDER_NODE_1_AUTH_TLS_CERT: ${{ secrets.GRAVITON2_CERT }}
          BUILDER_NODE_1_AUTH_TLS_KEY: ${{ secrets.GRAVITON2_KEY }}
          BUILDER_NODE_2_AUTH_TLS_CACERT: ${{ secrets.LINUXONE_CA }}
          BUILDER_NODE_2_AUTH_TLS_CERT: ${{ secrets.LINUXONE_CERT }}
          BUILDER_NODE_2_AUTH_TLS_KEY: ${{ secrets.LINUXONE_KEY }}
```
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver: remote
          endpoint: tcp://oneprovider:1234
          append: |
            - endpoint: tcp://graviton2:1234
              platforms: linux/arm64
            - endpoint: tcp://linuxone:1234
              platforms: linux/s390x
        env:
          BUILDER_NODE_0_AUTH_TLS_CACERT: ${{ secrets.ONEPROVIDER_CA }}
          BUILDER_NODE_0_AUTH_TLS_CERT: ${{ secrets.ONEPROVIDER_CERT }}
          BUILDER_NODE_0_AUTH_TLS_KEY: ${{ secrets.ONEPROVIDER_KEY }}
          BUILDER_NODE_1_AUTH_TLS_CACERT: ${{ secrets.GRAVITON2_CA }}
          BUILDER_NODE_1_AUTH_TLS_CERT: ${{ secrets.GRAVITON2_CERT }}
          BUILDER_NODE_1_AUTH_TLS_KEY: ${{ secrets.GRAVITON2_KEY }}
          BUILDER_NODE_2_AUTH_TLS_CACERT: ${{ secrets.LINUXONE_CA }}
          BUILDER_NODE_2_AUTH_TLS_CERT: ${{ secrets.LINUXONE_CERT }}
          BUILDER_NODE_2_AUTH_TLS_KEY: ${{ secrets.LINUXONE_KEY }}
```
@z

@x
## Authentication for remote builders
@y
## Authentication for remote builders
@z

@x
The following examples show how to handle authentication for remote builders,
using SSH or TLS.
@y
The following examples show how to handle authentication for remote builders,
using SSH or TLS.
@z

@x
### SSH authentication
@y
### SSH authentication
@z

@x
To be able to connect to an SSH endpoint using the [`docker-container` driver](/manuals/build/builders/drivers/docker-container.md),
you have to set up the SSH private key and configuration on the GitHub Runner:
@y
To be able to connect to an SSH endpoint using the [`docker-container` driver](manuals/build/builders/drivers/docker-container.md),
you have to set up the SSH private key and configuration on the GitHub Runner:
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up SSH
        uses: MrSquaare/ssh-setup-action@2d028b70b5e397cf8314c6eaea229a6c3e34977a # v3.1.0
        with:
          host: graviton2
          private-key: ${{ secrets.SSH_PRIVATE_KEY }}
          private-key-name: aws_graviton2
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up SSH
        uses: MrSquaare/ssh-setup-action@2d028b70b5e397cf8314c6eaea229a6c3e34977a # v3.1.0
        with:
          host: graviton2
          private-key: ${{ secrets.SSH_PRIVATE_KEY }}
          private-key-name: aws_graviton2
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          endpoint: ssh://me@graviton2
```
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          endpoint: ssh://me@graviton2
```
@z

@x
### TLS authentication
@y
### TLS authentication
@z

@x
You can also [set up a remote BuildKit instance](/manuals/build/builders/drivers/remote.md#example-remote-buildkit-in-docker-container)
using the remote driver. To ease the integration in your workflow, you can use
an environment variables that sets up authentication using the BuildKit client
certificates for the `tcp://`:
@y
You can also [set up a remote BuildKit instance](manuals/build/builders/drivers/remote.md#example-remote-buildkit-in-docker-container)
using the remote driver. To ease the integration in your workflow, you can use
an environment variables that sets up authentication using the BuildKit client
certificates for the `tcp://`:
@z

@x
- `BUILDER_NODE_<idx>_AUTH_TLS_CACERT`
- `BUILDER_NODE_<idx>_AUTH_TLS_CERT`
- `BUILDER_NODE_<idx>_AUTH_TLS_KEY`
@y
- `BUILDER_NODE_<idx>_AUTH_TLS_CACERT`
- `BUILDER_NODE_<idx>_AUTH_TLS_CERT`
- `BUILDER_NODE_<idx>_AUTH_TLS_KEY`
@z

@x
The `<idx>` placeholder is the position of the node in the list of nodes.
@y
The `<idx>` placeholder is the position of the node in the list of nodes.
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver: remote
          endpoint: tcp://graviton2:1234
        env:
          BUILDER_NODE_0_AUTH_TLS_CACERT: ${{ secrets.GRAVITON2_CA }}
          BUILDER_NODE_0_AUTH_TLS_CERT: ${{ secrets.GRAVITON2_CERT }}
          BUILDER_NODE_0_AUTH_TLS_KEY: ${{ secrets.GRAVITON2_KEY }}
```
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver: remote
          endpoint: tcp://graviton2:1234
        env:
          BUILDER_NODE_0_AUTH_TLS_CACERT: ${{ secrets.GRAVITON2_CA }}
          BUILDER_NODE_0_AUTH_TLS_CERT: ${{ secrets.GRAVITON2_CERT }}
          BUILDER_NODE_0_AUTH_TLS_KEY: ${{ secrets.GRAVITON2_KEY }}
```
@z

@x
## Standalone mode
@y
## Standalone mode
@z

@x
If you don't have the Docker CLI installed on the GitHub Runner, the Buildx
binary gets invoked directly, instead of calling it as a Docker CLI plugin. This
can be useful if you want to use the `kubernetes` driver in your self-hosted
runner:
@y
If you don't have the Docker CLI installed on the GitHub Runner, the Buildx
binary gets invoked directly, instead of calling it as a Docker CLI plugin. This
can be useful if you want to use the `kubernetes` driver in your self-hosted
runner:
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
@y
on:
  push:
@z

@x
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  buildx:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver: kubernetes
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver: kubernetes
@z

@x
      - name: Build
        run: |
          buildx build .
```
@y
      - name: Build
        run: |
          buildx build .
```
@z

@x
## Isolated builders
@y
## Isolated builders
@z

@x
The following example shows how you can select different builders for different
jobs.
@y
The following example shows how you can select different builders for different
jobs.
@z

@x
An example scenario where this might be useful is when you are using a monorepo,
and you want to pinpoint different packages to specific builders. For example,
some packages may be particularly resource-intensive to build and require more
compute. Or they require a builder equipped with a particular capability or
hardware.
@y
An example scenario where this might be useful is when you are using a monorepo,
and you want to pinpoint different packages to specific builders. For example,
some packages may be particularly resource-intensive to build and require more
compute. Or they require a builder equipped with a particular capability or
hardware.
@z

@x
For more information about remote builder, see [`remote` driver](/manuals/build/builders/drivers/remote.md)
and the [append builder nodes example](#append-additional-nodes-to-the-builder).
@y
For more information about remote builder, see [`remote` driver](manuals/build/builders/drivers/remote.md)
and the [append builder nodes example](#append-additional-nodes-to-the-builder).
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
@y
on:
  push:
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up builder1
        uses: docker/setup-buildx-action@v3
        id: builder1
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up builder1
        uses: docker/setup-buildx-action@v3
        id: builder1
@z

@x
      - name: Set up builder2
        uses: docker/setup-buildx-action@v3
        id: builder2
@y
      - name: Set up builder2
        uses: docker/setup-buildx-action@v3
        id: builder2
@z

@x
      - name: Build against builder1
        uses: docker/build-push-action@v6
        with:
          builder: ${{ steps.builder1.outputs.name }}
          target: mytarget1
@y
      - name: Build against builder1
        uses: docker/build-push-action@v6
        with:
          builder: ${{ steps.builder1.outputs.name }}
          target: mytarget1
@z

@x
      - name: Build against builder2
        uses: docker/build-push-action@v6
        with:
          builder: ${{ steps.builder2.outputs.name }}
          target: mytarget2
```
@y
      - name: Build against builder2
        uses: docker/build-push-action@v6
        with:
          builder: ${{ steps.builder2.outputs.name }}
          target: mytarget2
```
@z
