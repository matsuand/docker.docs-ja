%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Filter commands
description: |
  Use the filtering function in the CLI to selectively include resources
  that match the pattern you define.
keywords: cli, filter, commands, output, include, exclude
aliases:
  - /config/filter/
---
@y
---
title: Filter commands
description: |
  Use the filtering function in the CLI to selectively include resources
  that match the pattern you define.
keywords: cli, filter, commands, output, include, exclude
aliases:
  - /config/filter/
---
@z

@x
You can use the `--filter` flag to scope your commands. When filtering, the
commands only include entries that match the pattern you specify.
@y
You can use the `--filter` flag to scope your commands. When filtering, the
commands only include entries that match the pattern you specify.
@z

@x
## Using filters
@y
## Using filters
@z

@x
The `--filter` flag expects a key-value pair separated by an operator.
@y
The `--filter` flag expects a key-value pair separated by an operator.
@z

@x
```console
$ docker COMMAND --filter "KEY=VALUE"
```
@y
```console
$ docker COMMAND --filter "KEY=VALUE"
```
@z

@x
The key represents the field that you want to filter on.
The value is the pattern that the specified field must match.
The operator can be either equals (`=`) or not equals (`!=`).
@y
The key represents the field that you want to filter on.
The value is the pattern that the specified field must match.
The operator can be either equals (`=`) or not equals (`!=`).
@z

@x
For example, the command `docker images --filter reference=alpine` filters the
output of the `docker images` command to only print `alpine` images.
@y
For example, the command `docker images --filter reference=alpine` filters the
output of the `docker images` command to only print `alpine` images.
@z

@x
```console
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ubuntu       20.04     33a5cc25d22c   36 minutes ago   101MB
ubuntu       18.04     152dc042452c   36 minutes ago   88.1MB
alpine       3.16      a8cbb8c69ee7   40 minutes ago   8.67MB
alpine       latest    7144f7bab3d4   40 minutes ago   11.7MB
busybox      uclibc    3e516f71d880   48 minutes ago   2.4MB
busybox      glibc     7338d0c72c65   48 minutes ago   6.09MB
$ docker images --filter reference=alpine
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
alpine       3.16      a8cbb8c69ee7   40 minutes ago   8.67MB
alpine       latest    7144f7bab3d4   40 minutes ago   11.7MB
```
@y
```console
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ubuntu       20.04     33a5cc25d22c   36 minutes ago   101MB
ubuntu       18.04     152dc042452c   36 minutes ago   88.1MB
alpine       3.16      a8cbb8c69ee7   40 minutes ago   8.67MB
alpine       latest    7144f7bab3d4   40 minutes ago   11.7MB
busybox      uclibc    3e516f71d880   48 minutes ago   2.4MB
busybox      glibc     7338d0c72c65   48 minutes ago   6.09MB
$ docker images --filter reference=alpine
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
alpine       3.16      a8cbb8c69ee7   40 minutes ago   8.67MB
alpine       latest    7144f7bab3d4   40 minutes ago   11.7MB
```
@z

@x
The available fields (`reference` in this case) depend on the command you run.
Some filters expect an exact match. Others handle partial matches. Some filters
let you use regular expressions.
@y
The available fields (`reference` in this case) depend on the command you run.
Some filters expect an exact match. Others handle partial matches. Some filters
let you use regular expressions.
@z

