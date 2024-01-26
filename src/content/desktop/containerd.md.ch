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
## What is the containerd image store?
@y
## What is the containerd image store?
@z

@x
`containerd` is a container runtime that manages the container lifecycle, and
provides image and filesystem management. It's a low-level building block,
designed to be integrated into other systems, such as Docker and Kubernetes.
@y
`containerd` is a container runtime that manages the container lifecycle, and
provides image and filesystem management. It's a low-level building block,
designed to be integrated into other systems, such as Docker and Kubernetes.
@z

@x
Docker Engine already uses `containerd` for container lifecycle management, which
includes creating, starting, and stopping containers. This page describes the
next step of containerd integration for Docker Engine: the image store.
@y
Docker Engine already uses `containerd` for container lifecycle management, which
includes creating, starting, and stopping containers. This page describes the
next step of containerd integration for Docker Engine: the image store.
@z

@x
The image store is the component responsible for pushing, pulling, and storing
images. Integrating the containerd image store enables many new features in the
Docker Engine, including:
@y
The image store is the component responsible for pushing, pulling, and storing
images. Integrating the containerd image store enables many new features in the
Docker Engine, including:
@z

@x
- containerd snapshotters, such as [stargz][1] for lazy-pulling images on startup,
  or [nydus][2] and [dragonfly][3] for peer-to-peer image distribution.
- Natively store and build multi-platform images, and other OCI content types
  that may emerge in the future.
- Ability to run [Wasm](wasm.md) containers
@y
- containerd snapshotters, such as [stargz][1] for lazy-pulling images on startup,
  or [nydus][2] and [dragonfly][3] for peer-to-peer image distribution.
- Natively store and build multi-platform images, and other OCI content types
  that may emerge in the future.
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
The image store integration is still at an early stage, so not all features are
yet supported.
@y
The image store integration is still at an early stage, so not all features are
yet supported.
@z

@x
## Turn on the containerd image store feature
@y
## Turn on the containerd image store feature
@z

@x
The containerd image store isn't turned on by default. To start using the
feature:
@y
The containerd image store isn't turned on by default. To start using the
feature:
@z

@x
1. Navigate to **Settings**.
2. In the **General** tab, check **Use containerd for pulling and storing images**.
3. Select **Apply & Restart**
@y
1. Navigate to **Settings**.
2. In the **General** tab, check **Use containerd for pulling and storing images**.
3. Select **Apply & Restart**
@z

@x
To turn off this feature, clear the **Use containerd for pulling and storing 
images** checkbox.
@y
To turn off this feature, clear the **Use containerd for pulling and storing 
images** checkbox.
@z

@x
> **Tip**
>
> After switching to the containerd image store, images and containers from the
> default image store won't be visible. All of those containers and images
> still exist. To see them again, turn off the containerd image store feature.
{ .tip }
@y
> **Tip**
>
> After switching to the containerd image store, images and containers from the
> default image store won't be visible. All of those containers and images
> still exist. To see them again, turn off the containerd image store feature.
{ .tip }
@z

@x
## Building multi-platform images
@y
## Building multi-platform images
@z

@x
The term multi-platform image refers to a bundle of images that can run on different architectures.
Out of the box, the default builder for Docker Desktop doesn't support building multi-platform images.
@y
The term multi-platform image refers to a bundle of images that can run on different architectures.
Out of the box, the default builder for Docker Desktop doesn't support building multi-platform images.
@z

@x
```console
$ docker buildx ls | grep "DRIVER\|*"
NAME/NODE       DRIVER/ENDPOINT             STATUS  BUILDKIT PLATFORMS
default *       docker
$ docker buildx build --platform=linux/amd64,linux/arm64 .
[+] Building 0.0s (0/0)
ERROR: multiple platforms feature is currently not supported for docker driver. Please switch to a different driver (eg. "docker buildx create --use")
```
@y
```console
$ docker buildx ls | grep "DRIVER\|*"
NAME/NODE       DRIVER/ENDPOINT             STATUS  BUILDKIT PLATFORMS
default *       docker
$ docker buildx build --platform=linux/amd64,linux/arm64 .
[+] Building 0.0s (0/0)
ERROR: multiple platforms feature is currently not supported for docker driver. Please switch to a different driver (eg. "docker buildx create --use")
```
@z

