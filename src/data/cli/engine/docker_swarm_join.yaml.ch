%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker swarm join
short: Join a swarm as a node and/or manager
long: |-
    Join a node to a swarm. The node joins as a manager node or worker node based upon the token you
    pass with the `--token` flag. If you pass a manager token, the node joins as a manager. If you
    pass a worker token, the node joins as a worker.
usage: docker swarm join [OPTIONS] HOST:PORT
@y
command: docker swarm join
short: Join a swarm as a node and/or manager
long: |-
    Join a node to a swarm. The node joins as a manager node or worker node based upon the token you
    pass with the `--token` flag. If you pass a manager token, the node joins as a manager. If you
    pass a worker token, the node joins as a worker.
usage: docker swarm join [OPTIONS] HOST:PORT
@z

% options:

@x advertise-addr
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
@y
      description: 'Advertised address (format: `<ip|interface>[:port]`)'
@z

@x availability
      description: Availability of the node (`active`, `pause`, `drain`)
@y
      description: Availability of the node (`active`, `pause`, `drain`)
@z

@x data-path-addr
      description: |
        Address or interface to use for data path traffic (format: `<ip|interface>`)
@y
      description: |
        Address or interface to use for data path traffic (format: `<ip|interface>`)
@z

@x listen-addr
      description: 'Listen address (format: `<ip|interface>[:port]`)'
@y
      description: 'Listen address (format: `<ip|interface>[:port]`)'
@z

@x token
      description: Token for entry into the swarm
@y
      description: Token for entry into the swarm
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Join a node to swarm as a manager
@y
examples: |-
    ### Join a node to swarm as a manager
@z

@x
    The example below demonstrates joining a manager node using a manager token.
@y
    The example below demonstrates joining a manager node using a manager token.
@z

% snip command...

@x
    A cluster should only have 3-7 managers at most, because a majority of managers must be available
    for the cluster to function. Nodes that aren't meant to participate in this management quorum
    should join as workers instead. Managers should be stable hosts that have static IP addresses.
@y
    A cluster should only have 3-7 managers at most, because a majority of managers must be available
    for the cluster to function. Nodes that aren't meant to participate in this management quorum
    should join as workers instead. Managers should be stable hosts that have static IP addresses.
@z

@x
    ### Join a node to swarm as a worker
@y
    ### Join a node to swarm as a worker
@z

@x
    The example below demonstrates joining a worker node using a worker token.
@y
    The example below demonstrates joining a worker node using a worker token.
@z

% snip command...

@x
    ### `--listen-addr value` {#listen-addr}
@y
    ### `--listen-addr value` {#listen-addr}
@z

@x
    If the node is a manager, it will listen for inbound swarm manager traffic on this
    address. The default is to listen on 0.0.0.0:2377. It is also possible to specify a
    network interface to listen on that interface's address; for example `--listen-addr eth0:2377`.
@y
    If the node is a manager, it will listen for inbound swarm manager traffic on this
    address. The default is to listen on 0.0.0.0:2377. It is also possible to specify a
    network interface to listen on that interface's address; for example `--listen-addr eth0:2377`.
@z

@x
    Specifying a port is optional. If the value is a bare IP address, or interface
    name, the default port 2377 will be used.
@y
    Specifying a port is optional. If the value is a bare IP address, or interface
    name, the default port 2377 will be used.
@z

@x
    This flag is generally not necessary when joining an existing swarm.
@y
    This flag is generally not necessary when joining an existing swarm.
@z

@x
    ### `--advertise-addr value` {#advertise-addr}
@y
    ### `--advertise-addr value` {#advertise-addr}
@z

@x
    This flag specifies the address that will be advertised to other members of the
    swarm for API access. If unspecified, Docker will check if the system has a
    single IP address, and use that IP address with the listening port (see
    `--listen-addr`). If the system has multiple IP addresses, `--advertise-addr`
    must be specified so that the correct address is chosen for inter-manager
    communication and overlay networking.
@y
    This flag specifies the address that will be advertised to other members of the
    swarm for API access. If unspecified, Docker will check if the system has a
    single IP address, and use that IP address with the listening port (see
    `--listen-addr`). If the system has multiple IP addresses, `--advertise-addr`
    must be specified so that the correct address is chosen for inter-manager
    communication and overlay networking.
@z

@x
    It is also possible to specify a network interface to advertise that interface's address;
    for example `--advertise-addr eth0:2377`.
@y
    It is also possible to specify a network interface to advertise that interface's address;
    for example `--advertise-addr eth0:2377`.
@z

@x
    Specifying a port is optional. If the value is a bare IP address, or interface
    name, the default port 2377 will be used.
@y
    Specifying a port is optional. If the value is a bare IP address, or interface
    name, the default port 2377 will be used.
@z

@x
    This flag is generally not necessary when joining an existing swarm. If
    you're joining new nodes through a load balancer, you should use this flag to
    ensure the node advertises its IP address and not the IP address of the load
    balancer.
@y
    This flag is generally not necessary when joining an existing swarm. If
    you're joining new nodes through a load balancer, you should use this flag to
    ensure the node advertises its IP address and not the IP address of the load
    balancer.
@z

@x
    ### `--data-path-addr` {#data-path-addr}
@y
    ### `--data-path-addr` {#data-path-addr}
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
    ### `--token string` {#token}
@y
    ### `--token string` {#token}
@z

@x
    Secret value required for nodes to join the swarm
@y
    Secret value required for nodes to join the swarm
@z

@x
    ### `--availability` {#availability}
@y
    ### `--availability` {#availability}
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
    by passing `--availability=drain` to `docker swarm join`.
@y
    This flag is useful in certain situations. For example, a cluster may want to have
    dedicated manager nodes that are not served as worker nodes. This could be achieved
    by passing `--availability=drain` to `docker swarm join`.
@z

% snip directives...
