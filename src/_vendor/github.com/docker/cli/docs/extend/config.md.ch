%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How to develop and use a plugin with the managed plugin system"
keywords: "API, Usage, plugins, documentation, developer"
title: Plugin Config Version 1 of Plugin V2
---
@y
---
description: "How to develop and use a plugin with the managed plugin system"
keywords: "API, Usage, plugins, documentation, developer"
title: Plugin Config Version 1 of Plugin V2
---
@z

@x
This document outlines the format of the V0 plugin configuration.
@y
This document outlines the format of the V0 plugin configuration.
@z

@x
Plugin configs describe the various constituents of a Docker engine plugin.
Plugin configs can be serialized to JSON format with the following media types:
@y
Plugin configs describe the various constituents of a Docker engine plugin.
Plugin configs can be serialized to JSON format with the following media types:
@z

@x
| Config Type | Media Type                              |
|-------------|-----------------------------------------|
| config      | `application/vnd.docker.plugin.v1+json` |
@y
| Config Type | Media Type                              |
|-------------|-----------------------------------------|
| config      | `application/vnd.docker.plugin.v1+json` |
@z

@x
## Config Field Descriptions
@y
## Config Field Descriptions
@z

@x
Config provides the base accessible fields for working with V0 plugin format in
the registry.
@y
Config provides the base accessible fields for working with V0 plugin format in
the registry.
@z

@x
- `description` string
@y
- `description` string
@z

@x
  Description of the plugin
@y
  Description of the plugin
@z

@x
- `documentation` string
@y
- `documentation` string
@z

@x
  Link to the documentation about the plugin
@y
  Link to the documentation about the plugin
@z

@x
- `interface` PluginInterface
@y
- `interface` PluginInterface
@z

@x
  Interface implemented by the plugins, struct consisting of the following fields:
@y
  Interface implemented by the plugins, struct consisting of the following fields:
@z

@x
  - `types` string array
@y
  - `types` string array
@z

@x
    Types indicate what interface(s) the plugin currently implements.
@y
    Types indicate what interface(s) the plugin currently implements.
@z

@x
    Supported types:
@y
    Supported types:
@z

@x
    - `docker.volumedriver/1.0`
@y
    - `docker.volumedriver/1.0`
@z

@x
    - `docker.networkdriver/1.0`
@y
    - `docker.networkdriver/1.0`
@z

@x
    - `docker.ipamdriver/1.0`
@y
    - `docker.ipamdriver/1.0`
@z

@x
    - `docker.authz/1.0`
@y
    - `docker.authz/1.0`
@z

@x
    - `docker.logdriver/1.0`
@y
    - `docker.logdriver/1.0`
@z

@x
    - `docker.metricscollector/1.0`
@y
    - `docker.metricscollector/1.0`
@z

@x
  - `socket` string
@y
  - `socket` string
@z

@x
    Socket is the name of the socket the engine should use to communicate with the plugins.
    the socket will be created in `/run/docker/plugins`.
@y
    Socket is the name of the socket the engine should use to communicate with the plugins.
    the socket will be created in `/run/docker/plugins`.
@z

@x
- `entrypoint` string array
@y
- `entrypoint` string array
@z

