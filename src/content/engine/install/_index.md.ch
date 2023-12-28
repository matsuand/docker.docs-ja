%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Install Docker Engine
description: Learn how to choose the best method for you to install Docker Engine. This client-server
  application is available on Linux, Mac, Windows, and as a static binary.
keywords: install engine, docker engine install, install docker engine, docker engine
  installation, engine install, docker ce installation, docker ce install, engine
  installer, installing docker engine, docker server install, docker desktop vs docker engine
aliases:
- /cs-engine/
- /cs-engine/1.12/
- /cs-engine/1.12/upgrade/
- /cs-engine/1.13/
- /cs-engine/1.13/upgrade/
- /ee/docker-ee/oracle/
- /ee/supported-platforms/
- /en/latest/installation/
- /engine/installation/
- /engine/installation/frugalware/
- /engine/installation/linux/
- /engine/installation/linux/archlinux/
- /engine/installation/linux/cruxlinux/
- /engine/installation/linux/docker-ce/
- /engine/installation/linux/docker-ee/
- /engine/installation/linux/docker-ee/oracle/
- /engine/installation/linux/frugalware/
- /engine/installation/linux/gentoolinux/
- /engine/installation/linux/oracle/
- /engine/installation/linux/other/
- /engine/installation/oracle/
- /enterprise/supported-platforms/
- /install/linux/docker-ee/oracle/
---
@y
---
title: Docker Engine のインストール
description: Learn how to choose the best method for you to install Docker Engine. This client-server
  application is available on Linux, Mac, Windows, and as a static binary.
keywords: install engine, docker engine install, install docker engine, docker engine
  installation, engine install, docker ce installation, docker ce install, engine
  installer, installing docker engine, docker server install, docker desktop vs docker engine
aliases:
- /cs-engine/
- /cs-engine/1.12/
- /cs-engine/1.12/upgrade/
- /cs-engine/1.13/
- /cs-engine/1.13/upgrade/
- /ee/docker-ee/oracle/
- /ee/supported-platforms/
- /en/latest/installation/
- /engine/installation/
- /engine/installation/frugalware/
- /engine/installation/linux/
- /engine/installation/linux/archlinux/
- /engine/installation/linux/cruxlinux/
- /engine/installation/linux/docker-ce/
- /engine/installation/linux/docker-ee/
- /engine/installation/linux/docker-ee/oracle/
- /engine/installation/linux/frugalware/
- /engine/installation/linux/gentoolinux/
- /engine/installation/linux/oracle/
- /engine/installation/linux/other/
- /engine/installation/oracle/
- /enterprise/supported-platforms/
- /install/linux/docker-ee/oracle/
---
@z

@x
This section describes how to install Docker Engine on Linux, also known as
Docker CE. Docker Engine is also available for Windows, macOS, and Linux,
through Docker Desktop. For instructions on how to install Docker Desktop, see:
@y
This section describes how to install Docker Engine on Linux, also known as
Docker CE. Docker Engine is also available for Windows, macOS, and Linux,
through Docker Desktop. For instructions on how to install Docker Desktop, see:
@z

@x
- [Docker Desktop for Linux](../../desktop/install/linux-install.md)
- [Docker Desktop for Mac (macOS)](../../desktop/install/mac-install.md)
- [Docker Desktop for Windows](../../desktop/install/windows-install.md)
@y
- [Docker Desktop for Linux](../../desktop/install/linux-install.md)
- [Docker Desktop for Mac (macOS)](../../desktop/install/mac-install.md)
- [Docker Desktop for Windows](../../desktop/install/windows-install.md)
@z

@x
## Supported platforms
@y
## サポートするプラットフォーム {#supported-platforms}
@z

