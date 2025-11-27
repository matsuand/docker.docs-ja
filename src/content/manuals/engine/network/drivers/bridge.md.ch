%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Bridge network driver
description: All about using user-defined bridge networks and the default bridge
keywords: network, bridge, user-defined, standalone
@y
title: Bridge network driver
description: All about using user-defined bridge networks and the default bridge
keywords: network, bridge, user-defined, standalone
@z

@x
A Docker bridge network has an IPv4 subnet and, optionally, an IPv6 subnet.
Each container connected to the bridge network has a network interface with
addresses in the network's subnets. By default, it:
@y
A Docker bridge network has an IPv4 subnet and, optionally, an IPv6 subnet.
Each container connected to the bridge network has a network interface with
addresses in the network's subnets. By default, it:
@z

@x
- Allows unrestricted network access to containers in the network from
  the host, and from other containers connected to the same bridge network.
- Blocks access from containers in other networks and from outside the
  Docker host.
- Uses masquerading to give containers external network access. Devices on
  the host's external networks only see the IP address of the Docker host.
- Supports port publishing, where network traffic is forwarded between
  container ports and ports on host IP addresses. The published ports
  can be accessed from outside the Docker host, on its IP addresses.
@y
- Allows unrestricted network access to containers in the network from
  the host, and from other containers connected to the same bridge network.
- Blocks access from containers in other networks and from outside the
  Docker host.
- Uses masquerading to give containers external network access. Devices on
  the host's external networks only see the IP address of the Docker host.
- Supports port publishing, where network traffic is forwarded between
  container ports and ports on host IP addresses. The published ports
  can be accessed from outside the Docker host, on its IP addresses.
@z

@x
In terms of Docker, a bridge network uses a software bridge which lets
containers connected to the same bridge network communicate, while providing
isolation from containers that aren't connected to that bridge network. By
default, the Docker bridge driver automatically installs rules in the host
machine so that containers connected to different bridge networks can only
communicate with each other using published ports.
@y
In terms of Docker, a bridge network uses a software bridge which lets
containers connected to the same bridge network communicate, while providing
isolation from containers that aren't connected to that bridge network. By
default, the Docker bridge driver automatically installs rules in the host
machine so that containers connected to different bridge networks can only
communicate with each other using published ports.
@z

@x
Bridge networks apply to containers running on the same Docker daemon host.
For communication among containers running on different Docker daemon hosts, you
can either manage routing at the OS level, or you can use an
[overlay network](overlay.md).
@y
Bridge networks apply to containers running on the same Docker daemon host.
For communication among containers running on different Docker daemon hosts, you
can either manage routing at the OS level, or you can use an
[overlay network](overlay.md).
@z

@x
When you start Docker, a [default bridge network](#use-the-default-bridge-network) (also
called `bridge`) is created automatically, and newly-started containers connect
to it unless otherwise specified. You can also create user-defined custom bridge
networks. **User-defined bridge networks are superior to the default `bridge`
network.**
@y
When you start Docker, a [default bridge network](#use-the-default-bridge-network) (also
called `bridge`) is created automatically, and newly-started containers connect
to it unless otherwise specified. You can also create user-defined custom bridge
networks. **User-defined bridge networks are superior to the default `bridge`
network.**
@z

@x
## Differences between user-defined bridges and the default bridge
@y
## Differences between user-defined bridges and the default bridge
@z

@x
- **User-defined bridges provide automatic DNS resolution between containers**.
@y
- **User-defined bridges provide automatic DNS resolution between containers**.
@z

@x
  Containers on the default bridge network can only access each other by IP
  addresses, unless you use the [`--link` option](../links.md), which is
  considered legacy. On a user-defined bridge network, containers can resolve
  each other by name or alias.
@y
  Containers on the default bridge network can only access each other by IP
  addresses, unless you use the [`--link` option](../links.md), which is
  considered legacy. On a user-defined bridge network, containers can resolve
  each other by name or alias.
@z

@x
  Imagine an application with a web front-end and a database back-end. If you call
  your containers `web` and `db`, the web container can connect to the db container
  at `db`, no matter which Docker host the application stack is running on.
@y
  Imagine an application with a web front-end and a database back-end. If you call
  your containers `web` and `db`, the web container can connect to the db container
  at `db`, no matter which Docker host the application stack is running on.
