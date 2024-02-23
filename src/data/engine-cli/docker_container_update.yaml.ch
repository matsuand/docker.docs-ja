%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container update
aliases: docker container update, docker update
short: Update configuration of one or more containers
long: |-
    The `docker update` command dynamically updates container configuration.
    You can use this command to prevent containers from consuming too many
    resources from their Docker host.  With a single command, you can place
    limits on a single container or on many. To specify more than one container,
    provide space-separated list of container names or IDs.
@y
command: docker container update
aliases: docker container update, docker update
short: Update configuration of one or more containers
long: |-
    The `docker update` command dynamically updates container configuration.
    You can use this command to prevent containers from consuming too many
    resources from their Docker host.  With a single command, you can place
    limits on a single container or on many. To specify more than one container,
    provide space-separated list of container names or IDs.
@z

@x
    With the exception of the `--kernel-memory` option, you can specify these
    options on a running or a stopped container. On kernel version older than
    4.6, you can only update `--kernel-memory` on a stopped container or on
    a running container with kernel memory initialized.
@y
    With the exception of the `--kernel-memory` option, you can specify these
    options on a running or a stopped container. On kernel version older than
    4.6, you can only update `--kernel-memory` on a stopped container or on
    a running container with kernel memory initialized.
@z

@x
    > **Warning**
    >
    > The `docker update` and `docker container update` commands are not supported
    > for Windows containers.
    { .warning }
