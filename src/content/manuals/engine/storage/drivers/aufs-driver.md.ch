%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to optimize your use of AUFS driver.
keywords: 'container, storage, driver, AUFS '
title: AUFS storage driver
sitemap: false
aliases:
  - /storage/storagedriver/aufs-driver/
---
@y
---
description: Learn how to optimize your use of AUFS driver.
keywords: 'container, storage, driver, AUFS '
title: AUFS storage driver
sitemap: false
aliases:
  - /storage/storagedriver/aufs-driver/
---
@z

@x
> **Deprecated**
>
> The AuFS storage driver has been deprecated, and is removed in Docker Engine
> v24.0. If you are using AufS, you must migrate to a supported storage driver
> before upgrading to Docker Engine v24.0. Read the [Docker storage drivers](select-storage-driver.md)
> page for supported storage drivers.
@y
> **Deprecated**
>
> The AuFS storage driver has been deprecated, and is removed in Docker Engine
> v24.0. If you are using AufS, you must migrate to a supported storage driver
> before upgrading to Docker Engine v24.0. Read the [Docker storage drivers](select-storage-driver.md)
> page for supported storage drivers.
@z

@x
AUFS is a *union filesystem*. The `aufs` storage driver was previously the default
storage driver used for managing images and layers on Docker for Ubuntu, and for
Debian versions prior to Stretch. If your Linux kernel is version 4.0 or higher,
and you use Docker Engine - Community, consider using the newer
[overlay2](overlayfs-driver.md), which has
potential performance advantages over the `aufs` storage driver.
@y
AUFS is a *union filesystem*. The `aufs` storage driver was previously the default
storage driver used for managing images and layers on Docker for Ubuntu, and for
Debian versions prior to Stretch. If your Linux kernel is version 4.0 or higher,
and you use Docker Engine - Community, consider using the newer
[overlay2](overlayfs-driver.md), which has
potential performance advantages over the `aufs` storage driver.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- For Docker Engine - Community, AUFS is supported on Ubuntu, and on Debian versions prior to
  Stretch.
- If you use Ubuntu, you need to add the AUFS module to the kernel. If you do
  not install these packages, you need to use  `overlay2`.
- AUFS cannot use the following backing filesystems: `aufs`, `btrfs`, or
  `ecryptfs`. This means that the filesystem which contains
  `/var/lib/docker/aufs` cannot be one of these filesystem types.
@y
- For Docker Engine - Community, AUFS is supported on Ubuntu, and on Debian versions prior to
  Stretch.
- If you use Ubuntu, you need to add the AUFS module to the kernel. If you do
  not install these packages, you need to use  `overlay2`.
- AUFS cannot use the following backing filesystems: `aufs`, `btrfs`, or
  `ecryptfs`. This means that the filesystem which contains
  `/var/lib/docker/aufs` cannot be one of these filesystem types.
@z

@x
## Configure Docker with the `aufs` storage driver
@y
## Configure Docker with the `aufs` storage driver
@z

@x
If the AUFS driver is loaded into the kernel when you start Docker, and no other
storage driver is configured, Docker uses it by default.
@y
If the AUFS driver is loaded into the kernel when you start Docker, and no other
storage driver is configured, Docker uses it by default.
@z

@x
1.  Use the following command to verify that your kernel supports AUFS.
@y
1.  Use the following command to verify that your kernel supports AUFS.
@z

@x
    ```console
    $ grep aufs /proc/filesystems
@y
    ```console
    $ grep aufs /proc/filesystems
@z

@x
    nodev   aufs
    ```
@y
    nodev   aufs
    ```
@z

@x
2.  Check which storage driver Docker is using.
@y
2.  Check which storage driver Docker is using.
@z

@x
    ```console
    $ docker info
@y
    ```console
    $ docker info
@z

@x
    <truncated output>
    Storage Driver: aufs
     Root Dir: /var/lib/docker/aufs
     Backing Filesystem: extfs
     Dirs: 0
     Dirperm1 Supported: true
    <truncated output>
    ```
@y
    <truncated output>
    Storage Driver: aufs
     Root Dir: /var/lib/docker/aufs
     Backing Filesystem: extfs
     Dirs: 0
     Dirperm1 Supported: true
    <truncated output>
    ```
@z

@x
3.  If you are using a different storage driver, either AUFS is not included in
    the kernel (in which case a different default driver is used) or that
    Docker has been explicitly configured to use a different driver. Check
    `/etc/docker/daemon.json` or the output of `ps auxw | grep dockerd` to see
    if Docker has been started with the `--storage-driver` flag.