@x
Normally, building multi-platform images requires you to create a new builder,
using a driver that supports multi-platform builds.
But even then, you can't load the multi-platform images to your local image store.
@y
Normally, building multi-platform images requires you to create a new builder,
using a driver that supports multi-platform builds.
But even then, you can't load the multi-platform images to your local image store.
@z

@x
```console
$ docker buildx create --bootstrap
[+] Building 2.4s (1/1) FINISHED
 => [internal] booting buildkit
 => => pulling image moby/buildkit:buildx-stable-1
 => => creating container buildx_buildkit_objective_blackburn0
objective_blackburn
$ docker buildx build --quiet \
  --platform=linux/amd64,linux/arm64 \
  --builder=objective_blackburn \
  --load .
ERROR: docker exporter does not currently support exporting manifest lists
```
@y
```console
$ docker buildx create --bootstrap
[+] Building 2.4s (1/1) FINISHED
 => [internal] booting buildkit
 => => pulling image moby/buildkit:buildx-stable-1
 => => creating container buildx_buildkit_objective_blackburn0
objective_blackburn
$ docker buildx build --quiet \
  --platform=linux/amd64,linux/arm64 \
  --builder=objective_blackburn \
  --load .
ERROR: docker exporter does not currently support exporting manifest lists
```
@z

@x
Turning on the containerd image store lets you build, and load, multi-platform images
to your local image store, all while using the default builder.
@y
Turning on the containerd image store lets you build, and load, multi-platform images
to your local image store, all while using the default builder.
@z

@x
```console
$ docker info --format="{{ .Driver }}"
stargz
$ docker buildx build \   
  --platform=linux/arm64,linux/amd64 \
  --tag=user/containerd-multiplatform .
[+] Building 6.2s (11/11) FINISHED                                                                                                                                                                       
 ...
 => [internal] load build definition from Dockerfile                            0.0s
 => => transferring dockerfile: 115B                                            0.0s
 => [linux/arm64 internal] load metadata for docker.io/library/alpine:latest    2.0s
 => [linux/amd64 internal] load metadata for docker.io/library/alpine:latest    2.1s
 => [linux/amd64 1/1] FROM docker.io/library/alpine@sha256:124c7d2707904e...    0.0s
 => => resolve docker.io/library/alpine@sha256:124c7d2707904eea7431fffe91...    0.0s
 => [linux/arm64 1/1] FROM docker.io/library/alpine@sha256:124c7d2707904e...    0.0s
 => => resolve docker.io/library/alpine@sha256:124c7d2707904eea7431fffe91...    0.0s
 => exporting to image                                                          0.0s
 => => exporting layers                                                         0.0s
 ...
 => => naming to docker.io/user/containerd-multiplatform:latest                 0.0s
 => => unpacking to docker.io/user/containerd-multiplatform:latest              0.0s
$ docker images
REPOSITORY                        TAG       IMAGE ID       CREATED          SIZE
user/containerd-multiplatform     latest    7401bb14c229   14 seconds ago   3.38MB
user/containerd-multiplatform     latest    7401bb14c229   14 seconds ago   3.26MB
```
@y
```console
$ docker info --format="{{ .Driver }}"
stargz
$ docker buildx build \   
  --platform=linux/arm64,linux/amd64 \
  --tag=user/containerd-multiplatform .
[+] Building 6.2s (11/11) FINISHED                                                                                                                                                                       
 ...
 => [internal] load build definition from Dockerfile                            0.0s
 => => transferring dockerfile: 115B                                            0.0s
 => [linux/arm64 internal] load metadata for docker.io/library/alpine:latest    2.0s
 => [linux/amd64 internal] load metadata for docker.io/library/alpine:latest    2.1s
 => [linux/amd64 1/1] FROM docker.io/library/alpine@sha256:124c7d2707904e...    0.0s
 => => resolve docker.io/library/alpine@sha256:124c7d2707904eea7431fffe91...    0.0s
 => [linux/arm64 1/1] FROM docker.io/library/alpine@sha256:124c7d2707904e...    0.0s
 => => resolve docker.io/library/alpine@sha256:124c7d2707904eea7431fffe91...    0.0s
 => exporting to image                                                          0.0s
 => => exporting layers                                                         0.0s
 ...
 => => naming to docker.io/user/containerd-multiplatform:latest                 0.0s
 => => unpacking to docker.io/user/containerd-multiplatform:latest              0.0s
$ docker images
REPOSITORY                        TAG       IMAGE ID       CREATED          SIZE
user/containerd-multiplatform     latest    7401bb14c229   14 seconds ago   3.38MB
user/containerd-multiplatform     latest    7401bb14c229   14 seconds ago   3.26MB
```
@z

