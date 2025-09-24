%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Packet filtering and firewalls
@y
title: パケットフィルタリングとファイアウォール
@z

@x
description: How Docker works with packet filtering, iptables, and firewalls
keywords: network, iptables, firewall
@y
description: How Docker works with packet filtering, iptables, and firewalls
keywords: network, iptables, firewall
@z

@x
On Linux, Docker creates `iptables` and `ip6tables` rules to implement network
isolation, port publishing and filtering.
@y
On Linux, Docker creates `iptables` and `ip6tables` rules to implement network
isolation, port publishing and filtering.
@z

@x
Because these rules are required for the correct functioning of Docker bridge
networks, you should not modify the rules created by Docker.
@y
Because these rules are required for the correct functioning of Docker bridge
networks, you should not modify the rules created by Docker.
@z

@x
But, if you are running Docker on a host exposed to the internet, you will
probably want to add iptables policies that prevent unauthorized access to
containers or other services running on your host. This page describes how
to achieve that, and the caveats you need to be aware of.
@y
But, if you are running Docker on a host exposed to the internet, you will
probably want to add iptables policies that prevent unauthorized access to
containers or other services running on your host. This page describes how
to achieve that, and the caveats you need to be aware of.
@z

@x
> [!NOTE]
> 
> Docker creates `iptables` rules for bridge networks.
> 
> No `iptables` rules are created for `ipvlan`, `macvlan` or `host` networking.
@y
> [!NOTE]
> 
> Docker creates `iptables` rules for bridge networks.
> 
> No `iptables` rules are created for `ipvlan`, `macvlan` or `host` networking.
@z

@x
## Docker and iptables chains
@y
## Docker and iptables chains
@z

@x
In the `filter` table, Docker sets the default policy to `DROP`, and creates the
following custom `iptables` chains:
@y
In the `filter` table, Docker sets the default policy to `DROP`, and creates the
following custom `iptables` chains:
@z

@x
* `DOCKER-USER`
  * A placeholder for user-defined rules that will be processed before rules
    in the `DOCKER-FORWARD` and `DOCKER` chains.
* `DOCKER-FORWARD`
  * The first stage of processing for Docker's networks. Rules that pass packets
    that are not related to established connections to the other Docker chains,
    as well as rules to accept packets that are part of established connections.
* `DOCKER`
  * Rules that determine whether a packet that is not part of an established
    connection should be accepted, based on the port forwarding configuration
    of running containers.
* `DOCKER-ISOLATION-STAGE-1` and `DOCKER-ISOLATION-STAGE-2`
  * Rules to isolate Docker networks from each other.
* `DOCKER-INGRESS`
  * Rules related to Swarm networking. 
@y
* `DOCKER-USER`
  * A placeholder for user-defined rules that will be processed before rules
    in the `DOCKER-FORWARD` and `DOCKER` chains.
* `DOCKER-FORWARD`
  * The first stage of processing for Docker's networks. Rules that pass packets
    that are not related to established connections to the other Docker chains,
    as well as rules to accept packets that are part of established connections.
* `DOCKER`
  * Rules that determine whether a packet that is not part of an established
    connection should be accepted, based on the port forwarding configuration
    of running containers.
* `DOCKER-ISOLATION-STAGE-1` and `DOCKER-ISOLATION-STAGE-2`
  * Rules to isolate Docker networks from each other.
* `DOCKER-INGRESS`
  * Rules related to Swarm networking. 
@z

@x
In the `FORWARD` chain, Docker adds rules that unconditionally jump to the
`DOCKER-USER`, `DOCKER-FORWARD` and `DOCKER-INGRESS` chains.
@y
In the `FORWARD` chain, Docker adds rules that unconditionally jump to the
`DOCKER-USER`, `DOCKER-FORWARD` and `DOCKER-INGRESS` chains.
@z

@x
In the `nat` table, Docker creates chain `DOCKER` and adds rules to implement
masquerading and port-mapping.
@y
In the `nat` table, Docker creates chain `DOCKER` and adds rules to implement
masquerading and port-mapping.
@z

