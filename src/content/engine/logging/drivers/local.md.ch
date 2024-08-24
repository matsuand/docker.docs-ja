%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to use the local logging driver with Docker Engine
keywords: local, docker, logging, driver, file
title: Local file logging driver
aliases:
  - /engine/reference/logging/local/
  - /engine/admin/logging/local/
  - /config/containers/logging/local/
---
@y
---
description: Learn how to use the local logging driver with Docker Engine
keywords: local, docker, logging, driver, file
title: Local file logging driver
aliases:
  - /engine/reference/logging/local/
  - /engine/admin/logging/local/
  - /config/containers/logging/local/
---
@z

@x
The `local` logging driver captures output from container's stdout/stderr and
writes them to an internal storage that's optimized for performance and disk
use.
@y
The `local` logging driver captures output from container's stdout/stderr and
writes them to an internal storage that's optimized for performance and disk
use.
@z

@x
By default, the `local` driver preserves 100MB of log messages per container and
uses automatic compression to reduce the size on disk. The 100MB default value is based on a 20M default size
for each file and a default count of 5 for the number of such files (to account for log rotation).
@y
By default, the `local` driver preserves 100MB of log messages per container and
uses automatic compression to reduce the size on disk. The 100MB default value is based on a 20M default size
for each file and a default count of 5 for the number of such files (to account for log rotation).
@z

@x
> [!WARNING]
>
> The `local` logging driver uses file-based storage. These files are designed
> to be exclusively accessed by the Docker daemon. Interacting with these files
> with external tools may interfere with Docker's logging system and result in
> unexpected behavior, and should be avoided.
@y
> [!WARNING]
>
> The `local` logging driver uses file-based storage. These files are designed
> to be exclusively accessed by the Docker daemon. Interacting with these files
> with external tools may interfere with Docker's logging system and result in
> unexpected behavior, and should be avoided.
@z

@x
## Usage
@y
## Usage
@z

@x
To use the `local` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../reference/cli/dockerd.md#daemon-configuration-file).
@y
To use the `local` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../reference/cli/dockerd.md#daemon-configuration-file).
@z

@x
The following example sets the log driver to `local` and sets the `max-size`
option.
@y
The following example sets the log driver to `local` and sets the `max-size`
option.
@z

@x
```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m"
  }
}
```
@y
```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m"
  }
}
```
@z

@x
Restart Docker for the changes to take effect for newly created containers.
Existing containers don't use the new logging configuration automatically.
@y
Restart Docker for the changes to take effect for newly created containers.
Existing containers don't use the new logging configuration automatically.
@z

@x
You can set the logging driver for a specific container by using the
`--log-driver` flag to `docker container create` or `docker run`:
@y
You can set the logging driver for a specific container by using the
`--log-driver` flag to `docker container create` or `docker run`:
@z

@x
```console
$ docker run \
      --log-driver local --log-opt max-size=10m \
      alpine echo hello world
```
@y
```console
$ docker run \
      --log-driver local --log-opt max-size=10m \
      alpine echo hello world
```
@z

@x
Note that `local` is a bash reserved keyword, so you may need to quote it in scripts.
@y
Note that `local` is a bash reserved keyword, so you may need to quote it in scripts.
@z

@x
### Options
@y
### Options
@z

@x
The `local` logging driver supports the following logging options:
@y
The `local` logging driver supports the following logging options:
@z

@x
| Option     | Description                                                                                                                                                   | Example value              |
| :--------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------- |
| `max-size` | The maximum size of the log before it's rolled. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`). Defaults to 20m.      | `--log-opt max-size=10m`   |
| `max-file` | The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. A positive integer. Defaults to 5. | `--log-opt max-file=3`     |
| `compress` | Toggle compression of rotated log files. Enabled by default.                                                                                                  | `--log-opt compress=false` |
@y
| Option     | Description                                                                                                                                                   | Example value              |
| :--------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------- |
| `max-size` | The maximum size of the log before it's rolled. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`). Defaults to 20m.      | `--log-opt max-size=10m`   |
| `max-file` | The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. A positive integer. Defaults to 5. | `--log-opt max-file=3`     |
| `compress` | Toggle compression of rotated log files. Enabled by default.                                                                                                  | `--log-opt compress=false` |
@z

@x
### Examples
@y
### Examples
@z

@x
This example starts an `alpine` container which can have a maximum of 3 log
files no larger than 10 megabytes each.
@y
This example starts an `alpine` container which can have a maximum of 3 log
files no larger than 10 megabytes each.
@z

@x
```console
$ docker run -it --log-driver local --log-opt max-size=10m --log-opt max-file=3 alpine ash
```
@y
```console
$ docker run -it --log-driver local --log-opt max-size=10m --log-opt max-file=3 alpine ash
```
@z
