%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Using tmpfs mounts
title: tmpfs mounts
@y
description: Using tmpfs mounts
title: tmpfs mounts
@z

@x
keywords: storage, persistence, data persistence, tmpfs
@y
keywords: storage, persistence, data persistence, tmpfs
@z

@x
[Volumes](volumes.md) and [bind mounts](bind-mounts.md) let you share files
between the host machine and container so that you can persist data even after
the container is stopped.
@y
[Volumes](volumes.md) and [bind mounts](bind-mounts.md) let you share files
between the host machine and container so that you can persist data even after
the container is stopped.
@z

@x
If you're running Docker on Linux, you have a third option: tmpfs mounts.
When you create a container with a tmpfs mount, the container can create
files outside the container's writable layer.
@y
If you're running Docker on Linux, you have a third option: tmpfs mounts.
When you create a container with a tmpfs mount, the container can create
files outside the container's writable layer.
@z

@x
As opposed to volumes and bind mounts, a tmpfs mount is temporary, and only
persisted in the host memory. When the container stops, the tmpfs mount is
removed, and files written there won't be persisted.
@y
As opposed to volumes and bind mounts, a tmpfs mount is temporary, and only
persisted in the host memory. When the container stops, the tmpfs mount is
removed, and files written there won't be persisted.
@z

@x
tmpfs mounts are best used for cases when you do not want the data to persist
either on the host machine or within the container. This may be for security
reasons or to protect the performance of the container when your application
needs to write a large volume of non-persistent state data.
@y
tmpfs mounts are best used for cases when you do not want the data to persist
either on the host machine or within the container. This may be for security
reasons or to protect the performance of the container when your application
needs to write a large volume of non-persistent state data.
@z

