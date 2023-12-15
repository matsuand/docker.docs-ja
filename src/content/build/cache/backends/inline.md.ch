%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Inline cache
description: Embed the build cache into the image
keywords: build, buildx, cache, backend, inline
aliases:
  - /build/building/cache/backends/inline/
---
@y
---
title: Inline cache
description: Embed the build cache into the image
keywords: build, buildx, cache, backend, inline
aliases:
  - /build/building/cache/backends/inline/
---
@z

@x
The `inline` cache storage backend is the simplest way to get an external cache
and is easy to get started using if you're already building and pushing an
image.
@y
The `inline` cache storage backend is the simplest way to get an external cache
and is easy to get started using if you're already building and pushing an
image.
@z

@x
The downside of inline cache is that it doesn't scale with multi-stage builds
as well as the other drivers do. It also doesn't offer separation between your
output artifacts and your cache output. This means that if you're using a
particularly complex build flow, or not exporting your images directly to a
registry, then you may want to consider the [registry](./registry.md) cache.
@y
The downside of inline cache is that it doesn't scale with multi-stage builds
as well as the other drivers do. It also doesn't offer separation between your
output artifacts and your cache output. This means that if you're using a
particularly complex build flow, or not exporting your images directly to a
registry, then you may want to consider the [registry](./registry.md) cache.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=inline \
  --cache-from type=registry,ref=<registry>/<image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=inline \
  --cache-from type=registry,ref=<registry>/<image> .
```
@z

@x
No additional parameters are supported for the `inline` cache.
@y
No additional parameters are supported for the `inline` cache.
@z

@x
To export cache using `inline` storage, pass `type=inline` to the `--cache-to`
option:
@y
To export cache using `inline` storage, pass `type=inline` to the `--cache-to`
option:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=inline .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=inline .
```
@z

@x
Alternatively, you can also export inline cache by setting the build argument
`BUILDKIT_INLINE_CACHE=1`, instead of using the `--cache-to` flag:
@y
Alternatively, you can also export inline cache by setting the build argument
`BUILDKIT_INLINE_CACHE=1`, instead of using the `--cache-to` flag:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --build-arg BUILDKIT_INLINE_CACHE=1 .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --build-arg BUILDKIT_INLINE_CACHE=1 .
```
@z

@x
To import the resulting cache on a future build, pass `type=registry` to
`--cache-from` which lets you extract the cache from inside a Docker image in
the specified registry:
@y
To import the resulting cache on a future build, pass `type=registry` to
`--cache-from` which lets you extract the cache from inside a Docker image in
the specified registry:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-from type=registry,ref=<registry>/<image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-from type=registry,ref=<registry>/<image> .
```
@z

@x
## Further reading
@y
## Further reading
@z

@x
For an introduction to caching see [Optimizing builds with cache](../index.md).
@y
For an introduction to caching see [Optimizing builds with cache](../index.md).
@z

@x
For more information on the `inline` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#inline-push-image-and-cache-together).
@y
For more information on the `inline` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#inline-push-image-and-cache-together).
@z
