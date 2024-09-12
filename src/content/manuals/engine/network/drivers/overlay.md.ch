%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Overlay network driver
description: All about using overlay networks
keywords: network, overlay, user-defined, swarm, service
@y
title: Overlay network driver
description: All about using overlay networks
keywords: network, overlay, user-defined, swarm, service
@z

@x
The `overlay` network driver creates a distributed network among multiple
Docker daemon hosts. This network sits on top of (overlays) the host-specific
networks, allowing containers connected to it to communicate securely when
encryption is enabled. Docker transparently handles routing of each packet to
and from the correct Docker daemon host and the correct destination container.
@y
The `overlay` network driver creates a distributed network among multiple
Docker daemon hosts. This network sits on top of (overlays) the host-specific
networks, allowing containers connected to it to communicate securely when
encryption is enabled. Docker transparently handles routing of each packet to
and from the correct Docker daemon host and the correct destination container.
@z

@x
You can create user-defined `overlay` networks using `docker network create`,
in the same way that you can create user-defined `bridge` networks. Services
or containers can be connected to more than one network at a time. Services or
containers can only communicate across networks they're each connected to.
@y
You can create user-defined `overlay` networks using `docker network create`,
in the same way that you can create user-defined `bridge` networks. Services
or containers can be connected to more than one network at a time. Services or
containers can only communicate across networks they're each connected to.
@z

@x
Overlay networks are often used to create a connection between Swarm services,
but you can also use it to connect standalone containers running on different
hosts. When using standalone containers, it's still required that you use
Swarm mode to establish a connection between the hosts.
@y
Overlay networks are often used to create a connection between Swarm services,
but you can also use it to connect standalone containers running on different
hosts. When using standalone containers, it's still required that you use
Swarm mode to establish a connection between the hosts.
@z

@x
This page describes overlay networks in general, and when used with standalone
containers. For information about overlay for Swarm services, see
[Manage Swarm service networks](/manuals/engine/swarm/networking.md).
@y
This page describes overlay networks in general, and when used with standalone
containers. For information about overlay for Swarm services, see
[Manage Swarm service networks](manuals/engine/swarm/networking.md).
@z

@x
## Create an overlay network
@y
## Create an overlay network
@z

@x
Before you start, you must ensure that participating nodes can communicate over the network.
The following table lists ports that need to be open to each host participating in an overlay network:
@y
Before you start, you must ensure that participating nodes can communicate over the network.
The following table lists ports that need to be open to each host participating in an overlay network:
@z

