%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: OCI and Docker exporters
keywords: build, buildx, buildkit, exporter, oci, docker
description: >
  The OCI and Docker exporters create an image layout tarball on the local filesystem
@y
title: OCI and Docker exporters
keywords: build, buildx, buildkit, exporter, oci, docker
description: >
  The OCI and Docker exporters create an image layout tarball on the local filesystem
@z

@x
The `oci` exporter outputs the build result into an
[OCI image layout](https://github.com/opencontainers/image-spec/blob/main/image-layout.md)
tarball. The `docker` exporter behaves the same way, except it exports a Docker
image layout instead.
@y
The `oci` exporter outputs the build result into an
[OCI image layout](https://github.com/opencontainers/image-spec/blob/main/image-layout.md)
tarball. The `docker` exporter behaves the same way, except it exports a Docker
image layout instead.
@z

@x
The [`docker` driver](/build/builders/drivers/docker.md) doesn't support these exporters. You
must use `docker-container` or some other driver if you want to generate these
outputs.
@y
The [`docker` driver](build/builders/drivers/docker.md) doesn't support these exporters. You
must use `docker-container` or some other driver if you want to generate these
outputs.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Build a container image using the `oci` and `docker` exporters:
@y
Build a container image using the `oci` and `docker` exporters:
@z

@x
```console
$ docker buildx build --output type=oci[,parameters] .
```
@y
```console
$ docker buildx build --output type=oci[,parameters] .
```
@z

@x
```console
$ docker buildx build --output type=docker[,parameters] .
```
@y
```console
$ docker buildx build --output type=docker[,parameters] .
```
@z

@x
The following table describes the available parameters:
@y
The following table describes the available parameters:
@z

@x
| Parameter           | Type                                   | Default | Description                                                                                                                           |
| ------------------- | -------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `name`              | String                                 |         | Specify image name(s)                                                                                                                 |
| `dest`              | String                                 |         | Path                                                                                                                                  |
| `tar`               | `true`,`false`                         | `true`  | Bundle the output into a tarball layout                                                                                               |
| `compression`       | `uncompressed`,`gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [compression][1]                                                                                                |
| `compression-level` | `0..22`                                |         | Compression level, see [compression][1]                                                                                               |
| `force-compression` | `true`,`false`                         | `false` | Forcefully apply compression, see [compression][1]                                                                                    |
| `oci-mediatypes`    | `true`,`false`                         |         | Use OCI media types in exporter manifests. Defaults to `true` for `type=oci`, and `false` for `type=docker`. See [OCI Media types][2] |
| `annotation.<key>`  | String                                 |         | Attach an annotation with the respective `key` and `value` to the built image,see [annotations][3]                                    |
@y
| Parameter           | Type                                   | Default | Description                                                                                                                           |
| ------------------- | -------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `name`              | String                                 |         | Specify image name(s)                                                                                                                 |
| `dest`              | String                                 |         | Path                                                                                                                                  |
| `tar`               | `true`,`false`                         | `true`  | Bundle the output into a tarball layout                                                                                               |
| `compression`       | `uncompressed`,`gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [compression][1]                                                                                                |
| `compression-level` | `0..22`                                |         | Compression level, see [compression][1]                                                                                               |
| `force-compression` | `true`,`false`                         | `false` | Forcefully apply compression, see [compression][1]                                                                                    |
| `oci-mediatypes`    | `true`,`false`                         |         | Use OCI media types in exporter manifests. Defaults to `true` for `type=oci`, and `false` for `type=docker`. See [OCI Media types][2] |
| `annotation.<key>`  | String                                 |         | Attach an annotation with the respective `key` and `value` to the built image,see [annotations][3]                                    |
@z

@x
[1]: _index.md#compression
[2]: _index.md#oci-media-types
[3]: #annotations
@y
[1]: _index.md#compression
[2]: _index.md#oci-media-types
[3]: #annotations
@z

@x
## Annotations
@y
## Annotations
@z

@x
These exporters support adding OCI annotation using `annotation` parameter,
followed by the annotation name using dot notation. The following example sets
the `org.opencontainers.image.title` annotation:
@y
These exporters support adding OCI annotation using `annotation` parameter,
followed by the annotation name using dot notation. The following example sets
the `org.opencontainers.image.title` annotation:
@z

@x
```console
$ docker buildx build \
    --output "type=<type>,name=<registry>/<image>,annotation.org.opencontainers.image.title=<title>" .
```
@y
```console
$ docker buildx build \
    --output "type=<type>,name=<registry>/<image>,annotation.org.opencontainers.image.title=<title>" .
```
@z

@x
For more information about annotations, see
[BuildKit documentation](https://github.com/moby/buildkit/blob/master/docs/annotations.md).
@y
For more information about annotations, see
[BuildKit documentation](https://github.com/moby/buildkit/blob/master/docs/annotations.md).
@z

@x
## Further reading
@y
## Further reading
@z

@x
For more information on the `oci` or `docker` exporters, see the
[BuildKit README](https://github.com/moby/buildkit/blob/master/README.md#docker-tarball).
@y
For more information on the `oci` or `docker` exporters, see the
[BuildKit README](https://github.com/moby/buildkit/blob/master/README.md#docker-tarball).
@z
