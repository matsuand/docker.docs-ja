%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Find the recommended Docker Engine post-installation steps for Linux
  users, including how to run Docker as a non-root user and more.
keywords: run docker without sudo, docker running as root, docker post install, docker
  post installation, run docker as non root, docker non root user, how to run docker
  in linux, how to run docker linux, how to start docker in linux, run docker on linux
title: Linux post-installation steps for Docker Engine
@y
description: Find the recommended Docker Engine post-installation steps for Linux
  users, including how to run Docker as a non-root user and more.
keywords: run docker without sudo, docker running as root, docker post install, docker
  post installation, run docker as non root, docker non root user, how to run docker
  in linux, how to run docker linux, how to start docker in linux, run docker on linux
title: Linux における Docker Engine インストール後の作業
@z

@x
These optional post-installation procedures describe how to configure your
Linux host machine to work better with Docker.
@y
These optional post-installation procedures describe how to configure your
Linux host machine to work better with Docker.
@z

@x
## Manage Docker as a non-root user
@y
## Manage Docker as a non-root user
@z

@x
The Docker daemon binds to a Unix socket, not a TCP port. By default it's the
`root` user that owns the Unix socket, and other users can only access it using
`sudo`. The Docker daemon always runs as the `root` user.
@y
The Docker daemon binds to a Unix socket, not a TCP port. By default it's the
`root` user that owns the Unix socket, and other users can only access it using
`sudo`. The Docker daemon always runs as the `root` user.
@z

@x
If you don't want to preface the `docker` command with `sudo`, create a Unix
group called `docker` and add users to it. When the Docker daemon starts, it
creates a Unix socket accessible by members of the `docker` group. On some Linux
distributions, the system automatically creates this group when installing
Docker Engine using a package manager. In that case, there is no need for you to
manually create the group.
@y
If you don't want to preface the `docker` command with `sudo`, create a Unix
group called `docker` and add users to it. When the Docker daemon starts, it
creates a Unix socket accessible by members of the `docker` group. On some Linux
distributions, the system automatically creates this group when installing
Docker Engine using a package manager. In that case, there is no need for you to
manually create the group.
@z

