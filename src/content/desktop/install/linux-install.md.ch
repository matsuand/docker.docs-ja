%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Install Docker on Linux with ease using our step-by-step installation
  guide covering system requirements, supported platforms, and where to go next.
keywords: linux, docker linux install, docker linux, linux docker installation, docker
  for linux, docker desktop for linux, installing docker on linux, docker download
  linux, how to install docker on linux, linux vs docker engine, switch docker contexts
title: Install Docker Desktop on Linux
aliases:
- /desktop/linux/install/
'yes': '![yes](/assets/images/green-check.svg){: .inline style="height: 14px; margin:
  0 auto"}'
---
@y
---
description: Install Docker on Linux with ease using our step-by-step installation
  guide covering system requirements, supported platforms, and where to go next.
keywords: linux, docker linux install, docker linux, linux docker installation, docker
  for linux, docker desktop for linux, installing docker on linux, docker download
  linux, how to install docker on linux, linux vs docker engine, switch docker contexts
title: Install Docker Desktop on Linux
aliases:
- /desktop/linux/install/
'yes': '![yes](/assets/images/green-check.svg){: .inline style="height: 14px; margin:
  0 auto"}'
---
@z

@x
This page contains information about general system requirements, supported platforms, and instructions on how to install Docker Desktop for Linux.
@y
This page contains information about general system requirements, supported platforms, and instructions on how to install Docker Desktop for Linux.
@z

