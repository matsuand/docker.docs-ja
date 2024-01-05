%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How to manage data with external volume plugins"
keywords: "Examples, Usage, volume, docker, data, volumes, plugin, api"
---
@y
---
description: "How to manage data with external volume plugins"
keywords: "Examples, Usage, volume, docker, data, volumes, plugin, api"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# Docker volume plugins
@y
# Docker volume plugins
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
flags on the `docker container run` command.  The `--volume` (or `-v`) flag
accepts a volume name and path on the host, and the `--volume-driver` flag
accepts a driver type.
@y
To give a container access to a volume, use the `--volume` and `--volume-driver`
flags on the `docker container run` command.  The `--volume` (or `-v`) flag
accepts a volume name and path on the host, and the `--volume-driver` flag
accepts a driver type.
@z

@x
```console
$ docker volume create --driver=flocker volumename
@y
```console
$ docker volume create --driver=flocker volumename
@z

@x
$ docker container run -it --volume volumename:/data busybox sh
```
@y
$ docker container run -it --volume volumename:/data busybox sh
```
@z

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
### `volumedriver`
@y
### `volumedriver`
@z

@x
Specifying a `volumedriver` in conjunction with a `volumename` allows you to
use plugins such as [Flocker](https://github.com/ScatterHQ/flocker) to manage
volumes external to a single host, such as those on EBS.
@y
Specifying a `volumedriver` in conjunction with a `volumename` allows you to
use plugins such as [Flocker](https://github.com/ScatterHQ/flocker) to manage
volumes external to a single host, such as those on EBS.
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
> **Note**
>
> Volume plugins should *not* write data to the `/var/lib/docker/` directory,
> including `/var/lib/docker/volumes`. The `/var/lib/docker/` directory is
> reserved for Docker.
@y
> **Note**
>
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
**Request**:
```json
{
    "Name": "volume_name",
    "Opts": {}
}
```
@y
**Request**:
```json
{
    "Name": "volume_name",
    "Opts": {}
}
```
@z

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
**Response**:
```json
{
    "Err": ""
}
```
@y
**Response**:
```json
{
    "Err": ""
}
```
@z

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
**Request**:
```json
{
    "Name": "volume_name"
}
```
@y
**Request**:
```json
{
    "Name": "volume_name"
}
```
@z

@x
Delete the specified volume from disk. This request is issued when a user
invokes `docker rm -v` to remove volumes associated with a container.
@y
Delete the specified volume from disk. This request is issued when a user
invokes `docker rm -v` to remove volumes associated with a container.
@z

@x
**Response**:
```json
{
    "Err": ""
}
```
@y
**Response**:
```json
{
    "Err": ""
}
```
@z

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
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@y
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@z

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
**Response**:
@y
**Response**:
@z

@x
- **v1**:
@y
- **v1**:
@z

@x
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
- **v2**:
@z

@x
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@z

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
**Request**:
@y
**Request**:
@z

@x
```json
{
    "Name": "volume_name"
}
```
@y
```json
{
    "Name": "volume_name"
}
```
@z

@x
Request the path to the volume with the given `volume_name`.
@y
Request the path to the volume with the given `volume_name`.
@z

@x
**Response**:
@y
**Response**:
@z

@x
- **v1**:
@y
- **v1**:
@z

@x
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
- **v2**:
@z

@x
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@z

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
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@y
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@z

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
**Response**:
```json
{
    "Err": ""
}
```
@y
**Response**:
```json
{
    "Err": ""
}
```
@z

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
**Request**:
```json
{
    "Name": "volume_name"
}
```
@y
**Request**:
```json
{
    "Name": "volume_name"
}
```
@z

@x
Get info about `volume_name`.
@y
Get info about `volume_name`.
@z

@x
**Response**:
@y
**Response**:
@z

@x
- **v1**:
@y
- **v1**:
@z

@x
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/to/directory/on/host",
      "Status": {}
    },
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/to/directory/on/host",
      "Status": {}
    },
    "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
- **v2**:
@z

@x
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/under/PropagatedMount",
      "Status": {}
    },
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/under/PropagatedMount",
      "Status": {}
    },
    "Err": ""
  }
  ```
@z

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
**Request**:
```json
{}
```
@y
**Request**:
```json
{}
```
@z

@x
Get the list of volumes registered with the plugin.
@y
Get the list of volumes registered with the plugin.
@z

@x
**Response**:
@y
**Response**:
@z

@x
- **v1**:
@y
- **v1**:
@z

@x
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/to/directory/on/host"
      }
    ],
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/to/directory/on/host"
      }
    ],
    "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
- **v2**:
@z

@x
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/under/PropagatedMount"
      }
    ],
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/under/PropagatedMount"
      }
    ],
    "Err": ""
  }
  ```
@z

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
**Request**:
```json
{}
```
@y
**Request**:
```json
{}
```
@z

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
**Response**:
```json
{
  "Capabilities": {
    "Scope": "global"
  }
}
```
@y
**Response**:
```json
{
  "Capabilities": {
    "Scope": "global"
  }
}
```
@z

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
