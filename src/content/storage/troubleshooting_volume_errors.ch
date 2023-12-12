%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Troubleshooting volume errors
keywords: cadvisor, troubleshooting, volumes, bind-mounts
title: Troubleshoot storage errors
aliases:
- /engine/admin/troubleshooting_volume_errors/
---
@y
---
description: Troubleshooting volume errors
keywords: cadvisor, troubleshooting, volumes, bind-mounts
title: Troubleshoot storage errors
aliases:
- /engine/admin/troubleshooting_volume_errors/
---
@z

@x
This topic discusses errors which may occur when you use Docker volumes or bind
mounts.
@y
This topic discusses errors which may occur when you use Docker volumes or bind
mounts.
@z

@x
## `Error: Unable to remove filesystem`
@y
## `Error: Unable to remove filesystem`
@z

@x
Some container-based utilities, such
as [Google cAdvisor](https://github.com/google/cadvisor), mount Docker system
directories, such as `/var/lib/docker/`, into a container.  For instance, the
documentation for `cadvisor` instructs you to run the `cadvisor` container as
follows:
@y
Some container-based utilities, such
as [Google cAdvisor](https://github.com/google/cadvisor), mount Docker system
directories, such as `/var/lib/docker/`, into a container.  For instance, the
documentation for `cadvisor` instructs you to run the `cadvisor` container as
follows:
@z

@x
```console
$ sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
```
@y
```console
$ sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
```
@z

@x
When you bind-mount `/var/lib/docker/`, this effectively mounts all resources of
all other running containers as filesystems within the container which mounts
`/var/lib/docker/`. When you attempt to remove any of these containers, the
removal attempt may fail with an error like the following:
@y
When you bind-mount `/var/lib/docker/`, this effectively mounts all resources of
all other running containers as filesystems within the container which mounts
`/var/lib/docker/`. When you attempt to remove any of these containers, the
removal attempt may fail with an error like the following:
@z

@x
```none
Error: Unable to remove filesystem for
74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515:
remove /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm:
Device or resource busy
```
@y
```none
Error: Unable to remove filesystem for
74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515:
remove /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm:
Device or resource busy
```
@z

@x
The problem occurs if the container which bind-mounts `/var/lib/docker/`
uses `statfs` or `fstatfs` on filesystem handles within `/var/lib/docker/`
and does not close them.
@y
The problem occurs if the container which bind-mounts `/var/lib/docker/`
uses `statfs` or `fstatfs` on filesystem handles within `/var/lib/docker/`
and does not close them.
@z

@x
Typically, we would advise against bind-mounting `/var/lib/docker` in this way.
However, `cAdvisor` requires this bind-mount for core functionality.
@y
Typically, we would advise against bind-mounting `/var/lib/docker` in this way.
However, `cAdvisor` requires this bind-mount for core functionality.
@z

@x
If you are unsure which process is causing the path mentioned in the error to
be busy and preventing it from being removed, you can use the `lsof` command
to find its process. For instance, for the error above:
@y
If you are unsure which process is causing the path mentioned in the error to
be busy and preventing it from being removed, you can use the `lsof` command
to find its process. For instance, for the error above:
@z

@x
```console
$ sudo lsof /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm
```
@y
```console
$ sudo lsof /var/lib/docker/containers/74bef250361c7817bee19349c93139621b272bc8f654ae112dd4eb9652af9515/shm
```
@z

@x
To work around this problem, stop the container which bind-mounts
`/var/lib/docker` and try again to remove the other container.
@y
To work around this problem, stop the container which bind-mounts
`/var/lib/docker` and try again to remove the other container.
@z
