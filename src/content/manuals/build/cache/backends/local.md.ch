%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Local cache
description: Manage build cache with Amazon S3 buckets
keywords: build, buildx, cache, backend, local
@y
title: Local cache
description: Manage build cache with Amazon S3 buckets
keywords: build, buildx, cache, backend, local
@z

@x
The `local` cache store is a simple cache option that stores your cache as files
in a directory on your filesystem, using an
[OCI image layout](https://github.com/opencontainers/image-spec/blob/main/image-layout.md)
for the underlying directory structure. Local cache is a good choice if you're
just testing, or if you want the flexibility to self-manage a shared storage
solution.
@y
The `local` cache store is a simple cache option that stores your cache as files
in a directory on your filesystem, using an
[OCI image layout](https://github.com/opencontainers/image-spec/blob/main/image-layout.md)
for the underlying directory structure. Local cache is a good choice if you're
just testing, or if you want the flexibility to self-manage a shared storage
solution.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=local,dest=path/to/local/dir[,parameters...] \
  --cache-from type=local,src=path/to/local/dir .
```
@y
```console
$ docker buildx build --push -t <registry>/<image> \
  --cache-to type=local,dest=path/to/local/dir[,parameters...] \
  --cache-from type=local,src=path/to/local/dir .
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
| Name                | Option       | Type                    | Default | Description                                                                                                                     |
|---------------------|--------------|-------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------|
| `src`               | `cache-from` | String                  |         | Path of the local directory where cache gets imported from.                                                                     |
| `digest`            | `cache-from` | String                  |         | Digest of manifest to import, see [cache versioning][4].                                                                        |
| `tag`               | `cache-to`,`cache-from` | String                  | `latest` | Tag of the cache manifest, see [cache versioning][4].                                                                          |
| `dest`              | `cache-to`   | String                  |         | Path of the local directory where cache gets exported to.                                                                       |
| `mode`              | `cache-to`   | `min`,`max`             | `min`   | Cache layers to export, see [cache mode][1].                                                                                    |
| `oci-mediatypes`    | `cache-to`   | `true`,`false`          | `true`  | Use OCI media types in exported manifests, see [OCI media types][2].                                                            |
| `image-manifest`    | `cache-to`   | `true`,`false`          | `true`  | When using OCI media types, generate an image manifest instead of an image index for the cache image, see [OCI media types][2]. |
| `compression`       | `cache-to`   | `gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [cache compression][3].                                                                                   |
| `compression-level` | `cache-to`   | `0..22`                 |         | Compression level, see [cache compression][3].                                                                                  |
| `force-compression` | `cache-to`   | `true`,`false`          | `false` | Forcibly apply compression, see [cache compression][3].                                                                         |
| `ignore-error`      | `cache-to`   | Boolean                 | `false` | Ignore errors caused by failed cache exports.                                                                                   |
| `reset`             | `cache-to`   | `true`,`false`          | `false` | Delete blobs that no tag references, see [cache versioning][4].                                                                 |
@y
| Name                | Option       | Type                    | Default | Description                                                                                                                     |
|---------------------|--------------|-------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------|
| `src`               | `cache-from` | String                  |         | Path of the local directory where cache gets imported from.                                                                     |
| `digest`            | `cache-from` | String                  |         | Digest of manifest to import, see [cache versioning][4].                                                                        |
| `tag`               | `cache-to`,`cache-from` | String                  | `latest` | Tag of the cache manifest, see [cache versioning][4].                                                                          |
| `dest`              | `cache-to`   | String                  |         | Path of the local directory where cache gets exported to.                                                                       |
| `mode`              | `cache-to`   | `min`,`max`             | `min`   | Cache layers to export, see [cache mode][1].                                                                                    |
| `oci-mediatypes`    | `cache-to`   | `true`,`false`          | `true`  | Use OCI media types in exported manifests, see [OCI media types][2].                                                            |
| `image-manifest`    | `cache-to`   | `true`,`false`          | `true`  | When using OCI media types, generate an image manifest instead of an image index for the cache image, see [OCI media types][2]. |
| `compression`       | `cache-to`   | `gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [cache compression][3].                                                                                   |
| `compression-level` | `cache-to`   | `0..22`                 |         | Compression level, see [cache compression][3].                                                                                  |
| `force-compression` | `cache-to`   | `true`,`false`          | `false` | Forcibly apply compression, see [cache compression][3].                                                                         |
| `ignore-error`      | `cache-to`   | Boolean                 | `false` | Ignore errors caused by failed cache exports.                                                                                   |
| `reset`             | `cache-to`   | `true`,`false`          | `false` | Delete blobs that no tag references, see [cache versioning][4].                                                                 |
@z

@x
[1]: _index.md#cache-mode
[2]: _index.md#oci-media-types
[3]: _index.md#cache-compression
[4]: #cache-versioning
@y
[1]: _index.md#cache-mode
[2]: _index.md#oci-media-types
[3]: _index.md#cache-compression
[4]: #cache-versioning
@z

@x
If the `src` cache doesn't exist, then the cache import step will fail, but the
build continues.
@y
If the `src` cache doesn't exist, then the cache import step will fail, but the
build continues.
@z

@x
## Cache versioning
@y
## Cache versioning
@z

@x
A local cache directory uses an OCI image layout. Its `index.json` file
associates tags with cache manifests, while the `blobs` directory stores the
manifest and cache data.
@y
A local cache directory uses an OCI image layout. Its `index.json` file
associates tags with cache manifests, while the `blobs` directory stores the
manifest and cache data.
@z

@x
By default, BuildKit exports and imports the cache tagged `latest`. Use
different tags to keep multiple caches in the same directory:
@y
By default, BuildKit exports and imports the cache tagged `latest`. Use
different tags to keep multiple caches in the same directory:
@z

@x
```console
$ docker buildx build --cache-to type=local,dest=path/to/local/dir,tag=v1 .
$ docker buildx build --cache-to type=local,dest=path/to/local/dir,tag=v2 .
```
@y
```console
$ docker buildx build --cache-to type=local,dest=path/to/local/dir,tag=v1 .
$ docker buildx build --cache-to type=local,dest=path/to/local/dir,tag=v2 .
```
@z

@x
Exporting another cache with the same tag updates that tag to reference the new
manifest. Manifests referenced by other tags remain unchanged.
@y
Exporting another cache with the same tag updates that tag to reference the new
manifest. Manifests referenced by other tags remain unchanged.
@z

@x
Import a cache by specifying its tag:
@y
Import a cache by specifying its tag:
@z

@x
```console
$ docker buildx build --cache-from type=local,src=path/to/local/dir,tag=v1 .
```
@y
```console
$ docker buildx build --cache-from type=local,src=path/to/local/dir,tag=v1 .
```
@z

@x
A digest identifies an exact cache manifest. BuildKit reports the digest of
each exported manifest in the build output. Use `digest` instead of `tag` when
you need a specific manifest:
@y
A digest identifies an exact cache manifest. BuildKit reports the digest of
each exported manifest in the build output. Use `digest` instead of `tag` when
you need a specific manifest:
@z

@x
```console
$ docker buildx build \
  --cache-from type=local,src=path/to/local/dir,digest=sha256:<DIGEST> .
```
@y
```console
$ docker buildx build \
  --cache-from type=local,src=path/to/local/dir,digest=sha256:<DIGEST> .
```
@z

@x
If you specify both `digest` and `tag`, BuildKit uses `digest`.
@y
If you specify both `digest` and `tag`, BuildKit uses `digest`.
@z

@x
By default, updating a tag doesn't delete the blobs used by its previous
manifest. The previous manifest remains available by digest, so the local cache
directory grows over time.
@y
By default, updating a tag doesn't delete the blobs used by its previous
manifest. The previous manifest remains available by digest, so the local cache
directory grows over time.
@z

@x
Buildx version 0.35.0 and later supports `reset=true` on export, which deletes
blobs that no tag references:
@y
Buildx version 0.35.0 and later supports `reset=true` on export, which deletes
blobs that no tag references:
@z

@x
```console
$ docker buildx build --cache-to type=local,dest=path/to/local/dir,reset=true .
```
@y
```console
$ docker buildx build --cache-to type=local,dest=path/to/local/dir,reset=true .
```
@z

@x
Blobs that other tags reference are kept. Manifests that no tag references are
deleted, so you can no longer import them by digest.
@y
Blobs that other tags reference are kept. Manifests that no tag references are
deleted, so you can no longer import them by digest.
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
For more information on the `local` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#local-directory-1).
@y
For more information on the `local` cache backend, see the
[BuildKit README](https://github.com/moby/buildkit#local-directory-1).
@z
