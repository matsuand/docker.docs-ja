%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Instructions for installing Docker Desktop on Debian
keywords: debian, install, uninstall, upgrade, update, linux, desktop, docker desktop,
  docker desktop for linux, dd4l
title: Install Docker Desktop on Debian
@y
description: Debian への Docker Desktop インストール手順
keywords: debian, install, uninstall, upgrade, update, linux, desktop, docker desktop,
  docker desktop for linux, dd4l
title: Debian への Docker Desktop インストール
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
This page contains information on how to install, launch, and upgrade Docker Desktop on a Debian distribution.
@y
このページでは Debian ディストリビューションにおいて、Docker Desktop のインストール、実行、アップグレードを行う方法について示します。
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
- Meet the [general system requirements](_index.md#general-system-requirements).
- Have a 64-bit version of Debian 12.
- For a Gnome Desktop environment, you must also install AppIndicator and KStatusNotifierItem [Gnome extensions](https://extensions.gnome.org/extension/615/appindicator-support/).

- For non-Gnome Desktop environments, `gnome-terminal` must be installed:
@y
- Meet the [general system requirements](_index.md#general-system-requirements).
- Have a 64-bit version of Debian 12.
- For a Gnome Desktop environment, you must also install AppIndicator and KStatusNotifierItem [Gnome extensions](https://extensions.gnome.org/extension/615/appindicator-support/).

- For non-Gnome Desktop environments, `gnome-terminal` must be installed:
@z

% snip command...

@x
## Install Docker Desktop
@y
## Install Docker Desktop
@z

@x
Recommended approach to install Docker Desktop on Debian:
@y
Recommended approach to install Docker Desktop on Debian:
@z

@x
1. Set up Docker's `apt` repository.
   See step one of [Install using the `apt` repository](/manuals/engine/install/debian.md#install-using-the-repository).
@y
1. Set up Docker's `apt` repository.
   See step one of [Install using the `apt` repository](manuals/engine/install/debian.md#install-using-the-repository).
@z

@x
2. Download the latest [DEB package](https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64). For checksums, see the [Release notes](/manuals/desktop/release-notes.md).
@y
2. Download the latest [DEB package](https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64). For checksums, see the [Release notes](manuals/desktop/release-notes.md).
@z

@x
3. Install the package with apt as follows:
@y
3. Install the package with apt as follows:
@z

% snip command...

@x
  > [!NOTE]
  >
  > At the end of the installation process, `apt` displays an error due to installing a downloaded package. You
  > can ignore this error message.
  >
  > ```text
  > N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
  > ```
@y
  > [!NOTE]
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

% snip command...

@x
## Next steps
@y
## Next steps
@z

@x
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- Take a look at the [Docker workshop](/get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](/manuals/desktop/use-desktop/_index.md) and all its features.
- [Troubleshooting](/manuals/desktop/troubleshoot/_index.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](/manuals/desktop/faqs/general.md) provide answers to frequently asked questions.
- [Release notes](/manuals/desktop/release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](/manuals/desktop/backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- Take a look at the [Docker workshop](get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](manuals/desktop/use-desktop/_index.md) and all its features.
- [Troubleshooting](manuals/desktop/troubleshoot/_index.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](manuals/desktop/faqs/general.md) provide answers to frequently asked questions.
- [Release notes](manuals/desktop/release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](manuals/desktop/backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@z
