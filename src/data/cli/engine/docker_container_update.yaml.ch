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
    > [!WARNING]
    > The `docker update` and `docker container update` commands are not supported
    > for Windows containers.
@y
    > [!WARNING]
    > The `docker update` and `docker container update` commands are not supported
    > for Windows containers.
@z

@x
usage: docker container update [OPTIONS] CONTAINER [CONTAINER...]
@y
usage: docker container update [OPTIONS] CONTAINER [CONTAINER...]
@z

% options:

@x blkio-weight
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
@y
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
@z

@x cpu-period
      description: Limit CPU CFS (Completely Fair Scheduler) period
@y
      description: Limit CPU CFS (Completely Fair Scheduler) period
@z

@x cpu-quota
      description: Limit CPU CFS (Completely Fair Scheduler) quota
@y
      description: Limit CPU CFS (Completely Fair Scheduler) quota
@z

@x cpu-rt-period
      description: Limit the CPU real-time period in microseconds
@y
      description: Limit the CPU real-time period in microseconds
@z

@x cpu-rt-runtime
      description: Limit the CPU real-time runtime in microseconds
@y
      description: Limit the CPU real-time runtime in microseconds
@z

@x cpu-shares
      description: CPU shares (relative weight)
@y
      description: CPU shares (relative weight)
@z

@x cpus
      description: Number of CPUs
@y
      description: Number of CPUs
@z

@x cpuset-cpus
      description: CPUs in which to allow execution (0-3, 0,1)
@y
      description: CPUs in which to allow execution (0-3, 0,1)
@z

@x cpuset-mems
      description: MEMs in which to allow execution (0-3, 0,1)
@y
      description: MEMs in which to allow execution (0-3, 0,1)
@z

@x kernel-memory
      description: Kernel memory limit (deprecated)
@y
      description: Kernel memory limit (deprecated)
@z

@x memory
      description: Memory limit
@y
      description: Memory limit
@z

@x memory-reservation
      description: Memory soft limit
@y
      description: Memory soft limit
@z

@x memory-swap
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
@y
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
@z

@x pids-limit
      description: Tune container pids limit (set -1 for unlimited)
@y
      description: Tune container pids limit (set -1 for unlimited)
@z

@x restart
      description: Restart policy to apply when a container exits
@y
      description: Restart policy to apply when a container exits
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    The following sections illustrate ways to use this command.
@y
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
@y
    Note that if the container is started with `--rm` flag, you cannot update the restart
    policy for it. The `AutoRemove` and `RestartPolicy` are mutually exclusive for the
    container.
@z

% snip directives...
