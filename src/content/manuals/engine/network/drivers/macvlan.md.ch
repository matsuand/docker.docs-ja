%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Macvlan network driver
description:
  All about using Macvlan to make your containers appear like physical
  machines on the network
keywords: network, macvlan, standalone
@y
title: Macvlan network driver
description:
  All about using Macvlan to make your containers appear like physical
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
## Platform support and requirements
@y
## Platform support and requirements
@z

@x
- The macvlan driver only works on Linux hosts. It is not supported on
  Docker Desktop for Mac or Windows, or Docker Engine on Windows.
- Most cloud providers block macvlan networking. You may need physical access to
  your networking equipment.
- Requires at least Linux kernel version 3.9 (version 4.0 or later is
  recommended).
- The macvlan driver is not supported in rootless mode.
@y
- The macvlan driver only works on Linux hosts. It is not supported on
  Docker Desktop for Mac or Windows, or Docker Engine on Windows.
- Most cloud providers block macvlan networking. You may need physical access to
  your networking equipment.
- Requires at least Linux kernel version 3.9 (version 4.0 or later is
  recommended).
- The macvlan driver is not supported in rootless mode.
@z

@x
## Considerations
@y
## Considerations
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
- Containers attached to a macvlan network cannot communicate with the host
  directly, this is a restriction in the Linux kernel. If you need communication
  between the host and the containers, you can connect the containers to a
  bridge network as well as the macvlan. It is also possible to create a
  macvlan interface on the host with the same parent interface, and assign it
  an IP address in the Docker network's subnet.
@y
- Containers attached to a macvlan network cannot communicate with the host
  directly, this is a restriction in the Linux kernel. If you need communication
  between the host and the containers, you can connect the containers to a
  bridge network as well as the macvlan. It is also possible to create a
  macvlan interface on the host with the same parent interface, and assign it
  an IP address in the Docker network's subnet.
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

@x
```console
$ docker network create -d ipvlan \
    --subnet=192.168.210.0/24 \
    --gateway=192.168.210.254 \
     -o ipvlan_mode=l2 -o parent=eth0 ipvlan210
```
@y
```console
$ docker network create -d ipvlan \
    --subnet=192.168.210.0/24 \
    --gateway=192.168.210.254 \
     -o ipvlan_mode=l2 -o parent=eth0 ipvlan210
```
@z

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
## Usage examples
@y
## Usage examples
@z

@x
This section provides hands-on examples for working with macvlan networks,
including bridge mode and 802.1Q trunk bridge mode.
@y
This section provides hands-on examples for working with macvlan networks,
including bridge mode and 802.1Q trunk bridge mode.
@z

@x
> [!NOTE]
> These examples assume your ethernet interface is `eth0`. If your device has a
> different name, use that instead.
@y
> [!NOTE]
> These examples assume your ethernet interface is `eth0`. If your device has a
> different name, use that instead.
@z

@x
### Bridge mode example
@y
### Bridge mode example
@z

@x
In bridge mode, your traffic flows through `eth0` and Docker routes traffic to
your container using its MAC address. To network devices on your network, your
container appears to be physically attached to the network.
@y
In bridge mode, your traffic flows through `eth0` and Docker routes traffic to
your container using its MAC address. To network devices on your network, your
container appears to be physically attached to the network.
@z

@x
1. Create a macvlan network called `my-macvlan-net`. Modify the `subnet`,
   `gateway`, and `parent` values to match your environment:
@y
1. Create a macvlan network called `my-macvlan-net`. Modify the `subnet`,
   `gateway`, and `parent` values to match your environment:
@z

@x
   ```console
   $ docker network create -d macvlan \
     --subnet=172.16.86.0/24 \
     --gateway=172.16.86.1 \
     -o parent=eth0 \
     my-macvlan-net
   ```
@y
   ```console
   $ docker network create -d macvlan \
     --subnet=172.16.86.0/24 \
     --gateway=172.16.86.1 \
     -o parent=eth0 \
     my-macvlan-net
   ```
@z

@x
   Verify the network was created:
@y
   Verify the network was created:
@z

@x
   ```console
   $ docker network ls
   $ docker network inspect my-macvlan-net
   ```
