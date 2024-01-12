%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Networking using a macvlan network
description: Tutorials for networking using a macvlan bridge network and 802.1Q trunk
  bridge network
keywords: networking, macvlan, 802.1Q, standalone
---
@y
---
title: Networking using a macvlan network
description: Tutorials for networking using a macvlan bridge network and 802.1Q trunk
  bridge network
keywords: networking, macvlan, 802.1Q, standalone
---
@z

@x
This series of tutorials deals with networking standalone containers which
connect to `macvlan` networks. In this type of network, the Docker host accepts
requests for multiple MAC addresses at its IP address, and routes those requests
to the appropriate container. For other networking topics, see the
[overview](index.md).
@y
This series of tutorials deals with networking standalone containers which
connect to `macvlan` networks. In this type of network, the Docker host accepts
requests for multiple MAC addresses at its IP address, and routes those requests
to the appropriate container. For other networking topics, see the
[overview](index.md).
@z

@x
## Goal
@y
## Goal
@z

@x
The goal of these tutorials is to set up a bridged `macvlan` network and attach
a container to it, then set up an 802.1Q trunked `macvlan` network and attach a
container to it.
@y
The goal of these tutorials is to set up a bridged `macvlan` network and attach
a container to it, then set up an 802.1Q trunked `macvlan` network and attach a
container to it.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Most cloud providers block `macvlan` networking. You may need physical access
  to your networking equipment.
@y
- Most cloud providers block `macvlan` networking. You may need physical access
  to your networking equipment.
@z

@x
- The `macvlan` networking driver only works on Linux hosts, and is not supported
  on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
@y
- The `macvlan` networking driver only works on Linux hosts, and is not supported
  on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
@z

@x
- You need at least version 3.9 of the Linux kernel, and version 4.0 or higher
  is recommended.
@y
- You need at least version 3.9 of the Linux kernel, and version 4.0 or higher
  is recommended.
@z

@x
- The examples assume your ethernet interface is `eth0`. If your device has a
  different name, use that instead.
@y
- The examples assume your ethernet interface is `eth0`. If your device has a
  different name, use that instead.
@z

@x
- The `macvlan` driver is not supported in rootless mode.
@y
- The `macvlan` driver is not supported in rootless mode.
@z

@x
## Bridge example
@y
## Bridge example
@z

@x
In the simple bridge example, your traffic flows through `eth0` and Docker
routes traffic to your container using its MAC address. To network devices
on your network, your container appears to be physically attached to the network.
@y
In the simple bridge example, your traffic flows through `eth0` and Docker
routes traffic to your container using its MAC address. To network devices
on your network, your container appears to be physically attached to the network.
@z

@x
1.  Create a `macvlan` network called `my-macvlan-net`. Modify the `subnet`, `gateway`,
    and `parent` values to values that make sense in your environment.
@y
1.  Create a `macvlan` network called `my-macvlan-net`. Modify the `subnet`, `gateway`,
    and `parent` values to values that make sense in your environment.
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
    You can use `docker network ls` and `docker network inspect my-macvlan-net`
    commands to verify that the network exists and is a `macvlan` network.
@y
    You can use `docker network ls` and `docker network inspect my-macvlan-net`
    commands to verify that the network exists and is a `macvlan` network.
@z

@x
2.  Start an `alpine` container and attach it to the `my-macvlan-net` network. The
    `-dit` flags start the container in the background but allow you to attach
    to it. The `--rm` flag means the container is removed when it is stopped.
@y
2.  Start an `alpine` container and attach it to the `my-macvlan-net` network. The
    `-dit` flags start the container in the background but allow you to attach
    to it. The `--rm` flag means the container is removed when it is stopped.
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
3.  Inspect the `my-macvlan-alpine` container and notice the `MacAddress` key
    within the `Networks` key:
@y
3.  Inspect the `my-macvlan-alpine` container and notice the `MacAddress` key
    within the `Networks` key:
@z

@x
    ```console
    $ docker container inspect my-macvlan-alpine
@y
    ```console
    $ docker container inspect my-macvlan-alpine
@z

@x
    ...truncated...
    "Networks": {
      "my-macvlan-net": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
              "bec64291cd4c"
          ],
          "NetworkID": "5e3ec79625d388dbcc03dcf4a6dc4548644eb99d58864cf8eee2252dcfc0cc9f",
          "EndpointID": "8caf93c862b22f379b60515975acf96f7b54b7cf0ba0fb4a33cf18ae9e5c1d89",
          "Gateway": "172.16.86.1",
          "IPAddress": "172.16.86.2",
          "IPPrefixLen": 24,
          "IPv6Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "MacAddress": "02:42:ac:10:56:02",
          "DriverOpts": null
      }
    }
    ...truncated
    ```
@y
    ...truncated...
    "Networks": {
      "my-macvlan-net": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
              "bec64291cd4c"
          ],
          "NetworkID": "5e3ec79625d388dbcc03dcf4a6dc4548644eb99d58864cf8eee2252dcfc0cc9f",
          "EndpointID": "8caf93c862b22f379b60515975acf96f7b54b7cf0ba0fb4a33cf18ae9e5c1d89",
          "Gateway": "172.16.86.1",
          "IPAddress": "172.16.86.2",
          "IPPrefixLen": 24,
          "IPv6Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "MacAddress": "02:42:ac:10:56:02",
          "DriverOpts": null
      }
    }
    ...truncated
    ```
