%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Free up disk space by removing unused resources with the prune command
keywords: pruning, prune, images, volumes, containers, networks, disk, administration,
  garbage collection
title: Prune unused Docker objects
aliases:
- /engine/admin/pruning/
---
@y
---
description: Free up disk space by removing unused resources with the prune command
keywords: pruning, prune, images, volumes, containers, networks, disk, administration,
  garbage collection
title: Prune unused Docker objects
aliases:
- /engine/admin/pruning/
---
@z

@x
Docker takes a conservative approach to cleaning up unused objects (often
referred to as "garbage collection"), such as images, containers, volumes, and
networks. These objects are generally not removed unless you explicitly ask
Docker to do so. This can cause Docker to use extra disk space. For each type of
object, Docker provides a `prune` command. In addition, you can use `docker
system prune` to clean up multiple types of objects at once. This topic shows
how to use these `prune` commands.
@y
Docker takes a conservative approach to cleaning up unused objects (often
referred to as "garbage collection"), such as images, containers, volumes, and
networks. These objects are generally not removed unless you explicitly ask
Docker to do so. This can cause Docker to use extra disk space. For each type of
object, Docker provides a `prune` command. In addition, you can use `docker
system prune` to clean up multiple types of objects at once. This topic shows
how to use these `prune` commands.
@z

@x
## Prune images
@y
## Prune images
@z

@x
The `docker image prune` command allows you to clean up unused images. By
default, `docker image prune` only cleans up _dangling_ images. A dangling image
is one that isn't tagged, and isn't referenced by any container. To remove
dangling images:
@y
The `docker image prune` command allows you to clean up unused images. By
default, `docker image prune` only cleans up _dangling_ images. A dangling image
is one that isn't tagged, and isn't referenced by any container. To remove
dangling images:
@z

@x
```console
$ docker image prune
@y
```console
$ docker image prune
@z