@x
> [!WARNING]
>
> The `docker` group grants root-level privileges to the user. For
> details on how this impacts security in your system, see
> [Docker Daemon Attack Surface](../security/_index.md#docker-daemon-attack-surface).
@y
> [!WARNING]
>
> The `docker` group grants root-level privileges to the user. For
> details on how this impacts security in your system, see
> [Docker Daemon Attack Surface](../security/_index.md#docker-daemon-attack-surface).
@z

@x
> [!NOTE]
>
> To run Docker without root privileges, see
> [Run the Docker daemon as a non-root user (Rootless mode)](../security/rootless.md).
@y
> [!NOTE]
>
> To run Docker without root privileges, see
> [Run the Docker daemon as a non-root user (Rootless mode)](../security/rootless.md).
@z

@x
To create the `docker` group and add your user:
@y
To create the `docker` group and add your user:
@z

@x
1. Create the `docker` group.
@y
1. Create the `docker` group.
@z

% snip command...

@x
2. Add your user to the `docker` group.
@y
2. Add your user to the `docker` group.
@z

% snip command...

@x
3. Log out and log back in so that your group membership is re-evaluated.
@y
3. Log out and log back in so that your group membership is re-evaluated.
@z

@x
   > If you're running Linux in a virtual machine, it may be necessary to
   > restart the virtual machine for changes to take effect.
@y
   > If you're running Linux in a virtual machine, it may be necessary to
   > restart the virtual machine for changes to take effect.
@z

@x
   You can also run the following command to activate the changes to groups:
@y
   You can also run the following command to activate the changes to groups:
@z

% snip command...

@x
4. Verify that you can run `docker` commands without `sudo`.
@y
4. Verify that you can run `docker` commands without `sudo`.
@z

% snip command...

@x
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a message and exits.
@y
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a message and exits.
@z

@x
   If you initially ran Docker CLI commands using `sudo` before adding your user
   to the `docker` group, you may see the following error:
@y
   If you initially ran Docker CLI commands using `sudo` before adding your user
   to the `docker` group, you may see the following error:
@z

% snip output...

@x
   This error indicates that the permission settings for the `~/.docker/`
   directory are incorrect, due to having used the `sudo` command earlier.
@y
   This error indicates that the permission settings for the `~/.docker/`
   directory are incorrect, due to having used the `sudo` command earlier.
@z

@x
   To fix this problem, either remove the `~/.docker/` directory (it's recreated
   automatically, but any custom settings are lost), or change its ownership and
   permissions using the following commands:
@y
   To fix this problem, either remove the `~/.docker/` directory (it's recreated
   automatically, but any custom settings are lost), or change its ownership and
   permissions using the following commands:
@z

% snip command...

@x
## Configure Docker to start on boot with systemd
@y
## ブート時の Docker 起動設定 {#configure-docker-to-start-on-boot-with-systemd}
@z

@x
Many modern Linux distributions use [systemd](https://systemd.io/) to
manage which services start when the system boots. On Debian and Ubuntu, the
Docker service starts on boot by default. To automatically start Docker and
containerd on boot for other Linux distributions using systemd, run the
following commands:
@y
Many modern Linux distributions use [systemd](https://systemd.io/) to
manage which services start when the system boots. On Debian and Ubuntu, the
Docker service starts on boot by default. To automatically start Docker and
containerd on boot for other Linux distributions using systemd, run the
following commands:
@z

% snip command...

@x
To stop this behavior, use `disable` instead.
@y
To stop this behavior, use `disable` instead.
@z

% snip command...

@x
You can use systemd unit files to configure the Docker service on startup,
for example to add an HTTP proxy, set a different directory or partition for the
Docker runtime files, or other customizations. For an example, see
[Configure the daemon to use a proxy](/manuals/engine/daemon/proxy.md#systemd-unit-file).
@y
You can use systemd unit files to configure the Docker service on startup,
for example to add an HTTP proxy, set a different directory or partition for the
Docker runtime files, or other customizations. For an example, see
[Configure the daemon to use a proxy](manuals/engine/daemon/proxy.md#systemd-unit-file).
@z

@x
## Configure default logging driver
@y
## Configure default logging driver
@z

@x
Docker provides [logging drivers](/manuals/engine/logging/_index.md) for
collecting and viewing log data from all containers running on a host. The
default logging driver, `json-file`, writes log data to JSON-formatted files on
the host filesystem. Over time, these log files expand in size, leading to
potential exhaustion of disk resources.
@y
Docker provides [logging drivers](manuals/engine/logging/_index.md) for
collecting and viewing log data from all containers running on a host. The
default logging driver, `json-file`, writes log data to JSON-formatted files on
the host filesystem. Over time, these log files expand in size, leading to
potential exhaustion of disk resources.
@z

@x
To avoid issues with overusing disk for log data, consider one of the following
options:
@y
To avoid issues with overusing disk for log data, consider one of the following
options:
@z

@x
- Configure the `json-file` logging driver to turn on
  [log rotation](/manuals/engine/logging/drivers/json-file.md).
- Use an
  [alternative logging driver](/manuals/engine/logging/configure.md#configure-the-default-logging-driver)
  such as the ["local" logging driver](/manuals/engine/logging/drivers/local.md)
  that performs log rotation by default.
- Use a logging driver that sends logs to a remote logging aggregator.
@y
- Configure the `json-file` logging driver to turn on
  [log rotation](manuals/engine/logging/drivers/json-file.md).
- Use an
  [alternative logging driver](manuals/engine/logging/configure.md#configure-the-default-logging-driver)
  such as the ["local" logging driver](manuals/engine/logging/drivers/local.md)
  that performs log rotation by default.
- Use a logging driver that sends logs to a remote logging aggregator.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Take a look at the [Docker workshop](/get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
@y
- Take a look at the [Docker workshop](get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
@z
