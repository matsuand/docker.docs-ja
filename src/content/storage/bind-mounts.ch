%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using bind mounts
title: Bind mounts
keywords: storage, persistence, data persistence, mounts, bind mounts
aliases:
- /engine/admin/volumes/bind-mounts/
---
@y
---
description: Using bind mounts
title: Bind mounts
keywords: storage, persistence, data persistence, mounts, bind mounts
aliases:
- /engine/admin/volumes/bind-mounts/
---
@z

@x
Bind mounts have been around since the early days of Docker. Bind mounts have
limited functionality compared to [volumes](volumes.md). When you use a bind
mount, a file or directory on the host machine is mounted into a container.
The file or directory is referenced by its absolute path on the host
machine. By contrast, when you use a volume, a new directory is created within
Docker's storage directory on the host machine, and Docker manages that
directory's contents.
@y
Bind mounts have been around since the early days of Docker. Bind mounts have
limited functionality compared to [volumes](volumes.md). When you use a bind
mount, a file or directory on the host machine is mounted into a container.
The file or directory is referenced by its absolute path on the host
machine. By contrast, when you use a volume, a new directory is created within
Docker's storage directory on the host machine, and Docker manages that
directory's contents.
@z

@x
The file or directory does not need to exist on the Docker host already. It is
created on demand if it does not yet exist. Bind mounts are very performant, but
they rely on the host machine's filesystem having a specific directory structure
available. If you are developing new Docker applications, consider using
[named volumes](volumes.md) instead. You can't use Docker CLI commands to directly
manage bind mounts.
@y
The file or directory does not need to exist on the Docker host already. It is
created on demand if it does not yet exist. Bind mounts are very performant, but
they rely on the host machine's filesystem having a specific directory structure
available. If you are developing new Docker applications, consider using
[named volumes](volumes.md) instead. You can't use Docker CLI commands to directly
manage bind mounts.
@z

@x
![Bind mounts on the Docker host](images/types-of-mounts-bind.webp?w=450&h=300)
@y
![Bind mounts on the Docker host](images/types-of-mounts-bind.webp?w=450&h=300)
@z

@x
## Choose the -v or --mount flag
@y
## Choose the -v or --mount flag
@z

@x
In general, `--mount` is more explicit and verbose. The biggest difference is that
the `-v` syntax combines all the options together in one field, while the `--mount`
syntax separates them. Here is a comparison of the syntax for each flag.
@y
In general, `--mount` is more explicit and verbose. The biggest difference is that
the `-v` syntax combines all the options together in one field, while the `--mount`
syntax separates them. Here is a comparison of the syntax for each flag.
@z

@x
> Tip
>
> New users should use the `--mount` syntax. Experienced users may
> be more familiar with the `-v` or `--volume` syntax, but are encouraged to
> use `--mount`, because research has shown it to be easier to use.
{ .tip }
@y
> Tip
>
> New users should use the `--mount` syntax. Experienced users may
> be more familiar with the `-v` or `--volume` syntax, but are encouraged to
> use `--mount`, because research has shown it to be easier to use.
{ .tip }
@z

@x
- `-v` or `--volume`: Consists of three fields, separated by colon characters
  (`:`). The fields must be in the correct order, and the meaning of each field
  is not immediately obvious.
  - In the case of bind mounts, the first field is the path to the file or
    directory on the **host machine**.
  - The second field is the path where the file or directory is mounted in
    the container.
  - The third field is optional, and is a comma-separated list of options, such
    as `ro`, `z`, and `Z`. These options
    are discussed below.
@y
- `-v` or `--volume`: Consists of three fields, separated by colon characters
  (`:`). The fields must be in the correct order, and the meaning of each field
  is not immediately obvious.
  - In the case of bind mounts, the first field is the path to the file or
    directory on the **host machine**.
  - The second field is the path where the file or directory is mounted in
    the container.
  - The third field is optional, and is a comma-separated list of options, such
    as `ro`, `z`, and `Z`. These options
    are discussed below.
@z

