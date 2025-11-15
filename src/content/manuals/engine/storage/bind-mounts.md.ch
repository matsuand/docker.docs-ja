%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Using bind mounts
title: Bind mounts
@y
description: Using bind mounts
title: Bind mounts
@z

@x
keywords: storage, persistence, data persistence, mounts, bind mounts
@y
keywords: storage, persistence, data persistence, mounts, bind mounts
@z

@x
When you use a bind mount, a file or directory on the host machine is mounted
from the host into a container. By contrast, when you use a volume, a new
directory is created within Docker's storage directory on the host machine, and
Docker manages that directory's contents.
@y
When you use a bind mount, a file or directory on the host machine is mounted
from the host into a container. By contrast, when you use a volume, a new
directory is created within Docker's storage directory on the host machine, and
Docker manages that directory's contents.
@z

@x
## When to use bind mounts
@y
## When to use bind mounts
@z

@x
Bind mounts are appropriate for the following types of use case:
@y
Bind mounts are appropriate for the following types of use case:
@z

@x
- Sharing source code or build artifacts between a development environment on
  the Docker host and a container.
@y
- Sharing source code or build artifacts between a development environment on
  the Docker host and a container.
@z

@x
- When you want to create or generate files in a container and persist the
  files onto the host's filesystem.
@y
- When you want to create or generate files in a container and persist the
  files onto the host's filesystem.
@z

@x
- Sharing configuration files from the host machine to containers. This is how
  Docker provides DNS resolution to containers by default, by mounting
  `/etc/resolv.conf` from the host machine into each container.
@y
- Sharing configuration files from the host machine to containers. This is how
  Docker provides DNS resolution to containers by default, by mounting
  `/etc/resolv.conf` from the host machine into each container.
@z

@x
Bind mounts are also available for builds: you can bind mount source code from
the host into the build container to test, lint, or compile a project.
@y
Bind mounts are also available for builds: you can bind mount source code from
the host into the build container to test, lint, or compile a project.
@z

@x
## Bind-mounting over existing data
@y
## Bind-mounting over existing data
@z

@x
If you bind mount file or directory into a directory in the container in which
files or directories exist, the pre-existing files are obscured by the mount.
This is similar to if you were to save files into `/mnt` on a Linux host, and
then mounted a USB drive into `/mnt`. The contents of `/mnt` would be obscured
by the contents of the USB drive until the USB drive was unmounted.
@y
If you bind mount file or directory into a directory in the container in which
files or directories exist, the pre-existing files are obscured by the mount.
This is similar to if you were to save files into `/mnt` on a Linux host, and
then mounted a USB drive into `/mnt`. The contents of `/mnt` would be obscured
by the contents of the USB drive until the USB drive was unmounted.
@z

@x
With containers, there's no straightforward way of removing a mount to reveal
the obscured files again. Your best option is to recreate the container without
the mount.
@y
With containers, there's no straightforward way of removing a mount to reveal
the obscured files again. Your best option is to recreate the container without
the mount.
@z

@x
## Considerations and constraints
@y
## Considerations and constraints
@z

@x
- Bind mounts have write access to files on the host by default.
@y
- Bind mounts have write access to files on the host by default.
@z

@x
  One side effect of using bind mounts is that you can change the host
  filesystem via processes running in a container, including creating,
  modifying, or deleting important system files or directories. This capability
  can have security implications. For example, it may affect non-Docker
  processes on the host system.
@y
  One side effect of using bind mounts is that you can change the host
  filesystem via processes running in a container, including creating,
  modifying, or deleting important system files or directories. This capability
  can have security implications. For example, it may affect non-Docker
  processes on the host system.
@z

@x
  You can use the `readonly` or `ro` option to prevent the container from
  writing to the mount.
@y
  You can use the `readonly` or `ro` option to prevent the container from
  writing to the mount.
@z

@x
- Bind mounts are created to the Docker daemon host, not the client.
@y
- Bind mounts are created to the Docker daemon host, not the client.
@z

@x
  If you're using a remote Docker daemon, you can't create a bind mount to
  access files on the client machine in a container.
