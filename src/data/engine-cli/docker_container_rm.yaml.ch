%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container rm
aliases: docker container rm, docker container remove, docker rm
short: Remove one or more containers
long: Remove one or more containers
usage: docker container rm [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of a running container (uses SIGKILL)
      details_url: '#force'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Remove the specified link
      details_url: '#link'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Remove anonymous volumes associated with the container
      details_url: '#volumes'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Remove a container
@y
command: docker container rm
aliases: docker container rm, docker container remove, docker rm
short: Remove one or more containers
long: Remove one or more containers
usage: docker container rm [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of a running container (uses SIGKILL)
      details_url: '#force'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Remove the specified link
      details_url: '#link'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Remove anonymous volumes associated with the container
      details_url: '#volumes'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Remove a container
@z

@x
    This removes the container referenced under the link `/redis`.
@y
    This removes the container referenced under the link `/redis`.
@z

@x
    ```console
    $ docker rm /redis
@y
    ```console
    $ docker rm /redis
@z

@x
    /redis
    ```
@y
    /redis
    ```
@z

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

@x
    ```console
    $ docker rm --link /webapp/redis
@y
    ```console
    $ docker rm --link /webapp/redis
@z

@x
    /webapp/redis
    ```
@y
    /webapp/redis
    ```
@z

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

@x
    ```console
    $ docker rm --force redis
@y
    ```console
    $ docker rm --force redis
@z

@x
    redis
    ```
@y
    redis
    ```
@z

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

@x
    ```console
    $ docker rm $(docker ps --filter status=exited -q)
    ```
@y
    ```console
    $ docker rm $(docker ps --filter status=exited -q)
    ```
@z

@x
    Or, using the `xargs` Linux utility:
@y
    Or, using the `xargs` Linux utility:
@z

@x
    ```console
    $ docker ps --filter status=exited -q | xargs docker rm
    ```
@y
    ```console
    $ docker ps --filter status=exited -q | xargs docker rm
    ```
@z

@x
    ### Remove a container and its volumes (-v, --volumes) {#volumes}
@y
    ### Remove a container and its volumes (-v, --volumes) {#volumes}
@z

@x
    ```console
    $ docker rm --volumes redis
    redis
    ```
@y
    ```console
    $ docker rm --volumes redis
    redis
    ```
@z

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

@x
    ```console
    $ docker create -v awesome:/foo -v /bar --name hello redis
    hello
@y
    ```console
    $ docker create -v awesome:/foo -v /bar --name hello redis
    hello
@z

@x
    $ docker rm -v hello
    ```
@y
    $ docker rm -v hello
    ```
@z

@x
    In this example, the volume for `/foo` remains intact, but the volume for
    `/bar` is removed. The same behavior holds for volumes inherited with
    `--volumes-from`.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    In this example, the volume for `/foo` remains intact, but the volume for
    `/bar` is removed. The same behavior holds for volumes inherited with
    `--volumes-from`.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
