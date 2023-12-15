%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Local and tar exporters
keywords: build, buildx, buildkit, exporter, local, tar
description: >
  The local and tar exporters save the build result to the local filesystem
aliases:
  - /build/building/exporters/local-tar/
---
@y
---
title: Local and tar exporters
keywords: build, buildx, buildkit, exporter, local, tar
description: >
  The local and tar exporters save the build result to the local filesystem
aliases:
  - /build/building/exporters/local-tar/
---
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
| Parameter | Type   | Default | Description           |
| --------- | ------ | ------- | --------------------- |
| `dest`    | String |         | Path to copy files to |
@y
| Parameter | Type   | Default | Description           |
| --------- | ------ | ------- | --------------------- |
| `dest`    | String |         | Path to copy files to |
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
