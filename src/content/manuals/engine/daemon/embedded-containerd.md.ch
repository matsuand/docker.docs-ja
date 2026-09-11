%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run containerd in the Docker daemon
linkTitle: Embedded containerd
description: Configure Docker Engine to run an experimental containerd server in the Docker daemon process
keywords: docker, daemon, dockerd, containerd, configuration, experimental
@y
title: Run containerd in the Docker daemon
linkTitle: Embedded containerd
description: Configure Docker Engine to run an experimental containerd server in the Docker daemon process
keywords: docker, daemon, dockerd, containerd, configuration, experimental
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
Starting with Docker Engine 29.7.0, the Docker daemon can run containerd in
the same process as `dockerd`. By default, the daemon starts and manages
containerd as a separate process.
@y
Starting with Docker Engine 29.7.0, the Docker daemon can run containerd in
the same process as `dockerd`. By default, the daemon starts and manages
containerd as a separate process.
@z

@x
> [!CAUTION]
>
> Embedded containerd is an experimental feature. Its behavior may change, or
> the feature may be removed from a future release.
@y
> [!CAUTION]
>
> Embedded containerd is an experimental feature. Its behavior may change, or
> the feature may be removed from a future release.
@z

@x
Embedded mode changes how the daemon starts and communicates with containerd.
The embedded server still listens on a containerd socket, but the daemon and
BuildKit reach it over an in-memory connection instead. Task shims continue to
run as separate processes and connect over a socket.
@y
Embedded mode changes how the daemon starts and communicates with containerd.
The embedded server still listens on a containerd socket, but the daemon and
BuildKit reach it over an in-memory connection instead. Task shims continue to
run as separate processes and connect over a socket.
@z

@x
The performance benefit is greatest when Docker uses the containerd image
store.
Any image interactions use containerd's content API for both metadata requests
and the bytes that make up image manifests, configurations, and layers.
A separate containerd process splits these reads and writes into gRPC messages
that cross a Unix socket or named pipe.
Embedded mode sends the same messages over an in-memory connection, avoiding
operating system socket calls and kernel transport for this data-heavy path.
@y
The performance benefit is greatest when Docker uses the containerd image
store.
Any image interactions use containerd's content API for both metadata requests
and the bytes that make up image manifests, configurations, and layers.
A separate containerd process splits these reads and writes into gRPC messages
that cross a Unix socket or named pipe.
Embedded mode sends the same messages over an in-memory connection, avoiding
operating system socket calls and kernel transport for this data-heavy path.
@z

@x
The embedded server doesn't include the container runtime interface (CRI).
You can't enable `embedded-containerd` and `cri-containerd` at the same time.
@y
The embedded server doesn't include the container runtime interface (CRI).
You can't enable `embedded-containerd` and `cri-containerd` at the same time.
@z

@x
## Enable embedded containerd
@y
## Enable embedded containerd
@z

@x
Add the `embedded-containerd` feature to the
[daemon configuration file](./_index.md#configuration-file):
@y
Add the `embedded-containerd` feature to the
[daemon configuration file](./_index.md#configuration-file):
@z

@x
```json
{
  "features": {
    "embedded-containerd": true
  }
}
```
@y
```json
{
  "features": {
    "embedded-containerd": true
  }
}
```
@z

@x
Restart the Docker daemon:
@y
Restart the Docker daemon:
@z

@x
```console
$ sudo systemctl restart docker
```
@y
```console
$ sudo systemctl restart docker
```
@z

@x
The `embedded-containerd` feature takes precedence over a containerd address
set with the `--containerd` daemon flag. This behavior means that packaged
service configurations that set a containerd address don't prevent embedded
containerd from starting.
@y
The `embedded-containerd` feature takes precedence over a containerd address
set with the `--containerd` daemon flag. This behavior means that packaged
service configurations that set a containerd address don't prevent embedded
containerd from starting.
@z

@x
> [!IMPORTANT]
>
> Embedded containerd keeps its state under the Docker data root, in
> `/var/lib/docker/containerd/daemon` by default. A containerd installed on the
> host keeps its own state elsewhere, such as `/var/lib/containerd`. If the
> daemon used such a containerd before, the containers and images stored there
> aren't available in embedded mode.
@y
> [!IMPORTANT]
>
> Embedded containerd keeps its state under the Docker data root, in
> `/var/lib/docker/containerd/daemon` by default. A containerd installed on the
> host keeps its own state elsewhere, such as `/var/lib/containerd`. If the
> daemon used such a containerd before, the containers and images stored there
> aren't available in embedded mode.
@z

@x
You can also enable the feature when starting `dockerd` manually:
@y
You can also enable the feature when starting `dockerd` manually:
@z

@x
```console
$ sudo dockerd --feature embedded-containerd
```
@y
```console
$ sudo dockerd --feature embedded-containerd
```
@z

@x
## Verify the configuration
@y
## Verify the configuration
@z

@x
Run `docker info` and check for the experimental mode warning:
@y
Run `docker info` and check for the experimental mode warning:
@z

@x
```console
$ docker info
...
NOTE: Running with experimental embedded-containerd mode. In a future release,
this mode may be used by default when no system containerd is available, rather
than starting and supervising a separate containerd process. The option used to
enable this mode may also change.
```
@y
```console
$ docker info
...
NOTE: Running with experimental embedded-containerd mode. In a future release,
this mode may be used by default when no system containerd is available, rather
than starting and supervising a separate containerd process. The option used to
enable this mode may also change.
```
@z

@x
## Connect directly to embedded containerd
@y
## Connect directly to embedded containerd
@z

@x
The embedded server provides an endpoint for containerd clients such as
`ctr` and `nerdctl`. On Linux, the endpoint is
`<exec-root>/containerd/containerd.sock`. With the default daemon
configuration, this path is:
@y
The embedded server provides an endpoint for containerd clients such as
`ctr` and `nerdctl`. On Linux, the endpoint is
`<exec-root>/containerd/containerd.sock`. With the default daemon
configuration, this path is:
@z

@x
```text
/var/run/docker/containerd/containerd.sock
```
@y
```text
/var/run/docker/containerd/containerd.sock
```
@z

@x
On Windows, the server uses a named pipe by default. Check the Docker daemon startup logs
for the endpoint address.
@y
On Windows, the server uses a named pipe by default. Check the Docker daemon startup logs
for the endpoint address.
@z

@x
Docker Engine stores containers in the `moby` containerd namespace by
default. For example, use `ctr` on Linux to list them:
@y
Docker Engine stores containers in the `moby` containerd namespace by
default. For example, use `ctr` on Linux to list them:
@z

@x
```console
$ sudo ctr --address /var/run/docker/containerd/containerd.sock \
  --namespace moby containers list
```
@y
```console
$ sudo ctr --address /var/run/docker/containerd/containerd.sock \
  --namespace moby containers list
```
@z

@x
> [!WARNING]
>
> The endpoint is useful for debugging, but the daemon owns the state behind
> it. Don't treat it as a general-purpose containerd endpoint: its address and
> the layout of the namespaces can change, and changes that other clients make
> can conflict with the daemon.
@y
> [!WARNING]
>
> The endpoint is useful for debugging, but the daemon owns the state behind
> it. Don't treat it as a general-purpose containerd endpoint: its address and
> the layout of the namespaces can change, and changes that other clients make
> can conflict with the daemon.
@z
