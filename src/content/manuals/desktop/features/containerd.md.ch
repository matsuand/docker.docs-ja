%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: containerd image store
@y
title: containerd image store
@z

@x
description: Learn about the containerd image store in Docker Desktop and how it extends image management capabilities.
keywords: Docker, containerd, engine, image store, lazy-pull
@y
description: Learn about the containerd image store in Docker Desktop and how it extends image management capabilities.
keywords: Docker, containerd, engine, image store, lazy-pull
@z

@x
Docker Desktop uses containerd as its image store by default. The image store
is the component responsible for pushing, pulling, and storing images on your
filesystem. The containerd image store supports features like multi-platform
images, image attestations, and alternative snapshotters.
@y
Docker Desktop uses containerd as its image store by default. The image store
is the component responsible for pushing, pulling, and storing images on your
filesystem. The containerd image store supports features like multi-platform
images, image attestations, and alternative snapshotters.
@z

@x
## What is `containerd`?
@y
## What is `containerd`?
@z

@x
`containerd` is a container runtime that provides a lightweight, consistent
interface for container lifecycle and image management. It is used under the
hood by Docker Engine for creating, starting, and stopping containers.
@y
`containerd` is a container runtime that provides a lightweight, consistent
interface for container lifecycle and image management. It is used under the
hood by Docker Engine for creating, starting, and stopping containers.
@z

@x
## What is the `containerd` image store?
@y
## What is the `containerd` image store?
@z

@x
The image store is the component responsible for pushing, pulling,
and storing images on the filesystem.
@y
The image store is the component responsible for pushing, pulling,
and storing images on the filesystem.
@z

@x
The containerd image store extends the range of image types
that the Docker Engine can natively interact with.
While this is a low-level architectural change,
it's a prerequisite for unlocking a range of new use cases, including:
@y
The containerd image store extends the range of image types
that the Docker Engine can natively interact with.
While this is a low-level architectural change,
it's a prerequisite for unlocking a range of new use cases, including:
@z

@x
- [Build multi-platform images](#build-multi-platform-images) and images with attestations
- Support for using containerd snapshotters with unique characteristics,
  such as [stargz][1] for lazy-pulling images on container startup,
  or [nydus][2] and [dragonfly][3] for peer-to-peer image distribution.
- Ability to run [Wasm](wasm.md) containers
@y
- [Build multi-platform images](#build-multi-platform-images) and images with attestations
- Support for using containerd snapshotters with unique characteristics,
  such as [stargz][1] for lazy-pulling images on container startup,
  or [nydus][2] and [dragonfly][3] for peer-to-peer image distribution.
- Ability to run [Wasm](wasm.md) containers
@z

@x
[1]: https://github.com/containerd/stargz-snapshotter
[2]: https://github.com/containerd/nydus-snapshotter
[3]: https://github.com/dragonflyoss/image-service
@y
[1]: https://github.com/containerd/stargz-snapshotter
[2]: https://github.com/containerd/nydus-snapshotter
[3]: https://github.com/dragonflyoss/image-service
@z

@x
## Classic image store
@y
## Classic image store
@z

@x
The classic image store is Docker's legacy storage backend, replaced by the
containerd image store. It doesn't support image indices or manifest lists, so
you can't load multi-platform images locally or build images with attestations.
@y
The classic image store is Docker's legacy storage backend, replaced by the
containerd image store. It doesn't support image indices or manifest lists, so
you can't load multi-platform images locally or build images with attestations.
@z

@x
Most users have no reason to use the classic image store. It's available for
cases where you need to match older behavior or have compatibility
requirements.
@y
Most users have no reason to use the classic image store. It's available for
cases where you need to match older behavior or have compatibility
requirements.
@z

@x
## Switch image stores
@y
## Switch image stores
@z

@x
The containerd image store is enabled by default in Docker Desktop version 4.34
and later. To switch between image stores:
@y
The containerd image store is enabled by default in Docker Desktop version 4.34
and later. To switch between image stores:
@z

@x
1. Navigate to **Settings** in Docker Desktop.
2. In the **General** tab, check or clear the **Use containerd for pulling and storing images** option.
3. Select **Apply**.
@y
1. Navigate to **Settings** in Docker Desktop.
2. In the **General** tab, check or clear the **Use containerd for pulling and storing images** option.
3. Select **Apply**.
@z

@x
> [!NOTE]
>
> Docker Desktop maintains separate image stores for the classic and containerd image stores.
> When switching between them, images and containers from the inactive store remain on disk but are hidden until you switch back.
@y
> [!NOTE]
>
> Docker Desktop maintains separate image stores for the classic and containerd image stores.
> When switching between them, images and containers from the inactive store remain on disk but are hidden until you switch back.
@z

@x
## Build multi-platform images
@y
## Build multi-platform images
@z

@x
The containerd image store lets you build multi-platform images
and load them to your local image store:
@y
The containerd image store lets you build multi-platform images
and load them to your local image store:
@z

@x
<script async id="asciicast-ZSUI4Mi2foChLjbevl2dxt5GD" src="https://asciinema.org/a/ZSUI4Mi2foChLjbevl2dxt5GD.js"></script>
@y
<script async id="asciicast-ZSUI4Mi2foChLjbevl2dxt5GD" src="https://asciinema.org/a/ZSUI4Mi2foChLjbevl2dxt5GD.js"></script>
@z

@x
Building multi-platform images with the classic image store is not supported:
@y
Building multi-platform images with the classic image store is not supported:
@z

@x
```console
$ docker build --platform=linux/amd64,linux/arm64 .
[+] Building 0.0s (0/0)
ERROR: Multi-platform build is not supported for the docker driver.
Switch to a different driver, or turn on the containerd image store, and try again.
Learn more at https://docs.docker.com/go/build-multi-platform/
```
@y
```console
$ docker build --platform=linux/amd64,linux/arm64 .
[+] Building 0.0s (0/0)
ERROR: Multi-platform build is not supported for the docker driver.
Switch to a different driver, or turn on the containerd image store, and try again.
Learn more at https://docs.docker.com/go/build-multi-platform/
```
@z