@z

@x
  If you run the same application stack on the default bridge network, you need
  to manually create links between the containers (using the legacy `--link`
  flag). These links need to be created in both directions, so you can see this
  gets complex with more than two containers which need to communicate.
  Alternatively, you can manipulate the `/etc/hosts` files within the containers,
  but this creates problems that are difficult to debug.
@y
  If you run the same application stack on the default bridge network, you need
  to manually create links between the containers (using the legacy `--link`
  flag). These links need to be created in both directions, so you can see this
  gets complex with more than two containers which need to communicate.
  Alternatively, you can manipulate the `/etc/hosts` files within the containers,
  but this creates problems that are difficult to debug.
@z

@x
- **User-defined bridges provide better isolation**.
@y
- **User-defined bridges provide better isolation**.
@z

@x
  All containers without a `--network` specified, are attached to the default bridge network. This can be a risk, as unrelated stacks/services/containers are then able to communicate.
@y
  All containers without a `--network` specified, are attached to the default bridge network. This can be a risk, as unrelated stacks/services/containers are then able to communicate.
@z

@x
  Using a user-defined network provides a scoped network in which only containers attached to that network are able to communicate.
@y
  Using a user-defined network provides a scoped network in which only containers attached to that network are able to communicate.
@z

@x
- **Containers can be attached and detached from user-defined networks on the fly**.
@y
- **Containers can be attached and detached from user-defined networks on the fly**.
@z

@x
  During a container's lifetime, you can connect or disconnect it from
  user-defined networks on the fly. To remove a container from the default
  bridge network, you need to stop the container and recreate it with different
  network options.
@y
  During a container's lifetime, you can connect or disconnect it from
  user-defined networks on the fly. To remove a container from the default
  bridge network, you need to stop the container and recreate it with different
  network options.
@z

@x
- **Each user-defined network creates a configurable bridge**.
@y
- **Each user-defined network creates a configurable bridge**.
@z

@x
  If your containers use the default bridge network, you can configure it, but
  all the containers use the same settings, such as MTU and `iptables` rules.
  In addition, configuring the default bridge network happens outside of Docker
  itself, and requires a restart of Docker.
@y
  If your containers use the default bridge network, you can configure it, but
  all the containers use the same settings, such as MTU and `iptables` rules.
  In addition, configuring the default bridge network happens outside of Docker
  itself, and requires a restart of Docker.
@z

@x
  User-defined bridge networks are created and configured using
  `docker network create`. If different groups of applications have different
  network requirements, you can configure each user-defined bridge separately,
  as you create it.
@y
  User-defined bridge networks are created and configured using
  `docker network create`. If different groups of applications have different
  network requirements, you can configure each user-defined bridge separately,
  as you create it.
@z

@x
- **Linked containers on the default bridge network share environment variables**.
@y
- **Linked containers on the default bridge network share environment variables**.
@z

@x
  Originally, the only way to share environment variables between two containers
  was to link them using the [`--link` flag](../links.md). This type of
  variable sharing isn't possible with user-defined networks. However, there
  are superior ways to share environment variables. A few ideas:
  - Multiple containers can mount a file or directory containing the shared
    information, using a Docker volume.
@y
  Originally, the only way to share environment variables between two containers
  was to link them using the [`--link` flag](../links.md). This type of
  variable sharing isn't possible with user-defined networks. However, there
  are superior ways to share environment variables. A few ideas:
  - Multiple containers can mount a file or directory containing the shared
    information, using a Docker volume.
@z

@x
  - Multiple containers can be started together using `docker-compose` and the
    compose file can define the shared variables.
@y
  - Multiple containers can be started together using `docker-compose` and the
    compose file can define the shared variables.
@z

@x
  - You can use swarm services instead of standalone containers, and take
    advantage of shared [secrets](/manuals/engine/swarm/secrets.md) and
    [configs](/manuals/engine/swarm/configs.md).
@y
  - You can use swarm services instead of standalone containers, and take
    advantage of shared [secrets](manuals/engine/swarm/secrets.md) and
    [configs](manuals/engine/swarm/configs.md).
@z

