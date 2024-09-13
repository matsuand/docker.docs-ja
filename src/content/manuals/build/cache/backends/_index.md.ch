%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Cache storage backends
description: |
  Cache backends let you manage your build cache externally.
  External cache is useful to create a shared cache that can help
  speed up inner loop and CI builds.
keywords: build, buildx, cache, backend, gha, azblob, s3, registry, local
@y
title: Cache storage backends
description: |
  Cache backends let you manage your build cache externally.
  External cache is useful to create a shared cache that can help
  speed up inner loop and CI builds.
keywords: build, buildx, cache, backend, gha, azblob, s3, registry, local
@z

@x
To ensure fast builds, BuildKit automatically caches the build result in its own
internal cache. Additionally, BuildKit also supports exporting build cache to an
external location, making it possible to import in future builds.
@y
To ensure fast builds, BuildKit automatically caches the build result in its own
internal cache. Additionally, BuildKit also supports exporting build cache to an
external location, making it possible to import in future builds.
@z

@x
An external cache becomes almost essential in CI/CD build environments. Such
environments usually have little-to-no persistence between runs, but it's still
important to keep the runtime of image builds as low as possible.
@y
An external cache becomes almost essential in CI/CD build environments. Such
environments usually have little-to-no persistence between runs, but it's still
important to keep the runtime of image builds as low as possible.
@z

@x
The default `docker` driver supports the `inline`, `local`, `registry`, and
`gha` cache backends, but only if you have enabled the [containerd image store](/manuals/desktop/containerd.md).
Other cache backends require you to select a different [driver](/manuals/build/builders/drivers/_index.md).
@y
The default `docker` driver supports the `inline`, `local`, `registry`, and
`gha` cache backends, but only if you have enabled the [containerd image store](manuals/desktop/containerd.md).
Other cache backends require you to select a different [driver](manuals/build/builders/drivers/_index.md).
@z

