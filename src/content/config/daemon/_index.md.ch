%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configuring the Docker daemon
keywords: docker, daemon, configuration
title: Docker daemon configuration overview
aliases:
  - /articles/chef/
  - /articles/configuring/
  - /articles/dsc/
  - /articles/puppet/
  - /config/thirdparty/
  - /config/thirdparty/ansible/
  - /config/thirdparty/chef/
  - /config/thirdparty/dsc/
  - /config/thirdparty/puppet/
  - /engine/admin/
  - /engine/admin/ansible/
  - /engine/admin/chef/
  - /engine/admin/configuring/
  - /engine/admin/dsc/
  - /engine/admin/puppet/
  - /engine/articles/chef/
  - /engine/articles/configuring/
  - /engine/articles/dsc/
  - /engine/articles/puppet/
  - /engine/userguide/
---
@y
---
description: Docker デーモンを設定します。
keywords: docker, daemon, configuration
title: Docker デーモンの設定概要
aliases:
  - /articles/chef/
  - /articles/configuring/
  - /articles/dsc/
  - /articles/puppet/
  - /config/thirdparty/
  - /config/thirdparty/ansible/
  - /config/thirdparty/chef/
  - /config/thirdparty/dsc/
  - /config/thirdparty/puppet/
  - /engine/admin/
  - /engine/admin/ansible/
  - /engine/admin/chef/
  - /engine/admin/configuring/
  - /engine/admin/dsc/
  - /engine/admin/puppet/
  - /engine/articles/chef/
  - /engine/articles/configuring/
  - /engine/articles/dsc/
  - /engine/articles/puppet/
  - /engine/userguide/
---
@z

@x
This page shows you how to customize the Docker daemon, `dockerd`.
@y
This page shows you how to customize the Docker daemon, `dockerd`.
@z