@x
Containers connected to the same user-defined bridge network effectively expose all ports
to each other. For a port to be accessible to containers or non-Docker hosts on
different networks, that port must be _published_ using the `-p` or `--publish`
flag.
@y
Containers connected to the same user-defined bridge network effectively expose all ports
to each other. For a port to be accessible to containers or non-Docker hosts on
different networks, that port must be _published_ using the `-p` or `--publish`
flag.
@z

@x
## Options
@y
## Options
@z

@x
The following table describes the driver-specific options that you can pass to
`--opt` when creating a custom network using the `bridge` driver.
@y
The following table describes the driver-specific options that you can pass to
`--opt` when creating a custom network using the `bridge` driver.
@z

@x
| Option                                                                                          | Default                     | Description                                                                                         |
| ----------------------------------------------------------------------------------------------- | --------------------------- | --------------------------------------------------------------------------------------------------- |
| `com.docker.network.bridge.name`                                                                |                             | Interface name to use when creating the Linux bridge.                                               |
| `com.docker.network.bridge.enable_ip_masquerade`                                                | `true`                      | Enable IP masquerading.                                                                             |
| `com.docker.network.host_ipv4`<br/>`com.docker.network.host_ipv6`                               |                             | Address to use for source NAT. See [Packet filtering and firewalls](packet-filtering-firewalls.md). |
| `com.docker.network.bridge.gateway_mode_ipv4`<br/>`com.docker.network.bridge.gateway_mode_ipv6` | `nat`                       | Control external connectivity. See [Packet filtering and firewalls](packet-filtering-firewalls.md). |
| `com.docker.network.bridge.enable_icc`                                                          | `true`                      | Enable or Disable inter-container connectivity.                                                     |
| `com.docker.network.bridge.host_binding_ipv4`                                                   | all IPv4 and IPv6 addresses | Default IP when binding container ports.                                                            |
| `com.docker.network.driver.mtu`                                                                 | `0` (no limit)              | Set the containers network Maximum Transmission Unit (MTU).                                         |
| `com.docker.network.container_iface_prefix`                                                     | `eth`                       | Set a custom prefix for container interfaces.                                                       |
| `com.docker.network.bridge.inhibit_ipv4`                                                        | `false`                     | Prevent Docker from [assigning an IP address](#skip-bridge-ip-address-configuration) to the bridge. |
@y
| Option                                                                                          | Default                     | Description                                                                                         |
| ----------------------------------------------------------------------------------------------- | --------------------------- | --------------------------------------------------------------------------------------------------- |
| `com.docker.network.bridge.name`                                                                |                             | Interface name to use when creating the Linux bridge.                                               |
| `com.docker.network.bridge.enable_ip_masquerade`                                                | `true`                      | Enable IP masquerading.                                                                             |
| `com.docker.network.host_ipv4`<br/>`com.docker.network.host_ipv6`                               |                             | Address to use for source NAT. See [Packet filtering and firewalls](packet-filtering-firewalls.md). |
| `com.docker.network.bridge.gateway_mode_ipv4`<br/>`com.docker.network.bridge.gateway_mode_ipv6` | `nat`                       | Control external connectivity. See [Packet filtering and firewalls](packet-filtering-firewalls.md). |
| `com.docker.network.bridge.enable_icc`                                                          | `true`                      | Enable or Disable inter-container connectivity.                                                     |
| `com.docker.network.bridge.host_binding_ipv4`                                                   | all IPv4 and IPv6 addresses | Default IP when binding container ports.                                                            |
| `com.docker.network.driver.mtu`                                                                 | `0` (no limit)              | Set the containers network Maximum Transmission Unit (MTU).                                         |
| `com.docker.network.container_iface_prefix`                                                     | `eth`                       | Set a custom prefix for container interfaces.                                                       |
| `com.docker.network.bridge.inhibit_ipv4`                                                        | `false`                     | Prevent Docker from [assigning an IP address](#skip-bridge-ip-address-configuration) to the bridge. |
@z

@x
Some of these options are also available as flags to the `dockerd` CLI, and you
can use them to configure the default `docker0` bridge when starting the Docker
daemon. The following table shows which options have equivalent flags in the
`dockerd` CLI.
@y
Some of these options are also available as flags to the `dockerd` CLI, and you
can use them to configure the default `docker0` bridge when starting the Docker
daemon. The following table shows which options have equivalent flags in the
`dockerd` CLI.
@z

@x
| Option                                           | Flag        |
| ------------------------------------------------ | ----------- |
| `com.docker.network.bridge.name`                 | -           |
| `com.docker.network.bridge.enable_ip_masquerade` | `--ip-masq` |
| `com.docker.network.bridge.enable_icc`           | `--icc`     |
| `com.docker.network.bridge.host_binding_ipv4`    | `--ip`      |
| `com.docker.network.driver.mtu`                  | `--mtu`     |
| `com.docker.network.container_iface_prefix`      | -           |
@y
| Option                                           | Flag        |
| ------------------------------------------------ | ----------- |
| `com.docker.network.bridge.name`                 | -           |
| `com.docker.network.bridge.enable_ip_masquerade` | `--ip-masq` |
| `com.docker.network.bridge.enable_icc`           | `--icc`     |
| `com.docker.network.bridge.host_binding_ipv4`    | `--ip`      |
| `com.docker.network.driver.mtu`                  | `--mtu`     |
| `com.docker.network.container_iface_prefix`      | -           |
@z

@x
The Docker daemon supports a `--bridge` flag, which you can use to define
your own `docker0` bridge. Use this option if you want to run multiple daemon
instances on the same host. For details, see
[Run multiple daemons](/reference/cli/dockerd.md#run-multiple-daemons).
@y
The Docker daemon supports a `--bridge` flag, which you can use to define
your own `docker0` bridge. Use this option if you want to run multiple daemon
instances on the same host. For details, see
[Run multiple daemons](reference/cli/dockerd.md#run-multiple-daemons).
@z

@x
### Default host binding address
@y
### Default host binding address
@z

@x
When no host address is given in port publishing options like `-p 80`
or `-p 8080:80`, the default is to make the container's port 80 available on all
host addresses, IPv4 and IPv6.
@y
When no host address is given in port publishing options like `-p 80`
or `-p 8080:80`, the default is to make the container's port 80 available on all
host addresses, IPv4 and IPv6.
@z

@x
The bridge network driver option `com.docker.network.bridge.host_binding_ipv4`
can be used to modify the default address for published ports.
@y
The bridge network driver option `com.docker.network.bridge.host_binding_ipv4`
can be used to modify the default address for published ports.
@z

@x
Despite the option's name, it is possible to specify an IPv6 address.
@y
Despite the option's name, it is possible to specify an IPv6 address.
@z

@x
When the default binding address is an address assigned to a specific interface,
the container's port will only be accessible via that address.
@y
When the default binding address is an address assigned to a specific interface,
the container's port will only be accessible via that address.
@z

@x
Setting the default binding address to `::` means published ports will only be
available on the host's IPv6 addresses. However, setting it to `0.0.0.0` means it
will be available on the host's IPv4 and IPv6 addresses.
@y
Setting the default binding address to `::` means published ports will only be
available on the host's IPv6 addresses. However, setting it to `0.0.0.0` means it
will be available on the host's IPv4 and IPv6 addresses.
@z

@x
To restrict a published port to IPv4 only, the address must be included in the
container's publishing options. For example, `-p 0.0.0.0:8080:80`.
@y
To restrict a published port to IPv4 only, the address must be included in the
container's publishing options. For example, `-p 0.0.0.0:8080:80`.
@z

@x
## Manage a user-defined bridge
@y
## Manage a user-defined bridge
@z

@x
Use the `docker network create` command to create a user-defined bridge
network.
@y
Use the `docker network create` command to create a user-defined bridge
network.
@z

% snip command...

@x
You can specify the subnet, the IP address range, the gateway, and other
options. See the
[docker network create](/reference/cli/docker/network/create.md#specify-advanced-options)
reference or the output of `docker network create --help` for details.
@y
You can specify the subnet, the IP address range, the gateway, and other
options. See the
[docker network create](reference/cli/docker/network/create.md#specify-advanced-options)
reference or the output of `docker network create --help` for details.
@z

@x
Use the `docker network rm` command to remove a user-defined bridge
network. If containers are currently connected to the network,
[disconnect them](#disconnect-a-container-from-a-user-defined-bridge)
first.
@y
Use the `docker network rm` command to remove a user-defined bridge
network. If containers are currently connected to the network,
[disconnect them](#disconnect-a-container-from-a-user-defined-bridge)
first.
@z

% snip command...

@x
> **What's really happening?**
>
> When you create or remove a user-defined bridge or connect or disconnect a
> container from a user-defined bridge, Docker uses tools specific to the
> operating system to manage the underlying network infrastructure (such as adding
> or removing bridge devices or configuring `iptables` rules on Linux). These
> details should be considered implementation details. Let Docker manage your
> user-defined networks for you.
@y
> **What's really happening?**
>
> When you create or remove a user-defined bridge or connect or disconnect a
> container from a user-defined bridge, Docker uses tools specific to the
> operating system to manage the underlying network infrastructure (such as adding
> or removing bridge devices or configuring `iptables` rules on Linux). These
> details should be considered implementation details. Let Docker manage your
> user-defined networks for you.
@z

@x
## Connect a container to a user-defined bridge
@y
## Connect a container to a user-defined bridge
@z

@x
When you create a new container, you can specify one or more `--network` flags.
This example connects an Nginx container to the `my-net` network. It also
publishes port 80 in the container to port 8080 on the Docker host, so external
clients can access that port. Any other container connected to the `my-net`
network has access to all ports on the `my-nginx` container, and vice versa.
@y
When you create a new container, you can specify one or more `--network` flags.
This example connects an Nginx container to the `my-net` network. It also
publishes port 80 in the container to port 8080 on the Docker host, so external
clients can access that port. Any other container connected to the `my-net`
network has access to all ports on the `my-nginx` container, and vice versa.
@z

% snip command...

@x
To connect a **running** container to an existing user-defined bridge, use the
`docker network connect` command. The following command connects an already-running
`my-nginx` container to an already-existing `my-net` network:
@y
To connect a **running** container to an existing user-defined bridge, use the
`docker network connect` command. The following command connects an already-running
`my-nginx` container to an already-existing `my-net` network:
@z

% snip command...

@x
## Disconnect a container from a user-defined bridge
@y
## Disconnect a container from a user-defined bridge
@z

@x
To disconnect a running container from a user-defined bridge, use the
`docker network disconnect` command. The following command disconnects
the `my-nginx` container from the `my-net` network.
@y
To disconnect a running container from a user-defined bridge, use the
`docker network disconnect` command. The following command disconnects
the `my-nginx` container from the `my-net` network.
@z

% snip command...

@x
## Use IPv6 in a user-defined bridge network
@y
## Use IPv6 in a user-defined bridge network
@z

@x
When you create your network, you can specify the `--ipv6` flag to enable IPv6.
@y
When you create your network, you can specify the `--ipv6` flag to enable IPv6.
@z

% snip command...

@x
If you do not provide a `--subnet` option, a Unique Local Address (ULA) prefix
will be chosen automatically.
@y
If you do not provide a `--subnet` option, a Unique Local Address (ULA) prefix
will be chosen automatically.
@z

@x
## IPv6-only bridge networks
@y
## IPv6-only bridge networks
@z

@x
To skip IPv4 address configuration on the bridge and in its containers, create
the network with option `--ipv4=false`, and enable IPv6 using `--ipv6`.
@y
To skip IPv4 address configuration on the bridge and in its containers, create
the network with option `--ipv4=false`, and enable IPv6 using `--ipv6`.
@z

% snip command...

@x
IPv4 address configuration cannot be disabled in the default bridge network.
@y
IPv4 address configuration cannot be disabled in the default bridge network.
@z

@x
## Use the default bridge network
@y
## Use the default bridge network
@z

@x
The default `bridge` network is considered a legacy detail of Docker and is not
recommended for production use. Configuring it is a manual operation, and it has
[technical shortcomings](#differences-between-user-defined-bridges-and-the-default-bridge).
@y
The default `bridge` network is considered a legacy detail of Docker and is not
recommended for production use. Configuring it is a manual operation, and it has
[technical shortcomings](#differences-between-user-defined-bridges-and-the-default-bridge).
@z

@x
### Connect a container to the default bridge network
@y
### Connect a container to the default bridge network
@z

@x
If you do not specify a network using the `--network` flag, and you do specify a
network driver, your container is connected to the default `bridge` network by
default. Containers connected to the default `bridge` network can communicate,
but only by IP address, unless they're linked using the
[legacy `--link` flag](../links.md).
@y
If you do not specify a network using the `--network` flag, and you do specify a
network driver, your container is connected to the default `bridge` network by
default. Containers connected to the default `bridge` network can communicate,
but only by IP address, unless they're linked using the
[legacy `--link` flag](../links.md).
@z

@x
### Configure the default bridge network
@y
### Configure the default bridge network
@z

@x
To configure the default `bridge` network, you specify options in `daemon.json`.
Here is an example `daemon.json` with several options specified. Only specify
the settings you need to customize.
@y
To configure the default `bridge` network, you specify options in `daemon.json`.
Here is an example `daemon.json` with several options specified. Only specify
the settings you need to customize.
@z

% snip code...

@x
In this example:
@y
In this example:
@z

@x
- The bridge's address is "192.168.1.1/24" (from `bip`).
- The bridge network's subnet is "192.168.1.0/24" (from `bip`).
- Container addresses will be allocated from "192.168.1.0/25" (from `fixed-cidr`).
@y
- The bridge's address is "192.168.1.1/24" (from `bip`).
- The bridge network's subnet is "192.168.1.0/24" (from `bip`).
- Container addresses will be allocated from "192.168.1.0/25" (from `fixed-cidr`).
@z

@x
### Use IPv6 with the default bridge network
@y
### Use IPv6 with the default bridge network
@z

@x
IPv6 can be enabled for the default bridge using the following options in
`daemon.json`, or their command line equivalents.
@y
IPv6 can be enabled for the default bridge using the following options in
`daemon.json`, or their command line equivalents.
@z

@x
These three options only affect the default bridge, they are not used by
user-defined networks. The addresses in below are examples from the
IPv6 documentation range.
@y
These three options only affect the default bridge, they are not used by
user-defined networks. The addresses in below are examples from the
IPv6 documentation range.
@z

@x
- Option `ipv6` is required.
- Option `bip6` is optional, it specifies the address of the default bridge, which
  will be used as the default gateway by containers. It also specifies the subnet
  for the bridge network.
- Option `fixed-cidr-v6` is optional, it specifies the address range Docker may
  automatically allocate to containers.
  - The prefix should normally be `/64` or shorter.
  - For experimentation on a local network, it is better to use a Unique Local
    Address (ULA) prefix (matching `fd00::/8`) than a Link Local prefix (matching
    `fe80::/10`).
- Option `default-gateway-v6` is optional. If unspecified, the default is the first
  address in the `fixed-cidr-v6` subnet.
@y
- Option `ipv6` is required.
- Option `bip6` is optional, it specifies the address of the default bridge, which
  will be used as the default gateway by containers. It also specifies the subnet
  for the bridge network.
- Option `fixed-cidr-v6` is optional, it specifies the address range Docker may
  automatically allocate to containers.
  - The prefix should normally be `/64` or shorter.
  - For experimentation on a local network, it is better to use a Unique Local
    Address (ULA) prefix (matching `fd00::/8`) than a Link Local prefix (matching
    `fe80::/10`).
- Option `default-gateway-v6` is optional. If unspecified, the default is the first
  address in the `fixed-cidr-v6` subnet.
@z

% snip code...

@x
If no `bip6` is specified, `fixed-cidr-v6` defines the subnet for the bridge
network. If no `bip6` or `fixed-cidr-v6` is specified, a ULA prefix will be
chosen.
@y
If no `bip6` is specified, `fixed-cidr-v6` defines the subnet for the bridge
network. If no `bip6` or `fixed-cidr-v6` is specified, a ULA prefix will be
chosen.
@z

@x
Restart Docker for changes to take effect.
@y
Restart Docker for changes to take effect.
@z

@x
## Connection limit for bridge networks
@y
## Connection limit for bridge networks
@z

@x
Due to limitations set by the Linux kernel, bridge networks become unstable and
inter-container communications may break when 1000 containers or more connect
to a single network.
@y
Due to limitations set by the Linux kernel, bridge networks become unstable and
inter-container communications may break when 1000 containers or more connect
to a single network.
@z

@x
For more information about this limitation, see
[moby/moby#44973](https://github.com/moby/moby/issues/44973#issuecomment-1543747718).
@y
For more information about this limitation, see
[moby/moby#44973](https://github.com/moby/moby/issues/44973#issuecomment-1543747718).
@z

@x
## Skip Bridge IP address configuration
@y
## Skip Bridge IP address configuration
@z

@x
The bridge is normally assigned the network's `--gateway` address, which is
used as the default route from the bridge network to other networks.
@y
The bridge is normally assigned the network's `--gateway` address, which is
used as the default route from the bridge network to other networks.
@z

@x
The `com.docker.network.bridge.inhibit_ipv4` option lets you create a network
without the IPv4 gateway address being assigned to the bridge. This is useful
if you want to configure the gateway IP address for the bridge manually. For
instance if you add a physical interface to your bridge, and need it to have
the gateway address.
@y
The `com.docker.network.bridge.inhibit_ipv4` option lets you create a network
without the IPv4 gateway address being assigned to the bridge. This is useful
if you want to configure the gateway IP address for the bridge manually. For
instance if you add a physical interface to your bridge, and need it to have
the gateway address.
@z

@x
With this configuration, north-south traffic (to and from the bridge network)
won't work unless you've manually configured the gateway address on the bridge,
or a device attached to it.
@y
With this configuration, north-south traffic (to and from the bridge network)
won't work unless you've manually configured the gateway address on the bridge,
or a device attached to it.
@z

@x
This option can only be used with user-defined bridge networks.
@y
This option can only be used with user-defined bridge networks.
@z

@x
## Usage examples
@y
## Usage examples
@z

@x
This section provides hands-on examples for working with bridge networks.
@y
This section provides hands-on examples for working with bridge networks.
@z

@x
### Use the default bridge network
@y
### Use the default bridge network
@z

@x
This example shows how the default `bridge` network works. You start two
`alpine` containers on the default bridge and test how they communicate.
@y
This example shows how the default `bridge` network works. You start two
`alpine` containers on the default bridge and test how they communicate.
@z

@x
> [!NOTE]
> The default `bridge` network is not recommended for production. Use
> user-defined bridge networks instead.
@y
> [!NOTE]
> The default `bridge` network is not recommended for production. Use
> user-defined bridge networks instead.
@z

@x
1. List current networks:
@y
1. List current networks:
@z

% snip command...

@x
   The default `bridge` network is listed, along with `host` and `none`.
@y
   The default `bridge` network is listed, along with `host` and `none`.
@z

@x
2. Start two `alpine` containers running `ash`. The `-dit` flags mean detached,
   interactive, and with a TTY. Since you haven't specified a `--network` flag,
   the containers connect to the default `bridge` network.
@y
2. Start two `alpine` containers running `ash`. The `-dit` flags mean detached,
   interactive, and with a TTY. Since you haven't specified a `--network` flag,
   the containers connect to the default `bridge` network.
@z

% snip command...

@x
   Verify both containers are running:
@y
   Verify both containers are running:
@z

% snip command...

@x
3. Inspect the `bridge` network to see connected containers:
@y
3. Inspect the `bridge` network to see connected containers:
@z

% snip command...

@x
   The output shows both containers connected, with their assigned IP addresses
   (`172.17.0.2` for `alpine1` and `172.17.0.3` for `alpine2`).
@y
   The output shows both containers connected, with their assigned IP addresses
   (`172.17.0.2` for `alpine1` and `172.17.0.3` for `alpine2`).
@z

@x
4. Connect to `alpine1`:
@y
4. Connect to `alpine1`:
@z

% snip command...

@x
   Show the network interfaces for `alpine1` from within the container:
@y
   Show the network interfaces for `alpine1` from within the container:
@z

% snip command...

@x
   In this example, the `eth0` interface has the IP address `172.17.0.2`.
@y
   In this example, the `eth0` interface has the IP address `172.17.0.2`.
@z

@x
5. From within `alpine1`, verify you can connect to the internet:
@y
5. From within `alpine1`, verify you can connect to the internet:
@z

% snip command...

@x
6. Ping the second container by its IP address:
@y
6. Ping the second container by its IP address:
@z

% snip command...

@x
   This succeeds. Now try pinging by container name:
@y
   This succeeds. Now try pinging by container name:
@z

% snip command...

@x
   On the default bridge network, containers can't resolve each other by name.
@y
   On the default bridge network, containers can't resolve each other by name.
@z

@x
7. Detach from `alpine1` without stopping it using `CTRL+p CTRL+q`.
@y
7. Detach from `alpine1` without stopping it using `CTRL+p CTRL+q`.
@z

@x
8. Clean up: stop the containers and remove them.
@y
8. Clean up: stop the containers and remove them.
@z

% snip command...

@x
   Stopped containers lose their IP addresses.
@y
   Stopped containers lose their IP addresses.
@z

@x
### Use user-defined bridge networks
@y
### Use user-defined bridge networks
@z

@x
This example shows how user-defined bridge networks provide better isolation
and automatic DNS resolution between containers.
@y
This example shows how user-defined bridge networks provide better isolation
and automatic DNS resolution between containers.
@z

@x
1. Create the `alpine-net` network:
@y
1. Create the `alpine-net` network:
@z

% snip command...

@x
2. List Docker's networks:
@y
2. List Docker's networks:
@z

% snip command...

@x
   Inspect the `alpine-net` network:
@y
   Inspect the `alpine-net` network:
@z

% snip command...

@x
   This shows the network's gateway (for example, `172.18.0.1`) and that no
   containers are connected yet.
@y
   This shows the network's gateway (for example, `172.18.0.1`) and that no
   containers are connected yet.
@z

@x
3. Create four containers. Three connect to `alpine-net`, and one connects to
   the default `bridge`. Then connect one container to both networks:
@y
3. Create four containers. Three connect to `alpine-net`, and one connects to
   the default `bridge`. Then connect one container to both networks:
@z

% snip command...

@x
   Verify all containers are running:
@y
   Verify all containers are running:
@z

% snip command...

@x
4. Inspect both networks again to see which containers are connected:
@y
4. Inspect both networks again to see which containers are connected:
@z

% snip command...

@x
   Containers `alpine3` and `alpine4` are connected to the `bridge` network.
@y
   Containers `alpine3` and `alpine4` are connected to the `bridge` network.
@z

% snip command...

@x
   Containers `alpine1`, `alpine2`, and `alpine4` are connected to
   `alpine-net`.
@y
   Containers `alpine1`, `alpine2`, and `alpine4` are connected to
   `alpine-net`.
@z

@x
5. On user-defined networks, containers can resolve each other by name. Connect
   to `alpine1` and test:
@y
5. On user-defined networks, containers can resolve each other by name. Connect
   to `alpine1` and test:
@z

@x
   > [!NOTE]
   > Automatic service discovery only resolves custom container names, not
   > default automatically generated names.
@y
   > [!NOTE]
   > Automatic service discovery only resolves custom container names, not
   > default automatically generated names.
@z

% snip command...

@x
6. From `alpine1`, you can't connect to `alpine3` because it's on a different
   network:
@y
6. From `alpine1`, you can't connect to `alpine3` because it's on a different
   network:
@z

% snip command...

@x
   You also can't connect by IP address. If `alpine3`'s IP is `172.17.0.2`:
@y
   You also can't connect by IP address. If `alpine3`'s IP is `172.17.0.2`:
@z

% snip command...

@x
   Detach from `alpine1` using `CTRL+p CTRL+q`.
@y
   Detach from `alpine1` using `CTRL+p CTRL+q`.
@z

@x
7. Since `alpine4` is connected to both networks, it can reach all containers.
   However, you need to use `alpine3`'s IP address:
@y
7. Since `alpine4` is connected to both networks, it can reach all containers.
   However, you need to use `alpine3`'s IP address:
@z

% snip command...

@x
8. Verify all containers can connect to the internet:
@y
8. Verify all containers can connect to the internet:
@z

% snip command...

@x
   Detach with `CTRL+p CTRL+q` and repeat for `alpine3` and `alpine1` if
   desired.
@y
   Detach with `CTRL+p CTRL+q` and repeat for `alpine3` and `alpine1` if
   desired.
@z

@x
9. Clean up:
@y
9. Clean up:
@z

% snip command...

@x
## Next steps
@y
## Next steps
@z

@x
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [overlay networks](./overlay.md)
- Learn about [Macvlan networks](./macvlan.md)
@y
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [overlay networks](./overlay.md)
- Learn about [Macvlan networks](./macvlan.md)
@z
