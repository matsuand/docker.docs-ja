%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to install, launch and upgrade Docker Desktop on Ubuntu. This
  quick guide will cover prerequisites, installation methods, and more.
keywords: install docker ubuntu, ubuntu install docker, install docker on ubuntu,
  docker install ubuntu, how to install docker on ubuntu, ubuntu docker install, docker
  installation on ubuntu, docker ubuntu install, docker installing ubuntu, installing
  docker on ubuntu, docker desktop for ubuntu
title: Install Docker Desktop on Ubuntu
toc_max: 4
aliases:
- /desktop/linux/install/ubuntu/
---
@y
---
description: Learn how to install, launch and upgrade Docker Desktop on Ubuntu. This
  quick guide will cover prerequisites, installation methods, and more.
keywords: install docker ubuntu, ubuntu install docker, install docker on ubuntu,
  docker install ubuntu, how to install docker on ubuntu, ubuntu docker install, docker
  installation on ubuntu, docker ubuntu install, docker installing ubuntu, installing
  docker on ubuntu, docker desktop for ubuntu
title: Install Docker Desktop on Ubuntu
toc_max: 4
aliases:
- /desktop/linux/install/ubuntu/
---
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@y
> **Docker Desktop 契約条項**
>
> より大きなエンタープライズ向け（従業員 250 名以上、あるいは年間収益 1 千万 US ドル以上）に Docker Desktop を商用利用する場合は、[有償サブスクリプション](https://www.docker.com/pricing/) が必要です。
@z

@x
This page contains information on how to install, launch and upgrade Docker Desktop on an Ubuntu distribution.
@y
This page contains information on how to install, launch and upgrade Docker Desktop on an Ubuntu distribution.
@z

@x
{{< button text="DEB package" url="https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
@y
{{< button text="DEB package" url="https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
@z

@x
_For checksums, see [Release notes](../release-notes.md)_
@y
_For checksums, see [Release notes](../release-notes.md)_
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To install Docker Desktop successfully, you must:
@y
To install Docker Desktop successfully, you must:
@z

@x
- Meet the [system requirements](linux-install.md#system-requirements)
- Have a 64-bit version of either the latest LTS version (Ubuntu Jammy Jellyfish 22.04) or the current non-LTS version (Ubuntu Mantic Minotaur 23.10).
  Docker Desktop is supported on `x86_64` (or `amd64`) architecture.
- For non-Gnome Desktop environments, `gnome-terminal` must be installed:
  ```console
  $ sudo apt install gnome-terminal
  ```
## Install Docker Desktop
@y
- Meet the [system requirements](linux-install.md#system-requirements)
- Have a 64-bit version of either the latest LTS version (Ubuntu Jammy Jellyfish 22.04) or the current non-LTS version (Ubuntu Mantic Minotaur 23.10).
  Docker Desktop is supported on `x86_64` (or `amd64`) architecture.
- For non-Gnome Desktop environments, `gnome-terminal` must be installed:
  ```console
  $ sudo apt install gnome-terminal
  ```
## Install Docker Desktop
@z

@x
Recommended approach to install Docker Desktop on Ubuntu:
@y
Recommended approach to install Docker Desktop on Ubuntu:
@z

@x
1. Set up Docker's package repository.
   See step one of [Install using the `apt` repository](../../engine/install/ubuntu.md#install-using-the-repository).
@y
1. Set up Docker's package repository.
   See step one of [Install using the `apt` repository](../../engine/install/ubuntu.md#install-using-the-repository).
@z

@x
2. Download latest [DEB package](https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64).
@y
2. Download latest [DEB package](https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64).
@z

@x
3. Install the package with apt as follows:
@y
3. Install the package with apt as follows:
@z

@x
   ```console
   $ sudo apt-get update
   $ sudo apt-get install ./docker-desktop-<version>-<arch>.deb
   ```
@y
   ```console
   $ sudo apt-get update
   $ sudo apt-get install ./docker-desktop-<version>-<arch>.deb
   ```
@z

@x
   > **Note**
   >
   > At the end of the installation process, `apt` displays an error due to installing a downloaded package. You
   > can ignore this error message.
   >
   > ```text
   > N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
   > ```
@y
   > **Note**
   >
   > At the end of the installation process, `apt` displays an error due to installing a downloaded package. You
   > can ignore this error message.
   >
   > ```text
   > N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
   > ```
@z

@x
There are a few post-install configuration steps done through the post-install script contained in the deb package.
@y
There are a few post-install configuration steps done through the post-install script contained in the deb package.
@z

@x
The post-install script:
@y
The post-install script:
@z

@x
- Sets the capability on the Docker Desktop binary to map privileged ports and set resource limits.
- Adds a DNS name for Kubernetes to `/etc/hosts`.
- Creates a symlink from `/usr/local/bin/com.docker.cli` to `/usr/bin/docker`.
  This is because the classic Docker CLI is installed at `/usr/bin/docker`. The Docker Desktop installer also installs a Docker CLI binary that includes cloud-integration capabilities and is essentially a wrapper for the Compose CLI, at`/usr/local/bin/com.docker.cli`. The symlink ensures that the wrapper can access the classic Docker CLI. 
@y
- Sets the capability on the Docker Desktop binary to map privileged ports and set resource limits.
- Adds a DNS name for Kubernetes to `/etc/hosts`.
- Creates a symlink from `/usr/local/bin/com.docker.cli` to `/usr/bin/docker`.
  This is because the classic Docker CLI is installed at `/usr/bin/docker`. The Docker Desktop installer also installs a Docker CLI binary that includes cloud-integration capabilities and is essentially a wrapper for the Compose CLI, at`/usr/local/bin/com.docker.cli`. The symlink ensures that the wrapper can access the classic Docker CLI. 
@z

@x
## Launch Docker Desktop
@y
## Launch Docker Desktop
@z

@x
{{< include "desktop-linux-launch.md" >}}
@y
{{< include "desktop-linux-launch.md" >}}
@z

@x
## Upgrade Docker Desktop
@y
## Upgrade Docker Desktop
@z

@x
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to download the new package each time you want to upgrade Docker Desktop and run:
@y
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to download the new package each time you want to upgrade Docker Desktop and run:
@z

@x
```console
$ sudo apt-get install ./docker-desktop-<version>-<arch>.deb
```
@y
```console
$ sudo apt-get install ./docker-desktop-<version>-<arch>.deb
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Take a look at the [Get started](../../guides/get-started/_index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
- Take a look at the [Get started](../../guides/get-started/_index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@z
