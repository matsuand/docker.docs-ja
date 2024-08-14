%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Network drivers overview
description: Learn the basics of Docker network drivers
keywords: networking, drivers, bridge, routing, routing mesh, overlay, ports
@y
title: Network drivers overview
description: Learn the basics of Docker network drivers
keywords: networking, drivers, bridge, routing, routing mesh, overlay, ports
@z

@x
Docker's networking subsystem is pluggable, using drivers. Several drivers
exist by default, and provide core networking functionality:
@y
Docker's networking subsystem is pluggable, using drivers. Several drivers
exist by default, and provide core networking functionality:
@z

@x
- `bridge`: The default network driver. If you don't specify a driver, this is
  the type of network you are creating. Bridge networks are commonly used when
  your application runs in a container that needs to communicate with other
  containers on the same host.
  See [Bridge network driver](bridge.md).
@y
- `bridge`: The default network driver. If you don't specify a driver, this is
  the type of network you are creating. Bridge networks are commonly used when
  your application runs in a container that needs to communicate with other
  containers on the same host.
  See [Bridge network driver](bridge.md).
@z

@x
- `host`: Remove network isolation between the container and the Docker host,
  and use the host's networking directly.
  See [Host network driver](host.md).
@y
- `host`: Remove network isolation between the container and the Docker host,
  and use the host's networking directly.
  See [Host network driver](host.md).
@z

@x
- `overlay`: Overlay networks connect multiple Docker daemons together and
  enable Swarm services and containers to communicate across nodes. This
  strategy removes the need to do OS-level routing.
  See [Overlay network driver](overlay.md).
@y
- `overlay`: Overlay networks connect multiple Docker daemons together and
  enable Swarm services and containers to communicate across nodes. This
  strategy removes the need to do OS-level routing.
  See [Overlay network driver](overlay.md).
@z

@x
- `ipvlan`: IPvlan networks give users total control over both IPv4 and IPv6
  addressing. The VLAN driver builds on top of that in giving operators complete
  control of layer 2 VLAN tagging and even IPvlan L3 routing for users
  interested in underlay network integration.
  See [IPvlan network driver](ipvlan.md).
@y
- `ipvlan`: IPvlan networks give users total control over both IPv4 and IPv6
  addressing. The VLAN driver builds on top of that in giving operators complete
  control of layer 2 VLAN tagging and even IPvlan L3 routing for users
  interested in underlay network integration.
  See [IPvlan network driver](ipvlan.md).
@z

@x
- `macvlan`: Macvlan networks allow you to assign a MAC address to a container,
  making it appear as a physical device on your network. The Docker daemon
  routes traffic to containers by their MAC addresses. Using the `macvlan`
  driver is sometimes the best choice when dealing with legacy applications that
  expect to be directly connected to the physical network, rather than routed
  through the Docker host's network stack.
  See [Macvlan network driver](macvlan.md).
@y
- `macvlan`: Macvlan networks allow you to assign a MAC address to a container,
  making it appear as a physical device on your network. The Docker daemon
  routes traffic to containers by their MAC addresses. Using the `macvlan`
  driver is sometimes the best choice when dealing with legacy applications that
  expect to be directly connected to the physical network, rather than routed
  through the Docker host's network stack.
  See [Macvlan network driver](macvlan.md).
@z

@x
- `none`: Completely isolate a container from the host and other containers.
  `none` is not available for Swarm services.
  See [None network driver](none.md).
@y
- `none`: Completely isolate a container from the host and other containers.
  `none` is not available for Swarm services.
  See [None network driver](none.md).
@z

@x
- [Network plugins](/engine/extend/plugins_services/): You can install and use
  third-party network plugins with Docker.
@y
- [Network plugins](engine/extend/plugins_services/): You can install and use
  third-party network plugins with Docker.
@z

@x
### Network driver summary
@y
### Network driver summary
@z

@x
- The default bridge network is good for running containers that don't require
  special networking capabilities.
- User-defined bridge networks enable containers on the same Docker host to
  communicate with each other. A user-defined network typically defines an
  isolated network for multiple containers belonging to a common project or
  component.
- Host network shares the host's network with the container. When you use this
  driver, the container's network isn't isolated from the host.
- Overlay networks are best when you need containers running on different
  Docker hosts to communicate, or when multiple applications work together
  using Swarm services.
- Macvlan networks are best when you are migrating from a VM setup or need your
  containers to look like physical hosts on your network, each with a unique
  MAC address.
- IPvlan is similar to Macvlan, but doesn't assign unique MAC addresses to
  containers. Consider using IPvlan when there's a restriction on the number of
  MAC addresses that can be assigned to a network interface or port.
- Third-party network plugins allow you to integrate Docker with specialized
  network stacks.
@y
- The default bridge network is good for running containers that don't require
  special networking capabilities.
- User-defined bridge networks enable containers on the same Docker host to
  communicate with each other. A user-defined network typically defines an
  isolated network for multiple containers belonging to a common project or
  component.
- Host network shares the host's network with the container. When you use this
  driver, the container's network isn't isolated from the host.
- Overlay networks are best when you need containers running on different
  Docker hosts to communicate, or when multiple applications work together
  using Swarm services.
- Macvlan networks are best when you are migrating from a VM setup or need your
  containers to look like physical hosts on your network, each with a unique
  MAC address.
- IPvlan is similar to Macvlan, but doesn't assign unique MAC addresses to
  containers. Consider using IPvlan when there's a restriction on the number of
  MAC addresses that can be assigned to a network interface or port.
- Third-party network plugins allow you to integrate Docker with specialized
  network stacks.
@z

@x
## Networking tutorials
@y
## Networking tutorials
@z

@x
Now that you understand the basics about Docker networks, deepen your
understanding using the following tutorials:
@y
Now that you understand the basics about Docker networks, deepen your
understanding using the following tutorials:
@z

@x
- [Standalone networking tutorial](/engine/network/tutorials/standalone.md)
- [Host networking tutorial](/engine/network/tutorials/host.md)
- [Overlay networking tutorial](/engine/network/tutorials/overlay.md)
- [Macvlan networking tutorial](/engine/network/tutorials/macvlan.md)
@y
- [Standalone networking tutorial](engine/network/tutorials/standalone.md)
- [Host networking tutorial](engine/network/tutorials/host.md)
- [Overlay networking tutorial](engine/network/tutorials/overlay.md)
- [Macvlan networking tutorial](engine/network/tutorials/macvlan.md)
@z
