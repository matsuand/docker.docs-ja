%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
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
In terms of networking, a bridge network is a Link Layer device
which forwards traffic between network segments. A bridge can be a hardware
device or a software device running within a host machine's kernel.
@y
In terms of networking, a bridge network is a Link Layer device
which forwards traffic between network segments. A bridge can be a hardware
device or a software device running within a host machine's kernel.
@z

@x
In terms of Docker, a bridge network uses a software bridge which lets
containers connected to the same bridge network communicate, while providing
isolation from containers that aren't connected to that bridge network. The
Docker bridge driver automatically installs rules in the host machine so that
containers on different bridge networks can't communicate directly with each
other.
@y
In terms of Docker, a bridge network uses a software bridge which lets
containers connected to the same bridge network communicate, while providing
isolation from containers that aren't connected to that bridge network. The
Docker bridge driver automatically installs rules in the host machine so that
containers on different bridge networks can't communicate directly with each
other.
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
@y
  Originally, the only way to share environment variables between two containers
  was to link them using the [`--link` flag](../links.md). This type of
  variable sharing isn't possible with user-defined networks. However, there
  are superior ways to share environment variables. A few ideas:
@z

@x
  - Multiple containers can mount a file or directory containing the shared
    information, using a Docker volume.
@y
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
|-------------------------------------------------------------------------------------------------|-----------------------------|-----------------------------------------------------------------------------------------------------|
| `com.docker.network.bridge.name`                                                                |                             | Interface name to use when creating the Linux bridge.                                               |
| `com.docker.network.bridge.enable_ip_masquerade`                                                | `true`                      | Enable IP masquerading.                                                                             |
| `com.docker.network.bridge.gateway_mode_ipv4`<br/>`com.docker.network.bridge.gateway_mode_ipv6` | `nat`                       | Control external connectivity. See [Packet filtering and firewalls](packet-filtering-firewalls.md). |
| `com.docker.network.bridge.enable_icc`                                                          | `true`                      | Enable or Disable inter-container connectivity.                                                     |
| `com.docker.network.bridge.host_binding_ipv4`                                                   | all IPv4 and IPv6 addresses | Default IP when binding container ports.                                                            |
| `com.docker.network.driver.mtu`                                                                 | `0` (no limit)              | Set the containers network Maximum Transmission Unit (MTU).                                         |
| `com.docker.network.container_iface_prefix`                                                     | `eth`                       | Set a custom prefix for container interfaces.                                                       |
| `com.docker.network.bridge.inhibit_ipv4`                                                        | `false`                     | Prevent Docker from [assigning an IP address](#skip-bridge-ip-address-configuration) to the bridge. |
@y
| Option                                                                                          | Default                     | Description                                                                                         |
|-------------------------------------------------------------------------------------------------|-----------------------------|-----------------------------------------------------------------------------------------------------|
| `com.docker.network.bridge.name`                                                                |                             | Interface name to use when creating the Linux bridge.                                               |
| `com.docker.network.bridge.enable_ip_masquerade`                                                | `true`                      | Enable IP masquerading.                                                                             |
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

@x
```console
$ docker network create my-net
```
@y
```console
$ docker network create my-net
```
@z

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

@x
```console
$ docker network rm my-net
```
@y
```console
$ docker network rm my-net
```
@z

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

@x
```console
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```
@y
```console
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```
@z

@x
To connect a **running** container to an existing user-defined bridge, use the
`docker network connect` command. The following command connects an already-running
`my-nginx` container to an already-existing `my-net` network:
@y
To connect a **running** container to an existing user-defined bridge, use the
`docker network connect` command. The following command connects an already-running
`my-nginx` container to an already-existing `my-net` network:
@z

@x
```console
$ docker network connect my-net my-nginx
```
@y
```console
$ docker network connect my-net my-nginx
```
@z

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

@x
```console
$ docker network disconnect my-net my-nginx
```
@y
```console
$ docker network disconnect my-net my-nginx
```
@z

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

@x
```console
$ docker network create --ipv6 --subnet 2001:db8:1234::/64 my-net
```
@y
```console
$ docker network create --ipv6 --subnet 2001:db8:1234::/64 my-net
```
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

@x
```json
{
  "bip": "192.168.1.1/24",
  "fixed-cidr": "192.168.1.0/25",
  "mtu": 1500,
  "default-gateway": "192.168.1.254",
  "dns": ["10.20.1.2","10.20.1.3"]
}
```
@y
```json
{
  "bip": "192.168.1.1/24",
  "fixed-cidr": "192.168.1.0/25",
  "mtu": 1500,
  "default-gateway": "192.168.1.254",
  "dns": ["10.20.1.2","10.20.1.3"]
}
```
@z

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
## Next steps
@y
## Next steps
@z

@x
- Go through the [standalone networking tutorial](/manuals/engine/network/tutorials/standalone.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [overlay networks](./overlay.md)
- Learn about [Macvlan networks](./macvlan.md)
@y
- Go through the [standalone networking tutorial](manuals/engine/network/tutorials/standalone.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [overlay networks](./overlay.md)
- Learn about [Macvlan networks](./macvlan.md)
@z
