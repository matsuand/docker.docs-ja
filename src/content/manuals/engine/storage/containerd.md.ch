%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: containerd image store with Docker Engine
linkTitle: containerd image store
@y
title: containerd image store with Docker Engine
linkTitle: containerd image store
@z

@x
keywords: containerd, snapshotters, image store, docker engine
description: Learn about the containerd image store
@y
keywords: containerd, snapshotters, image store, docker engine
description: Learn about the containerd image store
@z

@x
The containerd image store is the default storage backend for Docker Engine
29.0 and later on fresh installations. If you upgraded from an earlier version,
your daemon continues using the legacy graph drivers (overlay2) until you
enable the containerd image store.
@y
The containerd image store is the default storage backend for Docker Engine
29.0 and later on fresh installations. If you upgraded from an earlier version,
your daemon continues using the legacy graph drivers (overlay2) until you
enable the containerd image store.
@z

@x
containerd, the industry-standard container runtime, uses snapshotters instead
of classic storage drivers for storing image and container data.
@y
containerd, the industry-standard container runtime, uses snapshotters instead
of classic storage drivers for storing image and container data.
@z

@x
> [!NOTE]
> The containerd image store is not available when using user namespace
> remapping (`userns-remap`). See
> [moby#47377](https://github.com/moby/moby/issues/47377) for details.
@y
> [!NOTE]
> The containerd image store is not available when using user namespace
> remapping (`userns-remap`). See
> [moby#47377](https://github.com/moby/moby/issues/47377) for details.
@z

@x
## Why use the containerd image store
@y
## Why use the containerd image store
@z

@x
The containerd image store uses snapshotters to manage how image layers are
stored and accessed on the filesystem. This differs from the classic graph
drivers like overlay2.
@y
The containerd image store uses snapshotters to manage how image layers are
stored and accessed on the filesystem. This differs from the classic graph
drivers like overlay2.
@z

@x
The containerd image store enables:
@y
The containerd image store enables:
@z

@x
- Building and storing multi-platform images locally. With classic storage
  drivers, you need external builders for multi-platform images.
- Working with images that include attestations (provenance, SBOM). These use
  image indices that the classic store doesn't support.
- Running Wasm containers. The containerd image store supports WebAssembly
  workloads.
- Using advanced snapshotters. containerd supports pluggable snapshotters that
  provide features like lazy-pulling of images (stargz) or peer-to-peer image
  distribution (nydus, dragonfly).
@y
- Building and storing multi-platform images locally. With classic storage
  drivers, you need external builders for multi-platform images.
- Working with images that include attestations (provenance, SBOM). These use
  image indices that the classic store doesn't support.
- Running Wasm containers. The containerd image store supports WebAssembly
  workloads.
- Using advanced snapshotters. containerd supports pluggable snapshotters that
  provide features like lazy-pulling of images (stargz) or peer-to-peer image
  distribution (nydus, dragonfly).
@z

@x
For most users, switching to the containerd image store is transparent. The
storage backend changes, but your workflows remain the same.
@y
For most users, switching to the containerd image store is transparent. The
storage backend changes, but your workflows remain the same.
@z

@x
## Disk space usage
@y
## Disk space usage
@z

@x
The containerd image store uses more disk space than the legacy storage
drivers for the same images. This is because containerd stores images in both
compressed and uncompressed formats, while the legacy drivers stored only the
uncompressed layers.
@y
The containerd image store uses more disk space than the legacy storage
drivers for the same images. This is because containerd stores images in both
compressed and uncompressed formats, while the legacy drivers stored only the
uncompressed layers.
@z

@x
When you pull an image, containerd keeps the compressed layers (as received
from the registry) and also extracts them to disk. This dual storage means
each layer occupies more space. The compressed format enables faster pulls and
pushes, but requires additional disk capacity.
@y
When you pull an image, containerd keeps the compressed layers (as received
from the registry) and also extracts them to disk. This dual storage means
each layer occupies more space. The compressed format enables faster pulls and
pushes, but requires additional disk capacity.
@z

@x
This difference is particularly noticeable with multiple images sharing the
same base layers. With legacy storage drivers, shared base layers were stored
once locally, and reused images that depended on them. With containerd, each
image stores its own compressed version of shared layers, even though the
uncompressed layers are still de-duplicated through snapshotters. The
compressed storage adds overhead proportional to the number of images using
those layers.
@y
This difference is particularly noticeable with multiple images sharing the
same base layers. With legacy storage drivers, shared base layers were stored
once locally, and reused images that depended on them. With containerd, each
image stores its own compressed version of shared layers, even though the
uncompressed layers are still de-duplicated through snapshotters. The
compressed storage adds overhead proportional to the number of images using
those layers.
@z

@x
If disk space is constrained, consider the following:
@y
If disk space is constrained, consider the following:
@z

@x
- Regularly prune unused images with `docker image prune`
- Use `docker system df` to monitor disk usage
- [Configure the data directory](../daemon/_index.md#configure-the-data-directory-location)
  to use a partition with adequate space
@y
- Regularly prune unused images with `docker image prune`
- Use `docker system df` to monitor disk usage
- [Configure the data directory](../daemon/_index.md#configure-the-data-directory-location)
  to use a partition with adequate space
@z

@x
## Enable containerd image store on Docker Engine
@y
## Enable containerd image store on Docker Engine
@z

@x
If you're upgrading from an earlier Docker Engine version, you need to manually
enable the containerd image store.
@y
If you're upgrading from an earlier Docker Engine version, you need to manually
enable the containerd image store.
@z

@x
> [!IMPORTANT]
> Switching storage backends temporarily hides images and containers created
> with the other backend. Your data remains on disk. To access the old images
> again, switch back to your previous storage configuration.
@y
> [!IMPORTANT]
> Switching storage backends temporarily hides images and containers created
> with the other backend. Your data remains on disk. To access the old images
> again, switch back to your previous storage configuration.
@z

@x
Add the following configuration to your `/etc/docker/daemon.json` file:
@y
Add the following configuration to your `/etc/docker/daemon.json` file:
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
Save the file and restart the daemon:
@y
Save the file and restart the daemon:
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
After restarting the daemon, verify you're using the containerd image store:
@y
After restarting the daemon, verify you're using the containerd image store:
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

@x
> [!NOTE]
> When you enable the containerd image store, existing images and containers
> from the overlay2 driver remain on disk but become hidden. They reappear if
> you switch back to overlay2. To use your existing images with the containerd
> image store, push them to a registry first, or use `docker save` to export
> them.
@y
> [!NOTE]
> When you enable the containerd image store, existing images and containers
> from the overlay2 driver remain on disk but become hidden. They reappear if
> you switch back to overlay2. To use your existing images with the containerd
> image store, push them to a registry first, or use `docker save` to export
> them.
@z

@x
## Experimental automatic migration
@y
## Experimental automatic migration
@z

@x
Docker Engine includes an experimental feature that can automatically switch to
the containerd image store under certain conditions. **This feature is
experimental**. It's provided for those who want to test it, but [starting
fresh](#enable-containerd-image-store-on-docker-engine) is the recommended
approach.
@y
Docker Engine includes an experimental feature that can automatically switch to
the containerd image store under certain conditions. **This feature is
experimental**. It's provided for those who want to test it, but [starting
fresh](#enable-containerd-image-store-on-docker-engine) is the recommended
approach.
@z

@x
> [!CAUTION]
> The automatic migration feature is experimental and may not work reliably in
> all scenarios. Create backups before attempting to use it.
@y
> [!CAUTION]
> The automatic migration feature is experimental and may not work reliably in
> all scenarios. Create backups before attempting to use it.
@z

@x
To enable automatic migration, add the `containerd-migration` feature to your
`/etc/docker/daemon.json`:
@y
To enable automatic migration, add the `containerd-migration` feature to your
`/etc/docker/daemon.json`:
@z

@x
```json
{
  "features": {
    "containerd-migration": true
  }
}
```
@y
```json
{
  "features": {
    "containerd-migration": true
  }
}
```
@z

@x
You can also set the `DOCKER_MIGRATE_SNAPSHOTTER_THRESHOLD` environment
variable to make the daemon switch automatically if you have no containers and
your image count is at or below the threshold. For systemd:
@y
You can also set the `DOCKER_MIGRATE_SNAPSHOTTER_THRESHOLD` environment
variable to make the daemon switch automatically if you have no containers and
your image count is at or below the threshold. For systemd:
@z

@x
```console
$ sudo systemctl edit docker.service
```
@y
```console
$ sudo systemctl edit docker.service
```
@z

@x
Add:
@y
Add:
@z

@x
```ini
[Service]
Environment="DOCKER_MIGRATE_SNAPSHOTTER_THRESHOLD=5"
```
@y
```ini
[Service]
Environment="DOCKER_MIGRATE_SNAPSHOTTER_THRESHOLD=5"
```
@z

@x
If you have no running or stopped containers and 5 or fewer images, the daemon
switches to the containerd image store on restart. Your overlay2 data remains
on disk but becomes hidden.
@y
If you have no running or stopped containers and 5 or fewer images, the daemon
switches to the containerd image store on restart. Your overlay2 data remains
on disk but becomes hidden.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
To learn more about the containerd image store and its capabilities in Docker
Desktop, see
[containerd image store on Docker Desktop](/manuals/desktop/features/containerd.md).
@y
To learn more about the containerd image store and its capabilities in Docker
Desktop, see
[containerd image store on Docker Desktop](manuals/desktop/features/containerd.md).
@z