@x
> **Note**
>
> This page is for users who've installed Docker Engine manually. If you're
> using Docker Desktop, refer to the following pages instead:
>
> - [Change preferences on Mac](../../desktop/settings/mac#docker-engine)
> - [Change preferences on Windows](../../desktop/settings/windows#docker-engine)
> - [Change preferences on Linux](../../desktop/settings/linux#docker-engine)
@y
> **Note**
>
> This page is for users who've installed Docker Engine manually. If you're
> using Docker Desktop, refer to the following pages instead:
>
> - [Change preferences on Mac](../../desktop/settings/mac#docker-engine)
> - [Change preferences on Windows](../../desktop/settings/windows#docker-engine)
> - [Change preferences on Linux](../../desktop/settings/linux#docker-engine)
@z

@x
## Configure the Docker daemon
@y
## Configure the Docker daemon
@z

@x
There are two ways to configure the Docker daemon:
@y
There are two ways to configure the Docker daemon:
@z

@x
- Use a JSON configuration file. This is the preferred option, since it keeps
  all configurations in a single place.
- Use flags when starting `dockerd`.
@y
- Use a JSON configuration file. This is the preferred option, since it keeps
  all configurations in a single place.
- Use flags when starting `dockerd`.
@z

@x
You can use both of these options together as long as you don't specify the same
option both as a flag and in the JSON file. If that happens, the Docker daemon
won't start and prints an error message.
@y
You can use both of these options together as long as you don't specify the same
option both as a flag and in the JSON file. If that happens, the Docker daemon
won't start and prints an error message.
@z

@x
To configure the Docker daemon using a JSON file, create a file at
`/etc/docker/daemon.json` on Linux systems, or
`C:\ProgramData\docker\config\daemon.json` on Windows.
@y
To configure the Docker daemon using a JSON file, create a file at
`/etc/docker/daemon.json` on Linux systems, or
`C:\ProgramData\docker\config\daemon.json` on Windows.
@z

@x
Using this configuration file, run the Docker daemon in debug mode, using TLS, and
listen for traffic routed to `192.168.59.3` on port `2376`. You can learn what
configuration options are available in the
[dockerd reference docs](../../engine/reference/commandline/dockerd.md#daemon-configuration-file)
@y
Using this configuration file, run the Docker daemon in debug mode, using TLS, and
listen for traffic routed to `192.168.59.3` on port `2376`. You can learn what
configuration options are available in the
[dockerd reference docs](../../engine/reference/commandline/dockerd.md#daemon-configuration-file)
@z

@x
You can also start the Docker daemon manually and configure it using flags. This
can be useful for troubleshooting problems.
@y
You can also start the Docker daemon manually and configure it using flags. This
can be useful for troubleshooting problems.
@z

@x
Here's an example of how to manually start the Docker daemon, using the same
configurations as shown in the previous JSON configuration:
@y
Here's an example of how to manually start the Docker daemon, using the same
configurations as shown in the previous JSON configuration:
@z

@x
```console
$ dockerd --debug \
  --tls=true \
  --tlscert=/var/docker/server.pem \
  --tlskey=/var/docker/serverkey.pem \
  --host tcp://192.168.59.3:2376
```
@y
```console
$ dockerd --debug \
  --tls=true \
  --tlscert=/var/docker/server.pem \
  --tlskey=/var/docker/serverkey.pem \
  --host tcp://192.168.59.3:2376
```
@z

@x
You can learn what configuration options are available in the
[dockerd reference docs](../../engine/reference/commandline/dockerd.md), or by
running:
@y
You can learn what configuration options are available in the
[dockerd reference docs](../../engine/reference/commandline/dockerd.md), or by
running:
@z

@x
```console
$ dockerd --help
```
@y
```console
$ dockerd --help
```
@z

@x
Many specific configuration options are discussed throughout the Docker
documentation. Some places to go next include:
@y
Many specific configuration options are discussed throughout the Docker
documentation. Some places to go next include:
@z

@x
- [Automatically start containers](../containers/start-containers-automatically.md)
- [Limit a container's resources](../containers/resource_constraints.md)
- [Configure storage drivers](../../storage/storagedriver/select-storage-driver.md)
- [Container security](../../engine/security/index.md)
@y
- [Automatically start containers](../containers/start-containers-automatically.md)
- [Limit a container's resources](../containers/resource_constraints.md)
- [Configure storage drivers](../../storage/storagedriver/select-storage-driver.md)
- [Container security](../../engine/security/index.md)
@z

@x
You can configure most daemon options using the `daemon.json` file. One thing
you can't configure using daemon.json mechanism is an HTTP proxy. For
instructions on using a proxy, see
[Configure Docker to use a proxy server](../../network/proxy.md).
@y
You can configure most daemon options using the `daemon.json` file. One thing
you can't configure using daemon.json mechanism is an HTTP proxy. For
instructions on using a proxy, see
[Configure Docker to use a proxy server](../../network/proxy.md).
@z

@x
## Daemon data directory
@y
## Daemon data directory
@z

@x
The Docker daemon persists all data in a single directory. This tracks
everything related to Docker, including containers, images, volumes, service
definition, and secrets.
@y
The Docker daemon persists all data in a single directory. This tracks
everything related to Docker, including containers, images, volumes, service
definition, and secrets.
@z

@x
By default this directory is:
@y
By default this directory is:
@z

@x
- `/var/lib/docker` on Linux.
- `C:\ProgramData\docker` on Windows.
@y
- `/var/lib/docker` on Linux.
- `C:\ProgramData\docker` on Windows.
@z

@x
You can configure the Docker daemon to use a different directory, using the
`data-root` configuration option. For example:
@y
You can configure the Docker daemon to use a different directory, using the
`data-root` configuration option. For example:
@z

@x
```json
{
  "data-root": "/mnt/docker-data"
}
```
@y
```json
{
  "data-root": "/mnt/docker-data"
}
```
@z

@x
Since the state of a Docker daemon is kept on this directory, make sure you use
a dedicated directory for each daemon. If two daemons share the same directory,
for example, an NFS share, you are going to experience errors that are difficult
to troubleshoot.
@y
Since the state of a Docker daemon is kept on this directory, make sure you use
a dedicated directory for each daemon. If two daemons share the same directory,
for example, an NFS share, you are going to experience errors that are difficult
to troubleshoot.
@z
