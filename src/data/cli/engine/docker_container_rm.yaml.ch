%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container rm
aliases: docker container rm, docker container remove, docker rm
short: Remove one or more containers
long: Remove one or more containers
usage: docker container rm [OPTIONS] CONTAINER [CONTAINER...]
@y
command: docker container rm
aliases: docker container rm, docker container remove, docker rm
short: 1 つまたは複数コンテナーを削除します。
long: 1 つまたは複数コンテナーを削除します。
usage: docker container rm [OPTIONS] CONTAINER [CONTAINER...]
@z

% options:

@x force
      description: Force the removal of a running container (uses SIGKILL)
@y
      description: 実行中コンテナーを強制的に削除します。(SIGKILL を利用)
@z

@x link
      description: Remove the specified link
@y
      description: 指定されたリンクを削除します。
@z

@x volumes
      description: Remove anonymous volumes associated with the container
@y
      description: コンテナーに関連づいた匿名ボリュームを削除します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Remove a container
@y
examples: |-
    ### コンテナーの削除 {#remove-a-container}
@z

@x
    This removes the container referenced under the link `/redis`.
@y
    以下では、リンク `/redis` のもとに参照されているコンテナーを削除します。
@z

% snip command...

@x
    ### Remove a link specified with `--link` on the default bridge network (--link) {#link}
@y
    ### Remove a link specified with `--link` on the default bridge network (--link) {#link}
@z

@x
    This removes the underlying link between `/webapp` and the `/redis`
    containers on the default bridge network, removing all network communication
    between the two containers. This does not apply when `--link` is used with
    user-specified networks.
@y
    This removes the underlying link between `/webapp` and the `/redis`
    containers on the default bridge network, removing all network communication
    between the two containers. This does not apply when `--link` is used with
    user-specified networks.
@z

% snip command...

@x
    ### Force-remove a running container (--force) {#force}
@y
    ### Force-remove a running container (--force) {#force}
@z

@x
    This command force-removes a running container.
@y
    This command force-removes a running container.
@z

% snip command...

@x
    The main process inside the container referenced under the link `redis` will receive
    `SIGKILL`, then the container will be removed.
@y
    The main process inside the container referenced under the link `redis` will receive
    `SIGKILL`, then the container will be removed.
@z

@x
    ### Remove all stopped containers
@y
    ### Remove all stopped containers
@z

@x
    Use the [`docker container prune`](/reference/cli/docker/container/prune/) command to remove all
    stopped containers, or refer to the [`docker system prune`](/reference/cli/docker/system/prune/)
    command to remove unused containers in addition to other Docker resources, such
    as (unused) images and networks.
@y
    Use the [`docker container prune`](__SUBDIR__/reference/cli/docker/container/prune/) command to remove all
    stopped containers, or refer to the [`docker system prune`](__SUBDIR__/reference/cli/docker/system/prune/)
    command to remove unused containers in addition to other Docker resources, such
    as (unused) images and networks.
@z

@x
    Alternatively, you can use the `docker ps` with the `-q` / `--quiet` option to
    generate a list of container IDs to remove, and use that list as argument for
    the `docker rm` command.
@y
    Alternatively, you can use the `docker ps` with the `-q` / `--quiet` option to
    generate a list of container IDs to remove, and use that list as argument for
    the `docker rm` command.
@z

@x
    Combining commands can be more flexible, but is less portable as it depends
    on features provided by the shell, and the exact syntax may differ depending on
    what shell is used. To use this approach on Windows, consider using PowerShell
    or Bash.
@y
    Combining commands can be more flexible, but is less portable as it depends
    on features provided by the shell, and the exact syntax may differ depending on
    what shell is used. To use this approach on Windows, consider using PowerShell
    or Bash.
@z

@x
    The example below uses `docker ps -q` to print the IDs of all containers that
    have exited (`--filter status=exited`), and removes those containers with
    the `docker rm` command:
@y
    The example below uses `docker ps -q` to print the IDs of all containers that
    have exited (`--filter status=exited`), and removes those containers with
    the `docker rm` command:
@z

% snip command...

@x
    Or, using the `xargs` Linux utility:
@y
    Or, using the `xargs` Linux utility:
@z

% snip command...

@x
    ### Remove a container and its volumes (-v, --volumes) {#volumes}
@y
    ### Remove a container and its volumes (-v, --volumes) {#volumes}
@z

% snip command...

@x
    This command removes the container and any volumes associated with it.
    Note that if a volume was specified with a name, it will not be removed.
@y
    This command removes the container and any volumes associated with it.
    Note that if a volume was specified with a name, it will not be removed.
@z

@x
    ### Remove a container and selectively remove volumes
@y
    ### Remove a container and selectively remove volumes
@z

% snip command...

@x
    In this example, the volume for `/foo` remains intact, but the volume for
    `/bar` is removed. The same behavior holds for volumes inherited with
    `--volumes-from`.
@y
    In this example, the volume for `/foo` remains intact, but the volume for
    `/bar` is removed. The same behavior holds for volumes inherited with
    `--volumes-from`.
@z

% snip directives...