@y
3.  If you are using a different storage driver, either AUFS is not included in
    the kernel (in which case a different default driver is used) or that
    Docker has been explicitly configured to use a different driver. Check
    `/etc/docker/daemon.json` or the output of `ps auxw | grep dockerd` to see
    if Docker has been started with the `--storage-driver` flag.
@z

@x
## How the `aufs` storage driver works
@y
## How the `aufs` storage driver works
@z

@x
AUFS is a *union filesystem*, which means that it layers multiple directories on
a single Linux host and presents them as a single directory. These directories
are called _branches_ in AUFS terminology, and _layers_ in Docker terminology.
@y
AUFS is a *union filesystem*, which means that it layers multiple directories on
a single Linux host and presents them as a single directory. These directories
are called _branches_ in AUFS terminology, and _layers_ in Docker terminology.
@z

@x
The unification process is referred to as a _union mount_.
@y
The unification process is referred to as a _union mount_.
@z

@x
The diagram below shows a Docker container based on the `ubuntu:latest` image.
@y
The diagram below shows a Docker container based on the `ubuntu:latest` image.
@z

@x
![Layers of an Ubuntu container](images/aufs_layers.webp) 
@y
![Layers of an Ubuntu container](images/aufs_layers.webp) 
@z

@x
Each image layer, and the container layer, are represented on the Docker host as
subdirectories within `/var/lib/docker/`. The union mount provides the unified
view of all layers. The directory names do not directly correspond to the IDs
of the layers themselves.
@y
Each image layer, and the container layer, are represented on the Docker host as
subdirectories within `/var/lib/docker/`. The union mount provides the unified
view of all layers. The directory names do not directly correspond to the IDs
of the layers themselves.
@z

@x
AUFS uses the Copy-on-Write (CoW) strategy to maximize storage efficiency and
minimize overhead.
@y
AUFS uses the Copy-on-Write (CoW) strategy to maximize storage efficiency and
minimize overhead.
@z

@x
### Example: Image and container on-disk constructs
@y
### Example: Image and container on-disk constructs
@z

@x
The following `docker pull` command shows a Docker host downloading a Docker
image comprising five layers.
@y
The following `docker pull` command shows a Docker host downloading a Docker
image comprising five layers.
@z

@x
```console
$ docker pull ubuntu
@y
```console
$ docker pull ubuntu
@z

@x
Using default tag: latest
latest: Pulling from library/ubuntu
b6f892c0043b: Pull complete
55010f332b04: Pull complete
2955fb827c94: Pull complete
3deef3fcbd30: Pull complete
cf9722e506aa: Pull complete
Digest: sha256:382452f82a8bbd34443b2c727650af46aced0f94a44463c62a9848133ecb1aa8
Status: Downloaded newer image for ubuntu:latest
```
@y
Using default tag: latest
latest: Pulling from library/ubuntu
b6f892c0043b: Pull complete
55010f332b04: Pull complete
2955fb827c94: Pull complete
3deef3fcbd30: Pull complete
cf9722e506aa: Pull complete
Digest: sha256:382452f82a8bbd34443b2c727650af46aced0f94a44463c62a9848133ecb1aa8
Status: Downloaded newer image for ubuntu:latest
```
@z

@x
#### The image layers
@y
#### The image layers
@z

@x
> [!WARNING]: Do not directly manipulate any files or directories within
> `/var/lib/docker/`. These files and directories are managed by Docker.
@y
> [!WARNING]: Do not directly manipulate any files or directories within
> `/var/lib/docker/`. These files and directories are managed by Docker.
@z

@x
All of the information about the image and container layers is stored in
subdirectories of `/var/lib/docker/aufs/`.
@y
All of the information about the image and container layers is stored in
subdirectories of `/var/lib/docker/aufs/`.
@z

@x
- `diff/`: the **contents** of each layer, each stored in a separate
  subdirectory
- `layers/`: metadata about how image layers are stacked. This directory
  contains one file for each image or container layer on the Docker host. Each
  file contains the IDs of all the layers below it in the stack (its parents).
- `mnt/`: Mount points, one per image or container layer, which are used to
  assemble and mount the unified filesystem for a container. For images, which
  are read-only, these directories are always empty.
@y
- `diff/`: the **contents** of each layer, each stored in a separate
  subdirectory
