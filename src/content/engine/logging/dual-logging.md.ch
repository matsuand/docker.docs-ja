%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: >
  Learn how to read container logs locally when using a third party logging
  solution.
keywords: >
  docker, logging, driver, dual logging, dual logging, cache, ring-buffer,
  configuration
title: Use docker logs with remote logging drivers
@y
description: >
  Learn how to read container logs locally when using a third party logging
  solution.
keywords: >
  docker, logging, driver, dual logging, dual logging, cache, ring-buffer,
  configuration
title: Use docker logs with remote logging drivers
@z

@x
## Overview
@y
## Overview
@z

@x
You can use the `docker logs` command to read container logs regardless of the
configured logging driver or plugin. Docker Engine uses the [`local`](drivers/local.md)
logging driver to act as cache for reading the latest logs of your containers.
This is called dual logging. By default, the cache has log-file rotation
enabled, and is limited to a maximum of 5 files of 20 MB each (before
compression) per container.
@y
You can use the `docker logs` command to read container logs regardless of the
configured logging driver or plugin. Docker Engine uses the [`local`](drivers/local.md)
logging driver to act as cache for reading the latest logs of your containers.
This is called dual logging. By default, the cache has log-file rotation
enabled, and is limited to a maximum of 5 files of 20 MB each (before
compression) per container.
@z

