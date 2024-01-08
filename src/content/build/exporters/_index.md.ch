%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Exporters overview
description: Build exporters define the output format of your build result
keywords: build, buildx, buildkit, exporter, image, registry, local, tar, oci, docker, cacheonly
aliases:
  - /build/building/exporters/
---
@y
---
title: Exporters overview
description: Build exporters define the output format of your build result
keywords: build, buildx, buildkit, exporter, image, registry, local, tar, oci, docker, cacheonly
aliases:
  - /build/building/exporters/
---
@z

@x
Exporters save your build results to a specified output type. You specify the
exporter to use with the
[`--output` CLI option](../../engine/reference/commandline/buildx_build/#output).
Buildx supports the following exporters:
@y
Exporters save your build results to a specified output type. You specify the
exporter to use with the
[`--output` CLI option](../../engine/reference/commandline/buildx_build/#output).
Buildx supports the following exporters:
@z

@x
- `image`: exports the build result to a container image.
- `registry`: exports the build result into a container image, and pushes it to
  the specified registry.
- `local`: exports the build root filesystem into a local directory.
- `tar`: packs the build root filesystem into a local tarball.
- `oci`: exports the build result to the local filesystem in the
  [OCI image layout](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-layout.md)
  format.
- `docker`: exports the build result to the local filesystem in the
  [Docker Image Specification v1.2.0](https://github.com/moby/moby/blob/v24.0.0/image/spec/v1.2.md)
  format.
- `cacheonly`: doesn't export a build output, but runs the build and creates a
  cache.
@y
- `image`: exports the build result to a container image.
- `registry`: exports the build result into a container image, and pushes it to
  the specified registry.
- `local`: exports the build root filesystem into a local directory.
- `tar`: packs the build root filesystem into a local tarball.
- `oci`: exports the build result to the local filesystem in the
  [OCI image layout](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-layout.md)
  format.
- `docker`: exports the build result to the local filesystem in the
  [Docker Image Specification v1.2.0](https://github.com/moby/moby/blob/v24.0.0/image/spec/v1.2.md)
  format.
- `cacheonly`: doesn't export a build output, but runs the build and creates a
  cache.
@z

@x
## Using exporters
@y
## Using exporters
@z

@x
To specify an exporter, use the following command syntax:
@y
To specify an exporter, use the following command syntax:
@z

@x
```console
$ docker buildx build --tag <registry>/<image> \
  --output type=<TYPE> .
```
@y
```console
$ docker buildx build --tag <registry>/<image> \
  --output type=<TYPE> .
```
@z

@x
Most common use cases don't require that you specify which exporter to use
explicitly. You only need to specify the exporter if you intend to customize
the output, or if you want to save it to disk. The `--load` and `--push`
options allow Buildx to infer the exporter settings to use.
@y
Most common use cases don't require that you specify which exporter to use
explicitly. You only need to specify the exporter if you intend to customize
the output, or if you want to save it to disk. The `--load` and `--push`
options allow Buildx to infer the exporter settings to use.
@z

@x
For example, if you use the `--push` option in combination with `--tag`, Buildx
automatically uses the `image` exporter, and configures the exporter to push the
results to the specified registry.
@y
For example, if you use the `--push` option in combination with `--tag`, Buildx
automatically uses the `image` exporter, and configures the exporter to push the
results to the specified registry.
@z

@x
To get the full flexibility out of the various exporters BuildKit has to offer,
you use the `--output` flag that lets you configure exporter options.
@y
To get the full flexibility out of the various exporters BuildKit has to offer,
you use the `--output` flag that lets you configure exporter options.
@z

@x
## Use cases
@y
## Use cases
@z

@x
Each exporter type is designed for different use cases. The following sections
describe some common scenarios, and how you can use exporters to generate the
output that you need.
@y
Each exporter type is designed for different use cases. The following sections
describe some common scenarios, and how you can use exporters to generate the
output that you need.
@z

@x
### Load to image store
@y
### Load to image store
@z

@x
Buildx is often used to build container images that can be loaded to an image
store. That's where the `docker` exporter comes in. The following example shows
how to build an image using the `docker` exporter, and have that image loaded to
the local image store, using the `--output` option:
@y
Buildx is often used to build container images that can be loaded to an image
store. That's where the `docker` exporter comes in. The following example shows
how to build an image using the `docker` exporter, and have that image loaded to
the local image store, using the `--output` option:
@z

@x
```console
$ docker buildx build \
  --output type=docker,name=<registry>/<image> .
```
@y
```console
$ docker buildx build \
  --output type=docker,name=<registry>/<image> .
```
@z

@x
Buildx CLI will automatically use the `docker` exporter and load it to the image
store if you supply the `--tag` and `--load` options:
@y
Buildx CLI will automatically use the `docker` exporter and load it to the image
store if you supply the `--tag` and `--load` options:
@z

@x
```console
$ docker buildx build --tag <registry>/<image> --load .
```
@y
```console
$ docker buildx build --tag <registry>/<image> --load .
```
@z

@x
Building images using the `docker` driver are automatically loaded to the local
image store.
@y
Building images using the `docker` driver are automatically loaded to the local
image store.
@z

@x
Images loaded to the image store are available to `docker run` immediately
after the build finishes, and you'll see them in the list of images when you run
the `docker images` command.
@y
Images loaded to the image store are available to `docker run` immediately
after the build finishes, and you'll see them in the list of images when you run
the `docker images` command.
@z

@x
### Push to registry
@y
### Push to registry
@z

@x
To push a built image to a container registry, you can use the `registry` or
`image` exporters.
@y
To push a built image to a container registry, you can use the `registry` or
`image` exporters.
@z

@x
When you pass the `--push` option to the Buildx CLI, you instruct BuildKit to
push the built image to the specified registry:
@y
When you pass the `--push` option to the Buildx CLI, you instruct BuildKit to
push the built image to the specified registry:
@z

@x
```console
$ docker buildx build --tag <registry>/<image> --push .
```
@y
```console
$ docker buildx build --tag <registry>/<image> --push .
```
@z

@x
Under the hood, this uses the `image` exporter, and sets the `push` parameter.
It's the same as using the following long-form command using the `--output`
option:
@y
Under the hood, this uses the `image` exporter, and sets the `push` parameter.
It's the same as using the following long-form command using the `--output`
option:
@z

@x
```console
$ docker buildx build \
  --output type=image,name=<registry>/<image>,push=true .
```
@y
```console
$ docker buildx build \
  --output type=image,name=<registry>/<image>,push=true .
```
@z

@x
You can also use the `registry` exporter, which does the same thing:
@y
You can also use the `registry` exporter, which does the same thing:
@z

@x
```console
$ docker buildx build \
  --output type=registry,name=<registry>/<image> .
```
@y
```console
$ docker buildx build \
  --output type=registry,name=<registry>/<image> .
```
@z

@x
### Export image layout to file
@y
### Export image layout to file
@z

@x
You can use either the `oci` or `docker` exporters to save the build results to
image layout on your local filesystem. Both of these exporters generate a tar
archive file containing the corresponding image layout. The `dest` parameter
defines the target output path for the tarball.
@y
You can use either the `oci` or `docker` exporters to save the build results to
image layout on your local filesystem. Both of these exporters generate a tar
archive file containing the corresponding image layout. The `dest` parameter
defines the target output path for the tarball.
@z

@x
```console
$ docker buildx build --output type=oci,dest=./image.tar .
[+] Building 0.8s (7/7) FINISHED
 ...
 => exporting to oci image format                                                                     0.0s
 => exporting layers                                                                                  0.0s
 => exporting manifest sha256:c1ef01a0a0ef94a7064d5cbce408075730410060e253ff8525d1e5f7e27bc900        0.0s
 => exporting config sha256:eadab326c1866dd247efb52cb715ba742bd0f05b6a205439f107cf91b3abc853          0.0s
 => sending tarball                                                                                   0.0s
$ mkdir -p out && tar -C out -xf ./image.tar
$ tree out
out
├── blobs
│   └── sha256
│       ├── 9b18e9b68314027565b90ff6189d65942c0f7986da80df008b8431276885218e
│       ├── c78795f3c329dbbbfb14d0d32288dea25c3cd12f31bd0213be694332a70c7f13
│       ├── d1cf38078fa218d15715e2afcf71588ee482352d697532cf316626164699a0e2
│       ├── e84fa1df52d2abdfac52165755d5d1c7621d74eda8e12881f6b0d38a36e01775
│       └── fe9e23793a27fe30374308988283d40047628c73f91f577432a0d05ab0160de7
├── index.json
├── manifest.json
└── oci-layout
```
@y
```console
$ docker buildx build --output type=oci,dest=./image.tar .
[+] Building 0.8s (7/7) FINISHED
 ...
 => exporting to oci image format                                                                     0.0s
 => exporting layers                                                                                  0.0s
 => exporting manifest sha256:c1ef01a0a0ef94a7064d5cbce408075730410060e253ff8525d1e5f7e27bc900        0.0s
 => exporting config sha256:eadab326c1866dd247efb52cb715ba742bd0f05b6a205439f107cf91b3abc853          0.0s
 => sending tarball                                                                                   0.0s
$ mkdir -p out && tar -C out -xf ./image.tar
$ tree out
out
├── blobs
│   └── sha256
│       ├── 9b18e9b68314027565b90ff6189d65942c0f7986da80df008b8431276885218e
│       ├── c78795f3c329dbbbfb14d0d32288dea25c3cd12f31bd0213be694332a70c7f13
│       ├── d1cf38078fa218d15715e2afcf71588ee482352d697532cf316626164699a0e2
│       ├── e84fa1df52d2abdfac52165755d5d1c7621d74eda8e12881f6b0d38a36e01775
│       └── fe9e23793a27fe30374308988283d40047628c73f91f577432a0d05ab0160de7
├── index.json
├── manifest.json
└── oci-layout
```
@z

@x
### Export filesystem
@y
### Export filesystem
@z

@x
If you don't want to build an image from your build results, but instead export
the filesystem that was built, you can use the `local` and `tar` exporters.
@y
If you don't want to build an image from your build results, but instead export
the filesystem that was built, you can use the `local` and `tar` exporters.
@z

@x
The `local` exporter unpacks the filesystem into a directory structure in the
specified location. The `tar` exporter creates a tarball archive file.
@y
The `local` exporter unpacks the filesystem into a directory structure in the
specified location. The `tar` exporter creates a tarball archive file.
@z

@x
```console
$ docker buildx build --output type=tar,dest=<path/to/output> .
```
@y
```console
$ docker buildx build --output type=tar,dest=<path/to/output> .
```
@z

@x
The `local` exporter is useful in [multi-stage builds](../building/multi-stage.md)
since it allows you to export only a minimal number of build artifacts, such as
self-contained binaries.
@y
The `local` exporter is useful in [multi-stage builds](../building/multi-stage.md)
since it allows you to export only a minimal number of build artifacts, such as
self-contained binaries.
@z

@x
### Cache-only export
@y
### Cache-only export
@z

@x
The `cacheonly` exporter can be used if you just want to run a build, without
exporting any output. This can be useful if, for example, you want to run a test
build. Or, if you want to run the build first, and create exports using
subsequent commands. The `cacheonly` exporter creates a build cache, so any
successive builds are instant.
@y
The `cacheonly` exporter can be used if you just want to run a build, without
exporting any output. This can be useful if, for example, you want to run a test
build. Or, if you want to run the build first, and create exports using
subsequent commands. The `cacheonly` exporter creates a build cache, so any
successive builds are instant.
@z

@x
```console
$ docker buildx build --output type=cacheonly
```
@y
```console
$ docker buildx build --output type=cacheonly
```
@z

@x
If you don't specify an exporter, and you don't provide short-hand options like
`--load` that automatically selects the appropriate exporter, Buildx defaults to
using the `cacheonly` exporter. Except if you build using the `docker` driver,
in which case you use the `docker` exporter.
@y
If you don't specify an exporter, and you don't provide short-hand options like
`--load` that automatically selects the appropriate exporter, Buildx defaults to
using the `cacheonly` exporter. Except if you build using the `docker` driver,
in which case you use the `docker` exporter.
@z

@x
Buildx logs a warning message when using `cacheonly` as a default:
@y
Buildx logs a warning message when using `cacheonly` as a default:
@z

@x
```console
$ docker buildx build .
WARNING: No output specified with docker-container driver.
         Build result will only remain in the build cache.
         To push result image into registry use --push or
         to load image into docker use --load
```
@y
```console
$ docker buildx build .
WARNING: No output specified with docker-container driver.
         Build result will only remain in the build cache.
         To push result image into registry use --push or
         to load image into docker use --load
```
@z

@x
## Multiple exporters
@y
## Multiple exporters
@z

@x
You can only specify a single exporter for any given build (see
[this pull request](https://github.com/moby/buildkit/pull/2760) for details).
But you can perform multiple builds one after another to export the same content
twice. BuildKit caches the build, so unless any of the layers change, all
successive builds following the first are instant.
@y
You can only specify a single exporter for any given build (see
[this pull request](https://github.com/moby/buildkit/pull/2760) for details).
But you can perform multiple builds one after another to export the same content
twice. BuildKit caches the build, so unless any of the layers change, all
successive builds following the first are instant.
@z

@x
The following example shows how to run the same build twice, first using the
`image`, followed by the `local`.
@y
The following example shows how to run the same build twice, first using the
`image`, followed by the `local`.
@z

@x
```console
$ docker buildx build --output type=image,tag=<registry>/<image> .
$ docker buildx build --output type=local,dest=<path/to/output> .
```
@y
```console
$ docker buildx build --output type=image,tag=<registry>/<image> .
$ docker buildx build --output type=local,dest=<path/to/output> .
```
@z

@x
## Configuration options
@y
## Configuration options
@z

@x
This section describes some configuration options available for exporters.
@y
This section describes some configuration options available for exporters.
@z

@x
The options described here are common for at least two or more exporter types.
Additionally, the different exporters types support specific parameters as well.
See the detailed page about each exporter for more information about which
configuration parameters apply.
@y
The options described here are common for at least two or more exporter types.
Additionally, the different exporters types support specific parameters as well.
See the detailed page about each exporter for more information about which
configuration parameters apply.
@z

@x
The common parameters described here are:
@y
The common parameters described here are:
@z

@x
- [Compression](#compression)
- [OCI media type](#oci-media-types)
@y
- [Compression](#compression)
- [OCI media type](#oci-media-types)
@z

@x
### Compression
@y
### Compression
@z

@x
When you export a compressed output, you can configure the exact compression
algorithm and level to use. While the default values provide a good
out-of-the-box experience, you may wish to tweak the parameters to optimize for
storage vs compute costs. Changing the compression parameters can reduce storage
space required, and improve image download times, but will increase build times.
@y
When you export a compressed output, you can configure the exact compression
algorithm and level to use. While the default values provide a good
out-of-the-box experience, you may wish to tweak the parameters to optimize for
storage vs compute costs. Changing the compression parameters can reduce storage
space required, and improve image download times, but will increase build times.
@z

@x
To select the compression algorithm, you can use the `compression` option. For
example, to build an `image` with `compression=zstd`:
@y
To select the compression algorithm, you can use the `compression` option. For
example, to build an `image` with `compression=zstd`:
@z

@x
```console
$ docker buildx build \
  --output type=image,name=<registry>/<image>,push=true,compression=zstd .
```
@y
```console
$ docker buildx build \
  --output type=image,name=<registry>/<image>,push=true,compression=zstd .
```
@z

@x
Use the `compression-level=<value>` option alongside the `compression` parameter
to choose a compression level for the algorithms which support it:
@y
Use the `compression-level=<value>` option alongside the `compression` parameter
to choose a compression level for the algorithms which support it:
@z

@x
- 0-9 for `gzip` and `estargz`
- 0-22 for `zstd`
@y
- 0-9 for `gzip` and `estargz`
- 0-22 for `zstd`
@z

@x
As a general rule, the higher the number, the smaller the resulting file will
be, and the longer the compression will take to run.
@y
As a general rule, the higher the number, the smaller the resulting file will
be, and the longer the compression will take to run.
@z

@x
Use the `force-compression=true` option to force re-compressing layers imported
from a previous image, if the requested compression algorithm is different from
the previous compression algorithm.
@y
Use the `force-compression=true` option to force re-compressing layers imported
from a previous image, if the requested compression algorithm is different from
the previous compression algorithm.
@z

@x
> **Note**
>
> The `gzip` and `estargz` compression methods use the [`compress/gzip` package](https://pkg.go.dev/compress/gzip),
> while `zstd` uses the [`github.com/klauspost/compress/zstd` package](https://github.com/klauspost/compress/tree/master/zstd).
@y
> **Note**
>
> The `gzip` and `estargz` compression methods use the [`compress/gzip` package](https://pkg.go.dev/compress/gzip),
> while `zstd` uses the [`github.com/klauspost/compress/zstd` package](https://github.com/klauspost/compress/tree/master/zstd).
@z

@x
### OCI media types
@y
### OCI media types
@z

@x
The `image`, `registry`, `oci` and `docker` exporters create container images.
These exporters support both Docker media types (default) and OCI media types
@y
The `image`, `registry`, `oci` and `docker` exporters create container images.
These exporters support both Docker media types (default) and OCI media types
@z

@x
To export images with OCI media types set, use the `oci-mediatypes` property.
@y
To export images with OCI media types set, use the `oci-mediatypes` property.
@z

@x
```console
$ docker buildx build \
  --output type=image,name=<registry>/<image>,push=true,oci-mediatypes=true .
```
@y
```console
$ docker buildx build \
  --output type=image,name=<registry>/<image>,push=true,oci-mediatypes=true .
```
@z

@x
## What's next
@y
## What's next
@z

@x
Read about each of the exporters to learn about how they work and how to use
them:
@y
Read about each of the exporters to learn about how they work and how to use
them:
@z

@x
- [Image and registry exporters](image-registry.md)
- [OCI and Docker exporters](oci-docker.md).
- [Local and tar exporters](local-tar.md)
@y
- [Image and registry exporters](image-registry.md)
- [OCI and Docker exporters](oci-docker.md).
- [Local and tar exporters](local-tar.md)
@z
