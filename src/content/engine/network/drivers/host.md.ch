%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Host network driver
description: All about exposing containers on the Docker host's network
keywords: network, host, standalone, host mode networking
@y
title: Host network driver
description: All about exposing containers on the Docker host's network
keywords: network, host, standalone, host mode networking
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
> [!NOTE]
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
> [!NOTE]
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
The host networking driver only works on Linux hosts, but is available as a Beta feature, on Docker Desktop version 4.29 and later.
@y
The host networking driver only works on Linux hosts, but is available as a Beta feature, on Docker Desktop version 4.29 and later.
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
## Docker Desktop
@y
## Docker Desktop
@z

@x
Host networking is also supported on Docker Desktop version 4.29 and later for Mac,
Windows, and Linux as a [beta feature](/release-lifecycle.md#beta). To enable this feature, navigate to the **Features in development** tab in **Settings**, and then select **Enable host networking**.
@y
Host networking is also supported on Docker Desktop version 4.29 and later for Mac,
Windows, and Linux as a [beta feature](release-lifecycle.md#beta). To enable this feature, navigate to the **Features in development** tab in **Settings**, and then select **Enable host networking**.
@z

@x
This feature works in both directions. This means you can
access a server that is running in a container from your host and you can access
servers running on your host from any container that is started with host
networking enabled. TCP as well as UDP are supported as communication protocols.
@y
This feature works in both directions. This means you can
access a server that is running in a container from your host and you can access
servers running on your host from any container that is started with host
networking enabled. TCP as well as UDP are supported as communication protocols.
@z

@x
### Examples
@y
### Examples
@z

@x
The following command starts netcat in a container that listens on port `8000`:
@y
The following command starts netcat in a container that listens on port `8000`:
@z

@x
```console
$ docker run --rm -it --net=host nicolaka/netshoot nc -lkv 0.0.0.0 8000
```
@y
```console
$ docker run --rm -it --net=host nicolaka/netshoot nc -lkv 0.0.0.0 8000
```
@z

@x
Port `8000` will then be available on the host and you can connect to it with the following
command from another terminal:
@y
Port `8000` will then be available on the host and you can connect to it with the following
command from another terminal:
@z

@x
```console
$ nc localhost 8000
```
@y
```console
$ nc localhost 8000
```
@z

@x
What you type in here will then appear on the terminal where the container is
running.
@y
What you type in here will then appear on the terminal where the container is
running.
@z

@x
To access a service running on the host from the container, you can start a container with
host networking enabled with this command:
@y
To access a service running on the host from the container, you can start a container with
host networking enabled with this command:
@z

@x
```console
$ docker run --rm -it --net=host nicolaka/netshoot
```
@y
```console
$ docker run --rm -it --net=host nicolaka/netshoot
```
@z

@x
If you then want to access a service on your host from the container (in this
example a web server running on port `80`), you can do it like this:
@y
If you then want to access a service on your host from the container (in this
example a web server running on port `80`), you can do it like this:
@z

@x
```console
$ nc localhost 80
```
@y
```console
$ nc localhost 80
```
@z

@x
### Limitations
@y
### Limitations
@z

@x
- Processes inside the container cannot bind to the IP addresses of the host
 because the container has no direct access to the interfaces of the host.
- The host network feature of Docker Desktop works on layer 4. This means that
unlike with Docker on Linux, network protocols that operate below TCP or UDP are
not supported.
- This feature doesn't work with Enhanced Container Isolation enabled, since
isolating your containers from the host and allowing them access to the host
network contradict each other.
- Only Linux containers are supported. Host networking does not work with
  Windows containers.
@y
- Processes inside the container cannot bind to the IP addresses of the host
 because the container has no direct access to the interfaces of the host.
- The host network feature of Docker Desktop works on layer 4. This means that
unlike with Docker on Linux, network protocols that operate below TCP or UDP are
not supported.
- This feature doesn't work with Enhanced Container Isolation enabled, since
isolating your containers from the host and allowing them access to the host
network contradict each other.
- Only Linux containers are supported. Host networking does not work with
  Windows containers.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Go through the [host networking tutorial](/engine/network/tutorials/host.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [bridge networks](./bridge.md)
- Learn about [overlay networks](./overlay.md)
- Learn about [Macvlan networks](./macvlan.md)
@y
- Go through the [host networking tutorial](engine/network/tutorials/host.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [bridge networks](./bridge.md)
- Learn about [overlay networks](./overlay.md)
- Learn about [Macvlan networks](./macvlan.md)
@z