@y
   ```console
   $ docker network ls
   $ docker network inspect my-macvlan-net
   ```
@z

@x
2. Start an `alpine` container and attach it to the `my-macvlan-net` network.
   The `-dit` flags start the container in the background. The `--rm` flag
   removes the container when it stops:
@y
2. Start an `alpine` container and attach it to the `my-macvlan-net` network.
   The `-dit` flags start the container in the background. The `--rm` flag
   removes the container when it stops:
@z

@x
   ```console
   $ docker run --rm -dit \
     --network my-macvlan-net \
     --name my-macvlan-alpine \
     alpine:latest \
     ash
   ```
@y
   ```console
   $ docker run --rm -dit \
     --network my-macvlan-net \
     --name my-macvlan-alpine \
     alpine:latest \
     ash
   ```
@z

@x
3. Inspect the container and notice the `MacAddress` key within the `Networks`
   section:
@y
3. Inspect the container and notice the `MacAddress` key within the `Networks`
   section:
@z

@x
   ```console
   $ docker container inspect my-macvlan-alpine
   ```
@y
   ```console
   $ docker container inspect my-macvlan-alpine
   ```
@z

@x
   Look for output similar to:
@y
   Look for output similar to:
@z

@x
   ```json
   "Networks": {
     "my-macvlan-net": {
       "Gateway": "172.16.86.1",
       "IPAddress": "172.16.86.2",
       "IPPrefixLen": 24,
       "MacAddress": "02:42:ac:10:56:02",
       ...
     }
   }
   ```
@y
   ```json
   "Networks": {
     "my-macvlan-net": {
       "Gateway": "172.16.86.1",
       "IPAddress": "172.16.86.2",
       "IPPrefixLen": 24,
       "MacAddress": "02:42:ac:10:56:02",
       ...
     }
   }
   ```
@z

@x
4. Check how the container sees its own network interfaces:
@y
4. Check how the container sees its own network interfaces:
@z

@x
   ```console
   $ docker exec my-macvlan-alpine ip addr show eth0
@y
   ```console
   $ docker exec my-macvlan-alpine ip addr show eth0
@z

@x
   9: eth0@tunl0: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
   link/ether 02:42:ac:10:56:02 brd ff:ff:ff:ff:ff:ff
   inet 172.16.86.2/24 brd 172.16.86.255 scope global eth0
      valid_lft forever preferred_lft forever
   ```
@y
   9: eth0@tunl0: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
   link/ether 02:42:ac:10:56:02 brd ff:ff:ff:ff:ff:ff
   inet 172.16.86.2/24 brd 172.16.86.255 scope global eth0
      valid_lft forever preferred_lft forever
   ```
@z

@x
   Check the routing table:
@y
   Check the routing table:
@z

@x
   ```console
   $ docker exec my-macvlan-alpine ip route
@y
   ```console
   $ docker exec my-macvlan-alpine ip route
@z

@x
   default via 172.16.86.1 dev eth0
   172.16.86.0/24 dev eth0 scope link  src 172.16.86.2
   ```
@y
   default via 172.16.86.1 dev eth0
   172.16.86.0/24 dev eth0 scope link  src 172.16.86.2
   ```
@z

@x
5. Stop the container (Docker removes it automatically) and remove the network:
@y
5. Stop the container (Docker removes it automatically) and remove the network:
@z

@x
   ```console
   $ docker container stop my-macvlan-alpine
   $ docker network rm my-macvlan-net
   ```
@y
   ```console
   $ docker container stop my-macvlan-alpine
   $ docker network rm my-macvlan-net
   ```
@z

@x
### 802.1Q trunked bridge mode example
@y
### 802.1Q trunked bridge mode example
@z

@x
In 802.1Q trunk bridge mode, your traffic flows through a sub-interface of
`eth0` (called `eth0.10`) and Docker routes traffic to your container using its
MAC address. To network devices on your network, your container appears to be
physically attached to the network.
@y
In 802.1Q trunk bridge mode, your traffic flows through a sub-interface of
`eth0` (called `eth0.10`) and Docker routes traffic to your container using its
MAC address. To network devices on your network, your container appears to be
physically attached to the network.
@z