@x
| Platform                                       | x86_64 / amd64    | arm64 / aarch64   | arm (32-bit)             | ppc64le         | s390x           |
| :--------------------------------------------- | :---------------- | :---------------- | :----------------------- | :-------------- | :-------------- |
| [CentOS](centos.md)                            | [✅](centos.md)   | [✅](centos.md)   |                          | [✅](centos.md) |                 |
| [Debian](debian.md)                            | [✅](debian.md)   | [✅](debian.md)   | [✅](debian.md)          | [✅](debian.md) |                 |
| [Fedora](fedora.md)                            | [✅](fedora.md)   | [✅](fedora.md)   |                          | [✅](fedora.md) |                 |
| [Raspberry Pi OS (32-bit)](raspberry-pi-os.md) |                   |                   | [✅](raspberry-pi-os.md) |                 |                 |
| [RHEL (s390x)](rhel.md)                        |                   |                   |                          |                 | [✅](rhel.md)   |
| [SLES](sles.md)                                |                   |                   |                          |                 | [✅](sles.md)   |
| [Ubuntu](ubuntu.md)                            | [✅](ubuntu.md)   | [✅](ubuntu.md)   | [✅](ubuntu.md)          | [✅](ubuntu.md) | [✅](ubuntu.md) |
| [Binaries](binaries.md)                        | [✅](binaries.md) | [✅](binaries.md) | [✅](binaries.md)        |                 |                 |
@y
| プラットフォーム                                 | x86_64 / amd64    | arm64 / aarch64   | arm (32ビット)           | ppc64le         | s390x           |
| :----------------------------------------------- | :---------------- | :---------------- | :----------------------- | :-------------- | :-------------- |
| [CentOS](centos.md)                              | [✅](centos.md)   | [✅](centos.md)   |                          | [✅](centos.md) |                 |
| [Debian](debian.md)                              | [✅](debian.md)   | [✅](debian.md)   | [✅](debian.md)          | [✅](debian.md) |                 |
| [Fedora](fedora.md)                              | [✅](fedora.md)   | [✅](fedora.md)   |                          | [✅](fedora.md) |                 |
| [Raspberry Pi OS (32ビット)](raspberry-pi-os.md) |                   |                   | [✅](raspberry-pi-os.md) |                 |                 |
| [RHEL (s390x)](rhel.md)                          |                   |                   |                          |                 | [✅](rhel.md)   |
| [SLES](sles.md)                                  |                   |                   |                          |                 | [✅](sles.md)   |
| [Ubuntu](ubuntu.md)                              | [✅](ubuntu.md)   | [✅](ubuntu.md)   | [✅](ubuntu.md)          | [✅](ubuntu.md) | [✅](ubuntu.md) |
| [Binaries](binaries.md)                          | [✅](binaries.md) | [✅](binaries.md) | [✅](binaries.md)        |                 |                 |
@z

@x
### Other Linux distros
@y
### その他の Linux ディストロ {#other-linux-distros}
@z

@x
> **Note**
>
> While the following instructions may work, Docker doesn't test or verify
> installation on distro derivatives.
@y
> **メモ**
>
> While the following instructions may work, Docker doesn't test or verify
> installation on distro derivatives.
@z

@x
- If you use Debian derivatives such as "BunsenLabs Linux", "Kali Linux" or 
  "LMDE" (Debian-based Mint) should follow the installation instructions for
  [Debian](debian.md), substitute the version of your distro for the
  corresponding Debian release. Refer to the documentation of your distro to find
  which Debian release corresponds with your derivative version.
- Likewise, if you use Ubuntu derivatives such as "Kubuntu", "Lubuntu" or "Xubuntu"
  you should follow the installation instructions for [Ubuntu](ubuntu.md),
  substituting the version of your distro for the corresponding Ubuntu release.
  Refer to the documentation of your distro to find which Ubuntu release
  corresponds with your derivative version.
- Some Linux distros provide a package of Docker Engine through their
  package repositories. These packages are built and maintained by the Linux
  distro's package maintainers and may have differences in configuration
  or are built from modified source code. Docker isn't involved in releasing these
  packages and you should report any bugs or issues involving these packages to
  your Linux distro's issue tracker.