- `layers/`: metadata about how image layers are stacked. This directory
  contains one file for each image or container layer on the Docker host. Each
  file contains the IDs of all the layers below it in the stack (its parents).
- `mnt/`: Mount points, one per image or container layer, which are used to
  assemble and mount the unified filesystem for a container. For images, which
  are read-only, these directories are always empty.
@z

@x
#### The container layer
@y
#### The container layer
@z

@x
If a container is running, the contents of `/var/lib/docker/aufs/` change in the
following ways:
@y
If a container is running, the contents of `/var/lib/docker/aufs/` change in the
following ways:
@z

@x
- `diff/`: Differences introduced in the writable container layer, such as new
   or modified files.
- `layers/`: Metadata about the writable container layer's parent layers.
- `mnt/`: A mount point for each running container's unified filesystem, exactly
  as it appears from within the container.
@y
- `diff/`: Differences introduced in the writable container layer, such as new
   or modified files.
- `layers/`: Metadata about the writable container layer's parent layers.
- `mnt/`: A mount point for each running container's unified filesystem, exactly
  as it appears from within the container.
@z

@x
## How container reads and writes work with `aufs`
@y
## How container reads and writes work with `aufs`
@z

@x
### Reading files
@y
### Reading files
@z

@x
Consider three scenarios where a container opens a file for read access with
aufs.
@y
Consider three scenarios where a container opens a file for read access with
aufs.
@z

@x
- **The file does not exist in the container layer**: If a container opens a
  file for read access and the file does not already exist in the container
  layer, the storage driver searches for the file in the image layers,
  starting with the layer just below the container layer. It is read from the
  layer where it is found.
@y
- **The file does not exist in the container layer**: If a container opens a
  file for read access and the file does not already exist in the container
  layer, the storage driver searches for the file in the image layers,
  starting with the layer just below the container layer. It is read from the
  layer where it is found.
@z

@x
- **The file only exists in the container layer**: If a container opens a file
  for read access and the file exists in the container layer, it is read from
  there.
@y
- **The file only exists in the container layer**: If a container opens a file
  for read access and the file exists in the container layer, it is read from
  there.
@z

@x
- **The file exists in both the container layer and the image layer**: If a
  container opens a file for read access and the file exists in the container
  layer and one or more image layers, the file is read from the container layer.
  Files in the container layer obscure files with the same name in the image
  layers.
@y
- **The file exists in both the container layer and the image layer**: If a
  container opens a file for read access and the file exists in the container
  layer and one or more image layers, the file is read from the container layer.
  Files in the container layer obscure files with the same name in the image
  layers.
@z

@x
### Modifying files or directories
@y
### Modifying files or directories
@z

@x
Consider some scenarios where files in a container are modified.
@y
Consider some scenarios where files in a container are modified.
@z

@x
- **Writing to a file for the first time**: The first time a container writes
  to an existing file, that file does not exist in the container (`upperdir`).
  The `aufs` driver performs a *copy_up* operation to copy the file from the
  image layer where it exists to the writable container layer. The container
  then writes the changes to the new copy of the file in the container layer.
@y
- **Writing to a file for the first time**: The first time a container writes
  to an existing file, that file does not exist in the container (`upperdir`).
  The `aufs` driver performs a *copy_up* operation to copy the file from the
  image layer where it exists to the writable container layer. The container
  then writes the changes to the new copy of the file in the container layer.
@z

@x
  However, AUFS works at the file level rather than the block level. This
  means that all copy_up operations copy the entire file, even if the file is
  very large and only a small part of it is being modified. This can have a
  noticeable impact on container write performance. AUFS can suffer
  noticeable latencies when searching for files in images with many layers.
  However, it is worth noting that the copy_up operation only occurs the first
  time a given file is written to. Subsequent writes to the same file operate
  against the copy of the file already copied up to the container.
@y
  However, AUFS works at the file level rather than the block level. This
  means that all copy_up operations copy the entire file, even if the file is
  very large and only a small part of it is being modified. This can have a
  noticeable impact on container write performance. AUFS can suffer
  noticeable latencies when searching for files in images with many layers.
  However, it is worth noting that the copy_up operation only occurs the first
  time a given file is written to. Subsequent writes to the same file operate
  against the copy of the file already copied up to the container.
@z

@x
- **Deleting files and directories**:
@y
- **Deleting files and directories**:
@z

