%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Quick install Docker Desktop
linkTitle: Docker Desktop
description: Install Docker Desktop on your computer, start it, and run a test container.
keywords: Docker Desktop, quick install, macOS, Windows, Linux
@y
title: Quick install Docker Desktop
linkTitle: Docker Desktop
description: Install Docker Desktop on your computer, start it, and run a test container.
keywords: Docker Desktop, quick install, macOS, Windows, Linux
@z

@x
Docker Desktop includes Docker Engine, the Docker CLI, Buildx, and Compose.
For a Linux server without a desktop environment, use
[Docker Engine](/get-docker/engine.md) instead.
@y
Docker Desktop includes Docker Engine, the Docker CLI, Buildx, and Compose.
For a Linux server without a desktop environment, use
[Docker Engine](get-docker/engine.md) instead.
@z

@x
## Download and install
@y
## Download and install
@z

@x
{{< tabs >}}
{{< tab name="Mac" >}}
@y
{{< tabs >}}
{{< tab name="Mac" >}}
@z

@x
1. Download Docker Desktop for [Apple silicon](https://desktop.docker.com/mac/main/arm64/Docker.dmg)
   or [Intel](https://desktop.docker.com/mac/main/amd64/Docker.dmg).
2. Open `Docker.dmg` and drag Docker to **Applications**.
3. Open **Docker** from **Applications** and accept the subscription agreement
   to start Docker Desktop.
@y
1. Download Docker Desktop for [Apple silicon](https://desktop.docker.com/mac/main/arm64/Docker.dmg)
   or [Intel](https://desktop.docker.com/mac/main/amd64/Docker.dmg).
2. Open `Docker.dmg` and drag Docker to **Applications**.
3. Open **Docker** from **Applications** and accept the subscription agreement
   to start Docker Desktop.
@z

@x
See [Mac installation instructions](/manuals/desktop/setup/install/mac-install.md)
for system requirements, permissions, and installation options.
@y
See [Mac installation instructions](manuals/desktop/setup/install/mac-install.md)
for system requirements, permissions, and installation options.
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
1. Check the [Windows system requirements](/manuals/desktop/setup/install/windows-install.md#system-requirements).
2. Download the [installer for x86_64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe).
   For Arm devices, use the download in the
   [Windows installation instructions](/manuals/desktop/setup/install/windows-install.md).
3. Open the installer and follow the prompts. Restart Windows if prompted.
4. Open **Docker Desktop** from the **Start** menu and accept the subscription
   agreement.
@y
1. Check the [Windows system requirements](manuals/desktop/setup/install/windows-install.md#system-requirements).
2. Download the [installer for x86_64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe).
   For Arm devices, use the download in the
   [Windows installation instructions](manuals/desktop/setup/install/windows-install.md).
3. Open the installer and follow the prompts. Restart Windows if prompted.
4. Open **Docker Desktop** from the **Start** menu and accept the subscription
   agreement.
@z

@x
The full instructions cover WSL 2 setup, supported Windows versions, and
installation options.
@y
The full instructions cover WSL 2 setup, supported Windows versions, and
installation options.
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
Docker Desktop on Linux requires a desktop environment and KVM virtualization.
Choose your distribution for requirements and package installation steps:
@y
Docker Desktop on Linux requires a desktop environment and KVM virtualization.
Choose your distribution for requirements and package installation steps:
@z

@x
- [Ubuntu](/manuals/desktop/setup/install/linux/ubuntu.md)
- [Debian](/manuals/desktop/setup/install/linux/debian.md)
- [Fedora](/manuals/desktop/setup/install/linux/fedora.md)
@y
- [Ubuntu](manuals/desktop/setup/install/linux/ubuntu.md)
- [Debian](manuals/desktop/setup/install/linux/debian.md)
- [Fedora](manuals/desktop/setup/install/linux/fedora.md)
@z

@x
After installation, open **Docker Desktop** from your application menu.
See [Docker Desktop on Linux](/manuals/desktop/setup/install/linux/_index.md) for
supported platforms and virtualization setup.
@y
After installation, open **Docker Desktop** from your application menu.
See [Docker Desktop on Linux](manuals/desktop/setup/install/linux/_index.md) for
supported platforms and virtualization setup.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
> [!NOTE]
>
> Commercial use of Docker Desktop in larger enterprises (more than 250 employees
> or more than $10 million USD in annual revenue) requires a paid subscription.
> See [Docker Desktop licensing](/manuals/subscription-billing/desktop-license.md).
@y
> [!NOTE]
>
> Commercial use of Docker Desktop in larger enterprises (more than 250 employees
> or more than $10 million USD in annual revenue) requires a paid subscription.
> See [Docker Desktop licensing](manuals/subscription-billing/desktop-license.md).
@z

@x
## Check the installation
@y
## Check the installation
@z

@x
With Docker Desktop running, open a terminal and run:
@y
With Docker Desktop running, open a terminal and run:
@z

@x
```console
$ docker version
$ docker run hello-world
```
@y
```console
$ docker version
$ docker run hello-world
```
@z

@x
The first command shows client and server versions. The second downloads a test
image and runs a container that prints a confirmation message.
@y
The first command shows client and server versions. The second downloads a test
image and runs a container that prints a confirmation message.
@z
