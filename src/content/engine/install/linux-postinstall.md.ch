%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Find the recommended Docker Engine post-installation steps for Linux
  users, including how to run Docker as a non-root user and more.
keywords: run docker without sudo, docker running as root, docker post install, docker
  post installation, run docker as non root, docker non root user, how to run docker
  in linux, how to run docker linux, how to start docker in linux, run docker on linux
title: Linux post-installation steps for Docker Engine
aliases:
- /engine/installation/linux/docker-ee/linux-postinstall/
- /engine/installation/linux/linux-postinstall/
- /install/linux/linux-postinstall/
---
@y
---
description: Find the recommended Docker Engine post-installation steps for Linux
  users, including how to run Docker as a non-root user and more.
keywords: run docker without sudo, docker running as root, docker post install, docker
  post installation, run docker as non root, docker non root user, how to run docker
  in linux, how to run docker linux, how to start docker in linux, run docker on linux
title: Linux における Docker Engine インストール後の作業
aliases:
- /engine/installation/linux/docker-ee/linux-postinstall/
- /engine/installation/linux/linux-postinstall/
- /install/linux/linux-postinstall/
---
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
<!-- prettier-ignore -->
> **Warning**
>
> The `docker` group grants root-level privileges to the user. For
> details on how this impacts security in your system, see
> [Docker Daemon Attack Surface](../security/index.md#docker-daemon-attack-surface).
{ .warning }
@y
<!-- prettier-ignore -->
> **Warning**
>
> The `docker` group grants root-level privileges to the user. For
> details on how this impacts security in your system, see
> [Docker Daemon Attack Surface](../security/index.md#docker-daemon-attack-surface).
{ .warning }
@z

@x
> **Note**
>
> To run Docker without root privileges, see
> [Run the Docker daemon as a non-root user (Rootless mode)](../security/rootless.md).
@y
> **Note**
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

@x
   ```console
   $ sudo groupadd docker
   ```
@y
   ```console
   $ sudo groupadd docker
   ```
@z

@x
2. Add your user to the `docker` group.
@y
2. Add your user to the `docker` group.
@z

@x
   ```console
   $ sudo usermod -aG docker $USER
   ```
@y
   ```console
   $ sudo usermod -aG docker $USER
   ```
@z

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

@x
   ```console
   $ newgrp docker
   ```
@y
   ```console
   $ newgrp docker
   ```
@z

@x
4. Verify that you can run `docker` commands without `sudo`.
@y
4. Verify that you can run `docker` commands without `sudo`.
@z

@x
   ```console
   $ docker run hello-world
   ```
@y
   ```console
   $ docker run hello-world
   ```
@z

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

@x
   ```none
   WARNING: Error loading config file: /home/user/.docker/config.json -
   stat /home/user/.docker/config.json: permission denied
   ```
@y
   ```none
   WARNING: Error loading config file: /home/user/.docker/config.json -
   stat /home/user/.docker/config.json: permission denied
   ```
@z

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

@x
   ```console
   $ sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
   $ sudo chmod g+rwx "$HOME/.docker" -R
   ```
@y
   ```console
   $ sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
   $ sudo chmod g+rwx "$HOME/.docker" -R
   ```
@z

@x
## Configure Docker to start on boot with systemd
@y
## ブート時の Docker 起動設定 {#configure-docker-to-start-on-boot-with-systemd}
@z

@x
Many modern Linux distributions use [systemd](../../config/daemon/systemd.md) to
manage which services start when the system boots. On Debian and Ubuntu, the
Docker service starts on boot by default. To automatically start Docker and
containerd on boot for other Linux distributions using systemd, run the
following commands:
@y
Many modern Linux distributions use [systemd](../../config/daemon/systemd.md) to
manage which services start when the system boots. On Debian and Ubuntu, the
Docker service starts on boot by default. To automatically start Docker and
containerd on boot for other Linux distributions using systemd, run the
following commands:
@z

@x
```console
$ sudo systemctl enable docker.service
$ sudo systemctl enable containerd.service
```
@y
```console
$ sudo systemctl enable docker.service
$ sudo systemctl enable containerd.service
```
@z

@x
To stop this behavior, use `disable` instead.
@y
To stop this behavior, use `disable` instead.
@z

@x
```console
$ sudo systemctl disable docker.service
$ sudo systemctl disable containerd.service
```
@y
```console
$ sudo systemctl disable docker.service
$ sudo systemctl disable containerd.service
```
@z

@x
If you need to add an HTTP proxy, set a different directory or partition for the
Docker runtime files, or make other customizations, see
[customize your systemd Docker daemon options](../../config/daemon/systemd.md).
@y
If you need to add an HTTP proxy, set a different directory or partition for the
Docker runtime files, or make other customizations, see
[customize your systemd Docker daemon options](../../config/daemon/systemd.md).
@z

@x
## Configure default logging driver
@y
## Configure default logging driver
@z

@x
Docker provides [logging drivers](../../config/containers/logging/index.md) for
collecting and viewing log data from all containers running on a host. The
default logging driver, `json-file`, writes log data to JSON-formatted files on
the host filesystem. Over time, these log files expand in size, leading to
potential exhaustion of disk resources.
@y
Docker provides [logging drivers](../../config/containers/logging/index.md) for
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
  [log rotation](../../config/containers/logging/json-file.md).
- Use an
  [alternative logging driver](../../config/containers/logging/configure.md#configure-the-default-logging-driver)
  such as the ["local" logging driver](../../config/containers/logging/local.md)
  that performs log rotation by default.
- Use a logging driver that sends logs to a remote logging aggregator.
@y
- Configure the `json-file` logging driver to turn on
  [log rotation](../../config/containers/logging/json-file.md).
- Use an
  [alternative logging driver](../../config/containers/logging/configure.md#configure-the-default-logging-driver)
  such as the ["local" logging driver](../../config/containers/logging/local.md)
  that performs log rotation by default.
- Use a logging driver that sends logs to a remote logging aggregator.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Read the [Get started](../../get-started/index.md) training modules
  to learn how to build an image and run it as a containerized application.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn
  how to build new applications using Docker.
@y
- Read the [Get started](../../get-started/index.md) training modules
  to learn how to build an image and run it as a containerized application.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn
  how to build new applications using Docker.
@z