@x
Refer to the [CLI reference description](#reference) for each command to learn
about the supported filtering capabilities for each command.
@y
Refer to the [CLI reference description](#reference) for each command to learn
about the supported filtering capabilities for each command.
@z

@x
## Combining filters
@y
## Combining filters
@z

@x
You can combine multiple filters by passing multiple `--filter` flags. The
following example shows how to print all images that match `alpine:latest` or
`busybox` - a logical `OR`.
@y
You can combine multiple filters by passing multiple `--filter` flags. The
following example shows how to print all images that match `alpine:latest` or
`busybox` - a logical `OR`.
@z

@x
```console
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       20.04     33a5cc25d22c   2 hours ago   101MB
ubuntu       18.04     152dc042452c   2 hours ago   88.1MB
alpine       3.16      a8cbb8c69ee7   2 hours ago   8.67MB
alpine       latest    7144f7bab3d4   2 hours ago   11.7MB
busybox      uclibc    3e516f71d880   2 hours ago   2.4MB
busybox      glibc     7338d0c72c65   2 hours ago   6.09MB
$ docker images --filter reference=alpine:latest --filter=reference=busybox
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
alpine       latest    7144f7bab3d4   2 hours ago   11.7MB
busybox      uclibc    3e516f71d880   2 hours ago   2.4MB
busybox      glibc     7338d0c72c65   2 hours ago   6.09MB
```
@y
```console
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       20.04     33a5cc25d22c   2 hours ago   101MB
ubuntu       18.04     152dc042452c   2 hours ago   88.1MB
alpine       3.16      a8cbb8c69ee7   2 hours ago   8.67MB
alpine       latest    7144f7bab3d4   2 hours ago   11.7MB
busybox      uclibc    3e516f71d880   2 hours ago   2.4MB
busybox      glibc     7338d0c72c65   2 hours ago   6.09MB
$ docker images --filter reference=alpine:latest --filter=reference=busybox
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
alpine       latest    7144f7bab3d4   2 hours ago   11.7MB
busybox      uclibc    3e516f71d880   2 hours ago   2.4MB
busybox      glibc     7338d0c72c65   2 hours ago   6.09MB
```
@z

@x
### Multiple negated filters
@y
### Multiple negated filters
@z

@x
Some commands support negated filters on [labels](/engine/manage-resources/labels.md).
Negated filters only consider results that don't match the specified patterns.
The following command prunes all containers that aren't labeled `foo`.
@y
Some commands support negated filters on [labels](/engine/manage-resources/labels.md).
Negated filters only consider results that don't match the specified patterns.
The following command prunes all containers that aren't labeled `foo`.
@z

@x
```console
$ docker container prune --filter "label!=foo"
```
@y
```console
$ docker container prune --filter "label!=foo"
```
@z

@x
There's a catch in combining multiple negated label filters. Multiple negated
filters create a single negative constraint - a logical `AND`. The following 
command prunes all containers except those labeled both `foo` and `bar`.
Containers labeled either `foo` or `bar`, but not both, will be pruned.
@y
There's a catch in combining multiple negated label filters. Multiple negated
filters create a single negative constraint - a logical `AND`. The following 
command prunes all containers except those labeled both `foo` and `bar`.
Containers labeled either `foo` or `bar`, but not both, will be pruned.
@z

@x
```console
$ docker container prune --filter "label!=foo" --filter "label!=bar"
```
@y
```console
$ docker container prune --filter "label!=foo" --filter "label!=bar"
```
@z

@x
## Reference
@y
## Reference
@z

@x
For more information about filtering commands, refer to the CLI reference
description for commands that support the `--filter` flag:
@y
For more information about filtering commands, refer to the CLI reference
description for commands that support the `--filter` flag:
@z

@x
- [`docker config ls`](/reference/cli/docker/config/ls.md)
- [`docker container prune`](/reference/cli/docker/container/prune.md)
- [`docker image prune`](/reference/cli/docker/image/prune.md)
- [`docker image ls`](/reference/cli/docker/image/ls.md)
- [`docker network ls`](/reference/cli/docker/network/ls.md)
- [`docker network prune`](/reference/cli/docker/network/prune.md)
- [`docker node ls`](/reference/cli/docker/node/ls.md)
- [`docker node ps`](/reference/cli/docker/node/ps.md)
- [`docker plugin ls`](/reference/cli/docker/plugin/ls.md)
- [`docker container ls`](/reference/cli/docker/container/ls.md)
- [`docker search`](/reference/cli/docker/search.md)
- [`docker secret ls`](/reference/cli/docker/secret/ls.md)
- [`docker service ls`](/reference/cli/docker/service/ls.md)
- [`docker service ps`](/reference/cli/docker/service/ps.md)
- [`docker stack ps`](/reference/cli/docker/stack/ps.md)
- [`docker system prune`](/reference/cli/docker/system/prune.md)
- [`docker volume ls`](/reference/cli/docker/volume/ls.md)
- [`docker volume prune`](/reference/cli/docker/volume/prune.md)
@y
- [`docker config ls`](/reference/cli/docker/config/ls.md)
- [`docker container prune`](/reference/cli/docker/container/prune.md)
- [`docker image prune`](/reference/cli/docker/image/prune.md)
- [`docker image ls`](/reference/cli/docker/image/ls.md)
- [`docker network ls`](/reference/cli/docker/network/ls.md)
- [`docker network prune`](/reference/cli/docker/network/prune.md)
- [`docker node ls`](/reference/cli/docker/node/ls.md)
- [`docker node ps`](/reference/cli/docker/node/ps.md)
- [`docker plugin ls`](/reference/cli/docker/plugin/ls.md)
- [`docker container ls`](/reference/cli/docker/container/ls.md)
- [`docker search`](/reference/cli/docker/search.md)
- [`docker secret ls`](/reference/cli/docker/secret/ls.md)
- [`docker service ls`](/reference/cli/docker/service/ls.md)
- [`docker service ps`](/reference/cli/docker/service/ps.md)
- [`docker stack ps`](/reference/cli/docker/stack/ps.md)
- [`docker system prune`](/reference/cli/docker/system/prune.md)
- [`docker volume ls`](/reference/cli/docker/volume/ls.md)
- [`docker volume prune`](/reference/cli/docker/volume/prune.md)
@z
