%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

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
Rootless mode allows running the Docker daemon and containers as a non-root
user to mitigate potential vulnerabilities in the daemon and
the container runtime.
@y
Rootless mode allows running the Docker daemon and containers as a non-root
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
This is very similar to [`userns-remap` mode](userns-remap.md), except that
with `userns-remap` mode, the daemon itself is running with root privileges,
whereas in rootless mode, both the daemon and the container are running without
root privileges.
@y
Rootless mode executes the Docker daemon and containers inside a user namespace.
This is very similar to [`userns-remap` mode](userns-remap.md), except that
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

% snip command...

@x
### Distribution-specific hint
@y
### Distribution-specific hint
@z

@x
> [!TIP]
>
> We recommend that you use the Ubuntu kernel.
@y
> [!TIP]
>
> We recommend that you use the Ubuntu kernel.
@z

@x
{{< tabs >}}
{{< tab name="Ubuntu" >}}
- Install `dbus-user-session` package if not installed. Run `sudo apt-get install -y dbus-user-session` and relogin.
@y
{{< tabs >}}
{{< tab name="Ubuntu" >}}
- Install `dbus-user-session` package if not installed. Run `sudo apt-get install -y dbus-user-session` and relogin.
@z

@x
- `overlay2` storage driver  is enabled by default
  ([Ubuntu-specific kernel patch](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144)).
@y
- `overlay2` storage driver  is enabled by default
  ([Ubuntu-specific kernel patch](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144)).
@z

@x
- Ubuntu 24.04 and later enables restricted unprivileged user namespaces by
  default, which prevents unprivileged processes in creating user namespaces
  unless an AppArmor profile is configured to allow programs to use
  unprivileged user namespaces.
@y
- Ubuntu 24.04 and later enables restricted unprivileged user namespaces by
  default, which prevents unprivileged processes in creating user namespaces
  unless an AppArmor profile is configured to allow programs to use
  unprivileged user namespaces.
@z

