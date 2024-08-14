%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service update
short: Update a service
long: |-
    Updates a service as described by the specified parameters. The parameters are
    the same as [`docker service create`](/reference/cli/docker/service/create/). Refer to the description
    there for further information.
@y
command: docker service update
short: Update a service
long: |-
    Updates a service as described by the specified parameters. The parameters are
    the same as [`docker service create`](__SUBDIR__/reference/cli/docker/service/create/). Refer to the description
    there for further information.
@z

@x
    Normally, updating a service will only cause the service's tasks to be replaced with new ones if a change to the
    service requires recreating the tasks for it to take effect. For example, only changing the
    `--update-parallelism` setting will not recreate the tasks, because the individual tasks are not affected by this
    setting. However, the `--force` flag will cause the tasks to be recreated anyway. This can be used to perform a
    rolling restart without any changes to the service parameters.
@y
    Normally, updating a service will only cause the service's tasks to be replaced with new ones if a change to the
    service requires recreating the tasks for it to take effect. For example, only changing the
    `--update-parallelism` setting will not recreate the tasks, because the individual tasks are not affected by this
    setting. However, the `--force` flag will cause the tasks to be recreated anyway. This can be used to perform a
    rolling restart without any changes to the service parameters.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
@z

@x
usage: docker service update [OPTIONS] SERVICE
@y
usage: docker service update [OPTIONS] SERVICE
@z

% options:

@x args
      description: Service command args
@y
      description: Service command args
@z

@x cap-add
      description: Add Linux capabilities
@y
      description: Add Linux capabilities
@z

@x cap-drop
      description: Drop Linux capabilities
@y
      description: Drop Linux capabilities
@z

@x config-add
      description: Add or update a config file on a service
@y
      description: Add or update a config file on a service
@z

@x config-rm
      description: Remove a configuration file
@y
      description: Remove a configuration file
@z

@x constraint-add
      description: Add or update a placement constraint
@y
      description: Add or update a placement constraint
@z

@x constraint-rm
      description: Remove a constraint
@y
      description: Remove a constraint
@z

@x container-label-add
      description: Add or update a container label
@y
      description: Add or update a container label
@z

@x container-label-rm
      description: Remove a container label by its key
@y
      description: Remove a container label by its key
@z

@x credential-spec
      description: Credential spec for managed service account (Windows only)
@y
      description: Credential spec for managed service account (Windows only)
@z

@x detach
      description: Exit immediately instead of waiting for the service to converge
@y
      description: Exit immediately instead of waiting for the service to converge
@z

@x dns-add
      description: Add or update a custom DNS server
@y
      description: Add or update a custom DNS server
@z

@x dns-option-add
      description: Add or update a DNS option
@y
      description: Add or update a DNS option
@z

@x dns-option-rm
      description: Remove a DNS option
@y
      description: Remove a DNS option
@z

@x dns-rm
      description: Remove a custom DNS server
@y
      description: Remove a custom DNS server
@z

@x dns-search-add
      description: Add or update a custom DNS search domain
@y
      description: Add or update a custom DNS search domain
@z

@x dns-search-rm
      description: Remove a DNS search domain
@y
      description: Remove a DNS search domain
@z

@x endpoint-mode
      description: Endpoint mode (vip or dnsrr)
@y
      description: Endpoint mode (vip or dnsrr)
@z

@x entrypoint
      description: Overwrite the default ENTRYPOINT of the image
@y
      description: Overwrite the default ENTRYPOINT of the image
@z

@x env-add
      description: Add or update an environment variable
@y
      description: Add or update an environment variable
@z

@x env-rm
      description: Remove an environment variable
@y
      description: Remove an environment variable
@z

@x force
      description: Force update even if no changes require it
@y
      description: Force update even if no changes require it
@z

@x generic-resource-add
      description: Add a Generic resource
@y
      description: Add a Generic resource
@z

@x generic-resource-rm
      description: Remove a Generic resource
@y
      description: Remove a Generic resource
@z

@x group-add
      description: Add an additional supplementary user group to the container
@y
      description: Add an additional supplementary user group to the container
@z

@x group-rm
      description: |
        Remove a previously added supplementary user group from the container
@y
      description: |
        Remove a previously added supplementary user group from the container
@z

@x health-cmd
      description: Command to run to check health
