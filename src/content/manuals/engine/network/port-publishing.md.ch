%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Port publishing and mapping
@y
title: Port publishing and mapping
@z

@x
description: Accessing container ports
keywords: network, iptables, firewall
@y
description: Accessing container ports
keywords: network, iptables, firewall
@z

@x
By default, for both IPv4 and IPv6, the Docker daemon blocks access to ports that
have not been published. Published container ports are mapped to host IP addresses.
To do this, it uses firewall rules to perform Network Address Translation (NAT),
Port Address Translation (PAT), and masquerading.
@y
By default, for both IPv4 and IPv6, the Docker daemon blocks access to ports that
have not been published. Published container ports are mapped to host IP addresses.
To do this, it uses firewall rules to perform Network Address Translation (NAT),
Port Address Translation (PAT), and masquerading.
@z

@x
For example, `docker run -p 8080:80 [...]` creates a mapping
between port 8080 on any address on the Docker host, and the container's
port 80. Outgoing connections from the container will masquerade, using
the Docker host's IP address.
@y
For example, `docker run -p 8080:80 [...]` creates a mapping
between port 8080 on any address on the Docker host, and the container's
port 80. Outgoing connections from the container will masquerade, using
the Docker host's IP address.
@z

@x
## Publishing ports
@y
## Publishing ports
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
This creates a firewall rule in the host,
mapping a container port to a port on the Docker host to the outside world.
Here are some examples:
@y
This creates a firewall rule in the host,
mapping a container port to a port on the Docker host to the outside world.
Here are some examples:
@z

@x
| Flag value                      | Description                                                                                                                                             |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-p 8080:80`                    | Map port `8080` on the Docker host to TCP port `80` in the container.                                                                                   |
| `-p 192.168.1.100:8080:80`      | Map port `8080` on the Docker host IP `192.168.1.100` to TCP port `80` in the container.                                                                |
| `-p 8080:80/udp`                | Map port `8080` on the Docker host to UDP port `80` in the container.                                                                                   |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port `8080` on the Docker host to TCP port `80` in the container, and map UDP port `8080` on the Docker host to UDP port `80` in the container. |
@y
| Flag value                      | Description                                                                                                                                             |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-p 8080:80`                    | Map port `8080` on the Docker host to TCP port `80` in the container.                                                                                   |
| `-p 192.168.1.100:8080:80`      | Map port `8080` on the Docker host IP `192.168.1.100` to TCP port `80` in the container.                                                                |
| `-p 8080:80/udp`                | Map port `8080` on the Docker host to UDP port `80` in the container.                                                                                   |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port `8080` on the Docker host to TCP port `80` in the container, and map UDP port `8080` on the Docker host to UDP port `80` in the container. |
@z

