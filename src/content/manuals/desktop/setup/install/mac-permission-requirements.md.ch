%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
description: Understand permission requirements for Docker Desktop for Mac and the
  differences between versions
keywords: Docker Desktop, mac, security, install, permissions
title: Understand permission requirements for Docker Desktop on Mac
linkTitle: Mac permission requirements
@y
description: Understand permission requirements for Docker Desktop for Mac and the
  differences between versions
keywords: Docker Desktop, mac, security, install, permissions
title: Understand permission requirements for Docker Desktop on Mac
linkTitle: Mac permission requirements
@z

@x
This page contains information about the permission requirements for running and installing Docker Desktop on Mac.
@y
This page contains information about the permission requirements for running and installing Docker Desktop on Mac.
@z

@x
It also provides clarity on running containers as `root` as opposed to having `root` access on the host.
@y
It also provides clarity on running containers as `root` as opposed to having `root` access on the host.
@z

@x
Docker Desktop on Mac is designed with security in mind. Administrative rights are only required when absolutely necessary.
@y
Docker Desktop on Mac is designed with security in mind. Administrative rights are only required when absolutely necessary.
@z

@x
## Permission requirements
@y
## Permission requirements
@z

@x
Docker Desktop for Mac is run as an unprivileged user. However, Docker Desktop requires certain functionalities to perform a limited set of privileged configurations such as:
 - [Installing symlinks](#installing-symlinks) in`/usr/local/bin`.
 - [Binding privileged ports](#binding-privileged-ports) that are less than 1024. Although privileged ports (ports below 1024) are not typically used as a security boundary, operating systems still prevent unprivileged processes from binding to them which breaks commands like `docker run -p 127.0.0.1:80:80 docker/getting-started`.
 - [Ensuring `localhost` and `kubernetes.docker.internal` are defined](#ensuring-localhost-and-kubernetesdockerinternal-are-defined) in `/etc/hosts`. Some old macOS installs don't have `localhost` in `/etc/hosts`, which causes Docker to fail. Defining the DNS name `kubernetes.docker.internal` allows Docker to share Kubernetes contexts with containers.
 - Securely caching the Registry Access Management policy which is read-only for the developer.
@y
Docker Desktop for Mac is run as an unprivileged user. However, Docker Desktop requires certain functionalities to perform a limited set of privileged configurations such as:
 - [Installing symlinks](#installing-symlinks) in`/usr/local/bin`.
 - [Binding privileged ports](#binding-privileged-ports) that are less than 1024. Although privileged ports (ports below 1024) are not typically used as a security boundary, operating systems still prevent unprivileged processes from binding to them which breaks commands like `docker run -p 127.0.0.1:80:80 docker/getting-started`.
 - [Ensuring `localhost` and `kubernetes.docker.internal` are defined](#ensuring-localhost-and-kubernetesdockerinternal-are-defined) in `/etc/hosts`. Some old macOS installs don't have `localhost` in `/etc/hosts`, which causes Docker to fail. Defining the DNS name `kubernetes.docker.internal` allows Docker to share Kubernetes contexts with containers.
 - Securely caching the Registry Access Management policy which is read-only for the developer.
@z

@x
Privileged access is granted during installation.
@y
Privileged access is granted during installation.
@z

@x
The first time Docker Desktop for Mac launches, it presents an installation window where you can choose to either use the default settings, which work for most developers and requires you to grant privileged access, or use advanced settings.
@y
The first time Docker Desktop for Mac launches, it presents an installation window where you can choose to either use the default settings, which work for most developers and requires you to grant privileged access, or use advanced settings.
@z

@x
If you work in an environment with elevated security requirements, for instance where local administrative access is prohibited, then you can use the advanced settings to remove the need for granting privileged access. You can configure:
- The location of the Docker CLI tools either in the system or user directory
- The default Docker socket
- Privileged port mapping
@y
If you work in an environment with elevated security requirements, for instance where local administrative access is prohibited, then you can use the advanced settings to remove the need for granting privileged access. You can configure:
- The location of the Docker CLI tools either in the system or user directory
- The default Docker socket
- Privileged port mapping
@z

@x
Depending on which advanced settings you configure, you must enter your password to confirm.
@y
Depending on which advanced settings you configure, you must enter your password to confirm.
@z

@x
You can change these configurations at a later date from the **Advanced** page in **Settings**.
@y
You can change these configurations at a later date from the **Advanced** page in **Settings**.
@z

@x
### Installing symlinks
@y
### Installing symlinks
@z

@x
The Docker binaries are installed by default in `/Applications/Docker.app/Contents/Resources/bin`. Docker Desktop creates symlinks for the binaries in `/usr/local/bin`, which means they're automatically included in `PATH` on most systems.
@y
The Docker binaries are installed by default in `/Applications/Docker.app/Contents/Resources/bin`. Docker Desktop creates symlinks for the binaries in `/usr/local/bin`, which means they're automatically included in `PATH` on most systems.
@z

@x
You can choose whether to install symlinks either in `/usr/local/bin` or `$HOME/.docker/bin` during installation of Docker Desktop.
@y
You can choose whether to install symlinks either in `/usr/local/bin` or `$HOME/.docker/bin` during installation of Docker Desktop.
@z

@x
If `/usr/local/bin` is chosen, and this location is not writable by unprivileged users, Docker Desktop requires authorization to confirm this choice before the symlinks to Docker binaries are created in `/usr/local/bin`. If `$HOME/.docker/bin` is chosen, authorization is not required, but then you must [manually add `$HOME/.docker/bin`](/manuals/desktop/settings-and-maintenance/settings.md#advanced) to your PATH.
@y
If `/usr/local/bin` is chosen, and this location is not writable by unprivileged users, Docker Desktop requires authorization to confirm this choice before the symlinks to Docker binaries are created in `/usr/local/bin`. If `$HOME/.docker/bin` is chosen, authorization is not required, but then you must [manually add `$HOME/.docker/bin`](manuals/desktop/settings-and-maintenance/settings.md#advanced) to your PATH.
@z

@x
You are also given the option to enable the installation of the `/var/run/docker.sock` symlink. Creating this symlink ensures various Docker clients relying on the default Docker socket path work without additional changes.
@y
You are also given the option to enable the installation of the `/var/run/docker.sock` symlink. Creating this symlink ensures various Docker clients relying on the default Docker socket path work without additional changes.
@z

@x
As the `/var/run` is mounted as a tmpfs, its content is deleted on restart, symlink to the Docker socket included. To ensure the Docker socket exists after restart, Docker Desktop sets up a `launchd` startup task that creates the symlink by running `ln -s -f /Users/<user>/.docker/run/docker.sock /var/run/docker.sock`. This ensures the you aren't prompted on each startup to create the symlink. If you don't enable this option at installation, the symlink and the startup task is not created and you may have to explicitly set the `DOCKER_HOST` environment variable to `/Users/<user>/.docker/run/docker.sock` in the clients it is using. The Docker CLI relies on the current context to retrieve the socket path, the current context is set to `desktop-linux` on Docker Desktop startup.
@y
As the `/var/run` is mounted as a tmpfs, its content is deleted on restart, symlink to the Docker socket included. To ensure the Docker socket exists after restart, Docker Desktop sets up a `launchd` startup task that creates the symlink by running `ln -s -f /Users/<user>/.docker/run/docker.sock /var/run/docker.sock`. This ensures the you aren't prompted on each startup to create the symlink. If you don't enable this option at installation, the symlink and the startup task is not created and you may have to explicitly set the `DOCKER_HOST` environment variable to `/Users/<user>/.docker/run/docker.sock` in the clients it is using. The Docker CLI relies on the current context to retrieve the socket path, the current context is set to `desktop-linux` on Docker Desktop startup.
@z

@x
### Binding privileged ports
@y
### Binding privileged ports
@z

@x
You can choose to enable privileged port mapping during installation, or from the **Advanced** page in **Settings** post-installation. Docker Desktop requires authorization to confirm this choice.
@y
You can choose to enable privileged port mapping during installation, or from the **Advanced** page in **Settings** post-installation. Docker Desktop requires authorization to confirm this choice.
@z

@x
### Ensuring `localhost` and `kubernetes.docker.internal` are defined
@y
### Ensuring `localhost` and `kubernetes.docker.internal` are defined
@z

@x
It is your responsibility to ensure that localhost is resolved to `127.0.0.1` and if Kubernetes is used, that `kubernetes.docker.internal` is resolved to `127.0.0.1`.
@y
It is your responsibility to ensure that localhost is resolved to `127.0.0.1` and if Kubernetes is used, that `kubernetes.docker.internal` is resolved to `127.0.0.1`.
@z

@x
## Installing from the command line
@y
## Installing from the command line
@z

@x
Privileged configurations are applied during the installation with the `--user` flag on the [install command](/manuals/desktop/setup/install/mac-install.md#install-from-the-command-line). In this case, you are not prompted to grant root privileges on the first run of Docker Desktop. Specifically, the `--user` flag:
- Uninstalls the previous `com.docker.vmnetd` if present
- Sets up symlinks
- Ensures that `localhost` is resolved to `127.0.0.1`
@y
Privileged configurations are applied during the installation with the `--user` flag on the [install command](manuals/desktop/setup/install/mac-install.md#install-from-the-command-line). In this case, you are not prompted to grant root privileges on the first run of Docker Desktop. Specifically, the `--user` flag:
- Uninstalls the previous `com.docker.vmnetd` if present
- Sets up symlinks
- Ensures that `localhost` is resolved to `127.0.0.1`
@z

@x
The limitation of this approach is that Docker Desktop can only be run by one user-account per machine, namely the one specified in the `-â€“user` flag.
@y
The limitation of this approach is that Docker Desktop can only be run by one user-account per machine, namely the one specified in the `-â€“user` flag.
@z

@x
## Privileged helper
@y
## Privileged helper
@z

@x
In the limited situations when the privileged helper is needed, for example binding privileged ports or caching the Registry Access Management policy, the privileged helper is started by `launchd` and runs in the background unless it is disabled at runtime as previously described. The Docker Desktop backend communicates with the privileged helper over the UNIX domain socket `/var/run/com.docker.vmnetd.sock`. The functionalities it performs are:
- Binding privileged ports that are less than 1024.
- Securely caching the Registry Access Management policy which is read-only for the developer.
- Uninstalling the privileged helper.
@y
In the limited situations when the privileged helper is needed, for example binding privileged ports or caching the Registry Access Management policy, the privileged helper is started by `launchd` and runs in the background unless it is disabled at runtime as previously described. The Docker Desktop backend communicates with the privileged helper over the UNIX domain socket `/var/run/com.docker.vmnetd.sock`. The functionalities it performs are:
- Binding privileged ports that are less than 1024.
- Securely caching the Registry Access Management policy which is read-only for the developer.
- Uninstalling the privileged helper.
@z

@x
The removal of the privileged helper process is done in the same way as removing `launchd` processes.
@y
The removal of the privileged helper process is done in the same way as removing `launchd` processes.
@z

@x
```console
$ ps aux | grep vmnetd
root             28739   0.0  0.0 34859128    228   ??  Ss    6:03PM   0:00.06 /Library/PrivilegedHelperTools/com.docker.vmnetd
user             32222   0.0  0.0 34122828    808 s000  R+   12:55PM   0:00.00 grep vmnetd
@y
```console
$ ps aux | grep vmnetd
root             28739   0.0  0.0 34859128    228   ??  Ss    6:03PM   0:00.06 /Library/PrivilegedHelperTools/com.docker.vmnetd
user             32222   0.0  0.0 34122828    808 s000  R+   12:55PM   0:00.00 grep vmnetd
@z

@x
$ sudo launchctl unload -w /Library/LaunchDaemons/com.docker.vmnetd.plist
Password:
@y
$ sudo launchctl unload -w /Library/LaunchDaemons/com.docker.vmnetd.plist
Password:
@z

@x
$ ps aux | grep vmnetd
user             32242   0.0  0.0 34122828    716 s000  R+   12:55PM   0:00.00 grep vmnetd
@y
$ ps aux | grep vmnetd
user             32242   0.0  0.0 34122828    716 s000  R+   12:55PM   0:00.00 grep vmnetd
@z

@x
$ rm /Library/LaunchDaemons/com.docker.vmnetd.plist
@y
$ rm /Library/LaunchDaemons/com.docker.vmnetd.plist
@z

@x
$ rm /Library/PrivilegedHelperTools/com.docker.vmnetd
```
@y
$ rm /Library/PrivilegedHelperTools/com.docker.vmnetd
```
@z

@x
## Containers running as root within the Linux VM
@y
## Containers running as root within the Linux VM
@z

@x
With Docker Desktop, the Docker daemon and containers run in a lightweight Linux
VM managed by Docker. This means that although containers run by default as
`root`, this doesn't grant `root` access to the Mac host machine. The Linux VM
serves as a security boundary and limits what resources can be accessed from the
host. Any directories from the host bind mounted into Docker containers still
retain their original permissions.
@y
With Docker Desktop, the Docker daemon and containers run in a lightweight Linux
VM managed by Docker. This means that although containers run by default as
`root`, this doesn't grant `root` access to the Mac host machine. The Linux VM
serves as a security boundary and limits what resources can be accessed from the
host. Any directories from the host bind mounted into Docker containers still
retain their original permissions.
@z

@x
## Enhanced Container Isolation
@y
## Enhanced Container Isolation
@z

@x
In addition, Docker Desktop supports [Enhanced Container Isolation
mode](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md) (ECI),
available to Business customers only, which further secures containers without
impacting developer workflows.
@y
In addition, Docker Desktop supports [Enhanced Container Isolation
mode](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/_index.md) (ECI),
available to Business customers only, which further secures containers without
impacting developer workflows.
@z

@x
ECI automatically runs all containers within a Linux user-namespace, such that
root in the container is mapped to an unprivileged user inside the Docker
Desktop VM. ECI uses this and other advanced techniques to further secure
containers within the Docker Desktop Linux VM, such that they are further
isolated from the Docker daemon and other services running inside the VM.
@y
ECI automatically runs all containers within a Linux user-namespace, such that
root in the container is mapped to an unprivileged user inside the Docker
Desktop VM. ECI uses this and other advanced techniques to further secure
containers within the Docker Desktop Linux VM, such that they are further
isolated from the Docker daemon and other services running inside the VM.
@z
