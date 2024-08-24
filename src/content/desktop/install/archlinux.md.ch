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
title: Install Docker Desktop on Arch-based distributions
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
This page contains information on how to install, launch and upgrade Docker Desktop on an Arch-based distribution. Docker has not tested or verified the installation.
@y
This page contains information on how to install, launch and upgrade Docker Desktop on an Arch-based distribution. Docker has not tested or verified the installation.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To install Docker Desktop successfully, you must meet the [general system requirements](linux-install.md#general-system-requirements).
@y
To install Docker Desktop successfully, you must meet the [general system requirements](linux-install.md#general-system-requirements).
@z

@x
Additionally, for non-Gnome Desktop environments, `gnome-terminal` must be installed:
@y
Additionally, for non-Gnome Desktop environments, `gnome-terminal` must be installed:
@z

% snip command...

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
3. Download the latest Arch package from the [Release notes](../release-notes.md).
@y
3. Download the latest Arch package from the [Release notes](../release-notes.md).
@z

@x
4. Install the package:
@y
4. Install the package:
@z

% snip command...

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
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- Take a look at the [Docker workshop](/get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- Take a look at the [Docker workshop](get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@z