@x
> [!IMPORTANT]
>
> Publishing container ports is insecure by default. Meaning, when you publish
> a container's ports it becomes available not only to the Docker host, but to
> the outside world as well.
>
> If you include the localhost IP address (`127.0.0.1`, or `::1`) with the
> publish flag, only the Docker host can access the published container port.
>
> ```console
> $ docker run -p 127.0.0.1:8080:80 -p '[::1]:8080:80' nginx
> ```
>
> > [!WARNING]
> >
> > In releases older than 28.0.0, hosts within the same L2 segment (for example,
> > hosts connected to the same network switch) can reach ports published to localhost.
> > For more information, see
> > [moby/moby#45610](https://github.com/moby/moby/issues/45610)
@y
> [!IMPORTANT]
>
> Publishing container ports is insecure by default. Meaning, when you publish
> a container's ports it becomes available not only to the Docker host, but to
> the outside world as well.
>
> If you include the localhost IP address (`127.0.0.1`, or `::1`) with the
> publish flag, only the Docker host can access the published container port.
>
> ```console
> $ docker run -p 127.0.0.1:8080:80 -p '[::1]:8080:80' nginx
> ```
>
> > [!WARNING]
> >
> > In releases older than 28.0.0, hosts within the same L2 segment (for example,
> > hosts connected to the same network switch) can reach ports published to localhost.
> > For more information, see
> > [moby/moby#45610](https://github.com/moby/moby/issues/45610)
@z

@x
Ports on the host's IPv6 addresses will map to the container's IPv4 address
if no host IP is given in a port mapping, the bridge network is IPv4-only,
and `--userland-proxy=true` (default).
@y
Ports on the host's IPv6 addresses will map to the container's IPv4 address
if no host IP is given in a port mapping, the bridge network is IPv4-only,
and `--userland-proxy=true` (default).
@z

@x
## Direct routing
@y
## Direct routing
@z

@x
Port mapping ensures that published ports are accessible on the host's
network addresses, which are likely to be routable for any external
clients. No routes are normally set up in the host's network for container
addresses that exist within a host.
@y
Port mapping ensures that published ports are accessible on the host's
network addresses, which are likely to be routable for any external
clients. No routes are normally set up in the host's network for container
addresses that exist within a host.
@z

@x
But, particularly with IPv6 you may prefer to avoid using NAT and instead
arrange for external routing to container addresses ("direct routing").
@y
But, particularly with IPv6 you may prefer to avoid using NAT and instead
arrange for external routing to container addresses ("direct routing").
@z

@x
To access containers on a bridge network from outside the Docker host,
you must first set up routing to the bridge network via an address on the
Docker host. This can be achieved using static routes, Border Gateway Protocol (BGP),
or any other means appropriate for your network. For example, within
a local layer 2 network, remote hosts can set up static routes to a container
network via the Docker daemon host's address on the local network.
@y
To access containers on a bridge network from outside the Docker host,
you must first set up routing to the bridge network via an address on the
Docker host. This can be achieved using static routes, Border Gateway Protocol (BGP),
or any other means appropriate for your network. For example, within
a local layer 2 network, remote hosts can set up static routes to a container
network via the Docker daemon host's address on the local network.
@z

@x
### Direct routing to containers in bridge networks
@y
### Direct routing to containers in bridge networks
@z

@x
By default, remote hosts are not allowed direct access to container IP
addresses in Docker's Linux bridge networks. They can only access ports
published to host IP addresses.
@y
By default, remote hosts are not allowed direct access to container IP
addresses in Docker's Linux bridge networks. They can only access ports
published to host IP addresses.
@z

@x
To allow direct access to any published port, on any container, in any
Linux bridge network, use daemon option `"allow-direct-routing": true`
in `/etc/docker/daemon.json` or the equivalent `--allow-direct-routing`.
@y
To allow direct access to any published port, on any container, in any
Linux bridge network, use daemon option `"allow-direct-routing": true`
in `/etc/docker/daemon.json` or the equivalent `--allow-direct-routing`.
@z

@x
To allow direct routing from anywhere to containers in a specific bridge
network, see [Gateway modes](#gateway-modes).
@y
To allow direct routing from anywhere to containers in a specific bridge
network, see [Gateway modes](#gateway-modes).
@z

@x
Or, to allow direct routing via specific host interfaces, to a specific
bridge network, use the following option when creating the network:
- `com.docker.network.bridge.trusted_host_interfaces`
@y
Or, to allow direct routing via specific host interfaces, to a specific
bridge network, use the following option when creating the network:
- `com.docker.network.bridge.trusted_host_interfaces`
@z

@x
#### Example
@y
#### Example
@z

@x
Create a network where published ports on container IP addresses can be
accessed directly from interfaces `vxlan.1` and `eth3`:
@y
Create a network where published ports on container IP addresses can be
accessed directly from interfaces `vxlan.1` and `eth3`:
@z

@x
```console
$ docker network create --subnet 192.0.2.0/24 --ip-range 192.0.2.0/29 -o com.docker.network.bridge.trusted_host_interfaces="vxlan.1:eth3" mynet
```
@y
```console
$ docker network create --subnet 192.0.2.0/24 --ip-range 192.0.2.0/29 -o com.docker.network.bridge.trusted_host_interfaces="vxlan.1:eth3" mynet
```
@z

@x
Run a container in that network, publishing its port 80 to port 8080 on
the host's loopback interface:
@y
Run a container in that network, publishing its port 80 to port 8080 on
the host's loopback interface:
@z

@x
```console
$ docker run -d --ip 192.0.2.100 -p 127.0.0.1:8080:80 nginx
```
@y
```console
$ docker run -d --ip 192.0.2.100 -p 127.0.0.1:8080:80 nginx
```
@z

@x
The web server running on the container's port 80 can now be accessed
from the Docker host at `http://127.0.0.1:8080`, or directly at
`http://192.0.2.100:80`. If remote hosts on networks connected to
interfaces `vxlan.1` and `eth3` have a route to the `192.0.2.0/24`
network inside the Docker host, they can also access the web server
via `http://192.0.2.100:80`.
@y
The web server running on the container's port 80 can now be accessed
from the Docker host at `http://127.0.0.1:8080`, or directly at
`http://192.0.2.100:80`. If remote hosts on networks connected to
interfaces `vxlan.1` and `eth3` have a route to the `192.0.2.0/24`
network inside the Docker host, they can also access the web server
via `http://192.0.2.100:80`.
@z

@x
## Gateway modes
@y
## Gateway modes
@z

@x
The bridge network driver has the following options:
- `com.docker.network.bridge.gateway_mode_ipv6`
- `com.docker.network.bridge.gateway_mode_ipv4`
@y
The bridge network driver has the following options:
- `com.docker.network.bridge.gateway_mode_ipv6`
- `com.docker.network.bridge.gateway_mode_ipv4`
@z

@x
Each of these can be set to one of the gateway modes:
- `nat`
- `nat-unprotected`
- `routed`
- `isolated`
@y
Each of these can be set to one of the gateway modes:
- `nat`
- `nat-unprotected`
- `routed`
- `isolated`
@z

@x
The default is `nat`, NAT and masquerading rules are set up for each
published container port. Packets leaving the host will use a host address.
@y
The default is `nat`, NAT and masquerading rules are set up for each
published container port. Packets leaving the host will use a host address.
@z

@x
With mode `routed`, no NAT or masquerading rules are set up, but firewall
rules are still set up so that only published container ports are accessible.
Outgoing packets from the container will use the container's address,
not a host address.
@y
With mode `routed`, no NAT or masquerading rules are set up, but firewall
rules are still set up so that only published container ports are accessible.
Outgoing packets from the container will use the container's address,
not a host address.
@z

@x
To access a published port in a `routed` network, remote hosts must have
a route to the container network via an external address on the Docker
host ("direct routing"). Hosts on the local layer-2 network can set up
direct routing without needing any additional network configuration.
Hosts outside the local network can only use direct routing to the
container if the network's routers are configured to enable it.
@y
To access a published port in a `routed` network, remote hosts must have
a route to the container network via an external address on the Docker
host ("direct routing"). Hosts on the local layer-2 network can set up
direct routing without needing any additional network configuration.
Hosts outside the local network can only use direct routing to the
container if the network's routers are configured to enable it.
@z

@x
In a `nat` mode network, publishing a port to an address on the loopback
interface means remote hosts cannot access it. Other published container
ports in `routed` and `nat` networks are always accessible from remote
hosts using direct routing, unless the Docker host's firewall has additional
restrictions.
@y
In a `nat` mode network, publishing a port to an address on the loopback
interface means remote hosts cannot access it. Other published container
ports in `routed` and `nat` networks are always accessible from remote
hosts using direct routing, unless the Docker host's firewall has additional
restrictions.
@z

@x
> [!NOTE]
>
> When a port is published to a specific host address in `nat` mode, if
> IP forwarding is enabled on the Docker host, the published port can be
> accessed via other host interfaces using direct routing to the host
> address.
>
> For example, a Docker host with IP forwarding enabled has two NICs with
> addresses `192.168.100.10/24` and `10.0.0.10/24`.
> When a port is published to `192.168.100.10`, a host in the `10.0.0.0/24`
> subnet can access that port by routing to `192.168.100.10` via `10.0.0.10`.
@y
> [!NOTE]
>
> When a port is published to a specific host address in `nat` mode, if
> IP forwarding is enabled on the Docker host, the published port can be
> accessed via other host interfaces using direct routing to the host
> address.
>
> For example, a Docker host with IP forwarding enabled has two NICs with
> addresses `192.168.100.10/24` and `10.0.0.10/24`.
> When a port is published to `192.168.100.10`, a host in the `10.0.0.0/24`
> subnet can access that port by routing to `192.168.100.10` via `10.0.0.10`.
@z

@x
In `nat-unprotected` mode, unpublished container ports are also
accessible using direct routing, no port filtering rules are set up.
This mode is included for compatibility with legacy default behaviour.
@y
In `nat-unprotected` mode, unpublished container ports are also
accessible using direct routing, no port filtering rules are set up.
This mode is included for compatibility with legacy default behaviour.
@z

@x
The gateway mode also affects communication between containers that
are connected to different Docker networks on the same host.
- In `nat` and `nat-unprotected` modes, containers in other bridge
  networks can only access published ports via the host addresses they
  are published to. Direct routing from other networks is not allowed.
- In `routed` mode containers in other networks can use direct
  routing to access ports, without going via a host address.
@y
The gateway mode also affects communication between containers that
are connected to different Docker networks on the same host.
- In `nat` and `nat-unprotected` modes, containers in other bridge
  networks can only access published ports via the host addresses they
  are published to. Direct routing from other networks is not allowed.
- In `routed` mode containers in other networks can use direct
  routing to access ports, without going via a host address.
@z

@x
In `routed` mode, a host port in a `-p` or `--publish` port mapping is
not used, and the host address is only used to decide whether to apply
the mapping to IPv4 or IPv6. So, when a mapping only applies to `routed`
mode, only addresses `0.0.0.0` or `::` should be used, and a host port
should not be given. If a specific address or port is given, it will
have no effect on the published port and a warning message will be
logged.
@y
In `routed` mode, a host port in a `-p` or `--publish` port mapping is
not used, and the host address is only used to decide whether to apply
the mapping to IPv4 or IPv6. So, when a mapping only applies to `routed`
mode, only addresses `0.0.0.0` or `::` should be used, and a host port
should not be given. If a specific address or port is given, it will
have no effect on the published port and a warning message will be
logged.
@z

@x
Mode `isolated` can only be used when the network is also created with
CLI flag `--internal`, or equivalent. An address is normally assigned to the
bridge device in an `internal` network. So, processes on the Docker host can
access the network, and containers in the network can access host services
listening on that bridge address (including services listening on "any" host
address, `0.0.0.0` or `::`). No address is assigned to the bridge when the
network is created with gateway mode `isolated`.
@y
Mode `isolated` can only be used when the network is also created with
CLI flag `--internal`, or equivalent. An address is normally assigned to the
bridge device in an `internal` network. So, processes on the Docker host can
access the network, and containers in the network can access host services
listening on that bridge address (including services listening on "any" host
address, `0.0.0.0` or `::`). No address is assigned to the bridge when the
network is created with gateway mode `isolated`.
@z

@x
### Example
@y
### Example
@z

@x
Create a network suitable for direct routing for IPv6, with NAT enabled
for IPv4:
```console
$ docker network create --ipv6 --subnet 2001:db8::/64 -o com.docker.network.bridge.gateway_mode_ipv6=routed mynet
```
@y
Create a network suitable for direct routing for IPv6, with NAT enabled
for IPv4:
```console
$ docker network create --ipv6 --subnet 2001:db8::/64 -o com.docker.network.bridge.gateway_mode_ipv6=routed mynet
```
@z

@x
Create a container with a published port:
```console
$ docker run --network=mynet -p 8080:80 myimage
```
@y
Create a container with a published port:
```console
$ docker run --network=mynet -p 8080:80 myimage
```
@z

@x
Then:
- Only container port 80 will be open, for IPv4 and IPv6.
- For IPv6, using `routed` mode, port 80 will be open on the container's IP
  address. Port 8080 will not be opened on the host's IP addresses, and
  outgoing packets will use the container's IP address.
- For IPv4, using the default `nat` mode, the container's port 80 will be
  accessible via port 8080 on the host's IP addresses, as well as directly
  from within the Docker host. But, container port 80 cannot be accessed
  directly from outside the host.
  Connections originating from the container will masquerade, using the
  host's IP address.
@y
Then:
- Only container port 80 will be open, for IPv4 and IPv6.
- For IPv6, using `routed` mode, port 80 will be open on the container's IP
  address. Port 8080 will not be opened on the host's IP addresses, and
  outgoing packets will use the container's IP address.
- For IPv4, using the default `nat` mode, the container's port 80 will be
  accessible via port 8080 on the host's IP addresses, as well as directly
  from within the Docker host. But, container port 80 cannot be accessed
  directly from outside the host.
  Connections originating from the container will masquerade, using the
  host's IP address.
@z

@x
In `docker inspect`, this port mapping will be shown as follows. Note that
there is no `HostPort` for IPv6, because it is using `routed` mode:
```console
$ docker container inspect <id> --format "{{json .NetworkSettings.Ports}}"
{"80/tcp":[{"HostIp":"0.0.0.0","HostPort":"8080"},{"HostIp":"::","HostPort":""}]}
```
@y
In `docker inspect`, this port mapping will be shown as follows. Note that
there is no `HostPort` for IPv6, because it is using `routed` mode:
```console
$ docker container inspect <id> --format "{{json .NetworkSettings.Ports}}"
{"80/tcp":[{"HostIp":"0.0.0.0","HostPort":"8080"},{"HostIp":"::","HostPort":""}]}
```
@z

@x
Alternatively, to make the mapping IPv6-only, disabling IPv4 access to the
container's port 80, use the unspecified IPv6 address `[::]` and do not
include a host port number:
```console
$ docker run --network mynet -p '[::]::80'
```
@y
Alternatively, to make the mapping IPv6-only, disabling IPv4 access to the
container's port 80, use the unspecified IPv6 address `[::]` and do not
include a host port number:
```console
$ docker run --network mynet -p '[::]::80'
```
@z

@x
## Setting the default bind address for containers
@y
## Setting the default bind address for containers
@z

@x
By default, when a container's ports are mapped without any specific host
address, the Docker daemon publishes ports to all host addresses
(`0.0.0.0` and `[::]`).
@y
By default, when a container's ports are mapped without any specific host
address, the Docker daemon publishes ports to all host addresses
(`0.0.0.0` and `[::]`).
@z

@x
For example, the following command publishes port 8080 to all network
interfaces on the host, on both IPv4 and IPv6 addresses, potentially
making them available to the outside world.
@y
For example, the following command publishes port 8080 to all network
interfaces on the host, on both IPv4 and IPv6 addresses, potentially
making them available to the outside world.
@z

@x
```console
docker run -p 8080:80 nginx
```
@y
```console
docker run -p 8080:80 nginx
```
@z

@x
You can change the default binding address for published container ports so that
they're only accessible to the Docker host by default. To do that, you can
configure the daemon to use the loopback address (`127.0.0.1`) instead.
@y
You can change the default binding address for published container ports so that
they're only accessible to the Docker host by default. To do that, you can
configure the daemon to use the loopback address (`127.0.0.1`) instead.
@z

@x
> [!WARNING]
>
> In releases older than 28.0.0, hosts within the same L2 segment (for example,
> hosts connected to the same network switch) can reach ports published to
> localhost. For more information, see
> [moby/moby#45610](https://github.com/moby/moby/issues/45610)
@y
> [!WARNING]
>
> In releases older than 28.0.0, hosts within the same L2 segment (for example,
> hosts connected to the same network switch) can reach ports published to
> localhost. For more information, see
> [moby/moby#45610](https://github.com/moby/moby/issues/45610)
@z

@x
To configure this setting for user-defined bridge networks, use
the `com.docker.network.bridge.host_binding_ipv4`
[driver option](./drivers/bridge.md#default-host-binding-address) when you
create the network. Despite the option name, it is possible to specify an
IPv6 address.
@y
To configure this setting for user-defined bridge networks, use
the `com.docker.network.bridge.host_binding_ipv4`
[driver option](./drivers/bridge.md#default-host-binding-address) when you
create the network. Despite the option name, it is possible to specify an
IPv6 address.
@z

@x
```console
$ docker network create mybridge \
  -o "com.docker.network.bridge.host_binding_ipv4=127.0.0.1"
```
@y
```console
$ docker network create mybridge \
  -o "com.docker.network.bridge.host_binding_ipv4=127.0.0.1"
```
@z

@x
Or, to set the default binding address for containers in all user-defined
bridge networks, use daemon configuration option `default-network-opts`.
For example:
@y
Or, to set the default binding address for containers in all user-defined
bridge networks, use daemon configuration option `default-network-opts`.
For example:
@z

@x
```json
{
  "default-network-opts": {
    "bridge": {
      "com.docker.network.bridge.host_binding_ipv4": "127.0.0.1"
    }
  }
}
```
@y
```json
{
  "default-network-opts": {
    "bridge": {
      "com.docker.network.bridge.host_binding_ipv4": "127.0.0.1"
    }
  }
}
```
@z

@x
> [!NOTE]
>
> Setting the default binding address to `::` means port bindings with no host
> address specified will work for any IPv6 address on the host. But, `0.0.0.0`
> means any IPv4 or IPv6 address.
>
> Changing the default bind address doesn't have any effect on Swarm services.
> Swarm services are always exposed on the `0.0.0.0` network interface.
@y
> [!NOTE]
>
> Setting the default binding address to `::` means port bindings with no host
> address specified will work for any IPv6 address on the host. But, `0.0.0.0`
> means any IPv4 or IPv6 address.
>
> Changing the default bind address doesn't have any effect on Swarm services.
> Swarm services are always exposed on the `0.0.0.0` network interface.
@z

@x
### Default bridge
@y
### Default bridge
@z

@x
To set the default binding for the default bridge network, configure the `"ip"`
key in the `daemon.json` configuration file:
@y
To set the default binding for the default bridge network, configure the `"ip"`
key in the `daemon.json` configuration file:
@z

@x
```json
{
  "ip": "127.0.0.1"
}
```
@y
```json
{
  "ip": "127.0.0.1"
}
```
@z

@x
This changes the default binding address to `127.0.0.1` for published container
ports on the default bridge network.
Restart the daemon for this change to take effect.
Alternatively, you can use the `dockerd --ip` flag when starting the daemon.
@y
This changes the default binding address to `127.0.0.1` for published container
ports on the default bridge network.
Restart the daemon for this change to take effect.
Alternatively, you can use the `dockerd --ip` flag when starting the daemon.
@z