@x
Refer to the [configuration options](#configuration-options) section to customize
these defaults, or to the [disable dual logging](#disable-the-dual-logging-cache)
section to disable this feature.
@y
Refer to the [configuration options](#configuration-options) section to customize
these defaults, or to the [disable dual logging](#disable-the-dual-logging-cache)
section to disable this feature.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Docker Engine automatically enables dual logging if the configured logging
driver doesn't support reading logs.
@y
Docker Engine automatically enables dual logging if the configured logging
driver doesn't support reading logs.
@z

@x
The following examples show the result of running a `docker logs` command with
and without dual logging availability:
@y
The following examples show the result of running a `docker logs` command with
and without dual logging availability:
@z

@x
### Without dual logging capability
@y
### Without dual logging capability
@z

@x
When a container is configured with a remote logging driver such as `splunk`, and
dual logging is disabled, an error is displayed when attempting to read container
logs locally:
@y
When a container is configured with a remote logging driver such as `splunk`, and
dual logging is disabled, an error is displayed when attempting to read container
logs locally:
@z

@x
- Step 1: Configure Docker daemon
@y
- Step 1: Configure Docker daemon
@z

@x
  ```console
  $ cat /etc/docker/daemon.json
  {
    "log-driver": "splunk",
    "log-opts": {
      "cache-disabled": "true",
      ... (options for "splunk" logging driver)
    }
  }
  ```
@y
  ```console
  $ cat /etc/docker/daemon.json
  {
    "log-driver": "splunk",
    "log-opts": {
      "cache-disabled": "true",
      ... (options for "splunk" logging driver)
    }
  }
  ```
@z

@x
- Step 2: Start the container
@y
- Step 2: Start the container
@z

@x
  ```console
  $ docker run -d busybox --name testlog top
  ```
@y
  ```console
  $ docker run -d busybox --name testlog top
  ```
@z

@x
- Step 3: Read the container logs
@y
- Step 3: Read the container logs
@z

@x
  ```console
  $ docker logs 7d6ac83a89a0
  Error response from daemon: configured logging driver does not support reading
  ```
@y
  ```console
  $ docker logs 7d6ac83a89a0
  Error response from daemon: configured logging driver does not support reading
  ```
@z

@x
### With dual logging capability
@y
### With dual logging capability
@z

@x
With the dual logging cache enabled, the `docker logs` command can be used to
read logs, even if the logging driver doesn't support reading logs. The following
example shows a daemon configuration that uses the `splunk` remote logging driver
as a default, with dual logging caching enabled:
@y
With the dual logging cache enabled, the `docker logs` command can be used to
read logs, even if the logging driver doesn't support reading logs. The following
example shows a daemon configuration that uses the `splunk` remote logging driver
as a default, with dual logging caching enabled:
@z

@x
- Step 1: Configure Docker daemon
@y
- Step 1: Configure Docker daemon
@z

@x
  ```console
  $ cat /etc/docker/daemon.json
  {
    "log-driver": "splunk",
    "log-opts": {
      ... (options for "splunk" logging driver)
    }
  }
  ```
@y
  ```console
  $ cat /etc/docker/daemon.json
  {
    "log-driver": "splunk",
    "log-opts": {
      ... (options for "splunk" logging driver)
    }
  }
  ```
@z

@x
- Step 2: Start the container
@y
- Step 2: Start the container
@z

@x
  ```console
  $ docker run -d busybox --name testlog top
  ```
@y
  ```console
  $ docker run -d busybox --name testlog top
  ```
@z

@x
- Step 3: Read the container logs
@y
- Step 3: Read the container logs
@z

@x
  ```console
  $ docker logs 7d6ac83a89a0
  2019-02-04T19:48:15.423Z [INFO]  core: marked as sealed
  2019-02-04T19:48:15.423Z [INFO]  core: pre-seal teardown starting
  2019-02-04T19:48:15.423Z [INFO]  core: stopping cluster listeners
  2019-02-04T19:48:15.423Z [INFO]  core: shutting down forwarding rpc listeners
  2019-02-04T19:48:15.423Z [INFO]  core: forwarding rpc listeners stopped
  2019-02-04T19:48:15.599Z [INFO]  core: rpc listeners successfully shut down
  2019-02-04T19:48:15.599Z [INFO]  core: cluster listeners successfully shut down
  ```
@y
  ```console
  $ docker logs 7d6ac83a89a0
  2019-02-04T19:48:15.423Z [INFO]  core: marked as sealed
  2019-02-04T19:48:15.423Z [INFO]  core: pre-seal teardown starting
  2019-02-04T19:48:15.423Z [INFO]  core: stopping cluster listeners
  2019-02-04T19:48:15.423Z [INFO]  core: shutting down forwarding rpc listeners
  2019-02-04T19:48:15.423Z [INFO]  core: forwarding rpc listeners stopped
  2019-02-04T19:48:15.599Z [INFO]  core: rpc listeners successfully shut down
  2019-02-04T19:48:15.599Z [INFO]  core: cluster listeners successfully shut down
  ```
@z

@x
> [!NOTE]
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, there is no difference in functionality before or after
> the dual logging capability became available. For these drivers, Logs can be
> read using `docker logs` in both scenarios.
@y
> [!NOTE]
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, there is no difference in functionality before or after
> the dual logging capability became available. For these drivers, Logs can be
> read using `docker logs` in both scenarios.
@z

@x
### Configuration options
@y
### Configuration options
@z

@x
The dual logging cache accepts the same configuration options as the
[`local` logging driver](drivers/local.md), but with a `cache-` prefix. These options
can be specified per container, and defaults for new containers can be set using
the [daemon configuration file](/reference/cli/dockerd/#daemon-configuration-file).
@y
The dual logging cache accepts the same configuration options as the
[`local` logging driver](drivers/local.md), but with a `cache-` prefix. These options
can be specified per container, and defaults for new containers can be set using
the [daemon configuration file](reference/cli/dockerd/#daemon-configuration-file).
@z

@x
By default, the cache has log-file rotation enabled, and is limited to a maximum
of 5 files of 20MB each (before compression) per container. Use the configuration
options described below to customize these defaults.
@y
By default, the cache has log-file rotation enabled, and is limited to a maximum
of 5 files of 20MB each (before compression) per container. Use the configuration
options described below to customize these defaults.
@z

@x
| Option           | Default   | Description                                                                                                                                       |
| :--------------- | :-------- | :------------------------------------------------------------------------------------------------------------------------------------------------ |
| `cache-disabled` | `"false"` | Disable local caching. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                                                           |
| `cache-max-size` | `"20m"`   | The maximum size of the cache before it is rotated. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`).       |
| `cache-max-file` | `"5"`     | The maximum number of cache files that can be present. If rotating the logs creates excess files, the oldest file is removed. A positive integer. |
| `cache-compress` | `"true"`  | Enable or disable compression of rotated log files. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                              |
@y
| Option           | Default   | Description                                                                                                                                       |
| :--------------- | :-------- | :------------------------------------------------------------------------------------------------------------------------------------------------ |
| `cache-disabled` | `"false"` | Disable local caching. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                                                           |
| `cache-max-size` | `"20m"`   | The maximum size of the cache before it is rotated. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`).       |
| `cache-max-file` | `"5"`     | The maximum number of cache files that can be present. If rotating the logs creates excess files, the oldest file is removed. A positive integer. |
| `cache-compress` | `"true"`  | Enable or disable compression of rotated log files. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                              |
@z

@x
## Disable the dual logging cache
@y
## Disable the dual logging cache
@z

@x
Use the `cache-disabled` option to disable the dual logging cache. Disabling the
cache can be useful to save storage space in situations where logs are only read
through a remote logging system, and if there is no need to read logs through
`docker logs` for debugging purposes.
@y
Use the `cache-disabled` option to disable the dual logging cache. Disabling the
cache can be useful to save storage space in situations where logs are only read
through a remote logging system, and if there is no need to read logs through
`docker logs` for debugging purposes.
@z

@x
Caching can be disabled for individual containers or by default for new containers,
when using the [daemon configuration file](/reference/cli/dockerd/#daemon-configuration-file).
@y
Caching can be disabled for individual containers or by default for new containers,
when using the [daemon configuration file](reference/cli/dockerd/#daemon-configuration-file).
@z

@x
The following example uses the daemon configuration file to use the [`splunk`](drivers/splunk.md)
logging driver as a default, with caching disabled:
@y
The following example uses the daemon configuration file to use the [`splunk`](drivers/splunk.md)
logging driver as a default, with caching disabled:
@z

@x
```console
$ cat /etc/docker/daemon.json
{
  "log-driver": "splunk",
  "log-opts": {
    "cache-disabled": "true",
    ... (options for "splunk" logging driver)
  }
}
```
@y
```console
$ cat /etc/docker/daemon.json
{
  "log-driver": "splunk",
  "log-opts": {
    "cache-disabled": "true",
    ... (options for "splunk" logging driver)
  }
}
```
@z

@x
> [!NOTE]
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, dual logging isn't used, and disabling the option has
> no effect.
@y
> [!NOTE]
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, dual logging isn't used, and disabling the option has
> no effect.
@z

@x
## Limitations
@y
## Limitations
@z

@x
- If a container using a logging driver or plugin that sends logs remotely
  has a network issue, no `write` to the local cache occurs.
- If a write to `logdriver` fails for any reason (file system full, write
  permissions removed), the cache write fails and is logged in the daemon log.
  The log entry to the cache isn't retried.
- Some logs might be lost from the cache in the default configuration because a
  ring buffer is used to prevent blocking the stdio of the container in case of
  slow file writes. An admin must repair these while the daemon is shut down.
@y
- If a container using a logging driver or plugin that sends logs remotely
  has a network issue, no `write` to the local cache occurs.
- If a write to `logdriver` fails for any reason (file system full, write
  permissions removed), the cache write fails and is logged in the daemon log.
  The log entry to the cache isn't retried.
- Some logs might be lost from the cache in the default configuration because a
  ring buffer is used to prevent blocking the stdio of the container in case of
  slow file writes. An admin must repair these while the daemon is shut down.
@z
