%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Troubleshooting the Rootless mode
keywords: security, namespaces, rootless, troubleshooting
title: Troubleshooting
@y
description: Troubleshooting the Rootless mode
keywords: security, namespaces, rootless, troubleshooting
title: Troubleshooting
@z

@x
### Distribution-specific hint
@y
### Distribution-specific hint
@z

@x
{{< tabs >}}
{{< tab name="Ubuntu" >}}
- Ubuntu 24.04 and later enables restricted unprivileged user namespaces by
  default, which prevents unprivileged processes in creating user namespaces
  unless an AppArmor profile is configured to allow programs to use
  unprivileged user namespaces.
@y
{{< tabs >}}
{{< tab name="Ubuntu" >}}
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
{{< tab name="Arch Linux" >}}
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
{{< /tab >}}
{{< tab name="openSUSE and SLES" >}}
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distributions as well depending on the configuration.
@y
{{< /tab >}}
{{< tab name="Arch Linux" >}}
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
{{< /tab >}}
{{< tab name="openSUSE and SLES" >}}
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distributions as well depending on the configuration.
@z

@x
- Known to work on openSUSE 15 and SLES 15.
{{< /tab >}}
{{< tab name="CentOS, RHEL, and Fedora" >}}
- For RHEL 8 and similar distributions, installing `fuse-overlayfs` is recommended. Run `sudo dnf install -y fuse-overlayfs`.
  This step is not required on RHEL 9 and similar distributions.
@y
- Known to work on openSUSE 15 and SLES 15.
{{< /tab >}}
{{< tab name="CentOS, RHEL, and Fedora" >}}
- For RHEL 8 and similar distributions, installing `fuse-overlayfs` is recommended. Run `sudo dnf install -y fuse-overlayfs`.
  This step is not required on RHEL 9 and similar distributions.
@z

@x
- You might need `sudo dnf install -y iptables`.
{{< /tab >}}
{{< /tabs >}}
@y
- You might need `sudo dnf install -y iptables`.
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
  - `overlay2` (only if running with kernel 5.11 or later)
  - `fuse-overlayfs` (only if running with kernel 4.18 or later, and `fuse-overlayfs` is installed)
  - `btrfs` (only if running with kernel 4.18 or later, or `~/.local/share/docker` is mounted with `user_subvol_rm_allowed` mount option)
  - `vfs`
- cgroup is supported only when running with cgroup v2 and systemd. See [Limiting resources](./tips.md#limiting-resources).
- Following features are not supported:
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](./tips.md#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](./tips.md#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
- NFS mounts as the docker "data-root" is not supported. This limitation is not specific to rootless mode.
@y
- Only the following storage drivers are supported:
  - `overlay2` (only if running with kernel 5.11 or later)
  - `fuse-overlayfs` (only if running with kernel 4.18 or later, and `fuse-overlayfs` is installed)
  - `btrfs` (only if running with kernel 4.18 or later, or `~/.local/share/docker` is mounted with `user_subvol_rm_allowed` mount option)
  - `vfs`
- cgroup is supported only when running with cgroup v2 and systemd. See [Limiting resources](./tips.md#limiting-resources).
- Following features are not supported:
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](./tips.md#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](./tips.md#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
- NFS mounts as the docker "data-root" is not supported. This limitation is not specific to rootless mode.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Unable to install with systemd when systemd is present on the system
@y
### Unable to install with systemd when systemd is present on the system
@z

% snip command...

@x
`rootlesskit` cannot detect systemd properly if you switch to your user via `sudo su`. For users which cannot be logged-in, you must use the `machinectl` command which is part of the `systemd-container` package. After installing `systemd-container` switch to `myuser` with the following command:
@y
`rootlesskit` cannot detect systemd properly if you switch to your user via `sudo su`. For users which cannot be logged-in, you must use the `machinectl` command which is part of the `systemd-container` package. After installing `systemd-container` switch to `myuser` with the following command:
@z

% snip command...

@x
Where `myuser@` is your desired username and @ signifies this machine.
@y
Where `myuser@` is your desired username and @ signifies this machine.
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
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](./_index.md#prerequisites).
@y
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](./_index.md#prerequisites).
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
This error occurs mostly when you switch from the root user to a non-root user with `sudo`:
@y
This error occurs mostly when you switch from the root user to a non-root user with `sudo`:
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
up automatically. See [Advanced Usage](./tips.md/#advanced-usage).
@y
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Advanced Usage](./tips.md/#advanced-usage).
@z

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
[Prerequisites](./_index.md#prerequisites).
@y
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](./_index.md#prerequisites).
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
For more information, see [Limiting resources](./tips.md#limiting-resources).
@y
This is an expected behavior on cgroup v1 mode.
To use these flags, the host needs to be configured for enabling cgroup v2.
For more information, see [Limiting resources](./tips.md#limiting-resources).
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
To allow exposing privileged ports, see [Exposing privileged ports](./tips.md#exposing-privileged-ports).
@y
To allow exposing privileged ports, see [Exposing privileged ports](./tips.md#exposing-privileged-ports).
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
For details, see [Routing ping packets](./tips.md#routing-ping-packets).
@y
For details, see [Routing ping packets](./tips.md#routing-ping-packets).
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
If you installed Docker with https://get.docker.com/rootless ([Install without packages](./_index.md#install)),
remove the binary files under `~/bin`:
@y
To remove the binaries, remove `docker-ce-rootless-extras` package if you installed Docker with package managers.
If you installed Docker with https://get.docker.com/rootless ([Install without packages](./_index.md#install)),
remove the binary files under `~/bin`:
@z

% snip command...