@y
      description: Command to run to check health
@z

@x health-interval
      description: Time between running the check (ms|s|m|h)
@y
      description: Time between running the check (ms|s|m|h)
@z

@x health-retries
      description: Consecutive failures needed to report unhealthy
@y
      description: Consecutive failures needed to report unhealthy
@z

@x health-start-interval
      description: Time between running the check during the start period (ms|s|m|h)
@y
      description: Time between running the check during the start period (ms|s|m|h)
@z

@x health-start-period
      description: |
        Start period for the container to initialize before counting retries towards unstable (ms|s|m|h)
@y
      description: |
        Start period for the container to initialize before counting retries towards unstable (ms|s|m|h)
@z

@x health-timeout
      description: Maximum time to allow one check to run (ms|s|m|h)
@y
      description: Maximum time to allow one check to run (ms|s|m|h)
@z

@x host-add
      description: Add a custom host-to-IP mapping (`host:ip`)
@y
      description: Add a custom host-to-IP mapping (`host:ip`)
@z

@x host-rm
      description: Remove a custom host-to-IP mapping (`host:ip`)
@y
      description: Remove a custom host-to-IP mapping (`host:ip`)
@z

@x hostname
      description: Container hostname
@y
      description: Container hostname
@z

@x image
      description: Service image tag
@y
      description: Service image tag
@z

@x init
      description: |
        Use an init inside each service container to forward signals and reap processes
@y
      description: |
        Use an init inside each service container to forward signals and reap processes
@z

@x isolation
      description: Service container isolation mode
@y
      description: Service container isolation mode
@z

@x label-add
      description: Add or update a service label
@y
      description: Add or update a service label
@z

@x label-rm
      description: Remove a label by its key
@y
      description: Remove a label by its key
@z

@x limit-cpu
      description: Limit CPUs
@y
      description: Limit CPUs
@z

@x limit-memory
      description: Limit Memory
@y
      description: Limit Memory
@z

@x limit-pids
      description: Limit maximum number of processes (default 0 = unlimited)
@y
      description: Limit maximum number of processes (default 0 = unlimited)
@z

@x log-driver
      description: Logging driver for service
@y
      description: Logging driver for service
@z

@x log-opt
      description: Logging driver options
@y
      description: Logging driver options
@z

@x max-concurrent
      description: |
        Number of job tasks to run concurrently (default equal to --replicas)
@y
      description: |
        Number of job tasks to run concurrently (default equal to --replicas)
@z

@x mount-add
      description: Add or update a mount on a service
@y
      description: Add or update a mount on a service
@z

@x mount-rm
      description: Remove a mount by its target path
@y
      description: Remove a mount by its target path
@z

@x network-add
      description: Add a network
@y
      description: Add a network
@z

@x network-rm
      description: Remove a network
@y
      description: Remove a network
@z

@x no-healthcheck
      description: Disable any container-specified HEALTHCHECK
@y
      description: Disable any container-specified HEALTHCHECK
@z

@x no-resolve-image
      description: |
        Do not query the registry to resolve image digest and supported platforms
@y
      description: |
        Do not query the registry to resolve image digest and supported platforms
@z

@x placement-pref-add
      description: Add a placement preference
@y
      description: Add a placement preference
@z

@x placement-pref-rm
      description: Remove a placement preference
@y
      description: Remove a placement preference
@z

@x publish-add
      description: Add or update a published port
@y
      description: Add or update a published port
@z

@x publish-rm
      description: Remove a published port by its target port
@y
      description: Remove a published port by its target port
@z

@x quiet
      description: Suppress progress output
@y
      description: Suppress progress output
@z

@x read-only
      description: Mount the container's root filesystem as read only
@y
      description: Mount the container's root filesystem as read only
@z

@x replicas
      description: Number of tasks
@y
      description: Number of tasks
@z

@x replicas-max-per-node
      description: Maximum number of tasks per node (default 0 = unlimited)
@y
      description: Maximum number of tasks per node (default 0 = unlimited)
@z

@x reserve-cpu
      description: Reserve CPUs
@y
      description: Reserve CPUs
@z

@x reserve-memory
      description: Reserve Memory
@y
      description: Reserve Memory
@z

@x restart-condition
      description: Restart when condition is met (`none`, `on-failure`, `any`)
