%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Cache management with GitHub Actions
linkTitle: Cache management
keywords: ci, github actions, gha, buildkit, buildx, cache
@y
title: Cache management with GitHub Actions
linkTitle: Cache management
keywords: ci, github actions, gha, buildkit, buildx, cache
@z

@x
This page contains examples on using the cache storage backends with GitHub
Actions.
@y
This page contains examples on using the cache storage backends with GitHub
Actions.
@z

@x
> [!NOTE]
>
> See [Cache storage backends](../../cache/backends/_index.md) for more
> details about cache storage backends.
@y
> [!NOTE]
>
> See [Cache storage backends](../../cache/backends/_index.md) for more
> details about cache storage backends.
@z

@x
## Inline cache
@y
## Inline cache
@z

@x
In most cases you want to use the [inline cache exporter](../../cache/backends/inline.md).
However, note that the `inline` cache exporter only supports `min` cache mode.
To use `max` cache mode, push the image and the cache separately using the
registry cache exporter with the `cache-to` option, as shown in the [registry cache example](#registry-cache).
@y
In most cases you want to use the [inline cache exporter](../../cache/backends/inline.md).
However, note that the `inline` cache exporter only supports `min` cache mode.
To use `max` cache mode, push the image and the cache separately using the
registry cache exporter with the `cache-to` option, as shown in the [registry cache example](#registry-cache).
@z

% snip code...

@x
## Registry cache
@y
## Registry cache
@z

@x
You can import/export cache from a cache manifest or (special) image
configuration on the registry with the [registry cache exporter](../../cache/backends/registry.md).
@y
You can import/export cache from a cache manifest or (special) image
configuration on the registry with the [registry cache exporter](../../cache/backends/registry.md).
@z

% snip code...

@x
## GitHub cache
@y
## GitHub cache
@z

@x
### Cache backend API
@y
### Cache backend API
@z

@x
{{< summary-bar feature_name="Cache backend API" >}}
@y
{{< summary-bar feature_name="Cache backend API" >}}
@z

@x
The [GitHub Actions cache exporter](../../cache/backends/gha.md)
backend uses the [GitHub Cache service API](https://github.com/tonistiigi/go-actions-cache)
to fetch and upload cache blobs. That's why you should only use this cache
backend in a GitHub Action workflow, as the `url` (`$ACTIONS_RESULTS_URL`) and
`token` (`$ACTIONS_RUNTIME_TOKEN`) attributes only get populated in a workflow
context.
@y
The [GitHub Actions cache exporter](../../cache/backends/gha.md)
backend uses the [GitHub Cache service API](https://github.com/tonistiigi/go-actions-cache)
to fetch and upload cache blobs. That's why you should only use this cache
backend in a GitHub Action workflow, as the `url` (`$ACTIONS_RESULTS_URL`) and
`token` (`$ACTIONS_RUNTIME_TOKEN`) attributes only get populated in a workflow
context.
@z

% snip code...

@x
> [!IMPORTANT]
>
> Starting [April 15th, 2025, only GitHub Cache service API v2 will be supported](https://gh.io/gha-cache-sunset).
>
> If you encounter the following error during your build:
@y
> [!IMPORTANT]
>
> Starting [April 15th, 2025, only GitHub Cache service API v2 will be supported](https://gh.io/gha-cache-sunset).
>
> If you encounter the following error during your build:
@z

% snip output...

@x
> You're probably using outdated tools that only support the legacy GitHub
> Cache service API v1. Here are the minimum versions you need to upgrade to
> depending on your use case:
> * Docker Buildx >= v0.21.0
> * BuildKit >= v0.20.0
> * Docker Compose >= v2.33.1
> * Docker Engine >= v28.0.0 (if you're building using the Docker driver with containerd image store enabled)
@y
> You're probably using outdated tools that only support the legacy GitHub
> Cache service API v1. Here are the minimum versions you need to upgrade to
> depending on your use case:
> * Docker Buildx >= v0.21.0
> * BuildKit >= v0.20.0
> * Docker Compose >= v2.33.1
> * Docker Engine >= v28.0.0 (if you're building using the Docker driver with containerd image store enabled)
@z

@x
> If you're building using the `docker/build-push-action` or `docker/bake-action`
> actions on GitHub hosted runners, Docker Buildx and BuildKit are already up
> to date but on self-hosted runners, you may need to update them yourself.
> Alternatively, you can use the `docker/setup-buildx-action` action to install
> the latest version of Docker Buildx:
@y
> If you're building using the `docker/build-push-action` or `docker/bake-action`
> actions on GitHub hosted runners, Docker Buildx and BuildKit are already up
> to date but on self-hosted runners, you may need to update them yourself.
> Alternatively, you can use the `docker/setup-buildx-action` action to install
> the latest version of Docker Buildx:
@z

% snip code...

@x
> If you're building using Docker Compose, you can use the
> `docker/setup-compose-action` action:
@y
> If you're building using Docker Compose, you can use the
> `docker/setup-compose-action` action:
@z

% snip code...

@x
> If you're building using the Docker Engine with the containerd image store
> enabled, you can use the `docker/setup-docker-action` action:
@y
> If you're building using the Docker Engine with the containerd image store
> enabled, you can use the `docker/setup-docker-action` action:
@z

% snip code...

@x
### Cache mounts
@y
### Cache mounts
@z

@x
BuildKit doesn't preserve cache mounts in the GitHub Actions cache by default.
To put your cache mounts into GitHub Actions cache and reuse it
between builds, you can use a workaround provided by
[`reproducible-containers/buildkit-cache-dance`](https://github.com/reproducible-containers/buildkit-cache-dance).
@y
BuildKit doesn't preserve cache mounts in the GitHub Actions cache by default.
To put your cache mounts into GitHub Actions cache and reuse it
between builds, you can use a workaround provided by
[`reproducible-containers/buildkit-cache-dance`](https://github.com/reproducible-containers/buildkit-cache-dance).
@z

@x
This GitHub Action creates temporary containers to extract and inject the
cache mount data with your Docker build steps.
@y
This GitHub Action creates temporary containers to extract and inject the
cache mount data with your Docker build steps.
@z

@x
The following example shows how to use this workaround with a Go project.
@y
The following example shows how to use this workaround with a Go project.
@z

@x
Example Dockerfile in `build/package/Dockerfile`
@y
Example Dockerfile in `build/package/Dockerfile`
@z

% snip code...

@x
Example CI action
@y
Example CI action
@z

% snip code...

@x
For more information about this workaround, refer to the
[GitHub repository](https://github.com/reproducible-containers/buildkit-cache-dance).
@y
For more information about this workaround, refer to the
[GitHub repository](https://github.com/reproducible-containers/buildkit-cache-dance).
@z

@x
### Local cache
@y
### Local cache
@z

@x
> [!WARNING]
>
> At the moment, old cache entries aren't deleted, so the cache size [keeps growing](https://github.com/docker/build-push-action/issues/252).
> The following example uses the `Move cache` step as a workaround (see [`moby/buildkit#1896`](https://github.com/moby/buildkit/issues/1896)
> for more info).
@y
> [!WARNING]
>
> At the moment, old cache entries aren't deleted, so the cache size [keeps growing](https://github.com/docker/build-push-action/issues/252).
> The following example uses the `Move cache` step as a workaround (see [`moby/buildkit#1896`](https://github.com/moby/buildkit/issues/1896)
> for more info).
@z

@x
You can also leverage [GitHub cache](https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows)
using the [actions/cache](https://github.com/actions/cache) and [local cache exporter](../../cache/backends/local.md)
with this action:
@y
You can also leverage [GitHub cache](https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows)
using the [actions/cache](https://github.com/actions/cache) and [local cache exporter](../../cache/backends/local.md)
with this action:
@z

% snip code...
