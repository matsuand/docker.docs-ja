%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Engine 25.0 release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
toc_min: 1
toc_max: 2
skip_read_time: true
aliases:
- /engine/release-notes/
- /engine/release-notes/latest/
- /release-notes/docker-ce/
- /release-notes/docker-engine/
---
@y
---
title: Docker Engine 25.0 release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
toc_min: 1
toc_max: 2
skip_read_time: true
aliases:
- /engine/release-notes/
- /engine/release-notes/latest/
- /release-notes/docker-ce/
- /release-notes/docker-engine/
---
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 25.0.
@y
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 25.0.
@z

@x
For more information about:
@y
For more information about:
@z

@x
- Deprecated and removed features, see [Deprecated Engine Features](../deprecated.md).
- Changes to the Engine API, see [Engine API version history](../api/version-history.md).
@y
- Deprecated and removed features, see [Deprecated Engine Features](../deprecated.md).
- Changes to the Engine API, see [Engine API version history](../api/version-history.md).
@z

@x
## 25.0.1
@y
## 25.0.1
@z

@x
{{< release-date date="2024-01-23" >}}
@y
{{< release-date date="2024-01-23" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 25.0.1 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A25.0.1)
- [moby/moby, 25.0.1 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A25.0.1)
@y
- [docker/cli, 25.0.1 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A25.0.1)
- [moby/moby, 25.0.1 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A25.0.1)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- API: Fix incorrect HTTP status code for containers with an invalid network configuration created before upgrading to Docker Engine v25.0. [moby/moby#47159](https://github.com/moby/moby/pull/47159)
- Ensure that a MAC address based on a container's IP address is re-generated when the container is stopped and restarted, in case the generated IP/MAC addresses have been reused. [moby/moby#47171](https://github.com/moby/moby/pull/47171)
- Fix `host-gateway-ip` not working during build when not set through configuration. [moby/moby#47192](https://github.com/moby/moby/pull/47192)
- Fix a bug that prevented a container from being renamed twice. [moby/moby#47196](https://github.com/moby/moby/pull/47196)
- Fix an issue causing containers to have their short ID added to their network alias when inspecting them. [moby/moby#47182](https://github.com/moby/moby/pull/47182)
- Fix an issue in detecting whether a remote build context is a Git repository. [moby/moby#47136](https://github.com/moby/moby/pull/47136)
- Fix an issue with layers order in OCI manifests. [moby/moby#47150](https://github.com/moby/moby/issues/47150)
- Fix volume mount error when passing an `addr` or `ip` mount option. [moby/moby#47185](https://github.com/moby/moby/pull/47185)
- Improve error message related to extended attributes that can't be set due to improperly namespaced attribute names. [moby/moby#47178](https://github.com/moby/moby/pull/47178)
- Swarm: Fixed `start_interval` not being passed to the container config. [moby/moby#47163](https://github.com/moby/moby/pull/47163)
@y
- API: Fix incorrect HTTP status code for containers with an invalid network configuration created before upgrading to Docker Engine v25.0. [moby/moby#47159](https://github.com/moby/moby/pull/47159)
- Ensure that a MAC address based on a container's IP address is re-generated when the container is stopped and restarted, in case the generated IP/MAC addresses have been reused. [moby/moby#47171](https://github.com/moby/moby/pull/47171)
- Fix `host-gateway-ip` not working during build when not set through configuration. [moby/moby#47192](https://github.com/moby/moby/pull/47192)
- Fix a bug that prevented a container from being renamed twice. [moby/moby#47196](https://github.com/moby/moby/pull/47196)
- Fix an issue causing containers to have their short ID added to their network alias when inspecting them. [moby/moby#47182](https://github.com/moby/moby/pull/47182)
- Fix an issue in detecting whether a remote build context is a Git repository. [moby/moby#47136](https://github.com/moby/moby/pull/47136)
- Fix an issue with layers order in OCI manifests. [moby/moby#47150](https://github.com/moby/moby/issues/47150)
- Fix volume mount error when passing an `addr` or `ip` mount option. [moby/moby#47185](https://github.com/moby/moby/pull/47185)
- Improve error message related to extended attributes that can't be set due to improperly namespaced attribute names. [moby/moby#47178](https://github.com/moby/moby/pull/47178)
- Swarm: Fixed `start_interval` not being passed to the container config. [moby/moby#47163](https://github.com/moby/moby/pull/47163)
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Upgrade Compose to `2.24.2`. [docker/docker-ce-packaging#981](https://github.com/docker/docker-ce-packaging/pull/981)
@y
- Upgrade Compose to `2.24.2`. [docker/docker-ce-packaging#981](https://github.com/docker/docker-ce-packaging/pull/981)
@z

@x
## 25.0.0
@y
## 25.0.0
@z

@x
{{< release-date date="2024-01-19" >}}
@y
{{< release-date date="2024-01-19" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 25.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A25.0.0)
- [moby/moby, 25.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A25.0.0)
@y
- [docker/cli, 25.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A25.0.0)
- [moby/moby, 25.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A25.0.0)
@z

@x
> **Note**
>
> In earlier versions of Docker Engine, recursive mounts (submounts) would
> always be mounted as writable, even when specifying a read-only mount. This
> behavior has changed in v25.0.0, for hosts running on kernel version 5.12 or
> later. Now, read-only bind mounts are **recursively read-only** by default.
>
> To get the same behavior as earlier releases, you can specify the
> `bind-recursive` option for the `--mount` flag.
>
> ```console
> $ docker run --mount type=bind,src=SRC,dst=DST,readonly,bind-recursive=writable IMAGE
> ```
>
> This option isn't supported with the `-v` or `--volume` flag.
> For more information, see
> [Recursive mounts](../../storage/bind-mounts.md#recursive-mounts).
@y
> **Note**
>
> In earlier versions of Docker Engine, recursive mounts (submounts) would
> always be mounted as writable, even when specifying a read-only mount. This
> behavior has changed in v25.0.0, for hosts running on kernel version 5.12 or
> later. Now, read-only bind mounts are **recursively read-only** by default.
>
> To get the same behavior as earlier releases, you can specify the
> `bind-recursive` option for the `--mount` flag.
>
> ```console
> $ docker run --mount type=bind,src=SRC,dst=DST,readonly,bind-recursive=writable IMAGE
> ```
>
> This option isn't supported with the `-v` or `--volume` flag.
> For more information, see
> [Recursive mounts](../../storage/bind-mounts.md#recursive-mounts).
@z

@x
### New
@y
### New
@z

@x
- The daemon now uses systemd's default `LimitNOFILE`. In earlier versions of
  Docker Engine, this limit was set to `infinity`. This would cause issues with
  recent versions of systemd, where the hard limit was increased, causing
  programs that adjusted their behaviors based on ulimits to consume a high
  amount of memory. [moby/moby#45534](https://github.com/moby/moby/pull/45534)
@y
- The daemon now uses systemd's default `LimitNOFILE`. In earlier versions of
  Docker Engine, this limit was set to `infinity`. This would cause issues with
  recent versions of systemd, where the hard limit was increased, causing
  programs that adjusted their behaviors based on ulimits to consume a high
  amount of memory. [moby/moby#45534](https://github.com/moby/moby/pull/45534)
@z

@x
  The new setting makes containers behave the same way as programs running on
  the host, but may cause programs that make incorrect assumptions based on the
  soft limit to misbehave. To get the previous behavior, you can set
  `LimitNOFILE=1048576`.
@y
  The new setting makes containers behave the same way as programs running on
  the host, but may cause programs that make incorrect assumptions based on the
  soft limit to misbehave. To get the previous behavior, you can set
  `LimitNOFILE=1048576`.
@z

@x
  This change currently only affects build containers created with `docker
  build` when using BuildKit with the `docker` driver. Future versions of
  containerd will also use this limit, which will cause this behavior to affect
  all containers, not only build containers.
@y
  This change currently only affects build containers created with `docker
  build` when using BuildKit with the `docker` driver. Future versions of
  containerd will also use this limit, which will cause this behavior to affect
  all containers, not only build containers.
@z

@x
  If you're experiencing issues with the higher ulimit in systemd v240 or later,
  consider adding a system `drop-in` or `override` file to configure the ulimit
  settings for your setup. The [Flatcar Container Linux documentation](https://www.flatcar.org/docs/latest/setup/systemd/drop-in-units/)
  has a great article covering this topic in detail.
@y
  If you're experiencing issues with the higher ulimit in systemd v240 or later,
  consider adding a system `drop-in` or `override` file to configure the ulimit
  settings for your setup. The [Flatcar Container Linux documentation](https://www.flatcar.org/docs/latest/setup/systemd/drop-in-units/)
  has a great article covering this topic in detail.
@z

@x
- Add OpenTelemetry tracing. [moby/moby#45652](https://github.com/moby/moby/pull/45652), [moby/moby#45579](https://github.com/moby/moby/pull/45579)
- Add support for CDI devices under Linux. [moby/moby#45134](https://github.com/moby/moby/pull/45134), [docker/cli#4510](https://github.com/docker/cli/pull/4510), [moby/moby#46004](https://github.com/moby/moby/pull/46004)
- Add an additional interval to be used by healthchecks during the container start period. [moby/moby#40894](https://github.com/moby/moby/pull/40894), [docker/cli#4405](https://github.com/docker/cli/pull/4405), [moby/moby#45965](https://github.com/moby/moby/pull/45965)
- Add a `--log-format` flag to `dockerd` to control the logging format: text (default) or JSON. [moby/moby#45737](https://github.com/moby/moby/pull/45737)
- Add support for recursive read-only mounts. [moby/moby#45278](https://github.com/moby/moby/pull/45278), [moby/moby#46037](https://github.com/moby/moby/pull/46037)
- Add support for filtering images based on timestamp with `docker image ls --filter=until=<timestamp>`. [moby/moby#46577](https://github.com/moby/moby/pull/46577)
@y
- Add OpenTelemetry tracing. [moby/moby#45652](https://github.com/moby/moby/pull/45652), [moby/moby#45579](https://github.com/moby/moby/pull/45579)
- Add support for CDI devices under Linux. [moby/moby#45134](https://github.com/moby/moby/pull/45134), [docker/cli#4510](https://github.com/docker/cli/pull/4510), [moby/moby#46004](https://github.com/moby/moby/pull/46004)
- Add an additional interval to be used by healthchecks during the container start period. [moby/moby#40894](https://github.com/moby/moby/pull/40894), [docker/cli#4405](https://github.com/docker/cli/pull/4405), [moby/moby#45965](https://github.com/moby/moby/pull/45965)
- Add a `--log-format` flag to `dockerd` to control the logging format: text (default) or JSON. [moby/moby#45737](https://github.com/moby/moby/pull/45737)
- Add support for recursive read-only mounts. [moby/moby#45278](https://github.com/moby/moby/pull/45278), [moby/moby#46037](https://github.com/moby/moby/pull/46037)
- Add support for filtering images based on timestamp with `docker image ls --filter=until=<timestamp>`. [moby/moby#46577](https://github.com/moby/moby/pull/46577)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- API: Fix error message for invalid policies at `ValidateRestartPolicy`. [moby/moby#46352](https://github.com/moby/moby/pull/46352)
- API: Update `/info` endpoint to use singleflight. [moby/moby#45847](https://github.com/moby/moby/pull/45847)
- Add an error message for when specifying a Dockerfile filename with `-f`, and also using `stdin`. [docker/cli#4346](https://github.com/docker/cli/pull/4346)
- Add support for `mac-address` and `link-local-ip` fields in `--network` long format. [docker/cli#4419](https://github.com/docker/cli/pull/4419)
- Add support for specifying multiple `--network` flags with `docker container create` and `docker run`. [moby/moby#45906](https://github.com/moby/moby/pull/45906)
- Automatically enable IPv6 on a network when an IPv6 subnet is specified. [moby/moby#46455](https://github.com/moby/moby/pull/46455)
- Add support for overlay networks over IPv6 transport. [moby/moby#46790](https://github.com/moby/moby/pull/46790)
- Configuration reloading is now more robust: if there's an error during the configuration reload process, no configuration changes are applied. [moby/moby#43980](https://github.com/moby/moby/pull/43980)
- Live restore: Containers with auto remove (`docker run --rm`) are no longer forcibly removed on engine restart. [moby/moby#46857](https://github.com/moby/moby/pull/46857)
- Live restore: containers that are live-restored will now be given another health-check start period when the daemon restarts. [moby/moby#47051](https://github.com/moby/moby/pull/47051)
- Container health status is flushed to disk less frequently, reducing wear on flash storage. [moby/moby#47044](https://github.com/moby/moby/pull/47044)
- Ensure network names are unique. [moby/moby#46251](https://github.com/moby/moby/pull/46251)
- Ensure that overlay2 layer metadata is correct. [moby/moby#46471](https://github.com/moby/moby/pull/46471)
- Fix `Downloading` progress message on image pull. [moby/moby#46515](https://github.com/moby/moby/pull/46515)
- Fix `NetworkConnect` and `ContainerCreate` with improved data validation, and return all validation errors at once. [moby/moby#46183](https://github.com/moby/moby/pull/46183)
- Fix `com.docker.network.host_ipv4` option when IPv6 and ip6tables are enabled. [moby/moby#46446](https://github.com/moby/moby/pull/46446)
- Fix daemon's `cleanupContainer` if containerd is stopped. [moby/moby#46213](https://github.com/moby/moby/pull/46213)
- Fix returning incorrect HTTP status codes for libnetwork errors. [moby/moby#46146](https://github.com/moby/moby/pull/46146)
- Fix various issues with images/json API filters and image list. [moby/moby#46034](https://github.com/moby/moby/pull/46034)
- CIFS volumes now resolves FQDN correctly. [moby/moby#46863](https://github.com/moby/moby/pull/46863)
- Improve validation of the `userland-proxy-path` daemon configuration option. Validation now happens during daemon startup, instead of producing an error when starting a container with port-mapping. [moby/moby#47000](https://github.com/moby/moby/pull/47000)
- Set the MAC address of container's interface when network mode is a short network ID. [moby/moby#46406](https://github.com/moby/moby/pull/46406)
- Sort unconsumed build arguments before display in build output. [moby/moby#45917](https://github.com/moby/moby/pull/45917)
- The `docker image save` tarball output is now OCI compliant. [moby/moby#44598](https://github.com/moby/moby/pull/44598)
- The daemon no longer appends `ACCEPT` rules to the end of the `INPUT` iptables chain for encrypted overlay networks. Depending on firewall configuration, a rule may be needed to permit incoming encrypted overlay network traffic. [moby/moby#45280](https://github.com/moby/moby/pull/45280)
- Unpacking layers with extended attributes onto an incompatible filesystem will now fail instead of silently discarding extended attributes. [moby/moby#45464](https://github.com/moby/moby/pull/45464)
- Update daemon MTU option to BridgeConfig and display warning on Windows. [moby/moby#45887](https://github.com/moby/moby/pull/45887)
- Validate IPAM config when creating a network. Automatically fix networks created prior to this release where `--ip-range` is larger than `--subnet`. [moby/moby#45759](https://github.com/moby/moby/pull/45759)
- Containers connected only to internal networks will now have no default route set, making the `connect` syscall fail-fast. [moby/moby#46603](https://github.com/moby/moby/pull/46603)
- containerd image store: Add image events for `push`, `pull`, and `save`. [moby/moby#46405](https://github.com/moby/moby/pull/46405)
- containerd image store: Add support for pulling legacy schema1 images. [moby/moby#46513](https://github.com/moby/moby/pull/46513)
- containerd image store: Add support for pushing all tags. [moby/moby#46485](https://github.com/moby/moby/pull/46485)
- containerd image store: Add support for registry token. [moby/moby#46475](https://github.com/moby/moby/pull/46475)
- containerd image store: Add support for showing the number of containers that use an image. [moby/moby#46511](https://github.com/moby/moby/pull/46511)
- containerd image store: Fix a bug related to the `ONBUILD`, `MAINTAINER`, and `HEALTHCHECK` Dockerfile instructions. [moby/moby#46313](https://github.com/moby/moby/pull/46313)
- containerd image store: Fix `Pulling from` progress message. [moby/moby#46494](https://github.com/moby/moby/pull/46494)
- containerd image store: Add support for referencing images via the truncated ID with `sha256:` prefix. [moby/moby#46435](https://github.com/moby/moby/pull/46435)
- containerd image store: Fix `docker images` showing intermediate layers by default. [moby/moby#46423](https://github.com/moby/moby/pull/46423)
- containerd image store: Fix checking if the specified platform exists when getting an image. [moby/moby#46495](https://github.com/moby/moby/pull/46495)
- containerd image store: Fix errors when multiple `ADD` or `COPY` instructions were used with the classic builder. [moby/moby#46383](https://github.com/moby/moby/pull/46383)
- containerd image store: Fix stack overflow errors when importing an image. [moby/moby#46418](https://github.com/moby/moby/pull/46418)
- containerd image store: Improve `docker pull` progress output. [moby/moby#46412](https://github.com/moby/moby/pull/46412)
- containerd image store: Print the tag, digest, and size after pushing an image. [moby/moby#46384](https://github.com/moby/moby/pull/46384)
- containerd image store: Remove panic from `UpdateConfig`. [moby/moby#46433](https://github.com/moby/moby/pull/46433)
- containerd image store: Return an error when an image tag resembles a digest. [moby/moby#46492](https://github.com/moby/moby/pull/46492)
- containerd image store: `docker image ls` now shows the correct image creation time and date. [moby/moby#46719](https://github.com/moby/moby/pull/46719)
- containerd image store: Fix an issue handling user namespace settings. [moby/moby#46375](https://github.com/moby/moby/pull/46375)
- containerd image store: Add support for pulling all tags (`docker pull -a`). [moby/moby#46618](https://github.com/moby/moby/pull/46618)
- containerd image store: Use the domain name in the image reference as the default registry authentication domain. [moby/moby#46779](https://github.com/moby/moby/pull/46779)
@y
- API: Fix error message for invalid policies at `ValidateRestartPolicy`. [moby/moby#46352](https://github.com/moby/moby/pull/46352)
- API: Update `/info` endpoint to use singleflight. [moby/moby#45847](https://github.com/moby/moby/pull/45847)
- Add an error message for when specifying a Dockerfile filename with `-f`, and also using `stdin`. [docker/cli#4346](https://github.com/docker/cli/pull/4346)
- Add support for `mac-address` and `link-local-ip` fields in `--network` long format. [docker/cli#4419](https://github.com/docker/cli/pull/4419)
- Add support for specifying multiple `--network` flags with `docker container create` and `docker run`. [moby/moby#45906](https://github.com/moby/moby/pull/45906)
- Automatically enable IPv6 on a network when an IPv6 subnet is specified. [moby/moby#46455](https://github.com/moby/moby/pull/46455)
- Add support for overlay networks over IPv6 transport. [moby/moby#46790](https://github.com/moby/moby/pull/46790)
- Configuration reloading is now more robust: if there's an error during the configuration reload process, no configuration changes are applied. [moby/moby#43980](https://github.com/moby/moby/pull/43980)
- Live restore: Containers with auto remove (`docker run --rm`) are no longer forcibly removed on engine restart. [moby/moby#46857](https://github.com/moby/moby/pull/46857)
- Live restore: containers that are live-restored will now be given another health-check start period when the daemon restarts. [moby/moby#47051](https://github.com/moby/moby/pull/47051)
- Container health status is flushed to disk less frequently, reducing wear on flash storage. [moby/moby#47044](https://github.com/moby/moby/pull/47044)
- Ensure network names are unique. [moby/moby#46251](https://github.com/moby/moby/pull/46251)
- Ensure that overlay2 layer metadata is correct. [moby/moby#46471](https://github.com/moby/moby/pull/46471)
- Fix `Downloading` progress message on image pull. [moby/moby#46515](https://github.com/moby/moby/pull/46515)
- Fix `NetworkConnect` and `ContainerCreate` with improved data validation, and return all validation errors at once. [moby/moby#46183](https://github.com/moby/moby/pull/46183)
- Fix `com.docker.network.host_ipv4` option when IPv6 and ip6tables are enabled. [moby/moby#46446](https://github.com/moby/moby/pull/46446)
- Fix daemon's `cleanupContainer` if containerd is stopped. [moby/moby#46213](https://github.com/moby/moby/pull/46213)
- Fix returning incorrect HTTP status codes for libnetwork errors. [moby/moby#46146](https://github.com/moby/moby/pull/46146)
- Fix various issues with images/json API filters and image list. [moby/moby#46034](https://github.com/moby/moby/pull/46034)
- CIFS volumes now resolves FQDN correctly. [moby/moby#46863](https://github.com/moby/moby/pull/46863)
- Improve validation of the `userland-proxy-path` daemon configuration option. Validation now happens during daemon startup, instead of producing an error when starting a container with port-mapping. [moby/moby#47000](https://github.com/moby/moby/pull/47000)
- Set the MAC address of container's interface when network mode is a short network ID. [moby/moby#46406](https://github.com/moby/moby/pull/46406)
- Sort unconsumed build arguments before display in build output. [moby/moby#45917](https://github.com/moby/moby/pull/45917)
- The `docker image save` tarball output is now OCI compliant. [moby/moby#44598](https://github.com/moby/moby/pull/44598)
- The daemon no longer appends `ACCEPT` rules to the end of the `INPUT` iptables chain for encrypted overlay networks. Depending on firewall configuration, a rule may be needed to permit incoming encrypted overlay network traffic. [moby/moby#45280](https://github.com/moby/moby/pull/45280)
- Unpacking layers with extended attributes onto an incompatible filesystem will now fail instead of silently discarding extended attributes. [moby/moby#45464](https://github.com/moby/moby/pull/45464)
- Update daemon MTU option to BridgeConfig and display warning on Windows. [moby/moby#45887](https://github.com/moby/moby/pull/45887)
- Validate IPAM config when creating a network. Automatically fix networks created prior to this release where `--ip-range` is larger than `--subnet`. [moby/moby#45759](https://github.com/moby/moby/pull/45759)
- Containers connected only to internal networks will now have no default route set, making the `connect` syscall fail-fast. [moby/moby#46603](https://github.com/moby/moby/pull/46603)
- containerd image store: Add image events for `push`, `pull`, and `save`. [moby/moby#46405](https://github.com/moby/moby/pull/46405)
- containerd image store: Add support for pulling legacy schema1 images. [moby/moby#46513](https://github.com/moby/moby/pull/46513)
- containerd image store: Add support for pushing all tags. [moby/moby#46485](https://github.com/moby/moby/pull/46485)
- containerd image store: Add support for registry token. [moby/moby#46475](https://github.com/moby/moby/pull/46475)
- containerd image store: Add support for showing the number of containers that use an image. [moby/moby#46511](https://github.com/moby/moby/pull/46511)
- containerd image store: Fix a bug related to the `ONBUILD`, `MAINTAINER`, and `HEALTHCHECK` Dockerfile instructions. [moby/moby#46313](https://github.com/moby/moby/pull/46313)
- containerd image store: Fix `Pulling from` progress message. [moby/moby#46494](https://github.com/moby/moby/pull/46494)
- containerd image store: Add support for referencing images via the truncated ID with `sha256:` prefix. [moby/moby#46435](https://github.com/moby/moby/pull/46435)
- containerd image store: Fix `docker images` showing intermediate layers by default. [moby/moby#46423](https://github.com/moby/moby/pull/46423)
- containerd image store: Fix checking if the specified platform exists when getting an image. [moby/moby#46495](https://github.com/moby/moby/pull/46495)
- containerd image store: Fix errors when multiple `ADD` or `COPY` instructions were used with the classic builder. [moby/moby#46383](https://github.com/moby/moby/pull/46383)
- containerd image store: Fix stack overflow errors when importing an image. [moby/moby#46418](https://github.com/moby/moby/pull/46418)
- containerd image store: Improve `docker pull` progress output. [moby/moby#46412](https://github.com/moby/moby/pull/46412)
- containerd image store: Print the tag, digest, and size after pushing an image. [moby/moby#46384](https://github.com/moby/moby/pull/46384)
- containerd image store: Remove panic from `UpdateConfig`. [moby/moby#46433](https://github.com/moby/moby/pull/46433)
- containerd image store: Return an error when an image tag resembles a digest. [moby/moby#46492](https://github.com/moby/moby/pull/46492)
- containerd image store: `docker image ls` now shows the correct image creation time and date. [moby/moby#46719](https://github.com/moby/moby/pull/46719)
- containerd image store: Fix an issue handling user namespace settings. [moby/moby#46375](https://github.com/moby/moby/pull/46375)
- containerd image store: Add support for pulling all tags (`docker pull -a`). [moby/moby#46618](https://github.com/moby/moby/pull/46618)
- containerd image store: Use the domain name in the image reference as the default registry authentication domain. [moby/moby#46779](https://github.com/moby/moby/pull/46779)
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Upgrade API to v1.44. [moby/moby#45468](https://github.com/moby/moby/pull/45468)
- Upgrade Compose to `2.24.1`. [docker/docker-ce-packaging#980](https://github.com/docker/docker-ce-packaging/pull/980)
- Upgrade containerd to v1.7.12 (static binaries only). [moby/moby#47070](https://github.com/moby/moby/pull/47070)
- Upgrade Go runtime to [1.21.6](https://go.dev/doc/devel/release#go1.21.minor). [moby/moby#47053](https://github.com/moby/moby/pull/47053)
- Upgrade runc to v1.1.11. [moby/moby#47007](https://github.com/moby/moby/pull/47007)
- Upgrade BuildKit to v0.12.4. [moby/moby#46882](https://github.com/moby/moby/pull/46882)
- Upgrade Buildx to v0.12.1. [docker/docker-ce-packaging#979](https://github.com/docker/docker-ce-packaging/pull/979)
@y
- Upgrade API to v1.44. [moby/moby#45468](https://github.com/moby/moby/pull/45468)
- Upgrade Compose to `2.24.1`. [docker/docker-ce-packaging#980](https://github.com/docker/docker-ce-packaging/pull/980)
- Upgrade containerd to v1.7.12 (static binaries only). [moby/moby#47070](https://github.com/moby/moby/pull/47070)
- Upgrade Go runtime to [1.21.6](https://go.dev/doc/devel/release#go1.21.minor). [moby/moby#47053](https://github.com/moby/moby/pull/47053)
- Upgrade runc to v1.1.11. [moby/moby#47007](https://github.com/moby/moby/pull/47007)
- Upgrade BuildKit to v0.12.4. [moby/moby#46882](https://github.com/moby/moby/pull/46882)
- Upgrade Buildx to v0.12.1. [docker/docker-ce-packaging#979](https://github.com/docker/docker-ce-packaging/pull/979)
@z

@x
### Removed
@y
### Removed
@z

@x
- API: Remove VirtualSize field for the `GET /images/json` and `GET /images/{id}/json` endpoints. [moby/moby#45469](https://github.com/moby/moby/pull/45469)
- Remove deprecated `devicemapper` storage driver. [moby/moby#43637](https://github.com/moby/moby/pull/43637)
- Remove deprecated orchestrator options. [docker/cli#4366](https://github.com/docker/cli/pull/4366)
- Remove support for Debian Upstart init system. [moby/moby#45548](https://github.com/moby/moby/pull/45548), [moby/moby#45551](https://github.com/moby/moby/pull/45551)
- Remove the `--oom-score-adjust` daemon option. [moby/moby#45484](https://github.com/moby/moby/pull/45484)
- Remove warning for deprecated `~/.dockercfg` file. [docker/cli#4281](https://github.com/docker/cli/pull/4281)
- Remove `logentries` logging driver. [moby/moby#46925](https://github.com/moby/moby/pull/46925)
@y
- API: Remove VirtualSize field for the `GET /images/json` and `GET /images/{id}/json` endpoints. [moby/moby#45469](https://github.com/moby/moby/pull/45469)
- Remove deprecated `devicemapper` storage driver. [moby/moby#43637](https://github.com/moby/moby/pull/43637)
- Remove deprecated orchestrator options. [docker/cli#4366](https://github.com/docker/cli/pull/4366)
- Remove support for Debian Upstart init system. [moby/moby#45548](https://github.com/moby/moby/pull/45548), [moby/moby#45551](https://github.com/moby/moby/pull/45551)
- Remove the `--oom-score-adjust` daemon option. [moby/moby#45484](https://github.com/moby/moby/pull/45484)
- Remove warning for deprecated `~/.dockercfg` file. [docker/cli#4281](https://github.com/docker/cli/pull/4281)
- Remove `logentries` logging driver. [moby/moby#46925](https://github.com/moby/moby/pull/46925)
@z

@x
### Deprecated
@y
### Deprecated
@z

@x
- Deprecate API versions older than 1.24. [Deprecation notice](../deprecated.md#deprecate-legacy-api-versions)
- Deprecate `IsAutomated` field and `is-automated` filter for `docker search`. [Deprecation notice](../deprecated.md#isautomated-field-and-is-automated-filter-on-docker-search)
- API: Deprecate `Container` and `ContainerConfig` properties for `/images/{id}/json` (`docker image inspect`). [moby/moby#46939](https://github.com/moby/moby/pull/46939)
@y
- Deprecate API versions older than 1.24. [Deprecation notice](../deprecated.md#deprecate-legacy-api-versions)
- Deprecate `IsAutomated` field and `is-automated` filter for `docker search`. [Deprecation notice](../deprecated.md#isautomated-field-and-is-automated-filter-on-docker-search)
- API: Deprecate `Container` and `ContainerConfig` properties for `/images/{id}/json` (`docker image inspect`). [moby/moby#46939](https://github.com/moby/moby/pull/46939)
@z

@x
### Known limitations
@y
### Known limitations
@z

@x
#### Extended attributes for tar files
@y
#### Extended attributes for tar files
@z

@x
In this release, the code that handles `tar` archives was changed to be more
strict and to produce an error when failing to write extended attributes
(`xattr`). The `tar` implementation for macOS generates additional extended
attributes by default when creating tar files. These attribute prefixes aren't
valid Linux `xattr` namespace prefixes, which causes an error when Docker
attempts to process these files. For example, if you try to use a tar file with
an `ADD` Dockerfile instruction, you might see an error message similar to the
following:
@y
In this release, the code that handles `tar` archives was changed to be more
strict and to produce an error when failing to write extended attributes
(`xattr`). The `tar` implementation for macOS generates additional extended
attributes by default when creating tar files. These attribute prefixes aren't
valid Linux `xattr` namespace prefixes, which causes an error when Docker
attempts to process these files. For example, if you try to use a tar file with
an `ADD` Dockerfile instruction, you might see an error message similar to the
following:
@z

@x
```text
failed to solve: lsetxattr /sftp_key.ppk: operation not supported
```
@y
```text
failed to solve: lsetxattr /sftp_key.ppk: operation not supported
```
@z

@x
Error messages related to extended attribute validation were improved to
include more context in [v25.0.1](#2501), but the limitation in Docker being
unable to process the files remains. Tar files created with the macOS `tar`
using default arguments will produce an error when the tar file is used with
Docker.
@y
Error messages related to extended attribute validation were improved to
include more context in [v25.0.1](#2501), but the limitation in Docker being
unable to process the files remains. Tar files created with the macOS `tar`
using default arguments will produce an error when the tar file is used with
Docker.
@z

@x
As a workaround, if you need to use tar files with Docker generated on macOS,
you can either:
@y
As a workaround, if you need to use tar files with Docker generated on macOS,
you can either:
@z

@x
- Use the `--no-xattr` flag for the macOS `tar` command to strip **all** the
  extended attributes. If you want to preserve extended attributes, this isn't
  a recommended option.
- Install and use `gnu-tar` to create the tarballs on macOS instead of the
  default `tar` implementation. To install `gnu-tar` using Homebrew:
@y
- Use the `--no-xattr` flag for the macOS `tar` command to strip **all** the
  extended attributes. If you want to preserve extended attributes, this isn't
  a recommended option.
- Install and use `gnu-tar` to create the tarballs on macOS instead of the
  default `tar` implementation. To install `gnu-tar` using Homebrew:
@z

@x
  ```console
  $ brew install gnu-tar
  ```
@y
  ```console
  $ brew install gnu-tar
  ```
@z

@x
  After installing, add the `gnu-tar` binary to your `PATH`, for example by
  updating your `.zshrc` file:
@y
  After installing, add the `gnu-tar` binary to your `PATH`, for example by
  updating your `.zshrc` file:
@z

@x
  ```console
  $ echo 'PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"' >> ~/.zshrc
  $ source ~/.zshrc
  ```
@y
  ```console
  $ echo 'PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"' >> ~/.zshrc
  $ source ~/.zshrc
  ```
@z
