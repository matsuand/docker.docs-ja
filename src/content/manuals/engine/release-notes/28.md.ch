%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Engine version 28 release notes
linkTitle: Engine v28
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@y
title: Docker Engine version 28 release notes
linkTitle: Engine v28
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 28.
@y
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 28.
@z

@x
For more information about:
@y
For more information about:
@z

@x
- Deprecated and removed features, see [Deprecated Engine Features](../deprecated.md).
- Changes to the Engine API, see [Engine API version history](/reference/api/engine/version-history.md).
@y
- Deprecated and removed features, see [Deprecated Engine Features](../deprecated.md).
- Changes to the Engine API, see [Engine API version history](reference/api/engine/version-history.md).
@z

@x
## 28.0.0
@y
## 28.0.0
@z

@x
{{< release-date date="2025-02-19" >}}
@y
{{< release-date date="2025-02-19" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 28.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.0.0)
- [moby/moby, 28.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A28.0.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v28.0.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v28.0.0/docs/api/version-history.md).
@y
- [docker/cli, 28.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.0.0)
- [moby/moby, 28.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A28.0.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v28.0.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v28.0.0/docs/api/version-history.md).
@z

@x
### New
@y
### New
@z

@x
- Add ability to mount an image inside a container via `--mount type=image`. [moby/moby#48798](https://github.com/moby/moby/pull/48798)
  * You can also specify `--mount type=image,image-subpath=[subpath],...` option to mount a specific path from the image. [docker/cli#5755](https://github.com/docker/cli/pull/5755)
- `docker images --tree` now shows metadata badges [docker/cli#5744](https://github.com/docker/cli/pull/5744)
- `docker load`, `docker save`, and `docker history` now support a `--platform` flag allowing you to choose a specific platform for single-platform operations on multi-platform images. [docker/cli#5331](https://github.com/docker/cli/pull/5331)
- Add `OOMScoreAdj` to `docker service create` and `docker stack`. [docker/cli#5145](https://github.com/docker/cli/pull/5145)
- `docker buildx prune` now supports `reserved-space`, `max-used-space`, `min-free-space` and `keep-bytes` filters. [moby/moby#48720](https://github.com/moby/moby/pull/48720)
- Windows: Add support for running containerd as a child process of the daemon, instead of using a system-installed containerd. [moby/moby#47955](https://github.com/moby/moby/pull/47955)
@y
- Add ability to mount an image inside a container via `--mount type=image`. [moby/moby#48798](https://github.com/moby/moby/pull/48798)
  * You can also specify `--mount type=image,image-subpath=[subpath],...` option to mount a specific path from the image. [docker/cli#5755](https://github.com/docker/cli/pull/5755)
- `docker images --tree` now shows metadata badges [docker/cli#5744](https://github.com/docker/cli/pull/5744)
- `docker load`, `docker save`, and `docker history` now support a `--platform` flag allowing you to choose a specific platform for single-platform operations on multi-platform images. [docker/cli#5331](https://github.com/docker/cli/pull/5331)
- Add `OOMScoreAdj` to `docker service create` and `docker stack`. [docker/cli#5145](https://github.com/docker/cli/pull/5145)
- `docker buildx prune` now supports `reserved-space`, `max-used-space`, `min-free-space` and `keep-bytes` filters. [moby/moby#48720](https://github.com/moby/moby/pull/48720)
- Windows: Add support for running containerd as a child process of the daemon, instead of using a system-installed containerd. [moby/moby#47955](https://github.com/moby/moby/pull/47955)
@z

@x
### Networking
@y
### Networking
@z

@x
- The `docker-proxy` binary has been updated, older versions will not work with the updated `dockerd`. [moby/moby#48132](https://github.com/moby/moby/pull/48132)
    - Close a window in which the userland proxy (`docker-proxy`) could accept TCP connections, that would then fail after `iptables` NAT rules were set up.
    - The executable `rootlesskit-docker-proxy` is no longer used, it has been removed from the build and distribution.
- DNS nameservers read from the host's `/etc/resolv.conf` are now always accessed from the host's network namespace. [moby/moby#48290](https://github.com/moby/moby/pull/48290)
    - When the host's `/etc/resolv.conf` contains no nameservers and there are no `--dns` overrides, Google's DNS servers are no longer used, apart from by the default bridge network and in build containers.
- Container interfaces in bridge and macvlan networks now use randomly generated MAC addresses. [moby/moby#48808](https://github.com/moby/moby/pull/48808)
    - Gratuitous ARP / Neighbour Advertisement messages will be sent when the interfaces are started so that, when IP addresses are reused, they're associated with the newly generated MAC address.
    - IPv6 addresses in the default bridge network are now IPAM-assigned, rather than being derived from the MAC address.
- The deprecated OCI `prestart` hook is now only used by build containers. For other containers, network interfaces are added to the network namespace after task creation is complete, before the container task is started. [moby/moby#47406](https://github.com/moby/moby/pull/47406)
- Add a new `gw-priority` option to `docker run`, `docker container create`, and `docker network connect`. This option will be used by the Engine to determine which network provides the default gateway for a container. On `docker run`, this option is only available through the extended `--network` syntax. [docker/cli#5664](https://github.com/docker/cli/pull/5664)
- Add a new netlabel `com.docker.network.endpoint.ifname` to customize the interface name used when connecting a container to a network. It's supported by all built-in network drivers on Linux. [moby/moby#49155](https://github.com/moby/moby/pull/49155)
  - When a container is created with multiple networks specified, there's no guarantee on the order networks will be connected to the container. So, if a custom interface name uses the same prefix as the auto-generated names, for example `eth`, the container might fail to start.
  - The recommended practice is to use a different prefix, for example `en0`, or a numerical suffix high enough to never collide, for example `eth100`.
  - This label can be specified on `docker network connect` via the `--driver-opt` flag, for example `docker network connect --driver-opt=com.docker.network.endpoint.ifname=foobar …`.
  - Or via the long-form `--network` flag on `docker run`, for example `docker run --network=name=bridge,driver-opt=com.docker.network.endpoint.ifname=foobar …`
- If a custom network driver reports capability `GwAllocChecker` then, before a network is created, it will get a `GwAllocCheckerRequest` with the network's options. The custom driver may then reply that no gateway IP address should be allocated. [moby/moby#49372](https://github.com/moby/moby/pull/49372)
@y
- The `docker-proxy` binary has been updated, older versions will not work with the updated `dockerd`. [moby/moby#48132](https://github.com/moby/moby/pull/48132)
    - Close a window in which the userland proxy (`docker-proxy`) could accept TCP connections, that would then fail after `iptables` NAT rules were set up.
    - The executable `rootlesskit-docker-proxy` is no longer used, it has been removed from the build and distribution.
- DNS nameservers read from the host's `/etc/resolv.conf` are now always accessed from the host's network namespace. [moby/moby#48290](https://github.com/moby/moby/pull/48290)
    - When the host's `/etc/resolv.conf` contains no nameservers and there are no `--dns` overrides, Google's DNS servers are no longer used, apart from by the default bridge network and in build containers.
- Container interfaces in bridge and macvlan networks now use randomly generated MAC addresses. [moby/moby#48808](https://github.com/moby/moby/pull/48808)
    - Gratuitous ARP / Neighbour Advertisement messages will be sent when the interfaces are started so that, when IP addresses are reused, they're associated with the newly generated MAC address.
    - IPv6 addresses in the default bridge network are now IPAM-assigned, rather than being derived from the MAC address.
- The deprecated OCI `prestart` hook is now only used by build containers. For other containers, network interfaces are added to the network namespace after task creation is complete, before the container task is started. [moby/moby#47406](https://github.com/moby/moby/pull/47406)
- Add a new `gw-priority` option to `docker run`, `docker container create`, and `docker network connect`. This option will be used by the Engine to determine which network provides the default gateway for a container. On `docker run`, this option is only available through the extended `--network` syntax. [docker/cli#5664](https://github.com/docker/cli/pull/5664)
- Add a new netlabel `com.docker.network.endpoint.ifname` to customize the interface name used when connecting a container to a network. It's supported by all built-in network drivers on Linux. [moby/moby#49155](https://github.com/moby/moby/pull/49155)
  - When a container is created with multiple networks specified, there's no guarantee on the order networks will be connected to the container. So, if a custom interface name uses the same prefix as the auto-generated names, for example `eth`, the container might fail to start.
  - The recommended practice is to use a different prefix, for example `en0`, or a numerical suffix high enough to never collide, for example `eth100`.
  - This label can be specified on `docker network connect` via the `--driver-opt` flag, for example `docker network connect --driver-opt=com.docker.network.endpoint.ifname=foobar …`.
  - Or via the long-form `--network` flag on `docker run`, for example `docker run --network=name=bridge,driver-opt=com.docker.network.endpoint.ifname=foobar …`
- If a custom network driver reports capability `GwAllocChecker` then, before a network is created, it will get a `GwAllocCheckerRequest` with the network's options. The custom driver may then reply that no gateway IP address should be allocated. [moby/moby#49372](https://github.com/moby/moby/pull/49372)
@z

@x
#### Port publishing in bridge networks
@y
#### Port publishing in bridge networks
@z

@x
- `dockerd` now requires `ipset` support in the Linux kernel. [moby/moby#48596](https://github.com/moby/moby/pull/48596)
  - The `iptables` and `ip6tables` rules used to implement port publishing and network isolation have been extensively modified. This enables some of the following functional changes, and is a first step in refactoring to enable native `nftables` support in a future release. [moby/moby#48815](https://github.com/moby/moby/issues/48815)
  - If it becomes necessary to downgrade to an earlier version of the daemon, some manual cleanup of the new rules will be necessary. The simplest and surest approach is to reboot the host, or use `iptables -F` and `ip6tables -F` to flush all existing `iptables` rules from the `filter` table before starting the older version of the daemon. When that is not possible, run the following commands as root:
    - `iptables -D FORWARD -m set --match-set docker-ext-bridges-v4 dst -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT; ip6tables -D FORWARD -m set --match-set docker-ext-bridges-v6 dst -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT`
    - `iptables -D FORWARD -m set --match-set docker-ext-bridges-v4 dst -j DOCKER; ip6tables -D FORWARD -m set --match-set docker-ext-bridges-v6 dst -j DOCKER`
    - If you were previously running with the iptables filter-FORWARD policy set to `ACCEPT` and need to restore access to unpublished ports, also delete per-bridge-network rules from the `DOCKER` chains. For example, `iptables -D DOCKER ! -i docker0 -o docker0 -j DROP`.
- Fix a security issue that was allowing remote hosts to connect directly to a container on its published ports. [moby/moby#49325](https://github.com/moby/moby/pull/49325)
- Fix a security issue that was allowing neighbor hosts to connect to ports mapped on a loopback address. [moby/moby#49325](https://github.com/moby/moby/pull/49325)
- Fix an issue that prevented port publishing to link-local addresses. [moby/moby#48570](https://github.com/moby/moby/pull/48570)
- UDP ports published by a container are now reliably accessible by containers on other networks, via the host's public IP address. [moby/moby#48571](https://github.com/moby/moby/pull/48571)
- Docker will now only set the `ip6tables` policy for the `FORWARD` chain in the `filter` table to `DROP` if it enables IP forwarding on the host itself (sysctls `net.ipv6.conf.all.forwarding` and `net.ipv6.conf.default.forwarding`). This is now aligned with existing IPv4 behaviour. [moby/moby#48594](https://github.com/moby/moby/pull/48594)
    - If IPv6 forwarding is enabled on your host, but you were depending on Docker to set the ip6tables filter-FORWARD policy to `DROP`, you may need to update your host's configuration to make sure it is secure.
- Direct routed access to container ports that are not exposed using `p`/`-publish` is now blocked in the `DOCKER` iptables chain. [moby/moby#48724](https://github.com/moby/moby/pull/48724)
    - If the default iptables filter-FORWARD policy was previously left at `ACCEPT` on your host, and direct routed access to a container's unpublished ports from a remote host is still required, options are:
      - Publish the ports you need.
      - Use the new `gateway_mode_ipv[46]=nat-unprotected`, described below.
    - Container ports published to host addresses will continue to be accessible via those host addresses, using NAT or the userland proxy.
    - Unpublished container ports continue to be directly accessible from the Docker host via the container's IP address.
- Networks created with `gateway_mode_ipv[46]=routed` are now accessible from other bridge networks running on the same Docker host, as well as from outside the host. [moby/moby#48596](https://github.com/moby/moby/pull/48596)
- Bridge driver options `com.docker.network.bridge.gateway_mode_ipv4` and `com.docker.network.bridge.gateway_mode_ipv6` now accept mode `nat-unprotected`. [moby/moby#48597](https://github.com/moby/moby/pull/48597)
    - `nat-unprotected` is similar to the default `nat` mode, but no per port/protocol rules are set up. This means any port on a container can be accessed by direct-routing from a remote host.
- Bridge driver options `com.docker.network.bridge.gateway_mode_ipv4` and `com.docker.network.bridge.gateway_mode_ipv6` now accept mode `isolated`, when the network is also `internal`. [moby/moby#49262](https://github.com/moby/moby/pull/49262)
  - An address is normally assigned to the bridge device in an `internal` network. So, processes on the Docker host can access the network, and containers in the network can access host services listening on that bridge address (including services listening on "any" host address, `0.0.0.0` or `::`).
  - An `internal` bridge network created with gateway mode `isolated` does not have an address on the Docker host.
- When a port mapping includes a host IP address or port number that cannot be used because NAT from the host is disabled using `--gateway_mode_ipv[46]`, container creation will no longer fail. The unused fields may be needed if the gateway endpoint changes when networks are connected or disconnected. A message about the unused fields will be logged. [moby/moby#48575](https://github.com/moby/moby/pull/48575)
- Do not create iptables nat-POSTROUTING masquerade rules for a container's own published ports, when the userland proxy is enabled. [moby/moby#48854](https://github.com/moby/moby/pull/48854)
@y
- `dockerd` now requires `ipset` support in the Linux kernel. [moby/moby#48596](https://github.com/moby/moby/pull/48596)
  - The `iptables` and `ip6tables` rules used to implement port publishing and network isolation have been extensively modified. This enables some of the following functional changes, and is a first step in refactoring to enable native `nftables` support in a future release. [moby/moby#48815](https://github.com/moby/moby/issues/48815)
  - If it becomes necessary to downgrade to an earlier version of the daemon, some manual cleanup of the new rules will be necessary. The simplest and surest approach is to reboot the host, or use `iptables -F` and `ip6tables -F` to flush all existing `iptables` rules from the `filter` table before starting the older version of the daemon. When that is not possible, run the following commands as root:
    - `iptables -D FORWARD -m set --match-set docker-ext-bridges-v4 dst -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT; ip6tables -D FORWARD -m set --match-set docker-ext-bridges-v6 dst -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT`
    - `iptables -D FORWARD -m set --match-set docker-ext-bridges-v4 dst -j DOCKER; ip6tables -D FORWARD -m set --match-set docker-ext-bridges-v6 dst -j DOCKER`
    - If you were previously running with the iptables filter-FORWARD policy set to `ACCEPT` and need to restore access to unpublished ports, also delete per-bridge-network rules from the `DOCKER` chains. For example, `iptables -D DOCKER ! -i docker0 -o docker0 -j DROP`.
- Fix a security issue that was allowing remote hosts to connect directly to a container on its published ports. [moby/moby#49325](https://github.com/moby/moby/pull/49325)
- Fix a security issue that was allowing neighbor hosts to connect to ports mapped on a loopback address. [moby/moby#49325](https://github.com/moby/moby/pull/49325)
- Fix an issue that prevented port publishing to link-local addresses. [moby/moby#48570](https://github.com/moby/moby/pull/48570)
- UDP ports published by a container are now reliably accessible by containers on other networks, via the host's public IP address. [moby/moby#48571](https://github.com/moby/moby/pull/48571)
- Docker will now only set the `ip6tables` policy for the `FORWARD` chain in the `filter` table to `DROP` if it enables IP forwarding on the host itself (sysctls `net.ipv6.conf.all.forwarding` and `net.ipv6.conf.default.forwarding`). This is now aligned with existing IPv4 behaviour. [moby/moby#48594](https://github.com/moby/moby/pull/48594)
    - If IPv6 forwarding is enabled on your host, but you were depending on Docker to set the ip6tables filter-FORWARD policy to `DROP`, you may need to update your host's configuration to make sure it is secure.
- Direct routed access to container ports that are not exposed using `p`/`-publish` is now blocked in the `DOCKER` iptables chain. [moby/moby#48724](https://github.com/moby/moby/pull/48724)
    - If the default iptables filter-FORWARD policy was previously left at `ACCEPT` on your host, and direct routed access to a container's unpublished ports from a remote host is still required, options are:
      - Publish the ports you need.
      - Use the new `gateway_mode_ipv[46]=nat-unprotected`, described below.
    - Container ports published to host addresses will continue to be accessible via those host addresses, using NAT or the userland proxy.
    - Unpublished container ports continue to be directly accessible from the Docker host via the container's IP address.
- Networks created with `gateway_mode_ipv[46]=routed` are now accessible from other bridge networks running on the same Docker host, as well as from outside the host. [moby/moby#48596](https://github.com/moby/moby/pull/48596)
- Bridge driver options `com.docker.network.bridge.gateway_mode_ipv4` and `com.docker.network.bridge.gateway_mode_ipv6` now accept mode `nat-unprotected`. [moby/moby#48597](https://github.com/moby/moby/pull/48597)
    - `nat-unprotected` is similar to the default `nat` mode, but no per port/protocol rules are set up. This means any port on a container can be accessed by direct-routing from a remote host.
- Bridge driver options `com.docker.network.bridge.gateway_mode_ipv4` and `com.docker.network.bridge.gateway_mode_ipv6` now accept mode `isolated`, when the network is also `internal`. [moby/moby#49262](https://github.com/moby/moby/pull/49262)
  - An address is normally assigned to the bridge device in an `internal` network. So, processes on the Docker host can access the network, and containers in the network can access host services listening on that bridge address (including services listening on "any" host address, `0.0.0.0` or `::`).
  - An `internal` bridge network created with gateway mode `isolated` does not have an address on the Docker host.
- When a port mapping includes a host IP address or port number that cannot be used because NAT from the host is disabled using `--gateway_mode_ipv[46]`, container creation will no longer fail. The unused fields may be needed if the gateway endpoint changes when networks are connected or disconnected. A message about the unused fields will be logged. [moby/moby#48575](https://github.com/moby/moby/pull/48575)
- Do not create iptables nat-POSTROUTING masquerade rules for a container's own published ports, when the userland proxy is enabled. [moby/moby#48854](https://github.com/moby/moby/pull/48854)
@z

@x
#### IPv6
@y
#### IPv6
@z

@x
- Add `docker network create` option `--ipv4`. To disable IPv4 address assignment for a network, use `docker network create --ipv4=false [...]`. [docker/cli#5599](https://github.com/docker/cli/pull/5599)
- Daemon option `--ipv6` (`"ipv6": true` in `daemon.json`) can now be used without `fixed-cidr-v6`. [moby/moby#48319](https://github.com/moby/moby/pull/48319)
- IPAM now handles subnets bigger than "/64". [moby/moby#49223](https://github.com/moby/moby/pull/49223)
- Duplicate address detection (DAD) is now disabled for addresses assigned to the bridges belonging to bridge networks. [moby/moby#48609](https://github.com/moby/moby/pull/48609)
- Modifications to `host-gateway`, for compatibility with IPv6-only networks. [moby/moby#48807](https://github.com/moby/moby/pull/48807)
  - When special value `host-gateway` is used in an `--add-host` option in place of an address, it's replaced by an address on the Docker host to make it possible to refer to the host by name. The address used belongs to the default bridge (normally `docker0`). Until now it's always been an IPv4 address, because all containers on bridge networks had IPv4 addresses.
  - Now, if IPv6 is enabled on the default bridge network, `/etc/hosts` entries will be created for IPv4 and IPv6 addresses. So, a container that's only connected to IPv6-only networks can access the host by name.
  - The `--host-gateway-ip` option overrides the address used to replace `host-gateway`. Two of these options are now allowed on the command line, for one IPv4 gateway and one IPv6.
  - In the `daemon.json` file, to provide two addresses, use `"host-gateway-ips"`. For example, `"host-gateway-ips": ["192.0.2.1", "2001:db8::1111"]`.
@y
- Add `docker network create` option `--ipv4`. To disable IPv4 address assignment for a network, use `docker network create --ipv4=false [...]`. [docker/cli#5599](https://github.com/docker/cli/pull/5599)
- Daemon option `--ipv6` (`"ipv6": true` in `daemon.json`) can now be used without `fixed-cidr-v6`. [moby/moby#48319](https://github.com/moby/moby/pull/48319)
- IPAM now handles subnets bigger than "/64". [moby/moby#49223](https://github.com/moby/moby/pull/49223)
- Duplicate address detection (DAD) is now disabled for addresses assigned to the bridges belonging to bridge networks. [moby/moby#48609](https://github.com/moby/moby/pull/48609)
- Modifications to `host-gateway`, for compatibility with IPv6-only networks. [moby/moby#48807](https://github.com/moby/moby/pull/48807)
  - When special value `host-gateway` is used in an `--add-host` option in place of an address, it's replaced by an address on the Docker host to make it possible to refer to the host by name. The address used belongs to the default bridge (normally `docker0`). Until now it's always been an IPv4 address, because all containers on bridge networks had IPv4 addresses.
  - Now, if IPv6 is enabled on the default bridge network, `/etc/hosts` entries will be created for IPv4 and IPv6 addresses. So, a container that's only connected to IPv6-only networks can access the host by name.
  - The `--host-gateway-ip` option overrides the address used to replace `host-gateway`. Two of these options are now allowed on the command line, for one IPv4 gateway and one IPv6.
  - In the `daemon.json` file, to provide two addresses, use `"host-gateway-ips"`. For example, `"host-gateway-ips": ["192.0.2.1", "2001:db8::1111"]`.
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Add IPv6 loopback address as an insecure registry by default. [moby/moby#48540](https://github.com/moby/moby/pull/48540)
- Add support for Cobra-generated completion scripts for `dockerd`. [moby/moby#49339](https://github.com/moby/moby/pull/49339)
- Fix DNS queries failing when containers are launched via `systemd` auto-start on boot [moby/moby#48812](https://github.com/moby/moby/pull/48812)
- Fix Docker Swarm mode ignoring `volume.subpath` [docker/cli#5833](https://github.com/docker/cli/pull/5833)
- Fix `docker export` continuing the export after the operation is canceled. [moby/moby#49265](https://github.com/moby/moby/pull/49265)
- Fix `docker export` not releasing the container's writable layer after a failure. [moby/moby#48517](https://github.com/moby/moby/pull/48517)
- Fix `docker images --tree` unnecessary truncating long image names when multiple names are available [docker/cli#5757](https://github.com/docker/cli/pull/5757)
- Fix a bug where a container with a name matching another container's ID is not restored on daemon startup. [moby/moby#48669](https://github.com/moby/moby/pull/48669)
- Fix an issue preventing some IPv6 addresses shown by `docker ps` to be properly bracketed [docker/cli#5468](https://github.com/docker/cli/pull/5468)
- Fix bug preventing image pulls from being cancelled during `docker run`. [docker/cli#5645](https://github.com/docker/cli/pull/5645)
- Fix error-handling when running the daemon as a Windows service to prevent unclean exits. [moby/moby#48518](https://github.com/moby/moby/pull/48518)
- Fix issue causing output of `docker run` to be inconsistent when using `--attach stdout` or `--attach stderr` versus `stdin`.  `docker run --attach stdin` now exits if the container exits. [docker/cli#5662](https://github.com/docker/cli/pull/5662)
- Fix rootless Docker setup with `subid` backed by NSS modules. [moby/moby#49036](https://github.com/moby/moby/pull/49036)
- Generated completion scripts from the CLI now show descriptions next to each command/flag suggestion. [docker/cli#5756](https://github.com/docker/cli/pull/5756)
- IPv6 addresses shown by `docker ps` in port bindings are now bracketed [docker/cli#5363](https://github.com/docker/cli/pull/5363)
- Implement the ports validation method for Compose [docker/cli#5524](https://github.com/docker/cli/pull/5524)
- Improve error-output for invalid flags on the command line. [docker/cli#5233](https://github.com/docker/cli/pull/5233)
- Improve errors when failing to start a container using anther container's network namespace. [moby/moby#49367](https://github.com/moby/moby/pull/49367)
- Improve handling of invalid API errors that could result in an empty error message being shown. [moby/moby#49373](https://github.com/moby/moby/pull/49373)
- Improve output and consistency for unknown (sub)commands and invalid arguments [docker/cli#5234](https://github.com/docker/cli/pull/5234)
- Improve validation of `exec-opts` in daemon configuration. [moby/moby#48979](https://github.com/moby/moby/pull/48979)
- Update the handling of the `--gpus=0` flag to be consistent with the NVIDIA Container Runtime. [moby/moby#48482](https://github.com/moby/moby/pull/48482)
- `client.ContainerCreate` now normalizes `CapAdd` and `CapDrop` fields in `HostConfig` to their canonical form. [moby/moby#48551](https://github.com/moby/moby/pull/48551)
- `docker image save` now produces stable timestamps. [moby/moby#48611](https://github.com/moby/moby/pull/48611)
- `docker inspect` now lets you inspect Swarm configs [docker/cli#5573](https://github.com/docker/cli/pull/5573)
- containerd image store: Add support for `Extracting` layer status in `docker pull`. [moby/moby#49064](https://github.com/moby/moby/pull/49064)
- containerd image store: Fix `commit`, `import`, and `build` not preserving a replaced image as a dangling image. [moby/moby#48316](https://github.com/moby/moby/pull/48316)
- containerd image store: Make `docker load --platform` return an error when the requested platform isn't loaded. [moby/moby#48718](https://github.com/moby/moby/pull/48718)
- Fix validation of `--link` option. [docker/cli#5739](https://github.com/docker/cli/pull/5739)
- Add validation of network-diagnostic-port daemon configuration option. [moby/moby#49305](https://github.com/moby/moby/pull/49305)
- Unless explicitly configured, an IP address is no longer reserved for a gateway in cases where it is not required. Namely, “internal” bridge networks with option `com.docker.network.bridge.inhibit_ipv4`, `ipvlan` or `macvlan` networks with no parent interface, and L3 IPvlan modes. [moby/moby#49261](https://github.com/moby/moby/pull/49261)
- If a custom network driver reports capability `GwAllocChecker` then, before a network is created, it will get a `GwAllocCheckerRequest` with the network's options. The custom driver may then reply that no gateway IP address should be allocated. [moby/moby#49372](https://github.com/moby/moby/pull/49372)
- Fixed an issue that meant a container could not be attached to an L3 IPvlan at the same time as other network types. [moby/moby#49130](https://github.com/moby/moby/pull/49130)
- Remove the correct `/etc/hosts` entries when disconnecting a container from a network. [moby/moby#48857](https://github.com/moby/moby/pull/48857)
- Fix duplicate network disconnect events. [moby/moby#48800](https://github.com/moby/moby/pull/48800)
- Resolve issues related to changing `fixed-cidr` for `docker0`, and inferring configuration from a user-managed default bridge (`--bridge`). [moby/moby#48319](https://github.com/moby/moby/pull/48319)
- Remove feature flag `windows-dns-proxy`, introduced in release 26.1.0 to control forwarding to external DNS resolvers from Windows containers, to make `nslookup` work. It was enabled by default in release 27.0.0. [moby/moby#48738](https://github.com/moby/moby/pull/48738)
- Remove an `iptables` mangle rule for checksumming SCTP. The rule can be re-enabled by setting `DOCKER_IPTABLES_SCTP_CHECKSUM=1` in the daemon's environment. This override will be removed in a future release. [moby/moby#48149](https://github.com/moby/moby/pull/48149)
- Faster connection to bridge networks, in most cases. [moby/moby#49302](https://github.com/moby/moby/pull/49302)
@y
- Add IPv6 loopback address as an insecure registry by default. [moby/moby#48540](https://github.com/moby/moby/pull/48540)
- Add support for Cobra-generated completion scripts for `dockerd`. [moby/moby#49339](https://github.com/moby/moby/pull/49339)
- Fix DNS queries failing when containers are launched via `systemd` auto-start on boot [moby/moby#48812](https://github.com/moby/moby/pull/48812)
- Fix Docker Swarm mode ignoring `volume.subpath` [docker/cli#5833](https://github.com/docker/cli/pull/5833)
- Fix `docker export` continuing the export after the operation is canceled. [moby/moby#49265](https://github.com/moby/moby/pull/49265)
- Fix `docker export` not releasing the container's writable layer after a failure. [moby/moby#48517](https://github.com/moby/moby/pull/48517)
- Fix `docker images --tree` unnecessary truncating long image names when multiple names are available [docker/cli#5757](https://github.com/docker/cli/pull/5757)
- Fix a bug where a container with a name matching another container's ID is not restored on daemon startup. [moby/moby#48669](https://github.com/moby/moby/pull/48669)
- Fix an issue preventing some IPv6 addresses shown by `docker ps` to be properly bracketed [docker/cli#5468](https://github.com/docker/cli/pull/5468)
- Fix bug preventing image pulls from being cancelled during `docker run`. [docker/cli#5645](https://github.com/docker/cli/pull/5645)
- Fix error-handling when running the daemon as a Windows service to prevent unclean exits. [moby/moby#48518](https://github.com/moby/moby/pull/48518)
- Fix issue causing output of `docker run` to be inconsistent when using `--attach stdout` or `--attach stderr` versus `stdin`.  `docker run --attach stdin` now exits if the container exits. [docker/cli#5662](https://github.com/docker/cli/pull/5662)
- Fix rootless Docker setup with `subid` backed by NSS modules. [moby/moby#49036](https://github.com/moby/moby/pull/49036)
- Generated completion scripts from the CLI now show descriptions next to each command/flag suggestion. [docker/cli#5756](https://github.com/docker/cli/pull/5756)
- IPv6 addresses shown by `docker ps` in port bindings are now bracketed [docker/cli#5363](https://github.com/docker/cli/pull/5363)
- Implement the ports validation method for Compose [docker/cli#5524](https://github.com/docker/cli/pull/5524)
- Improve error-output for invalid flags on the command line. [docker/cli#5233](https://github.com/docker/cli/pull/5233)
- Improve errors when failing to start a container using anther container's network namespace. [moby/moby#49367](https://github.com/moby/moby/pull/49367)
- Improve handling of invalid API errors that could result in an empty error message being shown. [moby/moby#49373](https://github.com/moby/moby/pull/49373)
- Improve output and consistency for unknown (sub)commands and invalid arguments [docker/cli#5234](https://github.com/docker/cli/pull/5234)
- Improve validation of `exec-opts` in daemon configuration. [moby/moby#48979](https://github.com/moby/moby/pull/48979)
- Update the handling of the `--gpus=0` flag to be consistent with the NVIDIA Container Runtime. [moby/moby#48482](https://github.com/moby/moby/pull/48482)
- `client.ContainerCreate` now normalizes `CapAdd` and `CapDrop` fields in `HostConfig` to their canonical form. [moby/moby#48551](https://github.com/moby/moby/pull/48551)
- `docker image save` now produces stable timestamps. [moby/moby#48611](https://github.com/moby/moby/pull/48611)
- `docker inspect` now lets you inspect Swarm configs [docker/cli#5573](https://github.com/docker/cli/pull/5573)
- containerd image store: Add support for `Extracting` layer status in `docker pull`. [moby/moby#49064](https://github.com/moby/moby/pull/49064)
- containerd image store: Fix `commit`, `import`, and `build` not preserving a replaced image as a dangling image. [moby/moby#48316](https://github.com/moby/moby/pull/48316)
- containerd image store: Make `docker load --platform` return an error when the requested platform isn't loaded. [moby/moby#48718](https://github.com/moby/moby/pull/48718)
- Fix validation of `--link` option. [docker/cli#5739](https://github.com/docker/cli/pull/5739)
- Add validation of network-diagnostic-port daemon configuration option. [moby/moby#49305](https://github.com/moby/moby/pull/49305)
- Unless explicitly configured, an IP address is no longer reserved for a gateway in cases where it is not required. Namely, “internal” bridge networks with option `com.docker.network.bridge.inhibit_ipv4`, `ipvlan` or `macvlan` networks with no parent interface, and L3 IPvlan modes. [moby/moby#49261](https://github.com/moby/moby/pull/49261)
- If a custom network driver reports capability `GwAllocChecker` then, before a network is created, it will get a `GwAllocCheckerRequest` with the network's options. The custom driver may then reply that no gateway IP address should be allocated. [moby/moby#49372](https://github.com/moby/moby/pull/49372)
- Fixed an issue that meant a container could not be attached to an L3 IPvlan at the same time as other network types. [moby/moby#49130](https://github.com/moby/moby/pull/49130)
- Remove the correct `/etc/hosts` entries when disconnecting a container from a network. [moby/moby#48857](https://github.com/moby/moby/pull/48857)
- Fix duplicate network disconnect events. [moby/moby#48800](https://github.com/moby/moby/pull/48800)
- Resolve issues related to changing `fixed-cidr` for `docker0`, and inferring configuration from a user-managed default bridge (`--bridge`). [moby/moby#48319](https://github.com/moby/moby/pull/48319)
- Remove feature flag `windows-dns-proxy`, introduced in release 26.1.0 to control forwarding to external DNS resolvers from Windows containers, to make `nslookup` work. It was enabled by default in release 27.0.0. [moby/moby#48738](https://github.com/moby/moby/pull/48738)
- Remove an `iptables` mangle rule for checksumming SCTP. The rule can be re-enabled by setting `DOCKER_IPTABLES_SCTP_CHECKSUM=1` in the daemon's environment. This override will be removed in a future release. [moby/moby#48149](https://github.com/moby/moby/pull/48149)
- Faster connection to bridge networks, in most cases. [moby/moby#49302](https://github.com/moby/moby/pull/49302)
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Update Go runtime to [1.23.6](https://go.dev/doc/devel/release#go1.23.6). [docker/cli#5795](https://github.com/docker/cli/pull/5795), [moby/moby#49393](https://github.com/moby/moby/pull/49393), [docker/docker-ce-packaging#1161](https://github.com/docker/docker-ce-packaging/pull/1161)
- Update `runc` to [v1.2.5](https://github.com/opencontainers/runc/releases/tag/v1.2.5) (static binaries only). [moby/moby#49464](https://github.com/moby/moby/pull/49464)
- Update containerd to [v1.7.25](https://github.com/containerd/containerd/releases/tag/v1.7.25). [moby/moby#49252](https://github.com/moby/moby/pull/49252)
- Update BuildKit to [v0.20.0](https://github.com/moby/buildkit/releases/tag/v0.20.0). [moby/moby#49495](https://github.com/moby/moby/pull/49495)
- Update Buildx to [v0.21.0](https://github.com/docker/buildx/releases/tag/v0.21.0). [docker/docker-ce-packaging#1166](https://github.com/docker/docker-ce-packaging/pull/1166)
- Update Compose to [v2.32.4](https://github.com/docker/compose/releases/tag/v2.32.3). [docker/docker-ce-packaging#1143](https://github.com/docker/docker-ce-packaging/pull/1143)
- The canonical source for the `dockerd(8)` man page has been moved back to the `moby/moby` repository itself. [moby/moby#48298](https://github.com/moby/moby/pull/48298)
@y
- Update Go runtime to [1.23.6](https://go.dev/doc/devel/release#go1.23.6). [docker/cli#5795](https://github.com/docker/cli/pull/5795), [moby/moby#49393](https://github.com/moby/moby/pull/49393), [docker/docker-ce-packaging#1161](https://github.com/docker/docker-ce-packaging/pull/1161)
- Update `runc` to [v1.2.5](https://github.com/opencontainers/runc/releases/tag/v1.2.5) (static binaries only). [moby/moby#49464](https://github.com/moby/moby/pull/49464)
- Update containerd to [v1.7.25](https://github.com/containerd/containerd/releases/tag/v1.7.25). [moby/moby#49252](https://github.com/moby/moby/pull/49252)
- Update BuildKit to [v0.20.0](https://github.com/moby/buildkit/releases/tag/v0.20.0). [moby/moby#49495](https://github.com/moby/moby/pull/49495)
- Update Buildx to [v0.21.0](https://github.com/docker/buildx/releases/tag/v0.21.0). [docker/docker-ce-packaging#1166](https://github.com/docker/docker-ce-packaging/pull/1166)
- Update Compose to [v2.32.4](https://github.com/docker/compose/releases/tag/v2.32.3). [docker/docker-ce-packaging#1143](https://github.com/docker/docker-ce-packaging/pull/1143)
- The canonical source for the `dockerd(8)` man page has been moved back to the `moby/moby` repository itself. [moby/moby#48298](https://github.com/moby/moby/pull/48298)
@z

@x
### Go SDK
@y
### Go SDK
@z

@x
- Improve validation of empty object IDs. The client now returns an "Invalid Parameter" error when trying to use an empty ID or name. This changes the error returned by some "Inspect" functions from a "Not found" error to an "Invalid Parameter". [moby/moby#49381](https://github.com/moby/moby/pull/49381)
- `Client.ImageBuild()` now omits default values from the API request's query string. [moby/moby#48651](https://github.com/moby/moby/pull/48651)
- `api/types/container`: Merge `Stats` and `StatsResponse` [moby/moby#49287](https://github.com/moby/moby/pull/49287)
- `client.WithVersion`: Strip v-prefix when setting API version [moby/moby#49352](https://github.com/moby/moby/pull/49352)
- `client`: Add `WithTraceOptions` allowing to specify custom OTe1 trace options. [moby/moby#49415](https://github.com/moby/moby/pull/49415)
- `client`: Add `HijackDialer` interface. [moby/moby#49388](https://github.com/moby/moby/pull/49388)
- `client`: Add `SwarmManagementAPIClient` interface to describe all API client methods related to Swarm-specific objects. [moby/moby#49388](https://github.com/moby/moby/pull/49388)
- `client`: Add `WithTraceOptions` allowing to specify custom OTel trace options. [moby/moby#49415](https://github.com/moby/moby/pull/49415)
- `client`: `ImageHistory`, `ImageLoad` and `ImageSave` now use variadic functional options [moby/moby#49466](https://github.com/moby/moby/pull/49466)
- `pkg/containerfs`: Move to internal [moby/moby#48097](https://github.com/moby/moby/pull/48097)
- `pkg/reexec`: Can now be used on platforms other than Linux, Windows, macOS and FreeBSD [moby/moby#49118](https://github.com/moby/moby/pull/49118)
- `api/types/container`: introduce `CommitResponse` type. This is currently an alias for `IDResponse`, but may become a distinct type in a future release. [moby/moby#49444](https://github.com/moby/moby/pull/49444)
- `api/types/container`: introduce `ExecCreateResponse` type. This is currently an alias for `IDResponse`, but may become a distinct type in a future release. [moby/moby#49444](https://github.com/moby/moby/pull/49444)
@y
- Improve validation of empty object IDs. The client now returns an "Invalid Parameter" error when trying to use an empty ID or name. This changes the error returned by some "Inspect" functions from a "Not found" error to an "Invalid Parameter". [moby/moby#49381](https://github.com/moby/moby/pull/49381)
- `Client.ImageBuild()` now omits default values from the API request's query string. [moby/moby#48651](https://github.com/moby/moby/pull/48651)
- `api/types/container`: Merge `Stats` and `StatsResponse` [moby/moby#49287](https://github.com/moby/moby/pull/49287)
- `client.WithVersion`: Strip v-prefix when setting API version [moby/moby#49352](https://github.com/moby/moby/pull/49352)
- `client`: Add `WithTraceOptions` allowing to specify custom OTe1 trace options. [moby/moby#49415](https://github.com/moby/moby/pull/49415)
- `client`: Add `HijackDialer` interface. [moby/moby#49388](https://github.com/moby/moby/pull/49388)
- `client`: Add `SwarmManagementAPIClient` interface to describe all API client methods related to Swarm-specific objects. [moby/moby#49388](https://github.com/moby/moby/pull/49388)
- `client`: Add `WithTraceOptions` allowing to specify custom OTel trace options. [moby/moby#49415](https://github.com/moby/moby/pull/49415)
- `client`: `ImageHistory`, `ImageLoad` and `ImageSave` now use variadic functional options [moby/moby#49466](https://github.com/moby/moby/pull/49466)
- `pkg/containerfs`: Move to internal [moby/moby#48097](https://github.com/moby/moby/pull/48097)
- `pkg/reexec`: Can now be used on platforms other than Linux, Windows, macOS and FreeBSD [moby/moby#49118](https://github.com/moby/moby/pull/49118)
- `api/types/container`: introduce `CommitResponse` type. This is currently an alias for `IDResponse`, but may become a distinct type in a future release. [moby/moby#49444](https://github.com/moby/moby/pull/49444)
- `api/types/container`: introduce `ExecCreateResponse` type. This is currently an alias for `IDResponse`, but may become a distinct type in a future release. [moby/moby#49444](https://github.com/moby/moby/pull/49444)
@z

@x
### API
@y
### API
@z

@x
- Update API version to [v1.48](https://docs.docker.com/engine/api/v1.48/) [moby/moby#48476](https://github.com/moby/moby/pull/48476)
- `GET /images/{name}/json` response now returns the `Manifests` field containing information about the sub-manifests contained in the image index. This includes things like platform-specific manifests and build attestations. [moby/moby#48264](https://github.com/moby/moby/pull/48264)
- `POST /containers/create` now supports `Mount` of type `image` for mounting an image inside a container. [moby/moby#48798](https://github.com/moby/moby/pull/48798)
- `GET /images/{name}/history` now supports a `platform` parameter (JSON encoded OCI Platform type) that lets you specify a platform to show the history of. [moby/moby#48295](https://github.com/moby/moby/pull/48295)
- `POST /images/{name}/load` and `GET /images/{name}/get` now supports a `platform` parameter (JSON encoded OCI Platform type) that lets you specify a platform to load/save. Not passing this parameter results in loading/saving the full multi-platform image. [moby/moby#48295](https://github.com/moby/moby/pull/48295)
- Improve errors for invalid width/height on container resize and exec resize [moby/moby#48679](https://github.com/moby/moby/pull/48679)
- The `POST /containers/create` endpoint now includes a warning in the response when setting the container-wide `VolumeDriver` option in combination with volumes defined through `Mounts` because the `VolumeDriver` option has no effect on those volumes. This warning was previously generated by the CLI. [moby/moby#48789](https://github.com/moby/moby/pull/48789)
- containerd image store: `GET /images/json` and `GET /images/{name}/json` responses now includes `Descriptor` field, which contains an OCI descriptor of the image target. The new field is only populated if the daemon provides a multi-platform image store. [moby/moby#48894](https://github.com/moby/moby/pull/48894)
- containerd image store: `GET /containers/{name}/json` now returns an `ImageManifestDescriptor` field containing the OCI descriptor of the platform-specific image manifest of the image that was used to create the container. [moby/moby#48855](https://github.com/moby/moby/pull/48855)
- Add debug endpoints (`GET /debug/vars`, `GET /debug/pprof/`, `GET /debug/pprof/cmdline`, `GET /debug/pprof/profile`, `GET /debug/pprof/symbol`, `GET /debug/pprof/trace`, `GET /debug/pprof/{name}`) are now also accessible through the versioned-API paths (`/v<API-version>/<endpoint>`). [moby/moby#49051](https://github.com/moby/moby/pull/49051)
- Fix API returning a `500` status code instead of `400` for validation errors. [moby/moby#49217](https://github.com/moby/moby/pull/49217)
- Fix status codes for archive endpoints `HEAD /containers/{name:.*}/archive`, `GET /containers/{name:.*}/archive`, `PUT /containers/{name:.*}/archive` returning a `500` status instead of a `400` status. [moby/moby#49219](https://github.com/moby/moby/pull/49219)
- `POST /containers/create` now accepts a `writable-cgroups=true` option in `HostConfig.SecurityOpt` to mount the container's cgroups writable. This provides a more granular approach than `HostConfig.Privileged`. [moby/moby#48828](https://github.com/moby/moby/pull/48828)
- `POST /build/prune` renames `keep-bytes` to `reserved-space` and now supports additional prune parameters `max-used-space` and `min-free-space`. [moby/moby#48720](https://github.com/moby/moby/pull/48720)
- `POST /networks/create` now has an `EnableIPv4` field. Setting it to `false` disables IPv4 IPAM for the network. [moby/moby#48271](https://github.com/moby/moby/pull/48271)
  - `GET /networks/{id}` now returns an `EnableIPv4` field showing whether the network has IPv4 IPAM enabled. [moby/moby#48271](https://github.com/moby/moby/pull/48271)
  - User-defined bridge networks require either IPv4 or IPv6 address assignment to be enabled. IPv4 cannot be disabled for the default bridge network (`docker0`). [moby/moby#48323](https://github.com/moby/moby/pull/48323)
  - `macvlan` and `ipvlan` networks can be created with address assignment disabled for IPv4, IPv6, or both address families. [moby/moby#48299](https://github.com/moby/moby/pull/48299)
  - IPv4 cannot be disabled for Windows or Swarm networks. [moby/moby#48278](https://github.com/moby/moby/pull/48278)
- Add a way to specify which network should provide the default gateway for a container. [moby/moby#48936](https://github.com/moby/moby/pull/48936)
  - `POST /networks/{id}/connect` and `POST /containers/create` now accept a `GwPriority` field in `EndpointsConfig`. This value is used to determine which network endpoint provides the default gateway for the container. The endpoint with the highest priority is selected. If multiple endpoints have the same priority, endpoints are sorted lexicographically by their network name, and the one that sorts first is picked. [moby/moby#48746](https://github.com/moby/moby/pull/48746)
  - `GET /containers/json` now returns a `GwPriority` field in `NetworkSettings` for each network endpoint. The `GwPriority` field is used by the CLI’s new `gw-priority` option for `docker run` and `docker network connect`. [moby/moby#48746](https://github.com/moby/moby/pull/48746)
- Settings for `eth0` in `--sysctl` options are no longer automatically migrated to the network endpoint. [moby/moby#48746](https://github.com/moby/moby/pull/48746)
    - For example, in the Docker CLI, `docker run --network mynet --sysctl net.ipv4.conf.eth0.log_martians=1 ...` is rejected. Instead, you must use `docker run --network name=mynet,driver-opt=com.docker.network.endpoint.sysctls=net.ipv4.conf.IFNAME.log_martians=1 ...`
- `GET /containers/json` now returns an `ImageManifestDescriptor` field matching the same field in `/containers/{name}/json`. This field is only populated if the daemon provides a multi-platform image store. [moby/moby#49407](https://github.com/moby/moby/pull/49407)
@y
- Update API version to [v1.48](https://docs.docker.com/engine/api/v1.48/) [moby/moby#48476](https://github.com/moby/moby/pull/48476)
- `GET /images/{name}/json` response now returns the `Manifests` field containing information about the sub-manifests contained in the image index. This includes things like platform-specific manifests and build attestations. [moby/moby#48264](https://github.com/moby/moby/pull/48264)
- `POST /containers/create` now supports `Mount` of type `image` for mounting an image inside a container. [moby/moby#48798](https://github.com/moby/moby/pull/48798)
- `GET /images/{name}/history` now supports a `platform` parameter (JSON encoded OCI Platform type) that lets you specify a platform to show the history of. [moby/moby#48295](https://github.com/moby/moby/pull/48295)
- `POST /images/{name}/load` and `GET /images/{name}/get` now supports a `platform` parameter (JSON encoded OCI Platform type) that lets you specify a platform to load/save. Not passing this parameter results in loading/saving the full multi-platform image. [moby/moby#48295](https://github.com/moby/moby/pull/48295)
- Improve errors for invalid width/height on container resize and exec resize [moby/moby#48679](https://github.com/moby/moby/pull/48679)
- The `POST /containers/create` endpoint now includes a warning in the response when setting the container-wide `VolumeDriver` option in combination with volumes defined through `Mounts` because the `VolumeDriver` option has no effect on those volumes. This warning was previously generated by the CLI. [moby/moby#48789](https://github.com/moby/moby/pull/48789)
- containerd image store: `GET /images/json` and `GET /images/{name}/json` responses now includes `Descriptor` field, which contains an OCI descriptor of the image target. The new field is only populated if the daemon provides a multi-platform image store. [moby/moby#48894](https://github.com/moby/moby/pull/48894)
- containerd image store: `GET /containers/{name}/json` now returns an `ImageManifestDescriptor` field containing the OCI descriptor of the platform-specific image manifest of the image that was used to create the container. [moby/moby#48855](https://github.com/moby/moby/pull/48855)
- Add debug endpoints (`GET /debug/vars`, `GET /debug/pprof/`, `GET /debug/pprof/cmdline`, `GET /debug/pprof/profile`, `GET /debug/pprof/symbol`, `GET /debug/pprof/trace`, `GET /debug/pprof/{name}`) are now also accessible through the versioned-API paths (`/v<API-version>/<endpoint>`). [moby/moby#49051](https://github.com/moby/moby/pull/49051)
- Fix API returning a `500` status code instead of `400` for validation errors. [moby/moby#49217](https://github.com/moby/moby/pull/49217)
- Fix status codes for archive endpoints `HEAD /containers/{name:.*}/archive`, `GET /containers/{name:.*}/archive`, `PUT /containers/{name:.*}/archive` returning a `500` status instead of a `400` status. [moby/moby#49219](https://github.com/moby/moby/pull/49219)
- `POST /containers/create` now accepts a `writable-cgroups=true` option in `HostConfig.SecurityOpt` to mount the container's cgroups writable. This provides a more granular approach than `HostConfig.Privileged`. [moby/moby#48828](https://github.com/moby/moby/pull/48828)
- `POST /build/prune` renames `keep-bytes` to `reserved-space` and now supports additional prune parameters `max-used-space` and `min-free-space`. [moby/moby#48720](https://github.com/moby/moby/pull/48720)
- `POST /networks/create` now has an `EnableIPv4` field. Setting it to `false` disables IPv4 IPAM for the network. [moby/moby#48271](https://github.com/moby/moby/pull/48271)
  - `GET /networks/{id}` now returns an `EnableIPv4` field showing whether the network has IPv4 IPAM enabled. [moby/moby#48271](https://github.com/moby/moby/pull/48271)
  - User-defined bridge networks require either IPv4 or IPv6 address assignment to be enabled. IPv4 cannot be disabled for the default bridge network (`docker0`). [moby/moby#48323](https://github.com/moby/moby/pull/48323)
  - `macvlan` and `ipvlan` networks can be created with address assignment disabled for IPv4, IPv6, or both address families. [moby/moby#48299](https://github.com/moby/moby/pull/48299)
  - IPv4 cannot be disabled for Windows or Swarm networks. [moby/moby#48278](https://github.com/moby/moby/pull/48278)
- Add a way to specify which network should provide the default gateway for a container. [moby/moby#48936](https://github.com/moby/moby/pull/48936)
  - `POST /networks/{id}/connect` and `POST /containers/create` now accept a `GwPriority` field in `EndpointsConfig`. This value is used to determine which network endpoint provides the default gateway for the container. The endpoint with the highest priority is selected. If multiple endpoints have the same priority, endpoints are sorted lexicographically by their network name, and the one that sorts first is picked. [moby/moby#48746](https://github.com/moby/moby/pull/48746)
  - `GET /containers/json` now returns a `GwPriority` field in `NetworkSettings` for each network endpoint. The `GwPriority` field is used by the CLI’s new `gw-priority` option for `docker run` and `docker network connect`. [moby/moby#48746](https://github.com/moby/moby/pull/48746)
- Settings for `eth0` in `--sysctl` options are no longer automatically migrated to the network endpoint. [moby/moby#48746](https://github.com/moby/moby/pull/48746)
    - For example, in the Docker CLI, `docker run --network mynet --sysctl net.ipv4.conf.eth0.log_martians=1 ...` is rejected. Instead, you must use `docker run --network name=mynet,driver-opt=com.docker.network.endpoint.sysctls=net.ipv4.conf.IFNAME.log_martians=1 ...`
- `GET /containers/json` now returns an `ImageManifestDescriptor` field matching the same field in `/containers/{name}/json`. This field is only populated if the daemon provides a multi-platform image store. [moby/moby#49407](https://github.com/moby/moby/pull/49407)
@z

@x
### Removed
@y
### Removed
@z

@x
- The Fluent logger option `fluentd-async-connect` has been deprecated in v20.10 and is now removed. [moby/moby#46114](https://github.com/moby/moby/pull/46114)
- The `--time` option on `docker stop` and `docker restart` is deprecated and renamed to `--timeout`. [docker/cli#5485](https://github.com/docker/cli/pull/5485)
- Go-SDK: `pkg/ioutils`: Remove `NewReaderErrWrapper` as it was never used. [moby/moby#49258](https://github.com/moby/moby/pull/49258)
- Go-SDK: `pkg/ioutils`: Remove deprecated `BytesPipe`, `NewBytesPipe`, `ErrClosed`, `WriteCounter`, `NewWriteCounter`, `NewReaderErrWrapper`, `NopFlusher`. [moby/moby#49245](https://github.com/moby/moby/pull/49245)
- Go-SDK: `pkg/ioutils`: Remove deprecated `NopWriter` and `NopWriteCloser`. [moby/moby#49256](https://github.com/moby/moby/pull/49256)
- Go-SDK: `pkg/sysinfo`: Remove deprecated NumCPU. [moby/moby#49242](https://github.com/moby/moby/pull/49242)
- Go-SDK: Remove `pkg/broadcaster`, as it was only used internally [moby/moby#49172](https://github.com/moby/moby/pull/49172)
- Go-SDK: Remove deprecated `cli.Errors` type [docker/cli#5549](https://github.com/docker/cli/pull/5549)
- Remove `pkg/ioutils.ReadCloserWrapper`, as it was only used in tests. [moby/moby#49237](https://github.com/moby/moby/pull/49237)
- Remove deprecated `api-cors-header` config parameter and the `dockerd` `--api-cors-header` option [moby/moby#48209](https://github.com/moby/moby/pull/48209)
- Remove deprecated `APIEndpoint.Version` field, `APIVersion` type, and `APIVersion1` and `APIVersion2` consts. [moby/moby#49004](https://github.com/moby/moby/pull/49004)
- Remove deprecated `api-cors-header` config parameter and the Docker daemon's `--api-cors-header` option. [docker/cli#5437](https://github.com/docker/cli/pull/5437)
- Remove deprecated `pkg/directory` package [moby/moby#48779](https://github.com/moby/moby/pull/48779)
- Remove deprecated `pkg/dmsg.Dmesg()` [moby/moby#48109](https://github.com/moby/moby/pull/48109)
- Remove deprecated image/spec package, which was moved to a separate module (`github.com/moby/docker-image-spec`) [moby/moby#48460](https://github.com/moby/moby/pull/48460)
- Remove migration code and errors for the deprecated `logentries` logging driver. [moby/moby#48891](https://github.com/moby/moby/pull/48891)
- Remove support for deprecated external graph-driver plugins. [moby/moby#48072](https://github.com/moby/moby/pull/48072)
- `api/types`: Remove deprecated `container.ContainerNode` and `ContainerJSONBase.Node` field. [moby/moby#48107](https://github.com/moby/moby/pull/48107)
- `api/types`: Remove deprecated aliases: `ImagesPruneReport`, `VolumesPruneReport`, `NetworkCreateRequest`, `NetworkCreate`, `NetworkListOptions`, `NetworkCreateResponse`, `NetworkInspectOptions`, `NetworkConnect`, `NetworkDisconnect`, `EndpointResource`, `NetworkResource`, `NetworksPruneReport`, `ExecConfig`, `ExecStartCheck`, `ContainerExecInspect`, `ContainersPruneReport`, `ContainerPathStat`, `CopyToContainerOptions`, `ContainerStats`, `ImageSearchOptions`, `ImageImportSource`, `ImageLoadResponse`, `ContainerNode`. [moby/moby#48107](https://github.com/moby/moby/pull/48107)
- `libnetwork/iptables`: Remove deprecated `IPV`, `Iptables`, `IP6Tables` and `Passthrough()`. [moby/moby#49121](https://github.com/moby/moby/pull/49121)
- `pkg/archive`: Remove deprecated `CanonicalTarNameForPath`, `NewTempArchive`, `TempArchive` [moby/moby#48708](https://github.com/moby/moby/pull/48708)
- `pkg/fileutils`: Remove deprecated `GetTotalUsedFds` [moby/moby#49210](https://github.com/moby/moby/pull/49210)
- `pkg/ioutils`: Remove `OnEOFReader`, which was only used internally [moby/moby#49170](https://github.com/moby/moby/pull/49170)
- `pkg/longpath`: Remove deprecated `Prefix` constant. [moby/moby#48779](https://github.com/moby/moby/pull/48779)
- `pkg/stringid`: Remove deprecated `IsShortID` and  `ValidateID` functions [moby/moby#48705](https://github.com/moby/moby/pull/48705)
- `runconfig/opts`: Remove deprecated `ConvertKVStringsToMap` [moby/moby#48102](https://github.com/moby/moby/pull/48102)
- `runconfig`: Remove deprecated `ContainerConfigWrapper`, `SetDefaultNetModeIfBlank`, `DefaultDaemonNetworkMode`, `IsPreDefinedNetwork` [moby/moby#48102](https://github.com/moby/moby/pull/48102)
- `container`: Remove deprecated `ErrNameReserved`, `ErrNameNotReserved`. [moby/moby#48728](https://github.com/moby/moby/pull/48728)
- Remove `Daemon.ContainerInspectCurrent()` method and change `Daemon.ContainerInspect()` signature to accept a `backend.ContainerInspectOptions` struct [moby/moby#48672](https://github.com/moby/moby/pull/48672)
- Remove deprecated `Daemon.Exists()` and `Daemon.IsPaused()` methods. [moby/moby#48723](https://github.com/moby/moby/pull/48723)
@y
- The Fluent logger option `fluentd-async-connect` has been deprecated in v20.10 and is now removed. [moby/moby#46114](https://github.com/moby/moby/pull/46114)
- The `--time` option on `docker stop` and `docker restart` is deprecated and renamed to `--timeout`. [docker/cli#5485](https://github.com/docker/cli/pull/5485)
- Go-SDK: `pkg/ioutils`: Remove `NewReaderErrWrapper` as it was never used. [moby/moby#49258](https://github.com/moby/moby/pull/49258)
- Go-SDK: `pkg/ioutils`: Remove deprecated `BytesPipe`, `NewBytesPipe`, `ErrClosed`, `WriteCounter`, `NewWriteCounter`, `NewReaderErrWrapper`, `NopFlusher`. [moby/moby#49245](https://github.com/moby/moby/pull/49245)
- Go-SDK: `pkg/ioutils`: Remove deprecated `NopWriter` and `NopWriteCloser`. [moby/moby#49256](https://github.com/moby/moby/pull/49256)
- Go-SDK: `pkg/sysinfo`: Remove deprecated NumCPU. [moby/moby#49242](https://github.com/moby/moby/pull/49242)
- Go-SDK: Remove `pkg/broadcaster`, as it was only used internally [moby/moby#49172](https://github.com/moby/moby/pull/49172)
- Go-SDK: Remove deprecated `cli.Errors` type [docker/cli#5549](https://github.com/docker/cli/pull/5549)
- Remove `pkg/ioutils.ReadCloserWrapper`, as it was only used in tests. [moby/moby#49237](https://github.com/moby/moby/pull/49237)
- Remove deprecated `api-cors-header` config parameter and the `dockerd` `--api-cors-header` option [moby/moby#48209](https://github.com/moby/moby/pull/48209)
- Remove deprecated `APIEndpoint.Version` field, `APIVersion` type, and `APIVersion1` and `APIVersion2` consts. [moby/moby#49004](https://github.com/moby/moby/pull/49004)
- Remove deprecated `api-cors-header` config parameter and the Docker daemon's `--api-cors-header` option. [docker/cli#5437](https://github.com/docker/cli/pull/5437)
- Remove deprecated `pkg/directory` package [moby/moby#48779](https://github.com/moby/moby/pull/48779)
- Remove deprecated `pkg/dmsg.Dmesg()` [moby/moby#48109](https://github.com/moby/moby/pull/48109)
- Remove deprecated image/spec package, which was moved to a separate module (`github.com/moby/docker-image-spec`) [moby/moby#48460](https://github.com/moby/moby/pull/48460)
- Remove migration code and errors for the deprecated `logentries` logging driver. [moby/moby#48891](https://github.com/moby/moby/pull/48891)
- Remove support for deprecated external graph-driver plugins. [moby/moby#48072](https://github.com/moby/moby/pull/48072)
- `api/types`: Remove deprecated `container.ContainerNode` and `ContainerJSONBase.Node` field. [moby/moby#48107](https://github.com/moby/moby/pull/48107)
- `api/types`: Remove deprecated aliases: `ImagesPruneReport`, `VolumesPruneReport`, `NetworkCreateRequest`, `NetworkCreate`, `NetworkListOptions`, `NetworkCreateResponse`, `NetworkInspectOptions`, `NetworkConnect`, `NetworkDisconnect`, `EndpointResource`, `NetworkResource`, `NetworksPruneReport`, `ExecConfig`, `ExecStartCheck`, `ContainerExecInspect`, `ContainersPruneReport`, `ContainerPathStat`, `CopyToContainerOptions`, `ContainerStats`, `ImageSearchOptions`, `ImageImportSource`, `ImageLoadResponse`, `ContainerNode`. [moby/moby#48107](https://github.com/moby/moby/pull/48107)
- `libnetwork/iptables`: Remove deprecated `IPV`, `Iptables`, `IP6Tables` and `Passthrough()`. [moby/moby#49121](https://github.com/moby/moby/pull/49121)
- `pkg/archive`: Remove deprecated `CanonicalTarNameForPath`, `NewTempArchive`, `TempArchive` [moby/moby#48708](https://github.com/moby/moby/pull/48708)
- `pkg/fileutils`: Remove deprecated `GetTotalUsedFds` [moby/moby#49210](https://github.com/moby/moby/pull/49210)
- `pkg/ioutils`: Remove `OnEOFReader`, which was only used internally [moby/moby#49170](https://github.com/moby/moby/pull/49170)
- `pkg/longpath`: Remove deprecated `Prefix` constant. [moby/moby#48779](https://github.com/moby/moby/pull/48779)
- `pkg/stringid`: Remove deprecated `IsShortID` and  `ValidateID` functions [moby/moby#48705](https://github.com/moby/moby/pull/48705)
- `runconfig/opts`: Remove deprecated `ConvertKVStringsToMap` [moby/moby#48102](https://github.com/moby/moby/pull/48102)
- `runconfig`: Remove deprecated `ContainerConfigWrapper`, `SetDefaultNetModeIfBlank`, `DefaultDaemonNetworkMode`, `IsPreDefinedNetwork` [moby/moby#48102](https://github.com/moby/moby/pull/48102)
- `container`: Remove deprecated `ErrNameReserved`, `ErrNameNotReserved`. [moby/moby#48728](https://github.com/moby/moby/pull/48728)
- Remove `Daemon.ContainerInspectCurrent()` method and change `Daemon.ContainerInspect()` signature to accept a `backend.ContainerInspectOptions` struct [moby/moby#48672](https://github.com/moby/moby/pull/48672)
- Remove deprecated `Daemon.Exists()` and `Daemon.IsPaused()` methods. [moby/moby#48723](https://github.com/moby/moby/pull/48723)
@z

@x
### Deprecations
@y
### Deprecations
@z

@x
- API: The `BridgeNfIptables` and `BridgeNfIp6tables` fields in the `GET /info` response are now always be `false` and will be omitted in API v1.49. The netfilter module is now loaded on-demand, and no longer during daemon startup, making these fields obsolete. [moby/moby#49114](https://github.com/moby/moby/pull/49114)
- API: The `error` and `progress` fields in streaming responses for endpoints that return a JSON progress response, such as `POST /images/create`, `POST /images/{name}/push`, and `POST /build` are deprecated.  [moby/moby#49447](https://github.com/moby/moby/pull/49447)
  - Users should use the information in the `errorDetail` and `progressDetail` fields instead.
  - These fields were marked deprecated in API v1.4 (docker v0.6.0) and API v1.8 (docker v0.7.1) respectively, but still returned.
  - These fields will be left empty or will be omitted in a future API version.
- Deprecate `Daemon.Register()`. This function is unused and will be removed in the next release. [moby/moby#48702](https://github.com/moby/moby/pull/48702)
- Deprecate `client.ImageInspectWithRaw` function in favor of the new `client.ImageInspect`. [moby/moby#48264](https://github.com/moby/moby/pull/48264)
- Deprecate `daemon/config.Config.ValidatePlatformConfig()`. This method was used as helper for `config.Validate`, which should be used instead. [moby/moby#48985](https://github.com/moby/moby/pull/48985)
- Deprecate `pkg/reexec`. This package is deprecated and moved to a separate module. Use `github.com/moby/sys/reexec` instead. [moby/moby#49129](https://github.com/moby/moby/pull/49129)
- Deprecate configuration for pushing non-distributable artifacts [docker/cli#5724](https://github.com/docker/cli/pull/5724)
- Deprecate the `--allow-nondistributable-artifacts` daemon flag and corresponding `allow-nondistributable-artifacts` field in `daemon.json`. Setting either option will no longer take an effect, but a deprecation warning log is added. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- Deprecate the `RegistryConfig.AllowNondistributableArtifactsCIDRs` and `RegistryConfig.AllowNondistributableArtifactsHostnames` fields in the `GET /info` API response. For API version v1.48 and older, the fields are still included in the response, but always `null`. In API version v1.49 and later, the field will be omitted entirely. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- Go-SDK: Deprecate `registry.ServiceOptions.AllowNondistributableArtifacts` field. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- Go-SDK: The `BridgeNfIptables`, `BridgeNfIp6tables` fields in `api/types/system.Info` and `BridgeNFCallIPTablesDisabled`, `BridgeNFCallIP6TablesDisabled` fields in `pkg/sysinfo.SysInfo` are deprecated and will be removed in the next release. [moby/moby#49114](https://github.com/moby/moby/pull/49114)
- Go-SDK: `client`: Deprecate `CommonAPIClient` interface in favor of the `APIClient` interface. The `CommonAPIClient` will be changed to an alias for `APIClient` in the next release, and removed in the release after. [moby/moby#49388](https://github.com/moby/moby/pull/49388)
- Go-SDK: `client`: Deprecate `ErrorConnectionFailed` helper. This function was only used internally, and will be removed in the next release. [moby/moby#49389](https://github.com/moby/moby/pull/49389)
- Go-SDK: `pkg/ioutils`: Deprecate `NewAtomicFileWriter`, `AtomicWriteFile`, `AtomicWriteSet`, `NewAtomicWriteSet` in favor of `pkg/atomicwriter` equivalents. [moby/moby#49171](https://github.com/moby/moby/pull/49171)
- Go-SDK: `pkg/sysinfo`: Deprecate `NumCPU`. This utility has the same behavior as `runtime.NumCPU`. [moby/moby#49241](https://github.com/moby/moby/pull/49241)
- Go-SDK: `pkg/system`: Deprecate `MkdirAll`. This function provided custom handling for Windows GUID volume paths. Handling for such paths is now supported by Go standard library in go1.22 and newer, and this function is now an alias for `os.MkdirAll`, which should be used instead. This alias will be removed in the next release. [moby/moby#49162](https://github.com/moby/moby/pull/49162)
- Go-SDK: Deprecate `pkg/parsers.ParseKeyValueOpt`. [moby/moby#49177](https://github.com/moby/moby/pull/49177)
- Go-SDK: Deprecate `pkg/parsers.ParseUintListMaximum`, `pkg/parsers.ParseUintList`. These utilities were only used internally and will be removed in the next release. [moby/moby#49222](https://github.com/moby/moby/pull/49222)
- Go-SDK: Deprecate `api/type.IDResponse` in favor of `container.CommitResponse` and `container.ExecCreateResponse`, which are currently an alias, but may become distinct types in a future release. This type will be removed in the next release. [moby/moby#49446](https://github.com/moby/moby/pull/49446)
- Go-SDK: Deprecate `api/types/container.ContainerUpdateOKBody` in favor of `UpdateResponse`. This type will be removed in the next release. [moby/moby#49442](https://github.com/moby/moby/pull/49442)
- Go-SDK: Deprecate `api/types/container.ContainerTopOKBody` in favor of `TopResponse`. This type will be removed in the next release. [moby/moby#49442](https://github.com/moby/moby/pull/49442)
- Go-SDK: `pkg/jsonmessage`: Fix deprecation of `ProgressMessage`, `ErrorMessage`, which were deprecated in Docker v0.6.0 and v0.7.1 respectively. [moby/moby#49447](https://github.com/moby/moby/pull/49447)
- Move `GraphDriverData` from `api/types` to `api/types/storage`. The old type is deprecated and will be removed in the next release. [moby/moby#48108](https://github.com/moby/moby/pull/48108)
- Move `RequestPrivilegeFunc` from `api/types` to `api/types/registry`. The old type is deprecated and will be removed in the next release. [moby/moby#48119](https://github.com/moby/moby/pull/48119)
- Move from `api/types` to `api/types/container` - `NetworkSettings`, `NetworkSettingsBase`, `DefaultNetworkSettings`, `SummaryNetworkSettings`, `Health`, `HealthcheckResult`, `NoHealthcheck`, `Starting`, `Healthy`, and `Unhealthy` constants, `MountPoint`, `Port`, `ContainerState`, `Container`, `ContainerJSONBase`, `ContainerJSON`, `ContainerNode`. The old types are deprecated and will be removed in the next release. [moby/moby#48108](https://github.com/moby/moby/pull/48108)
- Move from `api/types` to `api/types/image` - `ImageInspect`, `RootFS`. The old types are deprecated and will be removed in the next release. [moby/moby#48108](https://github.com/moby/moby/pull/48108)
- `ContainerdCommit.Expected`, `RuncCommit.Expected`, and `InitCommit.Expected` fields in the `GET /info` endpoint are deprecated and will be omitted in API v1.49. [moby/moby#48478](https://github.com/moby/moby/pull/48478)
- `api/types/registry`: Deprecate `ServiceConfig.AllowNondistributableArtifactsCIDRs` and `ServiceConfig.AllowNondistributableArtifactsHostnames` fields. These fields will be removed in the next release. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- `api/types/system/Commit.Expected` field is deprecated and should no longer be used. [moby/moby#48478](https://github.com/moby/moby/pull/48478)
- `daemon/graphdriver`: Deprecate `GetDriver()` [moby/moby#48079](https://github.com/moby/moby/pull/48079)
- `libnetwork/iptables`: Deprecate `Passthrough`. This function was only used internally, and will be removed in the next release. [moby/moby#49115](https://github.com/moby/moby/pull/49115)
- `pkg/directory.Size()` function is deprecated, an will be removed in the next release. [moby/moby#48057](https://github.com/moby/moby/pull/48057)
- `registry`: Deprecate `APIEndpoint.TrimHostName`; hostname is now trimmed unconditionally for remote names. This field will be removed in the next release. [moby/moby#49005](https://github.com/moby/moby/pull/49005)
- `allow-nondistributable-artifacts` field in `daemon.json`. Setting either option will no longer take effect, but a deprecation warning log is added to raise awareness about the deprecation. This warning is planned to become an error in the next release. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
@y
- API: The `BridgeNfIptables` and `BridgeNfIp6tables` fields in the `GET /info` response are now always be `false` and will be omitted in API v1.49. The netfilter module is now loaded on-demand, and no longer during daemon startup, making these fields obsolete. [moby/moby#49114](https://github.com/moby/moby/pull/49114)
- API: The `error` and `progress` fields in streaming responses for endpoints that return a JSON progress response, such as `POST /images/create`, `POST /images/{name}/push`, and `POST /build` are deprecated.  [moby/moby#49447](https://github.com/moby/moby/pull/49447)
  - Users should use the information in the `errorDetail` and `progressDetail` fields instead.
  - These fields were marked deprecated in API v1.4 (docker v0.6.0) and API v1.8 (docker v0.7.1) respectively, but still returned.
  - These fields will be left empty or will be omitted in a future API version.
- Deprecate `Daemon.Register()`. This function is unused and will be removed in the next release. [moby/moby#48702](https://github.com/moby/moby/pull/48702)
- Deprecate `client.ImageInspectWithRaw` function in favor of the new `client.ImageInspect`. [moby/moby#48264](https://github.com/moby/moby/pull/48264)
- Deprecate `daemon/config.Config.ValidatePlatformConfig()`. This method was used as helper for `config.Validate`, which should be used instead. [moby/moby#48985](https://github.com/moby/moby/pull/48985)
- Deprecate `pkg/reexec`. This package is deprecated and moved to a separate module. Use `github.com/moby/sys/reexec` instead. [moby/moby#49129](https://github.com/moby/moby/pull/49129)
- Deprecate configuration for pushing non-distributable artifacts [docker/cli#5724](https://github.com/docker/cli/pull/5724)
- Deprecate the `--allow-nondistributable-artifacts` daemon flag and corresponding `allow-nondistributable-artifacts` field in `daemon.json`. Setting either option will no longer take an effect, but a deprecation warning log is added. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- Deprecate the `RegistryConfig.AllowNondistributableArtifactsCIDRs` and `RegistryConfig.AllowNondistributableArtifactsHostnames` fields in the `GET /info` API response. For API version v1.48 and older, the fields are still included in the response, but always `null`. In API version v1.49 and later, the field will be omitted entirely. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- Go-SDK: Deprecate `registry.ServiceOptions.AllowNondistributableArtifacts` field. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- Go-SDK: The `BridgeNfIptables`, `BridgeNfIp6tables` fields in `api/types/system.Info` and `BridgeNFCallIPTablesDisabled`, `BridgeNFCallIP6TablesDisabled` fields in `pkg/sysinfo.SysInfo` are deprecated and will be removed in the next release. [moby/moby#49114](https://github.com/moby/moby/pull/49114)
- Go-SDK: `client`: Deprecate `CommonAPIClient` interface in favor of the `APIClient` interface. The `CommonAPIClient` will be changed to an alias for `APIClient` in the next release, and removed in the release after. [moby/moby#49388](https://github.com/moby/moby/pull/49388)
- Go-SDK: `client`: Deprecate `ErrorConnectionFailed` helper. This function was only used internally, and will be removed in the next release. [moby/moby#49389](https://github.com/moby/moby/pull/49389)
- Go-SDK: `pkg/ioutils`: Deprecate `NewAtomicFileWriter`, `AtomicWriteFile`, `AtomicWriteSet`, `NewAtomicWriteSet` in favor of `pkg/atomicwriter` equivalents. [moby/moby#49171](https://github.com/moby/moby/pull/49171)
- Go-SDK: `pkg/sysinfo`: Deprecate `NumCPU`. This utility has the same behavior as `runtime.NumCPU`. [moby/moby#49241](https://github.com/moby/moby/pull/49241)
- Go-SDK: `pkg/system`: Deprecate `MkdirAll`. This function provided custom handling for Windows GUID volume paths. Handling for such paths is now supported by Go standard library in go1.22 and newer, and this function is now an alias for `os.MkdirAll`, which should be used instead. This alias will be removed in the next release. [moby/moby#49162](https://github.com/moby/moby/pull/49162)
- Go-SDK: Deprecate `pkg/parsers.ParseKeyValueOpt`. [moby/moby#49177](https://github.com/moby/moby/pull/49177)
- Go-SDK: Deprecate `pkg/parsers.ParseUintListMaximum`, `pkg/parsers.ParseUintList`. These utilities were only used internally and will be removed in the next release. [moby/moby#49222](https://github.com/moby/moby/pull/49222)
- Go-SDK: Deprecate `api/type.IDResponse` in favor of `container.CommitResponse` and `container.ExecCreateResponse`, which are currently an alias, but may become distinct types in a future release. This type will be removed in the next release. [moby/moby#49446](https://github.com/moby/moby/pull/49446)
- Go-SDK: Deprecate `api/types/container.ContainerUpdateOKBody` in favor of `UpdateResponse`. This type will be removed in the next release. [moby/moby#49442](https://github.com/moby/moby/pull/49442)
- Go-SDK: Deprecate `api/types/container.ContainerTopOKBody` in favor of `TopResponse`. This type will be removed in the next release. [moby/moby#49442](https://github.com/moby/moby/pull/49442)
- Go-SDK: `pkg/jsonmessage`: Fix deprecation of `ProgressMessage`, `ErrorMessage`, which were deprecated in Docker v0.6.0 and v0.7.1 respectively. [moby/moby#49447](https://github.com/moby/moby/pull/49447)
- Move `GraphDriverData` from `api/types` to `api/types/storage`. The old type is deprecated and will be removed in the next release. [moby/moby#48108](https://github.com/moby/moby/pull/48108)
- Move `RequestPrivilegeFunc` from `api/types` to `api/types/registry`. The old type is deprecated and will be removed in the next release. [moby/moby#48119](https://github.com/moby/moby/pull/48119)
- Move from `api/types` to `api/types/container` - `NetworkSettings`, `NetworkSettingsBase`, `DefaultNetworkSettings`, `SummaryNetworkSettings`, `Health`, `HealthcheckResult`, `NoHealthcheck`, `Starting`, `Healthy`, and `Unhealthy` constants, `MountPoint`, `Port`, `ContainerState`, `Container`, `ContainerJSONBase`, `ContainerJSON`, `ContainerNode`. The old types are deprecated and will be removed in the next release. [moby/moby#48108](https://github.com/moby/moby/pull/48108)
- Move from `api/types` to `api/types/image` - `ImageInspect`, `RootFS`. The old types are deprecated and will be removed in the next release. [moby/moby#48108](https://github.com/moby/moby/pull/48108)
- `ContainerdCommit.Expected`, `RuncCommit.Expected`, and `InitCommit.Expected` fields in the `GET /info` endpoint are deprecated and will be omitted in API v1.49. [moby/moby#48478](https://github.com/moby/moby/pull/48478)
- `api/types/registry`: Deprecate `ServiceConfig.AllowNondistributableArtifactsCIDRs` and `ServiceConfig.AllowNondistributableArtifactsHostnames` fields. These fields will be removed in the next release. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
- `api/types/system/Commit.Expected` field is deprecated and should no longer be used. [moby/moby#48478](https://github.com/moby/moby/pull/48478)
- `daemon/graphdriver`: Deprecate `GetDriver()` [moby/moby#48079](https://github.com/moby/moby/pull/48079)
- `libnetwork/iptables`: Deprecate `Passthrough`. This function was only used internally, and will be removed in the next release. [moby/moby#49115](https://github.com/moby/moby/pull/49115)
- `pkg/directory.Size()` function is deprecated, an will be removed in the next release. [moby/moby#48057](https://github.com/moby/moby/pull/48057)
- `registry`: Deprecate `APIEndpoint.TrimHostName`; hostname is now trimmed unconditionally for remote names. This field will be removed in the next release. [moby/moby#49005](https://github.com/moby/moby/pull/49005)
- `allow-nondistributable-artifacts` field in `daemon.json`. Setting either option will no longer take effect, but a deprecation warning log is added to raise awareness about the deprecation. This warning is planned to become an error in the next release. [moby/moby#49065](https://github.com/moby/moby/pull/49065)
@z