@y
      description: Restart when condition is met (`none`, `on-failure`, `any`)
@z

@x restart-delay
      description: Delay between restart attempts (ns|us|ms|s|m|h)
@y
      description: Delay between restart attempts (ns|us|ms|s|m|h)
@z

@x restart-max-attempts
      description: Maximum number of restarts before giving up
@y
      description: Maximum number of restarts before giving up
@z

@x restart-window
      description: Window used to evaluate the restart policy (ns|us|ms|s|m|h)
@y
      description: Window used to evaluate the restart policy (ns|us|ms|s|m|h)
@z

@x rollback
      description: Rollback to previous specification
@y
      description: Rollback to previous specification
@z

@x rollback-delay
      description: Delay between task rollbacks (ns|us|ms|s|m|h)
@y
      description: Delay between task rollbacks (ns|us|ms|s|m|h)
@z

@x rollback-failure-action
      description: Action on rollback failure (`pause`, `continue`)
@y
      description: Action on rollback failure (`pause`, `continue`)
@z

@x rollback-max-failure-ratio
      description: Failure rate to tolerate during a rollback
@y
      description: Failure rate to tolerate during a rollback
@z

@x rollback-monitor
      description: |
        Duration after each task rollback to monitor for failure (ns|us|ms|s|m|h)
@y
      description: |
        Duration after each task rollback to monitor for failure (ns|us|ms|s|m|h)
@z

@x rollback-order
      description: Rollback order (`start-first`, `stop-first`)
@y
      description: Rollback order (`start-first`, `stop-first`)
@z

@x rollback-parallelism
      description: |
        Maximum number of tasks rolled back simultaneously (0 to roll back all at once)
@y
      description: |
        Maximum number of tasks rolled back simultaneously (0 to roll back all at once)
@z

@x secret-add
      description: Add or update a secret on a service
@y
      description: Add or update a secret on a service
@z

@x secret-rm
      description: Remove a secret
@y
      description: Remove a secret
@z

@x stop-grace-period
      description: Time to wait before force killing a container (ns|us|ms|s|m|h)
@y
      description: Time to wait before force killing a container (ns|us|ms|s|m|h)
@z

@x stop-signal
      description: Signal to stop the container
@y
      description: Signal to stop the container
@z

@x sysctl-add
      description: Add or update a Sysctl option
@y
      description: Add or update a Sysctl option
@z

@x sysctl-rm
      description: Remove a Sysctl option
@y
      description: Remove a Sysctl option
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: Allocate a pseudo-TTY
@z

@x ulimit-add
      description: Add or update a ulimit option
@y
      description: Add or update a ulimit option
@z

@x ulimit-rm
      description: Remove a ulimit option
@y
      description: Remove a ulimit option
@z

@x update-delay
      description: Delay between updates (ns|us|ms|s|m|h)
@y
      description: Delay between updates (ns|us|ms|s|m|h)
@z

@x update-failure-action
      description: Action on update failure (`pause`, `continue`, `rollback`)
@y
      description: Action on update failure (`pause`, `continue`, `rollback`)
@z

@x update-max-failure-ratio
      description: Failure rate to tolerate during an update
@y
      description: Failure rate to tolerate during an update
@z

@x update-monitor
      description: |
        Duration after each task update to monitor for failure (ns|us|ms|s|m|h)
@y
      description: |
        Duration after each task update to monitor for failure (ns|us|ms|s|m|h)
@z

@x update-order
      description: Update order (`start-first`, `stop-first`)
@y
      description: Update order (`start-first`, `stop-first`)
@z

@x update-parallelism
      description: |
        Maximum number of tasks updated simultaneously (0 to update all at once)
@y
      description: |
        Maximum number of tasks updated simultaneously (0 to update all at once)
@z

@x user
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@y
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@z

@x with-registry-auth
      description: Send registry authentication details to swarm agents
@y
      description: Send registry authentication details to swarm agents
@z

@x workdir
      description: Working directory inside the container
@y
      description: Working directory inside the container
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Update a service
@y
examples: |-
    ### Update a service
@z

@x
    ```console
    $ docker service update --limit-cpu 2 redis
    ```
@y
    ```console
    $ docker service update --limit-cpu 2 redis
    ```
@z

@x
    ### Perform a rolling restart with no parameter changes {#update-parallelism}
