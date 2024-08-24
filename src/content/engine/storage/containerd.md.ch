%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: containerd image store with Docker Engine
keywords: containerd, snapshotters, image store, docker engine
description: Learn how to enable the containerd image store on Docker Engine
@y
title: containerd image store with Docker Engine
keywords: containerd, snapshotters, image store, docker engine
description: Learn how to enable the containerd image store on Docker Engine
@z

@x
> [!NOTE]
>
> The containerd image store is an experimental feature of Docker Engine.
> If you're using Docker Desktop, refer to the instructions on the
> [containerd image store with Docker Desktop page](/desktop/containerd.md).
@y
> [!NOTE]
>
> The containerd image store is an experimental feature of Docker Engine.
> If you're using Docker Desktop, refer to the instructions on the
> [containerd image store with Docker Desktop page](desktop/containerd.md).
@z

@x
containerd, the industry-standard container runtime, uses snapshotters instead
of the classic storage drivers for storing image and container data.
While the `overlay2` driver still remains the default driver for Docker Engine,
you can opt in to using containerd snapshotters as an experimental feature.
@y
containerd, the industry-standard container runtime, uses snapshotters instead
of the classic storage drivers for storing image and container data.
While the `overlay2` driver still remains the default driver for Docker Engine,
you can opt in to using containerd snapshotters as an experimental feature.
@z

@x
To learn more about the containerd image store and its benefits, refer to
[containerd image store on Docker Desktop](/desktop/containerd.md).
@y
To learn more about the containerd image store and its benefits, refer to
[containerd image store on Docker Desktop](desktop/containerd.md).
@z

@x
## Enable containerd image store on Docker Engine
@y
## Enable containerd image store on Docker Engine
@z

@x
Switching to containerd snapshotters causes you to temporarily lose images and
containers created using the classic storage drivers.
Those resources still exist on your filesystem, and you can retrieve them by
turning off the containerd snapshotters feature.
@y
Switching to containerd snapshotters causes you to temporarily lose images and
containers created using the classic storage drivers.
Those resources still exist on your filesystem, and you can retrieve them by
turning off the containerd snapshotters feature.
@z

@x
The following steps explain how to enable the containerd snapshotters feature.
@y
The following steps explain how to enable the containerd snapshotters feature.
@z

@x
1. Add the following configuration to your `/etc/docker/daemon.json`
   configuration file:
@y
1. Add the following configuration to your `/etc/docker/daemon.json`
   configuration file:
@z

@x
   ```json
   {
     "features": {
       "containerd-snapshotter": true
     }
   }
   ```
@y
   ```json
   {
     "features": {
       "containerd-snapshotter": true
     }
   }
   ```
@z

@x
2. Save the file.
3. Restart the daemon for the changes to take effect.
@y
2. Save the file.
3. Restart the daemon for the changes to take effect.
@z

@x
   ```console
   $ sudo systemctl restart docker
   ```
@y
   ```console
   $ sudo systemctl restart docker
   ```
@z

@x
After restarting the daemon, running `docker info` shows that you're using
containerd snapshotter storage drivers.
@y
After restarting the daemon, running `docker info` shows that you're using
containerd snapshotter storage drivers.
@z

@x
```console
$ docker info -f '{{ .DriverStatus }}'
[[driver-type io.containerd.snapshotter.v1]]
```
@y
```console
$ docker info -f '{{ .DriverStatus }}'
[[driver-type io.containerd.snapshotter.v1]]
```
@z

@x
Docker Engine uses the `overlayfs` containerd snapshotter by default.
@y
Docker Engine uses the `overlayfs` containerd snapshotter by default.
@z
