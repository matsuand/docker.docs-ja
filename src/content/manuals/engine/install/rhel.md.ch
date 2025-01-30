%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Learn how to install Docker Engine on RHEL. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, dnf, installation, rhel, rpm, install, install docker engine, uninstall, upgrade,
  update
title: Install Docker Engine on RHEL
linkTitle: RHEL
@y
description: Learn how to install Docker Engine on RHEL. These instructions cover
  the different installation methods, how to uninstall, and next steps.
keywords: requirements, dnf, installation, rhel, rpm, install, install docker engine, uninstall, upgrade,
  update
title: Install Docker Engine on RHEL
linkTitle: RHEL
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
Before you can install Docker Engine, you need to uninstall any conflicting packages.
@y
Before you can install Docker Engine, you need to uninstall any conflicting packages.
@z

@x
Your Linux distribution may provide unofficial Docker packages, which may conflict
with the official packages provided by Docker. You must uninstall these packages
before you install the official version of Docker Engine.
@y
Your Linux distribution may provide unofficial Docker packages, which may conflict
with the official packages provided by Docker. You must uninstall these packages
before you install the official version of Docker Engine.
@z

% snip command...

@x
`dnf` might report that you have none of these packages installed.
@y
`dnf` might report that you have none of these packages installed.
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
Install the `dnf-plugins-core` package (which provides the commands to manage
your DNF repositories) and set up the repository.
@y
Install the `dnf-plugins-core` package (which provides the commands to manage
your DNF repositories) and set up the repository.
@z

% snip command...

@x
#### Install Docker Engine
@y
#### Install Docker Engine
@z

@x
1. Install the Docker packages.
@y
1. Install the Docker packages.
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

% snip command...

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
   separated by a hyphen (`-`). For example, `docker-ce-3:{{% param "docker_ce_version" %}}-1.el9`.
@y
   Install a specific version by its fully qualified package name, which is
   the package name (`docker-ce`) plus the version string (2nd column),
   separated by a hyphen (`-`). For example, `docker-ce-3:{{% param "docker_ce_version" %}}-1.el9`.
@z

@x
   Replace `<VERSION_STRING>` with the desired version and then run the following
   command to install:
@y
   Replace `<VERSION_STRING>` with the desired version and then run the following
   command to install:
@z

% snip command...

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
2. Start Docker Engine.
@y
2. Start Docker Engine.
@z

% snip command...

@x
   This configures the Docker systemd service to start automatically when you
   boot your system. If you don't want Docker to start automatically, use `sudo
   systemctl start docker` instead.
@y
   This configures the Docker systemd service to start automatically when you
   boot your system. If you don't want Docker to start automatically, use `sudo
   systemctl start docker` instead.
@z

@x
3. Verify that the installation is successful by running the `hello-world` image:
@y
3. Verify that the installation is successful by running the `hello-world` image:
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
{{% include "root-errors.md" %}}
@y
{{% include "root-errors.md" %}}
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
4. Download the following `rpm` files for the Docker Engine, CLI, containerd,
   and Docker Compose packages:
@y
4. Download the following `rpm` files for the Docker Engine, CLI, containerd,
   and Docker Compose packages:
@z

@x
   - `containerd.io-<version>.<arch>.rpm`
   - `docker-ce-<version>.<arch>.rpm`
   - `docker-ce-cli-<version>.<arch>.rpm`
   - `docker-buildx-plugin-<version>.<arch>.rpm`
   - `docker-compose-plugin-<version>.<arch>.rpm`
@y
   - `containerd.io-<version>.<arch>.rpm`
   - `docker-ce-<version>.<arch>.rpm`
   - `docker-ce-cli-<version>.<arch>.rpm`
   - `docker-buildx-plugin-<version>.<arch>.rpm`
   - `docker-compose-plugin-<version>.<arch>.rpm`
@z

@x
5. Install Docker Engine, changing the following path to the path where you downloaded
   the packages.
@y
5. Install Docker Engine, changing the following path to the path where you downloaded
   the packages.
@z

% snip command...

@x
   Docker is installed but not started. The `docker` group is created, but no
   users are added to the group.
@y
   Docker is installed but not started. The `docker` group is created, but no
   users are added to the group.
@z

@x
6. Start Docker Engine.
@y
6. Start Docker Engine.
@z

% snip command...

@x
   This configures the Docker systemd service to start automatically when you
   boot your system. If you don't want Docker to start automatically, use `sudo
   systemctl start docker` instead.
@y
   This configures the Docker systemd service to start automatically when you
   boot your system. If you don't want Docker to start automatically, use `sudo
   systemctl start docker` instead.
@z

@x
7. Verify that the installation is successful by running the `hello-world` image:
@y
7. Verify that the installation is successful by running the `hello-world` image:
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
{{% include "root-errors.md" %}}
@y
{{% include "root-errors.md" %}}
@z

@x
#### Upgrade Docker Engine
@y
#### Upgrade Docker Engine
@z

@x
To upgrade Docker Engine, download the newer package files and repeat the
[installation procedure](#install-from-a-package), using `dnf upgrade`
instead of `dnf install`, and point to the new files.
@y
To upgrade Docker Engine, download the newer package files and repeat the
[installation procedure](#install-from-a-package), using `dnf upgrade`
instead of `dnf install`, and point to the new files.
@z

@x
{{% include "install-script.md" %}}
@y
{{% include "install-script.md" %}}
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

% snip command...

@x
2. Images, containers, volumes, or custom configuration files on your host
   aren't automatically removed. To delete all images, containers, and volumes:
@y
2. Images, containers, volumes, or custom configuration files on your host
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
## Next steps
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@y
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
@z