@z

@x
4.  Check out how the container sees its own network interfaces by running a
    couple of `docker exec` commands.
@y
4.  Check out how the container sees its own network interfaces by running a
    couple of `docker exec` commands.
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
5.  Stop the container (Docker removes it because of the `--rm` flag), and remove
    the network.
@y
5.  Stop the container (Docker removes it because of the `--rm` flag), and remove
    the network.
@z

@x
    ```console
    $ docker container stop my-macvlan-alpine
@y
    ```console
    $ docker container stop my-macvlan-alpine
@z

@x
    $ docker network rm my-macvlan-net
    ```
@y
    $ docker network rm my-macvlan-net
    ```
@z

@x
## 802.1Q trunked bridge example
@y
## 802.1Q trunked bridge example
@z

@x
In the 802.1Q trunked bridge example, your traffic flows through a sub-interface
of `eth0` (called `eth0.10`) and Docker routes traffic to your container using
its MAC address. To network devices on your network, your container appears to
be physically attached to the network.
@y
In the 802.1Q trunked bridge example, your traffic flows through a sub-interface
of `eth0` (called `eth0.10`) and Docker routes traffic to your container using
its MAC address. To network devices on your network, your container appears to
be physically attached to the network.
@z

@x
1.  Create a `macvlan` network called `my-8021q-macvlan-net`. Modify the
    `subnet`, `gateway`, and `parent` values to values that make sense in your
    environment.
@y
1.  Create a `macvlan` network called `my-8021q-macvlan-net`. Modify the
    `subnet`, `gateway`, and `parent` values to values that make sense in your
    environment.
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
    You can use `docker network ls` and `docker network inspect my-8021q-macvlan-net`
    commands to verify that the network exists, is a `macvlan` network, and
    has parent `eth0.10`. You can use `ip addr show` on the Docker host to
    verify that the interface `eth0.10` exists and has a separate IP address
@y
    You can use `docker network ls` and `docker network inspect my-8021q-macvlan-net`
    commands to verify that the network exists, is a `macvlan` network, and
    has parent `eth0.10`. You can use `ip addr show` on the Docker host to
    verify that the interface `eth0.10` exists and has a separate IP address
@z

@x
2.  Start an `alpine` container and attach it to the `my-8021q-macvlan-net`
    network. The `-dit` flags start the container in the background but allow
    you to attach to it. The `--rm` flag means the container is removed when it
    is stopped.
@y
2.  Start an `alpine` container and attach it to the `my-8021q-macvlan-net`
    network. The `-dit` flags start the container in the background but allow
    you to attach to it. The `--rm` flag means the container is removed when it
    is stopped.
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
3.  Inspect the `my-second-macvlan-alpine` container and notice the `MacAddress`
    key within the `Networks` key:
@y
3.  Inspect the `my-second-macvlan-alpine` container and notice the `MacAddress`
    key within the `Networks` key:
@z

@x
    ```console
    $ docker container inspect my-second-macvlan-alpine
@y
    ```console
    $ docker container inspect my-second-macvlan-alpine
@z

@x
    ...truncated...
    "Networks": {
      "my-8021q-macvlan-net": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
              "12f5c3c9ba5c"
          ],
          "NetworkID": "c6203997842e654dd5086abb1133b7e6df627784fec063afcbee5893b2bb64db",
          "EndpointID": "aa08d9aa2353c68e8d2ae0bf0e11ed426ea31ed0dd71c868d22ed0dcf9fc8ae6",
          "Gateway": "172.16.86.1",
          "IPAddress": "172.16.86.2",
          "IPPrefixLen": 24,
          "IPv6Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "MacAddress": "02:42:ac:10:56:02",
          "DriverOpts": null
      }
    }
    ...truncated
    ```
@y
    ...truncated...
    "Networks": {
      "my-8021q-macvlan-net": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
              "12f5c3c9ba5c"
          ],
          "NetworkID": "c6203997842e654dd5086abb1133b7e6df627784fec063afcbee5893b2bb64db",
          "EndpointID": "aa08d9aa2353c68e8d2ae0bf0e11ed426ea31ed0dd71c868d22ed0dcf9fc8ae6",
          "Gateway": "172.16.86.1",
          "IPAddress": "172.16.86.2",
          "IPPrefixLen": 24,
          "IPv6Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "MacAddress": "02:42:ac:10:56:02",
          "DriverOpts": null
      }
    }
    ...truncated
    ```
@z

@x
4.  Check out how the container sees its own network interfaces by running a
    couple of `docker exec` commands.
@y
4.  Check out how the container sees its own network interfaces by running a
    couple of `docker exec` commands.
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
5.  Stop the container (Docker removes it because of the `--rm` flag), and remove
    the network.
@y
5.  Stop the container (Docker removes it because of the `--rm` flag), and remove
    the network.
@z

@x
    ```console
    $ docker container stop my-second-macvlan-alpine
@y
    ```console
    $ docker container stop my-second-macvlan-alpine
@z

@x
    $ docker network rm my-8021q-macvlan-net
    ```
@y
    $ docker network rm my-8021q-macvlan-net
    ```
@z

@x
## Other networking tutorials
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Host networking tutorial](network-tutorial-host.md)
@y
## Other networking tutorials
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Host networking tutorial](network-tutorial-host.md)
@z
