%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Networking overview
linkTitle: Networking
@y
title: Networking overview
linkTitle: Networking
@z

@x
description: Learn how networking works from the container's point of view
keywords: networking, container, standalone, IP address, DNS resolution
@y
description: Learn how networking works from the container's point of view
keywords: networking, container, standalone, IP address, DNS resolution
@z

@x
Container networking refers to the ability for containers to connect to and
communicate with each other, and with non-Docker network services.
@y
Container networking refers to the ability for containers to connect to and
communicate with each other, and with non-Docker network services.
@z

@x
Containers have networking enabled by default, and they can make outgoing
connections. A container has no information about what kind of network it's
attached to, or whether its network peers are also Docker containers. A
container only sees a network interface with an IP address, a gateway, a
routing table, DNS services, and other networking details.
@y
Containers have networking enabled by default, and they can make outgoing
connections. A container has no information about what kind of network it's
attached to, or whether its network peers are also Docker containers. A
container only sees a network interface with an IP address, a gateway, a
routing table, DNS services, and other networking details.
@z

@x
This page describes networking from the point of view of the container,
and the concepts around container networking.
@y
This page describes networking from the point of view of the container,
and the concepts around container networking.
@z

@x
When Docker Engine on Linux starts for the first time, it has a single
built-in network called the "default bridge" network. When you run a
container without the `--network` option, it is connected to the default
bridge.
@y
When Docker Engine on Linux starts for the first time, it has a single
built-in network called the "default bridge" network. When you run a
container without the `--network` option, it is connected to the default
bridge.
@z

@x
Containers attached to the default bridge have access to network services
outside the Docker host. They use "masquerading" which means, if the
Docker host has Internet access, no additional configuration is needed
for the container to have Internet access.
@y
Containers attached to the default bridge have access to network services
outside the Docker host. They use "masquerading" which means, if the
Docker host has Internet access, no additional configuration is needed
for the container to have Internet access.
@z

@x
For example, to run a container on the default bridge network, and have
it ping an Internet host:
@y
For example, to run a container on the default bridge network, and have
it ping an Internet host:
@z

@x
```console
$ docker run --rm -ti busybox ping -c1 docker.com
PING docker.com (23.185.0.4): 56 data bytes
64 bytes from 23.185.0.4: seq=0 ttl=62 time=6.564 ms
@y
```console
$ docker run --rm -ti busybox ping -c1 docker.com
PING docker.com (23.185.0.4): 56 data bytes
64 bytes from 23.185.0.4: seq=0 ttl=62 time=6.564 ms
@z

@x
--- docker.com ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 6.564/6.564/6.564 ms
```
@y
--- docker.com ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 6.564/6.564/6.564 ms
```
@z

@x
## User-defined networks
@y
## User-defined networks
@z

@x
With the default configuration, containers attached to the default
bridge network have unrestricted network access to each other using
container IP addresses. They cannot refer to each other by name.
@y
With the default configuration, containers attached to the default
bridge network have unrestricted network access to each other using
container IP addresses. They cannot refer to each other by name.
@z

@x
It can be useful to separate groups of containers that should have full
access to each other, but restricted access to containers in other groups.
@y
It can be useful to separate groups of containers that should have full
access to each other, but restricted access to containers in other groups.
@z

@x
You can create custom, user-defined networks, and connect groups of containers
to the same network. Once connected to a user-defined network, containers
can communicate with each other using container IP addresses or container names.
@y
You can create custom, user-defined networks, and connect groups of containers
to the same network. Once connected to a user-defined network, containers
can communicate with each other using container IP addresses or container names.
@z

@x
The following example creates a network using the `bridge` network driver and
runs a container in that network:
@y
The following example creates a network using the `bridge` network driver and
runs a container in that network:
@z

@x
```console
$ docker network create -d bridge my-net
$ docker run --network=my-net -it busybox
```
@y
```console
$ docker network create -d bridge my-net
$ docker run --network=my-net -it busybox
```
@z

@x
### Drivers
@y
### Drivers
@z

@x
Docker Engine has a number of network drivers, as well as the default "bridge".
On Linux, the following built-in network drivers are available:
@y
Docker Engine has a number of network drivers, as well as the default "bridge".
On Linux, the following built-in network drivers are available:
@z