@x
| Ports                  | Description                                                                                                                                                          |
| :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `2377/tcp`             | The default Swarm control plane port, is configurable with [`docker swarm join --listen-addr`](/reference/cli/docker/swarm/join.md#--listen-addr-value) |
| `4789/udp`             | The default overlay traffic port, configurable with [`docker swarm init --data-path-addr`](/reference/cli/docker/swarm/init.md#data-path-port)          |
| `7946/tcp`, `7946/udp` | Used for communication among nodes, not configurable                                                                                                                 |
@y
| Ports                  | Description                                                                                                                                                          |
| :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `2377/tcp`             | The default Swarm control plane port, is configurable with [`docker swarm join --listen-addr`](reference/cli/docker/swarm/join.md#--listen-addr-value) |
| `4789/udp`             | The default overlay traffic port, configurable with [`docker swarm init --data-path-addr`](reference/cli/docker/swarm/init.md#data-path-port)          |
| `7946/tcp`, `7946/udp` | Used for communication among nodes, not configurable                                                                                                                 |
@z

@x
To create an overlay network that containers on other Docker hosts can connect to,
run the following command:
@y
To create an overlay network that containers on other Docker hosts can connect to,
run the following command:
@z

@x
```console
$ docker network create -d overlay --attachable my-attachable-overlay
```
@y
```console
$ docker network create -d overlay --attachable my-attachable-overlay
```
@z

@x
The `--attachable` option enables both standalone containers
and Swarm services to connect to the overlay network.
Without `--attachable`, only Swarm services can connect to the network.
@y
The `--attachable` option enables both standalone containers
and Swarm services to connect to the overlay network.
Without `--attachable`, only Swarm services can connect to the network.
@z

@x
You can specify the IP address range, subnet, gateway, and other options. See
`docker network create --help` for details.
@y
You can specify the IP address range, subnet, gateway, and other options. See
`docker network create --help` for details.
@z

@x
## Encrypt traffic on an overlay network
@y
## Encrypt traffic on an overlay network
@z

@x
Use the `--opt encrypted` flag to encrypt the application data
transmitted over the overlay network:
@y
Use the `--opt encrypted` flag to encrypt the application data
transmitted over the overlay network:
@z

@x
```console
$ docker network create \
  --opt encrypted \
  --driver overlay \
  --attachable \
  my-attachable-multi-host-network
```
@y
```console
$ docker network create \
  --opt encrypted \
  --driver overlay \
  --attachable \
  my-attachable-multi-host-network
```
@z

@x
This enables IPsec encryption at the level of the Virtual Extensible LAN (VXLAN).
This encryption imposes a non-negligible performance penalty,
so you should test this option before using it in production.
@y
This enables IPsec encryption at the level of the Virtual Extensible LAN (VXLAN).
This encryption imposes a non-negligible performance penalty,
so you should test this option before using it in production.
@z

@x
> [!WARNING]
>
> Don't attach Windows containers to encrypted overlay networks.
>
> Overlay network encryption isn't supported on Windows.
> Swarm doesn't report an error when a Windows host
> attempts to connect to an encrypted overlay network,
> but networking for the Windows containers is affected as follows:
>
> - Windows containers can't communicate with Linux containers on the network
> - Data traffic between Windows containers on the network isn't encrypted
@y
> [!WARNING]
>
> Don't attach Windows containers to encrypted overlay networks.
>
> Overlay network encryption isn't supported on Windows.
> Swarm doesn't report an error when a Windows host
> attempts to connect to an encrypted overlay network,
> but networking for the Windows containers is affected as follows:
>
> - Windows containers can't communicate with Linux containers on the network
> - Data traffic between Windows containers on the network isn't encrypted
@z

@x
## Attach a container to an overlay network
@y
## Attach a container to an overlay network
@z

@x
Adding containers to an overlay network gives them the ability to communicate
with other containers without having to set up routing on the individual Docker
daemon hosts. A prerequisite for doing this is that the hosts have joined the same Swarm.
@y
Adding containers to an overlay network gives them the ability to communicate
with other containers without having to set up routing on the individual Docker
daemon hosts. A prerequisite for doing this is that the hosts have joined the same Swarm.
@z

@x
To join an overlay network named `multi-host-network` with a `busybox` container:
@y
To join an overlay network named `multi-host-network` with a `busybox` container:
@z

@x
```console
$ docker run --network multi-host-network busybox sh
```
@y
```console
$ docker run --network multi-host-network busybox sh
```
@z

@x
> [!NOTE]
>
> This only works if the overlay network is attachable
> (created with the `--attachable` flag).
@y
> [!NOTE]
>
> This only works if the overlay network is attachable
> (created with the `--attachable` flag).
@z

@x
## Container discovery
@y
## Container discovery
@z

@x
Publishing ports of a container on an overlay network opens the ports to other
containers on the same network. Containers are discoverable by doing a DNS lookup
using the container name.
@y
Publishing ports of a container on an overlay network opens the ports to other
containers on the same network. Containers are discoverable by doing a DNS lookup
using the container name.
@z

@x
| Flag value                      | Description                                                                                                                                                 |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-p 8080:80`                    | Map TCP port 80 in the container to port `8080` on the overlay network.                                                                                     |
| `-p 8080:80/udp`                | Map UDP port 80 in the container to port `8080` on the overlay network.                                                                                     |
| `-p 8080:80/sctp`               | Map SCTP port 80 in the container to port `8080` on the overlay network.                                                                                    |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port 80 in the container to TCP port `8080` on the overlay network, and map UDP port 80 in the container to UDP port `8080` on the overlay network. |
@y
| Flag value                      | Description                                                                                                                                                 |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-p 8080:80`                    | Map TCP port 80 in the container to port `8080` on the overlay network.                                                                                     |
| `-p 8080:80/udp`                | Map UDP port 80 in the container to port `8080` on the overlay network.                                                                                     |
| `-p 8080:80/sctp`               | Map SCTP port 80 in the container to port `8080` on the overlay network.                                                                                    |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port 80 in the container to TCP port `8080` on the overlay network, and map UDP port 80 in the container to UDP port `8080` on the overlay network. |
@z

@x
## Connection limit for overlay networks
@y
## Connection limit for overlay networks
@z

@x
Due to limitations set by the Linux kernel, overlay networks become unstable and
inter-container communications may break when 1000 containers are co-located on
the same host.
@y
Due to limitations set by the Linux kernel, overlay networks become unstable and
inter-container communications may break when 1000 containers are co-located on
the same host.
@z

@x
For more information about this limitation, see
[moby/moby#44973](https://github.com/moby/moby/issues/44973#issuecomment-1543747718).
@y
For more information about this limitation, see
[moby/moby#44973](https://github.com/moby/moby/issues/44973#issuecomment-1543747718).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Go through the [overlay networking tutorial](/manuals/engine/network/tutorials/overlay.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [standalone bridge networks](bridge.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- Go through the [overlay networking tutorial](manuals/engine/network/tutorials/overlay.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [standalone bridge networks](bridge.md)
- Learn about [Macvlan networks](macvlan.md)
@z
