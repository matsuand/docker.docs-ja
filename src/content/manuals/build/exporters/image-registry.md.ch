%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Image and registry exporters
description: |
  The image and registry exporters create an image that can be loaded to your
  local image store or pushed to a registry
keywords: build, buildx, buildkit, exporter, image, registry
@y
title: Image and registry exporters
description: |
  The image and registry exporters create an image that can be loaded to your
  local image store or pushed to a registry
keywords: build, buildx, buildkit, exporter, image, registry
@z

@x
The `image` exporter outputs the build result into a container image format. The
`registry` exporter is identical, but it automatically pushes the result by
setting `push=true`.
@y
The `image` exporter outputs the build result into a container image format. The
`registry` exporter is identical, but it automatically pushes the result by
setting `push=true`.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Build a container image using the `image` and `registry` exporters:
@y
Build a container image using the `image` and `registry` exporters:
@z

@x
```console
$ docker buildx build --output type=image[,parameters] .
$ docker buildx build --output type=registry[,parameters] .
```
@y
```console
$ docker buildx build --output type=image[,parameters] .
$ docker buildx build --output type=registry[,parameters] .
```
@z

@x
The following table describes the available parameters that you can pass to
`--output` for `type=image`:
@y
The following table describes the available parameters that you can pass to
`--output` for `type=image`:
@z

@x
| Parameter              | Type                                   | Default | Description                                                                                                                                                                                                                         |
| ---------------------- | -------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                 | String                                 |         | Specify image name(s)                                                                                                                                                                                                               |
| `push`                 | `true`,`false`                         | `false` | Push after creating the image.                                                                                                                                                                                                      |
| `push-by-digest`       | `true`,`false`                         | `false` | Push image without name.                                                                                                                                                                                                            |
| `registry.insecure`    | `true`,`false`                         | `false` | Allow pushing to insecure registry.                                                                                                                                                                                                 |
| `dangling-name-prefix` | `<value>`                              |         | Name image with `prefix@<digest>`, used for anonymous images                                                                                                                                                                        |
| `name-canonical`       | `true`,`false`                         |         | Add additional canonical name `name@<digest>`                                                                                                                                                                                       |
| `compression`          | `uncompressed`,`gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [compression][1]                                                                                                                                                                                              |
| `compression-level`    | `0..22`                                |         | Compression level, see [compression][1]                                                                                                                                                                                             |
| `force-compression`    | `true`,`false`                         | `false` | Forcefully apply compression, see [compression][1]                                                                                                                                                                                  |
| `rewrite-timestamp`    | `true`,`false`                         | `false` | Rewrite the file timestamps to the `SOURCE_DATE_EPOCH` value. See [build reproducibility][4] for how to specify the `SOURCE_DATE_EPOCH` value.                                                                                      |
| `oci-mediatypes`       | `true`,`false`                         | `false` | Use OCI media types in exporter manifests, see [OCI Media types][2]                                                                                                                                                                 |
| `oci-artifact`         | `true`,`false`                         | `false` | Attestations are formatted as OCI artifacts, see [OCI Media types][2]                                                                                                                                                               |
| `unpack`               | `true`,`false`                         | `false` | Unpack image after creation (for use with containerd)                                                                                                                                                                               |
| `store`                | `true`,`false`                         | `true`  | Store the result images to the worker's (for example, containerd) image store, and ensures that the image has all blobs in the content store. Ignored if the worker doesn't have image store (when using OCI workers, for example). |
| `annotation.<key>`     | String                                 |         | Attach an annotation with the respective `key` and `value` to the built image,see [annotations][3]                                                                                                                                  |
@y
| Parameter              | Type                                   | Default | Description                                                                                                                                                                                                                         |
| ---------------------- | -------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                 | String                                 |         | Specify image name(s)                                                                                                                                                                                                               |
| `push`                 | `true`,`false`                         | `false` | Push after creating the image.                                                                                                                                                                                                      |
| `push-by-digest`       | `true`,`false`                         | `false` | Push image without name.                                                                                                                                                                                                            |
| `registry.insecure`    | `true`,`false`                         | `false` | Allow pushing to insecure registry.                                                                                                                                                                                                 |
| `dangling-name-prefix` | `<value>`                              |         | Name image with `prefix@<digest>`, used for anonymous images                                                                                                                                                                        |
| `name-canonical`       | `true`,`false`                         |         | Add additional canonical name `name@<digest>`                                                                                                                                                                                       |
| `compression`          | `uncompressed`,`gzip`,`estargz`,`zstd` | `gzip`  | Compression type, see [compression][1]                                                                                                                                                                                              |
| `compression-level`    | `0..22`                                |         | Compression level, see [compression][1]                                                                                                                                                                                             |
| `force-compression`    | `true`,`false`                         | `false` | Forcefully apply compression, see [compression][1]                                                                                                                                                                                  |
| `rewrite-timestamp`    | `true`,`false`                         | `false` | Rewrite the file timestamps to the `SOURCE_DATE_EPOCH` value. See [build reproducibility][4] for how to specify the `SOURCE_DATE_EPOCH` value.                                                                                      |
| `oci-mediatypes`       | `true`,`false`                         | `false` | Use OCI media types in exporter manifests, see [OCI Media types][2]                                                                                                                                                                 |
| `oci-artifact`         | `true`,`false`                         | `false` | Attestations are formatted as OCI artifacts, see [OCI Media types][2]                                                                                                                                                               |
| `unpack`               | `true`,`false`                         | `false` | Unpack image after creation (for use with containerd)                                                                                                                                                                               |
| `store`                | `true`,`false`                         | `true`  | Store the result images to the worker's (for example, containerd) image store, and ensures that the image has all blobs in the content store. Ignored if the worker doesn't have image store (when using OCI workers, for example). |
| `annotation.<key>`     | String                                 |         | Attach an annotation with the respective `key` and `value` to the built image,see [annotations][3]                                                                                                                                  |
@z

@x
[1]: _index.md#compression
[2]: _index.md#oci-media-types
[3]: #annotations
[4]: https://github.com/moby/buildkit/blob/master/docs/build-repro.md
@y
[1]: _index.md#compression
[2]: _index.md#oci-media-types
[3]: #annotations
[4]: https://github.com/moby/buildkit/blob/master/docs/build-repro.md
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
For more information on the `image` or `registry` exporters, see the
[BuildKit README](https://github.com/moby/buildkit/blob/master/README.md#imageregistry).
@y
For more information on the `image` or `registry` exporters, see the
[BuildKit README](https://github.com/moby/buildkit/blob/master/README.md#imageregistry).
@z