@x
### Add iptables policies before Docker's rules
@y
### Add iptables policies before Docker's rules
@z

@x
Packets that get accepted or rejected by rules in these custom chains will not
be seen by user-defined rules appended to the `FORWARD` chain. So, to add
additional rules to filter these packets, use the `DOCKER-USER` chain.
@y
Packets that get accepted or rejected by rules in these custom chains will not
be seen by user-defined rules appended to the `FORWARD` chain. So, to add
additional rules to filter these packets, use the `DOCKER-USER` chain.
@z

@x
Rules appended to the `FORWARD` chain will be processed after Docker's rules.
@y
Rules appended to the `FORWARD` chain will be processed after Docker's rules.
@z

@x
### Match the original IP and ports for requests
@y
### Match the original IP and ports for requests
@z

@x
When packets arrive to the `DOCKER-USER` chain, they have already passed through
a Destination Network Address Translation (DNAT) filter. That means that the
`iptables` flags you use can only match internal IP addresses and ports of
containers.
@y
When packets arrive to the `DOCKER-USER` chain, they have already passed through
a Destination Network Address Translation (DNAT) filter. That means that the
`iptables` flags you use can only match internal IP addresses and ports of
containers.
@z

@x
If you want to match traffic based on the original IP and port in the network
request, you must use the
[`conntrack` iptables extension](https://ipset.netfilter.org/iptables-extensions.man.html#lbAO).
For example:
@y
If you want to match traffic based on the original IP and port in the network
request, you must use the
[`conntrack` iptables extension](https://ipset.netfilter.org/iptables-extensions.man.html#lbAO).
For example:
@z

% snip command...

@x
> [!IMPORTANT]
>
> Using the `conntrack` extension may result in degraded performance.
@y
> [!IMPORTANT]
>
> Using the `conntrack` extension may result in degraded performance.
@z

@x
## Port publishing and mapping
@y
## Port publishing and mapping
@z

@x
By default, for both IPv4 and IPv6, the daemon blocks access to ports that have not
been published. Published container ports are mapped to host IP addresses.
To do this, it uses iptables to perform Network Address Translation (NAT),
Port Address Translation (PAT), and masquerading.
@y
By default, for both IPv4 and IPv6, the daemon blocks access to ports that have not
been published. Published container ports are mapped to host IP addresses.
To do this, it uses iptables to perform Network Address Translation (NAT),
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
### Restrict external connections to containers
@y
### Restrict external connections to containers
@z

@x
By default, all external source IPs are allowed to connect to ports that have
been published to the Docker host's addresses.
@y
By default, all external source IPs are allowed to connect to ports that have
been published to the Docker host's addresses.
@z

@x
To allow only a specific IP or network to access the containers, insert a
negated rule at the top of the `DOCKER-USER` filter chain. For example, the
following rule drops packets from all IP addresses except `192.0.2.2`:
@y
To allow only a specific IP or network to access the containers, insert a
negated rule at the top of the `DOCKER-USER` filter chain. For example, the
following rule drops packets from all IP addresses except `192.0.2.2`:
@z

% snip command...

@x
You will need to change `ext_if` to correspond with your
host's actual external interface. You could instead allow connections from a
source subnet. The following rule only allows access from the subnet `192.0.2.0/24`:
@y
You will need to change `ext_if` to correspond with your
host's actual external interface. You could instead allow connections from a
source subnet. The following rule only allows access from the subnet `192.0.2.0/24`:
@z

% snip command...

@x
Finally, you can specify a range of IP addresses to accept using `--src-range`
(Remember to also add `-m iprange` when using `--src-range` or `--dst-range`):
@y
Finally, you can specify a range of IP addresses to accept using `--src-range`
(Remember to also add `-m iprange` when using `--src-range` or `--dst-range`):
@z

% snip command...

@x
You can combine `-s` or `--src-range` with `-d` or `--dst-range` to control both
the source and destination. For instance, if the Docker host has addresses
`2001:db8:1111::2` and `2001:db8:2222::2`, you can make rules specific to
`2001:db8:1111::2` and leave `2001:db8:2222::2` open.
@y
You can combine `-s` or `--src-range` with `-d` or `--dst-range` to control both
the source and destination. For instance, if the Docker host has addresses
`2001:db8:1111::2` and `2001:db8:2222::2`, you can make rules specific to
`2001:db8:1111::2` and leave `2001:db8:2222::2` open.
@z

@x
You may need to allow responses from servers outside the permitted external address
ranges. For example, containers may send DNS or HTTP requests to hosts that are
not allowed to access the container's services. The following rule accepts any
incoming or outgoing packet belonging to a flow that has already been accepted
by other rules. It must be placed before `DROP` rules that restrict access from
external address ranges.
@y
You may need to allow responses from servers outside the permitted external address
ranges. For example, containers may send DNS or HTTP requests to hosts that are
not allowed to access the container's services. The following rule accepts any
incoming or outgoing packet belonging to a flow that has already been accepted
by other rules. It must be placed before `DROP` rules that restrict access from
external address ranges.
@z

% snip command...

@x
`iptables` is complicated. There is a lot more information at [Netfilter.org HOWTO](https://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html).
@y
`iptables` is complicated. There is a lot more information at [Netfilter.org HOWTO](https://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html).
@z

@x
### Direct routing
@y
### Direct routing
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
#### Direct routing to containers in bridge networks
@y
#### Direct routing to containers in bridge networks
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

% snip command...

@x
Run a container in that network, publishing its port 80 to port 8080 on
the host's loopback interface:
@y
Run a container in that network, publishing its port 80 to port 8080 on
the host's loopback interface:
@z

% snip command...

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
#### Gateway modes
@y
#### Gateway modes
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
With mode `routed`, no NAT or masquerading rules are set up, but `iptables`
are still set up so that only published container ports are accessible.
Outgoing packets from the container will use the container's address,
not a host address.
@y
With mode `routed`, no NAT or masquerading rules are set up, but `iptables`
are still set up so that only published container ports are accessible.
Outgoing packets from the container will use the container's address,
not a host address.
@z

@x
In `nat` mode, when a port is published to a specific host address, that
port is only accessible via the host interface with that address. So,
for example, publishing a port to an address on the loopback interface
means remote hosts cannot access it.
@y
In `nat` mode, when a port is published to a specific host address, that
port is only accessible via the host interface with that address. So,
for example, publishing a port to an address on the loopback interface
means remote hosts cannot access it.
@z

@x
However, using direct routing, published container ports are always
accessible from remote hosts, unless the Docker host's firewall has
additional restrictions. Hosts on the local layer-2 network can set up
direct routing without needing any additional network configuration.
Hosts outside the local network can only use direct routing to the
container if the network's routers are configured to enable it.
@y
However, using direct routing, published container ports are always
accessible from remote hosts, unless the Docker host's firewall has
additional restrictions. Hosts on the local layer-2 network can set up
direct routing without needing any additional network configuration.
Hosts outside the local network can only use direct routing to the
container if the network's routers are configured to enable it.
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
bridge device in an `internal` network. So, processes on the docker host can
access the network, and containers in the network can access host services
listening on that bridge address (including services listening on "any" host
address, `0.0.0.0` or `::`). No address is assigned to the bridge when the
network is created with gateway mode `isolated`.
@y
Mode `isolated` can only be used when the network is also created with
CLI flag `--internal`, or equivalent. An address is normally assigned to the
bridge device in an `internal` network. So, processes on the docker host can
access the network, and containers in the network can access host services
listening on that bridge address (including services listening on "any" host
address, `0.0.0.0` or `::`). No address is assigned to the bridge when the
network is created with gateway mode `isolated`.
@z

@x
#### Example
@y
#### Example
@z

@x
Create a network suitable for direct routing for IPv6, with NAT enabled
for IPv4:
@y
Create a network suitable for direct routing for IPv6, with NAT enabled
for IPv4:
@z

% snip command...

@x
Create a container with a published port:
@y
Create a container with a published port:
@z

% snip command...

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
@y
In `docker inspect`, this port mapping will be shown as follows. Note that
there is no `HostPort` for IPv6, because it is using `routed` mode:
@z

% snip command...

@x
Alternatively, to make the mapping IPv6-only, disabling IPv4 access to the
container's port 80, use the unspecified IPv6 address `[::]` and do not
include a host port number:
@y
Alternatively, to make the mapping IPv6-only, disabling IPv4 access to the
container's port 80, use the unspecified IPv6 address `[::]` and do not
include a host port number:
@z

% snip command...

@x
### Setting the default bind address for containers
@y
### Setting the default bind address for containers
@z

@x
By default, when a container's ports are mapped without any specific host
address, the Docker daemon binds published container ports to all host
addresses (`0.0.0.0` and `[::]`).
@y
By default, when a container's ports are mapped without any specific host
address, the Docker daemon binds published container ports to all host
addresses (`0.0.0.0` and `[::]`).
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

% snip command...

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
[driver option](./drivers/bridge.md#options) when you create the network.
@y
To configure this setting for user-defined bridge networks, use
the `com.docker.network.bridge.host_binding_ipv4`
[driver option](./drivers/bridge.md#options) when you create the network.
@z

% snip command...

@x
> [!NOTE]
>
> - Setting the default binding address to `::` means port bindings with no host
>   address specified will work for any IPv6 address on the host. But, `0.0.0.0`
>   means any IPv4 or IPv6 address.
> - Changing the default bind address doesn't have any effect on Swarm services.
>   Swarm services are always exposed on the `0.0.0.0` network interface.
@y
> [!NOTE]
>
> - Setting the default binding address to `::` means port bindings with no host
>   address specified will work for any IPv6 address on the host. But, `0.0.0.0`
>   means any IPv4 or IPv6 address.
> - Changing the default bind address doesn't have any effect on Swarm services.
>   Swarm services are always exposed on the `0.0.0.0` network interface.
@z

@x
#### Default bridge
@y
#### Default bridge
@z

@x
To set the default binding for the default bridge network, configure the `"ip"`
key in the `daemon.json` configuration file:
@y
To set the default binding for the default bridge network, configure the `"ip"`
key in the `daemon.json` configuration file:
@z

% snip code...

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

@x
## Docker on a router
@y
## Docker on a router
@z

@x
On Linux, Docker needs "IP Forwarding" enabled on the host. So, it enables
the `sysctl` settings `net.ipv4.ip_forward` and `net.ipv6.conf.all.forwarding`
it they are not already enabled when it starts. When it does that, it also
sets the policy of the iptables `FORWARD` chain to `DROP`.
@y
On Linux, Docker needs "IP Forwarding" enabled on the host. So, it enables
the `sysctl` settings `net.ipv4.ip_forward` and `net.ipv6.conf.all.forwarding`
it they are not already enabled when it starts. When it does that, it also
sets the policy of the iptables `FORWARD` chain to `DROP`.
@z

@x
If Docker sets the policy for the `FORWARD` chain to `DROP`. This will prevent
your Docker host from acting as a router, it is the recommended setting when
IP Forwarding is enabled.
@y
If Docker sets the policy for the `FORWARD` chain to `DROP`. This will prevent
your Docker host from acting as a router, it is the recommended setting when
IP Forwarding is enabled.
@z

@x
To stop Docker from setting the `FORWARD` chain's policy to `DROP`, include
`"ip-forward-no-drop": true` in `/etc/docker/daemon.json`, or add option
`--ip-forward-no-drop` to the `dockerd` command line.
@y
To stop Docker from setting the `FORWARD` chain's policy to `DROP`, include
`"ip-forward-no-drop": true` in `/etc/docker/daemon.json`, or add option
`--ip-forward-no-drop` to the `dockerd` command line.
@z

@x
Alternatively, you may add `ACCEPT` rules to the `DOCKER-USER` chain for the
packets you want to forward. For example:
@y
Alternatively, you may add `ACCEPT` rules to the `DOCKER-USER` chain for the
packets you want to forward. For example:
@z

% snip command...

@x
> [!WARNING]
>
> In releases older than 28.0.0, Docker always set the default policy of the
> IPv6 `FORWARD` chain to `DROP`. In release 28.0.0 and newer, it will only
> set that policy if it enables IPv6 forwarding itself. This has always been
> the behaviour for IPv4 forwarding.
>
> If IPv6 forwarding is enabled on your host before Docker starts, check your
> host's configuration to make sure it is still secure.
@y
> [!WARNING]
>
> In releases older than 28.0.0, Docker always set the default policy of the
> IPv6 `FORWARD` chain to `DROP`. In release 28.0.0 and newer, it will only
> set that policy if it enables IPv6 forwarding itself. This has always been
> the behaviour for IPv4 forwarding.
>
> If IPv6 forwarding is enabled on your host before Docker starts, check your
> host's configuration to make sure it is still secure.
@z

@x
## Prevent Docker from manipulating iptables
@y
## Prevent Docker from manipulating iptables
@z

@x
It is possible to set the `iptables` or `ip6tables` keys to `false` in
[daemon configuration](https://docs.docker.com/reference/cli/dockerd/), but
this option is not appropriate for most users. It is likely to break
container networking for the Docker Engine.
@y
It is possible to set the `iptables` or `ip6tables` keys to `false` in
[daemon configuration](https://docs.docker.com/reference/cli/dockerd/), but
this option is not appropriate for most users. It is likely to break
container networking for the Docker Engine.
@z

@x
All ports of all containers will be accessible from the network, and none
will be mapped from Docker host IP addresses.
@y
All ports of all containers will be accessible from the network, and none
will be mapped from Docker host IP addresses.
@z

@x
It is not possible to completely prevent Docker from creating `iptables`
rules, and creating rules after-the-fact is extremely involved and beyond
the scope of these instructions.
@y
It is not possible to completely prevent Docker from creating `iptables`
rules, and creating rules after-the-fact is extremely involved and beyond
the scope of these instructions.
@z

@x
## Integration with firewalld
@y
## Integration with firewalld
@z

@x
If you are running Docker with the `iptables` option set to `true`, and
[firewalld](https://firewalld.org) is enabled on your system, Docker
automatically creates a `firewalld` zone called `docker`, with target `ACCEPT`.
@y
If you are running Docker with the `iptables` option set to `true`, and
[firewalld](https://firewalld.org) is enabled on your system, Docker
automatically creates a `firewalld` zone called `docker`, with target `ACCEPT`.
@z

@x
All network interfaces created by Docker (for example, `docker0`) are inserted
into the `docker` zone.
@y
All network interfaces created by Docker (for example, `docker0`) are inserted
into the `docker` zone.
@z

@x
Docker also creates a forwarding policy called `docker-forwarding` that allows
forwarding from `ANY` zone to the `docker` zone.
@y
Docker also creates a forwarding policy called `docker-forwarding` that allows
forwarding from `ANY` zone to the `docker` zone.
@z

@x
## Docker and ufw
@y
## Docker and ufw
@z

@x
[Uncomplicated Firewall](https://launchpad.net/ufw)
(ufw) is a frontend that ships with Debian and Ubuntu,
and it lets you manage firewall rules. Docker and ufw use iptables in ways
that make them incompatible with each other.
@y
[Uncomplicated Firewall](https://launchpad.net/ufw)
(ufw) is a frontend that ships with Debian and Ubuntu,
and it lets you manage firewall rules. Docker and ufw use iptables in ways
that make them incompatible with each other.
@z

@x
When you publish a container's ports using Docker, traffic to and from that
container gets diverted before it goes through the ufw firewall settings.
Docker routes container traffic in the `nat` table, which means that packets
are diverted before it reaches the `INPUT` and `OUTPUT` chains that ufw uses.
Packets are routed before the firewall rules can be applied,
effectively ignoring your firewall configuration.
@y
When you publish a container's ports using Docker, traffic to and from that
container gets diverted before it goes through the ufw firewall settings.
Docker routes container traffic in the `nat` table, which means that packets
are diverted before it reaches the `INPUT` and `OUTPUT` chains that ufw uses.
Packets are routed before the firewall rules can be applied,
effectively ignoring your firewall configuration.
@z
