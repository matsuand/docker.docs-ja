%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Docker Engine 27.0 release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@y
title: Docker Engine 27.0 リリースノート
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 27.0.
@y
本ページでは Docker Engine バージョン 27.0 に関する最新の変更、追加、既知の問題、バグフィックスについて示します。
@z

@x
For more information about:
@y
さらに以下の情報についても示します。
@z

@x
- Deprecated and removed features, see [Deprecated Engine Features](../deprecated.md).
- Changes to the Engine API, see [Engine API version history](/reference/api/engine/version-history.md).
@y
- 非推奨とした機能と削除した機能。詳細は [Engine の非推奨機能](../deprecated.md) を参照。
- Engine API の変更点。詳細は [Engine API バージョン履歴](reference/api/engine/version-history.md) を参照。
@z

@x
## 27.0.3
@y
## 27.0.3
@z

@x
{{< release-date date="2024-07-01" >}}
@y
{{< release-date date="2024-07-01" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 27.0.3 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.0.3)
- [moby/moby, 27.0.3 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.0.3)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.0.3/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.0.3/docs/api/version-history.md).
@y
- [docker/cli, 27.0.3 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.0.3)
- [moby/moby, 27.0.3 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.0.3)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.0.3/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.0.3/docs/api/version-history.md).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix a regression that incorrectly reported a port mapping from a host IPv6 address to an IPv4-only container as an error. [moby/moby#48090](https://github.com/moby/moby/pull/48090)
- Fix a regression that caused duplicate subnet allocations when creating networks. [moby/moby#48089](https://github.com/moby/moby/pull/48089)
- Fix a regression resulting in `fail to register layer: failed to Lchown` errors when trying to pull an image with rootless enabled on a system that supports native overlay with user-namespaces. [moby/moby#48086](https://github.com/moby/moby/pull/48086)
@y
- Fix a regression that incorrectly reported a port mapping from a host IPv6 address to an IPv4-only container as an error. [moby/moby#48090](https://github.com/moby/moby/pull/48090)
- Fix a regression that caused duplicate subnet allocations when creating networks. [moby/moby#48089](https://github.com/moby/moby/pull/48089)
- Fix a regression resulting in `fail to register layer: failed to Lchown` errors when trying to pull an image with rootless enabled on a system that supports native overlay with user-namespaces. [moby/moby#48086](https://github.com/moby/moby/pull/48086)
@z

@x
## 27.0.2
@y
## 27.0.2
@z

@x
{{< release-date date="2024-06-27" >}}
@y
{{< release-date date="2024-06-27" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 27.0.2 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.0.2)
- [moby/moby, 27.0.2 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.0.2)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.0.2/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.0.2/docs/api/version-history.md).
@y
- [docker/cli, 27.0.2 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.0.2)
- [moby/moby, 27.0.2 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.0.2)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.0.2/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.0.2/docs/api/version-history.md).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix a regression that caused port numbers to be ignored when parsing a Docker registry URL. [docker/cli#5197](https://github.com/docker/cli/pull/5197), [docker/cli#5198](https://github.com/docker/cli/pull/5198)
@y
- Fix a regression that caused port numbers to be ignored when parsing a Docker registry URL. [docker/cli#5197](https://github.com/docker/cli/pull/5197), [docker/cli#5198](https://github.com/docker/cli/pull/5198)
@z

@x
### Removed
@y
### Removed
@z

@x
- api/types: deprecate `ContainerJSONBase.Node` field and `ContainerNode` type. These definitions were used by the standalone ("classic") Swarm API, but never implemented in the Docker Engine itself. [moby/moby#48055](https://github.com/moby/moby/pull/48055)
@y
- api/types: deprecate `ContainerJSONBase.Node` field and `ContainerNode` type. These definitions were used by the standalone ("classic") Swarm API, but never implemented in the Docker Engine itself. [moby/moby#48055](https://github.com/moby/moby/pull/48055)
@z

@x
## 27.0.1
@y
## 27.0.1
@z

@x
{{< release-date date="2024-06-24" >}}
@y
{{< release-date date="2024-06-24" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 27.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.0.0)
- [moby/moby, 27.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.0.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.0.1/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.0.1/docs/api/version-history.md).
@y
- [docker/cli, 27.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.0.0)
- [moby/moby, 27.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.0.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.0.1/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.0.1/docs/api/version-history.md).
@z

@x
### New
@y
### New
@z

@x
- containerd image store: Add `--platform` flag to `docker image push` and improve the default behavior when not all platforms of the multi-platform image are available locally. [docker/cli#4984](https://github.com/docker/cli/pull/4984), [moby/moby#47679](https://github.com/moby/moby/pull/47679)
- Add support to `docker stack deploy` for `driver_opts` in a service's networks. [docker/cli#5125](https://github.com/docker/cli/pull/5125)
- Consider additional `/usr/local/libexec` and `/usr/libexec` paths when looking up the userland proxy binaries by a name with a `docker-` prefix. [moby/moby#47804](https://github.com/moby/moby/pull/47804)
@y
- containerd image store: Add `--platform` flag to `docker image push` and improve the default behavior when not all platforms of the multi-platform image are available locally. [docker/cli#4984](https://github.com/docker/cli/pull/4984), [moby/moby#47679](https://github.com/moby/moby/pull/47679)
- Add support to `docker stack deploy` for `driver_opts` in a service's networks. [docker/cli#5125](https://github.com/docker/cli/pull/5125)
- Consider additional `/usr/local/libexec` and `/usr/libexec` paths when looking up the userland proxy binaries by a name with a `docker-` prefix. [moby/moby#47804](https://github.com/moby/moby/pull/47804)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- `*client.Client` instances are now always safe for concurrent use by multiple goroutines. Previously, this could lead to data races when the `WithAPIVersionNegotiation()` option is used. [moby/moby#47961](https://github.com/moby/moby/pull/47961)
- Fix a bug causing the Docker CLI to leak Unix sockets in `$TMPDIR` in some cases. [docker/cli#5146](https://github.com/docker/cli/pull/5146)
- Don't ignore a custom seccomp profile when used in conjunction with `--privileged`. [moby/moby#47500](https://github.com/moby/moby/pull/47500)
- rootless: overlay2: support native overlay diff when using rootless-mode with Linux kernel version 5.11 and later. [moby/moby#47605](https://github.com/moby/moby/pull/47605)
- Fix the `StartInterval` default value of healthcheck to reflect the documented value of 5s. [moby/moby#47799](https://github.com/moby/moby/pull/47799)
- Fix `docker save` and `docker load` not ending on the daemon side when the operation was cancelled by the user, for example with <kbd>Ctrl+C</kbd>. [moby/moby#47629](https://github.com/moby/moby/pull/47629)
- The `StartedAt` property of containers is now recorded before container startup, guaranteeing that the `StartedAt` is always before `FinishedAt`. [moby/moby#47003](https://github.com/moby/moby/pull/47003)
- The internal DNS resolver used by Windows containers on Windows now forwards requests to external DNS servers by default. This enables `nslookup` to resolve external hostnames. This behaviour can be disabled via `daemon.json`, using `"features": { "windows-dns-proxy": false }`. The configuration option will be removed in a future release. [moby/moby#47826](https://github.com/moby/moby/pull/47826)
- Print a warning when the CLI does not have permissions to read the configuration file. [docker/cli#5077](https://github.com/docker/cli/pull/5077)
- Fix a goroutine and file-descriptor leak on container attach. [moby/moby#45052](https://github.com/moby/moby/pull/45052)
- Clear the networking state of all stopped or dead containers during daemon start-up. [moby/moby#47984](https://github.com/moby/moby/pull/47984)
- Write volume options JSON atomically to avoid "invalid JSON" errors after system crash. [moby/moby#48034](https://github.com/moby/moby/pull/48034)
- Allow multiple macvlan networks with the same parent. [moby/moby#47318](https://github.com/moby/moby/pull/47318)
- Allow BuildKit to be used on Windows daemons that advertise it. [docker/cli#5178](https://github.com/docker/cli/pull/5178)
@y
- `*client.Client` instances are now always safe for concurrent use by multiple goroutines. Previously, this could lead to data races when the `WithAPIVersionNegotiation()` option is used. [moby/moby#47961](https://github.com/moby/moby/pull/47961)
- Fix a bug causing the Docker CLI to leak Unix sockets in `$TMPDIR` in some cases. [docker/cli#5146](https://github.com/docker/cli/pull/5146)
- Don't ignore a custom seccomp profile when used in conjunction with `--privileged`. [moby/moby#47500](https://github.com/moby/moby/pull/47500)
- rootless: overlay2: support native overlay diff when using rootless-mode with Linux kernel version 5.11 and later. [moby/moby#47605](https://github.com/moby/moby/pull/47605)
- Fix the `StartInterval` default value of healthcheck to reflect the documented value of 5s. [moby/moby#47799](https://github.com/moby/moby/pull/47799)
- Fix `docker save` and `docker load` not ending on the daemon side when the operation was cancelled by the user, for example with <kbd>Ctrl+C</kbd>. [moby/moby#47629](https://github.com/moby/moby/pull/47629)
- The `StartedAt` property of containers is now recorded before container startup, guaranteeing that the `StartedAt` is always before `FinishedAt`. [moby/moby#47003](https://github.com/moby/moby/pull/47003)
- The internal DNS resolver used by Windows containers on Windows now forwards requests to external DNS servers by default. This enables `nslookup` to resolve external hostnames. This behaviour can be disabled via `daemon.json`, using `"features": { "windows-dns-proxy": false }`. The configuration option will be removed in a future release. [moby/moby#47826](https://github.com/moby/moby/pull/47826)
- Print a warning when the CLI does not have permissions to read the configuration file. [docker/cli#5077](https://github.com/docker/cli/pull/5077)
- Fix a goroutine and file-descriptor leak on container attach. [moby/moby#45052](https://github.com/moby/moby/pull/45052)
- Clear the networking state of all stopped or dead containers during daemon start-up. [moby/moby#47984](https://github.com/moby/moby/pull/47984)
- Write volume options JSON atomically to avoid "invalid JSON" errors after system crash. [moby/moby#48034](https://github.com/moby/moby/pull/48034)
- Allow multiple macvlan networks with the same parent. [moby/moby#47318](https://github.com/moby/moby/pull/47318)
- Allow BuildKit to be used on Windows daemons that advertise it. [docker/cli#5178](https://github.com/docker/cli/pull/5178)
@z

@x
### Networking
@y
### Networking
@z

@x
- Allow sysctls to be set per-interface during container creation and network connection. [moby/moby#47686](https://github.com/moby/moby/pull/47686)
  * In a future release, this will be the only way to set per-interface sysctl options.
    For example, on the command line in a `docker run` command,`--network mynet --sysctl net.ipv4.conf.eth0.log_martians=1` will be rejected.
    Instead, you must use `--network name=mynet,driver-opt=com.docker.network.endpoint.sysctls=net.ipv4.conf.IFNAME.log_martians=1`.
@y
- Allow sysctls to be set per-interface during container creation and network connection. [moby/moby#47686](https://github.com/moby/moby/pull/47686)
  * In a future release, this will be the only way to set per-interface sysctl options.
    For example, on the command line in a `docker run` command,`--network mynet --sysctl net.ipv4.conf.eth0.log_martians=1` will be rejected.
    Instead, you must use `--network name=mynet,driver-opt=com.docker.network.endpoint.sysctls=net.ipv4.conf.IFNAME.log_martians=1`.
@z

@x
#### IPv6
@y
#### IPv6
@z

@x
- `ip6tables` is no longer experimental. You may remove the `experimental` configuration option and continue to use IPv6, if it is not required by any other features.
- `ip6tables` is now enabled for Linux bridge networks by default. [moby/moby#47747](https://github.com/moby/moby/pull/47747)
  - This makes IPv4 and IPv6 behaviors consistent with each other, and reduces the risk that IPv6-enabled containers are inadvertently exposed to the network.
  - There is no impact if you are running Docker Engine with `ip6tables` enabled (new default).
  - If you are using an IPv6-enabled bridge network without `ip6tables`, this is likely a breaking change. Only published container ports (`-p` or `--publish`) are accessible from outside the Docker bridge network, and outgoing connections masquerade as the host.
  - To restore the behavior of earlier releases, no `ip6tables` at all, set `"ip6tables": false` in `daemon.json`, or use the CLI option `--ip6tables=false`. Alternatively, leave `ip6tables` enabled, publish ports, and enable direct routing.
  - With `ip6tables` enabled, if `ip6tables` is not functional on your host, Docker Engine will start but it will not be possible to create an IPv6-enabled network.
@y
- `ip6tables` is no longer experimental. You may remove the `experimental` configuration option and continue to use IPv6, if it is not required by any other features.
- `ip6tables` is now enabled for Linux bridge networks by default. [moby/moby#47747](https://github.com/moby/moby/pull/47747)
  - This makes IPv4 and IPv6 behaviors consistent with each other, and reduces the risk that IPv6-enabled containers are inadvertently exposed to the network.
  - There is no impact if you are running Docker Engine with `ip6tables` enabled (new default).
  - If you are using an IPv6-enabled bridge network without `ip6tables`, this is likely a breaking change. Only published container ports (`-p` or `--publish`) are accessible from outside the Docker bridge network, and outgoing connections masquerade as the host.
  - To restore the behavior of earlier releases, no `ip6tables` at all, set `"ip6tables": false` in `daemon.json`, or use the CLI option `--ip6tables=false`. Alternatively, leave `ip6tables` enabled, publish ports, and enable direct routing.
  - With `ip6tables` enabled, if `ip6tables` is not functional on your host, Docker Engine will start but it will not be possible to create an IPv6-enabled network.
@z

@x
#### IPv6 network configuration improvements
@y
#### IPv6 network configuration improvements
@z

@x
- A Unique Local Address (ULA) base prefix is automatically added to `default-address-pools` if this parameter wasn't manually configured, or if it contains no IPv6 prefixes. [moby/moby#47853](https://github.com/moby/moby/pull/47853)
  - Prior to this release, to create an IPv6-enabled network it was necessary to use the `--subnet` option to specify an IPv6 subnet, or add IPv6 ranges to `default-address-pools` in `daemon.json`.
  - Starting in this release, when a bridge network is created with `--ipv6` and no IPv6 subnet is defined by those options, an IPv6 Unique Local Address (ULA) base prefix is used.
  - The ULA prefix is derived from the Engine host ID such that it's unique across hosts and over time.
- IPv6 address pools of any size can now be added to `default-address-pools`. [moby/moby#47768](https://github.com/moby/moby/pull/47768)
- IPv6 can now be enabled by default on all custom bridge networks using `"default-network-opts": { "bridge": {"com.docker.network.enable_ipv6": "true"}}` in `daemon.json`, or `dockerd --default-network-opt=bridge=com.docker.network.enable_ipv6=true`on the comand line. [moby/moby#47867](https://github.com/moby/moby/pull/47867)
- Direct routing for IPv6 networks, with `ip6tables` enabled. [moby/moby#47871](https://github.com/moby/moby/pull/47871)
  - Added bridge driver option `com.docker.network.bridge.gateway_mode_ipv6=<nat|routed>`.
  - The default behavior, `nat`, is unchanged from previous releases running with `ip6tables` enabled. NAT and masquerading rules are set up for each published container port.
  - When set to `routed`, no NAT or masquerading rules are configured for published ports. This enables direct IPv6 access to the container, if the host's network can route packets for the container's address to the host. Published ports will be opened in the container's firewall.
  - When a port mapping only applies to `routed` mode, only addresses `0.0.0.0` or `::` are allowed and a host port must not be given.
  - Note that published container ports, in `nat` or `routed` mode, are accessible from any remote address if routing is set up in the network, unless the Docker host's firewall has additional restrictions. For example: `docker network create --ipv6 -o com.docker.network.bridge.gateway_mode_ipv6=routed mynet`.
  - The option `com.docker.network.bridge.gateway_mode_ipv4=<nat|routed>` is also available, with the same behavior but for IPv4.
- If firewalld is running on the host, Docker creates policy `docker-forwarding` to allow forwarding from any zone to the `docker` zone. This makes it possible to configure a bridge network with a routable IPv6 address, and no NAT or masquerading. [moby/moby#47745](https://github.com/moby/moby/pull/47745)
- When a port is published with no host port specified, or a host port range is given, the same port will be allocated for IPv4 and IPv6. [moby/moby#47871](https://github.com/moby/moby/pull/47871)
  - For example `-p 80` will result in the same ephemeral port being allocated for `0.0.0.0` and `::`, and `-p 8080-8083:80` will pick the same port from the range for both address families.
  - Similarly, ports published to specific addresses will be allocated the same port. For example, `-p 127.0.0.1::80 -p '[::1]::80'`.
  - If no port is available on all required addresses, container creation will fail.
- Environment variable `DOCKER_ALLOW_IPV6_ON_IPV4_INTERFACE`, introduced in release 26.1.1, no longer has any effect. [moby/moby#47963](https://github.com/moby/moby/pull/47963)
  - If IPv6 could not be disabled on an interface because of a read-only `/proc/sys/net`, the environment variable allowed the container to start anyway.
  - In this release, if IPv4 cannot be disabled for an interface, IPv6 can be explicitly enabled for the network simply by using `--ipv6` when creating it. Other workarounds are to configure the OS to disable IPv6 by default on new interfaces, mount `/proc/sys/net` read-write, or use a kernel with no IPv6 support.
- For IPv6-enabled bridge networks, do not attempt to replace the bridge's kernel-assigned link local address with `fe80::1`. [moby/moby#47787](https://github.com/moby/moby/pull/47787)
@y
- A Unique Local Address (ULA) base prefix is automatically added to `default-address-pools` if this parameter wasn't manually configured, or if it contains no IPv6 prefixes. [moby/moby#47853](https://github.com/moby/moby/pull/47853)
  - Prior to this release, to create an IPv6-enabled network it was necessary to use the `--subnet` option to specify an IPv6 subnet, or add IPv6 ranges to `default-address-pools` in `daemon.json`.
  - Starting in this release, when a bridge network is created with `--ipv6` and no IPv6 subnet is defined by those options, an IPv6 Unique Local Address (ULA) base prefix is used.
  - The ULA prefix is derived from the Engine host ID such that it's unique across hosts and over time.
- IPv6 address pools of any size can now be added to `default-address-pools`. [moby/moby#47768](https://github.com/moby/moby/pull/47768)
- IPv6 can now be enabled by default on all custom bridge networks using `"default-network-opts": { "bridge": {"com.docker.network.enable_ipv6": "true"}}` in `daemon.json`, or `dockerd --default-network-opt=bridge=com.docker.network.enable_ipv6=true`on the comand line. [moby/moby#47867](https://github.com/moby/moby/pull/47867)
- Direct routing for IPv6 networks, with `ip6tables` enabled. [moby/moby#47871](https://github.com/moby/moby/pull/47871)
  - Added bridge driver option `com.docker.network.bridge.gateway_mode_ipv6=<nat|routed>`.
  - The default behavior, `nat`, is unchanged from previous releases running with `ip6tables` enabled. NAT and masquerading rules are set up for each published container port.
  - When set to `routed`, no NAT or masquerading rules are configured for published ports. This enables direct IPv6 access to the container, if the host's network can route packets for the container's address to the host. Published ports will be opened in the container's firewall.
  - When a port mapping only applies to `routed` mode, only addresses `0.0.0.0` or `::` are allowed and a host port must not be given.
  - Note that published container ports, in `nat` or `routed` mode, are accessible from any remote address if routing is set up in the network, unless the Docker host's firewall has additional restrictions. For example: `docker network create --ipv6 -o com.docker.network.bridge.gateway_mode_ipv6=routed mynet`.
  - The option `com.docker.network.bridge.gateway_mode_ipv4=<nat|routed>` is also available, with the same behavior but for IPv4.
- If firewalld is running on the host, Docker creates policy `docker-forwarding` to allow forwarding from any zone to the `docker` zone. This makes it possible to configure a bridge network with a routable IPv6 address, and no NAT or masquerading. [moby/moby#47745](https://github.com/moby/moby/pull/47745)
- When a port is published with no host port specified, or a host port range is given, the same port will be allocated for IPv4 and IPv6. [moby/moby#47871](https://github.com/moby/moby/pull/47871)
  - For example `-p 80` will result in the same ephemeral port being allocated for `0.0.0.0` and `::`, and `-p 8080-8083:80` will pick the same port from the range for both address families.
  - Similarly, ports published to specific addresses will be allocated the same port. For example, `-p 127.0.0.1::80 -p '[::1]::80'`.
  - If no port is available on all required addresses, container creation will fail.
- Environment variable `DOCKER_ALLOW_IPV6_ON_IPV4_INTERFACE`, introduced in release 26.1.1, no longer has any effect. [moby/moby#47963](https://github.com/moby/moby/pull/47963)
  - If IPv6 could not be disabled on an interface because of a read-only `/proc/sys/net`, the environment variable allowed the container to start anyway.
  - In this release, if IPv4 cannot be disabled for an interface, IPv6 can be explicitly enabled for the network simply by using `--ipv6` when creating it. Other workarounds are to configure the OS to disable IPv6 by default on new interfaces, mount `/proc/sys/net` read-write, or use a kernel with no IPv6 support.
- For IPv6-enabled bridge networks, do not attempt to replace the bridge's kernel-assigned link local address with `fe80::1`. [moby/moby#47787](https://github.com/moby/moby/pull/47787)
@z

@x
### Removed
@y
### Removed
@z

@x
- Deprecate experimental GraphDriver plugins. [moby/moby#48050](https://github.com/moby/moby/pull/48050), [docker/cli#5172](https://github.com/docker/cli/pull/5172)
- pkg/archive: deprecate `NewTempArchive` and `TempArchive`. These types were only used in tests and will be removed in the next release. [moby/moby#48002](https://github.com/moby/moby/pull/48002)
- pkg/archive: deprecate `CanonicalTarNameForPath` [moby/moby#48001](https://github.com/moby/moby/pull/48001)
- Deprecate pkg/dmesg. This package was no longer used, and will be removed in the next release. [moby/moby#47999](https://github.com/moby/moby/pull/47999)
- Deprecate `pkg/stringid.ValidateID` and `pkg/stringid.IsShortID` [moby/moby#47995](https://github.com/moby/moby/pull/47995)
- runconfig: deprecate `SetDefaultNetModeIfBlank` and move `ContainerConfigWrapper` to `api/types/container` [moby/moby#48007](https://github.com/moby/moby/pull/48007)
- runconfig: deprecate `DefaultDaemonNetworkMode` and move to `daemon/network` [moby/moby#48008](https://github.com/moby/moby/pull/48008)
- runconfig: deprecate `opts.ConvertKVStringsToMap`. This utility is no longer used, and will be removed in the next release. [moby/moby#48016](https://github.com/moby/moby/pull/48016)
- runconfig: deprecate `IsPreDefinedNetwork`. [moby/moby#48011](https://github.com/moby/moby/pull/48011)
@y
- Deprecate experimental GraphDriver plugins. [moby/moby#48050](https://github.com/moby/moby/pull/48050), [docker/cli#5172](https://github.com/docker/cli/pull/5172)
- pkg/archive: deprecate `NewTempArchive` and `TempArchive`. These types were only used in tests and will be removed in the next release. [moby/moby#48002](https://github.com/moby/moby/pull/48002)
- pkg/archive: deprecate `CanonicalTarNameForPath` [moby/moby#48001](https://github.com/moby/moby/pull/48001)
- Deprecate pkg/dmesg. This package was no longer used, and will be removed in the next release. [moby/moby#47999](https://github.com/moby/moby/pull/47999)
- Deprecate `pkg/stringid.ValidateID` and `pkg/stringid.IsShortID` [moby/moby#47995](https://github.com/moby/moby/pull/47995)
- runconfig: deprecate `SetDefaultNetModeIfBlank` and move `ContainerConfigWrapper` to `api/types/container` [moby/moby#48007](https://github.com/moby/moby/pull/48007)
- runconfig: deprecate `DefaultDaemonNetworkMode` and move to `daemon/network` [moby/moby#48008](https://github.com/moby/moby/pull/48008)
- runconfig: deprecate `opts.ConvertKVStringsToMap`. This utility is no longer used, and will be removed in the next release. [moby/moby#48016](https://github.com/moby/moby/pull/48016)
- runconfig: deprecate `IsPreDefinedNetwork`. [moby/moby#48011](https://github.com/moby/moby/pull/48011)
@z

@x
### API
@y
### API
@z

@x
- containerd image store: `POST /images/{name}/push` now supports a `platform` parameter (JSON encoded OCI Platform type) that allows selecting a specific platform-manifest from the multi-platform image. This is experimental and may change in future API versions. [moby/moby#47679](https://github.com/moby/moby/pull/47679)
- `POST /services/create` and `POST /services/{id}/update` now support `OomScoreAdj`. [moby/moby#47950](https://github.com/moby/moby/pull/47950)
- `ContainerList` api returns container annotations. [moby/moby#47866](https://github.com/moby/moby/pull/47866)
- `POST /containers/create` and `POST /services/create` now take `Options` as part of `HostConfig.Mounts.TmpfsOptions` allowing to set options for tmpfs mounts. [moby/moby#46809](https://github.com/moby/moby/pull/46809)
- The `Healthcheck.StartInterval` property is now correctly ignored when updating a Swarm service using API versions less than v1.44. [moby/moby#47991](https://github.com/moby/moby/pull/47991)
- `GET /events` now supports image `create` event that is emitted when a new image is built regardless if it was tagged or not.  [moby/moby#47929](https://github.com/moby/moby/pull/47929)
- `GET /info` now includes a `Containerd` field containing information about the location of the containerd API socket and containerd namespaces used by the daemon to run containers and plugins. [moby/moby#47239](https://github.com/moby/moby/pull/47239)
- Deprecate non-standard (config) fields in image inspect output. The `Config` field returned by this endpoint (used for `docker image inspect`) returned additional fields that are not part of the image's configuration and not part of the [Docker Image Spec] and the [OCI Image Spec]. These fields are never set (and always return the default value for the type), but are not omitted in the response when left empty. As these fields were not intended to be part of the image configuration response, they are deprecated, and will be removed in the future API versions.
- Deprecate the daemon flag `--api-cors-header` and the corresponding `daemon.json` configuration option. These will be removed in the next major release. [moby/moby#45313](https://github.com/moby/moby/pull/45313)
@y
- containerd image store: `POST /images/{name}/push` now supports a `platform` parameter (JSON encoded OCI Platform type) that allows selecting a specific platform-manifest from the multi-platform image. This is experimental and may change in future API versions. [moby/moby#47679](https://github.com/moby/moby/pull/47679)
- `POST /services/create` and `POST /services/{id}/update` now support `OomScoreAdj`. [moby/moby#47950](https://github.com/moby/moby/pull/47950)
- `ContainerList` api returns container annotations. [moby/moby#47866](https://github.com/moby/moby/pull/47866)
- `POST /containers/create` and `POST /services/create` now take `Options` as part of `HostConfig.Mounts.TmpfsOptions` allowing to set options for tmpfs mounts. [moby/moby#46809](https://github.com/moby/moby/pull/46809)
- The `Healthcheck.StartInterval` property is now correctly ignored when updating a Swarm service using API versions less than v1.44. [moby/moby#47991](https://github.com/moby/moby/pull/47991)
- `GET /events` now supports image `create` event that is emitted when a new image is built regardless if it was tagged or not.  [moby/moby#47929](https://github.com/moby/moby/pull/47929)
- `GET /info` now includes a `Containerd` field containing information about the location of the containerd API socket and containerd namespaces used by the daemon to run containers and plugins. [moby/moby#47239](https://github.com/moby/moby/pull/47239)
- Deprecate non-standard (config) fields in image inspect output. The `Config` field returned by this endpoint (used for `docker image inspect`) returned additional fields that are not part of the image's configuration and not part of the [Docker Image Spec] and the [OCI Image Spec]. These fields are never set (and always return the default value for the type), but are not omitted in the response when left empty. As these fields were not intended to be part of the image configuration response, they are deprecated, and will be removed in the future API versions.
- Deprecate the daemon flag `--api-cors-header` and the corresponding `daemon.json` configuration option. These will be removed in the next major release. [moby/moby#45313](https://github.com/moby/moby/pull/45313)
@z

@x
The following deprecated fields are currently included in the API response, but are not part of the underlying image's `Config`: [moby/moby#47941](https://github.com/moby/moby/pull/47941)
@y
The following deprecated fields are currently included in the API response, but are not part of the underlying image's `Config`: [moby/moby#47941](https://github.com/moby/moby/pull/47941)
@z

@x
- `Hostname`
- `Domainname`
- `AttachStdin`
- `AttachStdout`
- `AttachStderr`
- `Tty`
- `OpenStdin`
- `StdinOnce`
- `Image`
- `NetworkDisabled` (already omitted unless set)
- `MacAddress` (already omitted unless set)
- `StopTimeout` (already omitted unless set)
@y
- `Hostname`
- `Domainname`
- `AttachStdin`
- `AttachStdout`
- `AttachStderr`
- `Tty`
- `OpenStdin`
- `StdinOnce`
- `Image`
- `NetworkDisabled` (already omitted unless set)
- `MacAddress` (already omitted unless set)
- `StopTimeout` (already omitted unless set)
@z

@x
### Go SDK changes
@y
### Go SDK changes
@z

@x
- Client API callback for the following functions now require a context parameter. [moby/moby#47536](https://github.com/moby/moby/pull/47536)
  - `client.RequestPrivilegeFunc`
  - `client.ImageSearchOptions.AcceptPermissionsFunc`
  - `image.ImportOptions.PrivilegeFunc`
- Remove deprecated aliases for Image types. [moby/moby#47900](https://github.com/moby/moby/pull/47900)
  - `ImageImportOptions`
  - `ImageCreateOptions`
  - `ImagePullOptions`
  - `ImagePushOptions`
  - `ImageListOptions`
  - `ImageRemoveOptions`
- Introduce `Ulimit` type alias for `github.com/docker/go-units.Ulimit`.
  The `Ulimit` type as used in the API is defined in a Go module that will transition to a new location in future.
  A type alias is added to reduce the friction that comes with moving the type to a new location.
  The alias makes sure that existing code continues to work, but its definition may change in future.
  Users are recommended to use this alias instead of the `units.Ulimit` directly. [moby/moby#48023](https://github.com/moby/moby/pull/48023)
@y
- Client API callback for the following functions now require a context parameter. [moby/moby#47536](https://github.com/moby/moby/pull/47536)
  - `client.RequestPrivilegeFunc`
  - `client.ImageSearchOptions.AcceptPermissionsFunc`
  - `image.ImportOptions.PrivilegeFunc`
- Remove deprecated aliases for Image types. [moby/moby#47900](https://github.com/moby/moby/pull/47900)
  - `ImageImportOptions`
  - `ImageCreateOptions`
  - `ImagePullOptions`
  - `ImagePushOptions`
  - `ImageListOptions`
  - `ImageRemoveOptions`
- Introduce `Ulimit` type alias for `github.com/docker/go-units.Ulimit`.
  The `Ulimit` type as used in the API is defined in a Go module that will transition to a new location in future.
  A type alias is added to reduce the friction that comes with moving the type to a new location.
  The alias makes sure that existing code continues to work, but its definition may change in future.
  Users are recommended to use this alias instead of the `units.Ulimit` directly. [moby/moby#48023](https://github.com/moby/moby/pull/48023)
@z

@x
Move and rename types, changing their import paths and exported names.
[moby/moby#47936](https://github.com/moby/moby/pull/47936),
[moby/moby#47873](https://github.com/moby/moby/pull/47873),
[moby/moby#47887](https://github.com/moby/moby/pull/47887),
[moby/moby#47882](https://github.com/moby/moby/pull/47882),
[moby/moby#47921](https://github.com/moby/moby/pull/47921),
[moby/moby#48040](https://github.com/moby/moby/pull/48040)
@y
Move and rename types, changing their import paths and exported names.
[moby/moby#47936](https://github.com/moby/moby/pull/47936),
[moby/moby#47873](https://github.com/moby/moby/pull/47873),
[moby/moby#47887](https://github.com/moby/moby/pull/47887),
[moby/moby#47882](https://github.com/moby/moby/pull/47882),
[moby/moby#47921](https://github.com/moby/moby/pull/47921),
[moby/moby#48040](https://github.com/moby/moby/pull/48040)
@z

@x
- Move the following types to `api/types/container`:
  - `BlkioStatEntry`
  - `BlkioStats`
  - `CPUStats`
  - `CPUUsage`
  - `ContainerExecInspect`
  - `ContainerPathStat`
  - `ContainerStats`
  - `ContainersPruneReport`
  - `CopyToContainerOptions`
  - `ExecConfig`
  - `ExecStartCheck`
  - `MemoryStats`
  - `NetworkStats`
  - `PidsStats`
  - `StatsJSON`
  - `Stats`
  - `StorageStats`
  - `ThrottlingData`
- Move the following types to `api/types/image`:
  - `ImagesPruneReport`
  - `ImageImportSource`
  - `ImageLoadResponse`
- Move the `ExecStartOptions` type to `api/types/backend`.
- Move the `VolumesPruneReport` type to `api/types/volume`.
- Move the `EventsOptions` type to `api/types/events`.
- Move the `ImageSearchOptions` type to `api/types/registry`. 
- Drop `Network` prefix and move the following types to `api/types/network`:
  - `NetworkCreateResponse`
  - `NetworkConnect`
  - `NetworkDisconnect`
  - `NetworkInspectOptions`
  - `EndpointResource`
  - `NetworkListOptions`
  - `NetworkCreateOptions`
  - `NetworkCreateRequest`
  - `NetworksPruneReport`
- Move `NetworkResource` to `api/types/network`.
@y
- Move the following types to `api/types/container`:
  - `BlkioStatEntry`
  - `BlkioStats`
  - `CPUStats`
  - `CPUUsage`
  - `ContainerExecInspect`
  - `ContainerPathStat`
  - `ContainerStats`
  - `ContainersPruneReport`
  - `CopyToContainerOptions`
  - `ExecConfig`
  - `ExecStartCheck`
  - `MemoryStats`
  - `NetworkStats`
  - `PidsStats`
  - `StatsJSON`
  - `Stats`
  - `StorageStats`
  - `ThrottlingData`
- Move the following types to `api/types/image`:
  - `ImagesPruneReport`
  - `ImageImportSource`
  - `ImageLoadResponse`
- Move the `ExecStartOptions` type to `api/types/backend`.
- Move the `VolumesPruneReport` type to `api/types/volume`.
- Move the `EventsOptions` type to `api/types/events`.
- Move the `ImageSearchOptions` type to `api/types/registry`. 
- Drop `Network` prefix and move the following types to `api/types/network`:
  - `NetworkCreateResponse`
  - `NetworkConnect`
  - `NetworkDisconnect`
  - `NetworkInspectOptions`
  - `EndpointResource`
  - `NetworkListOptions`
  - `NetworkCreateOptions`
  - `NetworkCreateRequest`
  - `NetworksPruneReport`
- Move `NetworkResource` to `api/types/network`.
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Update Buildx to [v0.15.1](https://github.com/docker/buildx/releases/tag/v0.15.1). [docker/docker-ce-packaging#1029](https://github.com/docker/docker-ce-packaging/pull/1029)
- Update BuildKit to [v0.14.1](https://github.com/moby/buildkit/releases/tag/v0.14.1). [moby/moby#48028](https://github.com/moby/moby/pull/48028)
- Update runc to [v1.1.13](https://github.com/opencontainers/runc/releases/tag/v1.1.13) [moby/moby#47976](https://github.com/moby/moby/pull/47976)
- Update Compose to [v2.28.1](https://github.com/docker/compose/releases/tag/v2.28.1). [moby/docker-ce-packaging#1032](https://github.com/docker/docker-ce-packaging/pull/1032)
@y
- Update Buildx to [v0.15.1](https://github.com/docker/buildx/releases/tag/v0.15.1). [docker/docker-ce-packaging#1029](https://github.com/docker/docker-ce-packaging/pull/1029)
- Update BuildKit to [v0.14.1](https://github.com/moby/buildkit/releases/tag/v0.14.1). [moby/moby#48028](https://github.com/moby/moby/pull/48028)
- Update runc to [v1.1.13](https://github.com/opencontainers/runc/releases/tag/v1.1.13) [moby/moby#47976](https://github.com/moby/moby/pull/47976)
- Update Compose to [v2.28.1](https://github.com/docker/compose/releases/tag/v2.28.1). [moby/docker-ce-packaging#1032](https://github.com/docker/docker-ce-packaging/pull/1032)
@z

@x
[Docker image spec]: https://github.com/moby/docker-image-spec/blob/v1.3.1/specs-go/v1/image.go#L19-L32
[OCI Image Spec]: https://github.com/opencontainers/image-spec/blob/v1.1.0/specs-go/v1/config.go#L24-L62
@y
[Docker image spec]: https://github.com/moby/docker-image-spec/blob/v1.3.1/specs-go/v1/image.go#L19-L32
[OCI Image Spec]: https://github.com/opencontainers/image-spec/blob/v1.1.0/specs-go/v1/config.go#L24-L62
@z

@x
## 27.0.0
@y
## 27.0.0
@z

@x
There's no 27.0.0 release due to a mistake during the pre-release of 27.0.0-rc.1 on GitHub which resulted in the v27.0.0 tag being created.
Unfortunately the tag was already picked up by the [Go Module Mirror](https://sum.golang.org) so it's not possible to cleanly change the v27.0.0.
To workaround this, the 27.0.1 will be the first release of the 27.0.
@y
There's no 27.0.0 release due to a mistake during the pre-release of 27.0.0-rc.1 on GitHub which resulted in the v27.0.0 tag being created.
Unfortunately the tag was already picked up by the [Go Module Mirror](https://sum.golang.org) so it's not possible to cleanly change the v27.0.0.
To workaround this, the 27.0.1 will be the first release of the 27.0.
@z