@x
| Driver                          | Description                                                         |
|:--------------------------------|:--------------------------------------------------------------------|
| [bridge](./drivers/bridge.md)   | The default network driver.                                         |
| [host](./drivers/host.md)       | Remove network isolation between the container and the Docker host. |
| [none](./drivers/none.md)       | Completely isolate a container from the host and other containers.  |
| [overlay](./drivers/overlay.md) | Swarm Overlay networks connect multiple Docker daemons together.    |
| [ipvlan](./drivers/ipvlan.md)   | Connect containers to external VLANs.                               |
| [macvlan](./drivers/macvlan.md) | Containers appear as devices on the host's network.                 |
@y
| Driver                          | Description                                                         |
|:--------------------------------|:--------------------------------------------------------------------|
| [bridge](./drivers/bridge.md)   | The default network driver.                                         |
| [host](./drivers/host.md)       | Remove network isolation between the container and the Docker host. |
| [none](./drivers/none.md)       | Completely isolate a container from the host and other containers.  |
| [overlay](./drivers/overlay.md) | Swarm Overlay networks connect multiple Docker daemons together.    |
| [ipvlan](./drivers/ipvlan.md)   | Connect containers to external VLANs.                               |
| [macvlan](./drivers/macvlan.md) | Containers appear as devices on the host's network.                 |
@z

@x
More information can be found in the network driver specific pages, including
their configuration options and details about their functionality.
@y
More information can be found in the network driver specific pages, including
their configuration options and details about their functionality.
@z