@x
1. Create a macvlan network called `my-8021q-macvlan-net`. Modify the `subnet`,
   `gateway`, and `parent` values to match your environment:
@y
1. Create a macvlan network called `my-8021q-macvlan-net`. Modify the `subnet`,
   `gateway`, and `parent` values to match your environment:
@z

@x
   ```console
   $ docker network create -d macvlan \
     --subnet=172.16.86.0/24 \
     --gateway=172.16.86.1 \
     -o parent=eth0.10 \
     my-8021q-macvlan-net
   ```
@y
   ```console
   $ docker network create -d macvlan \
     --subnet=172.16.86.0/24 \
     --gateway=172.16.86.1 \
     -o parent=eth0.10 \
     my-8021q-macvlan-net
   ```
@z

@x
   Verify the network was created and has parent `eth0.10`. You can use `ip addr
show` on the Docker host to verify that the interface `eth0.10` exists:
@y
   Verify the network was created and has parent `eth0.10`. You can use `ip addr
show` on the Docker host to verify that the interface `eth0.10` exists:
@z

@x
   ```console
   $ docker network ls
   $ docker network inspect my-8021q-macvlan-net
   ```
@y
   ```console
   $ docker network ls
   $ docker network inspect my-8021q-macvlan-net
   ```
@z

@x
2. Start an `alpine` container and attach it to the `my-8021q-macvlan-net`
   network:
@y
2. Start an `alpine` container and attach it to the `my-8021q-macvlan-net`
   network:
@z

@x
   ```console
   $ docker run --rm -itd \
     --network my-8021q-macvlan-net \
     --name my-second-macvlan-alpine \
     alpine:latest \
     ash
   ```
@y
   ```console
   $ docker run --rm -itd \
     --network my-8021q-macvlan-net \
     --name my-second-macvlan-alpine \
     alpine:latest \
     ash
   ```
@z

@x
3. Inspect the container and notice the `MacAddress` key:
@y
3. Inspect the container and notice the `MacAddress` key:
@z

@x
   ```console
   $ docker container inspect my-second-macvlan-alpine
   ```
@y
   ```console
   $ docker container inspect my-second-macvlan-alpine
   ```
@z

@x
   Look for the `Networks` section with the MAC address.
@y
   Look for the `Networks` section with the MAC address.
@z

@x
4. Check how the container sees its own network interfaces:
@y
4. Check how the container sees its own network interfaces:
@z

@x
   ```console
   $ docker exec my-second-macvlan-alpine ip addr show eth0
@y
   ```console
   $ docker exec my-second-macvlan-alpine ip addr show eth0
@z

@x
   11: eth0@if10: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
   link/ether 02:42:ac:10:56:02 brd ff:ff:ff:ff:ff:ff
   inet 172.16.86.2/24 brd 172.16.86.255 scope global eth0
      valid_lft forever preferred_lft forever
   ```
@y
   11: eth0@if10: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
   link/ether 02:42:ac:10:56:02 brd ff:ff:ff:ff:ff:ff
   inet 172.16.86.2/24 brd 172.16.86.255 scope global eth0
      valid_lft forever preferred_lft forever
   ```
@z

@x
   Check the routing table:
@y
   Check the routing table:
@z

@x
   ```console
   $ docker exec my-second-macvlan-alpine ip route
@y
   ```console
   $ docker exec my-second-macvlan-alpine ip route
@z

@x
   default via 172.16.86.1 dev eth0
   172.16.86.0/24 dev eth0 scope link  src 172.16.86.2
   ```
@y
   default via 172.16.86.1 dev eth0
   172.16.86.0/24 dev eth0 scope link  src 172.16.86.2
   ```
@z

@x
5. Stop the container and remove the network:
@y
5. Stop the container and remove the network:
@z

@x
   ```console
   $ docker container stop my-second-macvlan-alpine
   $ docker network rm my-8021q-macvlan-net
   ```
@y
   ```console
   $ docker container stop my-second-macvlan-alpine
   $ docker network rm my-8021q-macvlan-net
   ```
@z
