%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Cloud driver
description: The cloud driver connects Buildx to managed builders in Docker Build Cloud.
keywords: build, buildx, driver, builder, cloud, Docker Build Cloud
@y
title: Cloud driver
description: The cloud driver connects Buildx to managed builders in Docker Build Cloud.
keywords: build, buildx, driver, builder, cloud, Docker Build Cloud
@z

@x
The Buildx cloud driver connects to managed BuildKit instances in Docker Build
Cloud. Docker provisions and maintains the builder infrastructure, shared build
cache, and native `linux/amd64` and `linux/arm64` nodes.
@y
The Buildx cloud driver connects to managed BuildKit instances in Docker Build
Cloud. Docker provisions and maintains the builder infrastructure, shared build
cache, and native `linux/amd64` and `linux/arm64` nodes.
@z

@x
The cloud driver requires Buildx version 0.37.0 or later and access to Docker
Build Cloud.
@y
The cloud driver requires Buildx version 0.37.0 or later and access to Docker
Build Cloud.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Before connecting Buildx, create a cloud builder on the
[Docker Build Cloud Dashboard](https://app.docker.com/build/). Then sign in and
connect to the builder:
@y
Before connecting Buildx, create a cloud builder on the
[Docker Build Cloud Dashboard](https://app.docker.com/build/). Then sign in and
connect to the builder:
@z

@x
```console
$ docker login
$ docker buildx create --driver cloud <ORG>/<BUILDER_NAME>
```
@y
```console
$ docker login
$ docker buildx create --driver cloud <ORG>/<BUILDER_NAME>
```
@z

@x
The command adds the cloud builder to your local Buildx configuration. It does
not create a builder in Docker Build Cloud.
@y
The command adds the cloud builder to your local Buildx configuration. It does
not create a builder in Docker Build Cloud.
@z

@x
For service prerequisites and authentication, see
[Docker Build Cloud setup](/manuals/build-cloud/setup.md). For build examples,
see [Building with Docker Build Cloud](/manuals/build-cloud/usage.md).
@y
For service prerequisites and authentication, see
[Docker Build Cloud setup](manuals/build-cloud/setup.md). For build examples,
see [Building with Docker Build Cloud](manuals/build-cloud/usage.md).
@z