@y
- If you use Debian derivatives such as "BunsenLabs Linux", "Kali Linux" or 
  "LMDE" (Debian-based Mint) should follow the installation instructions for
  [Debian](debian.md), substitute the version of your distro for the
  corresponding Debian release. Refer to the documentation of your distro to find
  which Debian release corresponds with your derivative version.
- Likewise, if you use Ubuntu derivatives such as "Kubuntu", "Lubuntu" or "Xubuntu"
  you should follow the installation instructions for [Ubuntu](ubuntu.md),
  substituting the version of your distro for the corresponding Ubuntu release.
  Refer to the documentation of your distro to find which Ubuntu release
  corresponds with your derivative version.
- Some Linux distros provide a package of Docker Engine through their
  package repositories. These packages are built and maintained by the Linux
  distro's package maintainers and may have differences in configuration
  or are built from modified source code. Docker isn't involved in releasing these
  packages and you should report any bugs or issues involving these packages to
  your Linux distro's issue tracker.
@z

@x
Docker provides [binaries](binaries.md) for manual installation of Docker Engine.
These binaries are statically linked and you can use them on any Linux distro.
@y
Docker provides [binaries](binaries.md) for manual installation of Docker Engine.
These binaries are statically linked and you can use them on any Linux distro.
@z

@x
## Release channels
@y
## Release channels
@z

@x
Docker Engine has two types of update channels, **stable** and **test**:
@y
Docker Engine has two types of update channels, **stable** and **test**:
@z

@x
* The **stable** channel gives you the latest versions released for general availability.
* The **test** channel gives you pre-release versions that are ready for testing before
  general availability.
@y
* The **stable** channel gives you the latest versions released for general availability.
* The **test** channel gives you pre-release versions that are ready for testing before
  general availability.
@z

@x
Use the test channel with caution. Pre-release versions include experimental and
early-access features that are subject to breaking changes.
@y
Use the test channel with caution. Pre-release versions include experimental and
early-access features that are subject to breaking changes.
@z

@x
## Support
@y
## サポート {#support}
@z

@x
Docker Engine is an open source project, supported by the Moby project maintainers
and community members. Docker doesn't provide support for Docker Engine.
Docker provides support for Docker products, including Docker Desktop, which uses
Docker Engine as one of its components.
@y
Docker Engine is an open source project, supported by the Moby project maintainers
and community members. Docker doesn't provide support for Docker Engine.
Docker provides support for Docker products, including Docker Desktop, which uses
Docker Engine as one of its components.
@z

@x
For information about the open source project, refer to the
[Moby project website](https://mobyproject.org/).
@y
For information about the open source project, refer to the
[Moby project website](https://mobyproject.org/).
@z

@x
### Upgrade path
@y
### Upgrade path
@z

@x
Patch releases are always backward compatible with its major and minor version.
@y
Patch releases are always backward compatible with its major and minor version.
@z

@x
### Licensing
@y
## ライセンス {#licensing}
@z

@x
Docker Engine is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full
license text.
@y
Docker Engine は ライセンスとして Apache License, Version 2.0 を採用しています。
ライセンス全文は [LICENSE](https://github.com/moby/moby/blob/master/LICENSE) を参照してください。
@z

@x
## Reporting security issues
@y
## Reporting security issues
@z

@x
If you discover a security issue, we request that you bring it to our attention immediately.
@y
If you discover a security issue, we request that you bring it to our attention immediately.
@z

@x
DO NOT file a public issue. Instead, submit your report privately to security@docker.com.
@y
DO NOT file a public issue. Instead, submit your report privately to security@docker.com.
@z

@x
Security reports are greatly appreciated, and Docker will publicly thank you for it.
@y
Security reports are greatly appreciated, and Docker will publicly thank you for it.
@z

@x
## Get started
@y
## はじめよう {#get-started}
@z

@x
After setting up Docker, you can learn the basics with
[Getting started with Docker](../../get-started/index.md).
@y
After setting up Docker, you can learn the basics with
[Getting started with Docker](../../get-started/index.md).
@z