@x
  If you install `docker-ce-rootless-extras` using the deb package (`apt-get
  install docker-ce-rootless-extras`), then the AppArmor profile for
  `rootlesskit` is already bundled with the `apparmor` deb package. With this
  installation method, you don't need to add any manual the AppArmor
  configuration. If you install the rootless extras using the [installation
  script](https://get.docker.com/rootless), however, you must add an AppArmor
  profile for `rootlesskit` manually:
@y
  If you install `docker-ce-rootless-extras` using the deb package (`apt-get
  install docker-ce-rootless-extras`), then the AppArmor profile for
  `rootlesskit` is already bundled with the `apparmor` deb package. With this
  installation method, you don't need to add any manual the AppArmor
  configuration. If you install the rootless extras using the [installation
  script](https://get.docker.com/rootless), however, you must add an AppArmor
  profile for `rootlesskit` manually:
@z

@x
  1. Create and install the currently logged-in user's AppArmor profile:
@y
  1. Create and install the currently logged-in user's AppArmor profile:
@z

% snip command...

@x
  2. Restart AppArmor.
@y
  2. Restart AppArmor.
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Debian GNU/Linux" >}}
- Install `dbus-user-session` package if not installed. Run `sudo apt-get install -y dbus-user-session` and relogin.
@y
{{< /tab >}}
{{< tab name="Debian GNU/Linux" >}}
- Install `dbus-user-session` package if not installed. Run `sudo apt-get install -y dbus-user-session` and relogin.
@z

@x
- For Debian 11, installing `fuse-overlayfs` is recommended. Run `sudo apt-get install -y fuse-overlayfs`.
  This step is not required on Debian 12.
@y
- For Debian 11, installing `fuse-overlayfs` is recommended. Run `sudo apt-get install -y fuse-overlayfs`.
  This step is not required on Debian 12.
@z

@x
- Rootless docker requires version of `slirp4netns` greater than `v0.4.0` (when `vpnkit` is not installed).
  Check you have this with 
@y
- Rootless docker requires version of `slirp4netns` greater than `v0.4.0` (when `vpnkit` is not installed).
  Check you have this with 
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Arch Linux" >}}
- Installing `fuse-overlayfs` is recommended. Run `sudo pacman -S fuse-overlayfs`.
@y
{{< /tab >}}
{{< tab name="Arch Linux" >}}
- Installing `fuse-overlayfs` is recommended. Run `sudo pacman -S fuse-overlayfs`.
@z

@x
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
{{< /tab >}}
{{< tab name="openSUSE and SLES" >}}
- For openSUSE 15 and SLES 15, Installing `fuse-overlayfs` is recommended. Run `sudo zypper install -y fuse-overlayfs`.
  This step is not required on openSUSE Tumbleweed.
@y
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
{{< /tab >}}
{{< tab name="openSUSE and SLES" >}}
- For openSUSE 15 and SLES 15, Installing `fuse-overlayfs` is recommended. Run `sudo zypper install -y fuse-overlayfs`.
  This step is not required on openSUSE Tumbleweed.
@z

@x
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distributions as well depending on the configuration.
@y
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distributions as well depending on the configuration.
@z

@x
- Known to work on openSUSE 15 and SLES 15.
@y
- Known to work on openSUSE 15 and SLES 15.
@z

@x
{{< /tab >}}
{{< tab name="CentOS, RHEL, and Fedora" >}}
@y
{{< /tab >}}
{{< tab name="CentOS, RHEL, and Fedora" >}}
@z

@x
- For RHEL 8 and similar distributions, installing `fuse-overlayfs` is recommended. Run `sudo dnf install -y fuse-overlayfs`.
  This step is not required on RHEL 9 and similar distributions.
@y
- For RHEL 8 and similar distributions, installing `fuse-overlayfs` is recommended. Run `sudo dnf install -y fuse-overlayfs`.
  This step is not required on RHEL 9 and similar distributions.
@z

@x
- You might need `sudo dnf install -y iptables`.
@y
- You might need `sudo dnf install -y iptables`.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Known limitations
@y
## Known limitations
@z

@x
- Only the following storage drivers are supported:
  - `overlay2` (only if running with kernel 5.11 or later, or Ubuntu-flavored kernel)
  - `fuse-overlayfs` (only if running with kernel 4.18 or later, and `fuse-overlayfs` is installed)
  - `btrfs` (only if running with kernel 4.18 or later, or `~/.local/share/docker` is mounted with `user_subvol_rm_allowed` mount option)
  - `vfs`
- Cgroup is supported only when running with cgroup v2 and systemd. See [Limiting resources](#limiting-resources).
- Following features are not supported:
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
- NFS mounts as the docker "data-root" is not supported. This limitation is not specific to rootless mode.
@y
- Only the following storage drivers are supported:
  - `overlay2` (only if running with kernel 5.11 or later, or Ubuntu-flavored kernel)
  - `fuse-overlayfs` (only if running with kernel 4.18 or later, and `fuse-overlayfs` is installed)
  - `btrfs` (only if running with kernel 4.18 or later, or `~/.local/share/docker` is mounted with `user_subvol_rm_allowed` mount option)
  - `vfs`
- Cgroup is supported only when running with cgroup v2 and systemd. See [Limiting resources](#limiting-resources).
- Following features are not supported:
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
- NFS mounts as the docker "data-root" is not supported. This limitation is not specific to rootless mode.
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

% snip command...

@x
If `dockerd-rootless-setuptool.sh` is not present, you may need to install the `docker-ce-rootless-extras` package manually, e.g.,
@y
If `dockerd-rootless-setuptool.sh` is not present, you may need to install the `docker-ce-rootless-extras` package manually, e.g.,
@z

% snip command...

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

% snip command...

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
See [Troubleshooting](#troubleshooting) if you faced an error.
@y
See [Troubleshooting](#troubleshooting) if you faced an error.
@z

@x
## Uninstall
@y
## Uninstall
@z

@x
To remove the systemd service of the Docker daemon, run `dockerd-rootless-setuptool.sh uninstall`:
@y
To remove the systemd service of the Docker daemon, run `dockerd-rootless-setuptool.sh uninstall`:
@z

% snip command...

@x
Unset environment variables PATH and DOCKER_HOST if you have added them to `~/.bashrc`.
@y
Unset environment variables PATH and DOCKER_HOST if you have added them to `~/.bashrc`.
@z

@x
To remove the data directory, run `rootlesskit rm -rf ~/.local/share/docker`.
@y
To remove the data directory, run `rootlesskit rm -rf ~/.local/share/docker`.
@z

@x
To remove the binaries, remove `docker-ce-rootless-extras` package if you installed Docker with package managers.
If you installed Docker with https://get.docker.com/rootless ([Install without packages](#install)),
remove the binary files under `~/bin`:
@y
To remove the binaries, remove `docker-ce-rootless-extras` package if you installed Docker with package managers.
If you installed Docker with https://get.docker.com/rootless ([Install without packages](#install)),
remove the binary files under `~/bin`:
@z

% snip command...

@x
## Usage
@y
## Usage
@z

@x
### Daemon
@y
### Daemon
@z

@x
{{< tabs >}}
{{< tab name="With systemd (Highly recommended)" >}}
@y
{{< tabs >}}
{{< tab name="With systemd (Highly recommended)" >}}
@z

@x
The systemd unit file is installed as  `~/.config/systemd/user/docker.service`.
@y
The systemd unit file is installed as  `~/.config/systemd/user/docker.service`.
@z

@x
Use `systemctl --user` to manage the lifecycle of the daemon:
@y
Use `systemctl --user` to manage the lifecycle of the daemon:
@z

% snip command...

@x
To launch the daemon on system startup, enable the systemd service and lingering:
@y
To launch the daemon on system startup, enable the systemd service and lingering:
@z

% snip command...

@x
Starting Rootless Docker as a systemd-wide service (`/etc/systemd/system/docker.service`)
is not supported, even with the `User=` directive.
@y
Starting Rootless Docker as a systemd-wide service (`/etc/systemd/system/docker.service`)
is not supported, even with the `User=` directive.
@z

@x
{{< /tab >}}
{{< tab name="Without systemd" >}}
@y
{{< /tab >}}
{{< tab name="Without systemd" >}}
@z

@x
To run the daemon directly without systemd, you need to run `dockerd-rootless.sh` instead of `dockerd`.
@y
To run the daemon directly without systemd, you need to run `dockerd-rootless.sh` instead of `dockerd`.
@z

@x
The following environment variables must be set:
- `$HOME`: the home directory
- `$XDG_RUNTIME_DIR`: an ephemeral directory that is only accessible by the expected user, e,g, `~/.docker/run`.
  The directory should be removed on every host shutdown.
  The directory can be on tmpfs, however, should not be under `/tmp`.
  Locating this directory under `/tmp` might be vulnerable to TOCTOU attack.
@y
The following environment variables must be set:
- `$HOME`: the home directory
- `$XDG_RUNTIME_DIR`: an ephemeral directory that is only accessible by the expected user, e,g, `~/.docker/run`.
  The directory should be removed on every host shutdown.
  The directory can be on tmpfs, however, should not be under `/tmp`.
  Locating this directory under `/tmp` might be vulnerable to TOCTOU attack.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Remarks about directory paths:
@y
Remarks about directory paths:
@z

@x
- The socket path is set to `$XDG_RUNTIME_DIR/docker.sock` by default.
  `$XDG_RUNTIME_DIR` is typically set to `/run/user/$UID`.
- The data dir is set to `~/.local/share/docker` by default.
  The data dir should not be on NFS.
- The daemon config dir is set to `~/.config/docker` by default.
  This directory is different from `~/.docker` that is used by the client.
@y
- The socket path is set to `$XDG_RUNTIME_DIR/docker.sock` by default.
  `$XDG_RUNTIME_DIR` is typically set to `/run/user/$UID`.
- The data dir is set to `~/.local/share/docker` by default.
  The data dir should not be on NFS.
- The daemon config dir is set to `~/.config/docker` by default.
  This directory is different from `~/.docker` that is used by the client.
@z

@x
### Client
@y
### Client
@z

@x
You need to specify either the socket path or the CLI context explicitly.
@y
You need to specify either the socket path or the CLI context explicitly.
@z

@x
To specify the socket path using `$DOCKER_HOST`:
@y
To specify the socket path using `$DOCKER_HOST`:
@z

% snip command...

@x
To specify the CLI context using `docker context`:
@y
To specify the CLI context using `docker context`:
@z

% snip command...

@x
## Best practices
@y
## Best practices
@z

@x
### Rootless Docker in Docker
@y
### Rootless Docker in Docker
@z

@x
To run Rootless Docker inside "rootful" Docker, use the `docker:<version>-dind-rootless`
image instead of `docker:<version>-dind`.
@y
To run Rootless Docker inside "rootful" Docker, use the `docker:<version>-dind-rootless`
image instead of `docker:<version>-dind`.
@z

% snip command...

@x
The `docker:<version>-dind-rootless` image runs as a non-root user (UID 1000).
However, `--privileged` is required for disabling seccomp, AppArmor, and mount
masks.
@y
The `docker:<version>-dind-rootless` image runs as a non-root user (UID 1000).
However, `--privileged` is required for disabling seccomp, AppArmor, and mount
masks.
@z

@x
### Expose Docker API socket through TCP
@y
### Expose Docker API socket through TCP
@z

@x
To expose the Docker API socket through TCP, you need to launch `dockerd-rootless.sh`
with `DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp"`.
@y
To expose the Docker API socket through TCP, you need to launch `dockerd-rootless.sh`
with `DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp"`.
@z

% snip command...

@x
### Expose Docker API socket through SSH
@y
### Expose Docker API socket through SSH
@z

@x
To expose the Docker API socket through SSH, you need to make sure `$DOCKER_HOST`
is set on the remote host.
@y
To expose the Docker API socket through SSH, you need to make sure `$DOCKER_HOST`
is set on the remote host.
@z

% snip command...

@x
### Routing ping packets
@y
### Routing ping packets
@z

@x
On some distributions, `ping` does not work by default.
@y
On some distributions, `ping` does not work by default.
@z

@x
Add `net.ipv4.ping_group_range = 0   2147483647` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system` to allow using `ping`.
@y
Add `net.ipv4.ping_group_range = 0   2147483647` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system` to allow using `ping`.
@z

@x
### Exposing privileged ports
@y
### Exposing privileged ports
@z

@x
To expose privileged ports (< 1024), set `CAP_NET_BIND_SERVICE` on `rootlesskit` binary and restart the daemon.
@y
To expose privileged ports (< 1024), set `CAP_NET_BIND_SERVICE` on `rootlesskit` binary and restart the daemon.
@z

% snip command...

@x
Or add `net.ipv4.ip_unprivileged_port_start=0` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
Or add `net.ipv4.ip_unprivileged_port_start=0` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
### Limiting resources
@y
### Limiting resources
@z

@x
Limiting resources with cgroup-related `docker run` flags such as `--cpus`, `--memory`, `--pids-limit`
is supported only when running with cgroup v2 and systemd.
See [Changing cgroup version](/manuals/engine/containers/runmetrics.md) to enable cgroup v2.
@y
Limiting resources with cgroup-related `docker run` flags such as `--cpus`, `--memory`, `--pids-limit`
is supported only when running with cgroup v2 and systemd.
See [Changing cgroup version](manuals/engine/containers/runmetrics.md) to enable cgroup v2.
@z

@x
If `docker info` shows `none` as `Cgroup Driver`, the conditions are not satisfied.
When these conditions are not satisfied, rootless mode ignores the cgroup-related `docker run` flags.
See [Limiting resources without cgroup](#limiting-resources-without-cgroup) for workarounds.
@y
If `docker info` shows `none` as `Cgroup Driver`, the conditions are not satisfied.
When these conditions are not satisfied, rootless mode ignores the cgroup-related `docker run` flags.
See [Limiting resources without cgroup](#limiting-resources-without-cgroup) for workarounds.
@z

@x
If `docker info` shows `systemd` as `Cgroup Driver`, the conditions are satisfied.
However, typically, only `memory` and `pids` controllers are delegated to non-root users by default.
@y
If `docker info` shows `systemd` as `Cgroup Driver`, the conditions are satisfied.
However, typically, only `memory` and `pids` controllers are delegated to non-root users by default.
@z

% snip command...

@x
To allow delegation of all controllers, you need to change the systemd configuration as follows:
@y
To allow delegation of all controllers, you need to change the systemd configuration as follows:
@z

% snip command...

@x
> [!NOTE]
>
> Delegating `cpuset` requires systemd 244 or later.
@y
> [!NOTE]
>
> Delegating `cpuset` requires systemd 244 or later.
@z

@x
#### Limiting resources without cgroup
@y
#### Limiting resources without cgroup
@z

@x
Even when cgroup is not available, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
@y
Even when cgroup is not available, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
@z

@x
For example:
@y
For example:
@z

@x
- To limit CPU usage to 0.5 cores (similar to `docker run --cpus 0.5`):
  `docker run <IMAGE> cpulimit --limit=50 --include-children <COMMAND>`
- To limit max VSZ to 64MiB (similar to `docker run --memory 64m`):
  `docker run <IMAGE> sh -c "ulimit -v 65536; <COMMAND>"`
@y
- To limit CPU usage to 0.5 cores (similar to `docker run --cpus 0.5`):
  `docker run <IMAGE> cpulimit --limit=50 --include-children <COMMAND>`
- To limit max VSZ to 64MiB (similar to `docker run --memory 64m`):
  `docker run <IMAGE> sh -c "ulimit -v 65536; <COMMAND>"`
@z

@x
- To limit max number of processes to 100 per namespaced UID 2000
  (similar to `docker run --pids-limit=100`):
  `docker run --user 2000 --ulimit nproc=100 <IMAGE> <COMMAND>`
@y
- To limit max number of processes to 100 per namespaced UID 2000
  (similar to `docker run --pids-limit=100`):
  `docker run --user 2000 --ulimit nproc=100 <IMAGE> <COMMAND>`
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Errors when starting the Docker daemon
@y
### Errors when starting the Docker daemon
@z

@x
**\[rootlesskit:parent\] error: failed to start the child: fork/exec /proc/self/exe: operation not permitted**
@y
**\[rootlesskit:parent\] error: failed to start the child: fork/exec /proc/self/exe: operation not permitted**
@z

@x
This error occurs mostly when the value of `/proc/sys/kernel/unprivileged_userns_clone` is set to 0:
@y
This error occurs mostly when the value of `/proc/sys/kernel/unprivileged_userns_clone` is set to 0:
@z

% snip command...

@x
To fix this issue, add  `kernel.unprivileged_userns_clone=1` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
To fix this issue, add  `kernel.unprivileged_userns_clone=1` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
**\[rootlesskit:parent\] error: failed to start the child: fork/exec /proc/self/exe: no space left on device**
@y
**\[rootlesskit:parent\] error: failed to start the child: fork/exec /proc/self/exe: no space left on device**
@z

@x
This error occurs mostly when the value of `/proc/sys/user/max_user_namespaces` is too small:
@y
This error occurs mostly when the value of `/proc/sys/user/max_user_namespaces` is too small:
@z

% snip command...

@x
To fix this issue, add  `user.max_user_namespaces=28633` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
To fix this issue, add  `user.max_user_namespaces=28633` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
**\[rootlesskit:parent\] error: failed to setup UID/GID map: failed to compute uid/gid map: No subuid ranges found for user 1001 ("testuser")**
@y
**\[rootlesskit:parent\] error: failed to setup UID/GID map: failed to compute uid/gid map: No subuid ranges found for user 1001 ("testuser")**
@z

@x
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](#prerequisites).
@y
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](#prerequisites).
@z

@x
**could not get XDG_RUNTIME_DIR**
@y
**could not get XDG_RUNTIME_DIR**
@z

@x
This error occurs when `$XDG_RUNTIME_DIR` is not set.
@y
This error occurs when `$XDG_RUNTIME_DIR` is not set.
@z

@x
On a non-systemd host, you need to create a directory and then set the path:
@y
On a non-systemd host, you need to create a directory and then set the path:
@z

% snip command...

@x
> [!NOTE]
>
> You must remove the directory every time you log out.
@y
> [!NOTE]
>
> You must remove the directory every time you log out.
@z

@x
On a systemd host, log into the host using `pam_systemd` (see below).
The value is automatically set to `/run/user/$UID` and cleaned up on every logout.
@y
On a systemd host, log into the host using `pam_systemd` (see below).
The value is automatically set to `/run/user/$UID` and cleaned up on every logout.
@z

@x
**`systemctl --user` fails with "Failed to connect to bus: No such file or directory"**
@y
**`systemctl --user` fails with "Failed to connect to bus: No such file or directory"**
@z

@x
This error occurs mostly when you switch from the root user to an non-root user with `sudo`:
@y
This error occurs mostly when you switch from the root user to an non-root user with `sudo`:
@z

% snip command...

@x
Instead of `sudo -iu <USERNAME>`, you need to log in using `pam_systemd`. For example:
@y
Instead of `sudo -iu <USERNAME>`, you need to log in using `pam_systemd`. For example:
@z

@x
- Log in through the graphic console
- `ssh <USERNAME>@localhost`
- `machinectl shell <USERNAME>@`
@y
- Log in through the graphic console
- `ssh <USERNAME>@localhost`
- `machinectl shell <USERNAME>@`
@z

@x
**The daemon does not start up automatically**
@y
**The daemon does not start up automatically**
@z

@x
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Usage](#usage).
@y
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Usage](#usage).
@z

@x
**iptables failed: iptables -t nat -N DOCKER: Fatal: can't open lock file /run/xtables.lock: Permission denied**
@y
**iptables failed: iptables -t nat -N DOCKER: Fatal: can't open lock file /run/xtables.lock: Permission denied**
@z

@x
This error may happen with an older version of Docker when SELinux is enabled on the host.
@y
This error may happen with an older version of Docker when SELinux is enabled on the host.
@z

@x
The issue has been fixed in Docker 20.10.8.
A known workaround for older version of Docker is to run the following commands to disable SELinux for `iptables`:
@y
The issue has been fixed in Docker 20.10.8.
A known workaround for older version of Docker is to run the following commands to disable SELinux for `iptables`:
@z

% snip command...

@x
### `docker pull` errors
@y
### `docker pull` errors
@z

@x
**docker: failed to register layer: Error processing tar file(exit status 1): lchown &lt;FILE&gt;: invalid argument**
@y
**docker: failed to register layer: Error processing tar file(exit status 1): lchown &lt;FILE&gt;: invalid argument**
@z

@x
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](#prerequisites).
@y
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](#prerequisites).
@z

@x
**docker: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown &lt;FILE&gt;: operation not permitted**
@y
**docker: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown &lt;FILE&gt;: operation not permitted**
@z

@x
This error occurs mostly when `~/.local/share/docker` is located on NFS.
@y
This error occurs mostly when `~/.local/share/docker` is located on NFS.
@z

@x
A workaround is to specify non-NFS `data-root` directory in `~/.config/docker/daemon.json` as follows:
@y
A workaround is to specify non-NFS `data-root` directory in `~/.config/docker/daemon.json` as follows:
@z

% snip code...

@x
### `docker run` errors
@y
### `docker run` errors
@z

@x
**docker: Error response from daemon: OCI runtime create failed: ...: read unix @-&gt;/run/systemd/private: read: connection reset by peer: unknown.**
@y
**docker: Error response from daemon: OCI runtime create failed: ...: read unix @-&gt;/run/systemd/private: read: connection reset by peer: unknown.**
@z

@x
This error occurs on cgroup v2 hosts mostly when the dbus daemon is not running for the user.
@y
This error occurs on cgroup v2 hosts mostly when the dbus daemon is not running for the user.
@z

% snip command...

@x
To fix the issue, run `sudo apt-get install -y dbus-user-session` or `sudo dnf install -y dbus-daemon`, and then relogin.
@y
To fix the issue, run `sudo apt-get install -y dbus-user-session` or `sudo dnf install -y dbus-daemon`, and then relogin.
@z

@x
If the error still occurs, try running `systemctl --user enable --now dbus` (without sudo).
@y
If the error still occurs, try running `systemctl --user enable --now dbus` (without sudo).
@z

@x
**`--cpus`, `--memory`, and `--pids-limit` are ignored**
@y
**`--cpus`, `--memory`, and `--pids-limit` are ignored**
@z

@x
This is an expected behavior on cgroup v1 mode.
To use these flags, the host needs to be configured for enabling cgroup v2.
For more information, see [Limiting resources](#limiting-resources).
@y
This is an expected behavior on cgroup v1 mode.
To use these flags, the host needs to be configured for enabling cgroup v2.
For more information, see [Limiting resources](#limiting-resources).
@z

@x
### Networking errors
@y
### Networking errors
@z

@x
This section provides troubleshooting tips for networking in rootless mode.
@y
This section provides troubleshooting tips for networking in rootless mode.
@z

@x
Networking in rootless mode is supported via network and port drivers in
RootlessKit. Network performance and characteristics depend on the combination
of network and port driver you use. If you're experiencing unexpected behavior
or performance related to networking, review the following table which shows
the configurations supported by RootlessKit, and how they compare:
@y
Networking in rootless mode is supported via network and port drivers in
RootlessKit. Network performance and characteristics depend on the combination
of network and port driver you use. If you're experiencing unexpected behavior
or performance related to networking, review the following table which shows
the configurations supported by RootlessKit, and how they compare:
@z

@x
| Network driver | Port driver    | Net throughput | Port throughput | Source IP propagation | No SUID | Note                                                                         |
| -------------- | -------------- | -------------- | --------------- | --------------------- | ------- | ---------------------------------------------------------------------------- |
| `slirp4netns`  | `builtin`      | Slow           | Fast ✅         | ❌                    | ✅      | Default in a typical setup                                                   |
| `vpnkit`       | `builtin`      | Slow           | Fast ✅         | ❌                    | ✅      | Default when `slirp4netns` isn't installed                                   |
| `slirp4netns`  | `slirp4netns`  | Slow           | Slow            | ✅                    | ✅      |                                                                              |
| `pasta`        | `implicit`     | Slow           | Fast ✅         | ✅                    | ✅      | Experimental; Needs pasta version 2023_12_04 or later                        |
| `lxc-user-nic` | `builtin`      | Fast ✅        | Fast ✅         | ❌                    | ❌      | Experimental                                                                 |
| `bypass4netns` | `bypass4netns` | Fast ✅        | Fast ✅         | ✅                    | ✅      | **Note:** Not integrated to RootlessKit as it needs a custom seccomp profile |
@y
| Network driver | Port driver    | Net throughput | Port throughput | Source IP propagation | No SUID | Note                                                                         |
| -------------- | -------------- | -------------- | --------------- | --------------------- | ------- | ---------------------------------------------------------------------------- |
| `slirp4netns`  | `builtin`      | Slow           | Fast ✅         | ❌                    | ✅      | Default in a typical setup                                                   |
| `vpnkit`       | `builtin`      | Slow           | Fast ✅         | ❌                    | ✅      | Default when `slirp4netns` isn't installed                                   |
| `slirp4netns`  | `slirp4netns`  | Slow           | Slow            | ✅                    | ✅      |                                                                              |
| `pasta`        | `implicit`     | Slow           | Fast ✅         | ✅                    | ✅      | Experimental; Needs pasta version 2023_12_04 or later                        |
| `lxc-user-nic` | `builtin`      | Fast ✅        | Fast ✅         | ❌                    | ❌      | Experimental                                                                 |
| `bypass4netns` | `bypass4netns` | Fast ✅        | Fast ✅         | ✅                    | ✅      | **Note:** Not integrated to RootlessKit as it needs a custom seccomp profile |
@z

@x
For information about troubleshooting specific networking issues, see:
@y
For information about troubleshooting specific networking issues, see:
@z

@x
- [`docker run -p` fails with `cannot expose privileged port`](#docker-run--p-fails-with-cannot-expose-privileged-port)
- [Ping doesn't work](#ping-doesnt-work)
- [`IPAddress` shown in `docker inspect` is unreachable](#ipaddress-shown-in-docker-inspect-is-unreachable)
- [`--net=host` doesn't listen ports on the host network namespace](#--nethost-doesnt-listen-ports-on-the-host-network-namespace)
- [Network is slow](#network-is-slow)
- [`docker run -p` does not propagate source IP addresses](#docker-run--p-does-not-propagate-source-ip-addresses)
@y
- [`docker run -p` fails with `cannot expose privileged port`](#docker-run--p-fails-with-cannot-expose-privileged-port)
- [Ping doesn't work](#ping-doesnt-work)
- [`IPAddress` shown in `docker inspect` is unreachable](#ipaddress-shown-in-docker-inspect-is-unreachable)
- [`--net=host` doesn't listen ports on the host network namespace](#--nethost-doesnt-listen-ports-on-the-host-network-namespace)
- [Network is slow](#network-is-slow)
- [`docker run -p` does not propagate source IP addresses](#docker-run--p-does-not-propagate-source-ip-addresses)
@z

@x
#### `docker run -p` fails with `cannot expose privileged port`
@y
#### `docker run -p` fails with `cannot expose privileged port`
@z

@x
`docker run -p` fails with this error when a privileged port (< 1024) is specified as the host port.
@y
`docker run -p` fails with this error when a privileged port (< 1024) is specified as the host port.
@z

% snip command...

@x
When you experience this error, consider using an unprivileged port instead. For example, 8080 instead of 80.
@y
When you experience this error, consider using an unprivileged port instead. For example, 8080 instead of 80.
@z

% snip command...

@x
To allow exposing privileged ports, see [Exposing privileged ports](#exposing-privileged-ports).
@y
To allow exposing privileged ports, see [Exposing privileged ports](#exposing-privileged-ports).
@z

@x
#### Ping doesn't work
@y
#### Ping doesn't work
@z

@x
Ping does not work when `/proc/sys/net/ipv4/ping_group_range` is set to `1 0`:
@y
Ping does not work when `/proc/sys/net/ipv4/ping_group_range` is set to `1 0`:
@z

% snip command...

@x
For details, see [Routing ping packets](#routing-ping-packets).
@y
For details, see [Routing ping packets](#routing-ping-packets).
@z

@x
#### `IPAddress` shown in `docker inspect` is unreachable
@y
#### `IPAddress` shown in `docker inspect` is unreachable
@z

@x
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@y
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@z

@x
#### `--net=host` doesn't listen ports on the host network namespace
@y
#### `--net=host` doesn't listen ports on the host network namespace
@z

@x
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@y
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@z

@x
#### Network is slow
@y
#### Network is slow
@z

@x
Docker with rootless mode uses [slirp4netns](https://github.com/rootless-containers/slirp4netns) as the default network stack if slirp4netns v0.4.0 or later is installed.
If slirp4netns is not installed, Docker falls back to [VPNKit](https://github.com/moby/vpnkit).
Installing slirp4netns may improve the network throughput.
@y
Docker with rootless mode uses [slirp4netns](https://github.com/rootless-containers/slirp4netns) as the default network stack if slirp4netns v0.4.0 or later is installed.
If slirp4netns is not installed, Docker falls back to [VPNKit](https://github.com/moby/vpnkit).
Installing slirp4netns may improve the network throughput.
@z

@x
For more information about network drivers for RootlessKit, see
[RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/blob/v2.0.0/docs/network.md).
@y
For more information about network drivers for RootlessKit, see
[RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/blob/v2.0.0/docs/network.md).
@z

@x
Also, changing MTU value may improve the throughput.
The MTU value can be specified by creating `~/.config/systemd/user/docker.service.d/override.conf` with the following content:
@y
Also, changing MTU value may improve the throughput.
The MTU value can be specified by creating `~/.config/systemd/user/docker.service.d/override.conf` with the following content:
@z

% snip code...

@x
And then restart the daemon:
@y
And then restart the daemon:
@z

% snip command...

@x
#### `docker run -p` does not propagate source IP addresses
@y
#### `docker run -p` does not propagate source IP addresses
@z

@x
This is because Docker in rootless mode uses RootlessKit's `builtin` port
driver by default, which doesn't support source IP propagation. To enable
source IP propagation, you can:
@y
This is because Docker in rootless mode uses RootlessKit's `builtin` port
driver by default, which doesn't support source IP propagation. To enable
source IP propagation, you can:
@z

@x
- Use the `slirp4netns` RootlessKit port driver
- Use the `pasta` RootlessKit network driver, with the `implicit` port driver
@y
- Use the `slirp4netns` RootlessKit port driver
- Use the `pasta` RootlessKit network driver, with the `implicit` port driver
@z

@x
The `pasta` network driver is experimental, but provides improved throughput
performance compared to the `slirp4netns` port driver. The `pasta` driver
requires Docker Engine version 25.0 or later.
@y
The `pasta` network driver is experimental, but provides improved throughput
performance compared to the `slirp4netns` port driver. The `pasta` driver
requires Docker Engine version 25.0 or later.
@z

@x
To change the RootlessKit networking configuration:
@y
To change the RootlessKit networking configuration:
@z

@x
1. Create a file at `~/.config/systemd/user/docker.service.d/override.conf`.
2. Add the following contents, depending on which configuration you would like to use:
@y
1. Create a file at `~/.config/systemd/user/docker.service.d/override.conf`.
2. Add the following contents, depending on which configuration you would like to use:
@z

@x
   - `slirp4netns`
@y
   - `slirp4netns`
@z

% snip code...

@x
   - `pasta` network driver with `implicit` port driver
@y
   - `pasta` network driver with `implicit` port driver
@z

% snip code...

@x
3. Restart the daemon:
@y
3. Restart the daemon:
@z

% snip command...

@x
For more information about networking options for RootlessKit, see:
@y
For more information about networking options for RootlessKit, see:
@z

@x
- [Network drivers](https://github.com/rootless-containers/rootlesskit/blob/v2.0.0/docs/network.md)
- [Port drivers](https://github.com/rootless-containers/rootlesskit/blob/v2.0.0/docs/port.md)
@y
- [Network drivers](https://github.com/rootless-containers/rootlesskit/blob/v2.0.0/docs/network.md)
- [Port drivers](https://github.com/rootless-containers/rootlesskit/blob/v2.0.0/docs/port.md)
@z

@x
### Tips for debugging
@y
### Tips for debugging
@z

@x
**Entering into `dockerd` namespaces**
@y
**Entering into `dockerd` namespaces**
@z

@x
The `dockerd-rootless.sh` script executes `dockerd` in its own user, mount, and network namespaces.
@y
The `dockerd-rootless.sh` script executes `dockerd` in its own user, mount, and network namespaces.
@z

@x
For debugging, you can enter the namespaces by running
`nsenter -U --preserve-credentials -n -m -t $(cat $XDG_RUNTIME_DIR/docker.pid)`.
@y
For debugging, you can enter the namespaces by running
`nsenter -U --preserve-credentials -n -m -t $(cat $XDG_RUNTIME_DIR/docker.pid)`.
@z
