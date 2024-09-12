%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how to install Docker as a binary. These instructions are most suitable for testing purposes.
keywords: binaries, installation, docker, documentation, linux, install docker engine
title: Install Docker Engine from binaries
@y
description: Learn how to install Docker as a binary. These instructions are most suitable for testing purposes.
keywords: binaries, installation, docker, documentation, linux, install docker engine
title: Install Docker Engine from binaries
@z

@x
> [!IMPORTANT]
>
> This page contains information on how to install Docker using binaries. These
> instructions are mostly suitable for testing purposes. We do not recommend
> installing Docker using binaries in production environments as they don't have automatic security updates. The Linux binaries described on this
> page are statically linked, which means that vulnerabilities in build-time
> dependencies are not automatically patched by security updates of your Linux
> distribution.
>
> Updating binaries is also slightly more involved when compared to Docker packages
> installed using a package manager or through Docker Desktop, as it requires
> (manually) updating the installed version whenever there is a new release of
> Docker.
>
> Also, static binaries may not include all functionalities provided by the dynamic
> packages.
>
> On Windows and Mac, we recommend that you install [Docker Desktop](/manuals/desktop/index.md)
> instead. For Linux, we recommend that you follow the instructions specific for
> your distribution.
@y
> [!IMPORTANT]
>
> This page contains information on how to install Docker using binaries. These
> instructions are mostly suitable for testing purposes. We do not recommend
> installing Docker using binaries in production environments as they don't have automatic security updates. The Linux binaries described on this
> page are statically linked, which means that vulnerabilities in build-time
> dependencies are not automatically patched by security updates of your Linux
> distribution.
>
> Updating binaries is also slightly more involved when compared to Docker packages
> installed using a package manager or through Docker Desktop, as it requires
> (manually) updating the installed version whenever there is a new release of
> Docker.
>
> Also, static binaries may not include all functionalities provided by the dynamic
> packages.
>
> On Windows and Mac, we recommend that you install [Docker Desktop](manuals/desktop/index.md)
> instead. For Linux, we recommend that you follow the instructions specific for
> your distribution.
@z

@x
If you want to try Docker or use it in a testing environment, but you're not on
a supported platform, you can try installing from static binaries. If possible,
you should use packages built for your operating system, and use your operating
system's package management system to manage Docker installation and upgrades.
@y
If you want to try Docker or use it in a testing environment, but you're not on
a supported platform, you can try installing from static binaries. If possible,
you should use packages built for your operating system, and use your operating
system's package management system to manage Docker installation and upgrades.
@z

@x
Static binaries for the Docker daemon binary are only available for Linux (as
`dockerd`) and Windows (as `dockerd.exe`).
Static binaries for the Docker client are available for Linux, Windows, and macOS (as `docker`).
@y
Static binaries for the Docker daemon binary are only available for Linux (as
`dockerd`) and Windows (as `dockerd.exe`).
Static binaries for the Docker client are available for Linux, Windows, and macOS (as `docker`).
@z

@x
This topic discusses binary installation for Linux, Windows, and macOS:
@y
This topic discusses binary installation for Linux, Windows, and macOS:
@z

