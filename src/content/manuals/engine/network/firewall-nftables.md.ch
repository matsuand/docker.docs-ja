%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker with nftables
@y
title: Docker with nftables
@z

@x
description: How Docker works with nftables
keywords: network, nftables, firewall
@y
description: How Docker works with nftables
keywords: network, nftables, firewall
@z

@x
> [!WARNING]
>
> Support for nftables introduced in Docker 29.0.0 is experimental, configuration
> options, behavior and implementation may all change in future releases.
> The rules for overlay networks have not yet been migrated from iptables.
> Therefore, nftables cannot be enabled when the Docker daemon is running in
> Swarm mode.
@y
> [!WARNING]
>
> Support for nftables introduced in Docker 29.0.0 is experimental, configuration
> options, behavior and implementation may all change in future releases.
> The rules for overlay networks have not yet been migrated from iptables.
> Therefore, nftables cannot be enabled when the Docker daemon is running in
> Swarm mode.
@z

@x
To use nftables instead of iptables, use Docker Engine option
`--firewall-backend=nftables` on its command line, or `"firewall-backend": "nftables"`
in its configuration file. You may also need to modify IP forwarding configuration
on the host, and migrate rules from the iptables `DOCKER-USER` chain, see
[migrating from iptables to nftables](#migrating-from-iptables-to-nftables).
@y
To use nftables instead of iptables, use Docker Engine option
`--firewall-backend=nftables` on its command line, or `"firewall-backend": "nftables"`
in its configuration file. You may also need to modify IP forwarding configuration
on the host, and migrate rules from the iptables `DOCKER-USER` chain, see
[migrating from iptables to nftables](#migrating-from-iptables-to-nftables).
@z

@x
For bridge networks, Docker creates nftables rules in the host's network
namespace. For bridge and other network types, nftables rules for DNS are
also created in the container's network namespace.
@y
For bridge networks, Docker creates nftables rules in the host's network
namespace. For bridge and other network types, nftables rules for DNS are
also created in the container's network namespace.
@z

@x
Creation of nftables rules can be disabled using daemon options `iptables`
and `ip6tables`. _These options apply to both iptables and nftables._
See [Prevent Docker from manipulating firewall rules](packet-filtering-firewalls.md#prevent-docker-from-manipulating-firewall-rules).
However, this is not recommended for most users as it will likely break
container networking.
@y
Creation of nftables rules can be disabled using daemon options `iptables`
and `ip6tables`. _These options apply to both iptables and nftables._
See [Prevent Docker from manipulating firewall rules](packet-filtering-firewalls.md#prevent-docker-from-manipulating-firewall-rules).
However, this is not recommended for most users as it will likely break
container networking.
@z

@x
## Docker's nftables tables
@y
## Docker's nftables tables
@z

@x
For bridge networks, Docker creates two tables, `ip docker-bridges` and
`ip6 docker-bridges`.
@y
For bridge networks, Docker creates two tables, `ip docker-bridges` and
`ip6 docker-bridges`.
@z

@x
Each table contains a number of [base chains](https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding_base_chains),
and further chains are added for each bridge network. The moby project
has some [internal documentation](https://github.com/moby/moby/blob/master/integration/network/bridge/nftablesdoc/index.md)
describing its nftables, and how they depend on network and container
configuration. However, the tables and their rules are likely to change
between Docker Engine releases.
@y
Each table contains a number of [base chains](https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding_base_chains),
and further chains are added for each bridge network. The moby project
has some [internal documentation](https://github.com/moby/moby/blob/master/integration/network/bridge/nftablesdoc/index.md)
describing its nftables, and how they depend on network and container
configuration. However, the tables and their rules are likely to change
between Docker Engine releases.
@z

@x
> [!NOTE]
>
> Do not modify Docker's tables directly as the modifications are likely to
> be lost, Docker expects to have full ownership of its tables.
@y
> [!NOTE]
>
> Do not modify Docker's tables directly as the modifications are likely to
> be lost, Docker expects to have full ownership of its tables.
@z

@x
> [!NOTE]
>
> Because iptables has a fixed set of chains, equivalent to nftables base
> chains, all rules are included in those chains. The `DOCKER-USER` chain
> is supplied as a way to insert rules into the `filter` table's `FORWARD`
> chain, to run before Docker's rules.
> In Docker's nftables implementation, there is no `DOCKER-USER` chain.
> Instead, rules can be added in separate tables, with base chains that
> have the same types and hook points as Docker's base chains. If necessary,
> [base chain priority](https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority)
> can be used to tell nftables which order to call the chains in.
> Docker uses well known [priority values](https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook) for each of its base chains.
@y
> [!NOTE]
>
> Because iptables has a fixed set of chains, equivalent to nftables base
> chains, all rules are included in those chains. The `DOCKER-USER` chain
> is supplied as a way to insert rules into the `filter` table's `FORWARD`
> chain, to run before Docker's rules.
> In Docker's nftables implementation, there is no `DOCKER-USER` chain.
> Instead, rules can be added in separate tables, with base chains that
> have the same types and hook points as Docker's base chains. If necessary,
> [base chain priority](https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority)
> can be used to tell nftables which order to call the chains in.
> Docker uses well known [priority values](https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook) for each of its base chains.
@z

@x
## Migrating from iptables to nftables
@y
## Migrating from iptables to nftables
@z

@x
If the Docker daemon has been running with the iptables firewall backend,
restarting it with the nftables backend will delete most of Docker's iptables
chains and rules, and create nftables rules instead.
@y
If the Docker daemon has been running with the iptables firewall backend,
restarting it with the nftables backend will delete most of Docker's iptables
chains and rules, and create nftables rules instead.
@z

@x
If IP forwarding is not enabled, Docker will report an error when creating
a bridge network that needs it. Because of the default bridge, if IPv4
forwarding is disabled, the error will be reported during daemon startup.
See [IP forwarding](#ip-forwarding).
@y
If IP forwarding is not enabled, Docker will report an error when creating
a bridge network that needs it. Because of the default bridge, if IPv4
forwarding is disabled, the error will be reported during daemon startup.
See [IP forwarding](#ip-forwarding).
@z

@x
If you have rules in the `DOCKER-USER` chain, see [Migrating
`DOCKER-USER`](#migrating-docker-user).
@y
If you have rules in the `DOCKER-USER` chain, see [Migrating
`DOCKER-USER`](#migrating-docker-user).
@z

@x
You may need to manually update the iptables `FORWARD` policy if it has
been set to `DROP` by Docker with iptables, or as part of your host's
firewall configuration. See [FORWARD policy in iptables](#forward-policy-in-iptables).
@y
You may need to manually update the iptables `FORWARD` policy if it has
been set to `DROP` by Docker with iptables, or as part of your host's
firewall configuration. See [FORWARD policy in iptables](#forward-policy-in-iptables).
@z

@x
### IP forwarding
@y
### IP forwarding
@z

@x
IP forwarding on the Docker host enables Docker functionality including port
publishing, communication between bridge networks, and direct routing from
outside the host to containers in bridge networks.
@y
IP forwarding on the Docker host enables Docker functionality including port
publishing, communication between bridge networks, and direct routing from
outside the host to containers in bridge networks.
@z

@x
When running with iptables, depending on network and daemon configuration,
Docker may enable IPv4 and IPv6 forwarding on the host.
@y
When running with iptables, depending on network and daemon configuration,
Docker may enable IPv4 and IPv6 forwarding on the host.
@z

@x
With its nftables firewall backend enabled, Docker will not enable IP forwarding
itself. It will report an error if forwarding is needed, but not already enabled.
To disable Docker's check for IP forwarding, letting it start and create networks
when it determines that forwarding is disabled, use Daemon option `--ip-forward=false`,
or `"ip-forward": false` in its configuration file.
@y
With its nftables firewall backend enabled, Docker will not enable IP forwarding
itself. It will report an error if forwarding is needed, but not already enabled.
To disable Docker's check for IP forwarding, letting it start and create networks
when it determines that forwarding is disabled, use Daemon option `--ip-forward=false`,
or `"ip-forward": false` in its configuration file.
@z

@x
> [!WARNING]
>
> When enabling IP forwarding, make sure you have firewall rules to block
> unwanted forwarding between non-Docker interfaces.
@y
> [!WARNING]
>
> When enabling IP forwarding, make sure you have firewall rules to block
> unwanted forwarding between non-Docker interfaces.
@z

@x
> [!NOTE]
>
> If you stop Docker to migrate to nftables, Docker may have already enabled
> IP forwarding on your system. After a reboot, if no other service re-enables
> forwarding, Docker will fail to start.
@y
> [!NOTE]
>
> If you stop Docker to migrate to nftables, Docker may have already enabled
> IP forwarding on your system. After a reboot, if no other service re-enables
> forwarding, Docker will fail to start.
@z

@x
If Docker is in a VM that has a single network interface and no other
software running, there is probably no unwanted forwarding to block.
But, on a physical host with multiple network interfaces, forwarding
between those interfaces should probably be blocked with nftables rules
unless the host is acting as a router.
@y
If Docker is in a VM that has a single network interface and no other
software running, there is probably no unwanted forwarding to block.
But, on a physical host with multiple network interfaces, forwarding
between those interfaces should probably be blocked with nftables rules
unless the host is acting as a router.
@z

@x
To enable IP forwarding on the host, set the following sysctls:
@y
To enable IP forwarding on the host, set the following sysctls:
@z

@x
- `net.ipv4.ip_forward=1`
- `net.ipv6.conf.all.forwarding=1`
@y
- `net.ipv4.ip_forward=1`
- `net.ipv6.conf.all.forwarding=1`
@z

@x
If your host uses `systemd`, you may be able to use `systemd-sysctl`. For
example, by editing `/etc/sysctl.d/99-sysctl.conf`.
@y
If your host uses `systemd`, you may be able to use `systemd-sysctl`. For
example, by editing `/etc/sysctl.d/99-sysctl.conf`.
@z

@x
If the host is running `firewalld`, you may be able to use it to block
unwanted forwarding. Docker's bridges are in a firewalld zone called
`docker`, it creates a forwarding policy called `docker-forwarding` that
accepts forwarding from `ANY` zone to the `docker` zone.
@y
If the host is running `firewalld`, you may be able to use it to block
unwanted forwarding. Docker's bridges are in a firewalld zone called
`docker`, it creates a forwarding policy called `docker-forwarding` that
accepts forwarding from `ANY` zone to the `docker` zone.
@z

@x
For example, to use nftables to block forwarding between interfaces `eth0`
and `eth1`, you could use:
@y
For example, to use nftables to block forwarding between interfaces `eth0`
and `eth1`, you could use:
@z

@x
```console
table inet no-ext-forwarding {
	chain no-ext-forwarding {
		type filter hook forward priority filter; policy accept;
		iifname "eth0" oifname "eth1" drop
		iifname "eth1" oifname "eth0" drop
	}
}
```
@y
```console
table inet no-ext-forwarding {
	chain no-ext-forwarding {
		type filter hook forward priority filter; policy accept;
		iifname "eth0" oifname "eth1" drop
		iifname "eth1" oifname "eth0" drop
	}
}
```
@z

@x
### FORWARD policy in iptables
@y
### FORWARD policy in iptables
@z

@x
An iptables chain with `FORWARD` policy `DROP` will drop packets that have
been accepted by Docker's nftables rules, because the packet will be processed
by the iptables chains as well as Docker's nftables chains.
@y
An iptables chain with `FORWARD` policy `DROP` will drop packets that have
been accepted by Docker's nftables rules, because the packet will be processed
by the iptables chains as well as Docker's nftables chains.
@z

@x
Some features, including port publishing, will not work unless the `DROP`
policy is removed, or additional iptables rules are added to the iptables
`FORWARD` chain to accept Docker-related traffic.
@y
Some features, including port publishing, will not work unless the `DROP`
policy is removed, or additional iptables rules are added to the iptables
`FORWARD` chain to accept Docker-related traffic.
@z

@x
When Docker is using iptables, and it enables IP forwarding on the host,
it sets the default policy of the iptables `FORWARD` chain to `DROP`. So,
if you stop Docker to migrate to nftables, it may have set a `DROP` that
you need to remove. It will be removed anyway on reboot.
@y
When Docker is using iptables, and it enables IP forwarding on the host,
it sets the default policy of the iptables `FORWARD` chain to `DROP`. So,
if you stop Docker to migrate to nftables, it may have set a `DROP` that
you need to remove. It will be removed anyway on reboot.
@z

@x
To keep using rules in `DOCKER-USER` that rely on the chain having policy
`DROP`, you must add explicit `ACCEPT` rules for Docker related traffic.
@y
To keep using rules in `DOCKER-USER` that rely on the chain having policy
`DROP`, you must add explicit `ACCEPT` rules for Docker related traffic.
@z

@x
To check the current iptables `FORWARD` policy, use:
@y
To check the current iptables `FORWARD` policy, use:
@z

@x
```console
$ iptables -L FORWARD
Chain FORWARD (policy DROP)
target     prot opt source               destination
$ ip6tables -L FORWARD
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
```
@y
```console
$ iptables -L FORWARD
Chain FORWARD (policy DROP)
target     prot opt source               destination
$ ip6tables -L FORWARD
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
```
@z

@x
To set the iptables policies to `ACCEPT` for IPv4 and IPv6:
@y
To set the iptables policies to `ACCEPT` for IPv4 and IPv6:
@z

@x
```console
$ iptables -P FORWARD ACCEPT
$ ip6tables -P FORWARD ACCEPT
```
@y
```console
$ iptables -P FORWARD ACCEPT
$ ip6tables -P FORWARD ACCEPT
```
@z

@x
### Migrating `DOCKER-USER`
@y
### Migrating `DOCKER-USER`
@z

@x
With firewall backend "iptables", rules added to the iptables `DOCKER-USER`
are processed before Docker's rules in the filter table's `FORWARD` chain.
@y
With firewall backend "iptables", rules added to the iptables `DOCKER-USER`
are processed before Docker's rules in the filter table's `FORWARD` chain.
@z

@x
When starting the daemon with nftables after running with iptables, Docker
will not remove the jump from the `FORWARD` chain to `DOCKER-USER`. So,
rules created in `DOCKER-USER` will continue to run until the jump is
removed or the host is rebooted.
@y
When starting the daemon with nftables after running with iptables, Docker
will not remove the jump from the `FORWARD` chain to `DOCKER-USER`. So,
rules created in `DOCKER-USER` will continue to run until the jump is
removed or the host is rebooted.
@z

@x
When starting with nftables, the daemon will not add the jump. So, unless
there is an existing jump, rules in `DOCKER-USER` will be ignored.
@y
When starting with nftables, the daemon will not add the jump. So, unless
there is an existing jump, rules in `DOCKER-USER` will be ignored.
@z

@x
#### Migrating ACCEPT rules
@y
#### Migrating ACCEPT rules
@z

@x
Some rules in the `DOCKER-USER` chain will continue to work. For example, if a
packet is dropped, it will be dropped before or after the nftables rules in
Docker's `filter-FORWARD` chain. But other rules, particularly `ACCEPT` rules
to override Docker's `DROP` rules, will not work.
@y
Some rules in the `DOCKER-USER` chain will continue to work. For example, if a
packet is dropped, it will be dropped before or after the nftables rules in
Docker's `filter-FORWARD` chain. But other rules, particularly `ACCEPT` rules
to override Docker's `DROP` rules, will not work.
@z

@x
In nftables, an "accept" rule is not final. It terminates processing
for its base chain, but the accepted packet will still be processed by
other base chains, which may drop it.
@y
In nftables, an "accept" rule is not final. It terminates processing
for its base chain, but the accepted packet will still be processed by
other base chains, which may drop it.
@z

@x
To override Docker's `drop` rule, you must use a firewall mark. Select a
mark not already in use on your host, and use Docker Engine option
`--bridge-accept-fwmark`.
@y
To override Docker's `drop` rule, you must use a firewall mark. Select a
mark not already in use on your host, and use Docker Engine option
`--bridge-accept-fwmark`.
@z

@x
For example, `--bridge-accept-fwmark=1` tells the daemon to accept any
packet with an `fwmark` value of `1`. Optionally, you can supply a mask
to match specific bits in the mark, `--bridge-accept-fwmark=0x1/0x3`.
@y
For example, `--bridge-accept-fwmark=1` tells the daemon to accept any
packet with an `fwmark` value of `1`. Optionally, you can supply a mask
to match specific bits in the mark, `--bridge-accept-fwmark=0x1/0x3`.
@z

@x
Then, instead of accepting the packet in `DOCKER-USER`, add the firewall
mark you have chosen and Docker will not drop it.
@y
Then, instead of accepting the packet in `DOCKER-USER`, add the firewall
mark you have chosen and Docker will not drop it.
@z

@x
The firewall mark must be added before Docker's rules run. So if the mark
is added in a chain with type `filter` and hook `forward`, it must have
priority `filter - 1` or lower.
@y
The firewall mark must be added before Docker's rules run. So if the mark
is added in a chain with type `filter` and hook `forward`, it must have
priority `filter - 1` or lower.
@z

@x
#### Replacing `DOCKER-USER` with an nftables table
@y
#### Replacing `DOCKER-USER` with an nftables table
@z

@x
Because nftables doesn't have pre-defined chains, to replace the `DOCKER-USER`
chain you can create your own table and add chains and rules to it.
@y
Because nftables doesn't have pre-defined chains, to replace the `DOCKER-USER`
chain you can create your own table and add chains and rules to it.
@z

@x
The `DOCKER-USER` chain has type `filter` and hook `forward`, so it can
only have rules in the filter forward chain. The base chains in your
table can have any `type` or `hook`. If your rules need to run before
Docker's rules, give the base chains a lower `priority` number than
Docker's chain. Or, a higher priority to make sure they run after Docker's
rules.
@y
The `DOCKER-USER` chain has type `filter` and hook `forward`, so it can
only have rules in the filter forward chain. The base chains in your
table can have any `type` or `hook`. If your rules need to run before
Docker's rules, give the base chains a lower `priority` number than
Docker's chain. Or, a higher priority to make sure they run after Docker's
rules.
@z

@x
Docker's base chains use the priority values defined at
[priority values](https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook)
@y
Docker's base chains use the priority values defined at
[priority values](https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook)
@z

@x
#### Example: restricting external connections to containers
@y
#### Example: restricting external connections to containers
@z

@x
By default, any remote host can connect to ports published to the Docker
host's external addresses.
@y
By default, any remote host can connect to ports published to the Docker
host's external addresses.
@z

@x
To allow only a specific IP or network to access the containers, create a
table with a base chain that has a drop rule. For example, the
following table drops packets from all IP addresses except `192.0.2.2`:
@y
To allow only a specific IP or network to access the containers, create a
table with a base chain that has a drop rule. For example, the
following table drops packets from all IP addresses except `192.0.2.2`:
@z

@x
```console
table ip my-table {
	chain my-filter-forward {
		type filter hook forward priority filter; policy accept;
		iifname "ext_if" ip saddr != 192.0.2.2 counter drop
	}
}
```
@y
```console
table ip my-table {
	chain my-filter-forward {
		type filter hook forward priority filter; policy accept;
		iifname "ext_if" ip saddr != 192.0.2.2 counter drop
	}
}
```
@z

@x
You will need to change `ext_if` to your host's external interface name.
@y
You will need to change `ext_if` to your host's external interface name.
@z

@x
You could instead accept connections from a source subnet. The following
table only accepts access from the subnet `192.0.2.0/24`:
@y
You could instead accept connections from a source subnet. The following
table only accepts access from the subnet `192.0.2.0/24`:
@z

@x
```console
table ip my-table {
	chain my-filter-forward {
		type filter hook forward priority filter; policy accept;
		iifname "ext_if" ip saddr != 192.0.2.0/24 counter drop
	}
}
```
@y
```console
table ip my-table {
	chain my-filter-forward {
		type filter hook forward priority filter; policy accept;
		iifname "ext_if" ip saddr != 192.0.2.0/24 counter drop
	}
}
```
@z

@x
If you are running other services on the host that use IP forwarding
and need to be accessed by different external hosts, you will need more
specific filters. For example, to match the default prefix `br-` of
bridge devices belonging to Docker's user-defined bridge networks:
@y
If you are running other services on the host that use IP forwarding
and need to be accessed by different external hosts, you will need more
specific filters. For example, to match the default prefix `br-` of
bridge devices belonging to Docker's user-defined bridge networks:
@z

@x
```console
table ip my-table {
	chain my-filter-forward {
		type filter hook forward priority filter; policy accept;
		iifname "ext_if" oifname "br-*" ip saddr != 192.0.2.0/24 counter drop
	}
}
```
@y
```console
table ip my-table {
	chain my-filter-forward {
		type filter hook forward priority filter; policy accept;
		iifname "ext_if" oifname "br-*" ip saddr != 192.0.2.0/24 counter drop
	}
}
```
@z

@x
For more information about nftables configuration and advanced usage,
refer to the [nftables wiki](https://wiki.nftables.org/wiki-nftables/index.php/Main_Page).
@y
For more information about nftables configuration and advanced usage,
refer to the [nftables wiki](https://wiki.nftables.org/wiki-nftables/index.php/Main_Page).
@z
