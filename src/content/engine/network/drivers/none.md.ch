%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: None network driver
description: How to isolate the networking stack of a container using the none driver
keywords: network, none, standalone
@y
title: None network driver
description: How to isolate the networking stack of a container using the none driver
keywords: network, none, standalone
@z

@x
If you want to completely isolate the networking stack of a container, you can
use the `--network none` flag when starting the container. Within the container,
only the loopback device is created.
@y
If you want to completely isolate the networking stack of a container, you can
use the `--network none` flag when starting the container. Within the container,
only the loopback device is created.
@z

@x
The following example shows the output of `ip link show` in an `alpine`
container using the `none` network driver.
@y
The following example shows the output of `ip link show` in an `alpine`
container using the `none` network driver.
@z

@x
```console
$ docker run --rm --network none alpine:latest ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```
@y
```console
$ docker run --rm --network none alpine:latest ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```
@z

@x
No IPv6 loopback address is configured for containers using the `none` driver.
@y
No IPv6 loopback address is configured for containers using the `none` driver.
@z

@x
```console
$ docker run --rm --network none --name no-net-alpine alpine:latest ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
```
@y
```console
$ docker run --rm --network none --name no-net-alpine alpine:latest ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Go through the [host networking tutorial](/engine/network/tutorials/host.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- Go through the [host networking tutorial](engine/network/tutorials/host.md)
- Learn about [networking from the container's point of view](../_index.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@z