@x
- `--mount`: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `-v` or `--volume`, but the order of the keys is not significant, and
  the value of the flag is easier to understand.
  - The `type` of the mount, which can be `bind`, `volume`, or `tmpfs`. This
    topic discusses bind mounts, so the type is always `bind`.
  - The `source` of the mount. For bind mounts, this is the path to the file
    or directory on the Docker daemon host. May be specified as `source` or
    `src`.
  - The `destination` takes as its value the path where the file or directory
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `readonly` option, if present, causes the bind mount to be [mounted into
    the container as read-only](#use-a-read-only-bind-mount).
  - The `bind-propagation` option, if present, changes the
    [bind propagation](#configure-bind-propagation). May be one of `rprivate`,
    `private`, `rshared`, `shared`, `rslave`, `slave`.
  - The `--mount` flag does not support `z` or `Z` options for modifying
    selinux labels.
@y
- `--mount`: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `-v` or `--volume`, but the order of the keys is not significant, and
  the value of the flag is easier to understand.
  - The `type` of the mount, which can be `bind`, `volume`, or `tmpfs`. This
    topic discusses bind mounts, so the type is always `bind`.
  - The `source` of the mount. For bind mounts, this is the path to the file
    or directory on the Docker daemon host. May be specified as `source` or
    `src`.
  - The `destination` takes as its value the path where the file or directory
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `readonly` option, if present, causes the bind mount to be [mounted into
    the container as read-only](#use-a-read-only-bind-mount).
  - The `bind-propagation` option, if present, changes the
    [bind propagation](#configure-bind-propagation). May be one of `rprivate`,
    `private`, `rshared`, `shared`, `rslave`, `slave`.
  - The `--mount` flag does not support `z` or `Z` options for modifying
    selinux labels.
@z

@x
The examples below show both the `--mount` and `-v` syntax where possible, and
`--mount` is presented first.
@y
The examples below show both the `--mount` and `-v` syntax where possible, and
`--mount` is presented first.
@z

@x
### Differences between `-v` and `--mount` behavior
@y
### Differences between `-v` and `--mount` behavior
@z

@x
Because the `-v` and `--volume` flags have been a part of Docker for a long
time, their behavior cannot be changed. This means that there is one behavior
that is different between `-v` and `--mount`.
@y
Because the `-v` and `--volume` flags have been a part of Docker for a long
time, their behavior cannot be changed. This means that there is one behavior
that is different between `-v` and `--mount`.
@z

@x
If you use `-v` or `--volume` to bind-mount a file or directory that does not
yet exist on the Docker host, `-v` creates the endpoint for you. It is
always created as a directory.
@y
If you use `-v` or `--volume` to bind-mount a file or directory that does not
yet exist on the Docker host, `-v` creates the endpoint for you. It is
always created as a directory.
@z

@x
If you use `--mount` to bind-mount a file or directory that does not
yet exist on the Docker host, Docker does not automatically create it for
you, but generates an error.
@y
If you use `--mount` to bind-mount a file or directory that does not
yet exist on the Docker host, Docker does not automatically create it for
you, but generates an error.
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
If you're on Windows, see also [Path conversions on Windows](../desktop/troubleshoot/topics.md).
@y
Consider a case where you have a directory `source` and that when you build the
source code, the artifacts are saved into another directory, `source/target/`.
You want the artifacts to be available to the container at `/app/`, and you
want the container to get access to a new build each time you build the source
on your development host. Use the following command to bind-mount the `target/`
directory into your container at `/app/`. Run the command from within the
`source` directory. The `$(pwd)` sub-command expands to the current working
directory on Linux or macOS hosts.
If you're on Windows, see also [Path conversions on Windows](../desktop/troubleshoot/topics.md).
@z

@x
The `--mount` and `-v` examples below produce the same result. You
can't run them both unless you remove the `devtest` container after running the
first one.
@y
The `--mount` and `-v` examples below produce the same result. You
can't run them both unless you remove the `devtest` container after running the
first one.
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
Stop the container:
@y
Stop the container:
@z

@x
```console
$ docker container stop devtest
@y
```console
$ docker container stop devtest
@z

@x
$ docker container rm devtest
```
@y
$ docker container rm devtest
```
@z

@x
### Mount into a non-empty directory on the container
@y
### Mount into a non-empty directory on the container
@z

@x
If you bind-mount a directory into a non-empty directory on the container, the directory's
existing contents are obscured by the bind mount. This can be beneficial,
such as when you want to test a new version of your application without
building a new image. However, it can also be surprising and this behavior
differs from that of [docker volumes](volumes.md).
@y
If you bind-mount a directory into a non-empty directory on the container, the directory's
existing contents are obscured by the bind mount. This can be beneficial,
such as when you want to test a new version of your application without
building a new image. However, it can also be surprising and this behavior
differs from that of [docker volumes](volumes.md).
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
This example modifies the one above but mounts the directory as a read-only
bind mount, by adding `ro` to the (empty by default) list of options, after the
mount point within the container. Where multiple options are present, separate
them by commas.
@y
This example modifies the one above but mounts the directory as a read-only
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
Stop the container:
@y
Stop the container:
@z

@x
```console
$ docker container stop devtest
@y
```console
$ docker container stop devtest
@z

@x
$ docker container rm devtest
```
@y
$ docker container rm devtest
```
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
> **Warning**
>
> Mount propagation doesn't work with Docker Desktop.
{ .warning }
@y
> **Warning**
>
> Mount propagation doesn't work with Docker Desktop.
{ .warning }
@z

@x
| Propagation setting | Description                                                                                                                                                                                                         |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `shared`            | Sub-mounts of the original mount are exposed to replica mounts, and sub-mounts of replica mounts are also propagated to the original mount.                                                                         |
| `slave`             | similar to a shared mount, but only in one direction. If the original mount exposes a sub-mount, the replica mount can see it. However, if the replica mount exposes a sub-mount, the original mount cannot see it. |
| `private`           | The mount is private. Sub-mounts within it are not exposed to replica mounts, and sub-mounts of replica mounts are not exposed to the original mount.                                                               |
| `rshared`           | The same as shared, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                            |
| `rslave`            | The same as slave, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                             |
| `rprivate`          | The default. The same as private, meaning that no mount points anywhere within the original or replica mount points propagate in either direction.                                                                  |
@y
| Propagation setting | Description                                                                                                                                                                                                         |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
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
## Configure the selinux label
@y
## Configure the selinux label
@z

@x
If you use `selinux` you can add the `z` or `Z` options to modify the selinux
label of the host file or directory being mounted into the container. This
affects the file or directory on the host machine itself and can have
consequences outside of the scope of Docker.
@y
If you use `selinux` you can add the `z` or `Z` options to modify the selinux
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
> **Important**
>
> When using bind mounts with services, selinux labels
> (`:Z` and `:z`), as well as `:ro` are ignored. See
> [moby/moby #32579](https://github.com/moby/moby/issues/32579) for details.
{ .important }
@y
> **Important**
>
> When using bind mounts with services, selinux labels
> (`:Z` and `:z`), as well as `:ro` are ignored. See
> [moby/moby #32579](https://github.com/moby/moby/issues/32579) for details.
{ .important }
@z

@x
This example sets the `z` option to specify that multiple containers can share
the bind mount's contents:
@y
This example sets the `z` option to specify that multiple containers can share
the bind mount's contents:
@z

@x
It is not possible to modify the selinux label using the `--mount` flag.
@y
It is not possible to modify the selinux label using the `--mount` flag.
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
## Use a bind mount with compose
@y
## Use a bind mount with compose
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
[Compose reference on volumes](../compose/compose-file/compose-file-v3.md#volumes).
and
[Compose reference on volume configuration](../compose/compose-file/compose-file-v3.md#volume-configuration-reference).
@y
For more information about using volumes of the `bind` type with Compose, see
[Compose reference on volumes](../compose/compose-file/compose-file-v3.md#volumes).
and
[Compose reference on volume configuration](../compose/compose-file/compose-file-v3.md#volume-configuration-reference).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Learn about [volumes](volumes.md).
- Learn about [tmpfs mounts](tmpfs.md).
- Learn about [storage drivers](/storage/storagedriver/).
@y
- Learn about [volumes](volumes.md).
- Learn about [tmpfs mounts](tmpfs.md).
- Learn about [storage drivers](/storage/storagedriver/).
@z
