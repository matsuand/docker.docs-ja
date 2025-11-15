%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Macvlan network driver
description: All about using Macvlan to make your containers appear like physical
  machines on the network
keywords: network, macvlan, standalone
@y
title: Macvlan network driver
description: All about using Macvlan to make your containers appear like physical
  machines on the network
keywords: network, macvlan, standalone
@z

@x
Some applications, especially legacy applications or applications which monitor
network traffic, expect to be directly connected to the physical network. In
this type of situation, you can use the `macvlan` network driver to assign a MAC
address to each container's virtual network interface, making it appear to be
a physical network interface directly connected to the physical network. In this
case, you need to designate a physical interface on your Docker host to use for
the Macvlan, as well as the subnet and gateway of the network. You can even
isolate your Macvlan networks using different physical network interfaces.
@y
Some applications, especially legacy applications or applications which monitor
network traffic, expect to be directly connected to the physical network. In
this type of situation, you can use the `macvlan` network driver to assign a MAC
address to each container's virtual network interface, making it appear to be
a physical network interface directly connected to the physical network. In this
case, you need to designate a physical interface on your Docker host to use for
the Macvlan, as well as the subnet and gateway of the network. You can even
isolate your Macvlan networks using different physical network interfaces.
@z

@x
Keep the following things in mind:
@y
Keep the following things in mind:
@z

@x
- You may unintentionally degrade your network due to IP address
  exhaustion or to "VLAN spread", a situation that occurs when you have an
  inappropriately large number of unique MAC addresses in your network.
@y
- You may unintentionally degrade your network due to IP address
  exhaustion or to "VLAN spread", a situation that occurs when you have an
  inappropriately large number of unique MAC addresses in your network.
@z

@x
- Your networking equipment needs to be able to handle "promiscuous mode",
  where one physical interface can be assigned multiple MAC addresses.
@y
- Your networking equipment needs to be able to handle "promiscuous mode",
  where one physical interface can be assigned multiple MAC addresses.
@z

@x
- If your application can work using a bridge (on a single Docker host) or
  overlay (to communicate across multiple Docker hosts), these solutions may be
  better in the long term.
@y
- If your application can work using a bridge (on a single Docker host) or
  overlay (to communicate across multiple Docker hosts), these solutions may be
  better in the long term.
@z

@x
## Options
@y
## Options
@z

@x
The following table describes the driver-specific options that you can pass to
`--opt` when creating a network using the `macvlan` driver.
@y
The following table describes the driver-specific options that you can pass to
`--opt` when creating a network using the `macvlan` driver.
@z

@x
| Option         | Default  | Description                                                                   |
| -------------- | -------- | ----------------------------------------------------------------------------- |
| `macvlan_mode` | `bridge` | Sets the Macvlan mode. Can be one of: `bridge`, `vepa`, `passthru`, `private` |
| `parent`       |          | Specifies the parent interface to use.                                        |
@y
| Option         | Default  | Description                                                                   |
| -------------- | -------- | ----------------------------------------------------------------------------- |
| `macvlan_mode` | `bridge` | Sets the Macvlan mode. Can be one of: `bridge`, `vepa`, `passthru`, `private` |
| `parent`       |          | Specifies the parent interface to use.                                        |
@z

@x
## Create a Macvlan network
@y
## Create a Macvlan network
@z

@x
When you create a Macvlan network, it can either be in bridge mode or 802.1Q
trunk bridge mode.
@y
When you create a Macvlan network, it can either be in bridge mode or 802.1Q
trunk bridge mode.
@z

@x
- In bridge mode, Macvlan traffic goes through a physical device on the host.
@y
- In bridge mode, Macvlan traffic goes through a physical device on the host.
@z

@x
- In 802.1Q trunk bridge mode, traffic goes through an 802.1Q sub-interface
  which Docker creates on the fly. This allows you to control routing and
  filtering at a more granular level.
@y
- In 802.1Q trunk bridge mode, traffic goes through an 802.1Q sub-interface
  which Docker creates on the fly. This allows you to control routing and
  filtering at a more granular level.
@z

@x
### Bridge mode
@y
### Bridge mode
@z

@x
To create a `macvlan` network which bridges with a given physical network
interface, use `--driver macvlan` with the `docker network create` command. You
also need to specify the `parent`, which is the interface the traffic will
physically go through on the Docker host.
@y
To create a `macvlan` network which bridges with a given physical network
interface, use `--driver macvlan` with the `docker network create` command. You
also need to specify the `parent`, which is the interface the traffic will
physically go through on the Docker host.
@z

@x
```console
$ docker network create -d macvlan \
  --subnet=172.16.86.0/24 \
  --gateway=172.16.86.1 \
  -o parent=eth0 pub_net
```
@y
```console
$ docker network create -d macvlan \
  --subnet=172.16.86.0/24 \
  --gateway=172.16.86.1 \
  -o parent=eth0 pub_net
```
@z