@x
Native Windows containers have a different set of drivers, see
[Windows container network drivers](https://learn.microsoft.com/en-us/virtualization/windowscontainers/container-networking/network-drivers-topologies).
@y
Native Windows containers have a different set of drivers, see
[Windows container network drivers](https://learn.microsoft.com/en-us/virtualization/windowscontainers/container-networking/network-drivers-topologies).
@z

@x
### Connecting to multiple networks
@y
### Connecting to multiple networks
@z

@x
Connecting a container to a network can be compared to connecting an Ethernet
cable to a physical host. Just as a host can be connected to multiple Ethernet
networks, a container can be connected to multiple Docker networks.
@y
Connecting a container to a network can be compared to connecting an Ethernet
cable to a physical host. Just as a host can be connected to multiple Ethernet
networks, a container can be connected to multiple Docker networks.
@z

@x
For example, a frontend container may be connected to a bridge network
with external access, and a
[`--internal`](/reference/cli/docker/network/create/#internal) network
to communicate with containers running backend services that do not need
external network access.
@y
For example, a frontend container may be connected to a bridge network
with external access, and a
[`--internal`](__SUBDIR__/reference/cli/docker/network/create/#internal) network
to communicate with containers running backend services that do not need
external network access.
@z

@x
A container may also be connected to different types of network. For example,
an `ipvlan` network to provide internet access, and a `bridge` network for
access to local services.
@y
A container may also be connected to different types of network. For example,
an `ipvlan` network to provide internet access, and a `bridge` network for
access to local services.
@z

@x
Containers can also share networking stacks, see [Container networks](#container-networks).
@y
Containers can also share networking stacks, see [Container networks](#container-networks).
@z

@x
When sending packets, if the destination is an address in a directly connected
network, packets are sent to that network. Otherwise, packets are sent to
a default gateway for routing to their destination. In the example above,
the `ipvlan` network's gateway must be the default gateway.
@y
When sending packets, if the destination is an address in a directly connected
network, packets are sent to that network. Otherwise, packets are sent to
a default gateway for routing to their destination. In the example above,
the `ipvlan` network's gateway must be the default gateway.
@z

@x
The default gateway is selected by Docker, and may change whenever a
container's network connections change.
To make Docker choose a specific default gateway when creating the container
or connecting a new network, set a gateway priority. See option `gw-priority`
for the [`docker run`](/reference/cli/docker/container/run.md) and
[`docker network connect`](/reference/cli/docker/network/connect.md) commands.
@y
The default gateway is selected by Docker, and may change whenever a
container's network connections change.
To make Docker choose a specific default gateway when creating the container
or connecting a new network, set a gateway priority. See option `gw-priority`
for the [`docker run`](reference/cli/docker/container/run.md) and
[`docker network connect`](reference/cli/docker/network/connect.md) commands.
@z

@x
The default `gw-priority` is `0` and the gateway in the network with the
highest priority is the default gateway. So, when a network should always
be the default gateway, it is enough to set its `gw-priority` to `1`.
@y
The default `gw-priority` is `0` and the gateway in the network with the
highest priority is the default gateway. So, when a network should always
be the default gateway, it is enough to set its `gw-priority` to `1`.
@z

@x
```console
$ docker run --network name=gwnet,gw-priority=1 --network anet1 --name myctr myimage
$ docker network connect anet2 myctr
```
@y
```console
$ docker run --network name=gwnet,gw-priority=1 --network anet1 --name myctr myimage
$ docker network connect anet2 myctr
```
@z

@x
## Published ports
@y
## Published ports
@z

@x
When you create or run a container using `docker create` or `docker run`, all
ports of containers on bridge networks are accessible from the Docker host and
other containers connected to the same network. Ports are not accessible from
outside the host or, with the default configuration, from containers in other
networks.
@y
When you create or run a container using `docker create` or `docker run`, all
ports of containers on bridge networks are accessible from the Docker host and
other containers connected to the same network. Ports are not accessible from
outside the host or, with the default configuration, from containers in other
networks.
@z

@x
Use the `--publish` or `-p` flag to make a port available outside the host,
and to containers in other bridge networks.
@y
Use the `--publish` or `-p` flag to make a port available outside the host,
and to containers in other bridge networks.
@z

@x
For more information about port mapping, including how to disable it and use
direct routing to containers, see
[port publishing](./port-publishing.md).
@y
For more information about port mapping, including how to disable it and use
direct routing to containers, see
[port publishing](./port-publishing.md).
@z

@x
## IP address and hostname
@y
## IP address and hostname
@z

@x
When creating a network, IPv4 address allocation is enabled by default, it
can be disabled using `--ipv4=false`. IPv6 address allocation can be enabled
using `--ipv6`.
@y
When creating a network, IPv4 address allocation is enabled by default, it
can be disabled using `--ipv4=false`. IPv6 address allocation can be enabled
using `--ipv6`.
@z

@x
```console
$ docker network create --ipv6 --ipv4=false v6net
```
@y
```console
$ docker network create --ipv6 --ipv4=false v6net
```
@z

@x
By default, the container gets an IP address for every Docker network it attaches to.
A container receives an IP address out of the IP subnet of the network.
The Docker daemon performs dynamic subnetting and IP address allocation for containers.
Each network also has a default subnet mask and gateway.
@y
By default, the container gets an IP address for every Docker network it attaches to.
A container receives an IP address out of the IP subnet of the network.
The Docker daemon performs dynamic subnetting and IP address allocation for containers.
Each network also has a default subnet mask and gateway.
@z

@x
You can connect a running container to multiple networks,
either by passing the `--network` flag multiple times when creating the container,
or using the `docker network connect` command for already running containers.
In both cases, you can use the `--ip` or `--ip6` flags to specify the container's IP address on that particular network.
@y
You can connect a running container to multiple networks,
either by passing the `--network` flag multiple times when creating the container,
or using the `docker network connect` command for already running containers.
In both cases, you can use the `--ip` or `--ip6` flags to specify the container's IP address on that particular network.
@z

@x
In the same way, a container's hostname defaults to be the container's ID in Docker.
You can override the hostname using `--hostname`.
When connecting to an existing network using `docker network connect`,
you can use the `--alias` flag to specify an additional network alias for the container on that network.
@y
In the same way, a container's hostname defaults to be the container's ID in Docker.
You can override the hostname using `--hostname`.
When connecting to an existing network using `docker network connect`,
you can use the `--alias` flag to specify an additional network alias for the container on that network.
@z

@x
## DNS services
@y
## DNS services
@z

@x
Containers use the same DNS servers as the host by default, but you can
override this with `--dns`.
@y
Containers use the same DNS servers as the host by default, but you can
override this with `--dns`.
@z

@x
By default, containers inherit the DNS settings as defined in the
`/etc/resolv.conf` configuration file.
Containers that attach to the default `bridge` network receive a copy of this file.
Containers that attach to a
[custom network](tutorials/standalone.md#use-user-defined-bridge-networks)
use Docker's embedded DNS server.
The embedded DNS server forwards external DNS lookups to the DNS servers configured on the host.
@y
By default, containers inherit the DNS settings as defined in the
`/etc/resolv.conf` configuration file.
Containers that attach to the default `bridge` network receive a copy of this file.
Containers that attach to a
[custom network](tutorials/standalone.md#use-user-defined-bridge-networks)
use Docker's embedded DNS server.
The embedded DNS server forwards external DNS lookups to the DNS servers configured on the host.
@z

@x
You can configure DNS resolution on a per-container basis, using flags for the
`docker run` or `docker create` command used to start the container.
The following table describes the available `docker run` flags related to DNS
configuration.
@y
You can configure DNS resolution on a per-container basis, using flags for the
`docker run` or `docker create` command used to start the container.
The following table describes the available `docker run` flags related to DNS
configuration.
@z

@x
| Flag           | Description                                                                                                                                                                                                                                           |
| -------------- |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--dns`        | The IP address of a DNS server. To specify multiple DNS servers, use multiple `--dns` flags. DNS requests will be forwarded from the container's network namespace so, for example, `--dns=127.0.0.1` refers to the container's own loopback address. |
| `--dns-search` | A DNS search domain to search non-fully qualified hostnames. To specify multiple DNS search prefixes, use multiple `--dns-search` flags.                                                                                                              |
| `--dns-opt`    | A key-value pair representing a DNS option and its value. See your operating system's documentation for `resolv.conf` for valid options.                                                                                                              |
| `--hostname`   | The hostname a container uses for itself. Defaults to the container's ID if not specified.                                                                                                                                                            |
@y
| Flag           | Description                                                                                                                                                                                                                                           |
| -------------- |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--dns`        | The IP address of a DNS server. To specify multiple DNS servers, use multiple `--dns` flags. DNS requests will be forwarded from the container's network namespace so, for example, `--dns=127.0.0.1` refers to the container's own loopback address. |
| `--dns-search` | A DNS search domain to search non-fully qualified hostnames. To specify multiple DNS search prefixes, use multiple `--dns-search` flags.                                                                                                              |
| `--dns-opt`    | A key-value pair representing a DNS option and its value. See your operating system's documentation for `resolv.conf` for valid options.                                                                                                              |
| `--hostname`   | The hostname a container uses for itself. Defaults to the container's ID if not specified.                                                                                                                                                            |
@z

@x
### Custom hosts
@y
### Custom hosts
@z

@x
Your container will have lines in `/etc/hosts` which define the hostname of the
container itself, as well as `localhost` and a few other common things. Custom
hosts, defined in `/etc/hosts` on the host machine, aren't inherited by
containers. To pass additional hosts into a container, refer to [add entries to
container hosts file](/reference/cli/docker/container/run.md#add-host) in the
`docker run` reference documentation.
@y
Your container will have lines in `/etc/hosts` which define the hostname of the
container itself, as well as `localhost` and a few other common things. Custom
hosts, defined in `/etc/hosts` on the host machine, aren't inherited by
containers. To pass additional hosts into a container, refer to [add entries to
container hosts file](reference/cli/docker/container/run.md#add-host) in the
`docker run` reference documentation.
@z

@x
## Container networks
@y
## Container networks
@z

@x
In addition to user-defined networks, you can attach a container to another
container's networking stack directly, using the `--network
container:<name|id>` flag format.
@y
In addition to user-defined networks, you can attach a container to another
container's networking stack directly, using the `--network
container:<name|id>` flag format.
@z

@x
The following flags aren't supported for containers using the `container:`
networking mode:
@y
The following flags aren't supported for containers using the `container:`
networking mode:
@z

@x
- `--add-host`
- `--hostname`
- `--dns`
- `--dns-search`
- `--dns-option`
- `--mac-address`
- `--publish`
- `--publish-all`
- `--expose`
@y
- `--add-host`
- `--hostname`
- `--dns`
- `--dns-search`
- `--dns-option`
- `--mac-address`
- `--publish`
- `--publish-all`
- `--expose`
@z

@x
The following example runs a Redis container, with Redis binding to
127.0.0.1, then running the `redis-cli` command and connecting to the Redis
server over 127.0.0.1.
@y
The following example runs a Redis container, with Redis binding to
127.0.0.1, then running the `redis-cli` command and connecting to the Redis
server over 127.0.0.1.
@z

@x
```console
$ docker run -d --name redis redis --bind 127.0.0.1
$ docker run --rm -it --network container:redis redis redis-cli -h 127.0.0.1
```
@y
```console
$ docker run -d --name redis redis --bind 127.0.0.1
$ docker run --rm -it --network container:redis redis redis-cli -h 127.0.0.1
```
@z
