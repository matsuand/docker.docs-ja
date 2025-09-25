%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Tips for the Rootless mode
keywords: security, namespaces, rootless
title: Tips
@y
description: Tips for the Rootless mode
keywords: security, namespaces, rootless
title: Tips
@z

@x
## Advanced usage
@y
## Advanced usage
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

@x
```console
$ systemctl --user start docker
```
@y
```console
$ systemctl --user start docker
```
@z

@x
To launch the daemon on system startup, enable the systemd service and lingering:
@y
To launch the daemon on system startup, enable the systemd service and lingering:
@z

@x
```console
$ systemctl --user enable docker
$ sudo loginctl enable-linger $(whoami)
```
@y
```console
$ systemctl --user enable docker
$ sudo loginctl enable-linger $(whoami)
```
@z

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
It's important to note that with directory paths:
@y
It's important to note that with directory paths:
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
Since Docker Engine v23.0, `dockerd-rootless-setuptool.sh install` automatically configures
the `docker` CLI to use the `rootless` context.
@y
Since Docker Engine v23.0, `dockerd-rootless-setuptool.sh install` automatically configures
the `docker` CLI to use the `rootless` context.
@z

@x
Prior to Docker Engine v23.0, a user had to specify either the socket path or the CLI context explicitly.
@y
Prior to Docker Engine v23.0, a user had to specify either the socket path or the CLI context explicitly.
@z

@x
To specify the socket path using `$DOCKER_HOST`:
@y
To specify the socket path using `$DOCKER_HOST`:
@z

@x
```console
$ export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
$ docker run -d -p 8080:80 nginx
```
@y
```console
$ export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
$ docker run -d -p 8080:80 nginx
```
@z

@x
To specify the CLI context using `docker context`:
@y
To specify the CLI context using `docker context`:
@z

@x
```console
$ docker context use rootless
rootless
Current context is now "rootless"
$ docker run -d -p 8080:80 nginx
```
@y
```console
$ docker context use rootless
rootless
Current context is now "rootless"
$ docker run -d -p 8080:80 nginx
```
@z

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

@x
```console
$ docker run -d --name dind-rootless --privileged docker:25.0-dind-rootless
```
@y
```console
$ docker run -d --name dind-rootless --privileged docker:25.0-dind-rootless
```
@z

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

@x
```console
$ DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  dockerd-rootless.sh \
  -H tcp://0.0.0.0:2376 \
  --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem
```
@y
```console
$ DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  dockerd-rootless.sh \
  -H tcp://0.0.0.0:2376 \
  --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem
```
@z

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

@x
```console
$ ssh -l <REMOTEUSER> <REMOTEHOST> 'echo $DOCKER_HOST'
unix:///run/user/1001/docker.sock
$ docker -H ssh://<REMOTEUSER>@<REMOTEHOST> run ...
```
@y
```console
$ ssh -l <REMOTEUSER> <REMOTEHOST> 'echo $DOCKER_HOST'
unix:///run/user/1001/docker.sock
$ docker -H ssh://<REMOTEUSER>@<REMOTEHOST> run ...
```
@z

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

@x
```console
$ sudo setcap cap_net_bind_service=ep $(which rootlesskit)
$ systemctl --user restart docker
```
@y
```console
$ sudo setcap cap_net_bind_service=ep $(which rootlesskit)
$ systemctl --user restart docker
```
@z

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

@x
```console
$ cat /sys/fs/cgroup/user.slice/user-$(id -u).slice/user@$(id -u).service/cgroup.controllers
memory pids
```
@y
```console
$ cat /sys/fs/cgroup/user.slice/user-$(id -u).slice/user@$(id -u).service/cgroup.controllers
memory pids
```
@z

@x
To allow delegation of all controllers, you need to change the systemd configuration as follows:
@y
To allow delegation of all controllers, you need to change the systemd configuration as follows:
@z

@x
```console
# mkdir -p /etc/systemd/system/user@.service.d
# cat > /etc/systemd/system/user@.service.d/delegate.conf << EOF
[Service]
Delegate=cpu cpuset io memory pids
EOF
# systemctl daemon-reload
```
@y
```console
# mkdir -p /etc/systemd/system/user@.service.d
# cat > /etc/systemd/system/user@.service.d/delegate.conf << EOF
[Service]
Delegate=cpu cpuset io memory pids
EOF
# systemctl daemon-reload
```
@z

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
