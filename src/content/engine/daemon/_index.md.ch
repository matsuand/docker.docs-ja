%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Configuring the Docker daemon
keywords: docker, daemon, configuration
title: Docker daemon configuration overview
@y
description: Docker デーモンを設定します。
keywords: docker, daemon, configuration
title: Docker デーモンの設定概要
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
> using Docker Desktop, refer to the following pages instead:
>
> - [Change preferences on Mac](../../desktop/settings/mac#docker-engine)
> - [Change preferences on Windows](../../desktop/settings/windows#docker-engine)
> - [Change preferences on Linux](../../desktop/settings/linux#docker-engine)
@y
> [!NOTE]
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

% snip code...

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
- [Automatically start containers](/engine/containers/start-containers-automatically.md)
- [Limit a container's resources](/engine/containers/resource_constraints.md)
- [Configure storage drivers](/engine/storage/drivers/select-storage-driver.md)
- [Container security](/engine/security/_index.md)
- [Configure the Docker daemon to use a proxy](./proxy.md)
@y
- [Automatically start containers](engine/containers/start-containers-automatically.md)
- [Limit a container's resources](engine/containers/resource_constraints.md)
- [Configure storage drivers](engine/storage/drivers/select-storage-driver.md)
- [Container security](engine/security/_index.md)
- [Configure the Docker daemon to use a proxy](./proxy.md)
@z
