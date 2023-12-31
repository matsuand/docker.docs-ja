%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker swarm init
short: Initialize a swarm
long: |-
    Initialize a swarm. The docker engine targeted by this command becomes a manager
    in the newly created single-node swarm.
usage: docker swarm init [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: advertise-addr
      value_type: string
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: autolock
      value_type: bool
      default_value: "false"
      description: |
        Enable manager autolocking (requiring an unlock key to start a stopped manager)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: availability
      value_type: string
      default_value: active
      description: Availability of the node (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cert-expiry
      value_type: duration
      default_value: 2160h0m0s
      description: Validity period for node certificates (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: data-path-addr
      value_type: string
      description: |
        Address or interface to use for data path traffic (format: `<ip|interface>`)
      deprecated: false
      hidden: false
      min_api_version: "1.31"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: data-path-port
      value_type: uint32
      default_value: "0"
      description: |
        Port number to use for data path traffic (1024 - 49151). If no value is set or is set to 0, the default port (4789) is used.
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: default-addr-pool
      value_type: ipNetSlice
      default_value: '[]'
      description: default address pool in CIDR format
      deprecated: false
      hidden: false
      min_api_version: "1.39"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: default-addr-pool-mask-length
      value_type: uint32
      default_value: "24"
      description: default address pool subnet mask length
      deprecated: false
      hidden: false
      min_api_version: "1.39"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dispatcher-heartbeat
      value_type: duration
      default_value: 5s
      description: Dispatcher heartbeat period (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: external-ca
      value_type: external-ca
      description: Specifications of one or more certificate signing endpoints
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-new-cluster
      value_type: bool
      default_value: "false"
      description: Force create a new cluster from current state
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: listen-addr
      value_type: node-addr
      default_value: 0.0.0.0:2377
      description: 'Listen address (format: `<ip|interface>[:port]`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: max-snapshots
      value_type: uint64
      default_value: "0"
      description: Number of additional Raft snapshots to retain
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: snapshot-interval
      value_type: uint64
      default_value: "10000"
      description: Number of log entries between Raft snapshots
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: task-history-limit
      value_type: int64
      default_value: "5"
      description: Task history retention limit
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
    ```console
    $ docker swarm init --advertise-addr 192.168.99.121
@y
command: docker swarm init
short: Initialize a swarm
long: |-
    Initialize a swarm. The docker engine targeted by this command becomes a manager
    in the newly created single-node swarm.
usage: docker swarm init [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: advertise-addr
      value_type: string
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: autolock
      value_type: bool
      default_value: "false"
      description: |
        Enable manager autolocking (requiring an unlock key to start a stopped manager)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: availability
      value_type: string
      default_value: active
      description: Availability of the node (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cert-expiry
      value_type: duration
      default_value: 2160h0m0s
      description: Validity period for node certificates (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: data-path-addr
      value_type: string
      description: |
        Address or interface to use for data path traffic (format: `<ip|interface>`)
      deprecated: false
      hidden: false
      min_api_version: "1.31"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: data-path-port
      value_type: uint32
      default_value: "0"
      description: |
        Port number to use for data path traffic (1024 - 49151). If no value is set or is set to 0, the default port (4789) is used.
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: default-addr-pool
      value_type: ipNetSlice
      default_value: '[]'
      description: default address pool in CIDR format
      deprecated: false
      hidden: false
      min_api_version: "1.39"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: default-addr-pool-mask-length
      value_type: uint32
      default_value: "24"
      description: default address pool subnet mask length
      deprecated: false
      hidden: false
      min_api_version: "1.39"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dispatcher-heartbeat
      value_type: duration
      default_value: 5s
      description: Dispatcher heartbeat period (ns|us|ms|s|m|h)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: external-ca
      value_type: external-ca
      description: Specifications of one or more certificate signing endpoints
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-new-cluster
      value_type: bool
      default_value: "false"
      description: Force create a new cluster from current state
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: listen-addr
      value_type: node-addr
      default_value: 0.0.0.0:2377
      description: 'Listen address (format: `<ip|interface>[:port]`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: max-snapshots
      value_type: uint64
      default_value: "0"
      description: Number of additional Raft snapshots to retain
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: snapshot-interval
      value_type: uint64
      default_value: "10000"
      description: Number of log entries between Raft snapshots
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: task-history-limit
      value_type: int64
      default_value: "5"
      description: Task history retention limit
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
    ```console
    $ docker swarm init --advertise-addr 192.168.99.121
@z

@x
    Swarm initialized: current node (bvz81updecsj6wjz393c09vti) is now a manager.
@y
    Swarm initialized: current node (bvz81updecsj6wjz393c09vti) is now a manager.
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx \
        172.17.0.2:2377
@y
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx \
        172.17.0.2:2377
@z

@x
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@y
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@z

@x
    `docker swarm init` generates two random tokens, a worker token and a manager token. When you join
    a new node to the swarm, the node joins as a worker or manager node based upon the token you pass
    to [swarm join](swarm_join.md).
@y
    `docker swarm init` generates two random tokens, a worker token and a manager token. When you join
    a new node to the swarm, the node joins as a worker or manager node based upon the token you pass
    to [swarm join](swarm_join.md).
@z

@x
    After you create the swarm, you can display or rotate the token using
    [swarm join-token](swarm_join-token.md).
@y
    After you create the swarm, you can display or rotate the token using
    [swarm join-token](swarm_join-token.md).
@z

@x
    ### `--autolock`
@y
    ### `--autolock`
@z

@x
    This flag enables automatic locking of managers with an encryption key. The
    private keys and data stored by all managers will be protected by the
    encryption key printed in the output, and will not be accessible without it.
    Thus, it is very important to store this key in order to activate a manager
    after it restarts. The key can be passed to `docker swarm unlock` to reactivate
    the manager. Autolock can be disabled by running
    `docker swarm update --autolock=false`. After disabling it, the encryption key
    is no longer required to start the manager, and it will start up on its own
    without user intervention.
@y
    This flag enables automatic locking of managers with an encryption key. The
    private keys and data stored by all managers will be protected by the
    encryption key printed in the output, and will not be accessible without it.
    Thus, it is very important to store this key in order to activate a manager
    after it restarts. The key can be passed to `docker swarm unlock` to reactivate
    the manager. Autolock can be disabled by running
    `docker swarm update --autolock=false`. After disabling it, the encryption key
    is no longer required to start the manager, and it will start up on its own
    without user intervention.
@z

@x
    ### `--cert-expiry`
@y
    ### `--cert-expiry`
@z

@x
    This flag sets the validity period for node certificates.
@y
    This flag sets the validity period for node certificates.
@z

@x
    ### `--dispatcher-heartbeat`
@y
    ### `--dispatcher-heartbeat`
@z

@x
    This flag sets the frequency with which nodes are told to use as a
    period to report their health.
@y
    This flag sets the frequency with which nodes are told to use as a
    period to report their health.
@z

@x
    ### `--external-ca`
@y
    ### `--external-ca`
@z

@x
    This flag sets up the swarm to use an external CA to issue node certificates. The value takes
    the form `protocol=X,url=Y`. The value for `protocol` specifies what protocol should be used
    to send signing requests to the external CA. Currently, the only supported value is `cfssl`.
    The URL specifies the endpoint where signing requests should be submitted.
@y
    This flag sets up the swarm to use an external CA to issue node certificates. The value takes
    the form `protocol=X,url=Y`. The value for `protocol` specifies what protocol should be used
    to send signing requests to the external CA. Currently, the only supported value is `cfssl`.
    The URL specifies the endpoint where signing requests should be submitted.
@z

@x
    ### `--force-new-cluster`
@y
    ### `--force-new-cluster`
@z

@x
    This flag forces an existing node that was part of a quorum that was lost to restart as a single node Manager without losing its data.
@y
    This flag forces an existing node that was part of a quorum that was lost to restart as a single node Manager without losing its data.
@z

@x
    ### `--listen-addr`
@y
    ### `--listen-addr`
@z

@x
    The node listens for inbound swarm manager traffic on this address. The default is to listen on
    0.0.0.0:2377. It is also possible to specify a network interface to listen on that interface's
    address; for example `--listen-addr eth0:2377`.
@y
    The node listens for inbound swarm manager traffic on this address. The default is to listen on
    0.0.0.0:2377. It is also possible to specify a network interface to listen on that interface's
    address; for example `--listen-addr eth0:2377`.
@z

@x
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 will be used.
@y
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 will be used.
@z

@x
    ### `--advertise-addr`
@y
    ### `--advertise-addr`
@z

@x
    This flag specifies the address that will be advertised to other members of the
    swarm for API access and overlay networking. If unspecified, Docker will check
    if the system has a single IP address, and use that IP address with the
    listening port (see `--listen-addr`). If the system has multiple IP addresses,
    `--advertise-addr` must be specified so that the correct address is chosen for
    inter-manager communication and overlay networking.
@y
    This flag specifies the address that will be advertised to other members of the
    swarm for API access and overlay networking. If unspecified, Docker will check
    if the system has a single IP address, and use that IP address with the
    listening port (see `--listen-addr`). If the system has multiple IP addresses,
    `--advertise-addr` must be specified so that the correct address is chosen for
    inter-manager communication and overlay networking.
@z

@x
    It is also possible to specify a network interface to advertise that interface's address;
    for example `--advertise-addr eth0:2377`.
@y
    It is also possible to specify a network interface to advertise that interface's address;
    for example `--advertise-addr eth0:2377`.
@z

@x
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 will be used.
@y
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 will be used.
@z

@x
    ### `--data-path-addr`
@y
    ### `--data-path-addr`
@z

@x
    This flag specifies the address that global scope network drivers will publish towards
    other nodes in order to reach the containers running on this node.
    Using this parameter it is then possible to separate the container's data traffic from the
    management traffic of the cluster.
    If unspecified, Docker will use the same IP address or interface that is used for the
    advertise address.
@y
    This flag specifies the address that global scope network drivers will publish towards
    other nodes in order to reach the containers running on this node.
    Using this parameter it is then possible to separate the container's data traffic from the
    management traffic of the cluster.
    If unspecified, Docker will use the same IP address or interface that is used for the
    advertise address.
@z

@x
    ### `--data-path-port`
@y
    ### `--data-path-port`
@z

@x
    This flag allows you to configure the UDP port number to use for data path
    traffic. The provided port number must be within the 1024 - 49151 range. If
    this flag is not set or is set to 0, the default port number 4789 is used.
    The data path port can only be configured when initializing the swarm, and
    applies to all nodes that join the swarm.
    The following example initializes a new Swarm, and configures the data path
    port to UDP port 7777;
@y
    This flag allows you to configure the UDP port number to use for data path
    traffic. The provided port number must be within the 1024 - 49151 range. If
    this flag is not set or is set to 0, the default port number 4789 is used.
    The data path port can only be configured when initializing the swarm, and
    applies to all nodes that join the swarm.
    The following example initializes a new Swarm, and configures the data path
    port to UDP port 7777;
@z

@x
    ```console
    $ docker swarm init --data-path-port=7777
    ```
@y
    ```console
    $ docker swarm init --data-path-port=7777
    ```
@z

@x
    After the swarm is initialized, use the `docker info` command to verify that
    the port is configured:
@y
    After the swarm is initialized, use the `docker info` command to verify that
    the port is configured:
@z

@x
    ```console
    $ docker info
    <...>
    ClusterID: 9vs5ygs0gguyyec4iqf2314c0
    Managers: 1
    Nodes: 1
    Data Path Port: 7777
    <...>
    ```
@y
    ```console
    $ docker info
    <...>
    ClusterID: 9vs5ygs0gguyyec4iqf2314c0
    Managers: 1
    Nodes: 1
    Data Path Port: 7777
    <...>
    ```
@z

@x
    ### `--default-addr-pool`
    This flag specifies default subnet pools for global scope networks.
    Format example is `--default-addr-pool 30.30.0.0/16 --default-addr-pool 40.40.0.0/16`
@y
    ### `--default-addr-pool`
    This flag specifies default subnet pools for global scope networks.
    Format example is `--default-addr-pool 30.30.0.0/16 --default-addr-pool 40.40.0.0/16`
@z

@x
    ### `--default-addr-pool-mask-length`
    This flag specifies default subnet pools mask length for default-addr-pool.
    Format example is `--default-addr-pool-mask-length 24`
@y
    ### `--default-addr-pool-mask-length`
    This flag specifies default subnet pools mask length for default-addr-pool.
    Format example is `--default-addr-pool-mask-length 24`
@z

@x
    ### `--task-history-limit`
@y
    ### `--task-history-limit`
@z

@x
    This flag sets up task history retention limit.
@y
    This flag sets up task history retention limit.
@z

@x
    ### `--max-snapshots`
@y
    ### `--max-snapshots`
@z

@x
    This flag sets the number of old Raft snapshots to retain in addition to the
    current Raft snapshots. By default, no old snapshots are retained. This option
    may be used for debugging, or to store old snapshots of the swarm state for
    disaster recovery purposes.
@y
    This flag sets the number of old Raft snapshots to retain in addition to the
    current Raft snapshots. By default, no old snapshots are retained. This option
    may be used for debugging, or to store old snapshots of the swarm state for
    disaster recovery purposes.
@z

@x
    ### `--snapshot-interval`
@y
    ### `--snapshot-interval`
@z

@x
    This flag specifies how many log entries to allow in between Raft snapshots.
    Setting this to a higher number will trigger snapshots less frequently.
    Snapshots compact the Raft log and allow for more efficient transfer of the
    state to new managers. However, there is a performance cost to taking snapshots
    frequently.
@y
    This flag specifies how many log entries to allow in between Raft snapshots.
    Setting this to a higher number will trigger snapshots less frequently.
    Snapshots compact the Raft log and allow for more efficient transfer of the
    state to new managers. However, there is a performance cost to taking snapshots
    frequently.
@z

@x
    ### `--availability`
@y
    ### `--availability`
@z

@x
    This flag specifies the availability of the node at the time the node joins a master.
    Possible availability values are `active`, `pause`, or `drain`.
@y
    This flag specifies the availability of the node at the time the node joins a master.
    Possible availability values are `active`, `pause`, or `drain`.
@z

@x
    This flag is useful in certain situations. For example, a cluster may want to have
    dedicated manager nodes that are not served as worker nodes. This could be achieved
    by passing `--availability=drain` to `docker swarm init`.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    This flag is useful in certain situations. For example, a cluster may want to have
    dedicated manager nodes that are not served as worker nodes. This could be achieved
    by passing `--availability=drain` to `docker swarm init`.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
