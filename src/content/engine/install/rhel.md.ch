%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to install Docker Engine on RHEL. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, apt, installation, rhel, rpm, install, install docker engine, uninstall, upgrade,
  update
title: Install Docker Engine on RHEL
toc_max: 4
aliases:
- /ee/docker-ee/rhel/
- /engine/installation/linux/docker-ce/rhel/
- /engine/installation/linux/docker-ee/rhel/
- /engine/installation/linux/rhel/
- /engine/installation/rhel/
- /install/linux/docker-ee/rhel/
- /installation/rhel/
download-url-base: https://download.docker.com/linux/rhel
---
@y
---
description: Learn how to install Docker Engine on RHEL. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, apt, installation, rhel, rpm, install, install docker engine, uninstall, upgrade,
  update
title: Install Docker Engine on RHEL
toc_max: 4
aliases:
- /ee/docker-ee/rhel/
- /engine/installation/linux/docker-ce/rhel/
- /engine/installation/linux/docker-ee/rhel/
- /engine/installation/linux/rhel/
- /engine/installation/rhel/
- /install/linux/docker-ee/rhel/
- /installation/rhel/
download-url-base: https://download.docker.com/linux/rhel
---
@z

@x
> **Experimental**
>
> Support for Docker Engine on RHEL x86_64 and aarch64 is experimental.
{ .experimental }
@y
> **Experimental**
>
> Support for Docker Engine on RHEL x86_64 and aarch64 is experimental.
{ .experimental }
@z

