%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Networking with standalone containers
description: Tutorials for networking with standalone containers
keywords: networking, bridge, routing, ports, overlay
---
@y
---
title: Networking with standalone containers
description: Tutorials for networking with standalone containers
keywords: networking, bridge, routing, ports, overlay
---
@z

@x
This series of tutorials deals with networking for standalone Docker containers.
For networking with swarm services, see
[Networking with swarm services](network-tutorial-overlay.md). If you need to
learn more about Docker networking in general, see the [overview](index.md).
@y
This series of tutorials deals with networking for standalone Docker containers.
For networking with swarm services, see
[Networking with swarm services](network-tutorial-overlay.md). If you need to
learn more about Docker networking in general, see the [overview](index.md).
@z

@x
This topic includes three different tutorials. You can run each of them on
Linux, Windows, or a Mac, but for the last two, you need a second Docker
host running elsewhere.
@y
This topic includes three different tutorials. You can run each of them on
Linux, Windows, or a Mac, but for the last two, you need a second Docker
host running elsewhere.
@z

@x
- [Use the default bridge network](#use-the-default-bridge-network) demonstrates
  how to use the default `bridge` network that Docker sets up for you
  automatically. This network is not the best choice for production systems.
@y
- [Use the default bridge network](#use-the-default-bridge-network) demonstrates
  how to use the default `bridge` network that Docker sets up for you
  automatically. This network is not the best choice for production systems.
@z

@x
- [Use user-defined bridge networks](#use-user-defined-bridge-networks) shows
  how to create and use your own custom bridge networks, to connect containers
  running on the same Docker host. This is recommended for standalone containers
  running in production.
@y
- [Use user-defined bridge networks](#use-user-defined-bridge-networks) shows
  how to create and use your own custom bridge networks, to connect containers
  running on the same Docker host. This is recommended for standalone containers
  running in production.
@z

@x
Although [overlay networks](drivers/overlay.md) are generally used for swarm services,
you can also use an overlay network for standalone containers. That's covered as
part of the [tutorial on using overlay networks](network-tutorial-overlay.md#use-an-overlay-network-for-standalone-containers).
@y
Although [overlay networks](drivers/overlay.md) are generally used for swarm services,
you can also use an overlay network for standalone containers. That's covered as
part of the [tutorial on using overlay networks](network-tutorial-overlay.md#use-an-overlay-network-for-standalone-containers).
@z

@x
## Use the default bridge network
@y
## Use the default bridge network
@z

@x
In this example, you start two different `alpine` containers on the same Docker
host and do some tests to understand how they communicate with each other. You
need to have Docker installed and running.
@y
In this example, you start two different `alpine` containers on the same Docker
host and do some tests to understand how they communicate with each other. You
need to have Docker installed and running.
@z

@x
1.  Open a terminal window. List current networks before you do anything else.
    Here's what you should see if you've never added a network or initialized a
    swarm on this Docker daemon. You may see different networks, but you should
    at least see these (the network IDs will be different):
@y
1.  Open a terminal window. List current networks before you do anything else.
    Here's what you should see if you've never added a network or initialized a
    swarm on this Docker daemon. You may see different networks, but you should
    at least see these (the network IDs will be different):
@z

@x
    ```console
    $ docker network ls
@y
    ```console
    $ docker network ls
@z

@x
    NETWORK ID          NAME                DRIVER              SCOPE
    17e324f45964        bridge              bridge              local
    6ed54d316334        host                host                local
    7092879f2cc8        none                null                local
    ```
@y
    NETWORK ID          NAME                DRIVER              SCOPE
    17e324f45964        bridge              bridge              local
    6ed54d316334        host                host                local
    7092879f2cc8        none                null                local
    ```
@z

@x
    The default `bridge` network is listed, along with `host` and `none`. The
    latter two are not fully-fledged networks, but are used to start a container
    connected directly to the Docker daemon host's networking stack, or to start
    a container with no network devices. **This tutorial will connect two
    containers to the `bridge` network.**
@y
    The default `bridge` network is listed, along with `host` and `none`. The
    latter two are not fully-fledged networks, but are used to start a container
    connected directly to the Docker daemon host's networking stack, or to start
    a container with no network devices. **This tutorial will connect two
    containers to the `bridge` network.**
@z

@x
2.  Start two `alpine` containers running `ash`, which is Alpine's default shell
    rather than `bash`. The `-dit` flags mean to start the container detached
    (in the background), interactive (with the ability to type into it), and
    with a TTY (so you can see the input and output). Since you are starting it
    detached, you won't be connected to the container right away. Instead, the
    container's ID will be printed. Because you have not specified any
    `--network` flags, the containers connect to the default `bridge` network.
@y
2.  Start two `alpine` containers running `ash`, which is Alpine's default shell
    rather than `bash`. The `-dit` flags mean to start the container detached
    (in the background), interactive (with the ability to type into it), and
    with a TTY (so you can see the input and output). Since you are starting it
    detached, you won't be connected to the container right away. Instead, the
    container's ID will be printed. Because you have not specified any
    `--network` flags, the containers connect to the default `bridge` network.
@z

@x
    ```console
    $ docker run -dit --name alpine1 alpine ash
@y
    ```console
    $ docker run -dit --name alpine1 alpine ash
@z

@x
    $ docker run -dit --name alpine2 alpine ash
    ```
@y
    $ docker run -dit --name alpine2 alpine ash
    ```
@z

@x
    Check that both containers are actually started:
@y
    Check that both containers are actually started:
@z

@x
    ```console
    $ docker container ls
@y
    ```console
    $ docker container ls
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    602dbf1edc81        alpine              "ash"               4 seconds ago       Up 3 seconds                            alpine2
    da33b7aa74b0        alpine              "ash"               17 seconds ago      Up 16 seconds                           alpine1
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    602dbf1edc81        alpine              "ash"               4 seconds ago       Up 3 seconds                            alpine2
    da33b7aa74b0        alpine              "ash"               17 seconds ago      Up 16 seconds                           alpine1
    ```
@z

@x
3.  Inspect the `bridge` network to see what containers are connected to it.
@y
3.  Inspect the `bridge` network to see what containers are connected to it.
@z

@x
    ```console
    $ docker network inspect bridge
@y
    ```console
    $ docker network inspect bridge
@z

@x
    [
        {
            "Name": "bridge",
            "Id": "17e324f459648a9baaea32b248d3884da102dde19396c25b30ec800068ce6b10",
            "Created": "2017-06-22T20:27:43.826654485Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": null,
                "Config": [
                    {
                        "Subnet": "172.17.0.0/16",
                        "Gateway": "172.17.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "602dbf1edc81813304b6cf0a647e65333dc6fe6ee6ed572dc0f686a3307c6a2c": {
                    "Name": "alpine2",
                    "EndpointID": "03b6aafb7ca4d7e531e292901b43719c0e34cc7eef565b38a6bf84acf50f38cd",
                    "MacAddress": "02:42:ac:11:00:03",
                    "IPv4Address": "172.17.0.3/16",
                    "IPv6Address": ""
                },
                "da33b7aa74b0bf3bda3ebd502d404320ca112a268aafe05b4851d1e3312ed168": {
                    "Name": "alpine1",
                    "EndpointID": "46c044a645d6afc42ddd7857d19e9dcfb89ad790afb5c239a35ac0af5e8a5bc5",
                    "MacAddress": "02:42:ac:11:00:02",
                    "IPv4Address": "172.17.0.2/16",
                    "IPv6Address": ""
                }
            },
            "Options": {
                "com.docker.network.bridge.default_bridge": "true",
                "com.docker.network.bridge.enable_icc": "true",
                "com.docker.network.bridge.enable_ip_masquerade": "true",
                "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                "com.docker.network.bridge.name": "docker0",
                "com.docker.network.driver.mtu": "1500"
            },
            "Labels": {}
        }
    ]
    ```
@y
    [
        {
            "Name": "bridge",
            "Id": "17e324f459648a9baaea32b248d3884da102dde19396c25b30ec800068ce6b10",
            "Created": "2017-06-22T20:27:43.826654485Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": null,
                "Config": [
                    {
                        "Subnet": "172.17.0.0/16",
                        "Gateway": "172.17.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "602dbf1edc81813304b6cf0a647e65333dc6fe6ee6ed572dc0f686a3307c6a2c": {
                    "Name": "alpine2",
                    "EndpointID": "03b6aafb7ca4d7e531e292901b43719c0e34cc7eef565b38a6bf84acf50f38cd",
                    "MacAddress": "02:42:ac:11:00:03",
                    "IPv4Address": "172.17.0.3/16",
                    "IPv6Address": ""
                },
                "da33b7aa74b0bf3bda3ebd502d404320ca112a268aafe05b4851d1e3312ed168": {
                    "Name": "alpine1",
                    "EndpointID": "46c044a645d6afc42ddd7857d19e9dcfb89ad790afb5c239a35ac0af5e8a5bc5",
                    "MacAddress": "02:42:ac:11:00:02",
                    "IPv4Address": "172.17.0.2/16",
                    "IPv6Address": ""
                }
            },
            "Options": {
                "com.docker.network.bridge.default_bridge": "true",
                "com.docker.network.bridge.enable_icc": "true",
                "com.docker.network.bridge.enable_ip_masquerade": "true",
                "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                "com.docker.network.bridge.name": "docker0",
                "com.docker.network.driver.mtu": "1500"
            },
            "Labels": {}
        }
    ]
    ```
@z

@x
    Near the top, information about the `bridge` network is listed, including
    the IP address of the gateway between the Docker host and the `bridge`
    network (`172.17.0.1`). Under the `Containers` key, each connected container
    is listed, along with information about its IP address (`172.17.0.2` for
    `alpine1` and `172.17.0.3` for `alpine2`).
@y
    Near the top, information about the `bridge` network is listed, including
    the IP address of the gateway between the Docker host and the `bridge`
    network (`172.17.0.1`). Under the `Containers` key, each connected container
    is listed, along with information about its IP address (`172.17.0.2` for
    `alpine1` and `172.17.0.3` for `alpine2`).
@z

@x
4.  The containers are running in the background. Use the `docker attach`
    command to connect to `alpine1`.
@y
4.  The containers are running in the background. Use the `docker attach`
    command to connect to `alpine1`.
@z

@x
    ```console
    $ docker attach alpine1
@y
    ```console
    $ docker attach alpine1
@z

@x
    / #
    ```
@y
    / #
    ```
@z

@x
    The prompt changes to `#` to indicate that you are the `root` user within
    the container. Use the `ip addr show` command to show the network interfaces
    for `alpine1` as they look from within the container:
@y
    The prompt changes to `#` to indicate that you are the `root` user within
    the container. Use the `ip addr show` command to show the network interfaces
    for `alpine1` as they look from within the container:
@z

@x
    ```console
    # ip addr show
@y
    ```console
    # ip addr show
@z

@x
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host
           valid_lft forever preferred_lft forever
    27: eth0@if28: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
        link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff
        inet 172.17.0.2/16 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 fe80::42:acff:fe11:2/64 scope link
           valid_lft forever preferred_lft forever
    ```
@y
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host
           valid_lft forever preferred_lft forever
    27: eth0@if28: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
        link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff
        inet 172.17.0.2/16 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 fe80::42:acff:fe11:2/64 scope link
           valid_lft forever preferred_lft forever
    ```
@z

@x
    The first interface is the loopback device. Ignore it for now. Notice that
    the second interface has the IP address `172.17.0.2`, which is the same
    address shown for `alpine1` in the previous step.
@y
    The first interface is the loopback device. Ignore it for now. Notice that
    the second interface has the IP address `172.17.0.2`, which is the same
    address shown for `alpine1` in the previous step.
@z

@x
5.  From within `alpine1`, make sure you can connect to the internet by
    pinging `google.com`. The `-c 2` flag limits the command to two `ping`
    attempts.
@y
5.  From within `alpine1`, make sure you can connect to the internet by
    pinging `google.com`. The `-c 2` flag limits the command to two `ping`
    attempts.
@z

@x
    ```console
    # ping -c 2 google.com
@y
    ```console
    # ping -c 2 google.com
@z

@x
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.841 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.897 ms
@y
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.841 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.897 ms
@z

@x
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.841/9.869/9.897 ms
    ```
@y
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.841/9.869/9.897 ms
    ```
@z

@x
6.  Now try to ping the second container. First, ping it by its IP address,
    `172.17.0.3`:
@y
6.  Now try to ping the second container. First, ping it by its IP address,
    `172.17.0.3`:
@z

@x
    ```console
    # ping -c 2 172.17.0.3
@y
    ```console
    # ping -c 2 172.17.0.3
@z

@x
    PING 172.17.0.3 (172.17.0.3): 56 data bytes
    64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.086 ms
    64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.094 ms
@y
    PING 172.17.0.3 (172.17.0.3): 56 data bytes
    64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.086 ms
    64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.094 ms
@z

@x
    --- 172.17.0.3 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.086/0.090/0.094 ms
    ```
@y
    --- 172.17.0.3 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.086/0.090/0.094 ms
    ```
@z

@x
    This succeeds. Next, try pinging the `alpine2` container by container
    name. This will fail.
@y
    This succeeds. Next, try pinging the `alpine2` container by container
    name. This will fail.
@z

@x
    ```console
    # ping -c 2 alpine2
@y
    ```console
    # ping -c 2 alpine2
@z

@x
    ping: bad address 'alpine2'
    ```
@y
    ping: bad address 'alpine2'
    ```
@z

@x
7.  Detach from `alpine1` without stopping it by using the detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
    If you wish, attach to `alpine2` and repeat steps 4, 5, and 6 there,
    substituting `alpine1` for `alpine2`.
@y
7.  Detach from `alpine1` without stopping it by using the detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
    If you wish, attach to `alpine2` and repeat steps 4, 5, and 6 there,
    substituting `alpine1` for `alpine2`.
@z

@x
8.  Stop and remove both containers.
@y
8.  Stop and remove both containers.
@z

@x
    ```console
    $ docker container stop alpine1 alpine2
    $ docker container rm alpine1 alpine2
    ```
@y
    ```console
    $ docker container stop alpine1 alpine2
    $ docker container rm alpine1 alpine2
    ```
@z

@x
Remember, the default `bridge` network is not recommended for production. To
learn about user-defined bridge networks, continue to the
[next tutorial](#use-user-defined-bridge-networks).
@y
Remember, the default `bridge` network is not recommended for production. To
learn about user-defined bridge networks, continue to the
[next tutorial](#use-user-defined-bridge-networks).
@z

@x
## Use user-defined bridge networks
@y
## Use user-defined bridge networks
@z

@x
In this example, we again start two `alpine` containers, but attach them to a
user-defined network called `alpine-net` which we have already created. These
containers are not connected to the default `bridge` network at all. We then
start a third `alpine` container which is connected to the `bridge` network but
not connected to `alpine-net`, and a fourth `alpine` container which is
connected to both networks.
@y
In this example, we again start two `alpine` containers, but attach them to a
user-defined network called `alpine-net` which we have already created. These
containers are not connected to the default `bridge` network at all. We then
start a third `alpine` container which is connected to the `bridge` network but
not connected to `alpine-net`, and a fourth `alpine` container which is
connected to both networks.
@z

@x
1.  Create the `alpine-net` network. You do not need the `--driver bridge` flag
    since it's the default, but this example shows how to specify it.
@y
1.  Create the `alpine-net` network. You do not need the `--driver bridge` flag
    since it's the default, but this example shows how to specify it.
@z

@x
    ```console
    $ docker network create --driver bridge alpine-net
    ```
@y
    ```console
    $ docker network create --driver bridge alpine-net
    ```
@z

@x
2.  List Docker's networks:
@y
2.  List Docker's networks:
@z

@x
    ```console
    $ docker network ls
@y
    ```console
    $ docker network ls
@z

@x
    NETWORK ID          NAME                DRIVER              SCOPE
    e9261a8c9a19        alpine-net          bridge              local
    17e324f45964        bridge              bridge              local
    6ed54d316334        host                host                local
    7092879f2cc8        none                null                local
    ```
@y
    NETWORK ID          NAME                DRIVER              SCOPE
    e9261a8c9a19        alpine-net          bridge              local
    17e324f45964        bridge              bridge              local
    6ed54d316334        host                host                local
    7092879f2cc8        none                null                local
    ```
@z

@x
    Inspect the `alpine-net` network. This shows you its IP address and the fact
    that no containers are connected to it:
@y
    Inspect the `alpine-net` network. This shows you its IP address and the fact
    that no containers are connected to it:
@z

@x
    ```console
    $ docker network inspect alpine-net
@y
    ```console
    $ docker network inspect alpine-net
@z

@x
    [
        {
            "Name": "alpine-net",
            "Id": "e9261a8c9a19eabf2bf1488bf5f208b99b1608f330cff585c273d39481c9b0ec",
            "Created": "2017-09-25T21:38:12.620046142Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": {},
                "Config": [
                    {
                        "Subnet": "172.18.0.0/16",
                        "Gateway": "172.18.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {},
            "Options": {},
            "Labels": {}
        }
    ]
    ```
@y
    [
        {
            "Name": "alpine-net",
            "Id": "e9261a8c9a19eabf2bf1488bf5f208b99b1608f330cff585c273d39481c9b0ec",
            "Created": "2017-09-25T21:38:12.620046142Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": {},
                "Config": [
                    {
                        "Subnet": "172.18.0.0/16",
                        "Gateway": "172.18.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {},
            "Options": {},
            "Labels": {}
        }
    ]
    ```
@z

@x
    Notice that this network's gateway is `172.18.0.1`, as opposed to the
    default bridge network, whose gateway is `172.17.0.1`. The exact IP address
    may be different on your system.
@y
    Notice that this network's gateway is `172.18.0.1`, as opposed to the
    default bridge network, whose gateway is `172.17.0.1`. The exact IP address
    may be different on your system.
@z

@x
3.  Create your four containers. Notice the `--network` flags. You can only
    connect to one network during the `docker run` command, so you need to use
    `docker network connect` afterward to connect `alpine4` to the `bridge`
    network as well.
@y
3.  Create your four containers. Notice the `--network` flags. You can only
    connect to one network during the `docker run` command, so you need to use
    `docker network connect` afterward to connect `alpine4` to the `bridge`
    network as well.
@z

@x
    ```console
    $ docker run -dit --name alpine1 --network alpine-net alpine ash
@y
    ```console
    $ docker run -dit --name alpine1 --network alpine-net alpine ash
@z

@x
    $ docker run -dit --name alpine2 --network alpine-net alpine ash
@y
    $ docker run -dit --name alpine2 --network alpine-net alpine ash
@z

@x
    $ docker run -dit --name alpine3 alpine ash
@y
    $ docker run -dit --name alpine3 alpine ash
@z

@x
    $ docker run -dit --name alpine4 --network alpine-net alpine ash
@y
    $ docker run -dit --name alpine4 --network alpine-net alpine ash
@z

@x
    $ docker network connect bridge alpine4
    ```
@y
    $ docker network connect bridge alpine4
    ```
@z

@x
    Verify that all containers are running:
@y
    Verify that all containers are running:
@z

@x
    ```console
    $ docker container ls
@y
    ```console
    $ docker container ls
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    156849ccd902        alpine              "ash"               41 seconds ago       Up 41 seconds                           alpine4
    fa1340b8d83e        alpine              "ash"               51 seconds ago       Up 51 seconds                           alpine3
    a535d969081e        alpine              "ash"               About a minute ago   Up About a minute                       alpine2
    0a02c449a6e9        alpine              "ash"               About a minute ago   Up About a minute                       alpine1
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    156849ccd902        alpine              "ash"               41 seconds ago       Up 41 seconds                           alpine4
    fa1340b8d83e        alpine              "ash"               51 seconds ago       Up 51 seconds                           alpine3
    a535d969081e        alpine              "ash"               About a minute ago   Up About a minute                       alpine2
    0a02c449a6e9        alpine              "ash"               About a minute ago   Up About a minute                       alpine1
    ```
@z

@x
4.  Inspect the `bridge` network and the `alpine-net` network again:
@y
4.  Inspect the `bridge` network and the `alpine-net` network again:
@z

@x
    ```console
    $ docker network inspect bridge
@y
    ```console
    $ docker network inspect bridge
@z

@x
    [
        {
            "Name": "bridge",
            "Id": "17e324f459648a9baaea32b248d3884da102dde19396c25b30ec800068ce6b10",
            "Created": "2017-06-22T20:27:43.826654485Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": null,
                "Config": [
                    {
                        "Subnet": "172.17.0.0/16",
                        "Gateway": "172.17.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "156849ccd902b812b7d17f05d2d81532ccebe5bf788c9a79de63e12bb92fc621": {
                    "Name": "alpine4",
                    "EndpointID": "7277c5183f0da5148b33d05f329371fce7befc5282d2619cfb23690b2adf467d",
                    "MacAddress": "02:42:ac:11:00:03",
                    "IPv4Address": "172.17.0.3/16",
                    "IPv6Address": ""
                },
                "fa1340b8d83eef5497166951184ad3691eb48678a3664608ec448a687b047c53": {
                    "Name": "alpine3",
                    "EndpointID": "5ae767367dcbebc712c02d49556285e888819d4da6b69d88cd1b0d52a83af95f",
                    "MacAddress": "02:42:ac:11:00:02",
                    "IPv4Address": "172.17.0.2/16",
                    "IPv6Address": ""
                }
            },
            "Options": {
                "com.docker.network.bridge.default_bridge": "true",
                "com.docker.network.bridge.enable_icc": "true",
                "com.docker.network.bridge.enable_ip_masquerade": "true",
                "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                "com.docker.network.bridge.name": "docker0",
                "com.docker.network.driver.mtu": "1500"
            },
            "Labels": {}
        }
    ]
    ```
@y
    [
        {
            "Name": "bridge",
            "Id": "17e324f459648a9baaea32b248d3884da102dde19396c25b30ec800068ce6b10",
            "Created": "2017-06-22T20:27:43.826654485Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": null,
                "Config": [
                    {
                        "Subnet": "172.17.0.0/16",
                        "Gateway": "172.17.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "156849ccd902b812b7d17f05d2d81532ccebe5bf788c9a79de63e12bb92fc621": {
                    "Name": "alpine4",
                    "EndpointID": "7277c5183f0da5148b33d05f329371fce7befc5282d2619cfb23690b2adf467d",
                    "MacAddress": "02:42:ac:11:00:03",
                    "IPv4Address": "172.17.0.3/16",
                    "IPv6Address": ""
                },
                "fa1340b8d83eef5497166951184ad3691eb48678a3664608ec448a687b047c53": {
                    "Name": "alpine3",
                    "EndpointID": "5ae767367dcbebc712c02d49556285e888819d4da6b69d88cd1b0d52a83af95f",
                    "MacAddress": "02:42:ac:11:00:02",
                    "IPv4Address": "172.17.0.2/16",
                    "IPv6Address": ""
                }
            },
            "Options": {
                "com.docker.network.bridge.default_bridge": "true",
                "com.docker.network.bridge.enable_icc": "true",
                "com.docker.network.bridge.enable_ip_masquerade": "true",
                "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                "com.docker.network.bridge.name": "docker0",
                "com.docker.network.driver.mtu": "1500"
            },
            "Labels": {}
        }
    ]
    ```
@z

@x
    Containers `alpine3` and `alpine4` are connected to the `bridge` network.
@y
    Containers `alpine3` and `alpine4` are connected to the `bridge` network.
@z

@x
    ```console
    $ docker network inspect alpine-net
@y
    ```console
    $ docker network inspect alpine-net
@z

@x
    [
        {
            "Name": "alpine-net",
            "Id": "e9261a8c9a19eabf2bf1488bf5f208b99b1608f330cff585c273d39481c9b0ec",
            "Created": "2017-09-25T21:38:12.620046142Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": {},
                "Config": [
                    {
                        "Subnet": "172.18.0.0/16",
                        "Gateway": "172.18.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "0a02c449a6e9a15113c51ab2681d72749548fb9f78fae4493e3b2e4e74199c4a": {
                    "Name": "alpine1",
                    "EndpointID": "c83621678eff9628f4e2d52baf82c49f974c36c05cba152db4c131e8e7a64673",
                    "MacAddress": "02:42:ac:12:00:02",
                    "IPv4Address": "172.18.0.2/16",
                    "IPv6Address": ""
                },
                "156849ccd902b812b7d17f05d2d81532ccebe5bf788c9a79de63e12bb92fc621": {
                    "Name": "alpine4",
                    "EndpointID": "058bc6a5e9272b532ef9a6ea6d7f3db4c37527ae2625d1cd1421580fd0731954",
                    "MacAddress": "02:42:ac:12:00:04",
                    "IPv4Address": "172.18.0.4/16",
                    "IPv6Address": ""
                },
                "a535d969081e003a149be8917631215616d9401edcb4d35d53f00e75ea1db653": {
                    "Name": "alpine2",
                    "EndpointID": "198f3141ccf2e7dba67bce358d7b71a07c5488e3867d8b7ad55a4c695ebb8740",
                    "MacAddress": "02:42:ac:12:00:03",
                    "IPv4Address": "172.18.0.3/16",
                    "IPv6Address": ""
                }
            },
            "Options": {},
            "Labels": {}
        }
    ]
    ```
@y
    [
        {
            "Name": "alpine-net",
            "Id": "e9261a8c9a19eabf2bf1488bf5f208b99b1608f330cff585c273d39481c9b0ec",
            "Created": "2017-09-25T21:38:12.620046142Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": {},
                "Config": [
                    {
                        "Subnet": "172.18.0.0/16",
                        "Gateway": "172.18.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "0a02c449a6e9a15113c51ab2681d72749548fb9f78fae4493e3b2e4e74199c4a": {
                    "Name": "alpine1",
                    "EndpointID": "c83621678eff9628f4e2d52baf82c49f974c36c05cba152db4c131e8e7a64673",
                    "MacAddress": "02:42:ac:12:00:02",
                    "IPv4Address": "172.18.0.2/16",
                    "IPv6Address": ""
                },
                "156849ccd902b812b7d17f05d2d81532ccebe5bf788c9a79de63e12bb92fc621": {
                    "Name": "alpine4",
                    "EndpointID": "058bc6a5e9272b532ef9a6ea6d7f3db4c37527ae2625d1cd1421580fd0731954",
                    "MacAddress": "02:42:ac:12:00:04",
                    "IPv4Address": "172.18.0.4/16",
                    "IPv6Address": ""
                },
                "a535d969081e003a149be8917631215616d9401edcb4d35d53f00e75ea1db653": {
                    "Name": "alpine2",
                    "EndpointID": "198f3141ccf2e7dba67bce358d7b71a07c5488e3867d8b7ad55a4c695ebb8740",
                    "MacAddress": "02:42:ac:12:00:03",
                    "IPv4Address": "172.18.0.3/16",
                    "IPv6Address": ""
                }
            },
            "Options": {},
            "Labels": {}
        }
    ]
    ```
@z

@x
    Containers `alpine1`, `alpine2`, and `alpine4` are connected to the
    `alpine-net` network.
@y
    Containers `alpine1`, `alpine2`, and `alpine4` are connected to the
    `alpine-net` network.
@z

@x
5.  On user-defined networks like `alpine-net`, containers can not only
    communicate by IP address, but can also resolve a container name to an IP
    address. This capability is called **automatic service discovery**. Let's
    connect to `alpine1` and test this out. `alpine1` should be able to resolve
    `alpine2` and `alpine4` (and `alpine1`, itself) to IP addresses.
@y
5.  On user-defined networks like `alpine-net`, containers can not only
    communicate by IP address, but can also resolve a container name to an IP
    address. This capability is called **automatic service discovery**. Let's
    connect to `alpine1` and test this out. `alpine1` should be able to resolve
    `alpine2` and `alpine4` (and `alpine1`, itself) to IP addresses.
@z

@x
    > **Note**
    > 
    > Automatic service discovery can only resolve custom container names, not default automatically generated container names,
@y
    > **Note**
    > 
    > Automatic service discovery can only resolve custom container names, not default automatically generated container names,
@z

@x
    ```console
    $ docker container attach alpine1
@y
    ```console
    $ docker container attach alpine1
@z

@x
    # ping -c 2 alpine2
@y
    # ping -c 2 alpine2
@z

@x
    PING alpine2 (172.18.0.3): 56 data bytes
    64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.085 ms
    64 bytes from 172.18.0.3: seq=1 ttl=64 time=0.090 ms
@y
    PING alpine2 (172.18.0.3): 56 data bytes
    64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.085 ms
    64 bytes from 172.18.0.3: seq=1 ttl=64 time=0.090 ms
@z

@x
    --- alpine2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.085/0.087/0.090 ms
@y
    --- alpine2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.085/0.087/0.090 ms
@z

@x
    # ping -c 2 alpine4
@y
    # ping -c 2 alpine4
@z

@x
    PING alpine4 (172.18.0.4): 56 data bytes
    64 bytes from 172.18.0.4: seq=0 ttl=64 time=0.076 ms
    64 bytes from 172.18.0.4: seq=1 ttl=64 time=0.091 ms
@y
    PING alpine4 (172.18.0.4): 56 data bytes
    64 bytes from 172.18.0.4: seq=0 ttl=64 time=0.076 ms
    64 bytes from 172.18.0.4: seq=1 ttl=64 time=0.091 ms
@z

@x
    --- alpine4 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.076/0.083/0.091 ms
@y
    --- alpine4 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.076/0.083/0.091 ms
@z

@x
    # ping -c 2 alpine1
@y
    # ping -c 2 alpine1
@z

@x
    PING alpine1 (172.18.0.2): 56 data bytes
    64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.026 ms
    64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.054 ms
@y
    PING alpine1 (172.18.0.2): 56 data bytes
    64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.026 ms
    64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.054 ms
@z

@x
    --- alpine1 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.026/0.040/0.054 ms
    ```
@y
    --- alpine1 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.026/0.040/0.054 ms
    ```
@z

@x
6.  From `alpine1`, you should not be able to connect to `alpine3` at all, since
    it is not on the `alpine-net` network.
@y
6.  From `alpine1`, you should not be able to connect to `alpine3` at all, since
    it is not on the `alpine-net` network.
@z

@x
    ```console
    # ping -c 2 alpine3
@y
    ```console
    # ping -c 2 alpine3
@z

@x
    ping: bad address 'alpine3'
    ```
@y
    ping: bad address 'alpine3'
    ```
@z

@x
    Not only that, but you can't connect to `alpine3` from `alpine1` by its IP
    address either. Look back at the `docker network inspect` output for the
    `bridge` network and find `alpine3`'s IP address: `172.17.0.2` Try to ping
    it.
@y
    Not only that, but you can't connect to `alpine3` from `alpine1` by its IP
    address either. Look back at the `docker network inspect` output for the
    `bridge` network and find `alpine3`'s IP address: `172.17.0.2` Try to ping
    it.
@z

@x
    ```console
    # ping -c 2 172.17.0.2
@y
    ```console
    # ping -c 2 172.17.0.2
@z

@x
    PING 172.17.0.2 (172.17.0.2): 56 data bytes
@y
    PING 172.17.0.2 (172.17.0.2): 56 data bytes
@z

@x
    --- 172.17.0.2 ping statistics ---
    2 packets transmitted, 0 packets received, 100% packet loss
    ```
@y
    --- 172.17.0.2 ping statistics ---
    2 packets transmitted, 0 packets received, 100% packet loss
    ```
@z

@x
    Detach from `alpine1` using detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
@y
    Detach from `alpine1` using detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
@z

@x
7.  Remember that `alpine4` is connected to both the default `bridge` network
    and `alpine-net`. It should be able to reach all of the other containers.
    However, you will need to address `alpine3` by its IP address. Attach to it
    and run the tests.
@y
7.  Remember that `alpine4` is connected to both the default `bridge` network
    and `alpine-net`. It should be able to reach all of the other containers.
    However, you will need to address `alpine3` by its IP address. Attach to it
    and run the tests.
@z

@x
    ```console
    $ docker container attach alpine4
@y
    ```console
    $ docker container attach alpine4
@z

@x
    # ping -c 2 alpine1
@y
    # ping -c 2 alpine1
@z

@x
    PING alpine1 (172.18.0.2): 56 data bytes
    64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.074 ms
    64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.082 ms
@y
    PING alpine1 (172.18.0.2): 56 data bytes
    64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.074 ms
    64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.082 ms
@z

@x
    --- alpine1 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.074/0.078/0.082 ms
@y
    --- alpine1 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.074/0.078/0.082 ms
@z

@x
    # ping -c 2 alpine2
@y
    # ping -c 2 alpine2
@z

@x
    PING alpine2 (172.18.0.3): 56 data bytes
    64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.075 ms
    64 bytes from 172.18.0.3: seq=1 ttl=64 time=0.080 ms
@y
    PING alpine2 (172.18.0.3): 56 data bytes
    64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.075 ms
    64 bytes from 172.18.0.3: seq=1 ttl=64 time=0.080 ms
@z

@x
    --- alpine2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.075/0.077/0.080 ms
@y
    --- alpine2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.075/0.077/0.080 ms
@z

@x
    # ping -c 2 alpine3
    ping: bad address 'alpine3'
@y
    # ping -c 2 alpine3
    ping: bad address 'alpine3'
@z

@x
    # ping -c 2 172.17.0.2
@y
    # ping -c 2 172.17.0.2
@z

@x
    PING 172.17.0.2 (172.17.0.2): 56 data bytes
    64 bytes from 172.17.0.2: seq=0 ttl=64 time=0.089 ms
    64 bytes from 172.17.0.2: seq=1 ttl=64 time=0.075 ms
@y
    PING 172.17.0.2 (172.17.0.2): 56 data bytes
    64 bytes from 172.17.0.2: seq=0 ttl=64 time=0.089 ms
    64 bytes from 172.17.0.2: seq=1 ttl=64 time=0.075 ms
@z

@x
    --- 172.17.0.2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.075/0.082/0.089 ms
@y
    --- 172.17.0.2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.075/0.082/0.089 ms
@z

@x
    # ping -c 2 alpine4
@y
    # ping -c 2 alpine4
@z

@x
    PING alpine4 (172.18.0.4): 56 data bytes
    64 bytes from 172.18.0.4: seq=0 ttl=64 time=0.033 ms
    64 bytes from 172.18.0.4: seq=1 ttl=64 time=0.064 ms
@y
    PING alpine4 (172.18.0.4): 56 data bytes
    64 bytes from 172.18.0.4: seq=0 ttl=64 time=0.033 ms
    64 bytes from 172.18.0.4: seq=1 ttl=64 time=0.064 ms
@z

@x
    --- alpine4 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.033/0.048/0.064 ms
    ```
@y
    --- alpine4 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.033/0.048/0.064 ms
    ```
@z

@x
8.  As a final test, make sure your containers can all connect to the internet
    by pinging `google.com`. You are already attached to `alpine4` so start by
    trying from there. Next, detach from `alpine4` and connect to `alpine3`
    (which is only attached to the `bridge` network) and try again. Finally,
    connect to `alpine1` (which is only connected to the `alpine-net` network)
    and try again.
@y
8.  As a final test, make sure your containers can all connect to the internet
    by pinging `google.com`. You are already attached to `alpine4` so start by
    trying from there. Next, detach from `alpine4` and connect to `alpine3`
    (which is only attached to the `bridge` network) and try again. Finally,
    connect to `alpine1` (which is only connected to the `alpine-net` network)
    and try again.
@z

@x
    ```console
    # ping -c 2 google.com
@y
    ```console
    # ping -c 2 google.com
@z

@x
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.778 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.634 ms
@y
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.778 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.634 ms
@z

@x
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.634/9.706/9.778 ms
@y
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.634/9.706/9.778 ms
@z

@x
    CTRL+p CTRL+q
@y
    CTRL+p CTRL+q
@z

@x
    $ docker container attach alpine3
@y
    $ docker container attach alpine3
@z

@x
    # ping -c 2 google.com
@y
    # ping -c 2 google.com
@z

@x
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.706 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.851 ms
@y
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.706 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.851 ms
@z

@x
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.706/9.778/9.851 ms
@y
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.706/9.778/9.851 ms
@z

@x
    CTRL+p CTRL+q
@y
    CTRL+p CTRL+q
@z

@x
    $ docker container attach alpine1
@y
    $ docker container attach alpine1
@z

@x
    # ping -c 2 google.com
@y
    # ping -c 2 google.com
@z

@x
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.606 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.603 ms
@y
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.606 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.603 ms
@z

@x
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.603/9.604/9.606 ms
@y
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.603/9.604/9.606 ms
@z

@x
    CTRL+p CTRL+q
    ```
@y
    CTRL+p CTRL+q
    ```
@z

@x
9.  Stop and remove all containers and the `alpine-net` network.
@y
9.  Stop and remove all containers and the `alpine-net` network.
@z

@x
    ```console
    $ docker container stop alpine1 alpine2 alpine3 alpine4
@y
    ```console
    $ docker container stop alpine1 alpine2 alpine3 alpine4
@z

@x
    $ docker container rm alpine1 alpine2 alpine3 alpine4
@y
    $ docker container rm alpine1 alpine2 alpine3 alpine4
@z

@x
    $ docker network rm alpine-net
    ```
@y
    $ docker network rm alpine-net
    ```
@z

@x
## Other networking tutorials
@y
## Other networking tutorials
@z

@x
Now that you have completed the networking tutorials for standalone containers,
you might want to run through these other networking tutorials:
@y
Now that you have completed the networking tutorials for standalone containers,
you might want to run through these other networking tutorials:
@z

@x
- [Host networking tutorial](network-tutorial-host.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
@y
- [Host networking tutorial](network-tutorial-host.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
@z