@y
  If you're using a remote Docker daemon, you can't create a bind mount to
  access files on the client machine in a container.
@z

@x
  For Docker Desktop, the daemon runs inside a Linux VM, not directly on the
  native host. Docker Desktop has built-in mechanisms that transparently handle
  bind mounts, allowing you to share native host filesystem paths with
  containers running in the virtual machine.
@y
  For Docker Desktop, the daemon runs inside a Linux VM, not directly on the
  native host. Docker Desktop has built-in mechanisms that transparently handle
  bind mounts, allowing you to share native host filesystem paths with
  containers running in the virtual machine.
@z

@x
- Containers with bind mounts are strongly tied to the host.
@y
- Containers with bind mounts are strongly tied to the host.
@z

@x
  Bind mounts rely on the host machine's filesystem having a specific directory
  structure available. This reliance means that containers with bind mounts may
  fail if run on a different host without the same directory structure.
@y
  Bind mounts rely on the host machine's filesystem having a specific directory
  structure available. This reliance means that containers with bind mounts may
  fail if run on a different host without the same directory structure.
@z

@x
## Syntax
@y
## Syntax
@z

@x
To create a bind mount, you can use either the `--mount` or `--volume` flag.
@y
To create a bind mount, you can use either the `--mount` or `--volume` flag.
@z

@x
```console
$ docker run --mount type=bind,src=<host-path>,dst=<container-path>
$ docker run --volume <host-path>:<container-path>
```
@y
```console
$ docker run --mount type=bind,src=<host-path>,dst=<container-path>
$ docker run --volume <host-path>:<container-path>
```
@z

@x
In general, `--mount` is preferred. The main difference is that the `--mount`
flag is more explicit and supports all the available options.
@y
In general, `--mount` is preferred. The main difference is that the `--mount`
flag is more explicit and supports all the available options.
@z

@x
If you use `--volume` to bind-mount a file or directory that does not yet
exist on the Docker host, Docker automatically creates the directory on the
host for you. It's always created as a directory.
@y
If you use `--volume` to bind-mount a file or directory that does not yet
exist on the Docker host, Docker automatically creates the directory on the
host for you. It's always created as a directory.
@z

@x
`--mount` does not automatically create a directory if the specified mount
path does not exist on the host. Instead, it produces an error:
@y
`--mount` does not automatically create a directory if the specified mount
path does not exist on the host. Instead, it produces an error:
@z

@x
```console
$ docker run --mount type=bind,src=/dev/noexist,dst=/mnt/foo alpine
docker: Error response from daemon: invalid mount config for type "bind": bind source path does not exist: /dev/noexist.
```
@y
```console
$ docker run --mount type=bind,src=/dev/noexist,dst=/mnt/foo alpine
docker: Error response from daemon: invalid mount config for type "bind": bind source path does not exist: /dev/noexist.
```
@z

@x
### Options for --mount
@y
### Options for --mount
@z

@x
The `--mount` flag consists of multiple key-value pairs, separated by commas
and each consisting of a `<key>=<value>` tuple. The order of the keys isn't
significant.
@y
The `--mount` flag consists of multiple key-value pairs, separated by commas
and each consisting of a `<key>=<value>` tuple. The order of the keys isn't
significant.
@z

@x
```console
$ docker run --mount type=bind,src=<host-path>,dst=<container-path>[,<key>=<value>...]
```
@y
```console
$ docker run --mount type=bind,src=<host-path>,dst=<container-path>[,<key>=<value>...]
```
@z

@x
Valid options for `--mount type=bind` include:
@y
Valid options for `--mount type=bind` include:
@z

