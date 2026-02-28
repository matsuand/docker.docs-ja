%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm init
short: Initialize a swarm
long: |-
    Initialize a swarm. The Docker Engine targeted by this command becomes a manager
    in the newly created single-node swarm.
usage: docker swarm init [OPTIONS]
@y
command: docker swarm init
short: Initialize a swarm
long: |-
    Initialize a swarm. The Docker Engine targeted by this command becomes a manager
    in the newly created single-node swarm.
usage: docker swarm init [OPTIONS]
@z

% options:

@x advertise-addr
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
@y
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
@z

@x autolock
      description: |
        Enable manager autolocking (requiring an unlock key to start a stopped manager)
@y
      description: |
        Enable manager autolocking (requiring an unlock key to start a stopped manager)
@z

@x availability
      description: Availability of the node (`active`, `pause`, `drain`)
@y
      description: Availability of the node (`active`, `pause`, `drain`)
@z

@x cert-expiry
      description: Validity period for node certificates (ns|us|ms|s|m|h)
@y
      description: Validity period for node certificates (ns|us|ms|s|m|h)
@z

@x data-path-addr
      description: |
        Address or interface to use for data path traffic (format: `<ip|interface>`)
@y
      description: |
        Address or interface to use for data path traffic (format: `<ip|interface>`)
@z

@x data-path-port
      description: |
        Port number to use for data path traffic (1024 - 49151). If no value is set or is set to 0, the default port (4789) is used.
@y
      description: |
        Port number to use for data path traffic (1024 - 49151). If no value is set or is set to 0, the default port (4789) is used.
@z

@x default-addr-pool
      description: default address pool in CIDR format
@y
      description: default address pool in CIDR format
@z

@x default-addr-pool-mask-length
      description: default address pool subnet mask length
@y
      description: default address pool subnet mask length
@z

@x dispatcher-heartbeat
      description: Dispatcher heartbeat period (ns|us|ms|s|m|h)
@y
      description: Dispatcher heartbeat period (ns|us|ms|s|m|h)
@z

@x external-ca
      description: Specifications of one or more certificate signing endpoints
@y
      description: Specifications of one or more certificate signing endpoints
@z

@x force-new-cluster
      description: Force create a new cluster from current state
@y
      description: Force create a new cluster from current state
@z

@x listen-addr
      description: 'Listen address (format: `<ip|interface>[:port]`)'
@y
      description: 'Listen address (format: `<ip|interface>[:port]`)'
@z

@x max-snapshots
      description: Number of additional Raft snapshots to retain
@y
      description: Number of additional Raft snapshots to retain
@z

@x snapshot-interval
      description: Number of log entries between Raft snapshots
@y
      description: Number of log entries between Raft snapshots
@z

@x task-history-limit
      description: Task history retention limit
@y
      description: Task history retention limit
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...

@x
    The `docker swarm init` command generates two random tokens: a worker token and
    a manager token. When you join a new node to the swarm, the node joins as a
    worker or manager node based upon the token you pass to [swarm
    join](/reference/cli/docker/swarm/join/).
@y
    The `docker swarm init` command generates two random tokens: a worker token and
    a manager token. When you join a new node to the swarm, the node joins as a
    worker or manager node based upon the token you pass to [swarm
    join](__SUBDIR__/reference/cli/docker/swarm/join/).
@z

@x
    After you create the swarm, you can display or rotate the token using
    [swarm join-token](/reference/cli/docker/swarm/join-token/).
@y
    After you create the swarm, you can display or rotate the token using
    [swarm join-token](__SUBDIR__/reference/cli/docker/swarm/join-token/).
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
    ### Configure node healthcheck frequency (--dispatcher-heartbeat) {#dispatcher-heartbeat}
@y
    ### Configure node healthcheck frequency (--dispatcher-heartbeat) {#dispatcher-heartbeat}
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
    Setting `--data-path-addr` does not restrict which interfaces or source IP
    addresses the VXLAN socket is bound to. Similar to `--advertise-addr`, the
    purpose of this flag is to inform other members of the swarm about which
    address to use for control plane traffic. To restrict access to the VXLAN port
    of the node, use firewall rules.
@y
    Setting `--data-path-addr` does not restrict which interfaces or source IP
    addresses the VXLAN socket is bound to. Similar to `--advertise-addr`, the
    purpose of this flag is to inform other members of the swarm about which
    address to use for control plane traffic. To restrict access to the VXLAN port
    of the node, use firewall rules.
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

% snip command...

@x
    After the swarm is initialized, use the `docker info` command to verify that
    the port is configured:
@y
    After the swarm is initialized, use the `docker info` command to verify that
    the port is configured:
@z

% snip command...

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

% snip command...

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
hidden: false
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
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
