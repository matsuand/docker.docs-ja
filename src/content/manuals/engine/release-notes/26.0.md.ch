%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Engine 26.0 release notes
linkTitle: Engine v26.0
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@y
title: Docker Engine 26.0 リリースノート
linkTitle: Engine v26.0
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 26.0.
@y
本ページでは Docker Engine バージョン 26.0 に関する最新の変更、追加、既知の問題、バグフィックスについて示します。
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
## 26.0.2
@y
## 26.0.2
@z

@x
{{< release-date date="2024-04-18" >}}
@y
{{< release-date date="2024-04-18" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
本リリースにおけるプルリクエストや変更点の一覧は、対応する GitHub のマイルストーンを参照してください。
@z

@x
- [docker/cli, 26.0.2 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.0.2)
- [moby/moby, 26.0.2 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.0.2)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.0.2/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.0.2/docs/api/version-history.md).
@y
- [docker/cli, 26.0.2 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.0.2)
- [moby/moby, 26.0.2 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.0.2)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.0.2/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.0.2/docs/api/version-history.md).
@z

@x
### Security
@y
### セキュリティ {#security}
@z

@x
This release contains a security fix for [CVE-2024-32473], an unexpected configuration of IPv6 on IPv4-only interfaces.
@y
This release contains a security fix for [CVE-2024-32473], an unexpected configuration of IPv6 on IPv4-only interfaces.
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- [CVE-2024-32473]: Ensure IPv6 is disabled on interfaces only allocated an IPv4 address by the engine. [moby#GHSA-x84c-p2g9-rqv9](https://github.com/moby/moby/security/advisories/GHSA-x84c-p2g9-rqv9)

  [CVE-2024-32473]: https://github.com/moby/moby/security/advisories/GHSA-x84c-p2g9-rqv9
@y
- [CVE-2024-32473]: Ensure IPv6 is disabled on interfaces only allocated an IPv4 address by the engine. [moby#GHSA-x84c-p2g9-rqv9](https://github.com/moby/moby/security/advisories/GHSA-x84c-p2g9-rqv9)

  [CVE-2024-32473]: https://github.com/moby/moby/security/advisories/GHSA-x84c-p2g9-rqv9
@z

@x
## 26.0.1
@y
## 26.0.1
@z

@x
{{< release-date date="2024-04-11" >}}
@y
{{< release-date date="2024-04-11" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
本リリースにおけるプルリクエストや変更点の一覧は、対応する GitHub のマイルストーンを参照してください。
@z

@x
- [docker/cli, 26.0.1 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.0.1)
- [moby/moby, 26.0.1 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.0.1)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.0.1/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.0.1/docs/api/version-history.md).
@y
- [docker/cli, 26.0.1 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.0.1)
- [moby/moby, 26.0.1 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.0.1)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.0.1/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.0.1/docs/api/version-history.md).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix a regression that meant network interface specific `--sysctl` options prevented container startup. [moby/moby#47646](https://github.com/moby/moby/pull/47646)
- Remove erroneous `platform` from image `config` OCI descriptor in `docker save` output. [moby/moby#47694](https://github.com/moby/moby/pull/47694)
- containerd image store: OCI archives produced by `docker save` will now have a non-empty `mediaType` field in `index.json` [moby/moby#47701](https://github.com/moby/moby/pull/47701)
- Fix a regression that prevented the internal resolver from forwarding requests from IPvlan L3 networks to external resolvers. [moby/moby#47705](https://github.com/moby/moby/pull/47705)
- Prevent the use of external resolvers in IPvlan and Macvlan networks created with no parent interface specified. [moby/moby#47705](https://github.com/moby/moby/pull/47705)
@y
- Fix a regression that meant network interface specific `--sysctl` options prevented container startup. [moby/moby#47646](https://github.com/moby/moby/pull/47646)
- Remove erroneous `platform` from image `config` OCI descriptor in `docker save` output. [moby/moby#47694](https://github.com/moby/moby/pull/47694)
- containerd image store: OCI archives produced by `docker save` will now have a non-empty `mediaType` field in `index.json` [moby/moby#47701](https://github.com/moby/moby/pull/47701)
- Fix a regression that prevented the internal resolver from forwarding requests from IPvlan L3 networks to external resolvers. [moby/moby#47705](https://github.com/moby/moby/pull/47705)
- Prevent the use of external resolvers in IPvlan and Macvlan networks created with no parent interface specified. [moby/moby#47705](https://github.com/moby/moby/pull/47705)
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Update Go runtime to 1.21.9 [moby/moby#47671](https://github.com/moby/moby/pull/47671), [docker/cli#4987](https://github.com/docker/cli/pull/4987)
- Update Compose to [v1.26.1 ](https://github.com/docker/compose/releases/tag/v2.26.1), [docker/docker-ce-packaging#1009](https://github.com/docker/docker-ce-packaging/pull/1009)
- Update containerd to [v1.7.15](https://github.com/containerd/containerd/releases/tag/v1.7.15) (static binaries only) [moby/moby#47692](https://github.com/moby/moby/pull/47692)
@y
- Update Go runtime to 1.21.9 [moby/moby#47671](https://github.com/moby/moby/pull/47671), [docker/cli#4987](https://github.com/docker/cli/pull/4987)
- Update Compose to [v1.26.1 ](https://github.com/docker/compose/releases/tag/v2.26.1), [docker/docker-ce-packaging#1009](https://github.com/docker/docker-ce-packaging/pull/1009)
- Update containerd to [v1.7.15](https://github.com/containerd/containerd/releases/tag/v1.7.15) (static binaries only) [moby/moby#47692](https://github.com/moby/moby/pull/47692)
@z

@x
## 26.0.0
@y
## 26.0.0
@z

@x
{{< release-date date="2024-03-20" >}}
@y
{{< release-date date="2024-03-20" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
本リリースにおけるプルリクエストや変更点の一覧は、対応する GitHub のマイルストーンを参照してください。
@z

@x
- [docker/cli, 26.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.0.0)
- [moby/moby, 26.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.0.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.0.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.0.0/docs/api/version-history.md).
@y
- [docker/cli, 26.0.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.0.0)
- [moby/moby, 26.0.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.0.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.0.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.0.0/docs/api/version-history.md).
@z

@x
### Security
@y
### セキュリティ {#security}
@z

@x
This release contains a security fix for [CVE-2024-29018], a potential data exfiltration from 'internal' networks via authoritative DNS servers.
@y
This release contains a security fix for [CVE-2024-29018], a potential data exfiltration from 'internal' networks via authoritative DNS servers.
@z

@x
### New
@y
### New
@z

@x
- Add `Subpath` field to the `VolumeOptions` making it possible to mount a subpath of a volume. [moby/moby#45687](https://github.com/moby/moby/pull/45687)
- Add `volume-subpath` support to the mount flag (`--mount type=volume,...,volume-subpath=<subpath>`). [docker/cli#4331](https://github.com/docker/cli/pull/4331)
- Accept `=` separators and `[ipv6]` in compose files for `docker stack deploy`. [docker/cli#4860](https://github.com/docker/cli/pull/4860)
- rootless: Add support for enabling host loopback by setting the `DOCKERD_ROOTLESS_ROOTLESSKIT_DISABLE_HOST_LOOPBACK` environment variable to `false` (defaults to `true`). This lets containers connect to the host by using IP address `10.0.2.2`. [moby/moby#47352](https://github.com/moby/moby/pull/47352)
- containerd image store: `docker image ls` no longer creates duplicates entries for multi-platform images. [moby/moby#45967](https://github.com/moby/moby/pull/45967)
- containerd image store: Send Prometheus metrics. [moby/moby#47555](https://github.com/moby/moby/pull/47555)
@y
- Add `Subpath` field to the `VolumeOptions` making it possible to mount a subpath of a volume. [moby/moby#45687](https://github.com/moby/moby/pull/45687)
- Add `volume-subpath` support to the mount flag (`--mount type=volume,...,volume-subpath=<subpath>`). [docker/cli#4331](https://github.com/docker/cli/pull/4331)
- Accept `=` separators and `[ipv6]` in compose files for `docker stack deploy`. [docker/cli#4860](https://github.com/docker/cli/pull/4860)
- rootless: Add support for enabling host loopback by setting the `DOCKERD_ROOTLESS_ROOTLESSKIT_DISABLE_HOST_LOOPBACK` environment variable to `false` (defaults to `true`). This lets containers connect to the host by using IP address `10.0.2.2`. [moby/moby#47352](https://github.com/moby/moby/pull/47352)
- containerd image store: `docker image ls` no longer creates duplicates entries for multi-platform images. [moby/moby#45967](https://github.com/moby/moby/pull/45967)
- containerd image store: Send Prometheus metrics. [moby/moby#47555](https://github.com/moby/moby/pull/47555)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- [CVE-2024-29018]: Do not forward requests to external DNS servers for a container that is only connected to an 'internal' network. Previously, requests were forwarded if the host's DNS server was running on a loopback address, like systemd's 127.0.0.53. [moby/moby#47589](https://github.com/moby/moby/pull/47589)
- Ensure that a generated MAC address is not restored when a container is restarted, but a configured MAC address is preserved. [moby/moby#47233](https://github.com/moby/moby/pull/47233)
@y
- [CVE-2024-29018]: Do not forward requests to external DNS servers for a container that is only connected to an 'internal' network. Previously, requests were forwarded if the host's DNS server was running on a loopback address, like systemd's 127.0.0.53. [moby/moby#47589](https://github.com/moby/moby/pull/47589)
- Ensure that a generated MAC address is not restored when a container is restarted, but a configured MAC address is preserved. [moby/moby#47233](https://github.com/moby/moby/pull/47233)
@z

@x
  > [!WARNING]
  >
  > Containers created using Docker Engine 25.0.0 may have duplicate MAC addresses, they must be re-created.
  > Containers created using version 25.0.0 or 25.0.1 with user-defined MAC addresses will get generated MAC addresses when they are started using 25.0.2. They must also be re-created.
@y
  > [!WARNING]
  >
  > Containers created using Docker Engine 25.0.0 may have duplicate MAC addresses, they must be re-created.
  > Containers created using version 25.0.0 or 25.0.1 with user-defined MAC addresses will get generated MAC addresses when they are started using 25.0.2. They must also be re-created.
@z

@x
- Always attempt to enable IPv6 on a container's loopback interface, and only include IPv6 in `/etc/hosts` if successful. [moby/moby#47062](https://github.com/moby/moby/pull/47062)
@y
- Always attempt to enable IPv6 on a container's loopback interface, and only include IPv6 in `/etc/hosts` if successful. [moby/moby#47062](https://github.com/moby/moby/pull/47062)
@z

@x
  > [!NOTE]
  >
  > By default, IPv6 will remain enabled on a container's loopback interface when the container is not connected to an IPv6-enabled network.
  > For example, containers that are only connected to an IPv4-only network now have the `::1` address on their loopback interface.
  >
  > To disable IPv6 in a container,
  > use option `--sysctl net.ipv6.conf.all.disable_ipv6=1` in the `create` or `run` command,
  > or the equivalent `sysctls` option in the service configuration section of a Compose file.
  >
  > If IPv6 is not available in a container because it has been explicitly disabled for the container,
  > or the host's networking stack does not have IPv6 enabled (or for any other reason)
  > the container's `/etc/hosts` file will not include IPv6 entries.
@y
  > [!NOTE]
  >
  > By default, IPv6 will remain enabled on a container's loopback interface when the container is not connected to an IPv6-enabled network.
  > For example, containers that are only connected to an IPv4-only network now have the `::1` address on their loopback interface.
  >
  > To disable IPv6 in a container,
  > use option `--sysctl net.ipv6.conf.all.disable_ipv6=1` in the `create` or `run` command,
  > or the equivalent `sysctls` option in the service configuration section of a Compose file.
  >
  > If IPv6 is not available in a container because it has been explicitly disabled for the container,
  > or the host's networking stack does not have IPv6 enabled (or for any other reason)
  > the container's `/etc/hosts` file will not include IPv6 entries.
@z

@x
- Fix `ADD` Dockerfile instruction failing with `lsetxattr <file>: operation not supported` when unpacking archive with xattrs onto a filesystem that doesn't support them. [moby/moby#47175](https://github.com/moby/moby/pull/47175)
- Fix `docker container start` failing when used with `--checkpoint`. [moby/moby#47456](https://github.com/moby/moby/pull/47456)
- Restore IP connectivity between the host and containers on an internal bridge network. [moby/moby#47356](https://github.com/moby/moby/pull/47356)
- Do not enforce new validation rules for existing swarm networks. [moby/moby#47361](https://github.com/moby/moby/pull/47361)
- Restore DNS names for containers in the default "nat" network on Windows. [moby/moby#47375](https://github.com/moby/moby/pull/47375)
- Print hint when invoking `docker image ls` with ambiguous argument. [docker/cli#4849](https://github.com/docker/cli/pull/4849)
- Cleanup `@docker_cli_[UUID]` files on OpenBSD. [docker/cli#4862](https://github.com/docker/cli/pull/4862)
- Add explicit [deprecation notice](https://github.com/docker/cli/blob/v26.0.0/docs/deprecated.md#unauthenticated-tcp-connections) message when using remote TCP connections without TLS. [docker/cli#4928](https://github.com/docker/cli/pull/4928), [moby/moby#47556](https://github.com/moby/moby/pull/47556)
- Use IPv6 nameservers from the host's `resolv.conf` as upstream resolvers for Docker Engine's internal DNS, rather than listing them in the container's `resolv.conf`. [moby/moby#47512](https://github.com/moby/moby/pull/47512)
- containerd image store: Isolate images with different containerd namespaces when `--userns-remap` option is used. [moby/moby#46786](https://github.com/moby/moby/pull/46786)
- containerd image store: Fix image pull not emitting `Pulling fs layer` status. [moby/moby#47432](https://github.com/moby/moby/pull/47432)
@y
- Fix `ADD` Dockerfile instruction failing with `lsetxattr <file>: operation not supported` when unpacking archive with xattrs onto a filesystem that doesn't support them. [moby/moby#47175](https://github.com/moby/moby/pull/47175)
- Fix `docker container start` failing when used with `--checkpoint`. [moby/moby#47456](https://github.com/moby/moby/pull/47456)
- Restore IP connectivity between the host and containers on an internal bridge network. [moby/moby#47356](https://github.com/moby/moby/pull/47356)
- Do not enforce new validation rules for existing swarm networks. [moby/moby#47361](https://github.com/moby/moby/pull/47361)
- Restore DNS names for containers in the default "nat" network on Windows. [moby/moby#47375](https://github.com/moby/moby/pull/47375)
- Print hint when invoking `docker image ls` with ambiguous argument. [docker/cli#4849](https://github.com/docker/cli/pull/4849)
- Cleanup `@docker_cli_[UUID]` files on OpenBSD. [docker/cli#4862](https://github.com/docker/cli/pull/4862)
- Add explicit [deprecation notice](https://github.com/docker/cli/blob/v26.0.0/docs/deprecated.md#unauthenticated-tcp-connections) message when using remote TCP connections without TLS. [docker/cli#4928](https://github.com/docker/cli/pull/4928), [moby/moby#47556](https://github.com/moby/moby/pull/47556)
- Use IPv6 nameservers from the host's `resolv.conf` as upstream resolvers for Docker Engine's internal DNS, rather than listing them in the container's `resolv.conf`. [moby/moby#47512](https://github.com/moby/moby/pull/47512)
- containerd image store: Isolate images with different containerd namespaces when `--userns-remap` option is used. [moby/moby#46786](https://github.com/moby/moby/pull/46786)
- containerd image store: Fix image pull not emitting `Pulling fs layer` status. [moby/moby#47432](https://github.com/moby/moby/pull/47432)
@z

@x
### API
@y
### API
@z

@x
- To preserve backwards compatibility, read-only mounts are not recursive by default when using older clients (API version < v1.44). [moby/moby#47391](https://github.com/moby/moby/pull/47391)
- `GET /images/{id}/json` omits the `Created` field (previously it was `0001-01-01T00:00:00Z`) if the `Created` field is missing from the image config. [moby/moby#47451](https://github.com/moby/moby/pull/47451)
- Populate a missing `Created` field in `GET /images/{id}/json` with `0001-01-01T00:00:00Z` for API version <= 1.43. [moby/moby#47387](https://github.com/moby/moby/pull/47387)
- The `is_automated` field in the `POST /images/search` endpoint results is always `false` now. Consequently, searching for `is-automated=true` will yield no results, while `is-automated=false` will be a no-op. [moby/moby#47465](https://github.com/moby/moby/pull/47465)
- Remove `Container` and `ContainerConfig` fields from the `GET /images/{name}/json` response. [moby/moby#47430](https://github.com/moby/moby/pull/47430)
@y
- To preserve backwards compatibility, read-only mounts are not recursive by default when using older clients (API version < v1.44). [moby/moby#47391](https://github.com/moby/moby/pull/47391)
- `GET /images/{id}/json` omits the `Created` field (previously it was `0001-01-01T00:00:00Z`) if the `Created` field is missing from the image config. [moby/moby#47451](https://github.com/moby/moby/pull/47451)
- Populate a missing `Created` field in `GET /images/{id}/json` with `0001-01-01T00:00:00Z` for API version <= 1.43. [moby/moby#47387](https://github.com/moby/moby/pull/47387)
- The `is_automated` field in the `POST /images/search` endpoint results is always `false` now. Consequently, searching for `is-automated=true` will yield no results, while `is-automated=false` will be a no-op. [moby/moby#47465](https://github.com/moby/moby/pull/47465)
- Remove `Container` and `ContainerConfig` fields from the `GET /images/{name}/json` response. [moby/moby#47430](https://github.com/moby/moby/pull/47430)
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Update BuildKit to [v0.13.1](https://github.com/moby/buildkit/releases/tag/v0.13.1). [moby/moby#47582](https://github.com/moby/moby/pull/47582)
- Update Buildx to [v0.13.1](https://github.com/docker/buildx/releases/tag/v0.13.1). [docker/docker-ce-packaging#1000](https://github.com/docker/docker-ce-packaging/pull/1000)
- Update Compose to [v2.25.0](https://github.com/docker/compose/releases/tag/v2.25.0). [docker/docker-ce-packaging#1002](https://github.com/docker/docker-ce-packaging/pull/1002)
- Update Go runtime to [1.21.8](https://go.dev/doc/devel/release#go1.21.8). [moby/moby#47502](https://github.com/moby/moby/pull/47502)
- Update RootlessKit to [v2.0.2](https://github.com/rootless-containers/rootlesskit/releases/tag/v2.0.2).  [moby/moby#47508](https://github.com/moby/moby/pull/47504)
- Update containerd to v1.7.13 (static binaries only) [moby/moby#47278](https://github.com/moby/moby/pull/47278)
- Update runc binary to v1.1.12 [moby/moby#47268](https://github.com/moby/moby/pull/47268)
- Update OTel to v0.46.1 / v1.21.0 [moby/moby#47245](https://github.com/moby/moby/pull/47245)
@y
- Update BuildKit to [v0.13.1](https://github.com/moby/buildkit/releases/tag/v0.13.1). [moby/moby#47582](https://github.com/moby/moby/pull/47582)
- Update Buildx to [v0.13.1](https://github.com/docker/buildx/releases/tag/v0.13.1). [docker/docker-ce-packaging#1000](https://github.com/docker/docker-ce-packaging/pull/1000)
- Update Compose to [v2.25.0](https://github.com/docker/compose/releases/tag/v2.25.0). [docker/docker-ce-packaging#1002](https://github.com/docker/docker-ce-packaging/pull/1002)
- Update Go runtime to [1.21.8](https://go.dev/doc/devel/release#go1.21.8). [moby/moby#47502](https://github.com/moby/moby/pull/47502)
- Update RootlessKit to [v2.0.2](https://github.com/rootless-containers/rootlesskit/releases/tag/v2.0.2).  [moby/moby#47508](https://github.com/moby/moby/pull/47504)
- Update containerd to v1.7.13 (static binaries only) [moby/moby#47278](https://github.com/moby/moby/pull/47278)
- Update runc binary to v1.1.12 [moby/moby#47268](https://github.com/moby/moby/pull/47268)
- Update OTel to v0.46.1 / v1.21.0 [moby/moby#47245](https://github.com/moby/moby/pull/47245)
@z

@x
### Removed
@y
### Removed
@z

@x
- Remove `Container` and `ContainerConfig` fields from the `GET /images/{name}/json` response. [moby/moby#47430](https://github.com/moby/moby/pull/47430)
- Deprecate the ability to accept remote TCP connections without TLS. [Deprecation notice](https://github.com/docker/cli/tree/v26.0.0/deprecation.md#unauthenticated-tcp-connections) [docker/cli#4928](https://github.com/docker/cli/pull/4928) [moby/moby#47556](https://github.com/moby/moby/pull/47556).
- Remove deprecated API versions (API < v1.24) [moby/moby#47155](https://github.com/moby/moby/pull/47155)
- Disable pulling of deprecated image formats by default. These image formats are deprecated, and support will be removed in a future version. [moby/moby#47459](https://github.com/moby/moby/pull/47459)
- image: remove deprecated IDFromDigest [moby/moby#47198](https://github.com/moby/moby/pull/47198)
- Remove the deprecated `github.com/docker/docker/pkg/loopback` package. [moby/moby#47128](https://github.com/moby/moby/pull/47128)
- pkg/system: remove deprecated `ErrNotSupportedOperatingSystem`, `IsOSSupported` [moby/moby#47129](https://github.com/moby/moby/pull/47129)
- pkg/homedir: remove deprecated Key() and GetShortcutString() [moby/moby#47130](https://github.com/moby/moby/pull/47130)
- pkg/containerfs: remove deprecated ResolveScopedPath [moby/moby#47131](https://github.com/moby/moby/pull/47131)
- The daemon flag `--oom-score-adjust` was deprecated in v24.0 and is now removed. [moby/moby#46113](https://github.com/moby/moby/pull/46113)
- Remove deprecated aliases from the api/types package. These types were deprecated in v25.0.0, which provided temporary aliases. [moby/moby#47148](https://github.com/moby/moby/pull/47148)
  These aliases are now removed: `types.Info`, `types.Commit`, `types.PluginsInfo`, `types.NetworkAddressPool`, `types.Runtime`, `types.SecurityOpt`, `types.KeyValue`, `types.DecodeSecurityOptions`, `types.CheckpointCreateOptions`, `types.CheckpointListOptions`, `types.CheckpointDeleteOptions`, `types.Checkpoint`, `types.ImageDeleteResponseItem`, `types.ImageSummary`, `types.ImageMetadata`, `types.ServiceUpdateResponse`, `types.ServiceCreateResponse`, `types.ResizeOptions`, `types.ContainerAttachOptions`, `types.ContainerCommitOptions`, `types.ContainerRemoveOptions`, `types.ContainerStartOptions`, `types.ContainerListOptions`, `types.ContainerLogsOptions`
- cli/command/container: remove deprecated `NewStartOptions()` [docker/cli#4811](https://github.com/docker/cli/pull/4811)
- cli/command: remove deprecated `DockerCliOption`, `InitializeOpt` [docker/cli#4810](https://github.com/docker/cli/pull/4810)
@y
- Remove `Container` and `ContainerConfig` fields from the `GET /images/{name}/json` response. [moby/moby#47430](https://github.com/moby/moby/pull/47430)
- Deprecate the ability to accept remote TCP connections without TLS. [Deprecation notice](https://github.com/docker/cli/tree/v26.0.0/deprecation.md#unauthenticated-tcp-connections) [docker/cli#4928](https://github.com/docker/cli/pull/4928) [moby/moby#47556](https://github.com/moby/moby/pull/47556).
- Remove deprecated API versions (API < v1.24) [moby/moby#47155](https://github.com/moby/moby/pull/47155)
- Disable pulling of deprecated image formats by default. These image formats are deprecated, and support will be removed in a future version. [moby/moby#47459](https://github.com/moby/moby/pull/47459)
- image: remove deprecated IDFromDigest [moby/moby#47198](https://github.com/moby/moby/pull/47198)
- Remove the deprecated `github.com/docker/docker/pkg/loopback` package. [moby/moby#47128](https://github.com/moby/moby/pull/47128)
- pkg/system: remove deprecated `ErrNotSupportedOperatingSystem`, `IsOSSupported` [moby/moby#47129](https://github.com/moby/moby/pull/47129)
- pkg/homedir: remove deprecated Key() and GetShortcutString() [moby/moby#47130](https://github.com/moby/moby/pull/47130)
- pkg/containerfs: remove deprecated ResolveScopedPath [moby/moby#47131](https://github.com/moby/moby/pull/47131)
- The daemon flag `--oom-score-adjust` was deprecated in v24.0 and is now removed. [moby/moby#46113](https://github.com/moby/moby/pull/46113)
- Remove deprecated aliases from the api/types package. These types were deprecated in v25.0.0, which provided temporary aliases. [moby/moby#47148](https://github.com/moby/moby/pull/47148)
  These aliases are now removed: `types.Info`, `types.Commit`, `types.PluginsInfo`, `types.NetworkAddressPool`, `types.Runtime`, `types.SecurityOpt`, `types.KeyValue`, `types.DecodeSecurityOptions`, `types.CheckpointCreateOptions`, `types.CheckpointListOptions`, `types.CheckpointDeleteOptions`, `types.Checkpoint`, `types.ImageDeleteResponseItem`, `types.ImageSummary`, `types.ImageMetadata`, `types.ServiceUpdateResponse`, `types.ServiceCreateResponse`, `types.ResizeOptions`, `types.ContainerAttachOptions`, `types.ContainerCommitOptions`, `types.ContainerRemoveOptions`, `types.ContainerStartOptions`, `types.ContainerListOptions`, `types.ContainerLogsOptions`
- cli/command/container: remove deprecated `NewStartOptions()` [docker/cli#4811](https://github.com/docker/cli/pull/4811)
- cli/command: remove deprecated `DockerCliOption`, `InitializeOpt` [docker/cli#4810](https://github.com/docker/cli/pull/4810)
@z

% snip cve...
