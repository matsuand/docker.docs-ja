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
On Linux, Docker creates firewall rules to implement network
isolation, [port publishing](./port-publishing.md) and filtering.
@y
On Linux, Docker creates firewall rules to implement network
isolation, [port publishing](./port-publishing.md) and filtering.
@z

@x
Because these rules are required for the correct functioning of Docker bridge
networks, you should not modify the rules created by Docker.
@y
Because these rules are required for the correct functioning of Docker bridge
networks, you should not modify the rules created by Docker.
@z

@x
This page describes options that control Docker's firewall rules to
implement functionality including port publishing, and NAT/masquerading.
@y
This page describes options that control Docker's firewall rules to
implement functionality including port publishing, and NAT/masquerading.
@z

@x
> [!NOTE]
> 
> Docker creates firewall rules for bridge networks.
> 
> No rules are created for `ipvlan`, `macvlan` or `host` networking.
@y
> [!NOTE]
> 
> Docker creates firewall rules for bridge networks.
> 
> No rules are created for `ipvlan`, `macvlan` or `host` networking.
@z

@x
## Firewall backend
@y
## Firewall backend
@z

@x
By default, Docker Engine creates its firewall rules using iptables,
see [Docker with iptables](./firewall-iptables.md). It also has
support for nftables, see [Docker with nftables](./firewall-nftables.md).
@y
By default, Docker Engine creates its firewall rules using iptables,
see [Docker with iptables](./firewall-iptables.md). It also has
support for nftables, see [Docker with nftables](./firewall-nftables.md).
@z

@x
For bridge networks, iptables and nftables have the same functionality.
@y
For bridge networks, iptables and nftables have the same functionality.
@z

@x
Docker Engine option `firewall-backend` can be used to select whether
iptables or nftables is used. See
[daemon configuration](https://docs.docker.com/reference/cli/dockerd/).
@y
Docker Engine option `firewall-backend` can be used to select whether
iptables or nftables is used. See
[daemon configuration](https://docs.docker.com/reference/cli/dockerd/).
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
configures the firewall to drop forwarded packets unless they are explicitly
accepted.
@y
On Linux, Docker needs "IP Forwarding" enabled on the host. So, it enables
the `sysctl` settings `net.ipv4.ip_forward` and `net.ipv6.conf.all.forwarding`
it they are not already enabled when it starts. When it does that, it also
configures the firewall to drop forwarded packets unless they are explicitly
accepted.
@z

@x
When Docker sets the default forwarding policy to "drop", it will prevent
your Docker host from acting as a router. This is the recommended setting when
IP Forwarding is enabled, unless router functionality is required.
@y
When Docker sets the default forwarding policy to "drop", it will prevent
your Docker host from acting as a router. This is the recommended setting when
IP Forwarding is enabled, unless router functionality is required.
@z

@x
To stop Docker from setting the forwarding policy to "drop", include
`"ip-forward-no-drop": true` in `/etc/docker/daemon.json`, or add option
`--ip-forward-no-drop` to the `dockerd` command line.
@y
To stop Docker from setting the forwarding policy to "drop", include
`"ip-forward-no-drop": true` in `/etc/docker/daemon.json`, or add option
`--ip-forward-no-drop` to the `dockerd` command line.
@z

@x
> [!NOTE]
>
> With the experimental nftables backend, Docker does not enable IP forwarding
> itself, and it will not create a default "drop" nftables policy. See
> [Migrating from iptables to nftables](./firewall-nftables.md#migrating-from-iptables-to-nftables).
@y
> [!NOTE]
>
> With the experimental nftables backend, Docker does not enable IP forwarding
> itself, and it will not create a default "drop" nftables policy. See
> [Migrating from iptables to nftables](./firewall-nftables.md#migrating-from-iptables-to-nftables).
@z

@x
## Prevent Docker from manipulating firewall rules
@y
## Prevent Docker from manipulating firewall rules
@z

@x
Setting the `iptables` or `ip6tables` keys to `false` in
[daemon configuration](https://docs.docker.com/reference/cli/dockerd/), will
prevent Docker from creating most of its `iptables` or `nftables` rules. But,
this option is not appropriate for most users, it is likely to break
container networking for the Docker Engine.
@y
Setting the `iptables` or `ip6tables` keys to `false` in
[daemon configuration](https://docs.docker.com/reference/cli/dockerd/), will
prevent Docker from creating most of its `iptables` or `nftables` rules. But,
this option is not appropriate for most users, it is likely to break
container networking for the Docker Engine.
@z

@x
For example, with Docker's firewalling disabled and no replacement
rules, containers in bridge networks will not be able to access
internet hosts by masquerading, but all of their ports will be accessible
to hosts on the local network.
@y
For example, with Docker's firewalling disabled and no replacement
rules, containers in bridge networks will not be able to access
internet hosts by masquerading, but all of their ports will be accessible
to hosts on the local network.
@z

@x
It is not possible to completely prevent Docker from creating firewall
rules, and creating rules after-the-fact is extremely involved and beyond
the scope of these instructions.
@y
It is not possible to completely prevent Docker from creating firewall
rules, and creating rules after-the-fact is extremely involved and beyond
the scope of these instructions.
@z

@x
## Integration with firewalld
@y
## Integration with firewalld
@z

@x
If you are running Docker with the `iptables` or `ip6tables` options set to
`true`, and [firewalld](https://firewalld.org) is enabled on your system, in
addition to its usual iptables or nftables rules, Docker creates a `firewalld`
zone called `docker`, with target `ACCEPT`.
@y
If you are running Docker with the `iptables` or `ip6tables` options set to
`true`, and [firewalld](https://firewalld.org) is enabled on your system, in
addition to its usual iptables or nftables rules, Docker creates a `firewalld`
zone called `docker`, with target `ACCEPT`.
@z

@x
All bridge network interfaces created by Docker (for example, `docker0`) are
inserted into the `docker` zone.
@y
All bridge network interfaces created by Docker (for example, `docker0`) are
inserted into the `docker` zone.
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
and it lets you manage firewall rules. Docker and ufw use firewall rules in
ways that make them incompatible with each other.
@y
[Uncomplicated Firewall](https://launchpad.net/ufw)
(ufw) is a frontend that ships with Debian and Ubuntu,
and it lets you manage firewall rules. Docker and ufw use firewall rules in
ways that make them incompatible with each other.
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