@x
  - When a _file_ is deleted within a container, a *whiteout* file is created
    in the container layer. The version of the file in the image layer is not
    deleted (because the image layers are read-only). However, the whiteout
    file prevents it from being available to the container.
@y
  - When a _file_ is deleted within a container, a *whiteout* file is created
    in the container layer. The version of the file in the image layer is not
    deleted (because the image layers are read-only). However, the whiteout
    file prevents it from being available to the container.
@z

@x
  - When a _directory_ is deleted within a container, an _opaque file_ is
    created in the container layer. This works in the same way as a
    whiteout file and effectively prevents the directory from being accessed,
    even though it still exists in the image layer.
@y
  - When a _directory_ is deleted within a container, an _opaque file_ is
    created in the container layer. This works in the same way as a
    whiteout file and effectively prevents the directory from being accessed,
    even though it still exists in the image layer.
@z

@x
- **Renaming directories**: Calling `rename(2)` for a directory is not fully
  supported on AUFS. It returns `EXDEV` ("cross-device link not permitted"),
  even when both of the source and the destination path are on a same AUFS
  layer, unless the directory has no children. Your application needs to be
  designed to handle `EXDEV` and fall back to a "copy and unlink" strategy.
@y
- **Renaming directories**: Calling `rename(2)` for a directory is not fully
  supported on AUFS. It returns `EXDEV` ("cross-device link not permitted"),
  even when both of the source and the destination path are on a same AUFS
  layer, unless the directory has no children. Your application needs to be
  designed to handle `EXDEV` and fall back to a "copy and unlink" strategy.
@z

@x
## AUFS and Docker performance
@y
## AUFS and Docker performance
@z

@x
To summarize some of the performance related aspects already mentioned:
@y
To summarize some of the performance related aspects already mentioned:
@z

@x
- The AUFS storage driver is less performant than the `overlay2` driver, but is
  a good choice for PaaS and other similar use-cases where container density is
  important. This is because AUFS efficiently shares images between multiple
  running containers, enabling fast container start times and minimal use of
  disk space.
@y
- The AUFS storage driver is less performant than the `overlay2` driver, but is
  a good choice for PaaS and other similar use-cases where container density is
  important. This is because AUFS efficiently shares images between multiple
  running containers, enabling fast container start times and minimal use of
  disk space.
@z

@x
- The underlying mechanics of how AUFS shares files between image layers and
  containers uses the page cache very efficiently.
@y
- The underlying mechanics of how AUFS shares files between image layers and
  containers uses the page cache very efficiently.
@z

@x
- The AUFS storage driver can introduce significant latencies into container
  write performance. This is because the first time a container writes to any
  file, the file needs to be located and copied into the containers top writable
  layer. These latencies increase and are compounded when these files exist below
  many image layers and the files themselves are large.
@y
- The AUFS storage driver can introduce significant latencies into container
  write performance. This is because the first time a container writes to any
  file, the file needs to be located and copied into the containers top writable
  layer. These latencies increase and are compounded when these files exist below
  many image layers and the files themselves are large.
@z

@x
### Performance best practices
@y
### Performance best practices
@z

@x
The following generic performance best practices also apply to AUFS.
@y
The following generic performance best practices also apply to AUFS.
@z

@x
- **Solid State Devices (SSD)** provide faster reads and writes than spinning
  disks.
@y
- **Solid State Devices (SSD)** provide faster reads and writes than spinning
  disks.
@z

@x
- **Use volumes for write-heavy workloads**: Volumes provide the best and most
  predictable performance for write-heavy workloads. This is because they bypass
  the storage driver and do not incur any of the potential overheads introduced
  by thin provisioning and copy-on-write. Volumes have other benefits, such as
  allowing you to share data among containers and persisting even when no
  running container is using them.
@y
- **Use volumes for write-heavy workloads**: Volumes provide the best and most
  predictable performance for write-heavy workloads. This is because they bypass
  the storage driver and do not incur any of the potential overheads introduced
  by thin provisioning and copy-on-write. Volumes have other benefits, such as
  allowing you to share data among containers and persisting even when no
  running container is using them.
@z

@x
## Related information
@y
## Related information
@z

@x
- [Volumes](../volumes.md)
- [Understand images, containers, and storage drivers](index.md)
- [Select a storage driver](select-storage-driver.md)
@y
- [Volumes](../volumes.md)
- [Understand images, containers, and storage drivers](index.md)
- [Select a storage driver](select-storage-driver.md)
@z
