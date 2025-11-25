%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Configuring the Docker daemon
keywords: docker, daemon, configuration
title: Docker daemon configuration overview
linkTitle: Daemon
@y
description: Configuring the Docker daemon
keywords: docker, daemon, configuration
title: Docker daemon configuration overview
linkTitle: Daemon
@z

@x
This page shows you how to customize the Docker daemon, `dockerd`.
@y
This page shows you how to customize the Docker daemon, `dockerd`.
@z

@x
> [!NOTE]
>
> This page is for users who've installed Docker Engine manually. If you're
> using Docker Desktop, refer to the [settings page](/manuals/desktop/settings-and-maintenance/settings.md#docker-engine).
@y
> [!NOTE]
>
> This page is for users who've installed Docker Engine manually. If you're
> using Docker Desktop, refer to the [settings page](manuals/desktop/settings-and-maintenance/settings.md#docker-engine).
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
### Configuration file
@y
### Configuration file
@z

@x
The following table shows the location where the Docker daemon expects to find
the configuration file by default, depending on your system and how you're
running the daemon.
@y
The following table shows the location where the Docker daemon expects to find
the configuration file by default, depending on your system and how you're
running the daemon.
@z

@x
| OS and configuration | File location                              |
| -------------------- | ------------------------------------------ |
| Linux, regular setup | `/etc/docker/daemon.json`                  |
| Linux, rootless mode | `~/.config/docker/daemon.json`             |
| Windows              | `C:\ProgramData\docker\config\daemon.json` |
@y
| OS and configuration | File location                              |
| -------------------- | ------------------------------------------ |
| Linux, regular setup | `/etc/docker/daemon.json`                  |
| Linux, rootless mode | `~/.config/docker/daemon.json`             |
| Windows              | `C:\ProgramData\docker\config\daemon.json` |
@z

@x
For rootless mode, the daemon respects the `XDG_CONFIG_HOME` variable. If set,
the expected file location is `$XDG_CONFIG_HOME/docker/daemon.json`.
@y
For rootless mode, the daemon respects the `XDG_CONFIG_HOME` variable. If set,
the expected file location is `$XDG_CONFIG_HOME/docker/daemon.json`.
@z

@x
You can also explicitly specify the location of the configuration file on
startup, using the `dockerd --config-file` flag.
@y
You can also explicitly specify the location of the configuration file on
startup, using the `dockerd --config-file` flag.
@z

@x
Learn about the available configuration options in the
[dockerd reference docs](/reference/cli/dockerd.md#daemon-configuration-file)
@y
Learn about the available configuration options in the
[dockerd reference docs](reference/cli/dockerd.md#daemon-configuration-file)
@z

@x
### Configuration using flags
@y
### Configuration using flags
@z

@x
You can also start the Docker daemon manually and configure it using flags.
This can be useful for troubleshooting problems.
@y
You can also start the Docker daemon manually and configure it using flags.
This can be useful for troubleshooting problems.
@z

@x
Here's an example of how to manually start the Docker daemon, using the same
configurations as shown in the previous JSON configuration:
@y
Here's an example of how to manually start the Docker daemon, using the same
configurations as shown in the previous JSON configuration:
@z

% snip command...

@x
Learn about the available configuration options in the
[dockerd reference docs](/reference/cli/dockerd.md), or by
running:
@y
Learn about the available configuration options in the
[dockerd reference docs](reference/cli/dockerd.md), or by
running:
@z

% snip command...

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
By default the daemon stores data in:
@y
By default the daemon stores data in:
@z

@x
- `/var/lib/docker` on Linux
- `C:\ProgramData\docker` on Windows
@y
- `/var/lib/docker` on Linux
- `C:\ProgramData\docker` on Windows
@z

@x
When using the [containerd image store](/manuals/engine/storage/containerd.md)
(the default for Docker Engine 29.0 and later on fresh installations), image
contents and container snapshots are stored in `/var/lib/containerd`. Other
daemon data (volumes, configs) remains in `/var/lib/docker`.
@y
When using the [containerd image store](manuals/engine/storage/containerd.md)
(the default for Docker Engine 29.0 and later on fresh installations), image
contents and container snapshots are stored in `/var/lib/containerd`. Other
daemon data (volumes, configs) remains in `/var/lib/docker`.
@z

@x
When using [classic storage drivers](/manuals/engine/storage/drivers/_index.md)
like `overlay2` (the default for upgraded installations), all data is stored in
`/var/lib/docker`.
@y
When using [classic storage drivers](manuals/engine/storage/drivers/_index.md)
like `overlay2` (the default for upgraded installations), all data is stored in
`/var/lib/docker`.
@z

@x
### Configure the data directory location
@y
### Configure the data directory location
@z

@x
You can configure the Docker daemon to use a different storage directory using
the `data-root` configuration option.
@y
You can configure the Docker daemon to use a different storage directory using
the `data-root` configuration option.
@z

% snip code...

@x
The `data-root` option does not affect image and container data stored in
`/var/lib/containerd` when using the containerd image store. To change the
storage location of containerd snapshotters, use the system containerd
configuration file:
@y
The `data-root` option does not affect image and container data stored in
`/var/lib/containerd` when using the containerd image store. To change the
storage location of containerd snapshotters, use the system containerd
configuration file:
@z

% snip code...

@x
Make sure you use a dedicated directory for each daemon. If two daemons share
the same directory, for example an NFS share, you will experience errors that
are difficult to troubleshoot.
@y
Make sure you use a dedicated directory for each daemon. If two daemons share
the same directory, for example an NFS share, you will experience errors that
are difficult to troubleshoot.
@z

@x
## Next steps
@y
## Next steps
@z

@x
Many specific configuration options are discussed throughout the Docker
documentation. Some places to go next include:
@y
Many specific configuration options are discussed throughout the Docker
documentation. Some places to go next include:
@z

@x
- [Automatically start containers](/manuals/engine/containers/start-containers-automatically.md)
- [Limit a container's resources](/manuals/engine/containers/resource_constraints.md)
- [Configure storage drivers](/manuals/engine/storage/drivers/select-storage-driver.md)
- [Container security](/manuals/engine/security/_index.md)
- [Configure the Docker daemon to use a proxy](./proxy.md)
@y
- [Automatically start containers](manuals/engine/containers/start-containers-automatically.md)
- [Limit a container's resources](manuals/engine/containers/resource_constraints.md)
- [Configure storage drivers](manuals/engine/storage/drivers/select-storage-driver.md)
- [Container security](manuals/engine/security/_index.md)
- [Configure the Docker daemon to use a proxy](./proxy.md)
@z
