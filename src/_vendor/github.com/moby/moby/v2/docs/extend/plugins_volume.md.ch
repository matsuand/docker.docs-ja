%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Docker volume plugins
description: "How to manage data with external volume plugins"
keywords: "Examples, Usage, volume, docker, data, volumes, plugin, api"
@y
title: Docker volume plugins
description: "How to manage data with external volume plugins"
keywords: "Examples, Usage, volume, docker, data, volumes, plugin, api"
@z

@x
Docker Engine volume plugins enable Engine deployments to be integrated with
external storage systems such as Amazon EBS, and enable data volumes to persist
beyond the lifetime of a single Docker host. See the
[plugin documentation](legacy_plugins.md) for more information.
@y
Docker Engine volume plugins enable Engine deployments to be integrated with
external storage systems such as Amazon EBS, and enable data volumes to persist
beyond the lifetime of a single Docker host. See the
[plugin documentation](legacy_plugins.md) for more information.
@z

@x
## Changelog
@y
## Changelog
@z

@x
### 1.13.0
@y
### 1.13.0
@z

@x
- If used as part of the v2 plugin architecture, mountpoints that are part of
  paths returned by the plugin must be mounted under the directory specified by
  `PropagatedMount` in the plugin configuration
  ([#26398](https://github.com/docker/docker/pull/26398))
@y
- If used as part of the v2 plugin architecture, mountpoints that are part of
  paths returned by the plugin must be mounted under the directory specified by
  `PropagatedMount` in the plugin configuration
  ([#26398](https://github.com/docker/docker/pull/26398))
@z

@x
### 1.12.0
@y
### 1.12.0
@z

@x
- Add `Status` field to `VolumeDriver.Get` response
  ([#21006](https://github.com/docker/docker/pull/21006#))
- Add `VolumeDriver.Capabilities` to get capabilities of the volume driver
  ([#22077](https://github.com/docker/docker/pull/22077))
@y
- Add `Status` field to `VolumeDriver.Get` response
  ([#21006](https://github.com/docker/docker/pull/21006#))
- Add `VolumeDriver.Capabilities` to get capabilities of the volume driver
  ([#22077](https://github.com/docker/docker/pull/22077))
@z

@x
### 1.10.0
@y
### 1.10.0
@z

@x
- Add `VolumeDriver.Get` which gets the details about the volume
  ([#16534](https://github.com/docker/docker/pull/16534))
- Add `VolumeDriver.List` which lists all volumes owned by the driver
  ([#16534](https://github.com/docker/docker/pull/16534))
@y
- Add `VolumeDriver.Get` which gets the details about the volume
  ([#16534](https://github.com/docker/docker/pull/16534))
- Add `VolumeDriver.List` which lists all volumes owned by the driver
  ([#16534](https://github.com/docker/docker/pull/16534))
@z

@x
### 1.8.0
@y
### 1.8.0
@z

@x
- Initial support for volume driver plugins
  ([#14659](https://github.com/docker/docker/pull/14659))
@y
- Initial support for volume driver plugins
  ([#14659](https://github.com/docker/docker/pull/14659))
@z

@x
## Command-line changes
@y
## Command-line changes
@z

@x
To give a container access to a volume, use the `--volume` and `--volume-driver`
flags on the `docker container run` command. The `--volume` (or `-v`) flag
accepts a volume name and path on the host, and the `--volume-driver` flag
accepts a driver type.
@y
To give a container access to a volume, use the `--volume` and `--volume-driver`
flags on the `docker container run` command. The `--volume` (or `-v`) flag
accepts a volume name and path on the host, and the `--volume-driver` flag
accepts a driver type.
@z

% snip command...

@x
### `--volume`
@y
### `--volume`
@z

@x
The `--volume` (or `-v`) flag takes a value that is in the format
`<volume_name>:<mountpoint>`. The two parts of the value are
separated by a colon (`:`) character.
@y
The `--volume` (or `-v`) flag takes a value that is in the format
`<volume_name>:<mountpoint>`. The two parts of the value are
separated by a colon (`:`) character.
@z

@x
- The volume name is a human-readable name for the volume, and cannot begin with
  a `/` character. It is referred to as `volume_name` in the rest of this topic.
- The `Mountpoint` is the path on the host (v1) or in the plugin (v2) where the
  volume has been made available.
@y
- The volume name is a human-readable name for the volume, and cannot begin with
  a `/` character. It is referred to as `volume_name` in the rest of this topic.
- The `Mountpoint` is the path on the host (v1) or in the plugin (v2) where the
  volume has been made available.
@z

@x
### `--volume-driver`
@y
### `--volume-driver`
@z

@x
Specifying the `--volume-driver` flag together with a volume name (using
`--volume`) allows you to use plugins to manage volumes for the container.
@y
Specifying the `--volume-driver` flag together with a volume name (using
`--volume`) allows you to use plugins to manage volumes for the container.
@z

@x
The `--volume-driver` flag is used as a default for all volumes created for
the container, including anonymous volumes. Use the [`--mount`] flag with
the [`volume-driver`] option to specify the driver to use for each volume
individually.
@y
The `--volume-driver` flag is used as a default for all volumes created for
the container, including anonymous volumes. Use the [`--mount`] flag with
the [`volume-driver`] option to specify the driver to use for each volume
individually.
@z

@x
[`--mount`]: https://docs.docker.com/reference/cli/docker/container/run/#mount
[`volume-driver`]: https://docs.docker.com/engine/storage/volumes/#start-a-container-which-creates-a-volume-using-a-volume-driver
@y
[`--mount`]: https://docs.docker.com/reference/cli/docker/container/run/#mount
[`volume-driver`]: https://docs.docker.com/engine/storage/volumes/#start-a-container-which-creates-a-volume-using-a-volume-driver
@z

@x
## Create a VolumeDriver
@y
## Create a VolumeDriver
@z

@x
The container creation endpoint (`/containers/create`) accepts a `VolumeDriver`
field of type `string` allowing to specify the name of the driver. If not
specified, it defaults to `"local"` (the default driver for local volumes).
@y
The container creation endpoint (`/containers/create`) accepts a `VolumeDriver`
field of type `string` allowing to specify the name of the driver. If not
specified, it defaults to `"local"` (the default driver for local volumes).
@z

@x
## Volume plugin protocol
@y
## Volume plugin protocol
@z

@x
If a plugin registers itself as a `VolumeDriver` when activated, it must
provide the Docker Daemon with writeable paths on the host filesystem. The Docker
daemon provides these paths to containers to consume. The Docker daemon makes
the volumes available by bind-mounting the provided paths into the containers.
@y
If a plugin registers itself as a `VolumeDriver` when activated, it must
provide the Docker Daemon with writeable paths on the host filesystem. The Docker
daemon provides these paths to containers to consume. The Docker daemon makes
the volumes available by bind-mounting the provided paths into the containers.
@z

@x
> [!NOTE]
> Volume plugins should *not* write data to the `/var/lib/docker/` directory,
> including `/var/lib/docker/volumes`. The `/var/lib/docker/` directory is
> reserved for Docker.
@y
> [!NOTE]
> Volume plugins should *not* write data to the `/var/lib/docker/` directory,
> including `/var/lib/docker/volumes`. The `/var/lib/docker/` directory is
> reserved for Docker.
@z

@x
### `/VolumeDriver.Create`
@y
### `/VolumeDriver.Create`
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Instruct the plugin that the user wants to create a volume, given a user
specified volume name. The plugin does not need to actually manifest the
volume on the filesystem yet (until `Mount` is called).
`Opts` is a map of driver specific options passed through from the user request.
@y
Instruct the plugin that the user wants to create a volume, given a user
specified volume name. The plugin does not need to actually manifest the
volume on the filesystem yet (until `Mount` is called).
`Opts` is a map of driver specific options passed through from the user request.
@z

@x
Response:
@y
Response:
@z

% snip code...

@x
  Respond with a string error if an error occurred.
@y
  Respond with a string error if an error occurred.
@z

@x
### `/VolumeDriver.Remove`
@y
### `/VolumeDriver.Remove`
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Delete the specified volume from disk. This request is issued when a user
invokes `docker rm -v` to remove volumes associated with a container.
@y
Delete the specified volume from disk. This request is issued when a user
invokes `docker rm -v` to remove volumes associated with a container.
@z

@x
Response:
@y
Response:
@z

% snip code...

@x
Respond with a string error if an error occurred.
@y
Respond with a string error if an error occurred.
@z

@x
### `/VolumeDriver.Mount`
@y
### `/VolumeDriver.Mount`
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Docker requires the plugin to provide a volume, given a user specified volume
name. `Mount` is called once per container start. If the same `volume_name` is requested
more than once, the plugin may need to keep track of each new mount request and provision
at the first mount request and deprovision at the last corresponding unmount request.
@y
Docker requires the plugin to provide a volume, given a user specified volume
name. `Mount` is called once per container start. If the same `volume_name` is requested
more than once, the plugin may need to keep track of each new mount request and provision
at the first mount request and deprovision at the last corresponding unmount request.
@z

@x
`ID` is a unique ID for the caller that is requesting the mount.
@y
`ID` is a unique ID for the caller that is requesting the mount.
@z

@x
Response:
@y
Response:
@z

@x
- v1
@y
- v1
@z

% snip code...

@x
- v2
@y
- v2
@z

% snip code...

@x
`Mountpoint` is the path on the host (v1) or in the plugin (v2) where the volume
has been made available.
@y
`Mountpoint` is the path on the host (v1) or in the plugin (v2) where the volume
has been made available.
@z

@x
`Err` is either empty or contains an error string.
@y
`Err` is either empty or contains an error string.
@z

@x
### `/VolumeDriver.Path`
@y
### `/VolumeDriver.Path`
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Request the path to the volume with the given `volume_name`.
@y
Request the path to the volume with the given `volume_name`.
@z

@x
Response:
@y
Response:
@z

@x
- v1
@y
- v1
@z

% snip code...

@x
- v2
@y
- v2
@z

% snip code...

@x
Respond with the path on the host (v1) or inside the plugin (v2) where the
volume has been made available, and/or a string error if an error occurred.
@y
Respond with the path on the host (v1) or inside the plugin (v2) where the
volume has been made available, and/or a string error if an error occurred.
@z

@x
`Mountpoint` is optional. However, the plugin may be queried again later if one
is not provided.
@y
`Mountpoint` is optional. However, the plugin may be queried again later if one
is not provided.
@z

@x
### `/VolumeDriver.Unmount`
@y
### `/VolumeDriver.Unmount`
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Docker is no longer using the named volume. `Unmount` is called once per
container stop. Plugin may deduce that it is safe to deprovision the volume at
this point.
@y
Docker is no longer using the named volume. `Unmount` is called once per
container stop. Plugin may deduce that it is safe to deprovision the volume at
this point.
@z

@x
`ID` is a unique ID for the caller that is requesting the mount.
@y
`ID` is a unique ID for the caller that is requesting the mount.
@z

@x
Response:
@y
Response:
@z

% snip code...

@x
Respond with a string error if an error occurred.
@y
Respond with a string error if an error occurred.
@z

@x
### `/VolumeDriver.Get`
@y
### `/VolumeDriver.Get`
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Get info about `volume_name`.
@y
Get info about `volume_name`.
@z

@x
Response:
@y
Response:
@z

@x
- v1
@y
- v1
@z

% snip code...

@x
- v2
@y
- v2
@z

% snip code...

@x
Respond with a string error if an error occurred. `Mountpoint` and `Status` are
optional.
@y
Respond with a string error if an error occurred. `Mountpoint` and `Status` are
optional.
@z

@x
### /VolumeDriver.List
@y
### /VolumeDriver.List
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Get the list of volumes registered with the plugin.
@y
Get the list of volumes registered with the plugin.
@z

@x
Response:
@y
Response:
@z

@x
- v1
@y
- v1
@z

% snip code...

@x
- v2
@y
- v2
@z

% snip code...

@x
Respond with a string error if an error occurred. `Mountpoint` is optional.
@y
Respond with a string error if an error occurred. `Mountpoint` is optional.
@z

@x
### /VolumeDriver.Capabilities
@y
### /VolumeDriver.Capabilities
@z

@x
Request:
@y
Request:
@z

% snip code...

@x
Get the list of capabilities the driver supports.
@y
Get the list of capabilities the driver supports.
@z

@x
The driver is not required to implement `Capabilities`. If it is not
implemented, the default values are used.
@y
The driver is not required to implement `Capabilities`. If it is not
implemented, the default values are used.
@z

@x
Response:
@y
Response:
@z

% snip code...

@x
Supported scopes are `global` and `local`. Any other value in `Scope` will be
ignored, and `local` is used. `Scope` allows cluster managers to handle the
volume in different ways. For instance, a scope of `global`, signals to the
cluster manager that it only needs to create the volume once instead of on each
Docker host. More capabilities may be added in the future.
@y
Supported scopes are `global` and `local`. Any other value in `Scope` will be
ignored, and `local` is used. `Scope` allows cluster managers to handle the
volume in different ways. For instance, a scope of `global`, signals to the
cluster manager that it only needs to create the volume once instead of on each
Docker host. More capabilities may be added in the future.
@z
