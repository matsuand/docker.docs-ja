%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network connect
short: Connect a container to a network
long: |-
    Connects a container to a network. You can connect a container by name
    or by ID. Once connected, the container can communicate with other containers in
    the same network.
usage: docker network connect [OPTIONS] NETWORK CONTAINER
pname: docker network
plink: docker_network.yaml
options:
    - option: alias
      value_type: stringSlice
      default_value: '[]'
      description: Add network-scoped alias for the container
      details_url: '#alias'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver-opt
      value_type: stringSlice
      default_value: '[]'
      description: driver options for the network
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip
      value_type: string
      description: IPv4 address (e.g., `172.30.100.104`)
      details_url: '#ip'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip6
      value_type: string
      description: IPv6 address (e.g., `2001:db8::33`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      value_type: list
      description: Add link to another container
      details_url: '#link'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link-local-ip
      value_type: stringSlice
      default_value: '[]'
      description: Add a link-local address for the container
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
    ### Connect a running container to a network
@y
command: docker network connect
short: Connect a container to a network
long: |-
    Connects a container to a network. You can connect a container by name
    or by ID. Once connected, the container can communicate with other containers in
    the same network.
usage: docker network connect [OPTIONS] NETWORK CONTAINER
pname: docker network
plink: docker_network.yaml
options:
    - option: alias
      value_type: stringSlice
      default_value: '[]'
      description: Add network-scoped alias for the container
      details_url: '#alias'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver-opt
      value_type: stringSlice
      default_value: '[]'
      description: driver options for the network
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip
      value_type: string
      description: IPv4 address (e.g., `172.30.100.104`)
      details_url: '#ip'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip6
      value_type: string
      description: IPv6 address (e.g., `2001:db8::33`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      value_type: list
      description: Add link to another container
      details_url: '#link'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link-local-ip
      value_type: stringSlice
      default_value: '[]'
      description: Add a link-local address for the container
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
    ### Connect a running container to a network
@z

@x
    ```console
    $ docker network connect multi-host-network container1
    ```
@y
    ```console
    $ docker network connect multi-host-network container1
    ```
@z

@x
    ### Connect a container to a network when it starts
@y
    ### Connect a container to a network when it starts
@z

@x
    You can also use the `docker run --network=<network-name>` option to start a
    container and immediately connect it to a network.
@y
    You can also use the `docker run --network=<network-name>` option to start a
    container and immediately connect it to a network.
@z

@x
    ```console
    $ docker run -itd --network=multi-host-network busybox
    ```
@y
    ```console
    $ docker run -itd --network=multi-host-network busybox
    ```
@z

@x
    ### Specify the IP address a container will use on a given network (--ip) {#ip}
@y
    ### Specify the IP address a container will use on a given network (--ip) {#ip}
@z

@x
    You can specify the IP address you want to be assigned to the container's interface.
@y
    You can specify the IP address you want to be assigned to the container's interface.
@z

@x
    ```console
    $ docker network connect --ip 10.10.36.122 multi-host-network container2
    ```
@y
    ```console
    $ docker network connect --ip 10.10.36.122 multi-host-network container2
    ```
@z

@x
    ### Use the legacy `--link` option (--link) {#link}
@y
    ### Use the legacy `--link` option (--link) {#link}
@z

@x
    You can use `--link` option to link another container with a preferred alias.
@y
    You can use `--link` option to link another container with a preferred alias.
@z

@x
    ```console
    $ docker network connect --link container1:c1 multi-host-network container2
    ```
@y
    ```console
    $ docker network connect --link container1:c1 multi-host-network container2
    ```
@z

@x
    ### Create a network alias for a container (--alias) {#alias}
@y
    ### Create a network alias for a container (--alias) {#alias}
@z

@x
    `--alias` option can be used to resolve the container by another name in the network
    being connected to.
@y
    `--alias` option can be used to resolve the container by another name in the network
    being connected to.
@z

@x
    ```console
    $ docker network connect --alias db --alias mysql multi-host-network container2
    ```
@y
    ```console
    $ docker network connect --alias db --alias mysql multi-host-network container2
    ```
@z

@x
    ### Network implications of stopping, pausing, or restarting containers
@y
    ### Network implications of stopping, pausing, or restarting containers
@z

@x
    You can pause, restart, and stop containers that are connected to a network.
    A container connects to its configured networks when it runs.
@y
    You can pause, restart, and stop containers that are connected to a network.
    A container connects to its configured networks when it runs.
@z

@x
    If specified, the container's IP address(es) is reapplied when a stopped
    container is restarted. If the IP address is no longer available, the container
    fails to start. One way to guarantee that the IP address is available is
    to specify an `--ip-range` when creating the network, and choose the static IP
    address(es) from outside that range. This ensures that the IP address is not
    given to another container while this container is not on the network.
@y
    If specified, the container's IP address(es) is reapplied when a stopped
    container is restarted. If the IP address is no longer available, the container
    fails to start. One way to guarantee that the IP address is available is
    to specify an `--ip-range` when creating the network, and choose the static IP
    address(es) from outside that range. This ensures that the IP address is not
    given to another container while this container is not on the network.
@z

@x
    ```console
    $ docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 multi-host-network
    ```
@y
    ```console
    $ docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 multi-host-network
    ```
@z

@x
    ```console
    $ docker network connect --ip 172.20.128.2 multi-host-network container2
    ```
@y
    ```console
    $ docker network connect --ip 172.20.128.2 multi-host-network container2
    ```
@z

@x
    To verify the container is connected, use the `docker network inspect` command.
    Use `docker network disconnect` to remove a container from the network.
@y
    To verify the container is connected, use the `docker network inspect` command.
    Use `docker network disconnect` to remove a container from the network.
@z

@x
    Once connected in network, containers can communicate using only another
    container's IP address or name. For `overlay` networks or custom plugins that
    support multi-host connectivity, containers connected to the same multi-host
    network but launched from different Engines can also communicate in this way.
@y
    Once connected in network, containers can communicate using only another
    container's IP address or name. For `overlay` networks or custom plugins that
    support multi-host connectivity, containers connected to the same multi-host
    network but launched from different Engines can also communicate in this way.
@z

@x
    You can connect a container to one or more networks. The networks need not be
    the same type. For example, you can connect a single container bridge and overlay
    networks.
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    You can connect a container to one or more networks. The networks need not be
    the same type. For example, you can connect a single container bridge and overlay
    networks.
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
