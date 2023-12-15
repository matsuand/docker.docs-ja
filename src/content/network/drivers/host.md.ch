%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Host network driver
description: All about exposing containers on the Docker host's network
keywords: network, host, standalone, host mode networking
aliases:
- /network/host/
---
@y
---
title: Host network driver
description: All about exposing containers on the Docker host's network
keywords: network, host, standalone, host mode networking
aliases:
- /network/host/
---
@z

@x
If you use the `host` network mode for a container, that container's network
stack isn't isolated from the Docker host (the container shares the host's
networking namespace), and the container doesn't get its own IP-address allocated.
For instance, if you run a container which binds to port 80 and you use `host`
networking, the container's application is available on port 80 on the host's IP
address.
@y
If you use the `host` network mode for a container, that container's network
stack isn't isolated from the Docker host (the container shares the host's
networking namespace), and the container doesn't get its own IP-address allocated.
For instance, if you run a container which binds to port 80 and you use `host`
networking, the container's application is available on port 80 on the host's IP
address.
@z

@x
> **Note**
>
> Given that the container does not have its own IP-address when using
> `host` mode networking, [port-mapping](overlay.md#publish-ports) doesn't
> take effect, and the `-p`, `--publish`, `-P`, and `--publish-all` option are
> ignored, producing a warning instead:
>
> ```console
> WARNING: Published ports are discarded when using host network mode
> ```
@y
> **Note**
>
> Given that the container does not have its own IP-address when using
> `host` mode networking, [port-mapping](overlay.md#publish-ports) doesn't
> take effect, and the `-p`, `--publish`, `-P`, and `--publish-all` option are
> ignored, producing a warning instead:
>
> ```console
> WARNING: Published ports are discarded when using host network mode
> ```
@z

@x
Host mode networking can be useful for the following use cases:
@y
Host mode networking can be useful for the following use cases:
@z

@x
- To optimize performance
- In situations where a container needs to handle a large range of ports
@y
- To optimize performance
- In situations where a container needs to handle a large range of ports
@z

@x
This is because it doesn't require network address translation (NAT), and no "userland-proxy" is created for each port.
@y
This is because it doesn't require network address translation (NAT), and no "userland-proxy" is created for each port.
@z

@x
The host networking driver only works on Linux hosts, and is not supported on
Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
@y
The host networking driver only works on Linux hosts, and is not supported on
Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
@z

@x
You can also use a `host` network for a swarm service, by passing `--network host`
to the `docker service create` command. In this case, control traffic (traffic
related to managing the swarm and the service) is still sent across an overlay
network, but the individual swarm service containers send data using the Docker
daemon's host network and ports. This creates some extra limitations. For instance,
if a service container binds to port 80, only one service container can run on a
given swarm node.
@y
You can also use a `host` network for a swarm service, by passing `--network host`
to the `docker service create` command. In this case, control traffic (traffic
related to managing the swarm and the service) is still sent across an overlay
network, but the individual swarm service containers send data using the Docker
daemon's host network and ports. This creates some extra limitations. For instance,
if a service container binds to port 80, only one service container can run on a
given swarm node.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Go through the [host networking tutorial](../network-tutorial-host.md)
- Learn about [networking from the container's point of view](../index.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- Go through the [host networking tutorial](../network-tutorial-host.md)
- Learn about [networking from the container's point of view](../index.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@z
