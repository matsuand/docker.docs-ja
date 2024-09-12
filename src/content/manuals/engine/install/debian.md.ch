%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn how to install Docker Engine on Debian. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, apt, installation, debian, install, uninstall, install debian, docker engine, install docker engine, upgrade, update
title: Install Docker Engine on Debian
@y
description: Learn how to install Docker Engine on Debian. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, apt, installation, debian, install, uninstall, install debian, docker engine, install docker engine, upgrade, update
title: Debian への Docker Engine インストール
@z

@x
To get started with Docker Engine on Debian, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@y
To get started with Docker Engine on Debian, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
### Firewall limitations
@y
### Firewall limitations
@z

@x
> [!WARNING]
>
> Before you install Docker, make sure you consider the following
> security implications and firewall incompatibilities.
@y
> [!WARNING]
>
> Before you install Docker, make sure you consider the following
> security implications and firewall incompatibilities.
@z

@x
- If you use ufw or firewalld to manage firewall settings, be aware that
  when you expose container ports using Docker, these ports bypass your
  firewall rules. For more information, refer to
  [Docker and ufw](/manuals/engine/network/packet-filtering-firewalls.md#docker-and-ufw).
@y
- If you use ufw or firewalld to manage firewall settings, be aware that
  when you expose container ports using Docker, these ports bypass your
  firewall rules. For more information, refer to
  [Docker and ufw](manuals/engine/network/packet-filtering-firewalls.md#docker-and-ufw).
@z

@x
- Docker is only compatible with `iptables-nft` and `iptables-legacy`.
  Firewall rules created with `nft` are not supported on a system with Docker installed.
  Make sure that any firewall rulesets you use are created with `iptables` or `ip6tables`,
  and that you add them to the `DOCKER-USER` chain,
  see [Packet filtering and firewalls](/manuals/engine/network/packet-filtering-firewalls.md).
@y
- Docker is only compatible with `iptables-nft` and `iptables-legacy`.
  Firewall rules created with `nft` are not supported on a system with Docker installed.
  Make sure that any firewall rulesets you use are created with `iptables` or `ip6tables`,
  and that you add them to the `DOCKER-USER` chain,
  see [Packet filtering and firewalls](manuals/engine/network/packet-filtering-firewalls.md).
@z

@x
### OS requirements
@y
### OS requirements
@z

@x
To install Docker Engine, you need the 64-bit version of one of these Debian
versions:
@y
To install Docker Engine, you need the 64-bit version of one of these Debian
versions:
@z

@x
- Debian Bookworm 12 (stable)
- Debian Bullseye 11 (oldstable)
@y
- Debian Bookworm 12 (stable)
- Debian Bullseye 11 (oldstable)
@z

@x
Docker Engine for Debian is compatible with x86_64 (or amd64), armhf, arm64,
and ppc64le (ppc64el) architectures.
@y
Docker Engine for Debian is compatible with x86_64 (or amd64), armhf, arm64,
and ppc64le (ppc64el) architectures.
@z

@x
### Uninstall old versions
@y
### 旧バージョンのアンインストール {#uninstall-old-versions}
@z

@x
Before you can install Docker Engine, you need to uninstall any conflicting packages.
@y
Before you can install Docker Engine, you need to uninstall any conflicting packages.
@z

@x
Distro maintainers provide unofficial distributions of Docker packages in
their repositories. You must uninstall these packages before you can install the
official version of Docker Engine.
@y
Distro maintainers provide unofficial distributions of Docker packages in
their repositories. You must uninstall these packages before you can install the
official version of Docker Engine.
@z

@x
The unofficial packages to uninstall are:
@y
The unofficial packages to uninstall are:
@z

@x
- `docker.io`
- `docker-compose`
- `docker-doc`
- `podman-docker`
@y
- `docker.io`
- `docker-compose`
- `docker-doc`
- `podman-docker`
@z

@x
Moreover, Docker Engine depends on `containerd` and `runc`. Docker Engine
bundles these dependencies as one bundle: `containerd.io`. If you have
installed the `containerd` or `runc` previously, uninstall them to avoid
conflicts with the versions bundled with Docker Engine.
@y
Moreover, Docker Engine depends on `containerd` and `runc`. Docker Engine
bundles these dependencies as one bundle: `containerd.io`. If you have
installed the `containerd` or `runc` previously, uninstall them to avoid
conflicts with the versions bundled with Docker Engine.
@z

@x
Run the following command to uninstall all conflicting packages:
@y
Run the following command to uninstall all conflicting packages:
@z

% snip command...

@x
`apt-get` might report that you have none of these packages installed.
@y
`apt-get` might report that you have none of these packages installed.
@z

@x
Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't
automatically removed when you uninstall Docker. If you want to start with a
clean installation, and prefer to clean up any existing data, read the
[uninstall Docker Engine](#uninstall-docker-engine) section.
@y
Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't
automatically removed when you uninstall Docker. If you want to start with a
clean installation, and prefer to clean up any existing data, read the
[uninstall Docker Engine](#uninstall-docker-engine) section.
@z

@x
## Installation methods
@y
## インストール方法 {#installation-methods}
@z

@x
You can install Docker Engine in different ways, depending on your needs:
@y
You can install Docker Engine in different ways, depending on your needs:
@z

@x
- Docker Engine comes bundled with
  [Docker Desktop for Linux](/manuals/desktop/install/linux-install.md). This is
  the easiest and quickest way to get started.
@y
- Docker Engine comes bundled with
  [Docker Desktop for Linux](manuals/desktop/install/linux-install.md). This is
  the easiest and quickest way to get started.
@z

@x
- Set up and install Docker Engine from
  [Docker's `apt` repository](#install-using-the-repository).
@y
- Set up and install Docker Engine from
  [Docker's `apt` repository](#install-using-the-repository).
@z

@x
- [Install it manually](#install-from-a-package) and manage upgrades manually.
@y
- [Install it manually](#install-from-a-package) and manage upgrades manually.
@z

@x
- Use a [convenience script](#install-using-the-convenience-script). Only
  recommended for testing and development environments.
@y
- Use a [convenience script](#install-using-the-convenience-script). Only
  recommended for testing and development environments.
@z

@x
### Install using the `apt` repository {#install-using-the-repository}
@y
### Install using the `apt` repository {#install-using-the-repository}
@z

@x
Before you install Docker Engine for the first time on a new host machine, you
need to set up the Docker `apt` repository. Afterward, you can install and update
Docker from the repository.
@y
Before you install Docker Engine for the first time on a new host machine, you
need to set up the Docker `apt` repository. Afterward, you can install and update
Docker from the repository.
@z

@x
1. Set up Docker's `apt` repository.
@y
1. Set up Docker's `apt` repository.
@z

@x comment in command
   # Add Docker's official GPG key:
@y
   # Add Docker's official GPG key:
@x
@x
   # Add the repository to Apt sources:
@y
   # Add the repository to Apt sources:
@z

@x
   > [!NOTE]
   >
   > If you use a derivative distro, such as Kali Linux,
   > you may need to substitute the part of this command that's expected to
   > print the version codename:
   >
   > ```console
   > $(. /etc/os-release && echo "$VERSION_CODENAME")
   > ```
   >
   > Replace this part with the codename of the corresponding Debian release,
   > such as `bookworm`.
@y
   > [!NOTE]
   >
   > If you use a derivative distro, such as Kali Linux,
   > you may need to substitute the part of this command that's expected to
   > print the version codename:
   >
   > ```console
   > $(. /etc/os-release && echo "$VERSION_CODENAME")
   > ```
   >
   > Replace this part with the codename of the corresponding Debian release,
   > such as `bookworm`.
@z

@x
2. Install the Docker packages.
@y
2. Install the Docker packages.
@z

@x
   {{< tabs >}}
   {{< tab name="Latest" >}}
@y
   {{< tabs >}}
   {{< tab name="Latest" >}}
@z

@x
   To install the latest version, run:
@y
   To install the latest version, run:
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Specific version" >}}
@y
   {{< /tab >}}
   {{< tab name="Specific version" >}}
@z

@x
   To install a specific version of Docker Engine, start by listing the
   available versions in the repository:
@y
   To install a specific version of Docker Engine, start by listing the
   available versions in the repository:
@z

@x comment in command
   # List the available versions:
@y
   # List the available versions:
@z

@x
   Select the desired version and install:
@y
   Select the desired version and install:
@z

% snip command...

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
3. Verify that the installation is successful by running the `hello-world`
   image:
@y
3. Verify that the installation is successful by running the `hello-world`
   image:
@z

% snip command...

@x
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a confirmation message and exits.
@y
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a confirmation message and exits.
@z

@x
You have now successfully installed and started Docker Engine.
@y
You have now successfully installed and started Docker Engine.
@z

@x
{{< include "root-errors.md" >}}
@y
{{< include "root-errors.md" >}}
@z

@x
#### Upgrade Docker Engine
@y
#### Upgrade Docker Engine
@z

@x
To upgrade Docker Engine, follow step 2 of the
[installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
To upgrade Docker Engine, follow step 2 of the
[installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@z

@x
### Install from a package
@y
### Install from a package
@z

@x
If you can't use Docker's `apt` repository to install Docker Engine, you can
download the `deb` file for your release and install it manually. You need to
download a new file each time you want to upgrade Docker Engine.
@y
If you can't use Docker's `apt` repository to install Docker Engine, you can
download the `deb` file for your release and install it manually. You need to
download a new file each time you want to upgrade Docker Engine.
@z

@x
<!-- markdownlint-disable-next-line -->
1. Go to [`{{% param "download-url-base" %}}/dists/`]({{% param "download-url-base" %}}/dists/).
@y
<!-- markdownlint-disable-next-line -->
1. Go to [`{{% param "download-url-base" %}}/dists/`]({{% param "download-url-base" %}}/dists/).
@z

@x
2. Select your Debian version in the list.
@y
2. Select your Debian version in the list.
@z

@x
3. Go to `pool/stable/` and select the applicable architecture (`amd64`,
   `armhf`, `arm64`, or `s390x`).
@y
3. Go to `pool/stable/` and select the applicable architecture (`amd64`,
   `armhf`, `arm64`, or `s390x`).
@z

@x
4. Download the following `deb` files for the Docker Engine, CLI, containerd,
   and Docker Compose packages:
@y
4. Download the following `deb` files for the Docker Engine, CLI, containerd,
   and Docker Compose packages:
@z

@x
   - `containerd.io_<version>_<arch>.deb`
   - `docker-ce_<version>_<arch>.deb`
   - `docker-ce-cli_<version>_<arch>.deb`
   - `docker-buildx-plugin_<version>_<arch>.deb`
   - `docker-compose-plugin_<version>_<arch>.deb`
@y
   - `containerd.io_<version>_<arch>.deb`
   - `docker-ce_<version>_<arch>.deb`
   - `docker-ce-cli_<version>_<arch>.deb`
   - `docker-buildx-plugin_<version>_<arch>.deb`
   - `docker-compose-plugin_<version>_<arch>.deb`
@z

@x
5. Install the `.deb` packages. Update the paths in the following example to
   where you downloaded the Docker packages.
@y
5. Install the `.deb` packages. Update the paths in the following example to
   where you downloaded the Docker packages.
@z

% snip command...

@x
   The Docker daemon starts automatically.
@y
   The Docker daemon starts automatically.
@z

@x
6. Verify that the Docker Engine installation is successful by running the
   `hello-world` image:
@y
6. Verify that the Docker Engine installation is successful by running the
   `hello-world` image:
@z

% snip command...

@x
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a confirmation message and exits.
@y
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a confirmation message and exits.
@z

@x
You have now successfully installed and started Docker Engine.
@y
You have now successfully installed and started Docker Engine.
@z

@x
{{< include "root-errors.md" >}}
@y
{{< include "root-errors.md" >}}
@z

@x
#### Upgrade Docker Engine
@y
#### Upgrade Docker Engine
@z

@x
To upgrade Docker Engine, download the newer package files and repeat the
[installation procedure](#install-from-a-package), pointing to the new files.
@y
To upgrade Docker Engine, download the newer package files and repeat the
[installation procedure](#install-from-a-package), pointing to the new files.
@z

@x
{{< include "install-script.md" >}}
@y
{{< include "install-script.md" >}}
@z

@x
## Uninstall Docker Engine
@y
## Docker Engine のアンインストール {#uninstall-docker-engine}
@z

@x
1.  Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
@y
1.  Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
@z

% snip command...

@x
2.  Images, containers, volumes, or custom configuration files on your host
    aren't automatically removed. To delete all images, containers, and volumes:
@y
2.  Images, containers, volumes, or custom configuration files on your host
    aren't automatically removed. To delete all images, containers, and volumes:
@z

% snip command...

@x
You have to delete any edited configuration files manually.
@y
You have to delete any edited configuration files manually.
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@y
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@z
