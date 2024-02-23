%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Desktop Arch package. Mostly meant
  for hackers who want to try out Docker Desktop on a variety of Arch-based distributions.
keywords: Arch Linux, install, uninstall, upgrade, update, linux, desktop, docker
  desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Arch-based distributions
aliases:
- /desktop/linux/install/archlinux/
---
@y
---
description: Instructions for installing Docker Desktop Arch package. Mostly meant
  for hackers who want to try out Docker Desktop on a variety of Arch-based distributions.
keywords: Arch Linux, install, uninstall, upgrade, update, linux, desktop, docker
  desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Arch-based distributions
aliases:
- /desktop/linux/install/archlinux/
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
This topic discusses installation of Docker Desktop from an [Arch package](https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-x86_64.pkg.tar.zst) that Docker provides in addition to the supported platforms. Docker has not tested or verified the installation.
@y
This topic discusses installation of Docker Desktop from an [Arch package](https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-x86_64.pkg.tar.zst) that Docker provides in addition to the supported platforms. Docker has not tested or verified the installation.
@z

@x
{{< button text="Arch package (experimental)" url="https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-x86_64.pkg.tar.zst?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
@y
{{< button text="Arch package (experimental)" url="https://desktop.docker.com/linux/main/amd64/137060/docker-desktop-4.27.2-x86_64.pkg.tar.zst?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
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
To install Docker Desktop successfully, you must meet the [system requirements](linux-install.md#system-requirements).
@y
To install Docker Desktop successfully, you must meet the [system requirements](linux-install.md#system-requirements).
@z

@x
Additionally, for non-Gnome Desktop environments, `gnome-terminal` must be installed:
@y
Additionally, for non-Gnome Desktop environments, `gnome-terminal` must be installed:
@z

@x
```console
$ sudo pacman -S gnome-terminal
```
@y
```console
$ sudo pacman -S gnome-terminal
```
@z

@x
## Install Docker Desktop
@y
## Install Docker Desktop
@z

@x
1. Install client binaries. Docker does not have an Arch package repository. Binaries not included in the package must be installed manually before installing Docker Desktop.
@y
1. Install client binaries. Docker does not have an Arch package repository. Binaries not included in the package must be installed manually before installing Docker Desktop.
@z

@x
2. [Install Docker client binary on Linux](../../engine/install/binaries.md#install-daemon-and-client-binaries-on-linux). On Arch-based distributions, users must install the Docker client binary.
   Static binaries for the Docker client are available for Linux (as `docker`).
@y
2. [Install Docker client binary on Linux](../../engine/install/binaries.md#install-daemon-and-client-binaries-on-linux). On Arch-based distributions, users must install the Docker client binary.
   Static binaries for the Docker client are available for Linux (as `docker`).
@z

@x
3. Download the Arch package from the [release](../release-notes.md) page.
@y
3. Download the Arch package from the [release](../release-notes.md) page.
@z

@x
4. Install the package:
@y
4. Install the package:
@z

@x
   ```console
   $ sudo pacman -U ./docker-desktop-<version>-<arch>.pkg.tar.zst
   ```
@y
   ```console
   $ sudo pacman -U ./docker-desktop-<version>-<arch>.pkg.tar.zst
   ```
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
## Next steps
@y
## Next steps
@z

@x
- Take a look at the [Get started](../../get-started/index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
- Take a look at the [Get started](../../get-started/index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@z