usage: docker container update [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: blkio-weight
      value_type: uint16
      default_value: "0"
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time period in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-runtime
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time runtime in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      details_url: '#cpu-shares'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpus
      value_type: decimal
      description: Number of CPUs
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: kernel-memory
      value_type: bytes
      default_value: "0"
      description: Kernel memory limit (deprecated)
      details_url: '#kernel-memory'
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: Memory limit
      details_url: '#memory'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-reservation
      value_type: bytes
      default_value: "0"
      description: Memory soft limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pids-limit
      value_type: int64
      default_value: "0"
      description: Tune container pids limit (set -1 for unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart
      value_type: string
      description: Restart policy to apply when a container exits
      details_url: '#restart'
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
    The following sections illustrate ways to use this command.
@y
    > **Warning**
    >
    > The `docker update` and `docker container update` commands are not supported
    > for Windows containers.
    { .warning }
usage: docker container update [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: blkio-weight
      value_type: uint16
      default_value: "0"
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time period in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-runtime
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time runtime in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      details_url: '#cpu-shares'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpus
      value_type: decimal
      description: Number of CPUs
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: kernel-memory
      value_type: bytes
      default_value: "0"
      description: Kernel memory limit (deprecated)
      details_url: '#kernel-memory'
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: Memory limit
      details_url: '#memory'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-reservation
      value_type: bytes
      default_value: "0"
      description: Memory soft limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pids-limit
      value_type: int64
      default_value: "0"
      description: Tune container pids limit (set -1 for unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart
      value_type: string
      description: Restart policy to apply when a container exits
      details_url: '#restart'
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
    The following sections illustrate ways to use this command.
@z

@x
    ### Update a container's cpu-shares (--cpu-shares) {#cpu-shares}
@y
    ### Update a container's cpu-shares (--cpu-shares) {#cpu-shares}
@z

@x
    To limit a container's cpu-shares to 512, first identify the container
    name or ID. You can use `docker ps` to find these values. You can also
    use the ID returned from the `docker run` command.  Then, do the following:
@y
    To limit a container's cpu-shares to 512, first identify the container
    name or ID. You can use `docker ps` to find these values. You can also
    use the ID returned from the `docker run` command.  Then, do the following:
@z

@x
    ```console
    $ docker update --cpu-shares 512 abebf7571666
    ```
@y
    ```console
    $ docker update --cpu-shares 512 abebf7571666
    ```
@z

@x
    ### Update a container with cpu-shares and memory (-m, --memory) {#memory}
@y
    ### Update a container with cpu-shares and memory (-m, --memory) {#memory}
@z

@x
    To update multiple resource configurations for multiple containers:
@y
    To update multiple resource configurations for multiple containers:
@z

@x
    ```console
    $ docker update --cpu-shares 512 -m 300M abebf7571666 hopeful_morse
    ```
@y
    ```console
    $ docker update --cpu-shares 512 -m 300M abebf7571666 hopeful_morse
    ```
@z

@x
    ### Update a container's kernel memory constraints (--kernel-memory) {#kernel-memory}
@y
    ### Update a container's kernel memory constraints (--kernel-memory) {#kernel-memory}
@z

@x
    You can update a container's kernel memory limit using the `--kernel-memory`
    option. On kernel version older than 4.6, this option can be updated on a
    running container only if the container was started with `--kernel-memory`.
    If the container was started without `--kernel-memory` you need to stop
    the container before updating kernel memory.
@y
    You can update a container's kernel memory limit using the `--kernel-memory`
    option. On kernel version older than 4.6, this option can be updated on a
    running container only if the container was started with `--kernel-memory`.
    If the container was started without `--kernel-memory` you need to stop
    the container before updating kernel memory.
@z

@x
    > **Note**
    >
    > The `--kernel-memory` option has been deprecated since Docker 20.10.
@y
    > **Note**
    >
    > The `--kernel-memory` option has been deprecated since Docker 20.10.
@z

@x
    For example, if you started a container with this command:
@y
    For example, if you started a container with this command:
@z

@x
    ```console
    $ docker run -dit --name test --kernel-memory 50M ubuntu bash
    ```
@y
    ```console
    $ docker run -dit --name test --kernel-memory 50M ubuntu bash
    ```
@z

@x
    You can update kernel memory while the container is running:
@y
    You can update kernel memory while the container is running:
@z

@x
    ```console
    $ docker update --kernel-memory 80M test
    ```
@y
    ```console
    $ docker update --kernel-memory 80M test
    ```
@z

@x
    If you started a container without kernel memory initialized:
@y
    If you started a container without kernel memory initialized:
@z

@x
    ```console
    $ docker run -dit --name test2 --memory 300M ubuntu bash
    ```
@y
    ```console
    $ docker run -dit --name test2 --memory 300M ubuntu bash
    ```
@z

@x
    Update kernel memory of running container `test2` will fail. You need to stop
    the container before updating the `--kernel-memory` setting. The next time you
    start it, the container uses the new value.
@y
    Update kernel memory of running container `test2` will fail. You need to stop
    the container before updating the `--kernel-memory` setting. The next time you
    start it, the container uses the new value.
@z

@x
    Kernel version newer than (include) 4.6 does not have this limitation, you
    can use `--kernel-memory` the same way as other options.
@y
    Kernel version newer than (include) 4.6 does not have this limitation, you
    can use `--kernel-memory` the same way as other options.
@z

@x
    ### Update a container's restart policy (--restart) {#restart}
@y
    ### Update a container's restart policy (--restart) {#restart}
@z

@x
    You can change a container's restart policy on a running container. The new
    restart policy takes effect instantly after you run `docker update` on a
    container.
@y
    You can change a container's restart policy on a running container. The new
    restart policy takes effect instantly after you run `docker update` on a
    container.
@z

@x
    To update restart policy for one or more containers:
@y
    To update restart policy for one or more containers:
@z

@x
    ```console
    $ docker update --restart=on-failure:3 abebf7571666 hopeful_morse
    ```
@y
    ```console
    $ docker update --restart=on-failure:3 abebf7571666 hopeful_morse
    ```
@z

@x
    Note that if the container is started with `--rm` flag, you cannot update the restart
    policy for it. The `AutoRemove` and `RestartPolicy` are mutually exclusive for the
    container.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Note that if the container is started with `--rm` flag, you cannot update the restart
    policy for it. The `AutoRemove` and `RestartPolicy` are mutually exclusive for the
    container.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
