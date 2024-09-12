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
If you're running Docker on Linux, you have a third option: `tmpfs` mounts.
When you create a container with a `tmpfs` mount, the container can create
files outside the container's writable layer.
@y
If you're running Docker on Linux, you have a third option: `tmpfs` mounts.
When you create a container with a `tmpfs` mount, the container can create
files outside the container's writable layer.
@z

@x
As opposed to volumes and bind mounts, a `tmpfs` mount is temporary, and only
persisted in the host memory. When the container stops, the `tmpfs` mount is
removed, and files written there won't be persisted.
@y
As opposed to volumes and bind mounts, a `tmpfs` mount is temporary, and only
persisted in the host memory. When the container stops, the `tmpfs` mount is
removed, and files written there won't be persisted.
@z

@x
![tmpfs on the Docker host](images/types-of-mounts-tmpfs.webp?w=450&h=300)
@y
![tmpfs on the Docker host](images/types-of-mounts-tmpfs.webp?w=450&h=300)
@z

@x
This is useful to temporarily store sensitive files that you don't want to
persist in either the host or the container writable layer.
@y
This is useful to temporarily store sensitive files that you don't want to
persist in either the host or the container writable layer.
@z

@x
## Limitations of tmpfs mounts
@y
## Limitations of tmpfs mounts
@z

@x
* Unlike volumes and bind mounts, you can't share `tmpfs` mounts between
containers.
* This functionality is only available if you're running Docker on Linux.
* Setting permissions on tmpfs may cause them to [reset after container restart](https://github.com/docker/for-linux/issues/138). In some cases [setting the uid/gid](https://github.com/docker/compose/issues/3425#issuecomment-423091370) can serve as a workaround.
@y
* Unlike volumes and bind mounts, you can't share `tmpfs` mounts between
containers.
* This functionality is only available if you're running Docker on Linux.
* Setting permissions on tmpfs may cause them to [reset after container restart](https://github.com/docker/for-linux/issues/138). In some cases [setting the uid/gid](https://github.com/docker/compose/issues/3425#issuecomment-423091370) can serve as a workaround.
@z

@x
## Choose the --tmpfs or --mount flag
@y
## Choose the --tmpfs or --mount flag
@z

@x
In general, `--mount` is more explicit and verbose. The biggest difference is
that the `--tmpfs` flag does not support any configurable options.
@y
In general, `--mount` is more explicit and verbose. The biggest difference is
that the `--tmpfs` flag does not support any configurable options.
@z

@x
- `--tmpfs`: Mounts a `tmpfs` mount without allowing you to specify any
  configurable options, and can only be used with standalone containers.
@y
- `--tmpfs`: Mounts a `tmpfs` mount without allowing you to specify any
  configurable options, and can only be used with standalone containers.
@z

@x
- `--mount`: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `--tmpfs`:
  - The `type` of the mount, which can be [`bind`](bind-mounts.md), `volume`, or
    [`tmpfs`](tmpfs.md). This topic discusses `tmpfs`, so the type is always
    `tmpfs`.
  - The `destination` takes as its value the path where the `tmpfs` mount
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `tmpfs-size` and `tmpfs-mode` options. See
    [tmpfs options](#specify-tmpfs-options).
@y
- `--mount`: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `--tmpfs`:
  - The `type` of the mount, which can be [`bind`](bind-mounts.md), `volume`, or
    [`tmpfs`](tmpfs.md). This topic discusses `tmpfs`, so the type is always
    `tmpfs`.
  - The `destination` takes as its value the path where the `tmpfs` mount
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `tmpfs-size` and `tmpfs-mode` options. See
    [tmpfs options](#specify-tmpfs-options).
@z

@x
The examples below show both the `--mount` and `--tmpfs` syntax where possible,
and `--mount` is presented first.
@y
The examples below show both the `--mount` and `--tmpfs` syntax where possible,
and `--mount` is presented first.
@z

@x
### Differences between `--tmpfs` and `--mount` behavior
@y
### Differences between `--tmpfs` and `--mount` behavior
@z

@x
- The `--tmpfs` flag does not allow you to specify any configurable options.
- The `--tmpfs` flag cannot be used with swarm services. You must use `--mount`.
@y
- The `--tmpfs` flag does not allow you to specify any configurable options.
- The `--tmpfs` flag cannot be used with swarm services. You must use `--mount`.
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
### Specify tmpfs options
@y
### Specify tmpfs options
@z

@x
`tmpfs` mounts allow for two configuration options, neither of which is
required. If you need to specify these options, you must use the `--mount` flag,
as the `--tmpfs` flag does not support them.
@y
`tmpfs` mounts allow for two configuration options, neither of which is
required. If you need to specify these options, you must use the `--mount` flag,
as the `--tmpfs` flag does not support them.
@z

@x
| Option       | Description                                                                                                               |
|:-------------|:--------------------------------------------------------------------------------------------------------------------------|
| `tmpfs-size` | Size of the tmpfs mount in bytes. If unset, the default maximum size of a tmpfs volume is 50% of the host's total RAM.    |
| `tmpfs-mode` | File mode of the tmpfs in octal. For instance, `700` or `0770`. Defaults to `1777` or world-writable.                     |
@y
| Option       | Description                                                                                                               |
|:-------------|:--------------------------------------------------------------------------------------------------------------------------|
| `tmpfs-size` | Size of the tmpfs mount in bytes. If unset, the default maximum size of a tmpfs volume is 50% of the host's total RAM.    |
| `tmpfs-mode` | File mode of the tmpfs in octal. For instance, `700` or `0770`. Defaults to `1777` or world-writable.                     |
@z

@x
The following example sets the `tmpfs-mode` to `1770`, so that it is not
world-readable within the container.
@y
The following example sets the `tmpfs-mode` to `1770`, so that it is not
world-readable within the container.
@z

@x
```console
docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app,tmpfs-mode=1770 \
  nginx:latest
```
@y
```console
docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app,tmpfs-mode=1770 \
  nginx:latest
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
