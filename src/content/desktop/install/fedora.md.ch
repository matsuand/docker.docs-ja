%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Instructions for installing Docker Desktop on Fedora
keywords: fedora, rpm, update install, uninstall, upgrade, update, linux, desktop,
  docker desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Fedora
@y
description: Instructions for installing Docker Desktop on Fedora
keywords: fedora, rpm, update install, uninstall, upgrade, update, linux, desktop,
  docker desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Fedora
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
This page contains information on how to install, launch and upgrade Docker Desktop on a Fedora distribution.
@y
This page contains information on how to install, launch and upgrade Docker Desktop on a Fedora distribution.
@z

@x
{{< button text="RPM package" url="https://desktop.docker.com/linux/main/amd64/149282/docker-desktop-4.30.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
@y
{{< button text="RPM パッケージ" url="https://desktop.docker.com/linux/main/amd64/149282/docker-desktop-4.30.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" >}}
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
To install Docker Desktop successfully, you must:
@y
To install Docker Desktop successfully, you must:
@z

@x
- Meet the [system requirements](linux-install.md#general-system-requirements).
- Have a 64-bit version of Fedora 39 or Fedora 40.
@y
- Meet the [system requirements](linux-install.md#general-system-requirements).
- Have a 64-bit version of Fedora 39 or Fedora 40.
@z

@x
Additionally, for a GNOME desktop environment you must install AppIndicator and KStatusNotifierItem [GNOME extensions](https://extensions.gnome.org/extension/615/appindicator-support/).
@y
Additionally, for a GNOME desktop environment you must install AppIndicator and KStatusNotifierItem [GNOME extensions](https://extensions.gnome.org/extension/615/appindicator-support/).
@z

@x
For non-GNOME desktop environments, `gnome-terminal` must be installed:
@y
For non-GNOME desktop environments, `gnome-terminal` must be installed:
@z

% snip command...

@x
## Install Docker Desktop
@y
## Docker Desktop のインストール {#install-docker-desktop}
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
2. Download latest [RPM package](https://desktop.docker.com/linux/main/amd64/149282/docker-desktop-4.30.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64).
@y
2. Download latest [RPM package](https://desktop.docker.com/linux/main/amd64/149282/docker-desktop-4.30.0-x86_64.rpm?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64).
@z

@x
3. Install the package with dnf as follows:
@y
3. Install the package with dnf as follows:
@z

% snip command...

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
## Docker Desktop の起動 {#launch-docker-desktop}
@z

@x
{{< include "desktop-linux-launch.md" >}}
@y
{{< include "desktop-linux-launch.md" >}}
@z

@x
## Upgrade Docker Desktop
@y
## Docker Desktop のアップグレード {#upgrade-docker-desktop}
@z

@x
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to first remove the previous version and then download the new package each time you want to upgrade Docker Desktop. Run:
@y
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to first remove the previous version and then download the new package each time you want to upgrade Docker Desktop. Run:
@z

% snip command...

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
- Take a look at the [Get started](../../get-started/_index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
@y
- Take a look at the [Get started](../../get-started/_index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
@z
