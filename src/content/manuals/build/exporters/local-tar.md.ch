%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Local and tar exporters
keywords: build, buildx, buildkit, exporter, local, tar
description: >
  The local and tar exporters save the build result to the local filesystem
@y
title: Local and tar exporters
keywords: build, buildx, buildkit, exporter, local, tar
description: >
  The local and tar exporters save the build result to the local filesystem
@z

@x
The `local` and `tar` exporters output the root filesystem of the build result
into a local directory. They're useful for producing artifacts that aren't
container images.
@y
The `local` and `tar` exporters output the root filesystem of the build result
into a local directory. They're useful for producing artifacts that aren't
container images.
@z

@x
- `local` exports files and directories.
- `tar` exports the same, but bundles the export into a tarball.
@y
- `local` exports files and directories.
- `tar` exports the same, but bundles the export into a tarball.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Build a container image using the `local` exporter:
@y
Build a container image using the `local` exporter:
@z

@x
```console
$ docker buildx build --output type=local[,parameters] .
$ docker buildx build --output type=tar[,parameters] .
```
@y
```console
$ docker buildx build --output type=local[,parameters] .
$ docker buildx build --output type=tar[,parameters] .
```
@z

@x
The following table describes the available parameters:
@y
The following table describes the available parameters:
@z

@x
| Parameter        | Type    | Default | Description                                                                       |
| ---------------- | ------- | ------- | --------------------------------------------------------------------------------- |
| `dest`           | String  |         | Path to copy files to                                                             |
| `platform-split` | Boolean | `true`  | `local` exporter only. Split multi-platform outputs into platform subdirectories. |
@y
| Parameter        | Type    | Default | Description                                                                       |
| ---------------- | ------- | ------- | --------------------------------------------------------------------------------- |
| `dest`           | String  |         | Path to copy files to                                                             |
| `platform-split` | Boolean | `true`  | `local` exporter only. Split multi-platform outputs into platform subdirectories. |
@z

@x
## Multi-platform builds with local exporter
@y
## Multi-platform builds with local exporter
@z

@x
The `platform-split` parameter controls how multi-platform build outputs are
organized.
@y
The `platform-split` parameter controls how multi-platform build outputs are
organized.
@z

@x
Consider this Dockerfile that creates platform-specific files:
@y
Consider this Dockerfile that creates platform-specific files:
@z

@x
```dockerfile
FROM busybox AS build
ARG TARGETOS
ARG TARGETARCH
RUN mkdir /out && echo foo > /out/hello-$TARGETOS-$TARGETARCH
@y
```dockerfile
FROM busybox AS build
ARG TARGETOS
ARG TARGETARCH
RUN mkdir /out && echo foo > /out/hello-$TARGETOS-$TARGETARCH
@z

@x
FROM scratch
COPY --from=build /out /
```
@y
FROM scratch
COPY --from=build /out /
```
@z

@x
### Split by platform (default)
@y
### Split by platform (default)
@z

@x
By default, the local exporter creates a separate subdirectory for each
platform:
@y
By default, the local exporter creates a separate subdirectory for each
platform:
@z

@x
```console
$ docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --output type=local,dest=./output \
  .
```
@y
```console
$ docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --output type=local,dest=./output \
  .
```
@z

@x
This produces the following directory structure:
@y
This produces the following directory structure:
@z

@x
```text
output/
├── linux_amd64/
│   └── hello-linux-amd64
└── linux_arm64/
    └── hello-linux-arm64
```
@y
```text
output/
├── linux_amd64/
│   └── hello-linux-amd64
└── linux_arm64/
    └── hello-linux-arm64
```
@z

@x
### Merge all platforms
@y
### Merge all platforms
@z

@x
To merge files from all platforms into the same directory, set
`platform-split=false`:
@y
To merge files from all platforms into the same directory, set
`platform-split=false`:
@z

@x
```console
$ docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --output type=local,dest=./output,platform-split=false \
  .
```
@y
```console
$ docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --output type=local,dest=./output,platform-split=false \
  .
```
@z

@x
This produces a flat directory structure:
@y
This produces a flat directory structure:
@z

@x
```text
output/
├── hello-linux-amd64
└── hello-linux-arm64
```
@y
```text
output/
├── hello-linux-amd64
└── hello-linux-arm64
```
@z

@x
Files from all platforms merge into a single directory. If multiple platforms
produce files with identical names, the export fails with an error.
@y
Files from all platforms merge into a single directory. If multiple platforms
produce files with identical names, the export fails with an error.
@z

@x
### Single-platform builds
@y
### Single-platform builds
@z

@x
Single-platform builds export directly to the destination directory without
creating a platform subdirectory:
@y
Single-platform builds export directly to the destination directory without
creating a platform subdirectory:
@z

@x
```console
$ docker buildx build \
  --platform linux/amd64 \
  --output type=local,dest=./output \
  .
```
@y
```console
$ docker buildx build \
  --platform linux/amd64 \
  --output type=local,dest=./output \
  .
```
@z

@x
This produces:
@y
This produces:
@z

@x
```text
output/
└── hello-linux-amd64
```
@y
```text
output/
└── hello-linux-amd64
```
@z

@x
To include the platform subdirectory even for single-platform builds, explicitly
set `platform-split=true`:
@y
To include the platform subdirectory even for single-platform builds, explicitly
set `platform-split=true`:
@z

@x
```console
$ docker buildx build \
  --platform linux/amd64 \
  --output type=local,dest=./output,platform-split=true \
  .
```
@y
```console
$ docker buildx build \
  --platform linux/amd64 \
  --output type=local,dest=./output,platform-split=true \
  .
```
@z

@x
This produces:
@y
This produces:
@z

@x
```text
output/
└── linux_amd64/
    └── hello-linux-amd64
```
@y
```text
output/
└── linux_amd64/
    └── hello-linux-amd64
```
@z

@x
## Further reading
@y
## Further reading
@z

@x
For more information on the `local` or `tar` exporters, see the
[BuildKit README](https://github.com/moby/buildkit/blob/master/README.md#local-directory).
@y
For more information on the `local` or `tar` exporters, see the
[BuildKit README](https://github.com/moby/buildkit/blob/master/README.md#local-directory).
@z
