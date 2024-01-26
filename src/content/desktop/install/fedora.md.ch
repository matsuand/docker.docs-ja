%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Desktop on Fedora
keywords: fedora, rpm, update install, uninstall, upgrade, update, linux, desktop,
  docker desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Fedora
toc_max: 4
aliases:
- /desktop/linux/install/fedora/
---
@y
---
description: Instructions for installing Docker Desktop on Fedora
keywords: fedora, rpm, update install, uninstall, upgrade, update, linux, desktop,
  docker desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Fedora
toc_max: 4
aliases:
- /desktop/linux/install/fedora/
---
@z

@x
This page contains information on how to install, launch and upgrade Docker Desktop on a Fedora distribution.
@y
This page contains information on how to install, launch and upgrade Docker Desktop on a Fedora distribution.
@z

@x
{{< button text="RPM package" url="https://desktop.docker.com/linux/main/amd64/135262/docker-desktop-4.27.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
@y
{{< button text="RPM package" url="https://desktop.docker.com/linux/main/amd64/135262/docker-desktop-4.27.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
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
- Meet the [system requirements](linux-install.md#system-requirements).
- Have a 64-bit version of either Fedora 38 or Fedora 39.
@y
- Meet the [system requirements](linux-install.md#system-requirements).
- Have a 64-bit version of either Fedora 38 or Fedora 39.
@z

@x
Additionally, for a Gnome Desktop environment you must install AppIndicator and KStatusNotifierItem [Gnome extensions](https://extensions.gnome.org/extension/615/appindicator-support/).
@y
Additionally, for a Gnome Desktop environment you must install AppIndicator and KStatusNotifierItem [Gnome extensions](https://extensions.gnome.org/extension/615/appindicator-support/).
@z

@x
For non-Gnome Desktop environments, `gnome-terminal` must be installed:
@y
For non-Gnome Desktop environments, `gnome-terminal` must be installed:
@z

@x
```console
$ sudo dnf install gnome-terminal
```
@y
```console
$ sudo dnf install gnome-terminal
```
@z

@x
## Install Docker Desktop
@y
## Install Docker Desktop
@z

@x
To install Docker Desktop on Fedora:
@y
To install Docker Desktop on Fedora:
@z

@x
1. Set up [Docker's package repository](../../engine/install/fedora.md#set-up-the-repository).
@y
1. Set up [Docker's package repository](../../engine/install/fedora.md#set-up-the-repository).
@z

@x
2. Download latest [RPM package](https://desktop.docker.com/linux/main/amd64/135262/docker-desktop-4.27.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64).
@y
2. Download latest [RPM package](https://desktop.docker.com/linux/main/amd64/135262/docker-desktop-4.27.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64).
@z

@x
3. Install the package with dnf as follows:
@y
3. Install the package with dnf as follows:
@z

@x
   ```console
   $ sudo dnf install ./docker-desktop-<version>-<arch>.rpm
   ```
@y
   ```console
   $ sudo dnf install ./docker-desktop-<version>-<arch>.rpm
   ```
@z

@x
There are a few post-install configuration steps done through the post-install script contained in the RPM package.
@y
There are a few post-install configuration steps done through the post-install script contained in the RPM package.
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
You need to first remove the previous version and then download the new package each time you want to upgrade Docker Desktop. Run:
@y
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to first remove the previous version and then download the new package each time you want to upgrade Docker Desktop. Run:
@z

@x
```console
$ sudo dnf remove docker-desktop
$ sudo dnf install ./docker-desktop-<version>-<arch>.rpm
```
@y
```console
$ sudo dnf remove docker-desktop
$ sudo dnf install ./docker-desktop-<version>-<arch>.rpm
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
