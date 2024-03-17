%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: GitHub Actions cache
description: Use the GitHub Actions cache to manage your build cache in CI
keywords: build, buildx, cache, backend, gha, github, actions
aliases:
  - /build/building/cache/backends/gha/
---
@y
---
title: GitHub Actions cache
description: Use the GitHub Actions cache to manage your build cache in CI
keywords: build, buildx, cache, backend, gha, github, actions
aliases:
  - /build/building/cache/backends/gha/
---
@z

@x
> **Experimental**
>
> This is an experimental feature. The interface and behavior are unstable and
> may change in future releases.
{ .restricted }
@y
> **Experimental**
>
> This is an experimental feature. The interface and behavior are unstable and
> may change in future releases.
{ .restricted }
@z

@x
The GitHub Actions cache utilizes the
[GitHub-provided Action's cache](https://github.com/actions/cache) or other
cache services supporting the GitHub Actions cache protocol. This is the
recommended cache to use inside your GitHub Actions workflows, as long as your
use case falls within the
[size and usage limits set by GitHub](https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows#usage-limits-and-eviction-policy).
@y
The GitHub Actions cache utilizes the
[GitHub-provided Action's cache](https://github.com/actions/cache) or other
cache services supporting the GitHub Actions cache protocol. This is the
recommended cache to use inside your GitHub Actions workflows, as long as your
use case falls within the
[size and usage limits set by GitHub](https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows#usage-limits-and-eviction-policy).
@z

@x
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](../../drivers/_index.md) for more information.
@y
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](../../drivers/_index.md) for more information.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=gha[,parameters...] \
  --cache-from type=gha[,parameters...] .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=gha[,parameters...] \
  --cache-from type=gha[,parameters...] .
```
@z

@x
The following table describes the available CSV parameters that you can pass to
`--cache-to` and `--cache-from`.
@y
The following table describes the available CSV parameters that you can pass to
`--cache-to` and `--cache-from`.
@z

@x
| Name           | Option                  | Type        | Default                  | Description                                                          |
| -------------- | ----------------------- | ----------- | ------------------------ | -------------------------------------------------------------------- |
| `url`          | `cache-to`,`cache-from` | String      | `$ACTIONS_CACHE_URL`     | Cache server URL, see [authentication][1].                           |
| `token`        | `cache-to`,`cache-from` | String      | `$ACTIONS_RUNTIME_TOKEN` | Access token, see [authentication][1].                               |
| `scope`        | `cache-to`,`cache-from` | String      | `buildkit`               | Which scope cache object belongs to, see [scope][2]                  |
| `mode`         | `cache-to`              | `min`,`max` | `min`                    | Cache layers to export, see [cache mode][3].                         |
| `ignore-error` | `cache-to`              | Boolean     | `false`                  | Ignore errors caused by failed cache exports.                        |
| `timeout`      | `cache-to`,`cache-from` | String      | `10m`                    | Max duration for importing or exporting cache before it's timed out. |
@y
| Name           | Option                  | Type        | Default                  | Description                                                          |
| -------------- | ----------------------- | ----------- | ------------------------ | -------------------------------------------------------------------- |
| `url`          | `cache-to`,`cache-from` | String      | `$ACTIONS_CACHE_URL`     | Cache server URL, see [authentication][1].                           |
| `token`        | `cache-to`,`cache-from` | String      | `$ACTIONS_RUNTIME_TOKEN` | Access token, see [authentication][1].                               |
| `scope`        | `cache-to`,`cache-from` | String      | `buildkit`               | Which scope cache object belongs to, see [scope][2]                  |
| `mode`         | `cache-to`              | `min`,`max` | `min`                    | Cache layers to export, see [cache mode][3].                         |
| `ignore-error` | `cache-to`              | Boolean     | `false`                  | Ignore errors caused by failed cache exports.                        |
| `timeout`      | `cache-to`,`cache-from` | String      | `10m`                    | Max duration for importing or exporting cache before it's timed out. |
@z

@x
[1]: #authentication
[2]: #scope
[3]: _index.md#cache-mode
@y
[1]: #authentication
[2]: #scope
[3]: _index.md#cache-mode
@z

@x
## Authentication
@y
## Authentication
@z

@x
If the `url` or `token` parameters are left unspecified, the `gha` cache backend
will fall back to using environment variables. If you invoke the `docker buildx`
command manually from an inline step, then the variables must be manually
exposed. Consider using the
[`crazy-max/ghaction-github-runtime`](https://github.com/crazy-max/ghaction-github-runtime),
GitHub Action as a helper for exposing the variables.
@y
If the `url` or `token` parameters are left unspecified, the `gha` cache backend
will fall back to using environment variables. If you invoke the `docker buildx`
command manually from an inline step, then the variables must be manually
exposed. Consider using the
[`crazy-max/ghaction-github-runtime`](https://github.com/crazy-max/ghaction-github-runtime),
GitHub Action as a helper for exposing the variables.
@z

@x
## Scope
@y
## Scope
@z

@x
Scope is a key used to identify the cache object. By default, it is set to
`buildkit`. If you build multiple images, each build will overwrite the cache
of the previous, leaving only the final cache.
@y
Scope is a key used to identify the cache object. By default, it is set to
`buildkit`. If you build multiple images, each build will overwrite the cache
of the previous, leaving only the final cache.
@z

@x
To preserve the cache for multiple builds, you can specify this scope attribute
with a specific name. In the following example, the cache is set to the image
name, to ensure each image gets its own cache:
@y
To preserve the cache for multiple builds, you can specify this scope attribute
with a specific name. In the following example, the cache is set to the image
name, to ensure each image gets its own cache:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=gha,url=...,token=...,scope=image \
  --cache-from type=gha,url=...,token=...,scope=image .
$ docker buildx build --push -t <registry>/<image2> \
  --cache-to type=gha,url=...,token=...,scope=image2 \
  --cache-from type=gha,url=...,token=...,scope=image2 .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=gha,url=...,token=...,scope=image \
  --cache-from type=gha,url=...,token=...,scope=image .
$ docker buildx build --push -t <registry>/<image2> \
  --cache-to type=gha,url=...,token=...,scope=image2 \
  --cache-from type=gha,url=...,token=...,scope=image2 .
```
@z

@x
GitHub's [cache access restrictions](https://docs.github.com/en/actions/advanced-guides/caching-dependencies-to-speed-up-workflows#restrictions-for-accessing-a-cache),
still apply. Only the cache for the current branch, the base branch and the
default branch is accessible by a workflow.
@y
GitHub's [cache access restrictions](https://docs.github.com/en/actions/advanced-guides/caching-dependencies-to-speed-up-workflows#restrictions-for-accessing-a-cache),
still apply. Only the cache for the current branch, the base branch and the
default branch is accessible by a workflow.
@z

@x
### Using `docker/build-push-action`
@y
### Using `docker/build-push-action`
@z

@x
When using the
[`docker/build-push-action`](https://github.com/docker/build-push-action), the
`url` and `token` parameters are automatically populated. No need to manually
specify them, or include any additional workarounds.
@y
When using the
[`docker/build-push-action`](https://github.com/docker/build-push-action), the
`url` and `token` parameters are automatically populated. No need to manually
specify them, or include any additional workarounds.
@z

@x
For example:
@y
For example:
@z

@x
```yaml
- name: Build and push
  uses: docker/build-push-action@v5
  with:
    context: .
    push: true
    tags: "<registry>/<image>:latest"
    cache-from: type=gha
    cache-to: type=gha,mode=max
```
@y
```yaml
- name: Build and push
  uses: docker/build-push-action@v5
  with:
    context: .
    push: true
    tags: "<registry>/<image>:latest"
    cache-from: type=gha
    cache-to: type=gha,mode=max
```
@z

@x
## Further reading
@y
## Further reading
@z

@x
For an introduction to caching see [Docker build cache](../_index.md).
@y
For an introduction to caching see [Docker build cache](../_index.md).
@z

@x
For more information on the `gha` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#github-actions-cache-experimental).
@y
For more information on the `gha` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#github-actions-cache-experimental).
@z

@x
For more information about using GitHub Actions with Docker, see
[Introduction to GitHub Actions](../../ci/github-actions/_index.md)
@y
For more information about using GitHub Actions with Docker, see
[Introduction to GitHub Actions](../../ci/github-actions/_index.md)
@z
