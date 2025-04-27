%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Install Docker on Linux with ease using our step-by-step installation
  guide covering system requirements, supported platforms, and where to go next.
keywords: linux, docker linux install, docker linux, linux docker installation, docker
  for linux, docker desktop for linux, installing docker on linux, docker download
  linux, how to install docker on linux, linux vs docker engine, switch docker contexts
title: Install Docker Desktop on Linux
@y
description: Install Docker on Linux with ease using our step-by-step installation
  guide covering system requirements, supported platforms, and where to go next.
keywords: linux, docker linux install, docker linux, linux docker installation, docker
  for linux, docker desktop for linux, installing docker on linux, docker download
  linux, how to install docker on linux, linux vs docker engine, switch docker contexts
title: Linux への Docker Desktop のインストール
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees or more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@y
> **Docker Desktop 契約条項**
>
> より大きなエンタープライズ向け（従業員 250 名以上、あるいは年間収益 1 千万 US ドル以上）に Docker Desktop を商用利用する場合は、[有償サブスクリプション](https://www.docker.com/pricing/) が必要です。
@z

@x
This page contains information about general system requirements, supported platforms, and instructions on how to install Docker Desktop for Linux.
@y
This page contains information about general system requirements, supported platforms, and instructions on how to install Docker Desktop for Linux.
@z

@x
> [!IMPORTANT]
>
>Docker Desktop on Linux runs a Virtual Machine (VM) which creates and uses a custom docker context, `desktop-linux`, on startup. 
>
>This means images and containers deployed on the Linux Docker Engine (before installation) are not available in Docker Desktop for Linux. 
>
> {{< accordion title=" Docker Desktop vs Docker Engine: What's the difference?" >}}
@y
> [!IMPORTANT]
>
>Docker Desktop on Linux runs a Virtual Machine (VM) which creates and uses a custom docker context, `desktop-linux`, on startup. 
>
>This means images and containers deployed on the Linux Docker Engine (before installation) are not available in Docker Desktop for Linux. 
>
> {{< accordion title=" Docker Desktop vs Docker Engine: What's the difference?" >}}
@z

@x
> [!IMPORTANT]
>
> For commercial use of Docker Engine obtained via Docker Desktop within larger enterprises (exceeding 250 employees or with annual revenue surpassing $10 million USD), a [paid subscription](https://www.docker.com/pricing/) is required.
@y
> [!IMPORTANT]
>
> For commercial use of Docker Engine obtained via Docker Desktop within larger enterprises (exceeding 250 employees or with annual revenue surpassing $10 million USD), a [paid subscription](https://www.docker.com/pricing/) is required.
@z

@x
Docker Desktop for Linux provides a user-friendly graphical interface that simplifies the management of containers and services. It includes Docker Engine as this is the core technology that powers Docker containers. Docker Desktop for Linux also comes with additional features like Docker Scout and Docker Extensions.
@y
Docker Desktop for Linux provides a user-friendly graphical interface that simplifies the management of containers and services. It includes Docker Engine as this is the core technology that powers Docker containers. Docker Desktop for Linux also comes with additional features like Docker Scout and Docker Extensions.
@z

@x
#### Installing Docker Desktop and Docker Engine
@y
#### Docker Desktop と Docker Engine のインストール {#installing-docker-desktop-and-docker-engine}
@z

@x
Docker Desktop for Linux and Docker Engine can be installed side-by-side on the
same machine. Docker Desktop for Linux stores containers and images in an isolated
storage location within a VM and offers
controls to restrict [its resources](/manuals/desktop/settings-and-maintenance/settings.md#resources). Using a dedicated storage
location for Docker Desktop prevents it from interfering with a Docker Engine
installation on the same machine.
@y
Docker Desktop for Linux and Docker Engine can be installed side-by-side on the
same machine. Docker Desktop for Linux stores containers and images in an isolated
storage location within a VM and offers
controls to restrict [its resources](manuals/desktop/settings-and-maintenance/settings.md#resources). Using a dedicated storage
location for Docker Desktop prevents it from interfering with a Docker Engine
installation on the same machine.
@z

@x
While it's possible to run both Docker Desktop and Docker Engine simultaneously,
there may be situations where running both at the same time can cause issues.
For example, when mapping network ports (`-p` / `--publish`) for containers, both
Docker Desktop and Docker Engine may attempt to reserve the same port on your
machine, which can lead to conflicts ("port already in use").
@y
While it's possible to run both Docker Desktop and Docker Engine simultaneously,
there may be situations where running both at the same time can cause issues.
For example, when mapping network ports (`-p` / `--publish`) for containers, both
Docker Desktop and Docker Engine may attempt to reserve the same port on your
machine, which can lead to conflicts ("port already in use").
@z

@x
We generally recommend stopping the Docker Engine while you're using Docker Desktop
to prevent the Docker Engine from consuming resources and to prevent conflicts
as described above.
@y
We generally recommend stopping the Docker Engine while you're using Docker Desktop
to prevent the Docker Engine from consuming resources and to prevent conflicts
as described above.
@z

@x
Use the following command to stop the Docker Engine service:
@y
Use the following command to stop the Docker Engine service:
@z

% snip command...

@x
Depending on your installation, the Docker Engine may be configured to automatically
start as a system service when your machine starts. Use the following command to
disable the Docker Engine service, and to prevent it from starting automatically:
@y
Depending on your installation, the Docker Engine may be configured to automatically
start as a system service when your machine starts. Use the following command to
disable the Docker Engine service, and to prevent it from starting automatically:
@z

% snip command...

@x
### Switching between Docker Desktop and Docker Engine
@y
### Switching between Docker Desktop and Docker Engine
@z

@x
The Docker CLI can be used to interact with multiple Docker Engines. For example,
you can use the same Docker CLI to control a local Docker Engine and to control
a remote Docker Engine instance running in the cloud. [Docker Contexts](/manuals/engine/manage-resources/contexts.md)
allow you to switch between Docker Engines instances.
@y
The Docker CLI can be used to interact with multiple Docker Engines. For example,
you can use the same Docker CLI to control a local Docker Engine and to control
a remote Docker Engine instance running in the cloud. [Docker Contexts](manuals/engine/manage-resources/contexts.md)
allow you to switch between Docker Engines instances.
@z

@x
When installing Docker Desktop, a dedicated "desktop-linux" context is created to
interact with Docker Desktop. On startup, Docker Desktop automatically sets its
own context (`desktop-linux`) as the current context. This means that subsequent
Docker CLI commands target Docker Desktop. On shutdown, Docker Desktop resets
the current context to the `default` context.
@y
When installing Docker Desktop, a dedicated "desktop-linux" context is created to
interact with Docker Desktop. On startup, Docker Desktop automatically sets its
own context (`desktop-linux`) as the current context. This means that subsequent
Docker CLI commands target Docker Desktop. On shutdown, Docker Desktop resets
the current context to the `default` context.
@z

@x
Use the `docker context ls` command to view what contexts are available on your
machine. The current context is indicated with an asterisk (`*`).
@y
Use the `docker context ls` command to view what contexts are available on your
machine. The current context is indicated with an asterisk (`*`).
@z

% snip command...

@x
If you have both Docker Desktop and Docker Engine installed on the same machine,
you can run the `docker context use` command to switch between the Docker Desktop
and Docker Engine contexts. For example, use the "default" context to interact
with the Docker Engine:
@y
If you have both Docker Desktop and Docker Engine installed on the same machine,
you can run the `docker context use` command to switch between the Docker Desktop
and Docker Engine contexts. For example, use the "default" context to interact
with the Docker Engine:
@z

% snip command...

@x
And use the `desktop-linux` context to interact with Docker Desktop:
@y
And use the `desktop-linux` context to interact with Docker Desktop:
@z

% snip command...

@x
Refer to the [Docker Context documentation](/manuals/engine/manage-resources/contexts.md) for more details.
@y
Refer to the [Docker Context documentation](manuals/engine/manage-resources/contexts.md) for more details.
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
## Supported platforms
@y
## Supported platforms
@z

@x
Docker provides `.deb` and `.rpm` packages for the following Linux distributions
and architectures:
@y
Docker provides `.deb` and `.rpm` packages for the following Linux distributions
and architectures:
@z

@x
| Platform                | x86_64 / amd64          | 
|:------------------------|:-----------------------:|
| [Ubuntu](ubuntu.md)                         | ✅  |
| [Debian](debian.md)                         | ✅  |
| [Red Hat Enterprise Linux (RHEL)](rhel.md)  | ✅  |
| [Fedora](fedora.md)                         | ✅  |
@y
| プラットフォーム        | x86_64 / amd64          |
|:------------------------|:-----------------------:|
| [Ubuntu](ubuntu.md)                         | ✅  |
| [Debian](debian.md)                         | ✅  |
| [Red Hat Enterprise Linux (RHEL)](rhel.md)  | ✅  |
| [Fedora](fedora.md)                         | ✅  |
@z

@x
An experimental package is available for [Arch](archlinux.md)-based distributions. Docker has not tested or verified the installation.
@y
An experimental package is available for [Arch](archlinux.md)-based distributions. Docker has not tested or verified the installation.
@z

@x
Docker supports Docker Desktop on the current LTS release of the aforementioned distributions and the most recent version. As new versions are made available, Docker stops supporting the oldest version and supports the newest version.
@y
Docker supports Docker Desktop on the current LTS release of the aforementioned distributions and the most recent version. As new versions are made available, Docker stops supporting the oldest version and supports the newest version.
@z

@x
## General system requirements
@y
## General system requirements
@z

@x
To install Docker Desktop successfully, your Linux host must meet the following general requirements:
@y
To install Docker Desktop successfully, your Linux host must meet the following general requirements:
@z

@x
- 64-bit kernel and CPU support for virtualization.
- KVM virtualization support. Follow the [KVM virtualization support instructions](#kvm-virtualization-support) to check if the KVM kernel modules are enabled and how to provide access to the KVM device.
- QEMU must be version 5.2 or later. We recommend upgrading to the latest version.
- systemd init system.
- GNOME, KDE, or MATE desktop environment.
  - For many Linux distributions, the GNOME environment does not support tray icons. To add support for tray icons, you need to install a GNOME extension. For example, [AppIndicator](https://extensions.gnome.org/extension/615/appindicator-support/).
- At least 4 GB of RAM.
- Enable configuring ID mapping in user namespaces, see [File sharing](/manuals/desktop/troubleshoot-and-support/faqs/linuxfaqs.md#how-do-i-enable-file-sharing). Note that for Docker Desktop version 4.35 and later, this is not required anymore.
- Recommended: [Initialize `pass`](/manuals/desktop/setup/sign-in.md#credentials-management-for-linux-users) for credentials management.
@y
- 64-bit kernel and CPU support for virtualization.
- KVM virtualization support. Follow the [KVM virtualization support instructions](#kvm-virtualization-support) to check if the KVM kernel modules are enabled and how to provide access to the KVM device.
- QEMU must be version 5.2 or later. We recommend upgrading to the latest version.
- systemd init system.
- GNOME, KDE, or MATE desktop environment.
  - For many Linux distributions, the GNOME environment does not support tray icons. To add support for tray icons, you need to install a GNOME extension. For example, [AppIndicator](https://extensions.gnome.org/extension/615/appindicator-support/).
- At least 4 GB of RAM.
- Enable configuring ID mapping in user namespaces, see [File sharing](manuals/desktop/troubleshoot-and-support/faqs/linuxfaqs.md#how-do-i-enable-file-sharing). Note that for Docker Desktop version 4.35 and later, this is not required anymore.
- Recommended: [Initialize `pass`](manuals/desktop/setup/sign-in.md#credentials-management-for-linux-users) for credentials management.
@z

@x
Docker Desktop for Linux runs a Virtual Machine (VM). For more information on why, see [Why Docker Desktop for Linux runs a VM](/manuals/desktop/troubleshoot-and-support/faqs/linuxfaqs.md#why-does-docker-desktop-for-linux-run-a-vm).
@y
Docker Desktop for Linux runs a Virtual Machine (VM). For more information on why, see [Why Docker Desktop for Linux runs a VM](manuals/desktop/troubleshoot-and-support/faqs/linuxfaqs.md#why-does-docker-desktop-for-linux-run-a-vm).
@z

@x
> [!NOTE]
>
> Docker does not provide support for running Docker Desktop for Linux in nested virtualization scenarios. We recommend that you run Docker Desktop for Linux natively on supported distributions.
@y
> [!NOTE]
>
> Docker does not provide support for running Docker Desktop for Linux in nested virtualization scenarios. We recommend that you run Docker Desktop for Linux natively on supported distributions.
@z

@x
### KVM virtualization support
@y
### KVM virtualization support
@z

@x
Docker Desktop runs a VM that requires [KVM support](https://www.linux-kvm.org).
@y
Docker Desktop runs a VM that requires [KVM support](https://www.linux-kvm.org).
@z

@x
The `kvm` module should load automatically if the host has virtualization support. To load the module manually, run:
@y
The `kvm` module should load automatically if the host has virtualization support. To load the module manually, run:
@z

% snip command...

@x
Depending on the processor of the host machine, the corresponding module must be loaded:
@y
Depending on the processor of the host machine, the corresponding module must be loaded:
@z

@x
```console
$ modprobe kvm_intel  # Intel processors
@y
```console
$ modprobe kvm_intel  # Intel プロセッサー
@z

@x
$ modprobe kvm_amd    # AMD processors
```
@y
$ modprobe kvm_amd    # AMD プロセッサー
```
@z

@x
If the above commands fail, you can view the diagnostics by running:
@y
If the above commands fail, you can view the diagnostics by running:
@z

% snip command...

@x
To check if the KVM modules are enabled, run:
@y
To check if the KVM modules are enabled, run:
@z

% snip command...

@x
#### Set up KVM device user permissions
@y
#### Set up KVM device user permissions
@z

@x
To check ownership of `/dev/kvm`, run :
@y
To check ownership of `/dev/kvm`, run :
@z

% snip command...

@x
Add your user to the kvm group in order to access the kvm device:
@y
Add your user to the kvm group in order to access the kvm device:
@z

% snip command...

@x
Sign out and sign back in so that your group membership is re-evaluated.
@y
Sign out and sign back in so that your group membership is re-evaluated.
@z

@x
## Where to go next
@y
## Where to go next
@z

@x
- Install Docker Desktop for Linux for your specific Linux distribution:
   - [Install on Ubuntu](ubuntu.md)
   - [Install on Debian](debian.md)
   - [Install on Red Hat Enterprise Linux (RHEL)](rhel.md)
   - [Install on Fedora](fedora.md)
   - [Install on Arch](archlinux.md)
@y
- Install Docker Desktop for Linux for your specific Linux distribution:
   - [Install on Ubuntu](ubuntu.md)
   - [Install on Debian](debian.md)
   - [Install on Red Hat Enterprise Linux (RHEL)](rhel.md)
   - [Install on Fedora](fedora.md)
   - [Install on Arch](archlinux.md)
@z
