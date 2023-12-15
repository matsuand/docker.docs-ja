%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network create
short: Create a network
long: |-
    Creates a new network. The `DRIVER` accepts `bridge` or `overlay` which are the
    built-in network drivers. If you have installed a third party or your own custom
    network driver you can specify that `DRIVER` here also. If you don't specify the
    `--driver` option, the command automatically creates a `bridge` network for you.
    When you install Docker Engine it creates a `bridge` network automatically. This
    network corresponds to the `docker0` bridge that Engine has traditionally relied
    on. When you launch a new container with  `docker run` it automatically connects to
    this bridge network. You cannot remove this default bridge network, but you can
    create new ones using the `network create` command.
@y
command: docker network create
short: Create a network
long: |-
    Creates a new network. The `DRIVER` accepts `bridge` or `overlay` which are the
    built-in network drivers. If you have installed a third party or your own custom
    network driver you can specify that `DRIVER` here also. If you don't specify the
    `--driver` option, the command automatically creates a `bridge` network for you.
    When you install Docker Engine it creates a `bridge` network automatically. This
    network corresponds to the `docker0` bridge that Engine has traditionally relied
    on. When you launch a new container with  `docker run` it automatically connects to
    this bridge network. You cannot remove this default bridge network, but you can
    create new ones using the `network create` command.
@z

@x
    ```console
    $ docker network create -d bridge my-bridge-network
    ```
@y
    ```console
    $ docker network create -d bridge my-bridge-network
    ```
@z

@x
    Bridge networks are isolated networks on a single Engine installation. If you
    want to create a network that spans multiple Docker hosts each running an
    Engine, you must enable Swarm mode, and create an `overlay` network. To read more
    about overlay networks with Swarm mode, see ["*use overlay networks*"](/network/overlay/).
@y
    Bridge networks are isolated networks on a single Engine installation. If you
    want to create a network that spans multiple Docker hosts each running an
    Engine, you must enable Swarm mode, and create an `overlay` network. To read more
    about overlay networks with Swarm mode, see ["*use overlay networks*"](/network/overlay/).
@z

@x
    Once you have enabled swarm mode, you can create a swarm-scoped overlay network:
@y
    Once you have enabled swarm mode, you can create a swarm-scoped overlay network:
@z

@x
    ```console
    $ docker network create --scope=swarm --attachable -d overlay my-multihost-network
    ```
@y
    ```console
    $ docker network create --scope=swarm --attachable -d overlay my-multihost-network
    ```
@z

@x
    By default, swarm-scoped networks do not allow manually started containers to
    be attached. This restriction is added to prevent someone that has access to
    a non-manager node in the swarm cluster from running a container that is able
    to access the network stack of a swarm service.
@y
    By default, swarm-scoped networks do not allow manually started containers to
    be attached. This restriction is added to prevent someone that has access to
    a non-manager node in the swarm cluster from running a container that is able
    to access the network stack of a swarm service.
@z

@x
    The `--attachable` option used in the example above disables this restriction,
    and allows for both swarm services and manually started containers to attach to
    the overlay network.
@y
    The `--attachable` option used in the example above disables this restriction,
    and allows for both swarm services and manually started containers to attach to
    the overlay network.
@z

@x
    Network names must be unique. The Docker daemon attempts to identify naming
    conflicts but this is not guaranteed. It is the user's responsibility to avoid
    name conflicts.
@y
    Network names must be unique. The Docker daemon attempts to identify naming
    conflicts but this is not guaranteed. It is the user's responsibility to avoid
    name conflicts.
@z

@x
    ### Overlay network limitations
@y
    ### Overlay network limitations
@z