@y
    ### Perform a rolling restart with no parameter changes {#update-parallelism}
@z

@x
    ```console
    $ docker service update --force --update-parallelism 1 --update-delay 30s redis
    ```
@y
    ```console
    $ docker service update --force --update-parallelism 1 --update-delay 30s redis
    ```
@z

@x
    In this example, the `--force` flag causes the service's tasks to be shut down
    and replaced with new ones even though none of the other parameters would
    normally cause that to happen. The `--update-parallelism 1` setting ensures
    that only one task is replaced at a time (this is the default behavior). The
    `--update-delay 30s` setting introduces a 30 second delay between tasks, so
    that the rolling restart happens gradually.
@y
    In this example, the `--force` flag causes the service's tasks to be shut down
    and replaced with new ones even though none of the other parameters would
    normally cause that to happen. The `--update-parallelism 1` setting ensures
    that only one task is replaced at a time (this is the default behavior). The
    `--update-delay 30s` setting introduces a 30 second delay between tasks, so
    that the rolling restart happens gradually.
@z

@x
    ### Add or remove mounts (--mount-add, --mount-rm) {#mount-add}
@y
    ### Add or remove mounts (--mount-add, --mount-rm) {#mount-add}
@z

@x
    Use the `--mount-add` or `--mount-rm` options add or remove a service's bind mounts
    or volumes.
@y
    Use the `--mount-add` or `--mount-rm` options add or remove a service's bind mounts
    or volumes.
@z

@x
    The following example creates a service which mounts the `test-data` volume to
    `/somewhere`. The next step updates the service to also mount the `other-volume`
    volume to `/somewhere-else`volume, The last step unmounts the `/somewhere` mount
    point, effectively removing the `test-data` volume. Each command returns the
    service name.
@y
    The following example creates a service which mounts the `test-data` volume to
    `/somewhere`. The next step updates the service to also mount the `other-volume`
    volume to `/somewhere-else`volume, The last step unmounts the `/somewhere` mount
    point, effectively removing the `test-data` volume. Each command returns the
    service name.
@z

