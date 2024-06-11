%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: containerd image store
description: How to activate the containerd integration feature in Docker Desktop
keywords: Docker, containerd, engine, image store, lazy-pull
toc_max: 3
---
@y
---
title: containerd image store
description: How to activate the containerd integration feature in Docker Desktop
keywords: Docker, containerd, engine, image store, lazy-pull
toc_max: 3
---
@z

@x
This page provides information about the ongoing integration of `containerd` for
image and file system management in the Docker Engine.
@y
This page provides information about the ongoing integration of `containerd` for
image and file system management in the Docker Engine.
@z

@x
> **Note**
> 
> After switching to the containerd image store,
> images and containers in the classic image store won't be visible.
> All of those containers and images still exist.
> To see them again, turn off the containerd image store feature.
@y
> **Note**
> 
> After switching to the containerd image store,
> images and containers in the classic image store won't be visible.
> All of those containers and images still exist.
> To see them again, turn off the containerd image store feature.
@z

@x
## What is containerd?
@y
## What is containerd?
@z

@x
`containerd` is an abstraction of the low-level kernel features
used to run and manage containers on a system.
It's a platform used in container software like Docker and Kubernetes.
@y
`containerd` is an abstraction of the low-level kernel features
used to run and manage containers on a system.
It's a platform used in container software like Docker and Kubernetes.
@z

@x
Docker Engine already uses `containerd` for container lifecycle management,
which includes creating, starting, and stopping containers.
This page describes the next step of the containerd integration for Docker:
the containerd image store.
@y
Docker Engine already uses `containerd` for container lifecycle management,
which includes creating, starting, and stopping containers.
This page describes the next step of the containerd integration for Docker:
the containerd image store.
@z

@x
## Image store
@y
## Image store
@z

@x
The image store is the component responsible for pushing, pulling,
and storing images on the filesystem.
The classic Docker image store is limited in the types of images that it supports.
For example, it doesn't support image indices, containing manifest lists.
When you create multi-platform images, for example,
the image index resolves all the platform-specific variants of the image.
An image index is also required when building images with attestations.
@y
The image store is the component responsible for pushing, pulling,
and storing images on the filesystem.
The classic Docker image store is limited in the types of images that it supports.
For example, it doesn't support image indices, containing manifest lists.
When you create multi-platform images, for example,
the image index resolves all the platform-specific variants of the image.
An image index is also required when building images with attestations.
@z

@x
The containerd image store extends range of image types
that the Docker Engine can natively interact with.
While this is a low-level architectural change,
it's a prerequisite for unlocking a range of new use cases, including:
@y
The containerd image store extends range of image types
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
## Enable the containerd image store
@y
## Enable the containerd image store
@z

@x
The containerd image store isn't enabled by default.
To enable the feature for Docker Desktop:
@y
The containerd image store isn't enabled by default.
To enable the feature for Docker Desktop:
@z

@x
1. Navigate to **Settings** in Docker Desktop.
2. In the **General** tab, check **Use containerd for pulling and storing images**.
3. Select **Apply & Restart**.
@y
1. Navigate to **Settings** in Docker Desktop.
2. In the **General** tab, check **Use containerd for pulling and storing images**.
3. Select **Apply & Restart**.
@z

@x
To disable the containerd image store,
clear the **Use containerd for pulling and storing images** checkbox.
@y
To disable the containerd image store,
clear the **Use containerd for pulling and storing images** checkbox.
@z

@x
## Build multi-platform images
@y
## Build multi-platform images
@z

@x
The term multi-platform image refers to a bundle of images for multiple different architectures.
Out of the box, the default builder for Docker Desktop doesn't support building multi-platform images.
@y
The term multi-platform image refers to a bundle of images for multiple different architectures.
Out of the box, the default builder for Docker Desktop doesn't support building multi-platform images.
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

@x
Enabling the containerd image store lets you build multi-platform images
and load them to your local image store:
@y
Enabling the containerd image store lets you build multi-platform images
and load them to your local image store:
@z

@x
<script async id="asciicast-ZSUI4Mi2foChLjbevl2dxt5GD" src="https://asciinema.org/a/ZSUI4Mi2foChLjbevl2dxt5GD.js"></script>
@y
<script async id="asciicast-ZSUI4Mi2foChLjbevl2dxt5GD" src="https://asciinema.org/a/ZSUI4Mi2foChLjbevl2dxt5GD.js"></script>
@z

@x
## Feedback
@y
## Feedback
@z

@x
Thanks for trying the new features available with `containerd`. Give feedback or
report any bugs you may find through the issues tracker on the
[feedback form](https://dockr.ly/3PODIhD).
@y
Thanks for trying the new features available with `containerd`. Give feedback or
report any bugs you may find through the issues tracker on the
[feedback form](https://dockr.ly/3PODIhD).
@z