@x
    You should create overlay networks with `/24` blocks (the default), which limits
    you to 256 IP addresses, when you create networks using the default VIP-based
    endpoint-mode. This recommendation addresses
    [limitations with swarm mode](https://github.com/moby/moby/issues/30820). If you
    need more than 256 IP addresses, do not increase the IP block size. You can
    either use `dnsrr` endpoint mode with an external load balancer, or use multiple
    smaller overlay networks. See
    [Configure service discovery](/engine/swarm/networking/#configure-service-discovery)
    for more information about different endpoint modes.
usage: docker network create [OPTIONS] NETWORK
pname: docker network
plink: docker_network.yaml
options:
    - option: attachable
      value_type: bool
      default_value: "false"
      description: Enable manual container attachment
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: aux-address
      value_type: map
      default_value: map[]
      description: Auxiliary IPv4 or IPv6 addresses used by Network driver
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-from
      value_type: string
      description: The network from which to copy the configuration
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-only
      value_type: bool
      default_value: "false"
      description: Create a configuration only network
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver
      shorthand: d
      value_type: string
      default_value: bridge
      description: Driver to manage the Network
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: gateway
      value_type: stringSlice
      default_value: '[]'
      description: IPv4 or IPv6 Gateway for the master subnet
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ingress
      value_type: bool
      default_value: "false"
      description: Create swarm routing-mesh network
      details_url: '#ingress'
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: internal
      value_type: bool
      default_value: "false"
      description: Restrict external access to the network
      details_url: '#internal'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip-range
      value_type: stringSlice
      default_value: '[]'
      description: Allocate container ip from a sub-range
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipam-driver
      value_type: string
      default_value: default
      description: IP Address Management Driver
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipam-opt
      value_type: map
      default_value: map[]
      description: Set IPAM driver specific options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipv6
      value_type: bool
      default_value: "false"
      description: Enable IPv6 networking
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      value_type: list
      description: Set metadata on a network
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: opt
      shorthand: o
      value_type: map
      default_value: map[]
      description: Set driver specific options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: scope
      value_type: string
      description: Control the network's scope
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: subnet
      value_type: stringSlice
      default_value: '[]'
      description: Subnet in CIDR format that represents a network segment
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
    ### Connect containers
@y
    You should create overlay networks with `/24` blocks (the default), which limits
    you to 256 IP addresses, when you create networks using the default VIP-based
    endpoint-mode. This recommendation addresses
    [limitations with swarm mode](https://github.com/moby/moby/issues/30820). If you
    need more than 256 IP addresses, do not increase the IP block size. You can
    either use `dnsrr` endpoint mode with an external load balancer, or use multiple
    smaller overlay networks. See
    [Configure service discovery](/engine/swarm/networking/#configure-service-discovery)
    for more information about different endpoint modes.
usage: docker network create [OPTIONS] NETWORK
pname: docker network
plink: docker_network.yaml
options:
    - option: attachable
      value_type: bool
      default_value: "false"
      description: Enable manual container attachment
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: aux-address
      value_type: map
      default_value: map[]
      description: Auxiliary IPv4 or IPv6 addresses used by Network driver
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-from
      value_type: string
      description: The network from which to copy the configuration
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config-only
      value_type: bool
      default_value: "false"
      description: Create a configuration only network
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver
      shorthand: d
      value_type: string
      default_value: bridge
      description: Driver to manage the Network
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: gateway
      value_type: stringSlice
      default_value: '[]'
      description: IPv4 or IPv6 Gateway for the master subnet
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ingress
      value_type: bool
      default_value: "false"
      description: Create swarm routing-mesh network
      details_url: '#ingress'
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: internal
      value_type: bool
      default_value: "false"
      description: Restrict external access to the network
      details_url: '#internal'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip-range
      value_type: stringSlice
      default_value: '[]'
      description: Allocate container ip from a sub-range
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipam-driver
      value_type: string
      default_value: default
      description: IP Address Management Driver
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipam-opt
      value_type: map
      default_value: map[]
      description: Set IPAM driver specific options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipv6
      value_type: bool
      default_value: "false"
      description: Enable IPv6 networking
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      value_type: list
      description: Set metadata on a network
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: opt
      shorthand: o
      value_type: map
      default_value: map[]
      description: Set driver specific options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: scope
      value_type: string
      description: Control the network's scope
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: subnet
      value_type: stringSlice
      default_value: '[]'
      description: Subnet in CIDR format that represents a network segment
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
    ### Connect containers
@z

@x
    When you start a container, use the `--network` flag to connect it to a network.
    This example adds the `busybox` container to the `mynet` network:
@y
    When you start a container, use the `--network` flag to connect it to a network.
    This example adds the `busybox` container to the `mynet` network:
@z

@x
    ```console
    $ docker run -itd --network=mynet busybox
    ```
@y
    ```console
    $ docker run -itd --network=mynet busybox
    ```
@z

@x
    If you want to add a container to a network after the container is already
    running, use the `docker network connect` subcommand.
@y
    If you want to add a container to a network after the container is already
    running, use the `docker network connect` subcommand.
@z

@x
    You can connect multiple containers to the same network. Once connected, the
    containers can communicate using only another container's IP address or name.
    For `overlay` networks or custom plugins that support multi-host connectivity,
    containers connected to the same multi-host network but launched from different
    Engines can also communicate in this way.
@y
    You can connect multiple containers to the same network. Once connected, the
    containers can communicate using only another container's IP address or name.
    For `overlay` networks or custom plugins that support multi-host connectivity,
    containers connected to the same multi-host network but launched from different
    Engines can also communicate in this way.
@z

@x
    You can disconnect a container from a network using the `docker network
    disconnect` command.
@y
    You can disconnect a container from a network using the `docker network
    disconnect` command.
@z

@x
    ### Specify advanced options
@y
    ### Specify advanced options
@z

@x
    When you create a network, Engine creates a non-overlapping subnetwork for the
    network by default. This subnetwork is not a subdivision of an existing network.
    It is purely for ip-addressing purposes. You can override this default and
    specify subnetwork values directly using the `--subnet` option. On a
    `bridge` network you can only create a single subnet:
@y
    When you create a network, Engine creates a non-overlapping subnetwork for the
    network by default. This subnetwork is not a subdivision of an existing network.
    It is purely for ip-addressing purposes. You can override this default and
    specify subnetwork values directly using the `--subnet` option. On a
    `bridge` network you can only create a single subnet:
@z

@x
    ```console
    $ docker network create --driver=bridge --subnet=192.168.0.0/16 br0
    ```
@y
    ```console
    $ docker network create --driver=bridge --subnet=192.168.0.0/16 br0
    ```
@z

@x
    Additionally, you also specify the `--gateway` `--ip-range` and `--aux-address`
    options.
@y
    Additionally, you also specify the `--gateway` `--ip-range` and `--aux-address`
    options.
@z

@x
    ```console
    $ docker network create \
      --driver=bridge \
      --subnet=172.28.0.0/16 \
      --ip-range=172.28.5.0/24 \
      --gateway=172.28.5.254 \
      br0
    ```
@y
    ```console
    $ docker network create \
      --driver=bridge \
      --subnet=172.28.0.0/16 \
      --ip-range=172.28.5.0/24 \
      --gateway=172.28.5.254 \
      br0
    ```
@z

@x
    If you omit the `--gateway` flag the Engine selects one for you from inside a
    preferred pool. For `overlay` networks and for network driver plugins that
    support it you can create multiple subnetworks. This example uses two `/25`
    subnet mask to adhere to the current guidance of not having more than 256 IPs in
    a single overlay network. Each of the subnetworks has 126 usable addresses.
@y
    If you omit the `--gateway` flag the Engine selects one for you from inside a
    preferred pool. For `overlay` networks and for network driver plugins that
    support it you can create multiple subnetworks. This example uses two `/25`
    subnet mask to adhere to the current guidance of not having more than 256 IPs in
    a single overlay network. Each of the subnetworks has 126 usable addresses.
@z

@x
    ```console
    $ docker network create -d overlay \
      --subnet=192.168.10.0/25 \
      --subnet=192.168.20.0/25 \
      --gateway=192.168.10.100 \
      --gateway=192.168.20.100 \
      --aux-address="my-router=192.168.10.5" --aux-address="my-switch=192.168.10.6" \
      --aux-address="my-printer=192.168.20.5" --aux-address="my-nas=192.168.20.6" \
      my-multihost-network
    ```
@y
    ```console
    $ docker network create -d overlay \
      --subnet=192.168.10.0/25 \
      --subnet=192.168.20.0/25 \
      --gateway=192.168.10.100 \
      --gateway=192.168.20.100 \
      --aux-address="my-router=192.168.10.5" --aux-address="my-switch=192.168.10.6" \
      --aux-address="my-printer=192.168.20.5" --aux-address="my-nas=192.168.20.6" \
      my-multihost-network
    ```
@z

@x
    Be sure that your subnetworks do not overlap. If they do, the network create
    fails and Engine returns an error.
@y
    Be sure that your subnetworks do not overlap. If they do, the network create
    fails and Engine returns an error.
@z

@x
    ### Bridge driver options
@y
    ### Bridge driver options
@z

@x
    When creating a custom network, the default network driver (i.e. `bridge`) has
    additional options that can be passed. The following are those options and the
    equivalent docker daemon flags used for docker0 bridge:
@y
    When creating a custom network, the default network driver (i.e. `bridge`) has
    additional options that can be passed. The following are those options and the
    equivalent docker daemon flags used for docker0 bridge:
@z

@x
    | Option                                           | Equivalent  | Description                                           |
    |--------------------------------------------------|-------------|-------------------------------------------------------|
    | `com.docker.network.bridge.name`                 | -           | Bridge name to be used when creating the Linux bridge |
    | `com.docker.network.bridge.enable_ip_masquerade` | `--ip-masq` | Enable IP masquerading                                |
    | `com.docker.network.bridge.enable_icc`           | `--icc`     | Enable or Disable Inter Container Connectivity        |
    | `com.docker.network.bridge.host_binding_ipv4`    | `--ip`      | Default IP when binding container ports               |
    | `com.docker.network.driver.mtu`                  | `--mtu`     | Set the containers network MTU                        |
    | `com.docker.network.container_iface_prefix`      | -           | Set a custom prefix for container interfaces          |
@y
    | Option                                           | Equivalent  | Description                                           |
    |--------------------------------------------------|-------------|-------------------------------------------------------|
    | `com.docker.network.bridge.name`                 | -           | Bridge name to be used when creating the Linux bridge |
    | `com.docker.network.bridge.enable_ip_masquerade` | `--ip-masq` | Enable IP masquerading                                |
    | `com.docker.network.bridge.enable_icc`           | `--icc`     | Enable or Disable Inter Container Connectivity        |
    | `com.docker.network.bridge.host_binding_ipv4`    | `--ip`      | Default IP when binding container ports               |
    | `com.docker.network.driver.mtu`                  | `--mtu`     | Set the containers network MTU                        |
    | `com.docker.network.container_iface_prefix`      | -           | Set a custom prefix for container interfaces          |
@z

@x
    The following arguments can be passed to `docker network create` for any
    network driver, again with their approximate equivalents to `docker daemon`.
@y
    The following arguments can be passed to `docker network create` for any
    network driver, again with their approximate equivalents to `docker daemon`.
@z

@x
    | Argument     | Equivalent     | Description                                |
    |--------------|----------------|--------------------------------------------|
    | `--gateway`  | -              | IPv4 or IPv6 Gateway for the master subnet |
    | `--ip-range` | `--fixed-cidr` | Allocate IPs from a range                  |
    | `--internal` | -              | Restrict external access to the network    |
    | `--ipv6`     | `--ipv6`       | Enable IPv6 networking                     |
    | `--subnet`   | `--bip`        | Subnet for network                         |
@y
    | Argument     | Equivalent     | Description                                |
    |--------------|----------------|--------------------------------------------|
    | `--gateway`  | -              | IPv4 or IPv6 Gateway for the master subnet |
    | `--ip-range` | `--fixed-cidr` | Allocate IPs from a range                  |
    | `--internal` | -              | Restrict external access to the network    |
    | `--ipv6`     | `--ipv6`       | Enable IPv6 networking                     |
    | `--subnet`   | `--bip`        | Subnet for network                         |
@z

@x
    For example, let's use `-o` or `--opt` options to specify an IP address binding
    when publishing ports:
@y
    For example, let's use `-o` or `--opt` options to specify an IP address binding
    when publishing ports:
@z

@x
    ```console
    $ docker network create \
        -o "com.docker.network.bridge.host_binding_ipv4"="172.19.0.1" \
        simple-network
    ```
@y
    ```console
    $ docker network create \
        -o "com.docker.network.bridge.host_binding_ipv4"="172.19.0.1" \
        simple-network
    ```
@z

@x
    ### Network internal mode (--internal) {#internal}
@y
    ### Network internal mode (--internal) {#internal}
@z

@x
    By default, when you connect a container to an `overlay` network, Docker also
    connects a bridge network to it to provide external connectivity. If you want
    to create an externally isolated `overlay` network, you can specify the
    `--internal` option.
@y
    By default, when you connect a container to an `overlay` network, Docker also
    connects a bridge network to it to provide external connectivity. If you want
    to create an externally isolated `overlay` network, you can specify the
    `--internal` option.
@z

@x
    ### Network ingress mode (--ingress) {#ingress}
@y
    ### Network ingress mode (--ingress) {#ingress}
@z

@x
    You can create the network which will be used to provide the routing-mesh in the
    swarm cluster. You do so by specifying `--ingress` when creating the network. Only
    one ingress network can be created at the time. The network can be removed only
    if no services depend on it. Any option available when creating an overlay network
    is also available when creating the ingress network, besides the `--attachable` option.
@y
    You can create the network which will be used to provide the routing-mesh in the
    swarm cluster. You do so by specifying `--ingress` when creating the network. Only
    one ingress network can be created at the time. The network can be removed only
    if no services depend on it. Any option available when creating an overlay network
    is also available when creating the ingress network, besides the `--attachable` option.
@z

@x
    ```console
    $ docker network create -d overlay \
      --subnet=10.11.0.0/16 \
      --ingress \
      --opt com.docker.network.driver.mtu=9216 \
      --opt encrypted=true \
      my-ingress-network
    ```
@y
    ```console
    $ docker network create -d overlay \
      --subnet=10.11.0.0/16 \
      --ingress \
      --opt com.docker.network.driver.mtu=9216 \
      --opt encrypted=true \
      my-ingress-network
    ```
@z

@x
    ### Run services on predefined networks
@y
    ### Run services on predefined networks
@z

@x
    You can create services on the predefined docker networks `bridge` and `host`.
@y
    You can create services on the predefined docker networks `bridge` and `host`.
@z

@x
    ```console
    $ docker service create --name my-service \
      --network host \
      --replicas 2 \
      busybox top
    ```
@y
    ```console
    $ docker service create --name my-service \
      --network host \
      --replicas 2 \
      busybox top
    ```
@z

@x
    ### Swarm networks with local scope drivers
@y
    ### Swarm networks with local scope drivers
@z

@x
    You can create a swarm network with local scope network drivers. You do so
    by promoting the network scope to `swarm` during the creation of the network.
    You will then be able to use this network when creating services.
@y
    You can create a swarm network with local scope network drivers. You do so
    by promoting the network scope to `swarm` during the creation of the network.
    You will then be able to use this network when creating services.
@z

@x
    ```console
    $ docker network create -d bridge \
      --scope swarm \
      --attachable \
      swarm-network
    ```
@y
    ```console
    $ docker network create -d bridge \
      --scope swarm \
      --attachable \
      swarm-network
    ```
@z

@x
    For network drivers which provide connectivity across hosts (ex. macvlan), if
    node specific configurations are needed in order to plumb the network on each
    host, you will supply that configuration via a configuration only network.
    When you create the swarm scoped network, you will then specify the name of the
    network which contains the configuration.
@y
    For network drivers which provide connectivity across hosts (ex. macvlan), if
    node specific configurations are needed in order to plumb the network on each
    host, you will supply that configuration via a configuration only network.
    When you create the swarm scoped network, you will then specify the name of the
    network which contains the configuration.
@z

@x
    ```console
    node1$ docker network create --config-only --subnet 192.168.100.0/24 --gateway 192.168.100.115 mv-config
    node2$ docker network create --config-only --subnet 192.168.200.0/24 --gateway 192.168.200.202 mv-config
    node1$ docker network create -d macvlan --scope swarm --config-from mv-config --attachable swarm-network
    ```
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    node1$ docker network create --config-only --subnet 192.168.100.0/24 --gateway 192.168.100.115 mv-config
    node2$ docker network create --config-only --subnet 192.168.200.0/24 --gateway 192.168.200.202 mv-config
    node1$ docker network create -d macvlan --scope swarm --config-from mv-config --attachable swarm-network
    ```
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