@x
You can push the multi-platform image to Docker Hub.
@y
You can push the multi-platform image to Docker Hub.
@z

@x
```console
$ docker push user/containerd-multiplatform
Using default tag: latest
699c4e744ab4: Pushed 
878d877e4f70: Pushed 
f56be85fc22e: Pushed 
a579f49700dc: Pushed 
c41833b44d91: Pushed 
ee79e74f9211: Pushed 
d28bdb47b683: Pushed
```
@y
```console
$ docker push user/containerd-multiplatform
Using default tag: latest
699c4e744ab4: Pushed 
878d877e4f70: Pushed 
f56be85fc22e: Pushed 
a579f49700dc: Pushed 
c41833b44d91: Pushed 
ee79e74f9211: Pushed 
d28bdb47b683: Pushed
```
@z

@x
Inspecting the tag on Docker Hub shows that the image is available for multiple platforms.
@y
Inspecting the tag on Docker Hub shows that the image is available for multiple platforms.
@z

@x
![Multiplatform image tag on Docker Hub](images/containerd_multiplatform.png)
@y
![Multiplatform image tag on Docker Hub](images/containerd_multiplatform.png)
@z

@x
## Known issues
@y
## Known issues
@z

@x
### Docker Desktop 4.13.0 release
@y
### Docker Desktop 4.13.0 release
@z

@x
- Listing images with `docker images` returns the error
  `content digest not found` on ARM machines after running or pulling an image
  with the `--platform` parameter.
@y
- Listing images with `docker images` returns the error
  `content digest not found` on ARM machines after running or pulling an image
  with the `--platform` parameter.
@z

@x
### Docker Desktop 4.12.0 release
@y
### Docker Desktop 4.12.0 release
@z

@x
- The containerd image store feature requires Buildx version 0.9.0 or newer.
@y
- The containerd image store feature requires Buildx version 0.9.0 or newer.
@z

@x
  - On Docker Desktop for Linux (DD4L), validate if your locally installed
    version meets this requirement.
@y
  - On Docker Desktop for Linux (DD4L), validate if your locally installed
    version meets this requirement.
@z

@x
    > **Note**
    >
    > If you're using an older version, the Docker daemon reports the following
    > error:
    > `Multiple platforms feature is currently not supported for docker driver.`
    > `Please switch to a different driver`.
    >
    > Install a newer version of Buildx following the instructions on
    > [how to manually download Buildx](../../build/architecture.md#install-buildx).
@y
    > **Note**
    >
    > If you're using an older version, the Docker daemon reports the following
    > error:
    > `Multiple platforms feature is currently not supported for docker driver.`
    > `Please switch to a different driver`.
    >
    > Install a newer version of Buildx following the instructions on
    > [how to manually download Buildx](../../build/architecture.md#install-buildx).
@z

@x
- In Docker Desktop 4.12.0, the containerd image store feature is incompatible
  with the Kubernetes cluster support. Turn off the containerd image store
  feature if you are using the Kubernetes from Docker Desktop.
- Local registry mirror configuration isn't implemented yet with the containerd
  image store. The `registry-mirrors` and `insecure-registries` aren't taken
  into account by the Docker daemon.
- The `reference` filter isn't implemented yet and will return the error
  `invalid filter 'reference'` when listing images.
- Pulling an image may fail with the error
  `pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed`,
  in the situation where the image does not contain a manifest list. To
  workaround this issue run the `docker login` command and pull the image again.
@y
- In Docker Desktop 4.12.0, the containerd image store feature is incompatible
  with the Kubernetes cluster support. Turn off the containerd image store
  feature if you are using the Kubernetes from Docker Desktop.
- Local registry mirror configuration isn't implemented yet with the containerd
  image store. The `registry-mirrors` and `insecure-registries` aren't taken
  into account by the Docker daemon.
- The `reference` filter isn't implemented yet and will return the error
  `invalid filter 'reference'` when listing images.
- Pulling an image may fail with the error
  `pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed`,
  in the situation where the image does not contain a manifest list. To
  workaround this issue run the `docker login` command and pull the image again.
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