@x
   Entrypoint of the plugin, see [`ENTRYPOINT`](https://docs.docker.com/reference/dockerfile/#entrypoint)
@y
   Entrypoint of the plugin, see [`ENTRYPOINT`](https://docs.docker.com/reference/dockerfile/#entrypoint)
@z

@x
- `workdir` string
@y
- `workdir` string
@z

@x
   Working directory of the plugin, see [`WORKDIR`](https://docs.docker.com/reference/dockerfile/#workdir)
@y
   Working directory of the plugin, see [`WORKDIR`](https://docs.docker.com/reference/dockerfile/#workdir)
@z

@x
- `network` PluginNetwork
@y
- `network` PluginNetwork
@z

@x
  Network of the plugin, struct consisting of the following fields:
@y
  Network of the plugin, struct consisting of the following fields:
@z

@x
  - `type` string
@y
  - `type` string
@z

@x
    Network type.
@y
    Network type.
@z

@x
    Supported types:
@y
    Supported types:
@z

@x
    - `bridge`
    - `host`
    - `none`
@y
    - `bridge`
    - `host`
    - `none`
@z

@x
- `mounts` PluginMount array
@y
- `mounts` PluginMount array
@z

@x
  Mount of the plugin, struct consisting of the following fields.
  See [`MOUNTS`](https://github.com/opencontainers/runtime-spec/blob/master/config.md#mounts).
@y
  Mount of the plugin, struct consisting of the following fields.
  See [`MOUNTS`](https://github.com/opencontainers/runtime-spec/blob/master/config.md#mounts).
@z

@x
  - `name` string
@y
  - `name` string
@z

@x
    Name of the mount.
@y
    Name of the mount.
@z

@x
  - `description` string
@y
  - `description` string
@z

@x
    Description of the mount.
@y
    Description of the mount.
@z

@x
  - `source` string
@y
  - `source` string
@z

@x
    Source of the mount.
@y
    Source of the mount.
@z

@x
  - `destination` string
@y
  - `destination` string
@z

@x
    Destination of the mount.
@y
    Destination of the mount.
@z

@x
  - `type` string
@y
  - `type` string
@z

@x
    Mount type.
@y
    Mount type.
@z

@x
  - `options` string array
@y
  - `options` string array
@z

@x
    Options of the mount.
@y
    Options of the mount.
@z

@x
- `ipchost` Boolean
@y
- `ipchost` Boolean
@z

@x
   Access to host ipc namespace.
@y
   Access to host ipc namespace.
@z

@x
- `pidhost` Boolean
@y
- `pidhost` Boolean
@z

@x
   Access to host PID namespace.
@y
   Access to host PID namespace.
@z

@x
- `propagatedMount` string
@y
- `propagatedMount` string
@z

@x
   Path to be mounted as rshared, so that mounts under that path are visible to
   Docker. This is useful for volume plugins. This path will be bind-mounted
   outside of the plugin rootfs so it's contents are preserved on upgrade.
@y
   Path to be mounted as rshared, so that mounts under that path are visible to
   Docker. This is useful for volume plugins. This path will be bind-mounted
   outside of the plugin rootfs so it's contents are preserved on upgrade.
@z

@x
- `env` PluginEnv array
@y
- `env` PluginEnv array
@z

@x
  Environment variables of the plugin, struct consisting of the following fields:
@y
  Environment variables of the plugin, struct consisting of the following fields:
@z

@x
  - `name` string
@y
  - `name` string
@z

@x
    Name of the environment variable.
@y
    Name of the environment variable.
@z

@x
  - `description` string
@y
  - `description` string
@z

@x
    Description of the environment variable.
@y
    Description of the environment variable.
@z

@x
  - `value` string
@y
  - `value` string
@z

@x
    Value of the environment variable.
@y
    Value of the environment variable.
@z

@x
- `args` PluginArgs
@y
- `args` PluginArgs
@z

@x
  Arguments of the plugin, struct consisting of the following fields:
@y
  Arguments of the plugin, struct consisting of the following fields:
@z

@x
  - `name` string
@y
  - `name` string
@z

@x
    Name of the arguments.
@y
    Name of the arguments.
@z

@x
  - `description` string
@y
  - `description` string
@z

@x
    Description of the arguments.
@y
    Description of the arguments.
@z

@x
  - `value` string array
@y
  - `value` string array
@z

@x
    Values of the arguments.
@y
    Values of the arguments.
@z

@x
- `linux` PluginLinux
@y
- `linux` PluginLinux
@z

@x
  - `capabilities` string array
@y
  - `capabilities` string array
@z

@x
    Capabilities of the plugin (Linux only), see list [`here`](https://github.com/opencontainers/runc/blob/master/libcontainer/SPEC.md#security)
@y
    Capabilities of the plugin (Linux only), see list [`here`](https://github.com/opencontainers/runc/blob/master/libcontainer/SPEC.md#security)
@z

@x
  - `allowAllDevices` Boolean
@y
  - `allowAllDevices` Boolean
@z

@x
    If `/dev` is bind mounted from the host, and allowAllDevices is set to true, the plugin will have `rwm` access to all devices on the host.
@y
    If `/dev` is bind mounted from the host, and allowAllDevices is set to true, the plugin will have `rwm` access to all devices on the host.
@z

@x
  - `devices` PluginDevice array
@y
  - `devices` PluginDevice array
@z

@x
    Device of the plugin, (Linux only), struct consisting of the following fields.
    See [`DEVICES`](https://github.com/opencontainers/runtime-spec/blob/master/config-linux.md#devices).
@y
    Device of the plugin, (Linux only), struct consisting of the following fields.
    See [`DEVICES`](https://github.com/opencontainers/runtime-spec/blob/master/config-linux.md#devices).
@z

@x
    - `name` string
@y
    - `name` string
@z

@x
      Name of the device.
@y
      Name of the device.
@z

@x
    - `description` string
@y
    - `description` string
@z

@x
      Description of the device.
@y
      Description of the device.
@z

@x
    - `path` string
@y
    - `path` string
@z

@x
      Path of the device.
@y
      Path of the device.
@z

@x
## Example Config
@y
## Example Config
@z

@x
The following example shows the 'tiborvass/sample-volume-plugin' plugin config.
@y
The following example shows the 'tiborvass/sample-volume-plugin' plugin config.
@z

@x
```json
{
  "Args": {
    "Description": "",
    "Name": "",
    "Settable": null,
    "Value": null
  },
  "Description": "A sample volume plugin for Docker",
  "Documentation": "https://docs.docker.com/engine/extend/plugins/",
  "Entrypoint": [
    "/usr/bin/sample-volume-plugin",
    "/data"
  ],
  "Env": [
    {
      "Description": "",
      "Name": "DEBUG",
      "Settable": [
        "value"
      ],
      "Value": "0"
    }
  ],
  "Interface": {
    "Socket": "plugin.sock",
    "Types": [
      "docker.volumedriver/1.0"
    ]
  },
  "Linux": {
    "Capabilities": null,
    "AllowAllDevices": false,
    "Devices": null
  },
  "Mounts": null,
  "Network": {
    "Type": ""
  },
  "PropagatedMount": "/data",
  "User": {},
  "Workdir": ""
}
```
@y
```json
{
  "Args": {
    "Description": "",
    "Name": "",
    "Settable": null,
    "Value": null
  },
  "Description": "A sample volume plugin for Docker",
  "Documentation": "https://docs.docker.com/engine/extend/plugins/",
  "Entrypoint": [
    "/usr/bin/sample-volume-plugin",
    "/data"
  ],
  "Env": [
    {
      "Description": "",
      "Name": "DEBUG",
      "Settable": [
        "value"
      ],
      "Value": "0"
    }
  ],
  "Interface": {
    "Socket": "plugin.sock",
    "Types": [
      "docker.volumedriver/1.0"
    ]
  },
  "Linux": {
    "Capabilities": null,
    "AllowAllDevices": false,
    "Devices": null
  },
  "Mounts": null,
  "Network": {
    "Type": ""
  },
  "PropagatedMount": "/data",
  "User": {},
  "Workdir": ""
}
```
@z
