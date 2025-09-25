%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Run the Docker daemon as a non-root user (Rootless mode)
keywords: security, namespaces, rootless
title: Rootless mode
@y
description: Run the Docker daemon as a non-root user (Rootless mode)
keywords: security, namespaces, rootless
title: Rootless mode
@z

@x
Rootless mode lets you run the Docker daemon and containers as a non-root
user to mitigate potential vulnerabilities in the daemon and
the container runtime.
@y
Rootless mode lets you run the Docker daemon and containers as a non-root
user to mitigate potential vulnerabilities in the daemon and
the container runtime.
@z

@x
Rootless mode does not require root privileges even during the installation of
the Docker daemon, as long as the [prerequisites](#prerequisites) are met.
@y
Rootless mode does not require root privileges even during the installation of
the Docker daemon, as long as the [prerequisites](#prerequisites) are met.
@z

@x
## How it works
@y
## How it works
@z

@x
Rootless mode executes the Docker daemon and containers inside a user namespace.
This is similar to [`userns-remap` mode](../userns-remap.md), except that
with `userns-remap` mode, the daemon itself is running with root privileges,
whereas in rootless mode, both the daemon and the container are running without
root privileges.
@y
Rootless mode executes the Docker daemon and containers inside a user namespace.
This is similar to [`userns-remap` mode](../userns-remap.md), except that
with `userns-remap` mode, the daemon itself is running with root privileges,
whereas in rootless mode, both the daemon and the container are running without
root privileges.
@z

@x
Rootless mode does not use binaries with `SETUID` bits or file capabilities,
except `newuidmap` and `newgidmap`, which are needed to allow multiple
UIDs/GIDs to be used in the user namespace.
@y
Rootless mode does not use binaries with `SETUID` bits or file capabilities,
except `newuidmap` and `newgidmap`, which are needed to allow multiple
UIDs/GIDs to be used in the user namespace.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
-  You must install `newuidmap` and `newgidmap` on the host. These commands
  are provided by the `uidmap` package on most distributions.
@y
-  You must install `newuidmap` and `newgidmap` on the host. These commands
  are provided by the `uidmap` package on most distributions.
@z

@x
- `/etc/subuid` and `/etc/subgid` should contain at least 65,536 subordinate
  UIDs/GIDs for the user. In the following example, the user `testuser` has
  65,536 subordinate UIDs/GIDs (231072-296607).
@y
- `/etc/subuid` and `/etc/subgid` should contain at least 65,536 subordinate
  UIDs/GIDs for the user. In the following example, the user `testuser` has
  65,536 subordinate UIDs/GIDs (231072-296607).
@z

@x
```console
$ id -u
1001
$ whoami
testuser
$ grep ^$(whoami): /etc/subuid
testuser:231072:65536
$ grep ^$(whoami): /etc/subgid
testuser:231072:65536
```
@y
```console
$ id -u
1001
$ whoami
testuser
$ grep ^$(whoami): /etc/subuid
testuser:231072:65536
$ grep ^$(whoami): /etc/subgid
testuser:231072:65536
```
@z

@x
The `dockerd-rootless-setuptool.sh install` script (see following) automatically shows help
when the prerequisites are not satisfied.
@y
The `dockerd-rootless-setuptool.sh install` script (see following) automatically shows help
when the prerequisites are not satisfied.
@z

@x
## Install
@y
## Install
@z

@x
> [!NOTE]
>
> If the system-wide Docker daemon is already running, consider disabling it:
>```console
>$ sudo systemctl disable --now docker.service docker.socket
>$ sudo rm /var/run/docker.sock
>```
> Should you choose not to shut down the `docker` service and socket, you will need to use the `--force`
> parameter in the next section. There are no known issues, but until you shutdown and disable you're
> still running rootful Docker. 
@y
> [!NOTE]
>
> If the system-wide Docker daemon is already running, consider disabling it:
>```console
>$ sudo systemctl disable --now docker.service docker.socket
>$ sudo rm /var/run/docker.sock
>```
> Should you choose not to shut down the `docker` service and socket, you will need to use the `--force`
> parameter in the next section. There are no known issues, but until you shutdown and disable you're
> still running rootful Docker. 
@z

@x
{{< tabs >}}
{{< tab name="With packages (RPM/DEB)" >}}
@y
{{< tabs >}}
{{< tab name="With packages (RPM/DEB)" >}}
@z

@x
If you installed Docker 20.10 or later with [RPM/DEB packages](/engine/install), you should have `dockerd-rootless-setuptool.sh` in `/usr/bin`.
@y
If you installed Docker 20.10 or later with [RPM/DEB packages](__SUBDIR__/engine/install), you should have `dockerd-rootless-setuptool.sh` in `/usr/bin`.
@z

@x
Run `dockerd-rootless-setuptool.sh install` as a non-root user to set up the daemon:
@y
Run `dockerd-rootless-setuptool.sh install` as a non-root user to set up the daemon:
@z

@x
```console
$ dockerd-rootless-setuptool.sh install
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`
@y
```console
$ dockerd-rootless-setuptool.sh install
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`
@z

@x
[INFO] Creating CLI context "rootless"
Successfully created context "rootless"
[INFO] Using CLI context "rootless"
Current context is now "rootless"
@y
[INFO] Creating CLI context "rootless"
Successfully created context "rootless"
[INFO] Using CLI context "rootless"
Current context is now "rootless"
@z

@x
[INFO] Make sure the following environment variable(s) are set (or add them to ~/.bashrc):
export PATH=/usr/bin:$PATH
@y
[INFO] Make sure the following environment variable(s) are set (or add them to ~/.bashrc):
export PATH=/usr/bin:$PATH
@z

@x
[INFO] Some applications may require the following environment variable too:
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@y
[INFO] Some applications may require the following environment variable too:
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@z

@x
If `dockerd-rootless-setuptool.sh` is not present, you may need to install the `docker-ce-rootless-extras` package manually, e.g.,
@y
If `dockerd-rootless-setuptool.sh` is not present, you may need to install the `docker-ce-rootless-extras` package manually, e.g.,
@z

@x
```console
$ sudo apt-get install -y docker-ce-rootless-extras
```
@y
```console
$ sudo apt-get install -y docker-ce-rootless-extras
```
@z

@x
{{< /tab >}}
{{< tab name="Without packages" >}}
@y
{{< /tab >}}
{{< tab name="Without packages" >}}
@z

@x
If you do not have permission to run package managers like `apt-get` and `dnf`,
consider using the installation script available at [https://get.docker.com/rootless](https://get.docker.com/rootless).
Since static packages are not available for `s390x`, hence it is not supported for `s390x`.
@y
If you do not have permission to run package managers like `apt-get` and `dnf`,
consider using the installation script available at [https://get.docker.com/rootless](https://get.docker.com/rootless).
Since static packages are not available for `s390x`, hence it is not supported for `s390x`.
@z

@x
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`
@y
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`
@z

@x
[INFO] Creating CLI context "rootless"
Successfully created context "rootless"
[INFO] Using CLI context "rootless"
Current context is now "rootless"
@y
[INFO] Creating CLI context "rootless"
Successfully created context "rootless"
[INFO] Using CLI context "rootless"
Current context is now "rootless"
@z

@x
[INFO] Make sure the following environment variable(s) are set (or add them to ~/.bashrc):
export PATH=/home/testuser/bin:$PATH
@y
[INFO] Make sure the following environment variable(s) are set (or add them to ~/.bashrc):
export PATH=/home/testuser/bin:$PATH
@z

@x
[INFO] Some applications may require the following environment variable too:
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@y
[INFO] Some applications may require the following environment variable too:
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@z

@x
The binaries will be installed at `~/bin`.
@y
The binaries will be installed at `~/bin`.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Run `docker info` to confirm that the `docker` client is connecting to the Rootless daemon:
```console
$ docker info
Client: Docker Engine - Community
 Version:    28.3.3
 Context:    rootless
...
Server:
...
 Security Options:
  seccomp
   Profile: builtin
  rootless
  cgroupns
...
```
@y
Run `docker info` to confirm that the `docker` client is connecting to the Rootless daemon:
```console
$ docker info
Client: Docker Engine - Community
 Version:    28.3.3
 Context:    rootless
...
Server:
...
 Security Options:
  seccomp
   Profile: builtin
  rootless
  cgroupns
...
```
@z

@x
See [Troubleshooting](./troubleshoot.md) if you faced an error.
@y
See [Troubleshooting](./troubleshoot.md) if you faced an error.
@z
