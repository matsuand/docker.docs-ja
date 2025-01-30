%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Instructions for installing Docker Desktop Arch package. Mostly meant
  for hackers who want to try out Docker Desktop on a variety of Arch-based distributions.
keywords: Arch Linux, install, uninstall, upgrade, update, linux, desktop, docker
  desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on Arch-based distributions
@y
description: Instructions for installing Docker Desktop Arch package. Mostly meant
  for hackers who want to try out Docker Desktop on a variety of Arch-based distributions.
keywords: Arch Linux, install, uninstall, upgrade, update, linux, desktop, docker
  desktop, docker desktop for linux, dd4l
title: Arch ベースディストリビューションへの Docker Desktop のインストール
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
This page contains information on how to install, launch and upgrade Docker Desktop on an Arch-based distribution. 
@y
本ページでは、Arch ベースディストリビューションへの Docker Desktop のインストール、起動、アップグレード方法について説明するものです。
@z

@x
{{< summary-bar feature_name="Docker Desktop Archlinux" >}}
@y
{{< summary-bar feature_name="Docker Desktop Archlinux" >}}
@z

@x
## Prerequisites
@y
## 前提要件 {#prerequisites}
@z

@x
To install Docker Desktop successfully, you must meet the [general system requirements](_index.md#general-system-requirements).
@y
Docker Desktop のインストールを正常に行うためには、[一般的なシステム要件](_index.md#general-system-requirements) を満たしていることが必要です。
@z

@x
## Install Docker Desktop
@y
## Docker Desktop のインストール {#install-docker-desktop}
@z

@x
1. [Install the Docker client binary on Linux](/manuals/engine/install/binaries.md#install-daemon-and-client-binaries-on-linux). Static binaries for the Docker client are available for Linux as `docker`. You can use:
@y
1. [Install the Docker client binary on Linux](manuals/engine/install/binaries.md#install-daemon-and-client-binaries-on-linux). Static binaries for the Docker client are available for Linux as `docker`. You can use:
@z

% snip command...

@x
2. Download the latest Arch package from the [Release notes](/manuals/desktop/release-notes.md).
@y
2. Download the latest Arch package from the [Release notes](manuals/desktop/release-notes.md).
@z

@x
3. Install the package:
@y
3. Install the package:
@z

% snip command...

@x
   By default, Docker Desktop is installed at `/opt/docker-desktop`.
@y
   By default, Docker Desktop is installed at `/opt/docker-desktop`.
@z

@x
## Launch Docker Desktop
@y
## Launch Docker Desktop
@z

@x
{{% include "desktop-linux-launch.md" %}}
@y
{{% include "desktop-linux-launch.md" %}}
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Explore [Docker's subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- Take a look at the [Docker workshop](/get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](/manuals/desktop/use-desktop/_index.md) and all its features.
- [Troubleshooting](/manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](/manuals/desktop/troubleshoot-and-support/faqs/general.md) provide answers to frequently asked questions.
- [Release notes](/manuals/desktop/release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](/manuals/desktop/settings-and-maintenance/backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- Explore [Docker's subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- Take a look at the [Docker workshop](get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](manuals/desktop/use-desktop/_index.md) and all its features.
- [Troubleshooting](manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](manuals/desktop/troubleshoot-and-support/faqs/general.md) provide answers to frequently asked questions.
- [Release notes](manuals/desktop/release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](manuals/desktop/settings-and-maintenance/backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@z