@x
If you need to exclude IP addresses from being used in the `macvlan` network, such
as when a given IP address is already in use, use `--aux-addresses`:
@y
If you need to exclude IP addresses from being used in the `macvlan` network, such
as when a given IP address is already in use, use `--aux-addresses`:
@z

@x
```console
$ docker network create -d macvlan \
  --subnet=192.168.32.0/24 \
  --ip-range=192.168.32.128/25 \
  --gateway=192.168.32.254 \
  --aux-address="my-router=192.168.32.129" \
  -o parent=eth0 macnet32
```
@y
```console
$ docker network create -d macvlan \
  --subnet=192.168.32.0/24 \
  --ip-range=192.168.32.128/25 \
  --gateway=192.168.32.254 \
  --aux-address="my-router=192.168.32.129" \
  -o parent=eth0 macnet32
```
@z

@x
### 802.1Q trunk bridge mode
@y
### 802.1Q trunk bridge mode
@z

@x
If you specify a `parent` interface name with a dot included, such as `eth0.50`,
Docker interprets that as a sub-interface of `eth0` and creates the sub-interface
automatically.
@y
If you specify a `parent` interface name with a dot included, such as `eth0.50`,
Docker interprets that as a sub-interface of `eth0` and creates the sub-interface
automatically.
@z

@x
```console
$ docker network create -d macvlan \
    --subnet=192.168.50.0/24 \
    --gateway=192.168.50.1 \
    -o parent=eth0.50 macvlan50
```
@y
```console
$ docker network create -d macvlan \
    --subnet=192.168.50.0/24 \
    --gateway=192.168.50.1 \
    -o parent=eth0.50 macvlan50
```
@z

@x
### Use an IPvlan instead of Macvlan
@y
### Use an IPvlan instead of Macvlan
@z

@x
An `ipvlan` network created with option `-o ipvlan_mode=l2` is similar
to a macvlan network. The main difference is that the `ipvlan` driver
doesn't assign a MAC address to each container, the layer-2 network stack
is shared by devices in the ipvlan network. So, containers use the parent
interface's MAC address.
@y
An `ipvlan` network created with option `-o ipvlan_mode=l2` is similar
to a macvlan network. The main difference is that the `ipvlan` driver
doesn't assign a MAC address to each container, the layer-2 network stack
is shared by devices in the ipvlan network. So, containers use the parent
interface's MAC address.
@z

@x
The network will see fewer MAC addresses, and the host's MAC address will be
associated with the IP address of each container.
@y
The network will see fewer MAC addresses, and the host's MAC address will be
associated with the IP address of each container.
@z

@x
The choice of network type depends on your environment and requirements.
There are some notes about the trade-offs in the [Linux kernel
documentation](https://docs.kernel.org/networking/ipvlan.html#what-to-choose-macvlan-vs-ipvlan).
@y
The choice of network type depends on your environment and requirements.
There are some notes about the trade-offs in the [Linux kernel
documentation](https://docs.kernel.org/networking/ipvlan.html#what-to-choose-macvlan-vs-ipvlan).
@z

% snip command...

@x
## Use IPv6
@y
## Use IPv6
@z

@x
If you have [configured the Docker daemon to allow IPv6](/manuals/engine/daemon/ipv6.md),
you can use dual-stack IPv4/IPv6 `macvlan` networks.
@y
If you have [configured the Docker daemon to allow IPv6](manuals/engine/daemon/ipv6.md),
you can use dual-stack IPv4/IPv6 `macvlan` networks.
@z

@x
```console
$ docker network create -d macvlan \
    --subnet=192.168.216.0/24 --subnet=192.168.218.0/24 \
    --gateway=192.168.216.1 --gateway=192.168.218.1 \
    --subnet=2001:db8:abc8::/64 --gateway=2001:db8:abc8::10 \
     -o parent=eth0.218 \
     -o macvlan_mode=bridge macvlan216
```
@y
```console
$ docker network create -d macvlan \
    --subnet=192.168.216.0/24 --subnet=192.168.218.0/24 \
    --gateway=192.168.216.1 --gateway=192.168.218.1 \
    --subnet=2001:db8:abc8::/64 --gateway=2001:db8:abc8::10 \
     -o parent=eth0.218 \
     -o macvlan_mode=bridge macvlan216
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
Learn how to use the Macvlan driver in the
[Macvlan networking tutorial](/manuals/engine/network/tutorials/macvlan.md).
@y
Learn how to use the Macvlan driver in the
[Macvlan networking tutorial](manuals/engine/network/tutorials/macvlan.md).
@z