@x
> **Docker Desktop for Linux** is also available for RHEL.
> 
> To get access, join the [Early Access Program](https://www.docker.com/docker-desktop-preview-program/).
{ .restricted }
@y
> **Docker Desktop for Linux** is also available for RHEL.
> 
> To get access, join the [Early Access Program](https://www.docker.com/docker-desktop-preview-program/).
{ .restricted }
@z

@x
To get started with Docker Engine on RHEL, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@y
To get started with Docker Engine on RHEL, make sure you
[meet the prerequisites](#prerequisites), and then follow the
[installation steps](#installation-methods).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
### OS requirements
@y
### OS requirements
@z

@x
To install Docker Engine, you need a maintained version of one of the following
RHEL versions:
@y
To install Docker Engine, you need a maintained version of one of the following
RHEL versions:
@z

@x
- RHEL 8
- RHEL 9
@y
- RHEL 8
- RHEL 9
@z

@x
### Uninstall old versions
@y
### Uninstall old versions
@z

@x
Older versions of Docker went by `docker` or `docker-engine`.
Uninstall any such older versions before attempting to install a new version,
along with associated dependencies. Also uninstall `Podman` and the associated
dependencies if installed already:
@y
Older versions of Docker went by `docker` or `docker-engine`.
Uninstall any such older versions before attempting to install a new version,
along with associated dependencies. Also uninstall `Podman` and the associated
dependencies if installed already:
@z

@x
```console
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc
```
@y
```console
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc
```
@z

@x
`yum` might report that you have none of these packages installed.
@y
`yum` might report that you have none of these packages installed.
@z

@x
Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't
automatically removed when you uninstall Docker.
@y
Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't
automatically removed when you uninstall Docker.
@z

@x
## Installation methods
@y
## Installation methods
@z

@x
You can install Docker Engine in different ways, depending on your needs:
@y
You can install Docker Engine in different ways, depending on your needs:
@z

@x
- You can
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
@y
- You can
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
@z

@x
- You can download the RPM package,
  [install it manually](#install-from-a-package), and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
@y
- You can download the RPM package,
  [install it manually](#install-from-a-package), and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
@z

@x
- In testing and development environments, you can use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@y
- In testing and development environments, you can use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@z

@x
### Install using the rpm repository {#install-using-the-repository}
@y
### Install using the rpm repository {#install-using-the-repository}
@z

@x
Before you install Docker Engine for the first time on a new host machine, you
need to set up the Docker repository. Afterward, you can install and update
Docker from the repository.
@y
Before you install Docker Engine for the first time on a new host machine, you
need to set up the Docker repository. Afterward, you can install and update
Docker from the repository.
@z

@x
#### Set up the repository
@y
#### Set up the repository
@z

@x
Install the `yum-utils` package (which provides the `yum-config-manager`
utility) and set up the repository.
@y
Install the `yum-utils` package (which provides the `yum-config-manager`
utility) and set up the repository.
@z

@x
```console
$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo {{% param "download-url-base" %}}/docker-ce.repo
```
@y
```console
$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo {{% param "download-url-base" %}}/docker-ce.repo
```
@z

@x
#### Install Docker Engine
@y
#### Install Docker Engine
@z

@x
1. Install Docker Engine, containerd, and Docker Compose:
@y
1. Install Docker Engine, containerd, and Docker Compose:
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

@x
   ```console
   $ sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```
@y
   ```console
   $ sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```
@z

@x
   If prompted to accept the GPG key, verify that the fingerprint matches
   `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@y
   If prompted to accept the GPG key, verify that the fingerprint matches
   `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@z

@x
   This command installs Docker, but it doesn't start Docker. It also creates a
   `docker` group, however, it doesn't add any users to the group by default.
@y
   This command installs Docker, but it doesn't start Docker. It also creates a
   `docker` group, however, it doesn't add any users to the group by default.
@z

@x
   {{< /tab >}}
   {{< tab name="Specific version" >}}
@y
   {{< /tab >}}
   {{< tab name="Specific version" >}}
@z

@x
   To install a specific version, start by listing the available versions in
   the repository:
@y
   To install a specific version, start by listing the available versions in
   the repository:
@z

@x
   ```console
   $ yum list docker-ce --showduplicates | sort -r
@y
   ```console
   $ yum list docker-ce --showduplicates | sort -r
@z

@x
   docker-ce.x86_64    3:27.0.3-1.el9    docker-ce-stable
   docker-ce.x86_64    3:27.0.2-1.el9    docker-ce-stable
   <...>
   ```
@y
   docker-ce.x86_64    3:27.0.3-1.el9    docker-ce-stable
   docker-ce.x86_64    3:27.0.2-1.el9    docker-ce-stable
   <...>
   ```
@z

@x
   The list returned depends on which repositories are enabled, and is specific
   to your version of RHEL (indicated by the `.el9` suffix in this example).
@y
   The list returned depends on which repositories are enabled, and is specific
   to your version of RHEL (indicated by the `.el9` suffix in this example).
@z

@x
   Install a specific version by its fully qualified package name, which is
   the package name (`docker-ce`) plus the version string (2nd column),
   separated by a hyphen (`-`). For example, `docker-ce-3:27.0.3-1.el9`.
@y
   Install a specific version by its fully qualified package name, which is
   the package name (`docker-ce`) plus the version string (2nd column),
   separated by a hyphen (`-`). For example, `docker-ce-3:27.0.3-1.el9`.
@z

@x
   Replace `<VERSION_STRING>` with the desired version and then run the following
   command to install:
@y
   Replace `<VERSION_STRING>` with the desired version and then run the following
   command to install:
@z

@x
   ```console
   $ sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io docker-buildx-plugin docker-compose-plugin
   ```
@y
   ```console
   $ sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io docker-buildx-plugin docker-compose-plugin
   ```
@z

@x
   This command installs Docker, but it doesn't start Docker. It also creates a
   `docker` group, however, it doesn't add any users to the group by default.
@y
   This command installs Docker, but it doesn't start Docker. It also creates a
   `docker` group, however, it doesn't add any users to the group by default.
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. Start Docker.
@y
2. Start Docker.
@z

@x
   ```console
   $ sudo systemctl start docker
   ```
@y
   ```console
   $ sudo systemctl start docker
   ```
@z

@x
3. Verify that the Docker Engine installation is successful by running the
   `hello-world` image.
@y
3. Verify that the Docker Engine installation is successful by running the
   `hello-world` image.
@z

@x
   ```console
   $ sudo docker run hello-world
   ```
@y
   ```console
   $ sudo docker run hello-world
   ```
@z

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
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@z

@x
### Install from a package
@y
### Install from a package
@z

@x
If you can't use Docker's `rpm` repository to install Docker Engine, you can
download the `.rpm` file for your release and install it manually. You need to
download a new file each time you want to upgrade Docker Engine.
@y
If you can't use Docker's `rpm` repository to install Docker Engine, you can
download the `.rpm` file for your release and install it manually. You need to
download a new file each time you want to upgrade Docker Engine.
@z

@x
<!-- markdownlint-disable-next-line -->
1. Go to [{{% param "download-url-base" %}}/]({{% param "download-url-base" %}}/).
@y
<!-- markdownlint-disable-next-line -->
1. Go to [{{% param "download-url-base" %}}/]({{% param "download-url-base" %}}/).
@z

@x
2. Select your RHEL version in the list.
@y
2. Select your RHEL version in the list.
@z

@x
3. Select the applicable architecture (`x86_64`, `aarch64`, or `s390x`), and
   then go to `stable/Packages/`.
@y
3. Select the applicable architecture (`x86_64`, `aarch64`, or `s390x`), and
   then go to `stable/Packages/`.
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
5. Install Docker Engine, changing the following path to the path where you downloaded
   the packages.
@y
5. Install Docker Engine, changing the following path to the path where you downloaded
   the packages.
@z

@x
   ```console
   $ sudo yum install ./containerd.io_<version>_<arch>.rpm \
     ./docker-ce_<version>_<arch>.rpm \
     ./docker-ce-cli_<version>_<arch>.rpm \
     ./docker-buildx-plugin_<version>_<arch>.rpm \
     ./docker-compose-plugin_<version>_<arch>.rpm
   ```
@y
   ```console
   $ sudo yum install ./containerd.io_<version>_<arch>.rpm \
     ./docker-ce_<version>_<arch>.rpm \
     ./docker-ce-cli_<version>_<arch>.rpm \
     ./docker-buildx-plugin_<version>_<arch>.rpm \
     ./docker-compose-plugin_<version>_<arch>.rpm
   ```
@z

@x
   Docker is installed but not started. The `docker` group is created, but no
   users are added to the group.
@y
   Docker is installed but not started. The `docker` group is created, but no
   users are added to the group.
@z

@x
6. Start Docker.
@y
6. Start Docker.
@z

@x
   ```console
   $ sudo systemctl start docker
   ```
@y
   ```console
   $ sudo systemctl start docker
   ```
@z

@x
7. Verify that the Docker Engine installation is successful by running the
   `hello-world` image.
@y
7. Verify that the Docker Engine installation is successful by running the
   `hello-world` image.
@z

@x
   ```console
   $ sudo docker run hello-world
   ```
@y
   ```console
   $ sudo docker run hello-world
   ```
@z

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
[installation procedure](#install-from-a-package), using `yum -y upgrade`
instead of `yum -y install`, and point to the new files.
@y
To upgrade Docker Engine, download the newer package files and repeat the
[installation procedure](#install-from-a-package), using `yum -y upgrade`
instead of `yum -y install`, and point to the new files.
@z

@x
{{< include "install-script.md" >}}
@y
{{< include "install-script.md" >}}
@z

@x
## Uninstall Docker Engine
@y
## Uninstall Docker Engine
@z

@x
1. Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
@y
1. Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
@z

@x
   ```console
   $ sudo yum remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
   ```
@y
   ```console
   $ sudo yum remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
   ```
@z

@x
2. Images, containers, volumes, or custom configuration files on your host
   aren't automatically removed. To delete all images, containers, and volumes:
@y
2. Images, containers, volumes, or custom configuration files on your host
   aren't automatically removed. To delete all images, containers, and volumes:
@z

@x
   ```console
   $ sudo rm -rf /var/lib/docker
   $ sudo rm -rf /var/lib/containerd
   ```
@y
   ```console
   $ sudo rm -rf /var/lib/docker
   $ sudo rm -rf /var/lib/containerd
   ```
@z

@x
You have to delete any edited configuration files manually.
@y
You have to delete any edited configuration files manually.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@y
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@z