@x
WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
```
@z

@x
To remove all images which aren't used by existing containers, use the `-a`
flag:
@y
To remove all images which aren't used by existing containers, use the `-a`
flag:
@z

@x
```console
$ docker image prune -a
@y
```console
$ docker image prune -a
@z

@x
WARNING! This will remove all images without at least one container associated to them.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all images without at least one container associated to them.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@z

@x
You can limit which images are pruned using filtering expressions with the
`--filter` flag. For example, to only consider images created more than 24
hours ago:
@y
You can limit which images are pruned using filtering expressions with the
`--filter` flag. For example, to only consider images created more than 24
hours ago:
@z

@x
```console
$ docker image prune -a --filter "until=24h"
```
@y
```console
$ docker image prune -a --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker image prune` reference](../engine/reference/commandline/image_prune.md)
for more examples.
@y
Other filtering expressions are available. See the
[`docker image prune` reference](../engine/reference/commandline/image_prune.md)
for more examples.
@z

@x
## Prune containers
@y
## Prune containers
@z

@x
When you stop a container, it isn't automatically removed unless you started it
with the `--rm` flag. To see all containers on the Docker host, including
stopped containers, use `docker ps -a`. You may be surprised how many containers
exist, especially on a development system! A stopped container's writable layers
still take up disk space. To clean this up, you can use the `docker container
prune` command.
@y
When you stop a container, it isn't automatically removed unless you started it
with the `--rm` flag. To see all containers on the Docker host, including
stopped containers, use `docker ps -a`. You may be surprised how many containers
exist, especially on a development system! A stopped container's writable layers
still take up disk space. To clean this up, you can use the `docker container
prune` command.
@z

@x
```console
$ docker container prune
@y
```console
$ docker container prune
@z

@x
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you're prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
By default, you're prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@z

@x
By default, all stopped containers are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
stopped containers older than 24 hours:
@y
By default, all stopped containers are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
stopped containers older than 24 hours:
@z

@x
```console
$ docker container prune --filter "until=24h"
```
@y
```console
$ docker container prune --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker container prune` reference](../engine/reference/commandline/container_prune.md)
for more examples.
@y
Other filtering expressions are available. See the
[`docker container prune` reference](../engine/reference/commandline/container_prune.md)
for more examples.
@z

@x
## Prune volumes
@y
## Prune volumes
@z

@x
Volumes can be used by one or more containers, and take up space on the Docker
host. Volumes are never removed automatically, because to do so could destroy
data.
@y
Volumes can be used by one or more containers, and take up space on the Docker
host. Volumes are never removed automatically, because to do so could destroy
data.
@z

@x
```console
$ docker volume prune
@y
```console
$ docker volume prune
@z

@x
WARNING! This will remove all volumes not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all volumes not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@z

@x
By default, all unused volumes are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
volumes which aren't labelled with the `keep` label:
@y
By default, all unused volumes are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
volumes which aren't labelled with the `keep` label:
@z

@x
```console
$ docker volume prune --filter "label!=keep"
```
@y
```console
$ docker volume prune --filter "label!=keep"
```
@z

@x
Other filtering expressions are available. See the
[`docker volume prune` reference](../engine/reference/commandline/volume_prune.md)
for more examples.
@y
Other filtering expressions are available. See the
[`docker volume prune` reference](../engine/reference/commandline/volume_prune.md)
for more examples.
@z

@x
## Prune networks
@y
## Prune networks
@z

@x
Docker networks don't take up much disk space, but they do create `iptables`
rules, bridge network devices, and routing table entries. To clean these things
up, you can use `docker network prune` to clean up networks which aren't used
by any containers.
@y
Docker networks don't take up much disk space, but they do create `iptables`
rules, bridge network devices, and routing table entries. To clean these things
up, you can use `docker network prune` to clean up networks which aren't used
by any containers.
@z

@x
```console
$ docker network prune
@y
```console
$ docker network prune
@z

@x
WARNING! This will remove all networks not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all networks not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you're prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
By default, you're prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@z

@x
By default, all unused networks are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
networks older than 24 hours:
@y
By default, all unused networks are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
networks older than 24 hours:
@z

@x
```console
$ docker network prune --filter "until=24h"
```
@y
```console
$ docker network prune --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker network prune` reference](../engine/reference/commandline/network_prune.md)
for more examples.
@y
Other filtering expressions are available. See the
[`docker network prune` reference](../engine/reference/commandline/network_prune.md)
for more examples.
@z

@x
## Prune everything
@y
## Prune everything
@z

@x
The `docker system prune` command is a shortcut that prunes images, containers,
and networks. Volumes aren't pruned by default, and you must specify the
`--volumes` flag for `docker system prune` to prune volumes.
@y
The `docker system prune` command is a shortcut that prunes images, containers,
and networks. Volumes aren't pruned by default, and you must specify the
`--volumes` flag for `docker system prune` to prune volumes.
@z

@x
```console
$ docker system prune
@y
```console
$ docker system prune
@z

@x
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - unused build cache
@y
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - unused build cache
@z

@x
Are you sure you want to continue? [y/N] y
```
@y
Are you sure you want to continue? [y/N] y
```
@z

@x
To also prune volumes, add the `--volumes` flag:
@y
To also prune volumes, add the `--volumes` flag:
@z

@x
```console
$ docker system prune --volumes
@y
```console
$ docker system prune --volumes
@z

@x
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all dangling images
        - all build cache
@y
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all dangling images
        - all build cache
@z

@x
Are you sure you want to continue? [y/N] y
```
@y
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you're prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
By default, you're prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@z

@x
By default, all unused containers, networks, and images are removed. You can
limit the scope using the `--filter` flag. For instance, the following command
removes items older than 24 hours:
@y
By default, all unused containers, networks, and images are removed. You can
limit the scope using the `--filter` flag. For instance, the following command
removes items older than 24 hours:
@z

@x
```console
$ docker system prune --filter "until=24h"
```
@y
```console
$ docker system prune --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker system prune` reference](../engine/reference/commandline/system_prune.md)
for more examples.
@y
Other filtering expressions are available. See the
[`docker system prune` reference](../engine/reference/commandline/system_prune.md)
for more examples.
@z
