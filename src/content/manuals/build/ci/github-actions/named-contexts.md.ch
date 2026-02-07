%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Named contexts with GitHub Actions
linkTitle: Named contexts
description: Use additional contexts in multi-stage builds with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, context
@y
title: Named contexts with GitHub Actions
linkTitle: Named contexts
description: Use additional contexts in multi-stage builds with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, context
@z

@x
You can define [additional build contexts](/reference/cli/docker/buildx/build.md#build-context),
and access them in your Dockerfile with `FROM name` or `--from=name`. When
Dockerfile defines a stage with the same name it's overwritten.
@y
You can define [additional build contexts](reference/cli/docker/buildx/build.md#build-context),
and access them in your Dockerfile with `FROM name` or `--from=name`. When
Dockerfile defines a stage with the same name it's overwritten.
@z

@x
This can be useful with GitHub Actions to reuse results from other builds or pin
an image to a specific tag in your workflow.
@y
This can be useful with GitHub Actions to reuse results from other builds or pin
an image to a specific tag in your workflow.
@z

@x
## Pin image to a tag
@y
## Pin image to a tag
@z

@x
Replace `alpine:latest` with a pinned one:
@y
Replace `alpine:latest` with a pinned one:
@z

% snip code...

@x
## Use image in subsequent steps
@y
## Use image in subsequent steps
@z

@x
By default, the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
action uses `docker-container` as a build driver, so built Docker images aren't
loaded automatically.
@y
By default, the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
action uses `docker-container` as a build driver, so built Docker images aren't
loaded automatically.
@z

@x
With named contexts you can reuse the built image:
@y
With named contexts you can reuse the built image:
@z

% snip code...

@x
## Using with a container builder
@y
## Using with a container builder
@z

@x
As shown in the previous section we are not using the default
[`docker-container` driver](../../builders/drivers/docker-container.md) for building with
named contexts. That's because this driver can't load an image from the Docker
store as it's isolated. To solve this problem you can use a [local registry](local-registry.md)
to push your base image in your workflow:
@y
As shown in the previous section we are not using the default
[`docker-container` driver](../../builders/drivers/docker-container.md) for building with
named contexts. That's because this driver can't load an image from the Docker
store as it's isolated. To solve this problem you can use a [local registry](local-registry.md)
to push your base image in your workflow:
@z

% snip code...

@x within code
          # network=host driver-opt needed to push to local registry
@y
          # network=host driver-opt needed to push to local registry
@z