@x
> **Important**
>
>Docker Desktop on Linux runs a Virtual Machine (VM) which creates and uses a custom docker context, `desktop-linux`, on startup. 
>
>This means images and containers deployed on the Linux Docker Engine (before installation) are not available in Docker Desktop for Linux. 
>
>For more information see [What is the difference between Docker Desktop for Linux and Docker Engine](../faqs/linuxfaqs.md#what-is-the-difference-between-docker-desktop-for-linux-and-docker-engine). 
{ .important } 
@y
> **Important**
>
>Docker Desktop on Linux runs a Virtual Machine (VM) which creates and uses a custom docker context, `desktop-linux`, on startup. 
>
>This means images and containers deployed on the Linux Docker Engine (before installation) are not available in Docker Desktop for Linux. 
>
>For more information see [What is the difference between Docker Desktop for Linux and Docker Engine](../faqs/linuxfaqs.md#what-is-the-difference-between-docker-desktop-for-linux-and-docker-engine). 
{ .important } 
@z

@x
{{< accordion title=" What is the difference between Docker Desktop for Linux and Docker Engine?" >}}
@y
{{< accordion title=" What is the difference between Docker Desktop for Linux and Docker Engine?" >}}
@z

@x
Docker Desktop for Linux provides a user-friendly graphical interface that simplifies the management of containers and services. It includes Docker Engine as this is the core technology that powers Docker containers. Docker Desktop for Linux also comes with additional features like Docker Scout and Docker Extensions.
@y
Docker Desktop for Linux provides a user-friendly graphical interface that simplifies the management of containers and services. It includes Docker Engine as this is the core technology that powers Docker containers. Docker Desktop for Linux also comes with additional features like Docker Scout and Docker Extensions.
@z

@x
#### Installing Docker Desktop and Docker Engine
@y
#### Installing Docker Desktop and Docker Engine
@z

@x
Docker Desktop for Linux and Docker Engine can be installed side-by-side on the
same machine. Docker Desktop for Linux stores containers and images in an isolated
storage location within a VM and offers
controls to restrict [its resources](../settings/linux.md#resources). Using a dedicated storage
location for Docker Desktop prevents it from interfering with a Docker Engine
installation on the same machine.
@y
Docker Desktop for Linux and Docker Engine can be installed side-by-side on the
same machine. Docker Desktop for Linux stores containers and images in an isolated
storage location within a VM and offers
controls to restrict [its resources](../settings/linux.md#resources). Using a dedicated storage
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

@x
```console
$ sudo systemctl stop docker docker.socket containerd
```
@y
```console
$ sudo systemctl stop docker docker.socket containerd
```
@z

@x
Depending on your installation, the Docker Engine may be configured to automatically
start as a system service when your machine starts. Use the following command to
disable the Docker Engine service, and to prevent it from starting automatically:
@y
Depending on your installation, the Docker Engine may be configured to automatically
start as a system service when your machine starts. Use the following command to
disable the Docker Engine service, and to prevent it from starting automatically:
@z

@x
```console
$ sudo systemctl disable docker docker.socket containerd
```
@y
```console
$ sudo systemctl disable docker docker.socket containerd
```
@z

@x
### Switching between Docker Desktop and Docker Engine
@y
### Switching between Docker Desktop and Docker Engine
@z

@x
The Docker CLI can be used to interact with multiple Docker Engines. For example,
you can use the same Docker CLI to control a local Docker Engine and to control
a remote Docker Engine instance running in the cloud. [Docker Contexts](../../engine/context/working-with-contexts.md)
allow you to switch between Docker Engines instances.
@y
The Docker CLI can be used to interact with multiple Docker Engines. For example,
you can use the same Docker CLI to control a local Docker Engine and to control
a remote Docker Engine instance running in the cloud. [Docker Contexts](../../engine/context/working-with-contexts.md)
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
machine. The current context is indicated with an asterisk (`*`);
@y
Use the `docker context ls` command to view what contexts are available on your
machine. The current context is indicated with an asterisk (`*`);
@z

@x
```console
$ docker context ls
NAME            DESCRIPTION                               DOCKER ENDPOINT                                  ...
default *       Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                      ...
desktop-linux                                             unix:///home/<user>/.docker/desktop/docker.sock  ...        
```
@y
```console
$ docker context ls
NAME            DESCRIPTION                               DOCKER ENDPOINT                                  ...
default *       Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                      ...
desktop-linux                                             unix:///home/<user>/.docker/desktop/docker.sock  ...        
```
@z

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

@x
```console
$ docker context use default
default
Current context is now "default"
```
@y
```console
$ docker context use default
default
Current context is now "default"
```
@z

@x
And use the `desktop-linux` context to interact with Docker Desktop:
@y
And use the `desktop-linux` context to interact with Docker Desktop:
@z

@x
```console
$ docker context use desktop-linux
desktop-linux
Current context is now "desktop-linux"
```
@y
```console
$ docker context use desktop-linux
desktop-linux
Current context is now "desktop-linux"
```
@z

@x
Refer to the [Docker Context documentation](../../engine/context/working-with-contexts.md) for more details.
@y
Refer to the [Docker Context documentation](../../engine/context/working-with-contexts.md) for more details.
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
Docker provides `.deb` and `.rpm` packages from the following Linux distributions
and architectures:
@y
Docker provides `.deb` and `.rpm` packages from the following Linux distributions
and architectures:
@z

@x
| Platform                | x86_64 / amd64         | 
|:-----------------------|:-----------------------:|
| [Ubuntu](ubuntu.md)     | ✅ |
| [Debian](debian.md)     | ✅  |
| [Fedora](fedora.md)     | ✅ |
@y
| Platform                | x86_64 / amd64         | 
|:-----------------------|:-----------------------:|
| [Ubuntu](ubuntu.md)     | ✅ |
| [Debian](debian.md)     | ✅  |
| [Fedora](fedora.md)     | ✅ |
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
- Gnome, KDE, or MATE Desktop environment.
  - For many Linux distros, the Gnome environment does not support tray icons. To add support for tray icons, you need to install a Gnome extension. For example, [AppIndicator](https://extensions.gnome.org/extension/615/appindicator-support/).
- At least 4 GB of RAM.
- Enable configuring ID mapping in user namespaces, see [File sharing](../faqs/linuxfaqs.md#how-do-i-enable-file-sharing).
- Recommended: [Initialize `pass`](../get-started.md#credentials-management-for-linux-users) for credentials management.
@y
- 64-bit kernel and CPU support for virtualization.
- KVM virtualization support. Follow the [KVM virtualization support instructions](#kvm-virtualization-support) to check if the KVM kernel modules are enabled and how to provide access to the KVM device.
- QEMU must be version 5.2 or later. We recommend upgrading to the latest version.
- systemd init system.
- Gnome, KDE, or MATE Desktop environment.
  - For many Linux distros, the Gnome environment does not support tray icons. To add support for tray icons, you need to install a Gnome extension. For example, [AppIndicator](https://extensions.gnome.org/extension/615/appindicator-support/).
- At least 4 GB of RAM.
- Enable configuring ID mapping in user namespaces, see [File sharing](../faqs/linuxfaqs.md#how-do-i-enable-file-sharing).
- Recommended: [Initialize `pass`](../get-started.md#credentials-management-for-linux-users) for credentials management.
@z

@x
Docker Desktop for Linux runs a Virtual Machine (VM). For more information on why, see [Why Docker Desktop for Linux runs a VM](../faqs/linuxfaqs.md#why-does-docker-desktop-for-linux-run-a-vm).
@y
Docker Desktop for Linux runs a Virtual Machine (VM). For more information on why, see [Why Docker Desktop for Linux runs a VM](../faqs/linuxfaqs.md#why-does-docker-desktop-for-linux-run-a-vm).
@z

@x
> **Note**
>
> Docker does not provide support for running Docker Desktop for Linux in nested virtualization scenarios. We recommend that you run Docker Desktop for Linux natively on supported distributions.
@y
> **Note**
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

@x
```console
$ modprobe kvm
```
@y
```console
$ modprobe kvm
```
@z

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
$ modprobe kvm_intel  # Intel processors
@z

@x
$ modprobe kvm_amd    # AMD processors
```
@y
$ modprobe kvm_amd    # AMD processors
```
@z

@x
If the above commands fail, you can view the diagnostics by running:
@y
If the above commands fail, you can view the diagnostics by running:
@z

@x
```console
$ kvm-ok
```
@y
```console
$ kvm-ok
```
@z

@x
To check if the KVM modules are enabled, run:
@y
To check if the KVM modules are enabled, run:
@z

@x
```console
$ lsmod | grep kvm
kvm_amd               167936  0
ccp                   126976  1 kvm_amd
kvm                  1089536  1 kvm_amd
irqbypass              16384  1 kvm
```
@y
```console
$ lsmod | grep kvm
kvm_amd               167936  0
ccp                   126976  1 kvm_amd
kvm                  1089536  1 kvm_amd
irqbypass              16384  1 kvm
```
@z

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

@x
```console
$ ls -al /dev/kvm
```
@y
```console
$ ls -al /dev/kvm
```
@z

@x
Add your user to the kvm group in order to access the kvm device:
@y
Add your user to the kvm group in order to access the kvm device:
@z

@x
```console
$ sudo usermod -aG kvm $USER
```
@y
```console
$ sudo usermod -aG kvm $USER
```
@z

@x
Sign out and sign back in so that your group membership is re-evaluated.
@y
Sign out and sign back in so that your group membership is re-evaluated.
@z

@x
## Generic installation steps
@y
## Generic installation steps
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@y
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@z

@x
> **Important**
>
> Make sure you meet the system requirements outlined earlier and follow the distro-specific prerequisites.
{ .important } 
@y
> **Important**
>
> Make sure you meet the system requirements outlined earlier and follow the distro-specific prerequisites.
{ .important } 
@z

@x
1. Download the correct package for your Linux distribution and install it with the corresponding package manager. 
   - [Install on Debian](debian.md)
   - [Install on Fedora](fedora.md)
   - [Install on Ubuntu](ubuntu.md)
   - [Install on Arch](archlinux.md) 
   By default, Docker Desktop is installed at `/opt/docker-desktop`.
@y
1. Download the correct package for your Linux distribution and install it with the corresponding package manager. 
   - [Install on Debian](debian.md)
   - [Install on Fedora](fedora.md)
   - [Install on Ubuntu](ubuntu.md)
   - [Install on Arch](archlinux.md) 
   By default, Docker Desktop is installed at `/opt/docker-desktop`.
@z

@x
2. Open your **Applications** menu in Gnome/KDE Desktop and search for **Docker Desktop**.
@y
2. Open your **Applications** menu in Gnome/KDE Desktop and search for **Docker Desktop**.
@z

@x
   ![Docker app in Applications](images/docker-app-in-apps.png)
@y
   ![Docker app in Applications](images/docker-app-in-apps.png)
@z

@x
3. Select **Docker Desktop** to start Docker. <br> The Docker menu ({{< inline-image src="images/whale-x.svg" alt="whale menu" >}}) displays the Docker Subscription Service Agreement.
@y
3. Select **Docker Desktop** to start Docker. <br> The Docker menu ({{< inline-image src="images/whale-x.svg" alt="whale menu" >}}) displays the Docker Subscription Service Agreement.
@z

@x
4. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@y
4. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@z

@x
   Note that Docker Desktop will not run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@y
   Note that Docker Desktop will not run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@z

@x
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). We recommend that you also read the [FAQs](https://www.docker.com/pricing/faq).
@y
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). We recommend that you also read the [FAQs](https://www.docker.com/pricing/faq).
@z

@x
## Where to go next
@y
## Where to go next
@z

@x
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- [Get started with Docker](../../guides/get-started/_index.md).
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- [Get started with Docker](../../guides/get-started/_index.md).
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, how to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@z
