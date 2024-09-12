%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Registry cache
description: Manage build cache with an OCI registry
keywords: build, buildx, cache, backend, registry
@y
title: Registry cache
description: Manage build cache with an OCI registry
keywords: build, buildx, cache, backend, registry
@z

@x
The `registry` cache storage can be thought of as an extension to the `inline`
cache. Unlike the `inline` cache, the `registry` cache is entirely separate from
the image, which allows for more flexible usage - `registry`-backed cache can do
everything that the inline cache can do, and more:
@y
The `registry` cache storage can be thought of as an extension to the `inline`
cache. Unlike the `inline` cache, the `registry` cache is entirely separate from
the image, which allows for more flexible usage - `registry`-backed cache can do
everything that the inline cache can do, and more:
@z

@x
- Allows for separating the cache and resulting image artifacts so that you can
  distribute your final image without the cache inside.
- It can efficiently cache multi-stage builds in `max` mode, instead of only the
  final stage.
- It works with other exporters for more flexibility, instead of only the
  `image` exporter.
@y
- Allows for separating the cache and resulting image artifacts so that you can
  distribute your final image without the cache inside.
- It can efficiently cache multi-stage builds in `max` mode, instead of only the
  final stage.
- It works with other exporters for more flexibility, instead of only the
  `image` exporter.
@z

@x
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](/manuals/build/builders/drivers/_index.md) for more information.
@y
This cache storage backend is not supported with the default `docker` driver.
To use this feature, create a new builder using a different driver. See
[Build drivers](manuals/build/builders/drivers/_index.md) for more information.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Unlike the simpler `inline` cache, the `registry` cache supports several
configuration parameters:
@y
Unlike the simpler `inline` cache, the `registry` cache supports several
configuration parameters:
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>[,parameters...] \
  --cache-from type=registry,ref=<registry>/<cache-image> .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=registry,ref=<registry>/<cache-image>[,parameters...] \
  --cache-from type=registry,ref=<registry>/<cache-image> .
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
| Name                | Option                  | Type                    | Default | Description                                                                                                                     |
| ------------------- | ----------------------- | ----------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `ref`               | `cache-to`,`cache-from` | String                  |         | Full name of the cache image to import.                                                                                         |
| `mode`              | `cache-to`              | `min`,`max`             | `min`   | Cache layers to export, see [cache mode][1].                                                                                    |
| `oci-mediatypes`    | `cache-to`              | `true`,`false`          | `true`  | Use OCI media types in exported manifests, see [OCI media types][2].                                                            |
| `image-manifest`    | `cache-to`              | `true`,`false`          | `false` | When using OCI media types, generate an image manifest instead of an image index for the cache image, see [OCI media types][2]. |
| `compression`       | `cache-to`              | `gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [cache compression][3].                                                                                   |
| `compression-level` | `cache-to`              | `0..22`                 |         | Compression level, see [cache compression][3].                                                                                  |
| `force-compression` | `cache-to`              | `true`,`false`          | `false` | Forcibly apply compression, see [cache compression][3].                                                                         |
| `ignore-error`      | `cache-to`              | Boolean                 | `false` | Ignore errors caused by failed cache exports.                                                                                   |
@y
| Name                | Option                  | Type                    | Default | Description                                                                                                                     |
| ------------------- | ----------------------- | ----------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `ref`               | `cache-to`,`cache-from` | String                  |         | Full name of the cache image to import.                                                                                         |
| `mode`              | `cache-to`              | `min`,`max`             | `min`   | Cache layers to export, see [cache mode][1].                                                                                    |
| `oci-mediatypes`    | `cache-to`              | `true`,`false`          | `true`  | Use OCI media types in exported manifests, see [OCI media types][2].                                                            |
| `image-manifest`    | `cache-to`              | `true`,`false`          | `false` | When using OCI media types, generate an image manifest instead of an image index for the cache image, see [OCI media types][2]. |
| `compression`       | `cache-to`              | `gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [cache compression][3].                                                                                   |
| `compression-level` | `cache-to`              | `0..22`                 |         | Compression level, see [cache compression][3].                                                                                  |
| `force-compression` | `cache-to`              | `true`,`false`          | `false` | Forcibly apply compression, see [cache compression][3].                                                                         |
| `ignore-error`      | `cache-to`              | Boolean                 | `false` | Ignore errors caused by failed cache exports.                                                                                   |
@z

@x
[1]: _index.md#cache-mode
[2]: _index.md#oci-media-types
[3]: _index.md#cache-compression
@y
[1]: _index.md#cache-mode
[2]: _index.md#oci-media-types
[3]: _index.md#cache-compression
@z

@x
You can choose any valid value for `ref`, as long as it's not the same as the
target location that you push your image to. You might choose different tags
(e.g. `foo/bar:latest` and `foo/bar:build-cache`), separate image names (e.g.
`foo/bar` and `foo/bar-cache`), or even different repositories (e.g.
`docker.io/foo/bar` and `ghcr.io/foo/bar`). It's up to you to decide the
strategy that you want to use for separating your image from your cache images.
@y
You can choose any valid value for `ref`, as long as it's not the same as the
target location that you push your image to. You might choose different tags
(e.g. `foo/bar:latest` and `foo/bar:build-cache`), separate image names (e.g.
`foo/bar` and `foo/bar-cache`), or even different repositories (e.g.
`docker.io/foo/bar` and `ghcr.io/foo/bar`). It's up to you to decide the
strategy that you want to use for separating your image from your cache images.
@z

@x
If the `--cache-from` target doesn't exist, then the cache import step will
fail, but the build continues.
@y
If the `--cache-from` target doesn't exist, then the cache import step will
fail, but the build continues.
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
For more information on the `registry` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#registry-push-image-and-cache-separately).
@y
For more information on the `registry` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#registry-push-image-and-cache-separately).
@z
