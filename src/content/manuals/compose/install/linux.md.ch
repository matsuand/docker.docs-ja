%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Download and install Docker Compose on Linux with this step-by-step handbook.
  This plugin can be installed manually or by using a repository.
keywords: install docker compose linux, docker compose linux, docker compose plugin,
  docker-compose-plugin, linux install docker compose, install docker-compose linux,
  linux install docker-compose, linux docker compose, docker compose v2 linux, install
  docker compose on linux
@y
description: Download and install Docker Compose on Linux with this step-by-step handbook.
  This plugin can be installed manually or by using a repository.
keywords: install docker compose linux, docker compose linux, docker compose plugin,
  docker-compose-plugin, linux install docker compose, install docker-compose linux,
  linux install docker-compose, linux docker compose, docker compose v2 linux, install
  docker compose on linux
@z

@x
title: Install the Docker Compose plugin
@y
title: Install the Docker Compose plugin
@z

@x
This page contains instructions on how to install the Docker Compose plugin on Linux from the command line.
@y
This page contains instructions on how to install the Docker Compose plugin on Linux from the command line.
@z

@x
To install the Docker Compose plugin on Linux, you can either:
- [Set up Docker's repository on your Linux system](#install-using-the-repository).
- [Install manually](#install-the-plugin-manually).
@y
To install the Docker Compose plugin on Linux, you can either:
- [Set up Docker's repository on your Linux system](#install-using-the-repository).
- [Install manually](#install-the-plugin-manually).
@z

@x
> [!NOTE]
>
> These instructions assume you already have Docker Engine and Docker CLI installed and now want to install the Docker Compose plugin. For the Docker Compose standalone, see [Install the Docker Compose Standalone](standalone.md).
@y
> [!NOTE]
>
> These instructions assume you already have Docker Engine and Docker CLI installed and now want to install the Docker Compose plugin. For the Docker Compose standalone, see [Install the Docker Compose Standalone](standalone.md).
@z

@x
## Install using the repository
@y
## Install using the repository
@z

@x
1. Set up the repository. Find distribution-specific instructions in:
@y
1. Set up the repository. Find distribution-specific instructions in:
@z

@x
    [Ubuntu](/manuals/engine/install/ubuntu.md#install-using-the-repository) |
    [CentOS](/manuals/engine/install/centos.md#set-up-the-repository) |
    [Debian](/manuals/engine/install/debian.md#install-using-the-repository) |
    [Raspberry Pi OS](/manuals/engine/install/raspberry-pi-os.md#install-using-the-repository) |
    [Fedora](/manuals/engine/install/fedora.md#set-up-the-repository) |
    [RHEL](/manuals/engine/install/rhel.md#set-up-the-repository) |
    [SLES](/manuals/engine/install/sles.md#set-up-the-repository).
@y
    [Ubuntu](manuals/engine/install/ubuntu.md#install-using-the-repository) |
    [CentOS](manuals/engine/install/centos.md#set-up-the-repository) |
    [Debian](manuals/engine/install/debian.md#install-using-the-repository) |
    [Raspberry Pi OS](manuals/engine/install/raspberry-pi-os.md#install-using-the-repository) |
    [Fedora](manuals/engine/install/fedora.md#set-up-the-repository) |
    [RHEL](manuals/engine/install/rhel.md#set-up-the-repository) |
    [SLES](manuals/engine/install/sles.md#set-up-the-repository).
@z

@x
2. Update the package index, and install the latest version of Docker Compose:
@y
2. Update the package index, and install the latest version of Docker Compose:
@z

@x
    * For Ubuntu and Debian, run:
@y
    * For Ubuntu and Debian, run:
@z

% snip command...

@x
    * For RPM-based distributions, run:
@y
    * For RPM-based distributions, run:
@z

% snip command...

@x
3.  Verify that Docker Compose is installed correctly by checking the version.
@y
3.  Verify that Docker Compose is installed correctly by checking the version.
@z

% snip command...

@x
    Expected output:
@y
    Expected output:
@z

% snip output...

@x
    Where `vN.N.N` is placeholder text standing in for the latest version.
@y
    Where `vN.N.N` is placeholder text standing in for the latest version.
@z

@x
### Update Docker Compose
@y
### Update Docker Compose
@z

@x
To update the Docker Compose plugin, run the following commands:
@y
To update the Docker Compose plugin, run the following commands:
@z

@x
* For Ubuntu and Debian, run:
@y
* For Ubuntu and Debian, run:
@z

% snip command...

@x
* For RPM-based distributions, run:
@y
* For RPM-based distributions, run:
@z

% snip command...

@x
## Install the plugin manually
@y
## Install the plugin manually
@z

@x
> [!NOTE]
>
> This option requires you to manage upgrades manually. It is recommended that you set up Docker's repository for easier maintenance.
@y
> [!NOTE]
>
> This option requires you to manage upgrades manually. It is recommended that you set up Docker's repository for easier maintenance.
@z

@x
1.  To download and install the Docker Compose CLI plugin, run:
@y
1.  To download and install the Docker Compose CLI plugin, run:
@z

% snip command...

@x
    This command downloads and installs the latest release of Docker Compose for the active user under `$HOME` directory.
@y
    This command downloads and installs the latest release of Docker Compose for the active user under `$HOME` directory.
@z

@x
    To install:
    - Docker Compose for _all users_ on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
    - A different version of Compose, substitute `{{% param "compose_version" %}}` with the version of Compose you want to use.
    - For a different architecture, substitute `x86_64` with the [architecture you want](https://github.com/docker/compose/releases).   
@y
    To install:
    - Docker Compose for _all users_ on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
    - A different version of Compose, substitute `{{% param "compose_version" %}}` with the version of Compose you want to use.
    - For a different architecture, substitute `x86_64` with the [architecture you want](https://github.com/docker/compose/releases).   
@z

@x
2. Apply executable permissions to the binary:
@y
2. Apply executable permissions to the binary:
@z

% snip command...

@x
    or, if you chose to install Compose for all users:
@y
    or, if you chose to install Compose for all users:
@z

% snip command...

@x
3. Test the installation.
@y
3. Test the installation.
@z

% snip command...
