%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker swarm init
short: Initialize a swarm
long: |-
    Initialize a swarm. The Docker Engine targeted by this command becomes a manager
    in the newly created single-node swarm.
usage: docker swarm init [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: advertise-addr
      value_type: string
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
      details_url: '#advertise-addr'
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
      details_url: '#autolock'
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
      details_url: '#availability'
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
      details_url: '#data-path-addr'
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
      details_url: '#data-path-port'
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
      details_url: '#default-addr-pool'
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
      details_url: '#external-ca'
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
      details_url: '#force-new-cluster'
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
      details_url: '#listen-addr'
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
      details_url: '#max-snapshots'
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
      details_url: '#snapshot-interval'
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
    Initialize a swarm. The Docker Engine targeted by this command becomes a manager
    in the newly created single-node swarm.
usage: docker swarm init [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: advertise-addr
      value_type: string
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
      details_url: '#advertise-addr'
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
      details_url: '#autolock'
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
      details_url: '#availability'
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
      details_url: '#data-path-addr'
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
      details_url: '#data-path-port'
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
      details_url: '#default-addr-pool'
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
      details_url: '#external-ca'
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
      details_url: '#force-new-cluster'
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
      details_url: '#listen-addr'
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
      details_url: '#max-snapshots'
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
      details_url: '#snapshot-interval'
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
        docker swarm join --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx 172.17.0.2:2377
@y
        docker swarm join --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx 172.17.0.2:2377
@z

@x
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@y
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@z

@x
    The `docker swarm init` command generates two random tokens: a worker token and
    a manager token. When you join a new node to the swarm, the node joins as a
    worker or manager node based upon the token you pass to [swarm
    join](swarm_join.md).
@y
    The `docker swarm init` command generates two random tokens: a worker token and
    a manager token. When you join a new node to the swarm, the node joins as a
    worker or manager node based upon the token you pass to [swarm
    join](swarm_join.md).
@z

@x
    After you create the swarm, you can display or rotate the token using
    [swarm join-token](swarm_join-token.md).
@y
    After you create the swarm, you can display or rotate the token using
    [swarm join-token](swarm_join-token.md).
@z

@x
    ### Protect manager keys and data (--autolock) {#autolock}
@y
    ### Protect manager keys and data (--autolock) {#autolock}
@z

@x
    The `--autolock` flag enables automatic locking of managers with an encryption
    key. The private keys and data stored by all managers are protected by the
    encryption key printed in the output, and is inaccessible without it. Make sure
    to store this key securely, in order to reactivate a manager after it restarts.
    Pass the key to the `docker swarm unlock` command to reactivate the manager.
    You can disable autolock by running `docker swarm update --autolock=false`.
    After disabling it, the encryption key is no longer required to start the
    manager, and it will start up on its own without user intervention.
@y
    The `--autolock` flag enables automatic locking of managers with an encryption
    key. The private keys and data stored by all managers are protected by the
    encryption key printed in the output, and is inaccessible without it. Make sure
    to store this key securely, in order to reactivate a manager after it restarts.
    Pass the key to the `docker swarm unlock` command to reactivate the manager.
    You can disable autolock by running `docker swarm update --autolock=false`.
    After disabling it, the encryption key is no longer required to start the
    manager, and it will start up on its own without user intervention.
@z

@x
    ### <a name=""></a> Configure node healthcheck frequency (--dispatcher-heartbeat)
@y
    ### <a name=""></a> Configure node healthcheck frequency (--dispatcher-heartbeat)
@z

@x
    The `--dispatcher-heartbeat` flag sets the frequency at which nodes are told to
    report their health.
@y
    The `--dispatcher-heartbeat` flag sets the frequency at which nodes are told to
    report their health.
@z

@x
    ### Use an external certificate authority (--external-ca) {#external-ca}
@y
    ### Use an external certificate authority (--external-ca) {#external-ca}
@z

@x
    This flag sets up the swarm to use an external CA to issue node certificates.
    The value takes the form `protocol=X,url=Y`. The value for `protocol` specifies
    what protocol should be used to send signing requests to the external CA.
    Currently, the only supported value is `cfssl`. The URL specifies the endpoint
    where signing requests should be submitted.
@y
    This flag sets up the swarm to use an external CA to issue node certificates.
    The value takes the form `protocol=X,url=Y`. The value for `protocol` specifies
    what protocol should be used to send signing requests to the external CA.
    Currently, the only supported value is `cfssl`. The URL specifies the endpoint
    where signing requests should be submitted.
@z

@x
    ### Force-restart node as a single-mode manager (--force-new-cluster) {#force-new-cluster}
@y
    ### Force-restart node as a single-mode manager (--force-new-cluster) {#force-new-cluster}
@z

@x
    This flag forces an existing node that was part of a quorum that was lost to
    restart as a single-node Manager without losing its data.
@y
    This flag forces an existing node that was part of a quorum that was lost to
    restart as a single-node Manager without losing its data.
@z

@x
    ### Specify interface for inbound control plane traffic (--listen-addr) {#listen-addr}
@y
    ### Specify interface for inbound control plane traffic (--listen-addr) {#listen-addr}
@z

@x
    The node listens for inbound swarm manager traffic on this address. The default
    is to listen on `0.0.0.0:2377`. It is also possible to specify a network
    interface to listen on that interface's address; for example `--listen-addr
    eth0:2377`.
@y
    The node listens for inbound swarm manager traffic on this address. The default
    is to listen on `0.0.0.0:2377`. It is also possible to specify a network
    interface to listen on that interface's address; for example `--listen-addr
    eth0:2377`.
@z

@x
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 is used.
@y
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 is used.
@z

@x
    ### Specify interface for outbound control plane traffic (--advertise-addr) {#advertise-addr}
@y
    ### Specify interface for outbound control plane traffic (--advertise-addr) {#advertise-addr}
@z

@x
    The `--advertise-addr` flag specifies the address that will be advertised to
    other members of the swarm for API access and overlay networking. If
    unspecified, Docker will check if the system has a single IP address, and use
    that IP address with the listening port (see `--listen-addr`). If the system
    has multiple IP addresses, `--advertise-addr` must be specified so that the
    correct address is chosen for inter-manager communication and overlay
    networking.
@y
    The `--advertise-addr` flag specifies the address that will be advertised to
    other members of the swarm for API access and overlay networking. If
    unspecified, Docker will check if the system has a single IP address, and use
    that IP address with the listening port (see `--listen-addr`). If the system
    has multiple IP addresses, `--advertise-addr` must be specified so that the
    correct address is chosen for inter-manager communication and overlay
    networking.
@z

@x
    It is also possible to specify a network interface to advertise that
    interface's address; for example `--advertise-addr eth0:2377`.
@y
    It is also possible to specify a network interface to advertise that
    interface's address; for example `--advertise-addr eth0:2377`.
@z

@x
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 is used.
@y
    Specifying a port is optional. If the value is a bare IP address or interface
    name, the default port 2377 is used.
@z

@x
    ### Specify interface for data traffic (--data-path-addr) {#data-path-addr}
@y
    ### Specify interface for data traffic (--data-path-addr) {#data-path-addr}
@z

@x
    The `--data-path-addr` flag specifies the address that global scope network
    drivers will publish towards other nodes in order to reach the containers
    running on this node. Using this parameter you can separate the container's
    data traffic from the management traffic of the cluster.
@y
    The `--data-path-addr` flag specifies the address that global scope network
    drivers will publish towards other nodes in order to reach the containers
    running on this node. Using this parameter you can separate the container's
    data traffic from the management traffic of the cluster.
@z

@x
    If unspecified, the IP address or interface of the advertise address is used.
@y
    If unspecified, the IP address or interface of the advertise address is used.
@z

@x
    ### Configure port number for data traffic (--data-path-port) {#data-path-port}
@y
    ### Configure port number for data traffic (--data-path-port) {#data-path-port}
@z

@x
    The `--data-path-port` flag allows you to configure the UDP port number to use
    for data path traffic. The provided port number must be within the 1024 - 49151
    range. If this flag isn't set, or if it's set to 0, the default port number
    4789 is used. The data path port can only be configured when initializing the
    swarm, and applies to all nodes that join the swarm. The following example
    initializes a new Swarm, and configures the data path port to UDP port 7777;
@y
    The `--data-path-port` flag allows you to configure the UDP port number to use
    for data path traffic. The provided port number must be within the 1024 - 49151
    range. If this flag isn't set, or if it's set to 0, the default port number
    4789 is used. The data path port can only be configured when initializing the
    swarm, and applies to all nodes that join the swarm. The following example
    initializes a new Swarm, and configures the data path port to UDP port 7777;
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
    ### Specify default subnet pools (--default-addr-pool) {#default-addr-pool}
@y
    ### Specify default subnet pools (--default-addr-pool) {#default-addr-pool}
@z

@x
    The `--default-addr-pool` flag specifies default subnet pools for global scope
    networks. For example, to specify two address pools:
@y
    The `--default-addr-pool` flag specifies default subnet pools for global scope
    networks. For example, to specify two address pools:
@z

@x
    ```console
    $ docker swarm init \
      --default-addr-pool 30.30.0.0/16 \
      --default-addr-pool 40.40.0.0/16
    ```
@y
    ```console
    $ docker swarm init \
      --default-addr-pool 30.30.0.0/16 \
      --default-addr-pool 40.40.0.0/16
    ```
@z

@x
    Use the `--default-addr-pool-mask-length` flag to specify the default subnet
    pools mask length for the subnet pools.
@y
    Use the `--default-addr-pool-mask-length` flag to specify the default subnet
    pools mask length for the subnet pools.
@z

@x
    ### Set limit for number of snapshots to keep (--max-snapshots) {#max-snapshots}
@y
    ### Set limit for number of snapshots to keep (--max-snapshots) {#max-snapshots}
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
    ### Configure Raft snapshot log interval (--snapshot-interval) {#snapshot-interval}
@y
    ### Configure Raft snapshot log interval (--snapshot-interval) {#snapshot-interval}
@z

@x
    The `--snapshot-interval` flag specifies how many log entries to allow in
    between Raft snapshots. Setting this to a high number will trigger snapshots
    less frequently. Snapshots compact the Raft log and allow for more efficient
    transfer of the state to new managers. However, there is a performance cost to
    taking snapshots frequently.
@y
    The `--snapshot-interval` flag specifies how many log entries to allow in
    between Raft snapshots. Setting this to a high number will trigger snapshots
    less frequently. Snapshots compact the Raft log and allow for more efficient
    transfer of the state to new managers. However, there is a performance cost to
    taking snapshots frequently.
@z

@x
    ### Configure the availability of a manager (--availability) {#availability}
@y
    ### Configure the availability of a manager (--availability) {#availability}
@z

@x
    The `--availability` flag specifies the availability of the node at the time
    the node joins a master. Possible availability values are `active`, `pause`, or
    `drain`.
@y
    The `--availability` flag specifies the availability of the node at the time
    the node joins a master. Possible availability values are `active`, `pause`, or
    `drain`.
@z

@x
    This flag is useful in certain situations. For example, a cluster may want to
    have dedicated manager nodes that don't serve as worker nodes. You can do this
    by passing `--availability=drain` to `docker swarm init`.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    This flag is useful in certain situations. For example, a cluster may want to
    have dedicated manager nodes that don't serve as worker nodes. You can do this
    by passing `--availability=drain` to `docker swarm init`.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