@x
- [Install daemon and client binaries on Linux](#install-daemon-and-client-binaries-on-linux)
- [Install client binaries on macOS](#install-client-binaries-on-macos)
- [Install server and client binaries on Windows](#install-server-and-client-binaries-on-windows)
@y
- [Install daemon and client binaries on Linux](#install-daemon-and-client-binaries-on-linux)
- [Install client binaries on macOS](#install-client-binaries-on-macos)
- [Install server and client binaries on Windows](#install-server-and-client-binaries-on-windows)
@z

@x
## Install daemon and client binaries on Linux
@y
## Install daemon and client binaries on Linux
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before attempting to install Docker from binaries, be sure your host machine
meets the prerequisites:
@y
Before attempting to install Docker from binaries, be sure your host machine
meets the prerequisites:
@z

@x
- A 64-bit installation
- Version 3.10 or higher of the Linux kernel. The latest version of the kernel
  available for your platform is recommended.
- `iptables` version 1.4 or higher
- `git` version 1.7 or higher
- A `ps` executable, usually provided by `procps` or a similar package.
- [XZ Utils](https://tukaani.org/xz/) 4.9 or higher
- A [properly mounted](
  https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount)
  `cgroupfs` hierarchy; a single, all-encompassing `cgroup` mount
  point is not sufficient. See Github issues
  [#2683](https://github.com/moby/moby/issues/2683),
  [#3485](https://github.com/moby/moby/issues/3485),
  [#4568](https://github.com/moby/moby/issues/4568)).
@y
- A 64-bit installation
- Version 3.10 or higher of the Linux kernel. The latest version of the kernel
  available for your platform is recommended.
- `iptables` version 1.4 or higher
- `git` version 1.7 or higher
- A `ps` executable, usually provided by `procps` or a similar package.
- [XZ Utils](https://tukaani.org/xz/) 4.9 or higher
- A [properly mounted](
  https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount)
  `cgroupfs` hierarchy; a single, all-encompassing `cgroup` mount
  point is not sufficient. See Github issues
  [#2683](https://github.com/moby/moby/issues/2683),
  [#3485](https://github.com/moby/moby/issues/3485),
  [#4568](https://github.com/moby/moby/issues/4568)).
@z

@x
#### Secure your environment as much as possible
@y
#### Secure your environment as much as possible
@z

@x
##### OS considerations
@y
##### OS considerations
@z

@x
Enable SELinux or AppArmor if possible.
@y
Enable SELinux or AppArmor if possible.
@z

@x
It is recommended to use AppArmor or SELinux if your Linux distribution supports
either of the two. This helps improve security and blocks certain
types of exploits. Review the documentation for your Linux distribution for
instructions for enabling and configuring AppArmor or SELinux.
@y
It is recommended to use AppArmor or SELinux if your Linux distribution supports
either of the two. This helps improve security and blocks certain
types of exploits. Review the documentation for your Linux distribution for
instructions for enabling and configuring AppArmor or SELinux.
@z

@x
> **Security warning**
>
> If either of the security mechanisms is enabled, do not disable it as a
> work-around to make Docker or its containers run. Instead, configure it
> correctly to fix any problems.
@y
> **Security warning**
>
> If either of the security mechanisms is enabled, do not disable it as a
> work-around to make Docker or its containers run. Instead, configure it
> correctly to fix any problems.
@z

@x
##### Docker daemon considerations
@y
##### Docker daemon considerations
@z

@x
- Enable `seccomp` security profiles if possible. See
  [Enabling `seccomp` for Docker](../security/seccomp.md).
@y
- Enable `seccomp` security profiles if possible. See
  [Enabling `seccomp` for Docker](../security/seccomp.md).
@z

@x
- Enable user namespaces if possible. See the
  [Daemon user namespace options](/reference/cli/dockerd/#daemon-user-namespace-options).
@y
- Enable user namespaces if possible. See the
  [Daemon user namespace options](__SUBDIR__/reference/cli/dockerd/#daemon-user-namespace-options).
@z

@x
### Install static binaries
@y
### Install static binaries
@z

@x
1.  Download the static binary archive. Go to
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/),
    choose your hardware platform, and download the `.tgz` file relating to the
    version of Docker Engine you want to install.
@y
1.  Download the static binary archive. Go to
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/),
    choose your hardware platform, and download the `.tgz` file relating to the
    version of Docker Engine you want to install.
@z

@x
2.  Extract the archive using the `tar` utility. The `dockerd` and `docker`
    binaries are extracted.
@y
2.  Extract the archive using the `tar` utility. The `dockerd` and `docker`
    binaries are extracted.
@z

@x
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@y
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@z

@x
3.  **Optional**: Move the binaries to a directory on your executable path, such
    as `/usr/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@y
3.  **Optional**: Move the binaries to a directory on your executable path, such
    as `/usr/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@z

@x
    ```console
    $ sudo cp docker/* /usr/bin/
    ```
@y
    ```console
    $ sudo cp docker/* /usr/bin/
    ```
@z

@x
4.  Start the Docker daemon:
@y
4.  Start the Docker daemon:
@z

@x
    ```console
    $ sudo dockerd &
    ```
@y
    ```console
    $ sudo dockerd &
    ```
@z

@x
    If you need to start the daemon with additional options, modify the above
    command accordingly or create and edit the file `/etc/docker/daemon.json`
    to add the custom configuration options.
@y
    If you need to start the daemon with additional options, modify the above
    command accordingly or create and edit the file `/etc/docker/daemon.json`
    to add the custom configuration options.
@z

@x
5.  Verify that Docker is installed correctly by running the `hello-world`
    image.
@y
5.  Verify that Docker is installed correctly by running the `hello-world`
    image.
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
    container runs, it prints a message and exits.
@y
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
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
## Install client binaries on macOS
@y
## Install client binaries on macOS
@z

@x
> [!NOTE]
>
> The following instructions are mostly suitable for testing purposes. The macOS
> binary includes the Docker client only. It does not include the `dockerd` daemon
> which is required to run containers. Therefore, we recommend that you install
> [Docker Desktop](/manuals/desktop/index.md) instead.
@y
> [!NOTE]
>
> The following instructions are mostly suitable for testing purposes. The macOS
> binary includes the Docker client only. It does not include the `dockerd` daemon
> which is required to run containers. Therefore, we recommend that you install
> [Docker Desktop](manuals/desktop/index.md) instead.
@z

@x
The binaries for Mac also do not contain:
@y
The binaries for Mac also do not contain:
@z

@x
- A runtime environment. You must set up a functional engine either in a Virtual Machine, or on a remote Linux machine.
- Docker components such as `buildx` and `docker compose`.
@y
- A runtime environment. You must set up a functional engine either in a Virtual Machine, or on a remote Linux machine.
- Docker components such as `buildx` and `docker compose`.
@z

@x
To install client binaries, perform the following steps:
@y
To install client binaries, perform the following steps:
@z

@x
1.  Download the static binary archive. Go to
    [https://download.docker.com/mac/static/stable/](https://download.docker.com/mac/static/stable/) and select `x86_64` (for Mac on Intel chip) or `aarch64` (for Mac on Apple silicon),
    and then download the `.tgz` file relating to the version of Docker Engine you want
    to install.
@y
1.  Download the static binary archive. Go to
    [https://download.docker.com/mac/static/stable/](https://download.docker.com/mac/static/stable/) and select `x86_64` (for Mac on Intel chip) or `aarch64` (for Mac on Apple silicon),
    and then download the `.tgz` file relating to the version of Docker Engine you want
    to install.
@z

@x
2.  Extract the archive using the `tar` utility. The `docker` binary is
    extracted.
@y
2.  Extract the archive using the `tar` utility. The `docker` binary is
    extracted.
@z

@x
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@y
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@z

@x
3.  Clear the extended attributes to allow it run.
@y
3.  Clear the extended attributes to allow it run.
@z

@x
    ```console
    $ sudo xattr -rc docker
    ```
@y
    ```console
    $ sudo xattr -rc docker
    ```
@z

@x
    Now, when you run the following command, you can see the Docker CLI usage instructions:
@y
    Now, when you run the following command, you can see the Docker CLI usage instructions:
@z

@x
    ```console
    $ docker/docker
    ```
@y
    ```console
    $ docker/docker
    ```
@z

@x
4.  **Optional**: Move the binary to a directory on your executable path, such
    as `/usr/local/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@y
4.  **Optional**: Move the binary to a directory on your executable path, such
    as `/usr/local/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@z

@x
    ```console
    $ sudo cp docker/docker /usr/local/bin/
    ```
@y
    ```console
    $ sudo cp docker/docker /usr/local/bin/
    ```
@z

@x
5.  Verify that Docker is installed correctly by running the `hello-world`
    image. The value of `<hostname>` is a hostname or IP address running the
    Docker daemon and accessible to the client.
@y
5.  Verify that Docker is installed correctly by running the `hello-world`
    image. The value of `<hostname>` is a hostname or IP address running the
    Docker daemon and accessible to the client.
@z

@x
    ```console
    $ sudo docker -H <hostname> run hello-world
    ```
@y
    ```console
    $ sudo docker -H <hostname> run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@z

@x
## Install server and client binaries on Windows
@y
## Install server and client binaries on Windows
@z

@x
> [!NOTE]
>
> The following section describes how to install the Docker daemon on Windows
> Server which allows you to run Windows containers only. When you install the
> Docker daemon on Windows Server, the daemon doesn't contain Docker components
> such as `buildx` and `compose`. If you're running Windows 10 or 11,
> we recommend that you install [Docker Desktop](/manuals/desktop/index.md) instead.
@y
> [!NOTE]
>
> The following section describes how to install the Docker daemon on Windows
> Server which allows you to run Windows containers only. When you install the
> Docker daemon on Windows Server, the daemon doesn't contain Docker components
> such as `buildx` and `compose`. If you're running Windows 10 or 11,
> we recommend that you install [Docker Desktop](manuals/desktop/index.md) instead.
@z

@x
Binary packages on Windows include both `dockerd.exe` and `docker.exe`. On Windows,
these binaries only provide the ability to run native Windows containers (not
Linux containers).
@y
Binary packages on Windows include both `dockerd.exe` and `docker.exe`. On Windows,
these binaries only provide the ability to run native Windows containers (not
Linux containers).
@z

@x
To install server and client binaries, perform the following steps:
@y
To install server and client binaries, perform the following steps:
@z

@x
1. Download the static binary archive. Go to
    [https://download.docker.com/win/static/stable/x86_64](https://download.docker.com/win/static/stable/x86_64) and select the latest version from the list.
@y
1. Download the static binary archive. Go to
    [https://download.docker.com/win/static/stable/x86_64](https://download.docker.com/win/static/stable/x86_64) and select the latest version from the list.
@z

@x
2. Run the following PowerShell commands to install and extract the archive to your program files:
@y
2. Run the following PowerShell commands to install and extract the archive to your program files:
@z

@x
    ```powershell
    PS C:\> Expand-Archive /path/to/<FILE>.zip -DestinationPath $Env:ProgramFiles
    ```
@y
    ```powershell
    PS C:\> Expand-Archive /path/to/<FILE>.zip -DestinationPath $Env:ProgramFiles
    ```
@z

@x
3. Register the service and start the Docker Engine:
@y
3. Register the service and start the Docker Engine:
@z

@x
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\dockerd --register-service
    PS C:\> Start-Service docker
    ```
@y
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\dockerd --register-service
    PS C:\> Start-Service docker
    ```
@z

@x
4.  Verify that Docker is installed correctly by running the `hello-world`
    image.
@y
4.  Verify that Docker is installed correctly by running the `hello-world`
    image.
@z

@x
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\docker run hello-world:nanoserver
    ```
@y
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\docker run hello-world:nanoserver
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@z

@x
## Upgrade static binaries
@y
## Upgrade static binaries
@z

@x
To upgrade your manual installation of Docker Engine, first stop any
`dockerd` or `dockerd.exe`  processes running locally, then follow the
regular installation steps to install the new version on top of the existing
version.
@y
To upgrade your manual installation of Docker Engine, first stop any
`dockerd` or `dockerd.exe`  processes running locally, then follow the
regular installation steps to install the new version on top of the existing
version.
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