@x
> [!IMPORTANT]
> tmpfs mounts in Docker map directly to
> [tmpfs](https://en.wikipedia.org/wiki/Tmpfs) in the Linux kernel. As such,
> the temporary data may be written to a swap file, and thereby persisted to
> the filesystem.
@y
> [!IMPORTANT]
> tmpfs mounts in Docker map directly to
> [tmpfs](https://en.wikipedia.org/wiki/Tmpfs) in the Linux kernel. As such,
> the temporary data may be written to a swap file, and thereby persisted to
> the filesystem.
@z

@x
## Mounting over existing data
@y
## Mounting over existing data
@z

@x
If you create a tmpfs mount into a directory in the container in which files or
directories exist, the pre-existing files are obscured by the mount. This is
similar to if you were to save files into `/mnt` on a Linux host, and then
mounted a USB drive into `/mnt`. The contents of `/mnt` would be obscured by
the contents of the USB drive until the USB drive was unmounted.
@y
If you create a tmpfs mount into a directory in the container in which files or
directories exist, the pre-existing files are obscured by the mount. This is
similar to if you were to save files into `/mnt` on a Linux host, and then
mounted a USB drive into `/mnt`. The contents of `/mnt` would be obscured by
the contents of the USB drive until the USB drive was unmounted.
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
## Limitations of tmpfs mounts
@y
## Limitations of tmpfs mounts
@z

@x
- Unlike volumes and bind mounts, you can't share tmpfs mounts between containers.
- This functionality is only available if you're running Docker on Linux.
- Setting permissions on tmpfs may cause them to [reset after container restart](https://github.com/docker/for-linux/issues/138). In some cases [setting the uid/gid](https://github.com/docker/compose/issues/3425#issuecomment-423091370) can serve as a workaround.
@y
- Unlike volumes and bind mounts, you can't share tmpfs mounts between containers.
- This functionality is only available if you're running Docker on Linux.
- Setting permissions on tmpfs may cause them to [reset after container restart](https://github.com/docker/for-linux/issues/138). In some cases [setting the uid/gid](https://github.com/docker/compose/issues/3425#issuecomment-423091370) can serve as a workaround.
@z

@x
## Syntax
@y
## Syntax
@z

@x
To mount a tmpfs with the `docker run` command, you can use either the
`--mount` or `--tmpfs` flag.
@y
To mount a tmpfs with the `docker run` command, you can use either the
`--mount` or `--tmpfs` flag.
@z

@x
```console
$ docker run --mount type=tmpfs,dst=<mount-path>
$ docker run --tmpfs <mount-path>
```
@y
```console
$ docker run --mount type=tmpfs,dst=<mount-path>
$ docker run --tmpfs <mount-path>
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
The `--tmpfs` flag cannot be used with swarm services. You must use `--mount`.
@y
The `--tmpfs` flag cannot be used with swarm services. You must use `--mount`.
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
$ docker run --mount type=tmpfs,dst=<mount-path>[,<key>=<value>...]
```
@y
```console
$ docker run --mount type=tmpfs,dst=<mount-path>[,<key>=<value>...]
```
@z

@x
Valid options for `--mount type=tmpfs` include:
@y
Valid options for `--mount type=tmpfs` include:
@z

@x
| Option                         | Description                                                                                                            |
| :----------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| `destination`, `dst`, `target` | Size of the tmpfs mount in bytes. If unset, the default maximum size of a tmpfs volume is 50% of the host's total RAM. |
| `tmpfs-size`                   | Size of the tmpfs mount in bytes. If unset, the default maximum size of a tmpfs volume is 50% of the host's total RAM. |
| `tmpfs-mode`                   | File mode of the tmpfs in octal. For instance, `700` or `0770`. Defaults to `1777` or world-writable.                  |
@y
| Option                         | Description                                                                                                            |
| :----------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| `destination`, `dst`, `target` | Size of the tmpfs mount in bytes. If unset, the default maximum size of a tmpfs volume is 50% of the host's total RAM. |
| `tmpfs-size`                   | Size of the tmpfs mount in bytes. If unset, the default maximum size of a tmpfs volume is 50% of the host's total RAM. |
| `tmpfs-mode`                   | File mode of the tmpfs in octal. For instance, `700` or `0770`. Defaults to `1777` or world-writable.                  |
@z

@x
```console {title="Example"}
$ docker run --mount type=tmpfs,dst=/app,tmpfs-size=21474836480,tmpfs-mode=1770
```
@y
```console {title="Example"}
$ docker run --mount type=tmpfs,dst=/app,tmpfs-size=21474836480,tmpfs-mode=1770
```
@z

@x
### Options for --tmpfs
@y
### Options for --tmpfs
@z

@x
The `--tmpfs` flag does not let you specify any options.
@y
The `--tmpfs` flag does not let you specify any options.
@z

@x
## Use a tmpfs mount in a container
@y
## Use a tmpfs mount in a container
@z

@x
To use a `tmpfs` mount in a container, use the `--tmpfs` flag, or use the
`--mount` flag with `type=tmpfs` and `destination` options. There is no
`source` for `tmpfs` mounts. The following example creates a `tmpfs` mount at
`/app` in a Nginx container. The first example uses the `--mount` flag and the
second uses the `--tmpfs` flag.
@y
To use a `tmpfs` mount in a container, use the `--tmpfs` flag, or use the
`--mount` flag with `type=tmpfs` and `destination` options. There is no
`source` for `tmpfs` mounts. The following example creates a `tmpfs` mount at
`/app` in a Nginx container. The first example uses the `--mount` flag and the
second uses the `--tmpfs` flag.
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
  --name tmptest \
  --mount type=tmpfs,destination=/app \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app \
  nginx:latest
```
@z

@x
{{< /tab >}}
{{< tab name="`--tmpfs`" >}}
@y
{{< /tab >}}
{{< tab name="`--tmpfs`" >}}
@z

@x
```console
$ docker run -d \
  -it \
  --name tmptest \
  --tmpfs /app \
  nginx:latest
```
@y
```console
$ docker run -d \
  -it \
  --name tmptest \
  --tmpfs /app \
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
Verify that the mount is a `tmpfs` mount by looking in the `Mounts` section of
the `docker inspect` output:
@y
Verify that the mount is a `tmpfs` mount by looking in the `Mounts` section of
the `docker inspect` output:
@z

@x
```console
$ docker inspect tmptest --format '{{ json .Mounts }}'
[{"Type":"tmpfs","Source":"","Destination":"/app","Mode":"","RW":true,"Propagation":""}]
```
@y
```console
$ docker inspect tmptest --format '{{ json .Mounts }}'
[{"Type":"tmpfs","Source":"","Destination":"/app","Mode":"","RW":true,"Propagation":""}]
```
@z

@x
Stop and remove the container:
@y
Stop and remove the container:
@z

@x
```console
$ docker stop tmptest
$ docker rm tmptest
```
@y
```console
$ docker stop tmptest
$ docker rm tmptest
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Learn about [volumes](volumes.md)
- Learn about [bind mounts](bind-mounts.md)
- Learn about [storage drivers](/engine/storage/drivers/)
@y
- Learn about [volumes](volumes.md)
- Learn about [bind mounts](bind-mounts.md)
- Learn about [storage drivers](__SUBDIR__/engine/storage/drivers/)
@z
