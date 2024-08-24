%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Download and install Docker Compose on Linux with this step-by-step handbook.
  This plugin can be installed manually or by using a repository.
keywords: install docker compose linux, docker compose linux, docker compose plugin,
  docker-compose-plugin, linux install docker compose, install docker-compose linux,
  linux install docker-compose, linux docker compose, docker compose v2 linux, install
  docker compose on linux
toc_max: 3
title: Install the Compose plugin
aliases:
- /compose/compose-plugin/
- /compose/compose-linux/
---
@y
---
description: Download and install Docker Compose on Linux with this step-by-step handbook.
  This plugin can be installed manually or by using a repository.
keywords: install docker compose linux, docker compose linux, docker compose plugin,
  docker-compose-plugin, linux install docker compose, install docker-compose linux,
  linux install docker-compose, linux docker compose, docker compose v2 linux, install
  docker compose on linux
toc_max: 3
title: Install the Compose plugin
aliases:
- /compose/compose-plugin/
- /compose/compose-linux/
---
@z

@x
On this page you can find instructions on how to install the Compose plugin on Linux from the command line.
@y
On this page you can find instructions on how to install the Compose plugin on Linux from the command line.
@z

@x
To install the Compose plugin on Linux, you can either:
- [Set up Docker's repository on your Linux system](#install-using-the-repository).
- [Install Compose manually](#install-the-plugin-manually).
@y
To install the Compose plugin on Linux, you can either:
- [Set up Docker's repository on your Linux system](#install-using-the-repository).
- [Install Compose manually](#install-the-plugin-manually).
@z

@x
> [!NOTE]
>
> These instructions assume you already have Docker Engine and Docker CLI installed and now want to install the Compose plugin.  
For Compose standalone, see [Install Compose Standalone](standalone.md).
@y
> [!NOTE]
>
> These instructions assume you already have Docker Engine and Docker CLI installed and now want to install the Compose plugin.  
For Compose standalone, see [Install Compose Standalone](standalone.md).
@z

@x
## Install using the repository
@y
## Install using the repository
@z

@x
1. Set up the repository. Find distro-specific instructions in:
@y
1. Set up the repository. Find distro-specific instructions in:
@z

@x
    [Ubuntu](../../engine/install/ubuntu.md/#install-using-the-repository) |
    [CentOS](../../engine/install/centos.md/#set-up-the-repository) |
    [Debian](../../engine/install/debian.md/#install-using-the-repository) |
    [Raspberry Pi OS](../../engine/install/raspberry-pi-os.md/#install-using-the-repository) |
    [Fedora](../../engine/install/fedora.md/#set-up-the-repository) |
    [RHEL](../../engine/install/rhel.md/#set-up-the-repository) |
    [SLES](../../engine/install/sles.md/#set-up-the-repository).
@y
    [Ubuntu](../../engine/install/ubuntu.md/#install-using-the-repository) |
    [CentOS](../../engine/install/centos.md/#set-up-the-repository) |
    [Debian](../../engine/install/debian.md/#install-using-the-repository) |
    [Raspberry Pi OS](../../engine/install/raspberry-pi-os.md/#install-using-the-repository) |
    [Fedora](../../engine/install/fedora.md/#set-up-the-repository) |
    [RHEL](../../engine/install/rhel.md/#set-up-the-repository) |
    [SLES](../../engine/install/sles.md/#set-up-the-repository).
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

@x
        ```console
        $ sudo apt-get update
        $ sudo apt-get install docker-compose-plugin
        ```
    * For RPM-based distros, run:
@y
        ```console
        $ sudo apt-get update
        $ sudo apt-get install docker-compose-plugin
        ```
    * For RPM-based distros, run:
@z

@x
        ```console
        $ sudo yum update
        $ sudo yum install docker-compose-plugin
        ```
@y
        ```console
        $ sudo yum update
        $ sudo yum install docker-compose-plugin
        ```
@z

@x
3.  Verify that Docker Compose is installed correctly by checking the version.
@y
3.  Verify that Docker Compose is installed correctly by checking the version.
@z

@x
    ```console
    $ docker compose version
    ```
@y
    ```console
    $ docker compose version
    ```
@z

@x
    Expected output:
@y
    Expected output:
@z

@x
    ```text
    Docker Compose version vN.N.N
    ```
@y
    ```text
    Docker Compose version vN.N.N
    ```
@z

@x
    Where `vN.N.N` is placeholder text standing in for the latest version.
@y
    Where `vN.N.N` is placeholder text standing in for the latest version.
@z

@x
### Update Compose
@y
### Update Compose
@z

@x
To update the Compose plugin, run the following commands:
@y
To update the Compose plugin, run the following commands:
@z

@x
* For Ubuntu and Debian, run:
@y
* For Ubuntu and Debian, run:
@z

@x
    ```console
    $ sudo apt-get update
    $ sudo apt-get install docker-compose-plugin
    ```
* For RPM-based distros, run:
@y
    ```console
    $ sudo apt-get update
    $ sudo apt-get install docker-compose-plugin
    ```
* For RPM-based distros, run:
@z

@x
    ```console
    $ sudo yum update
    $ sudo yum install docker-compose-plugin
    ```
@y
    ```console
    $ sudo yum update
    $ sudo yum install docker-compose-plugin
    ```
@z

@x
## Install the plugin manually
@y
## Install the plugin manually
@z

@x
> [!NOTE]
>
> This option requires you to manage upgrades manually. We recommend setting up Docker's repository for easier maintenance.
@y
> [!NOTE]
>
> This option requires you to manage upgrades manually. We recommend setting up Docker's repository for easier maintenance.
@z

@x
1.  To download and install the Compose CLI plugin, run:
@y
1.  To download and install the Compose CLI plugin, run:
@z

@x
    ```console
    $ DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    $ mkdir -p $DOCKER_CONFIG/cli-plugins
    $ curl -SL https://github.com/docker/compose/releases/download/{{% param "compose_version" %}}/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
@y
    ```console
    $ DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    $ mkdir -p $DOCKER_CONFIG/cli-plugins
    $ curl -SL https://github.com/docker/compose/releases/download/{{% param "compose_version" %}}/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
@z

@x
    This command downloads the latest release of Docker Compose (from the Compose releases repository) and installs Compose for the active user under `$HOME` directory.
@y
    This command downloads the latest release of Docker Compose (from the Compose releases repository) and installs Compose for the active user under `$HOME` directory.
@z

@x
    To install:
    * Docker Compose for _all users_ on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
    * A different version of Compose, substitute `{{% param "compose_version" %}}` with the version of Compose you want to use.
    - For a different architecture, substitute `x86_64` with the [architecture you want](https://github.com/docker/compose/releases).   
@y
    To install:
    * Docker Compose for _all users_ on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
    * A different version of Compose, substitute `{{% param "compose_version" %}}` with the version of Compose you want to use.
    - For a different architecture, substitute `x86_64` with the [architecture you want](https://github.com/docker/compose/releases).   
@z

@x
2. Apply executable permissions to the binary:
@y
2. Apply executable permissions to the binary:
@z

@x
    ```console
    $ chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
    or, if you chose to install Compose for all users:
@y
    ```console
    $ chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
    or, if you chose to install Compose for all users:
@z

@x
    ```console
    $ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
    ```
@y
    ```console
    $ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
    ```
@z

@x
3. Test the installation.
@y
3. Test the installation.
@z

@x
    ```console
    $ docker compose version
    Docker Compose version {{% param "compose_version" %}}
    ```
@y
    ```console
    $ docker compose version
    Docker Compose version {{% param "compose_version" %}}
    ```
@z