@x
    - The `--mount-add` flag takes the same parameters as the `--mount` flag on
      `service create`. Refer to the [volumes and bind mounts](/reference/cli/docker/service/create/#mount)
      section in the `service create` reference for details.
@y
    - The `--mount-add` flag takes the same parameters as the `--mount` flag on
      `service create`. Refer to the [volumes and bind mounts](__SUBDIR__/reference/cli/docker/service/create/#mount)
      section in the `service create` reference for details.
@z

@x
    - The `--mount-rm` flag takes the `target` path of the mount.
@y
    - The `--mount-rm` flag takes the `target` path of the mount.
@z

@x
    ```console
    $ docker service create \
        --name=myservice \
        --mount type=volume,source=test-data,target=/somewhere \
        nginx:alpine
@y
    ```console
    $ docker service create \
        --name=myservice \
        --mount type=volume,source=test-data,target=/somewhere \
        nginx:alpine
@z

@x
    myservice
@y
    myservice
@z

@x
    $ docker service update \
        --mount-add type=volume,source=other-volume,target=/somewhere-else \
        myservice
@y
    $ docker service update \
        --mount-add type=volume,source=other-volume,target=/somewhere-else \
        myservice
@z

@x
    myservice
@y
    myservice
@z

@x
    $ docker service update --mount-rm /somewhere myservice
@y
    $ docker service update --mount-rm /somewhere myservice
@z

@x
    myservice
    ```
@y
    myservice
    ```
@z

@x
    ### Add or remove published service ports (--publish-add, --publish-rm) {#publish-add}
@y
    ### Add or remove published service ports (--publish-add, --publish-rm) {#publish-add}
@z

@x
    Use the `--publish-add` or `--publish-rm` flags to add or remove a published
    port for a service. You can use the short or long syntax discussed in the
    [docker service create](/reference/cli/docker/service/create/#publish)
    reference.
@y
    Use the `--publish-add` or `--publish-rm` flags to add or remove a published
    port for a service. You can use the short or long syntax discussed in the
    [docker service create](__SUBDIR__/reference/cli/docker/service/create/#publish)
    reference.
@z

@x
    The following example adds a published service port to an existing service.
@y
    The following example adds a published service port to an existing service.
@z

@x
    ```console
    $ docker service update \
      --publish-add published=8080,target=80 \
      myservice
    ```
@y
    ```console
    $ docker service update \
      --publish-add published=8080,target=80 \
      myservice
    ```
@z

@x
    ### Add or remove network (--network-add, --network-rm) {#network-add}
@y
    ### Add or remove network (--network-add, --network-rm) {#network-add}
@z

@x
    Use the `--network-add` or `--network-rm` flags to add or remove a network for
    a service. You can use the short or long syntax discussed in the
    [docker service create](/reference/cli/docker/service/create/#network)
    reference.
@y
    Use the `--network-add` or `--network-rm` flags to add or remove a network for
    a service. You can use the short or long syntax discussed in the
    [docker service create](__SUBDIR__/reference/cli/docker/service/create/#network)
    reference.
@z

@x
    The following example adds a new alias name to an existing service already connected to network my-network:
@y
    The following example adds a new alias name to an existing service already connected to network my-network:
@z

@x
    ```console
    $ docker service update \
      --network-rm my-network \
      --network-add name=my-network,alias=web1 \
      myservice
    ```
@y
    ```console
    $ docker service update \
      --network-rm my-network \
      --network-add name=my-network,alias=web1 \
      myservice
    ```
@z

@x
    ### Roll back to the previous version of a service (--rollback) {#rollback}
@y
    ### Roll back to the previous version of a service (--rollback) {#rollback}
@z

@x
    Use the `--rollback` option to roll back to the previous version of the service.
@y
    Use the `--rollback` option to roll back to the previous version of the service.
@z

@x
    This will revert the service to the configuration that was in place before the most recent `docker service update` command.
@y
    This will revert the service to the configuration that was in place before the most recent `docker service update` command.
@z

@x
    The following example updates the number of replicas for the service from 4 to 5, and then rolls back to the previous configuration.
@y
    The following example updates the number of replicas for the service from 4 to 5, and then rolls back to the previous configuration.
@z

@x
    ```console
    $ docker service update --replicas=5 web
@y
    ```console
    $ docker service update --replicas=5 web
@z

@x
    web
@y
    web
@z

@x
    $ docker service ls
@y
    $ docker service ls
@z

@x
    ID            NAME  MODE        REPLICAS  IMAGE
    80bvrzp6vxf3  web   replicated  0/5       nginx:alpine
@y
    ID            NAME  MODE        REPLICAS  IMAGE
    80bvrzp6vxf3  web   replicated  0/5       nginx:alpine
@z

@x
    ```
@y
    ```
@z

@x
    The following example rolls back the `web` service:
@y
    The following example rolls back the `web` service:
@z

@x
    ```console
    $ docker service update --rollback web
@y
    ```console
    $ docker service update --rollback web
@z

@x
    web
@y
    web
@z

@x
    $ docker service ls
@y
    $ docker service ls
@z

@x
    ID            NAME  MODE        REPLICAS  IMAGE
    80bvrzp6vxf3  web   replicated  0/4       nginx:alpine
@y
    ID            NAME  MODE        REPLICAS  IMAGE
    80bvrzp6vxf3  web   replicated  0/4       nginx:alpine
@z

@x
    ```
@y
    ```
@z

@x
    Other options can be combined with `--rollback` as well, for example, `--update-delay 0s` to execute the rollback without a delay between tasks:
@y
    Other options can be combined with `--rollback` as well, for example, `--update-delay 0s` to execute the rollback without a delay between tasks:
@z

@x
    ```console
    $ docker service update \
      --rollback \
      --update-delay 0s
      web
@y
    ```console
    $ docker service update \
      --rollback \
      --update-delay 0s
      web
@z

@x
    web
@y
    web
@z

@x
    ```
@y
    ```
@z

@x
    Services can also be set up to roll back to the previous version automatically
    when an update fails. To set up a service for automatic rollback, use
    `--update-failure-action=rollback`. A rollback will be triggered if the fraction
    of the tasks which failed to update successfully exceeds the value given with
    `--update-max-failure-ratio`.
@y
    Services can also be set up to roll back to the previous version automatically
    when an update fails. To set up a service for automatic rollback, use
    `--update-failure-action=rollback`. A rollback will be triggered if the fraction
    of the tasks which failed to update successfully exceeds the value given with
    `--update-max-failure-ratio`.
@z

@x
    The rate, parallelism, and other parameters of a rollback operation are
    determined by the values passed with the following flags:
@y
    The rate, parallelism, and other parameters of a rollback operation are
    determined by the values passed with the following flags:
@z

@x
    - `--rollback-delay`
    - `--rollback-failure-action`
    - `--rollback-max-failure-ratio`
    - `--rollback-monitor`
    - `--rollback-parallelism`
@y
    - `--rollback-delay`
    - `--rollback-failure-action`
    - `--rollback-max-failure-ratio`
    - `--rollback-monitor`
    - `--rollback-parallelism`
@z

@x
    For example, a service set up with `--update-parallelism 1 --rollback-parallelism 3`
    will update one task at a time during a normal update, but during a rollback, 3
    tasks at a time will get rolled back. These rollback parameters are respected both
    during automatic rollbacks and for rollbacks initiated manually using `--rollback`.
@y
    For example, a service set up with `--update-parallelism 1 --rollback-parallelism 3`
    will update one task at a time during a normal update, but during a rollback, 3
    tasks at a time will get rolled back. These rollback parameters are respected both
    during automatic rollbacks and for rollbacks initiated manually using `--rollback`.
@z

@x
    ### Add or remove secrets (--secret-add, --secret-rm) {#secret-add}
@y
    ### Add or remove secrets (--secret-add, --secret-rm) {#secret-add}
@z

@x
    Use the `--secret-add` or `--secret-rm` options add or remove a service's
    secrets.
@y
    Use the `--secret-add` or `--secret-rm` options add or remove a service's
    secrets.
@z

@x
    The following example adds a secret named `ssh-2` and removes `ssh-1`:
@y
    The following example adds a secret named `ssh-2` and removes `ssh-1`:
@z

@x
    ```console
    $ docker service update \
        --secret-add source=ssh-2,target=ssh-2 \
        --secret-rm ssh-1 \
        myservice
    ```
@y
    ```console
    $ docker service update \
        --secret-add source=ssh-2,target=ssh-2 \
        --secret-rm ssh-1 \
        myservice
    ```
@z

@x
    ### Update services using templates
@y
    ### Update services using templates
@z

@x
    Some flags of `service update` support the use of templating.
    See [`service create`](/reference/cli/docker/service/create/#create-services-using-templates) for the reference.
@y
    Some flags of `service update` support the use of templating.
    See [`service create`](__SUBDIR__/reference/cli/docker/service/create/#create-services-using-templates) for the reference.
@z

@x
    ### Specify isolation mode on Windows (--isolation) {#isolation}
@y
    ### Specify isolation mode on Windows (--isolation) {#isolation}
@z

@x
    `service update` supports the same `--isolation` flag as `service create`
    See [`service create`](/reference/cli/docker/service/create/) for the reference.
@y
    `service update` supports the same `--isolation` flag as `service create`
    See [`service create`](__SUBDIR__/reference/cli/docker/service/create/) for the reference.
@z

@x
    ### Updating Jobs
@y
    ### Updating Jobs
@z

@x
    When a service is created as a job, by setting its mode to `replicated-job` or
    to `global-job` when doing `service create`, options for updating it are
    limited.
@y
    When a service is created as a job, by setting its mode to `replicated-job` or
    to `global-job` when doing `service create`, options for updating it are
    limited.
@z

@x
    Updating a Job immediately stops any Tasks that are in progress. The operation
    creates a new set of Tasks for the job and effectively resets its completion
    status. If any Tasks were running before the update, they are stopped, and new
    Tasks are created.
@y
    Updating a Job immediately stops any Tasks that are in progress. The operation
    creates a new set of Tasks for the job and effectively resets its completion
    status. If any Tasks were running before the update, they are stopped, and new
    Tasks are created.
@z

@x
    Jobs cannot be rolled out or rolled back. None of the flags for configuring
    update or rollback settings are valid with job modes.
@y
    Jobs cannot be rolled out or rolled back. None of the flags for configuring
    update or rollback settings are valid with job modes.
@z

@x
    To run a job again with the same parameters that it was run previously, it can
    be force updated with the `--force` flag.
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    To run a job again with the same parameters that it was run previously, it can
    be force updated with the `--force` flag.
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