@x
| Option                         | Description                                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `source`, `src`                | The location of the file or directory on the host. This can be an absolute or relative path.                    |
| `destination`, `dst`, `target` | The path where the file or directory is mounted in the container. Must be an absolute path.                     |
| `readonly`, `ro`               | If present, causes the bind mount to be [mounted into the container as read-only](#use-a-read-only-bind-mount). |
| `bind-propagation`             | If present, changes the [bind propagation](#configure-bind-propagation).                                        |
@y
| Option                         | Description                                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `source`, `src`                | The location of the file or directory on the host. This can be an absolute or relative path.                    |
| `destination`, `dst`, `target` | The path where the file or directory is mounted in the container. Must be an absolute path.                     |
| `readonly`, `ro`               | If present, causes the bind mount to be [mounted into the container as read-only](#use-a-read-only-bind-mount). |
| `bind-propagation`             | If present, changes the [bind propagation](#configure-bind-propagation).                                        |
@z

@x
```console {title="Example"}
$ docker run --mount type=bind,src=.,dst=/project,ro,bind-propagation=rshared
```
@y
```console {title="Example"}
$ docker run --mount type=bind,src=.,dst=/project,ro,bind-propagation=rshared
```
@z

@x
### Options for --volume
@y
### Options for --volume
@z

@x
The `--volume` or `-v` flag consists of three fields, separated by colon
characters (`:`). The fields must be in the correct order.
@y
The `--volume` or `-v` flag consists of three fields, separated by colon
characters (`:`). The fields must be in the correct order.
@z

@x
```console
$ docker run -v <host-path>:<container-path>[:opts]
```
@y
```console
$ docker run -v <host-path>:<container-path>[:opts]
```
@z

@x
The first field is the path on the host to bind mount into the container. The
second field is the path where the file or directory is mounted in the
container.
@y
The first field is the path on the host to bind mount into the container. The
second field is the path where the file or directory is mounted in the
container.
@z

@x
The third field is optional, and is a comma-separated list of options. Valid
options for `--volume` with a bind mount include:
@y
The third field is optional, and is a comma-separated list of options. Valid
options for `--volume` with a bind mount include:
@z

@x
| Option               | Description                                                                                                        |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `readonly`, `ro`     | If present, causes the bind mount to be [mounted into the container as read-only](#use-a-read-only-bind-mount).    |
| `z`, `Z`             | Configures SELinux labeling. See [Configure the SELinux label](#configure-the-selinux-label)                       |
| `rprivate` (default) | Sets bind propagation to `rprivate` for this mount. See [Configure bind propagation](#configure-bind-propagation). |
| `private`            | Sets bind propagation to `private` for this mount. See [Configure bind propagation](#configure-bind-propagation).  |
| `rshared`            | Sets bind propagation to `rshared` for this mount. See [Configure bind propagation](#configure-bind-propagation).  |
| `shared`             | Sets bind propagation to `shared` for this mount. See [Configure bind propagation](#configure-bind-propagation).   |
| `rslave`             | Sets bind propagation to `rslave` for this mount. See [Configure bind propagation](#configure-bind-propagation).   |
| `slave`              | Sets bind propagation to `slave` for this mount. See [Configure bind propagation](#configure-bind-propagation).    |
@y
| Option               | Description                                                                                                        |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `readonly`, `ro`     | If present, causes the bind mount to be [mounted into the container as read-only](#use-a-read-only-bind-mount).    |
| `z`, `Z`             | Configures SELinux labeling. See [Configure the SELinux label](#configure-the-selinux-label)                       |
| `rprivate` (default) | Sets bind propagation to `rprivate` for this mount. See [Configure bind propagation](#configure-bind-propagation). |
| `private`            | Sets bind propagation to `private` for this mount. See [Configure bind propagation](#configure-bind-propagation).  |
| `rshared`            | Sets bind propagation to `rshared` for this mount. See [Configure bind propagation](#configure-bind-propagation).  |
| `shared`             | Sets bind propagation to `shared` for this mount. See [Configure bind propagation](#configure-bind-propagation).   |
| `rslave`             | Sets bind propagation to `rslave` for this mount. See [Configure bind propagation](#configure-bind-propagation).   |
| `slave`              | Sets bind propagation to `slave` for this mount. See [Configure bind propagation](#configure-bind-propagation).    |
@z

@x
```console {title="Example"}
$ docker run -v .:/project:ro,rshared
```
@y
```console {title="Example"}
$ docker run -v .:/project:ro,rshared
```
@z

@x
## Start a container with a bind mount
@y
## Start a container with a bind mount
@z

@x
Consider a case where you have a directory `source` and that when you build the
source code, the artifacts are saved into another directory, `source/target/`.
You want the artifacts to be available to the container at `/app/`, and you
want the container to get access to a new build each time you build the source
on your development host. Use the following command to bind-mount the `target/`
directory into your container at `/app/`. Run the command from within the
`source` directory. The `$(pwd)` sub-command expands to the current working
directory on Linux or macOS hosts.
If you're on Windows, see also [Path conversions on Windows](/manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md).
@y
Consider a case where you have a directory `source` and that when you build the
source code, the artifacts are saved into another directory, `source/target/`.
You want the artifacts to be available to the container at `/app/`, and you
want the container to get access to a new build each time you build the source
on your development host. Use the following command to bind-mount the `target/`
directory into your container at `/app/`. Run the command from within the
`source` directory. The `$(pwd)` sub-command expands to the current working
directory on Linux or macOS hosts.
If you're on Windows, see also [Path conversions on Windows](manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md).
@z

@x
The following `--mount` and `-v` examples produce the same result. You can't
run them both unless you remove the `devtest` container after running the first
one.
@y
The following `--mount` and `-v` examples produce the same result. You can't
run them both unless you remove the `devtest` container after running the first
one.
@z

@x
{{< tabs >}}
{{< tab name="`--mount`" >}}
@y
{{< tabs >}}
{{< tab name="`--mount`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< tab name="`-v`" >}}
@y
{{< /tab >}}
{{< tab name="`-v`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
@y
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
@z

@x
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
],
```
@y
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
],
```
@z

@x
This shows that the mount is a `bind` mount, it shows the correct source and
destination, it shows that the mount is read-write, and that the propagation is
set to `rprivate`.
@y
This shows that the mount is a `bind` mount, it shows the correct source and
destination, it shows that the mount is read-write, and that the propagation is
set to `rprivate`.
@z

@x
Stop and remove the container:
@y
Stop and remove the container:
@z

@x
```console
$ docker container rm -fv devtest
```
@y
```console
$ docker container rm -fv devtest
```
@z

@x
### Mount into a non-empty directory on the container
@y
### Mount into a non-empty directory on the container
@z

@x
If you bind-mount a directory into a non-empty directory on the container, the
directory's existing contents are obscured by the bind mount. This can be
beneficial, such as when you want to test a new version of your application
without building a new image. However, it can also be surprising and this
behavior differs from that of [volumes](volumes.md).
@y
If you bind-mount a directory into a non-empty directory on the container, the
directory's existing contents are obscured by the bind mount. This can be
beneficial, such as when you want to test a new version of your application
without building a new image. However, it can also be surprising and this
behavior differs from that of [volumes](volumes.md).
@z

@x
This example is contrived to be extreme, but replaces the contents of the
container's `/usr/` directory with the `/tmp/` directory on the host machine. In
most cases, this would result in a non-functioning container.
@y
This example is contrived to be extreme, but replaces the contents of the
container's `/usr/` directory with the `/tmp/` directory on the host machine. In
most cases, this would result in a non-functioning container.
@z

@x
The `--mount` and `-v` examples have the same end result.
@y
The `--mount` and `-v` examples have the same end result.
@z

@x
{{< tabs >}}
{{< tab name="`--mount`" >}}
@y
{{< tabs >}}
{{< tab name="`--mount`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name broken-container \
  --mount type=bind,source=/tmp,target=/usr \
  nginx:latest
@y
```console
$ docker run -d \
  -it \
  --name broken-container \
  --mount type=bind,source=/tmp,target=/usr \
  nginx:latest
@z

@x
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@y
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@z

@x
{{< /tab >}}
{{< tab name="`-v`" >}}
@y
{{< /tab >}}
{{< tab name="`-v`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name broken-container \
  -v /tmp:/usr \
  nginx:latest
@y
```console
$ docker run -d \
  -it \
  --name broken-container \
  -v /tmp:/usr \
  nginx:latest
@z

@x
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@y
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The container is created but does not start. Remove it:
@y
The container is created but does not start. Remove it:
@z

@x
```console
$ docker container rm broken-container
```
@y
```console
$ docker container rm broken-container
```
@z

@x
## Use a read-only bind mount
@y
## Use a read-only bind mount
@z

@x
For some development applications, the container needs to
write into the bind mount, so changes are propagated back to the
Docker host. At other times, the container only needs read access.
@y
For some development applications, the container needs to
write into the bind mount, so changes are propagated back to the
Docker host. At other times, the container only needs read access.
@z

@x
This example modifies the previous one, but mounts the directory as a read-only
bind mount, by adding `ro` to the (empty by default) list of options, after the
mount point within the container. Where multiple options are present, separate
them by commas.
@y
This example modifies the previous one, but mounts the directory as a read-only
bind mount, by adding `ro` to the (empty by default) list of options, after the
mount point within the container. Where multiple options are present, separate
them by commas.
@z

@x
The `--mount` and `-v` examples have the same result.
@y
The `--mount` and `-v` examples have the same result.
@z

@x
{{< tabs >}}
{{< tab name="`--mount`" >}}
@y
{{< tabs >}}
{{< tab name="`--mount`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app,readonly \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app,readonly \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< tab name="`-v`" >}}
@y
{{< /tab >}}
{{< tab name="`-v`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:ro \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:ro \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
@y
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
@z

@x
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "ro",
        "RW": false,
        "Propagation": "rprivate"
    }
],
```
@y
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "ro",
        "RW": false,
        "Propagation": "rprivate"
    }
],
```
@z

@x
Stop and remove the container:
@y
Stop and remove the container:
@z

@x
```console
$ docker container rm -fv devtest
```
@y
```console
$ docker container rm -fv devtest
```
@z

@x
## Recursive mounts
@y
## Recursive mounts
@z

@x
When you bind mount a path that itself contains mounts, those submounts are
also included in the bind mount by default. This behavior is configurable,
using the `bind-recursive` option for `--mount`. This option is only supported
with the `--mount` flag, not with `-v` or `--volume`.
@y
When you bind mount a path that itself contains mounts, those submounts are
also included in the bind mount by default. This behavior is configurable,
using the `bind-recursive` option for `--mount`. This option is only supported
with the `--mount` flag, not with `-v` or `--volume`.
@z

@x
If the bind mount is read-only, the Docker Engine makes a best-effort attempt
at making the submounts read-only as well. This is referred to as recursive
read-only mounts. Recursive read-only mounts require Linux kernel version 5.12
or later. If you're running an older kernel version, submounts are
automatically mounted as read-write by default. Attempting to set submounts to
be read-only on a kernel version earlier than 5.12, using the
`bind-recursive=readonly` option, results in an error.
@y
If the bind mount is read-only, the Docker Engine makes a best-effort attempt
at making the submounts read-only as well. This is referred to as recursive
read-only mounts. Recursive read-only mounts require Linux kernel version 5.12
or later. If you're running an older kernel version, submounts are
automatically mounted as read-write by default. Attempting to set submounts to
be read-only on a kernel version earlier than 5.12, using the
`bind-recursive=readonly` option, results in an error.
@z

@x
Supported values for the `bind-recursive` option are:
@y
Supported values for the `bind-recursive` option are:
@z

@x
| Value               | Description                                                                                                       |
| :------------------ | :---------------------------------------------------------------------------------------------------------------- |
| `enabled` (default) | Read-only mounts are made recursively read-only if kernel is v5.12 or later. Otherwise, submounts are read-write. |
| `disabled`          | Submounts are ignored (not included in the bind mount).                                                           |
| `writable`          | Submounts are read-write.                                                                                         |
| `readonly`          | Submounts are read-only. Requires kernel v5.12 or later.                                                          |
@y
| Value               | Description                                                                                                       |
| :------------------ | :---------------------------------------------------------------------------------------------------------------- |
| `enabled` (default) | Read-only mounts are made recursively read-only if kernel is v5.12 or later. Otherwise, submounts are read-write. |
| `disabled`          | Submounts are ignored (not included in the bind mount).                                                           |
| `writable`          | Submounts are read-write.                                                                                         |
| `readonly`          | Submounts are read-only. Requires kernel v5.12 or later.                                                          |
@z

@x
## Configure bind propagation
@y
## Configure bind propagation
@z

@x
Bind propagation defaults to `rprivate` for both bind mounts and volumes. It is
only configurable for bind mounts, and only on Linux host machines. Bind
propagation is an advanced topic and many users never need to configure it.
@y
Bind propagation defaults to `rprivate` for both bind mounts and volumes. It is
only configurable for bind mounts, and only on Linux host machines. Bind
propagation is an advanced topic and many users never need to configure it.
@z

@x
Bind propagation refers to whether or not mounts created within a given
bind-mount can be propagated to replicas of that mount. Consider
a mount point `/mnt`, which is also mounted on `/tmp`. The propagation settings
control whether a mount on `/tmp/a` would also be available on `/mnt/a`. Each
propagation setting has a recursive counterpoint. In the case of recursion,
consider that `/tmp/a` is also mounted as `/foo`. The propagation settings
control whether `/mnt/a` and/or `/tmp/a` would exist.
@y
Bind propagation refers to whether or not mounts created within a given
bind-mount can be propagated to replicas of that mount. Consider
a mount point `/mnt`, which is also mounted on `/tmp`. The propagation settings
control whether a mount on `/tmp/a` would also be available on `/mnt/a`. Each
propagation setting has a recursive counterpoint. In the case of recursion,
consider that `/tmp/a` is also mounted as `/foo`. The propagation settings
control whether `/mnt/a` and/or `/tmp/a` would exist.
@z

@x
> [!NOTE]
> Mount propagation doesn't work with Docker Desktop.
@y
> [!NOTE]
> Mount propagation doesn't work with Docker Desktop.
@z

@x
| Propagation setting | Description                                                                                                                                                                                                         |
| :------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `shared`            | Sub-mounts of the original mount are exposed to replica mounts, and sub-mounts of replica mounts are also propagated to the original mount.                                                                         |
| `slave`             | similar to a shared mount, but only in one direction. If the original mount exposes a sub-mount, the replica mount can see it. However, if the replica mount exposes a sub-mount, the original mount cannot see it. |
| `private`           | The mount is private. Sub-mounts within it are not exposed to replica mounts, and sub-mounts of replica mounts are not exposed to the original mount.                                                               |
| `rshared`           | The same as shared, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                            |
| `rslave`            | The same as slave, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                             |
| `rprivate`          | The default. The same as private, meaning that no mount points anywhere within the original or replica mount points propagate in either direction.                                                                  |
@y
| Propagation setting | Description                                                                                                                                                                                                         |
| :------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `shared`            | Sub-mounts of the original mount are exposed to replica mounts, and sub-mounts of replica mounts are also propagated to the original mount.                                                                         |
| `slave`             | similar to a shared mount, but only in one direction. If the original mount exposes a sub-mount, the replica mount can see it. However, if the replica mount exposes a sub-mount, the original mount cannot see it. |
| `private`           | The mount is private. Sub-mounts within it are not exposed to replica mounts, and sub-mounts of replica mounts are not exposed to the original mount.                                                               |
| `rshared`           | The same as shared, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                            |
| `rslave`            | The same as slave, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                             |
| `rprivate`          | The default. The same as private, meaning that no mount points anywhere within the original or replica mount points propagate in either direction.                                                                  |
@z

@x
Before you can set bind propagation on a mount point, the host filesystem needs
to already support bind propagation.
@y
Before you can set bind propagation on a mount point, the host filesystem needs
to already support bind propagation.
@z

@x
For more information about bind propagation, see the
[Linux kernel documentation for shared subtree](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt).
@y
For more information about bind propagation, see the
[Linux kernel documentation for shared subtree](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt).
@z

@x
The following example mounts the `target/` directory into the container twice,
and the second mount sets both the `ro` option and the `rslave` bind propagation
option.
@y
The following example mounts the `target/` directory into the container twice,
and the second mount sets both the `ro` option and the `rslave` bind propagation
option.
@z

@x
The `--mount` and `-v` examples have the same result.
@y
The `--mount` and `-v` examples have the same result.
@z

@x
{{< tabs >}}
{{< tab name="`--mount`" >}}
@y
{{< tabs >}}
{{< tab name="`--mount`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  --mount type=bind,source="$(pwd)"/target,target=/app2,readonly,bind-propagation=rslave \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  --mount type=bind,source="$(pwd)"/target,target=/app2,readonly,bind-propagation=rslave \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< tab name="`-v`" >}}
@y
{{< /tab >}}
{{< tab name="`-v`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  -v "$(pwd)"/target:/app2:ro,rslave \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  -v "$(pwd)"/target:/app2:ro,rslave \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Now if you create `/app/foo/`, `/app2/foo/` also exists.
@y
Now if you create `/app/foo/`, `/app2/foo/` also exists.
@z

@x
## Configure the SELinux label
@y
## Configure the SELinux label
@z

@x
If you use SELinux, you can add the `z` or `Z` options to modify the SELinux
label of the host file or directory being mounted into the container. This
affects the file or directory on the host machine itself and can have
consequences outside of the scope of Docker.
@y
If you use SELinux, you can add the `z` or `Z` options to modify the SELinux
label of the host file or directory being mounted into the container. This
affects the file or directory on the host machine itself and can have
consequences outside of the scope of Docker.
@z

@x
- The `z` option indicates that the bind mount content is shared among multiple
  containers.
- The `Z` option indicates that the bind mount content is private and unshared.
@y
- The `z` option indicates that the bind mount content is shared among multiple
  containers.
- The `Z` option indicates that the bind mount content is private and unshared.
@z

@x
Use extreme caution with these options. Bind-mounting a system directory
such as `/home` or `/usr` with the `Z` option renders your host machine
inoperable and you may need to relabel the host machine files by hand.
@y
Use extreme caution with these options. Bind-mounting a system directory
such as `/home` or `/usr` with the `Z` option renders your host machine
inoperable and you may need to relabel the host machine files by hand.
@z

@x
> [!IMPORTANT]
>
> When using bind mounts with services, SELinux labels
> (`:Z` and `:z`), as well as `:ro` are ignored. See
> [moby/moby #32579](https://github.com/moby/moby/issues/32579) for details.
@y
> [!IMPORTANT]
>
> When using bind mounts with services, SELinux labels
> (`:Z` and `:z`), as well as `:ro` are ignored. See
> [moby/moby #32579](https://github.com/moby/moby/issues/32579) for details.
@z

@x
This example sets the `z` option to specify that multiple containers can share
the bind mount's contents:
@y
This example sets the `z` option to specify that multiple containers can share
the bind mount's contents:
@z

@x
It is not possible to modify the SELinux label using the `--mount` flag.
@y
It is not possible to modify the SELinux label using the `--mount` flag.
@z

@x
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:z \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:z \
  nginx:latest
```
@z

@x
## Use a bind mount with Docker Compose
@y
## Use a bind mount with Docker Compose
@z

@x
A single Docker Compose service with a bind mount looks like this:
@y
A single Docker Compose service with a bind mount looks like this:
@z

@x
```yaml
services:
  frontend:
    image: node:lts
    volumes:
      - type: bind
        source: ./static
        target: /opt/app/static
volumes:
  myapp:
```
@y
```yaml
services:
  frontend:
    image: node:lts
    volumes:
      - type: bind
        source: ./static
        target: /opt/app/static
volumes:
  myapp:
```
@z

@x
For more information about using volumes of the `bind` type with Compose, see
[Compose reference on the volumes top-level element](/reference/compose-file/volumes.md).
and
[Compose reference on the volume attribute](/reference/compose-file/services.md#volumes).
@y
For more information about using volumes of the `bind` type with Compose, see
[Compose reference on the volumes top-level element](reference/compose-file/volumes.md).
and
[Compose reference on the volume attribute](reference/compose-file/services.md#volumes).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Learn about [volumes](./volumes.md).
- Learn about [tmpfs mounts](./tmpfs.md).
- Learn about [storage drivers](/engine/storage/drivers/).
@y
- Learn about [volumes](./volumes.md).
- Learn about [tmpfs mounts](./tmpfs.md).
- Learn about [storage drivers](__SUBDIR__/engine/storage/drivers/).
@z
