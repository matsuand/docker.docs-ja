%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker service update
short: Update a service
long: |-
    Updates a service as described by the specified parameters. The parameters are
    the same as [`docker service create`](service_create.md). Refer to the description
    there for further information.
@y
command: docker service update
short: Update a service
long: |-
    Updates a service as described by the specified parameters. The parameters are
    the same as [`docker service create`](service_create.md). Refer to the description
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
usage: docker service update [OPTIONS] SERVICE
pname: docker service
plink: docker_service.yaml
options:
    - option: args
      value_type: command
      description: Service command args
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-add
      value_type: list
      description: Add Linux capabilities
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-drop
      value_type: list
      description: Drop Linux capabilities
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-add
      value_type: config
      description: Add or update a config file on a service
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-rm
      value_type: list
      description: Remove a configuration file
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: constraint-add
      value_type: list
      description: Add or update a placement constraint
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: constraint-rm
      value_type: list
      description: Remove a constraint
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: container-label-add
      value_type: list
      description: Add or update a container label
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: container-label-rm
      value_type: list
      description: Remove a container label by its key
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: credential-spec
      value_type: credential-spec
      description: Credential spec for managed service account (Windows only)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Exit immediately instead of waiting for the service to converge
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-add
      value_type: list
      description: Add or update a custom DNS server
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-option-add
      value_type: list
      description: Add or update a DNS option
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-option-rm
      value_type: list
      description: Remove a DNS option
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-rm
      value_type: list
      description: Remove a custom DNS server
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-search-add
      value_type: list
      description: Add or update a custom DNS search domain
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-search-rm
      value_type: list
      description: Remove a DNS search domain
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: endpoint-mode
      value_type: string
      description: Endpoint mode (vip or dnsrr)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: entrypoint
      value_type: command
      description: Overwrite the default ENTRYPOINT of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-add
      value_type: list
      description: Add or update an environment variable
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-rm
      value_type: list
      description: Remove an environment variable
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      value_type: bool
      default_value: "false"
      description: Force update even if no changes require it
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: generic-resource-add
      value_type: list
      description: Add a Generic resource
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: generic-resource-rm
      value_type: list
      description: Remove a Generic resource
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group-add
      value_type: list
      description: Add an additional supplementary user group to the container
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group-rm
      value_type: list
      description: |
        Remove a previously added supplementary user group from the container
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-cmd
      value_type: string
      description: Command to run to check health
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-interval
      value_type: duration
      description: Time between running the check (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-retries
      value_type: int
      default_value: "0"
      description: Consecutive failures needed to report unhealthy
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-interval
      value_type: duration
      description: Time between running the check during the start period (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.44"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-period
      value_type: duration
      description: |
        Start period for the container to initialize before counting retries towards unstable (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-timeout
      value_type: duration
      description: Maximum time to allow one check to run (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: host-add
      value_type: list
      description: Add a custom host-to-IP mapping (`host:ip`)
      deprecated: false
      hidden: false
      min_api_version: "1.32"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: host-rm
      value_type: list
      description: Remove a custom host-to-IP mapping (`host:ip`)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hostname
      value_type: string
      description: Container hostname
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: image
      value_type: string
      description: Service image tag
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: init
      value_type: bool
      default_value: "false"
      description: |
        Use an init inside each service container to forward signals and reap processes
      deprecated: false
      hidden: false
      min_api_version: "1.37"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: isolation
      value_type: string
      description: Service container isolation mode
      details_url: '#isolation'
      deprecated: false
      hidden: false
      min_api_version: "1.35"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-add
      value_type: list
      description: Add or update a service label
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-rm
      value_type: list
      description: Remove a label by its key
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-cpu
      value_type: decimal
      description: Limit CPUs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-memory
      value_type: bytes
      default_value: "0"
      description: Limit Memory
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-pids
      value_type: int64
      default_value: "0"
      description: Limit maximum number of processes (default 0 = unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-driver
      value_type: string
      description: Logging driver for service
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-opt
      value_type: list
      description: Logging driver options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: max-concurrent
      value_type: uint
      description: |
        Number of job tasks to run concurrently (default equal to --replicas)
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mount-add
      value_type: mount
      description: Add or update a mount on a service
      details_url: '#mount-add'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mount-rm
      value_type: list
      description: Remove a mount by its target path
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network-add
      value_type: network
      description: Add a network
      details_url: '#network-add'
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network-rm
      value_type: list
      description: Remove a network
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-healthcheck
      value_type: bool
      default_value: "false"
      description: Disable any container-specified HEALTHCHECK
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-resolve-image
      value_type: bool
      default_value: "false"
      description: |
        Do not query the registry to resolve image digest and supported platforms
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: placement-pref-add
      value_type: pref
      description: Add a placement preference
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: placement-pref-rm
      value_type: pref
      description: Remove a placement preference
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish-add
      value_type: port
      description: Add or update a published port
      details_url: '#publish-add'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish-rm
      value_type: port
      description: Remove a published port by its target port
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress progress output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: read-only
      value_type: bool
      default_value: "false"
      description: Mount the container's root filesystem as read only
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: replicas
      value_type: uint
      description: Number of tasks
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: replicas-max-per-node
      value_type: uint64
      default_value: "0"
      description: Maximum number of tasks per node (default 0 = unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: reserve-cpu
      value_type: decimal
      description: Reserve CPUs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: reserve-memory
      value_type: bytes
      default_value: "0"
      description: Reserve Memory
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-condition
      value_type: string
      description: Restart when condition is met (`none`, `on-failure`, `any`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-delay
      value_type: duration
      description: Delay between restart attempts (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-max-attempts
      value_type: uint
      description: Maximum number of restarts before giving up
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-window
      value_type: duration
      description: Window used to evaluate the restart policy (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback
      value_type: bool
      default_value: "false"
      description: Rollback to previous specification
      details_url: '#rollback'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-delay
      value_type: duration
      default_value: 0s
      description: Delay between task rollbacks (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-failure-action
      value_type: string
      description: Action on rollback failure (`pause`, `continue`)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-max-failure-ratio
      value_type: float
      default_value: "0"
      description: Failure rate to tolerate during a rollback
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-monitor
      value_type: duration
      default_value: 0s
      description: |
        Duration after each task rollback to monitor for failure (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-order
      value_type: string
      description: Rollback order (`start-first`, `stop-first`)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-parallelism
      value_type: uint64
      default_value: "0"
      description: |
        Maximum number of tasks rolled back simultaneously (0 to roll back all at once)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: secret-add
      value_type: secret
      description: Add or update a secret on a service
      details_url: '#secret-add'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: secret-rm
      value_type: list
      description: Remove a secret
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-grace-period
      value_type: duration
      description: Time to wait before force killing a container (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-signal
      value_type: string
      description: Signal to stop the container
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sysctl-add
      value_type: list
      description: Add or update a Sysctl option
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sysctl-rm
      value_type: list
      description: Remove a Sysctl option
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tty
      shorthand: t
      value_type: bool
      default_value: "false"
      description: Allocate a pseudo-TTY
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit-add
      value_type: ulimit
      default_value: '[]'
      description: Add or update a ulimit option
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit-rm
      value_type: list
      description: Remove a ulimit option
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-delay
      value_type: duration
      default_value: 0s
      description: Delay between updates (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-failure-action
      value_type: string
      description: Action on update failure (`pause`, `continue`, `rollback`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-max-failure-ratio
      value_type: float
      default_value: "0"
      description: Failure rate to tolerate during an update
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-monitor
      value_type: duration
      default_value: 0s
      description: |
        Duration after each task update to monitor for failure (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-order
      value_type: string
      description: Update order (`start-first`, `stop-first`)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-parallelism
      value_type: uint64
      default_value: "0"
      description: |
        Maximum number of tasks updated simultaneously (0 to update all at once)
      details_url: '#update-parallelism'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: user
      shorthand: u
      value_type: string
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: with-registry-auth
      value_type: bool
      default_value: "false"
      description: Send registry authentication details to swarm agents
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      shorthand: w
      value_type: string
      description: Working directory inside the container
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
    ### Update a service
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service update [OPTIONS] SERVICE
pname: docker service
plink: docker_service.yaml
options:
    - option: args
      value_type: command
      description: Service command args
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-add
      value_type: list
      description: Add Linux capabilities
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-drop
      value_type: list
      description: Drop Linux capabilities
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-add
      value_type: config
      description: Add or update a config file on a service
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-rm
      value_type: list
      description: Remove a configuration file
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: constraint-add
      value_type: list
      description: Add or update a placement constraint
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: constraint-rm
      value_type: list
      description: Remove a constraint
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: container-label-add
      value_type: list
      description: Add or update a container label
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: container-label-rm
      value_type: list
      description: Remove a container label by its key
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: credential-spec
      value_type: credential-spec
      description: Credential spec for managed service account (Windows only)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Exit immediately instead of waiting for the service to converge
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-add
      value_type: list
      description: Add or update a custom DNS server
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-option-add
      value_type: list
      description: Add or update a DNS option
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-option-rm
      value_type: list
      description: Remove a DNS option
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-rm
      value_type: list
      description: Remove a custom DNS server
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-search-add
      value_type: list
      description: Add or update a custom DNS search domain
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-search-rm
      value_type: list
      description: Remove a DNS search domain
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: endpoint-mode
      value_type: string
      description: Endpoint mode (vip or dnsrr)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: entrypoint
      value_type: command
      description: Overwrite the default ENTRYPOINT of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-add
      value_type: list
      description: Add or update an environment variable
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-rm
      value_type: list
      description: Remove an environment variable
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      value_type: bool
      default_value: "false"
      description: Force update even if no changes require it
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: generic-resource-add
      value_type: list
      description: Add a Generic resource
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: generic-resource-rm
      value_type: list
      description: Remove a Generic resource
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group-add
      value_type: list
      description: Add an additional supplementary user group to the container
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group-rm
      value_type: list
      description: |
        Remove a previously added supplementary user group from the container
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-cmd
      value_type: string
      description: Command to run to check health
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-interval
      value_type: duration
      description: Time between running the check (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-retries
      value_type: int
      default_value: "0"
      description: Consecutive failures needed to report unhealthy
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-interval
      value_type: duration
      description: Time between running the check during the start period (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.44"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-period
      value_type: duration
      description: |
        Start period for the container to initialize before counting retries towards unstable (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-timeout
      value_type: duration
      description: Maximum time to allow one check to run (ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: host-add
      value_type: list
      description: Add a custom host-to-IP mapping (`host:ip`)
      deprecated: false
      hidden: false
      min_api_version: "1.32"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: host-rm
      value_type: list
      description: Remove a custom host-to-IP mapping (`host:ip`)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hostname
      value_type: string
      description: Container hostname
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: image
      value_type: string
      description: Service image tag
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: init
      value_type: bool
      default_value: "false"
      description: |
        Use an init inside each service container to forward signals and reap processes
      deprecated: false
      hidden: false
      min_api_version: "1.37"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: isolation
      value_type: string
      description: Service container isolation mode
      details_url: '#isolation'
      deprecated: false
      hidden: false
      min_api_version: "1.35"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-add
      value_type: list
      description: Add or update a service label
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-rm
      value_type: list
      description: Remove a label by its key
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-cpu
      value_type: decimal
      description: Limit CPUs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-memory
      value_type: bytes
      default_value: "0"
      description: Limit Memory
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-pids
      value_type: int64
      default_value: "0"
      description: Limit maximum number of processes (default 0 = unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-driver
      value_type: string
      description: Logging driver for service
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-opt
      value_type: list
      description: Logging driver options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: max-concurrent
      value_type: uint
      description: |
        Number of job tasks to run concurrently (default equal to --replicas)
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mount-add
      value_type: mount
      description: Add or update a mount on a service
      details_url: '#mount-add'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mount-rm
      value_type: list
      description: Remove a mount by its target path
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network-add
      value_type: network
      description: Add a network
      details_url: '#network-add'
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network-rm
      value_type: list
      description: Remove a network
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-healthcheck
      value_type: bool
      default_value: "false"
      description: Disable any container-specified HEALTHCHECK
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-resolve-image
      value_type: bool
      default_value: "false"
      description: |
        Do not query the registry to resolve image digest and supported platforms
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: placement-pref-add
      value_type: pref
      description: Add a placement preference
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: placement-pref-rm
      value_type: pref
      description: Remove a placement preference
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish-add
      value_type: port
      description: Add or update a published port
      details_url: '#publish-add'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish-rm
      value_type: port
      description: Remove a published port by its target port
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress progress output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: read-only
      value_type: bool
      default_value: "false"
      description: Mount the container's root filesystem as read only
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: replicas
      value_type: uint
      description: Number of tasks
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: replicas-max-per-node
      value_type: uint64
      default_value: "0"
      description: Maximum number of tasks per node (default 0 = unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: reserve-cpu
      value_type: decimal
      description: Reserve CPUs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: reserve-memory
      value_type: bytes
      default_value: "0"
      description: Reserve Memory
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-condition
      value_type: string
      description: Restart when condition is met (`none`, `on-failure`, `any`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-delay
      value_type: duration
      description: Delay between restart attempts (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-max-attempts
      value_type: uint
      description: Maximum number of restarts before giving up
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart-window
      value_type: duration
      description: Window used to evaluate the restart policy (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback
      value_type: bool
      default_value: "false"
      description: Rollback to previous specification
      details_url: '#rollback'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-delay
      value_type: duration
      default_value: 0s
      description: Delay between task rollbacks (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-failure-action
      value_type: string
      description: Action on rollback failure (`pause`, `continue`)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-max-failure-ratio
      value_type: float
      default_value: "0"
      description: Failure rate to tolerate during a rollback
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-monitor
      value_type: duration
      default_value: 0s
      description: |
        Duration after each task rollback to monitor for failure (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-order
      value_type: string
      description: Rollback order (`start-first`, `stop-first`)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rollback-parallelism
      value_type: uint64
      default_value: "0"
      description: |
        Maximum number of tasks rolled back simultaneously (0 to roll back all at once)
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: secret-add
      value_type: secret
      description: Add or update a secret on a service
      details_url: '#secret-add'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: secret-rm
      value_type: list
      description: Remove a secret
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-grace-period
      value_type: duration
      description: Time to wait before force killing a container (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-signal
      value_type: string
      description: Signal to stop the container
      deprecated: false
      hidden: false
      min_api_version: "1.28"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sysctl-add
      value_type: list
      description: Add or update a Sysctl option
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sysctl-rm
      value_type: list
      description: Remove a Sysctl option
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tty
      shorthand: t
      value_type: bool
      default_value: "false"
      description: Allocate a pseudo-TTY
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit-add
      value_type: ulimit
      default_value: '[]'
      description: Add or update a ulimit option
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit-rm
      value_type: list
      description: Remove a ulimit option
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-delay
      value_type: duration
      default_value: 0s
      description: Delay between updates (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-failure-action
      value_type: string
      description: Action on update failure (`pause`, `continue`, `rollback`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-max-failure-ratio
      value_type: float
      default_value: "0"
      description: Failure rate to tolerate during an update
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-monitor
      value_type: duration
      default_value: 0s
      description: |
        Duration after each task update to monitor for failure (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-order
      value_type: string
      description: Update order (`start-first`, `stop-first`)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: update-parallelism
      value_type: uint64
      default_value: "0"
      description: |
        Maximum number of tasks updated simultaneously (0 to update all at once)
      details_url: '#update-parallelism'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: user
      shorthand: u
      value_type: string
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: with-registry-auth
      value_type: bool
      default_value: "false"
      description: Send registry authentication details to swarm agents
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      shorthand: w
      value_type: string
      description: Working directory inside the container
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
      `service create`. Refer to the [volumes and bind mounts](service_create.md#mount)
      section in the `service create` reference for details.
@y
    - The `--mount-add` flag takes the same parameters as the `--mount` flag on
      `service create`. Refer to the [volumes and bind mounts](service_create.md#mount)
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
    [docker service create](service_create.md#publish)
    reference.
@y
    Use the `--publish-add` or `--publish-rm` flags to add or remove a published
    port for a service. You can use the short or long syntax discussed in the
    [docker service create](service_create.md#publish)
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
    [docker service create](service_create.md#network)
    reference.
@y
    Use the `--network-add` or `--network-rm` flags to add or remove a network for
    a service. You can use the short or long syntax discussed in the
    [docker service create](service_create.md#network)
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
    See [`service create`](service_create.md#create-services-using-templates) for the reference.
@y
    Some flags of `service update` support the use of templating.
    See [`service create`](service_create.md#create-services-using-templates) for the reference.
@z

@x
    ### Specify isolation mode on Windows (--isolation) {#isolation}
@y
    ### Specify isolation mode on Windows (--isolation) {#isolation}
@z

@x
    `service update` supports the same `--isolation` flag as `service create`
    See [`service create`](service_create.md) for the reference.
@y
    `service update` supports the same `--isolation` flag as `service create`
    See [`service create`](service_create.md) for the reference.
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
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    To run a job again with the same parameters that it was run previously, it can
    be force updated with the `--force` flag.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