@x
> [!WARNING]
>
> If you use secrets or credentials inside your build process, ensure you
> manipulate them using the dedicated
> [`--secret` option](/reference/cli/docker/buildx/build.md#secret).
> Manually managing secrets using `COPY` or `ARG` could result in leaked
> credentials.
@y
> [!WARNING]
>
> If you use secrets or credentials inside your build process, ensure you
> manipulate them using the dedicated
> [`--secret` option](reference/cli/docker/buildx/build.md#secret).
> Manually managing secrets using `COPY` or `ARG` could result in leaked
> credentials.
@z

@x
## Backends
@y
## Backends
@z

@x
Buildx supports the following cache storage backends:
@y
Buildx supports the following cache storage backends:
@z

@x
- `inline`: embeds the build cache into the image.
@y
- `inline`: embeds the build cache into the image.
@z

@x
  The inline cache gets pushed to the same location as the main output result.
  This only works with the [`image` exporter](../../exporters/image-registry.md).
@y
  The inline cache gets pushed to the same location as the main output result.
  This only works with the [`image` exporter](../../exporters/image-registry.md).
@z

@x
- `registry`: embeds the build cache into a separate image, and pushes to a
  dedicated location separate from the main output.
@y
- `registry`: embeds the build cache into a separate image, and pushes to a
  dedicated location separate from the main output.
@z

@x
- `local`: writes the build cache to a local directory on the filesystem.
@y
- `local`: writes the build cache to a local directory on the filesystem.
@z

@x
- `gha`: uploads the build cache to
  [GitHub Actions cache](https://docs.github.com/en/rest/actions/cache) (beta).
@y
- `gha`: uploads the build cache to
  [GitHub Actions cache](https://docs.github.com/en/rest/actions/cache) (beta).
@z

@x
- `s3`: uploads the build cache to an
  [AWS S3 bucket](https://aws.amazon.com/s3/) (unreleased).
@y
- `s3`: uploads the build cache to an
  [AWS S3 bucket](https://aws.amazon.com/s3/) (unreleased).
@z

@x
- `azblob`: uploads the build cache to
  [Azure Blob Storage](https://azure.microsoft.com/en-us/services/storage/blobs/)
  (unreleased).
@y
- `azblob`: uploads the build cache to
  [Azure Blob Storage](https://azure.microsoft.com/en-us/services/storage/blobs/)
  (unreleased).
@z

@x
## Command syntax
@y
## Command syntax
@z

@x
To use any of the cache backends, you first need to specify it on build with the
[`--cache-to` option](/reference/cli/docker/buildx/build.md#cache-to)
to export the cache to your storage backend of choice. Then, use the
[`--cache-from` option](/reference/cli/docker/buildx/build.md#cache-from)
to import the cache from the storage backend into the current build. Unlike the
local BuildKit cache (which is always enabled), all of the cache storage
backends must be explicitly exported to, and explicitly imported from.
@y
To use any of the cache backends, you first need to specify it on build with the
[`--cache-to` option](reference/cli/docker/buildx/build.md#cache-to)
to export the cache to your storage backend of choice. Then, use the
[`--cache-from` option](reference/cli/docker/buildx/build.md#cache-from)
to import the cache from the storage backend into the current build. Unlike the
local BuildKit cache (which is always enabled), all of the cache storage
backends must be explicitly exported to, and explicitly imported from.
@z

@x
Example `buildx` command using the `registry` backend, using import and export
cache:
@y
Example `buildx` command using the `registry` backend, using import and export
cache:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>[,parameters...] \
  --cache-from type=registry,ref=<registry>/<cache-image>[,parameters...] .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>[,parameters...] \
  --cache-from type=registry,ref=<registry>/<cache-image>[,parameters...] .
```
@z

@x
> [!WARNING]
>
> As a general rule, each cache writes to some location. No location can be
> written to twice, without overwriting the previously cached data. If you want
> to maintain multiple scoped caches (for example, a cache per Git branch), then
> ensure that you use different locations for exported cache.
@y
> [!WARNING]
>
> As a general rule, each cache writes to some location. No location can be
> written to twice, without overwriting the previously cached data. If you want
> to maintain multiple scoped caches (for example, a cache per Git branch), then
> ensure that you use different locations for exported cache.
@z

@x
## Multiple caches
@y
## Multiple caches
@z

@x
BuildKit currently only supports
[a single cache exporter](https://github.com/moby/buildkit/pull/3024). But you
can import from as many remote caches as you like. For example, a common pattern
is to use the cache of both the current branch and the main branch. The
following example shows importing cache from multiple locations using the
registry cache backend:
@y
BuildKit currently only supports
[a single cache exporter](https://github.com/moby/buildkit/pull/3024). But you
can import from as many remote caches as you like. For example, a common pattern
is to use the cache of both the current branch and the main branch. The
following example shows importing cache from multiple locations using the
registry cache backend:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>:<branch> \
  --cache-from type=registry,ref=<registry>/<cache-image>:<branch> \
  --cache-from type=registry,ref=<registry>/<cache-image>:main .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>:<branch> \
  --cache-from type=registry,ref=<registry>/<cache-image>:<branch> \
  --cache-from type=registry,ref=<registry>/<cache-image>:main .
```
@z

@x
## Configuration options
@y
## Configuration options
@z

@x
This section describes some configuration options available when generating
cache exports. The options described here are common for at least two or more
backend types. Additionally, the different backend types support specific
parameters as well. See the detailed page about each backend type for more
information about which configuration parameters apply.
@y
This section describes some configuration options available when generating
cache exports. The options described here are common for at least two or more
backend types. Additionally, the different backend types support specific
parameters as well. See the detailed page about each backend type for more
information about which configuration parameters apply.
@z

@x
The common parameters described here are:
@y
The common parameters described here are:
@z

@x
- [Cache mode](#cache-mode)
- [Cache compression](#cache-compression)
- [OCI media type](#oci-media-types)
@y
- [Cache mode](#cache-mode)
- [Cache compression](#cache-compression)
- [OCI media type](#oci-media-types)
@z

@x
### Cache mode
@y
### Cache mode
@z

@x
When generating a cache output, the `--cache-to` argument accepts a `mode`
option for defining which layers to include in the exported cache. This is
supported by all cache backends except for the `inline` cache.
@y
When generating a cache output, the `--cache-to` argument accepts a `mode`
option for defining which layers to include in the exported cache. This is
supported by all cache backends except for the `inline` cache.
@z

@x
Mode can be set to either of two options: `mode=min` or `mode=max`. For example,
to build the cache with `mode=max` with the registry backend:
@y
Mode can be set to either of two options: `mode=min` or `mode=max`. For example,
to build the cache with `mode=max` with the registry backend:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,mode=max \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,mode=max \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@z

@x
This option is only set when exporting a cache, using `--cache-to`. When
importing a cache (`--cache-from`) the relevant parameters are automatically
detected.
@y
This option is only set when exporting a cache, using `--cache-to`. When
importing a cache (`--cache-from`) the relevant parameters are automatically
detected.
@z

@x
In `min` cache mode (the default), only layers that are exported into the
resulting image are cached, while in `max` cache mode, all layers are cached,
even those of intermediate steps.
@y
In `min` cache mode (the default), only layers that are exported into the
resulting image are cached, while in `max` cache mode, all layers are cached,
even those of intermediate steps.
@z

@x
While `min` cache is typically smaller (which speeds up import/export times, and
reduces storage costs), `max` cache is more likely to get more cache hits.
Depending on the complexity and location of your build, you should experiment
with both parameters to find the results that work best for you.
@y
While `min` cache is typically smaller (which speeds up import/export times, and
reduces storage costs), `max` cache is more likely to get more cache hits.
Depending on the complexity and location of your build, you should experiment
with both parameters to find the results that work best for you.
@z

@x
### Cache compression
@y
### Cache compression
@z

@x
The cache compression options are the same as the
[exporter compression options](../../exporters/_index.md#compression). This is
supported by the `local` and `registry` cache backends.
@y
The cache compression options are the same as the
[exporter compression options](../../exporters/_index.md#compression). This is
supported by the `local` and `registry` cache backends.
@z

@x
For example, to compress the `registry` cache with `zstd` compression:
@y
For example, to compress the `registry` cache with `zstd` compression:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,compression=zstd \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,compression=zstd \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@z

@x
### OCI media types
@y
### OCI media types
@z

@x
The cache OCI options are the same as the
[exporter OCI options](../../exporters/_index.md#oci-media-types). These are
supported by the `local` and `registry` cache backends.
@y
The cache OCI options are the same as the
[exporter OCI options](../../exporters/_index.md#oci-media-types). These are
supported by the `local` and `registry` cache backends.
@z

@x
For example, to export OCI media type cache, use the `oci-mediatypes` property:
@y
For example, to export OCI media type cache, use the `oci-mediatypes` property:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,oci-mediatypes=true \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,oci-mediatypes=true \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@z

@x
This property is only meaningful with the `--cache-to` flag. When fetching
cache, BuildKit will auto-detect the correct media types to use.
@y
This property is only meaningful with the `--cache-to` flag. When fetching
cache, BuildKit will auto-detect the correct media types to use.
@z

@x
By default, the OCI media type generates an image index for the cache image.
Some OCI registries, such as Amazon ECR, don't support the image index media
type: `application/vnd.oci.image.index.v1+json`. If you export cache images to
ECR, or any other registry that doesn't support image indices, set the
`image-manifest` parameter to `true` to generate a single image manifest
instead of an image index for the cache image:
@y
By default, the OCI media type generates an image index for the cache image.
Some OCI registries, such as Amazon ECR, don't support the image index media
type: `application/vnd.oci.image.index.v1+json`. If you export cache images to
ECR, or any other registry that doesn't support image indices, set the
`image-manifest` parameter to `true` to generate a single image manifest
instead of an image index for the cache image:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,oci-mediatypes=true,image-manifest=true \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>,oci-mediatypes=true,image-manifest=true \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@z
