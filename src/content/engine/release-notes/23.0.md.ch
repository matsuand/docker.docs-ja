%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Engine 23.0 release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker
  Engine
keywords: docker, docker engine, ce, whats new, release notes
@y
title: Docker Engine 23.0 release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker
  Engine
keywords: docker, docker engine, ce, whats new, release notes
@z

@x
> [!NOTE]
>
> From Docker Engine version 23.0.0, Buildx is distributed in a separate package: `docker-buildx-plugin`.
> In earlier versions, Buildx was included in the `docker-ce-cli` package.
> When you upgrade to this version of Docker Engine, make sure you update all
> packages. For example, on Ubuntu:
>
> ```console
> $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
> ```
>
> Refer to the [Docker Engine installation instructions][1] for your operating system
> for more details on upgrading Docker Engine.
@y
> [!NOTE]
>
> From Docker Engine version 23.0.0, Buildx is distributed in a separate package: `docker-buildx-plugin`.
> In earlier versions, Buildx was included in the `docker-ce-cli` package.
> When you upgrade to this version of Docker Engine, make sure you update all
> packages. For example, on Ubuntu:
>
> ```console
> $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
> ```
>
> Refer to the [Docker Engine installation instructions][1] for your operating system
> for more details on upgrading Docker Engine.
@z

@x
[1]: ../install/index.md
@y
[1]: ../install/index.md
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 23.0.
@y
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 23.0.
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
Starting with the 23.0.0 release, Docker Engine moves away from using CalVer versioning,
and starts using the [SemVer versioning format](https://semver.org/).
Changing the version format is a stepping-stone towards Go module compatibility,
but the repository doesn't yet use Go modules, and still requires using a "+incompatible" version.
Work continues towards Go module compatibility in a future release.
@y
Starting with the 23.0.0 release, Docker Engine moves away from using CalVer versioning,
and starts using the [SemVer versioning format](https://semver.org/).
Changing the version format is a stepping-stone towards Go module compatibility,
but the repository doesn't yet use Go modules, and still requires using a "+incompatible" version.
Work continues towards Go module compatibility in a future release.
@z

@x
## 23.0.6
@y
## 23.0.6
@z

@x
{{< release-date date="2023-05-08" >}}
@y
{{< release-date date="2023-05-08" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 23.0.6 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A23.0.6)
- [moby/moby, 23.0.6 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A23.0.6)
@y
- [docker/cli, 23.0.6 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A23.0.6)
- [moby/moby, 23.0.6 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A23.0.6)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix vfs storage driver not working on NFS. [moby/moby#45465](https://github.com/moby/moby/pull/45465)
@y
- Fix vfs storage driver not working on NFS. [moby/moby#45465](https://github.com/moby/moby/pull/45465)
@z

@x
### Packaging Updates
@y
### Packaging Updates
@z

@x
- Upgrade Go to `1.19.9`. [docker/docker-ce-packaging#889](https://github.com/docker/docker-ce-packaging/pull/889),
  [docker/cli#4254](https://github.com/docker/cli/pull/4254), [moby/moby#45455](https://github.com/moby/moby/pull/45455)
- Upgrade `containerd` to [v1.6.21](https://github.com/containerd/containerd/releases/tag/v1.6.21)
- Upgrade `runc` to [v1.1.7](https://github.com/opencontainers/runc/releases/tag/v1.1.7)
@y
- Upgrade Go to `1.19.9`. [docker/docker-ce-packaging#889](https://github.com/docker/docker-ce-packaging/pull/889),
  [docker/cli#4254](https://github.com/docker/cli/pull/4254), [moby/moby#45455](https://github.com/moby/moby/pull/45455)
- Upgrade `containerd` to [v1.6.21](https://github.com/containerd/containerd/releases/tag/v1.6.21)
- Upgrade `runc` to [v1.1.7](https://github.com/opencontainers/runc/releases/tag/v1.1.7)
@z

@x
## 23.0.5
@y
## 23.0.5
@z

@x
{{< release-date date="2023-04-26" >}}
@y
{{< release-date date="2023-04-26" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 23.0.5 milestone](https://github.com/docker/cli/milestone/79?closed=1)
- [moby/moby, 23.0.5 milestone](https://github.com/moby/moby/milestone/118?closed=1)
@y
- [docker/cli, 23.0.5 milestone](https://github.com/docker/cli/milestone/79?closed=1)
- [moby/moby, 23.0.5 milestone](https://github.com/moby/moby/milestone/118?closed=1)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Add the `--all` / `-a` option when pruning volumes. [docker/cli#4229](https://github.com/docker/cli/pull/4229)
- Add `--format=json` for `docker info`. [docker/cli#4320](https://github.com/docker/cli/pull/4230)
- Fix log loss with the AWSLogs log driver. [moby/moby#45350](https://github.com/moby/moby/pull/45350)
- Fix a regression introduced in v23.0.4 where dockerd would refuse to start if the fixed-cidr config parameter is provided but not bip. [moby/moby#45403](https://github.com/moby/moby/pull/45403)
- Fix a panic in libnetwork during daemon start [moby/moby#45376](https://github.com/moby/moby/pull/45376)
- Fix "tag" event not being sent when an image is built with `buildx`. [moby/moby#45410](https://github.com/moby/moby/pull/45410)
@y
- Add the `--all` / `-a` option when pruning volumes. [docker/cli#4229](https://github.com/docker/cli/pull/4229)
- Add `--format=json` for `docker info`. [docker/cli#4320](https://github.com/docker/cli/pull/4230)
- Fix log loss with the AWSLogs log driver. [moby/moby#45350](https://github.com/moby/moby/pull/45350)
- Fix a regression introduced in v23.0.4 where dockerd would refuse to start if the fixed-cidr config parameter is provided but not bip. [moby/moby#45403](https://github.com/moby/moby/pull/45403)
- Fix a panic in libnetwork during daemon start [moby/moby#45376](https://github.com/moby/moby/pull/45376)
- Fix "tag" event not being sent when an image is built with `buildx`. [moby/moby#45410](https://github.com/moby/moby/pull/45410)
@z

@x
### Packaging Updates
@y
### Packaging Updates
@z

@x
- Upgrade Compose to `2.17.3`. [docker/docker-ce-packaging#883](https://github.com/docker/docker-ce-packaging/pull/883)
@y
- Upgrade Compose to `2.17.3`. [docker/docker-ce-packaging#883](https://github.com/docker/docker-ce-packaging/pull/883)
@z

@x
## 23.0.4
@y
## 23.0.4
@z

@x
{{< release-date date="2023-04-17" >}}
@y
{{< release-date date="2023-04-17" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 23.0.4 milestone](https://github.com/docker/cli/milestone/77?closed=1)
- [moby/moby, 23.0.4 milestone](https://github.com/moby/moby/milestone/117?closed=1)
@y
- [docker/cli, 23.0.4 milestone](https://github.com/docker/cli/milestone/77?closed=1)
- [moby/moby, 23.0.4 milestone](https://github.com/moby/moby/milestone/117?closed=1)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix a performance regression in Docker CLI 23.0.0 [docker/cli#4141](https://github.com/docker/cli/pull/4141).
- Fix progress indicator on `docker cp` not functioning as intended [docker/cli#4157](https://github.com/docker/cli/pull/4157).
- Fix shell completion for `docker compose --file` [docker/cli#4177](https://github.com/docker/cli/pull/4177).
- Fix an error caused by incorrect handling of "default-address-pools" in `daemon.json` [moby/moby#45246](https://github.com/moby/moby/pull/45246).
@y
- Fix a performance regression in Docker CLI 23.0.0 [docker/cli#4141](https://github.com/docker/cli/pull/4141).
- Fix progress indicator on `docker cp` not functioning as intended [docker/cli#4157](https://github.com/docker/cli/pull/4157).
- Fix shell completion for `docker compose --file` [docker/cli#4177](https://github.com/docker/cli/pull/4177).
- Fix an error caused by incorrect handling of "default-address-pools" in `daemon.json` [moby/moby#45246](https://github.com/moby/moby/pull/45246).
@z

@x
### Packaging Updates
@y
### Packaging Updates
@z

@x
- Fix missing packages for CentOS 9 Stream.
- Upgrade Go to `1.19.8`. [docker/docker-ce-packaging#878](https://github.com/docker/docker-ce-packaging/pull/878),
  [docker/cli#4164](https://github.com/docker/cli/pull/4164), [moby/moby#45277](https://github.com/moby/moby/pull/45277),
  which contains fixes for [CVE-2023-24537](https://github.com/advisories/GHSA-fp86-2355-v99r),
  [CVE-2023-24538](https://github.com/advisories/GHSA-v4m2-x4rp-hv22),
  [CVE-2023-24534](https://github.com/advisories/GHSA-8v5j-pwr7-w5f8),
  and [CVE-2023-24536](https://github.com/advisories/GHSA-9f7g-gqwh-jpf5)
@y
- Fix missing packages for CentOS 9 Stream.
- Upgrade Go to `1.19.8`. [docker/docker-ce-packaging#878](https://github.com/docker/docker-ce-packaging/pull/878),
  [docker/cli#4164](https://github.com/docker/cli/pull/4164), [moby/moby#45277](https://github.com/moby/moby/pull/45277),
  which contains fixes for [CVE-2023-24537](https://github.com/advisories/GHSA-fp86-2355-v99r),
  [CVE-2023-24538](https://github.com/advisories/GHSA-v4m2-x4rp-hv22),
  [CVE-2023-24534](https://github.com/advisories/GHSA-8v5j-pwr7-w5f8),
  and [CVE-2023-24536](https://github.com/advisories/GHSA-9f7g-gqwh-jpf5)
@z

@x
## 23.0.3
@y
## 23.0.3
@z

@x
{{< release-date date="2023-04-04" >}}
@y
{{< release-date date="2023-04-04" >}}
@z

@x
> [!NOTE]
> 
> Due to an issue with CentOS 9 Stream's package repositories, packages for
> CentOS 9 are currently unavailable. Packages for CentOS 9 may be added later,
> or as part of the next (23.0.4) patch release.
@y
> [!NOTE]
> 
> Due to an issue with CentOS 9 Stream's package repositories, packages for
> CentOS 9 are currently unavailable. Packages for CentOS 9 may be added later,
> or as part of the next (23.0.4) patch release.
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fixed a number of issues that can cause Swarm encrypted overlay networks
  to fail to uphold their guarantees, addressing [CVE-2023-28841](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28841),
  [CVE-2023-28840](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28840), and
  [CVE-2023-28842](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28842).
  - A lack of kernel support for encrypted overlay networks now reports
    as an error.
  - Encrypted overlay networks are eagerly set up, rather than waiting for
    multiple nodes to attach.
  - Encrypted overlay networks are now usable on Red Hat Enterprise Linux 9
    through the use of the `xt_bpf` kernel module.
  - Users of Swarm overlay networks should review [GHSA-vwm3-crmr-xfxw](https://github.com/moby/moby/security/advisories/GHSA-vwm3-crmr-xfxw)
    to ensure that unintentional exposure has not occurred.
@y
- Fixed a number of issues that can cause Swarm encrypted overlay networks
  to fail to uphold their guarantees, addressing [CVE-2023-28841](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28841),
  [CVE-2023-28840](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28840), and
  [CVE-2023-28842](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28842).
  - A lack of kernel support for encrypted overlay networks now reports
    as an error.
  - Encrypted overlay networks are eagerly set up, rather than waiting for
    multiple nodes to attach.
  - Encrypted overlay networks are now usable on Red Hat Enterprise Linux 9
    through the use of the `xt_bpf` kernel module.
  - Users of Swarm overlay networks should review [GHSA-vwm3-crmr-xfxw](https://github.com/moby/moby/security/advisories/GHSA-vwm3-crmr-xfxw)
    to ensure that unintentional exposure has not occurred.
@z

@x
### Packaging Updates
@y
### Packaging Updates
@z

@x
- Upgrade `containerd` to [v1.6.20](https://github.com/containerd/containerd/releases/tag/v1.6.20).
- Upgrade `runc` to [v1.1.5](https://github.com/opencontainers/runc/releases/tag/v1.1.5).
@y
- Upgrade `containerd` to [v1.6.20](https://github.com/containerd/containerd/releases/tag/v1.6.20).
- Upgrade `runc` to [v1.1.5](https://github.com/opencontainers/runc/releases/tag/v1.1.5).
@z

@x
## 23.0.2
@y
## 23.0.2
@z

@x
{{< release-date date="2023-03-28" >}}
@y
{{< release-date date="2023-03-28" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 23.0.2 milestone](https://github.com/docker/cli/milestone/75?closed=1)
- [moby/moby, 23.0.2 milestone](https://github.com/moby/moby/milestone/114?closed=1)
@y
- [docker/cli, 23.0.2 milestone](https://github.com/docker/cli/milestone/75?closed=1)
- [moby/moby, 23.0.2 milestone](https://github.com/moby/moby/milestone/114?closed=1)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fully resolve missing checks for `apparmor_parser` when an AppArmor enabled kernel is detected. [containerd/containerd#8087](https://github.com/containerd/containerd/pull/8087), [moby/moby#45043](https://github.com/moby/moby/pull/45043)
- Ensure that credentials are redacted from Git URLs when generating BuildKit buildinfo. Fixes [CVE-2023-26054](https://github.com/moby/buildkit/security/advisories/GHSA-gc89-7gcr-jxqc). [moby/moby#45110](https://github.com/moby/moby/pull/45110)
- Fix anonymous volumes created by a `VOLUME` line in a Dockerfile being excluded from volume prune. [moby/moby#45159](https://github.com/moby/moby/pull/45159)
- Fix a failure to properly propagate errors during removal of volumes on a Swarm node. [moby/moby#45155](https://github.com/moby/moby/pull/45155)
- Temporarily work around a bug in BuildKit `COPY --link` by disabling mergeop/diffop optimization. [moby/moby#45112](https://github.com/moby/moby/pull/45112)
- Properly clean up child tasks when a parent Swarm job is removed. [moby/swarmkit#3112](https://github.com/moby/swarmkit/pull/3112), [moby/moby#45107](https://github.com/moby/moby/pull/45107)
- Fix Swarm service creation logic so that both a GenericResource and a non-default network can be used together. [moby/swarmkit#3082](https://github.com/moby/swarmkit/pull/3082), [moby/moby#45107](https://github.com/moby/moby/pull/45107)
- Fix Swarm CSI support requiring the CSI plugin to offer staging endpoints in order to publish a volume. [moby/swarmkit#3116](https://github.com/moby/swarmkit/pull/3116), [moby/moby#45107](https://github.com/moby/moby/pull/45107)
- Fix a panic caused by log buffering in some configurations. [containerd/fifo#47](https://github.com/containerd/fifo/pull/47), [moby/moby#45051](https://github.com/moby/moby/pull/45051)
- Log errors in the REST to Swarm gRPC API translation layer at the debug level to reduce redundancy and noise. [moby/moby#45016](https://github.com/moby/moby/pull/45016)
- Fix a DNS resolution issue affecting containers created with `--dns-opt` or `--dns-search` when `systemd-resolved` is used outside the container. [moby/moby#45000](https://github.com/moby/moby/pull/45000)
- Fix a panic when logging errors in handling DNS queries originating from inside a container. [moby/moby#44980](https://github.com/moby/moby/pull/44980)
- Improve the speed of `docker ps` by allowing users to opt out of size calculations with `--size=false`. [docker/cli#4107](https://github.com/docker/cli/pull/4107)
- Extend support for Bash completion to all plugins. [docker/cli#4092](https://github.com/docker/cli/pull/4092)
- Fix `docker stack deploy` failing on Windows when special environment variables set by `cmd.exe` are present. [docker/cli#4083](https://github.com/docker/cli/pull/4083)
- Add forward compatibility for future API versions by considering empty image tags to be the same as `<none>`. [docker/cli#4065](https://github.com/docker/cli/pull/4065)
- Atomically write context files to greatly reduce the probability of corruption, and improve the error message for a corrupt context. [docker/cli#4063](https://github.com/docker/cli/pull/4063)
@y
- Fully resolve missing checks for `apparmor_parser` when an AppArmor enabled kernel is detected. [containerd/containerd#8087](https://github.com/containerd/containerd/pull/8087), [moby/moby#45043](https://github.com/moby/moby/pull/45043)
- Ensure that credentials are redacted from Git URLs when generating BuildKit buildinfo. Fixes [CVE-2023-26054](https://github.com/moby/buildkit/security/advisories/GHSA-gc89-7gcr-jxqc). [moby/moby#45110](https://github.com/moby/moby/pull/45110)
- Fix anonymous volumes created by a `VOLUME` line in a Dockerfile being excluded from volume prune. [moby/moby#45159](https://github.com/moby/moby/pull/45159)
- Fix a failure to properly propagate errors during removal of volumes on a Swarm node. [moby/moby#45155](https://github.com/moby/moby/pull/45155)
- Temporarily work around a bug in BuildKit `COPY --link` by disabling mergeop/diffop optimization. [moby/moby#45112](https://github.com/moby/moby/pull/45112)
- Properly clean up child tasks when a parent Swarm job is removed. [moby/swarmkit#3112](https://github.com/moby/swarmkit/pull/3112), [moby/moby#45107](https://github.com/moby/moby/pull/45107)
- Fix Swarm service creation logic so that both a GenericResource and a non-default network can be used together. [moby/swarmkit#3082](https://github.com/moby/swarmkit/pull/3082), [moby/moby#45107](https://github.com/moby/moby/pull/45107)
- Fix Swarm CSI support requiring the CSI plugin to offer staging endpoints in order to publish a volume. [moby/swarmkit#3116](https://github.com/moby/swarmkit/pull/3116), [moby/moby#45107](https://github.com/moby/moby/pull/45107)
- Fix a panic caused by log buffering in some configurations. [containerd/fifo#47](https://github.com/containerd/fifo/pull/47), [moby/moby#45051](https://github.com/moby/moby/pull/45051)
- Log errors in the REST to Swarm gRPC API translation layer at the debug level to reduce redundancy and noise. [moby/moby#45016](https://github.com/moby/moby/pull/45016)
- Fix a DNS resolution issue affecting containers created with `--dns-opt` or `--dns-search` when `systemd-resolved` is used outside the container. [moby/moby#45000](https://github.com/moby/moby/pull/45000)
- Fix a panic when logging errors in handling DNS queries originating from inside a container. [moby/moby#44980](https://github.com/moby/moby/pull/44980)
- Improve the speed of `docker ps` by allowing users to opt out of size calculations with `--size=false`. [docker/cli#4107](https://github.com/docker/cli/pull/4107)
- Extend support for Bash completion to all plugins. [docker/cli#4092](https://github.com/docker/cli/pull/4092)
- Fix `docker stack deploy` failing on Windows when special environment variables set by `cmd.exe` are present. [docker/cli#4083](https://github.com/docker/cli/pull/4083)
- Add forward compatibility for future API versions by considering empty image tags to be the same as `<none>`. [docker/cli#4065](https://github.com/docker/cli/pull/4065)
- Atomically write context files to greatly reduce the probability of corruption, and improve the error message for a corrupt context. [docker/cli#4063](https://github.com/docker/cli/pull/4063)
@z

@x
### Packaging
@y
### Packaging
@z

@x
- Upgrade Go to `1.19.7`. [docker/docker-ce-packaging#857](https://github.com/docker/docker-ce-packaging/pull/857), [docker/cli#4086](https://github.com/docker/cli/pull/4086), [moby/moby#45137](https://github.com/moby/moby/pull/45137)
- Upgrade `containerd` to `v1.6.19`. [moby/moby#45084](https://github.com/moby/moby/pull/45084), [moby/moby#45099](https://github.com/moby/moby/pull/45099)
- Upgrade Buildx to `v0.10.4`. [docker/docker-ce-packaging#855](https://github.com/docker/docker-ce-packaging/pull/855)
- Upgrade Compose to `v2.17.2`. [docker/docker-ce-packaging#867](https://github.com/docker/docker-ce-packaging/pull/867)
@y
- Upgrade Go to `1.19.7`. [docker/docker-ce-packaging#857](https://github.com/docker/docker-ce-packaging/pull/857), [docker/cli#4086](https://github.com/docker/cli/pull/4086), [moby/moby#45137](https://github.com/moby/moby/pull/45137)
- Upgrade `containerd` to `v1.6.19`. [moby/moby#45084](https://github.com/moby/moby/pull/45084), [moby/moby#45099](https://github.com/moby/moby/pull/45099)
- Upgrade Buildx to `v0.10.4`. [docker/docker-ce-packaging#855](https://github.com/docker/docker-ce-packaging/pull/855)
- Upgrade Compose to `v2.17.2`. [docker/docker-ce-packaging#867](https://github.com/docker/docker-ce-packaging/pull/867)
@z

@x
## 23.0.1
@y
## 23.0.1
@z

@x
{{< release-date date="2023-02-09" >}}
@y
{{< release-date date="2023-02-09" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 23.0.1 milestone](https://github.com/docker/cli/milestone/73?closed=1)
- [moby/moby, 23.0.1 milestone](https://github.com/moby/moby/milestone/113?closed=1)
@y
- [docker/cli, 23.0.1 milestone](https://github.com/docker/cli/milestone/73?closed=1)
- [moby/moby, 23.0.1 milestone](https://github.com/moby/moby/milestone/113?closed=1)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix containers not starting if the kernel has AppArmor enabled, but `apparmor_parser` is not available. [moby/moby#44942](https://github.com/moby/moby/pull/44942)
- Fix BuildKit-enabled builds with inline caching causing the daemon to crash. [moby/moby#44944](https://github.com/moby/moby/pull/44944)
- Fix BuildKit improperly loading cached layers created by previous versions. [moby/moby#44959](https://github.com/moby/moby/pull/44959)
- Fix an issue where `ipvlan` networks created prior to upgrading would prevent the daemon from starting. [moby/moby#44937](https://github.com/moby/moby/pull/44937)
- Fix the `overlay2` storage driver failing early in `metacopy` testing when initialized on an unsupported backing filesystem. [moby/moby#44922](https://github.com/moby/moby/pull/44922)
- Fix `exec` exit events being misinterpreted as container exits under some runtimes, such as Kata Containers. [moby/moby#44892](https://github.com/moby/moby/pull/44892)
- Improve the error message returned by the CLI when receiving a truncated JSON response caused by the API hanging up mid-request. [docker/cli#4004](https://github.com/docker/cli/pull/4004)
- Fix an incorrect CLI exit code when attempting to execute a directory with a `runc` compiled using Go 1.20. [docker/cli#4004](https://github.com/docker/cli/pull/4004)
- Fix mishandling the size argument to `--device-write-bps` as a path. [docker/cli#4004](https://github.com/docker/cli/pull/4004)
@y
- Fix containers not starting if the kernel has AppArmor enabled, but `apparmor_parser` is not available. [moby/moby#44942](https://github.com/moby/moby/pull/44942)
- Fix BuildKit-enabled builds with inline caching causing the daemon to crash. [moby/moby#44944](https://github.com/moby/moby/pull/44944)
- Fix BuildKit improperly loading cached layers created by previous versions. [moby/moby#44959](https://github.com/moby/moby/pull/44959)
- Fix an issue where `ipvlan` networks created prior to upgrading would prevent the daemon from starting. [moby/moby#44937](https://github.com/moby/moby/pull/44937)
- Fix the `overlay2` storage driver failing early in `metacopy` testing when initialized on an unsupported backing filesystem. [moby/moby#44922](https://github.com/moby/moby/pull/44922)
- Fix `exec` exit events being misinterpreted as container exits under some runtimes, such as Kata Containers. [moby/moby#44892](https://github.com/moby/moby/pull/44892)
- Improve the error message returned by the CLI when receiving a truncated JSON response caused by the API hanging up mid-request. [docker/cli#4004](https://github.com/docker/cli/pull/4004)
- Fix an incorrect CLI exit code when attempting to execute a directory with a `runc` compiled using Go 1.20. [docker/cli#4004](https://github.com/docker/cli/pull/4004)
- Fix mishandling the size argument to `--device-write-bps` as a path. [docker/cli#4004](https://github.com/docker/cli/pull/4004)
@z

@x
### Packaging
@y
### Packaging
@z

@x
- Add `/etc/docker` to RPM and DEB packaging. [docker/docker-ce-packaging#842](https://github.com/docker/docker-ce-packaging/pull/842)
  - Not all use cases will benefit; if you depend on this, you should explicitly `mkdir -p /etc/docker`.
- Upgrade Compose to `v2.16.0`. [docker/docker-ce-packaging#844](https://github.com/docker/docker-ce-packaging/pull/844)
@y
- Add `/etc/docker` to RPM and DEB packaging. [docker/docker-ce-packaging#842](https://github.com/docker/docker-ce-packaging/pull/842)
  - Not all use cases will benefit; if you depend on this, you should explicitly `mkdir -p /etc/docker`.
- Upgrade Compose to `v2.16.0`. [docker/docker-ce-packaging#844](https://github.com/docker/docker-ce-packaging/pull/844)
@z

@x
## 23.0.0
@y
## 23.0.0
@z

@x
{{< release-date date="2023-02-01" >}}
@y
{{< release-date date="2023-02-01" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 23.0.0 milestone](https://github.com/docker/cli/milestone/51?closed=1)
- [moby/moby, 23.0.0 milestone](https://github.com/moby/moby/milestone/91?closed=1)
@y
- [docker/cli, 23.0.0 milestone](https://github.com/docker/cli/milestone/51?closed=1)
- [moby/moby, 23.0.0 milestone](https://github.com/moby/moby/milestone/91?closed=1)
@z

@x
### New
@y
### New
@z

@x
- Set Buildx and BuildKit as the default builder on Linux. [moby/moby#43992](https://github.com/moby/moby/pull/43992)
  - Alias `docker build` to `docker buildx build`. [docker/cli#3314](https://github.com/docker/cli/pull/3314)
  - The legacy builder can still be used by explicitly setting `DOCKER_BUILDKIT=0`.
  - There are differences in how BuildKit and the legacy builder handle multi-stage builds. For more information, see
    [Multi-stage builds](../../build/building/multi-stage.md#differences-between-legacy-builder-and-buildkit).
- Add support for pulling `zstd` compressed layers. [moby/moby#41759](https://github.com/moby/moby/pull/41759), [moby/moby#42862](https://github.com/moby/moby/pull/42862)
- Add support for alternate OCI runtimes on Linux, compatible with the containerd runtime v2 API. [moby/moby#43887](https://github.com/moby/moby/pull/43887), [moby/moby#43993](https://github.com/moby/moby/pull/43993)
- Add support for the containerd `runhcs` shim on Windows (off by default). [moby/moby#42089](https://github.com/moby/moby/pull/42089)
- Add `dockerd --validate` to check the daemon JSON config and exit. [moby/moby#42393](https://github.com/moby/moby/pull/42393)
- Add the ability to configure the daemon's HTTP proxy via flags or JSON config. [moby/moby#42835](https://github.com/moby/moby/pull/42835)
- Add support for RFC 3021 point-to-point networks (IPv4 /31s) and single hosts (IPv4 /32s). For networks with two or fewer addresses, IPAM won't reserve a network and broadcast address. [moby/moby#42626](https://github.com/moby/moby/pull/42626)
- Add support for setting `ipvlan_flag` and using the `l3s` `ipvlan_mode` in the `ipvlan` network driver. [moby/moby#42542](https://github.com/moby/moby/pull/42542)
- Add support for displaying the value of the `metacopy` option for the `overlay2` storage driver. [moby/moby#43557](https://github.com/moby/moby/pull/43557)
- Add support for describing Windows devices using the syntax `IDType://ID`. [moby/moby#43368](https://github.com/moby/moby/pull/43368)
- Add `RootlessKit`, `slirp4netns`, and `VPNKit` version reporting. [moby/moby#42330](https://github.com/moby/moby/pull/42330)
- Add experimental support for SwarmKit cluster volumes (CSI). [moby/moby#41982](https://github.com/moby/moby/pull/41982)
  - CLI: Add cluster volume (CSI) options to `docker volume`. [docker/cli#3606](https://github.com/docker/cli/pull/3606)
  - CLI: Add cluster volume (CSI) support to `docker stack`. [docker/cli#3662](https://github.com/docker/cli/pull/3662)
- Add support for SwarmKit jobs in `docker stack deploy`. [docker/cli#2907](https://github.com/docker/cli/pull/2907)
- Add the `docker stack config` command to output the merged and interpolated config files as utilized by `stack deploy`. [docker/cli#3544](https://github.com/docker/cli/pull/3544)
- Add a new `docker context show` command that prints the name of the current context. [docker/cli#3567](https://github.com/docker/cli/pull/3567)
- Add the `--format=json` shorthand variant of `--format="{{ json . }}"` to all commands supporting the `--format` flag. [docker/cli#2936](https://github.com/docker/cli/pull/2936)
- Add a `--quiet` option to `docker create` and `docker run` commands to suppress output when pulling an image. [docker/cli#3377](https://github.com/docker/cli/pull/3377)
- Add a `--force` option to `docker network rm` subcommand. Causes CLI to return a 0 exit code even if the network doesn't exist. Has no effect on the server-side procedure for removing a network. [docker/cli#3547](https://github.com/docker/cli/pull/3547)
- Add a `--signal` option to `docker stop` and `docker restart`. [docker/cli#3614](https://github.com/docker/cli/pull/3614)
- Add a `-v/--version` flag to `docker-proxy`. [moby/moby#44703](https://github.com/moby/moby/pull/44703)
- Plugins are now discovered in well-known user-level paths when the daemon is running in rootless mode. [moby/moby#44778](https://github.com/moby/moby/pull/44778)
- The daemon now handles common alternate JSON encodings in the JSON configuration file gracefully, and reports useful errors. [moby/moby#44777](https://github.com/moby/moby/pull/44777), [moby/moby#44832](https://github.com/moby/moby/pull/44832)
  - UTF-8 with a byte order mark is accepted.
  - UTF-16 with a byte order mark is accepted.
  - Invalid UTF-8 is reported early and with a comprehensible error message.
- Allow use of `STOPSIGNAL` via `docker commit`. [moby/moby#43369](https://github.com/moby/moby/pull/43369)
- Add a new option to the `awslogs` log driver to allow skipping log stream creation in CloudWatch. [moby/moby#42132](https://github.com/moby/moby/pull/42132)
- Add a new option to the `awslogs` log driver to specify the log format that's sent to CloudWatch. [moby/moby#42838](https://github.com/moby/moby/pull/42838)
- Add a new option to the `fluentd` log driver to set the reconnection interval. [moby/moby#43100](https://github.com/moby/moby/pull/43100)
- Add new options-setters to the Go API client: `WithTLSClientConfigFromEnv()`, `WithHostFromEnv()`, and `WithVersionFromEnv()`. [moby/moby#42224](https://github.com/moby/moby/pull/42224)
- Add generation of shell command completion through a `docker completion` subcommand. [docker/cli#3429](https://github.com/docker/cli/pull/3429)
- API: Add a `Swarm` header to `GET /_ping` and `HEAD /_ping`, allowing single-request detection of Swarm support. [moby/moby#42064](https://github.com/moby/moby/pull/42064)
- API: Add a `signal` parameter to `POST /containers/{id}/stop` and `POST /containers/{id}/restart` to set the signal used. [moby/moby#43206](https://github.com/moby/moby/pull/43206)
- API: Add a `CreateMountPoint` parameter to `POST /containers/create`. [moby/moby#43484](https://github.com/moby/moby/pull/43484)
- API: Add a `shared-size` parameter to `GET /images/json` to enable shared-size computation of images. [moby/moby#42531](https://github.com/moby/moby/pull/42531)
- API: Add a `type` parameter to `GET /system/df`, to control what object types to are considered when computing disk usage. [moby/moby#42559](https://github.com/moby/moby/pull/42559)
- systemd: Use a systemd-managed containerd instead of a daemon-managed containerd. [moby/moby#42373](https://github.com/moby/moby/pull/42373)
- systemd: Start `docker.service` after `time-set.target`. [moby/moby#43107](https://github.com/moby/moby/pull/43107)
@y
- Set Buildx and BuildKit as the default builder on Linux. [moby/moby#43992](https://github.com/moby/moby/pull/43992)
  - Alias `docker build` to `docker buildx build`. [docker/cli#3314](https://github.com/docker/cli/pull/3314)
  - The legacy builder can still be used by explicitly setting `DOCKER_BUILDKIT=0`.
  - There are differences in how BuildKit and the legacy builder handle multi-stage builds. For more information, see
    [Multi-stage builds](../../build/building/multi-stage.md#differences-between-legacy-builder-and-buildkit).
- Add support for pulling `zstd` compressed layers. [moby/moby#41759](https://github.com/moby/moby/pull/41759), [moby/moby#42862](https://github.com/moby/moby/pull/42862)
- Add support for alternate OCI runtimes on Linux, compatible with the containerd runtime v2 API. [moby/moby#43887](https://github.com/moby/moby/pull/43887), [moby/moby#43993](https://github.com/moby/moby/pull/43993)
- Add support for the containerd `runhcs` shim on Windows (off by default). [moby/moby#42089](https://github.com/moby/moby/pull/42089)
- Add `dockerd --validate` to check the daemon JSON config and exit. [moby/moby#42393](https://github.com/moby/moby/pull/42393)
- Add the ability to configure the daemon's HTTP proxy via flags or JSON config. [moby/moby#42835](https://github.com/moby/moby/pull/42835)
- Add support for RFC 3021 point-to-point networks (IPv4 /31s) and single hosts (IPv4 /32s). For networks with two or fewer addresses, IPAM won't reserve a network and broadcast address. [moby/moby#42626](https://github.com/moby/moby/pull/42626)
- Add support for setting `ipvlan_flag` and using the `l3s` `ipvlan_mode` in the `ipvlan` network driver. [moby/moby#42542](https://github.com/moby/moby/pull/42542)
- Add support for displaying the value of the `metacopy` option for the `overlay2` storage driver. [moby/moby#43557](https://github.com/moby/moby/pull/43557)
- Add support for describing Windows devices using the syntax `IDType://ID`. [moby/moby#43368](https://github.com/moby/moby/pull/43368)
- Add `RootlessKit`, `slirp4netns`, and `VPNKit` version reporting. [moby/moby#42330](https://github.com/moby/moby/pull/42330)
- Add experimental support for SwarmKit cluster volumes (CSI). [moby/moby#41982](https://github.com/moby/moby/pull/41982)
  - CLI: Add cluster volume (CSI) options to `docker volume`. [docker/cli#3606](https://github.com/docker/cli/pull/3606)
  - CLI: Add cluster volume (CSI) support to `docker stack`. [docker/cli#3662](https://github.com/docker/cli/pull/3662)
- Add support for SwarmKit jobs in `docker stack deploy`. [docker/cli#2907](https://github.com/docker/cli/pull/2907)
- Add the `docker stack config` command to output the merged and interpolated config files as utilized by `stack deploy`. [docker/cli#3544](https://github.com/docker/cli/pull/3544)
- Add a new `docker context show` command that prints the name of the current context. [docker/cli#3567](https://github.com/docker/cli/pull/3567)
- Add the `--format=json` shorthand variant of `--format="{{ json . }}"` to all commands supporting the `--format` flag. [docker/cli#2936](https://github.com/docker/cli/pull/2936)
- Add a `--quiet` option to `docker create` and `docker run` commands to suppress output when pulling an image. [docker/cli#3377](https://github.com/docker/cli/pull/3377)
- Add a `--force` option to `docker network rm` subcommand. Causes CLI to return a 0 exit code even if the network doesn't exist. Has no effect on the server-side procedure for removing a network. [docker/cli#3547](https://github.com/docker/cli/pull/3547)
- Add a `--signal` option to `docker stop` and `docker restart`. [docker/cli#3614](https://github.com/docker/cli/pull/3614)
- Add a `-v/--version` flag to `docker-proxy`. [moby/moby#44703](https://github.com/moby/moby/pull/44703)
- Plugins are now discovered in well-known user-level paths when the daemon is running in rootless mode. [moby/moby#44778](https://github.com/moby/moby/pull/44778)
- The daemon now handles common alternate JSON encodings in the JSON configuration file gracefully, and reports useful errors. [moby/moby#44777](https://github.com/moby/moby/pull/44777), [moby/moby#44832](https://github.com/moby/moby/pull/44832)
  - UTF-8 with a byte order mark is accepted.
  - UTF-16 with a byte order mark is accepted.
  - Invalid UTF-8 is reported early and with a comprehensible error message.
- Allow use of `STOPSIGNAL` via `docker commit`. [moby/moby#43369](https://github.com/moby/moby/pull/43369)
- Add a new option to the `awslogs` log driver to allow skipping log stream creation in CloudWatch. [moby/moby#42132](https://github.com/moby/moby/pull/42132)
- Add a new option to the `awslogs` log driver to specify the log format that's sent to CloudWatch. [moby/moby#42838](https://github.com/moby/moby/pull/42838)
- Add a new option to the `fluentd` log driver to set the reconnection interval. [moby/moby#43100](https://github.com/moby/moby/pull/43100)
- Add new options-setters to the Go API client: `WithTLSClientConfigFromEnv()`, `WithHostFromEnv()`, and `WithVersionFromEnv()`. [moby/moby#42224](https://github.com/moby/moby/pull/42224)
- Add generation of shell command completion through a `docker completion` subcommand. [docker/cli#3429](https://github.com/docker/cli/pull/3429)
- API: Add a `Swarm` header to `GET /_ping` and `HEAD /_ping`, allowing single-request detection of Swarm support. [moby/moby#42064](https://github.com/moby/moby/pull/42064)
- API: Add a `signal` parameter to `POST /containers/{id}/stop` and `POST /containers/{id}/restart` to set the signal used. [moby/moby#43206](https://github.com/moby/moby/pull/43206)
- API: Add a `CreateMountPoint` parameter to `POST /containers/create`. [moby/moby#43484](https://github.com/moby/moby/pull/43484)
- API: Add a `shared-size` parameter to `GET /images/json` to enable shared-size computation of images. [moby/moby#42531](https://github.com/moby/moby/pull/42531)
- API: Add a `type` parameter to `GET /system/df`, to control what object types to are considered when computing disk usage. [moby/moby#42559](https://github.com/moby/moby/pull/42559)
- systemd: Use a systemd-managed containerd instead of a daemon-managed containerd. [moby/moby#42373](https://github.com/moby/moby/pull/42373)
- systemd: Start `docker.service` after `time-set.target`. [moby/moby#43107](https://github.com/moby/moby/pull/43107)
@z

@x
### Removed
@y
### Removed
@z

@x
- Remove support for reading configuration from `~/.dockercfg`. [docker/cli#2504](https://github.com/docker/cli/pull/2504)
  - This location has been deprecated since 1.7.0.
  - [Deprecation notice](../deprecated.md#support-for-legacy-dockercfg-configuration-files)
- Remove the `-g` and `--graph` daemon options in favor of `--data-root`. [docker/cli#3739](https://github.com/docker/cli/pull/3739)
  - These options have been hidden and deprecated since 17.05.
  - [Deprecation notice](../deprecated.md#-g-and---graph-flags-on-dockerd)
- Remove client-side sorting of results, in favor of the order in which the search API returns. [docker/cli#3470](https://github.com/docker/cli/pull/3470)
- Remove warnings related to deprecated storage drivers from the CLI. Warnings are now handled by the daemon instead. [docker/cli#3542](https://github.com/docker/cli/pull/3542)
- Remove `Experimental` client field from `docker version`. [docker/cli#3543](https://github.com/docker/cli/pull/3543)
  - [Deprecation notice](../deprecated.md#configuration-options-for-experimental-cli-features)
- Require explicit opt-in to use deprecated storage drivers, and don't automatically select them when upgrading. [moby/moby#43378](https://github.com/moby/moby/pull/43378)
- Remove deprecated support for `overlay` and `overlay2` storage drivers on backing filesystems without `d_type` support. [moby/moby#43472](https://github.com/moby/moby/pull/43472)
  - [Deprecation notice](../deprecated.md#backing-filesystem-without-d_type-support-for-overlayoverlay2)
- Remove the deprecated `overrideKernelCheck` option from the `overlay2` storage driver. [moby/moby#44279](https://github.com/moby/moby/pull/44279)
  [Deprecation notice](../deprecated.md#support-for-the-overlay2override_kernel_check-storage-option)
- Remove support for the deprecated `io.containerd.runtime.v1.linux` OCI runtime. [moby/moby#43695](https://github.com/moby/moby/pull/43695)
- Remove LCOW (Linux Containers on Windows). [moby/moby#42451](https://github.com/moby/moby/pull/42451), [moby/moby#42499](https://github.com/moby/moby/pull/42499), [moby/moby#42506](https://github.com/moby/moby/pull/42506), [moby/moby#42511](https://github.com/moby/moby/pull/42511), [moby/moby#42520](https://github.com/moby/moby/pull/42520), [moby/moby#42683](https://github.com/moby/moby/pull/42683), [moby/moby#42684](https://github.com/moby/moby/pull/42684), [moby/moby#42685](https://github.com/moby/moby/pull/42685), [moby/moby#43187](https://github.com/moby/moby/pull/43187)
  - LCOW was introduced as a technical preview in 17.09 and deprecated in 20.10.
  - [Deprecation notice](../deprecated.md#linux-containers-on-windows-lcow-experimental)
- Remove daemon options related to legacy overlay networks used with standalone Swarm.
  - Remove `--cluster-xx` options from `dockerd`. [moby/moby#40383](https://github.com/moby/moby/issues/40383)
  - Remove `host-discovery` and overlay networks with external k/v stores. [moby/moby#42247](https://github.com/moby/moby/pull/42247)
  - [Deprecation notice](../deprecated.md#classic-swarm-and-overlay-networks-using-cluster-store)
- Remove a deprecated `arm` platform fallback. `--platform linux/arm/vY` will now return a error when `arm/vY` isn't available instead of pulling the wrong image. [moby/moby#44414](https://github.com/moby/moby/pull/44414)
- Remove the deprecated `SetCustomHTTPHeaders()`, `CustomHTTPHeaders()` options-setters from the Go client API. [moby/moby#42694](https://github.com/moby/moby/pull/42694)
- Remove the deprecated `WithDialer()` option-setter from the Go client API. [moby/moby#44022](https://github.com/moby/moby/pull/44022)
  - Use `WithDialContext()` instead.
- Remove the daemon implementation of `opts.QuotedString`. The implementation has moved to the CLI. [moby/moby#43250](https://github.com/moby/moby/pull/43250)
- Remove separate daemon ID from trust-key in the daemon, and disable generating the trust-key. [moby/moby#43555](https://github.com/moby/moby/pull/43555)
- API: Remove the deprecated `KernelMemory` option from `POST /containers/create` on API version >= 1.42. [moby/moby#43214](https://github.com/moby/moby/pull/43214)
  - [Deprecation notice](../deprecated.md#kernel-memory-limit)
@y
- Remove support for reading configuration from `~/.dockercfg`. [docker/cli#2504](https://github.com/docker/cli/pull/2504)
  - This location has been deprecated since 1.7.0.
  - [Deprecation notice](../deprecated.md#support-for-legacy-dockercfg-configuration-files)
- Remove the `-g` and `--graph` daemon options in favor of `--data-root`. [docker/cli#3739](https://github.com/docker/cli/pull/3739)
  - These options have been hidden and deprecated since 17.05.
  - [Deprecation notice](../deprecated.md#-g-and---graph-flags-on-dockerd)
- Remove client-side sorting of results, in favor of the order in which the search API returns. [docker/cli#3470](https://github.com/docker/cli/pull/3470)
- Remove warnings related to deprecated storage drivers from the CLI. Warnings are now handled by the daemon instead. [docker/cli#3542](https://github.com/docker/cli/pull/3542)
- Remove `Experimental` client field from `docker version`. [docker/cli#3543](https://github.com/docker/cli/pull/3543)
  - [Deprecation notice](../deprecated.md#configuration-options-for-experimental-cli-features)
- Require explicit opt-in to use deprecated storage drivers, and don't automatically select them when upgrading. [moby/moby#43378](https://github.com/moby/moby/pull/43378)
- Remove deprecated support for `overlay` and `overlay2` storage drivers on backing filesystems without `d_type` support. [moby/moby#43472](https://github.com/moby/moby/pull/43472)
  - [Deprecation notice](../deprecated.md#backing-filesystem-without-d_type-support-for-overlayoverlay2)
- Remove the deprecated `overrideKernelCheck` option from the `overlay2` storage driver. [moby/moby#44279](https://github.com/moby/moby/pull/44279)
  [Deprecation notice](../deprecated.md#support-for-the-overlay2override_kernel_check-storage-option)
- Remove support for the deprecated `io.containerd.runtime.v1.linux` OCI runtime. [moby/moby#43695](https://github.com/moby/moby/pull/43695)
- Remove LCOW (Linux Containers on Windows). [moby/moby#42451](https://github.com/moby/moby/pull/42451), [moby/moby#42499](https://github.com/moby/moby/pull/42499), [moby/moby#42506](https://github.com/moby/moby/pull/42506), [moby/moby#42511](https://github.com/moby/moby/pull/42511), [moby/moby#42520](https://github.com/moby/moby/pull/42520), [moby/moby#42683](https://github.com/moby/moby/pull/42683), [moby/moby#42684](https://github.com/moby/moby/pull/42684), [moby/moby#42685](https://github.com/moby/moby/pull/42685), [moby/moby#43187](https://github.com/moby/moby/pull/43187)
  - LCOW was introduced as a technical preview in 17.09 and deprecated in 20.10.
  - [Deprecation notice](../deprecated.md#linux-containers-on-windows-lcow-experimental)
- Remove daemon options related to legacy overlay networks used with standalone Swarm.
  - Remove `--cluster-xx` options from `dockerd`. [moby/moby#40383](https://github.com/moby/moby/issues/40383)
  - Remove `host-discovery` and overlay networks with external k/v stores. [moby/moby#42247](https://github.com/moby/moby/pull/42247)
  - [Deprecation notice](../deprecated.md#classic-swarm-and-overlay-networks-using-cluster-store)
- Remove a deprecated `arm` platform fallback. `--platform linux/arm/vY` will now return a error when `arm/vY` isn't available instead of pulling the wrong image. [moby/moby#44414](https://github.com/moby/moby/pull/44414)
- Remove the deprecated `SetCustomHTTPHeaders()`, `CustomHTTPHeaders()` options-setters from the Go client API. [moby/moby#42694](https://github.com/moby/moby/pull/42694)
- Remove the deprecated `WithDialer()` option-setter from the Go client API. [moby/moby#44022](https://github.com/moby/moby/pull/44022)
  - Use `WithDialContext()` instead.
- Remove the daemon implementation of `opts.QuotedString`. The implementation has moved to the CLI. [moby/moby#43250](https://github.com/moby/moby/pull/43250)
- Remove separate daemon ID from trust-key in the daemon, and disable generating the trust-key. [moby/moby#43555](https://github.com/moby/moby/pull/43555)
- API: Remove the deprecated `KernelMemory` option from `POST /containers/create` on API version >= 1.42. [moby/moby#43214](https://github.com/moby/moby/pull/43214)
  - [Deprecation notice](../deprecated.md#kernel-memory-limit)
@z

@x
### Deprecated
@y
### Deprecated
@z

@x
- Require Windows Server RS5 / LTSC 2019 (build 17763) as the minimum to run the daemon. [moby/moby#43254](https://github.com/moby/moby/pull/43254)
- Deprecate `BuilderSize` on API version >= 1.42. [moby/moby#42608](https://github.com/moby/moby/pull/42608)
- Deprecate `BuildCache.Parent` in favor of the newly introduced `BuildCache.Parents` on API version >= 1.42. [moby/moby#43908](https://github.com/moby/moby/pull/43908)
- Deprecate `pkg/urlutil`, moving the implementation to `builder/remotecontext/urlutil`. [moby/moby#43477](https://github.com/moby/moby/pull/43477)
@y
- Require Windows Server RS5 / LTSC 2019 (build 17763) as the minimum to run the daemon. [moby/moby#43254](https://github.com/moby/moby/pull/43254)
- Deprecate `BuilderSize` on API version >= 1.42. [moby/moby#42608](https://github.com/moby/moby/pull/42608)
- Deprecate `BuildCache.Parent` in favor of the newly introduced `BuildCache.Parents` on API version >= 1.42. [moby/moby#43908](https://github.com/moby/moby/pull/43908)
- Deprecate `pkg/urlutil`, moving the implementation to `builder/remotecontext/urlutil`. [moby/moby#43477](https://github.com/moby/moby/pull/43477)
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- Upgrade Go to `1.19.5`. [docker/cli#3958](https://github.com/docker/cli/pull/3958), [moby/moby#44794](https://github.com/moby/moby/pull/44794)
- Upgrade `rootlesskit` to `v0.14.4`. [moby/moby#42708](https://github.com/moby/moby/pull/42708)
- Upgrade `buildkit` to `v0.10.6`. [moby/moby#43239](https://github.com/moby/moby/pull/43239)
- Upgrade `buildx` to `v0.10.2`. [docker/docker-ce-packaging#840](https://github.com/docker/docker-ce-packaging/pull/840)
- Upgrade `swarmkit` to `v2.0.0-20230119195359-904c221ac281`. [moby/moby#44858](https://github.com/moby/moby/pull/44858)
- Upgrade `containerd` to `v1.6.16`. [moby/moby#44766](https://github.com/moby/moby/pull/44766), [moby/moby#44769](https://github.com/moby/moby/pull/44769), [moby/moby#44881](https://github.com/moby/moby/pull/44881)
- Upgrade `runc` to `v1.1.4`. [moby/moby#44039](https://github.com/moby/moby/pull/44039)
- Upgrade `hcsshim` `v0.9.6`. [moby/moby#44658](https://github.com/moby/moby/pull/44658)
- The `btrfs` storage driver now depends on Linux kernel headers (>= 4.12) instead of headers from btrfs-progs. [moby/moby#44776](https://github.com/moby/moby/pull/44776)
@y
- Upgrade Go to `1.19.5`. [docker/cli#3958](https://github.com/docker/cli/pull/3958), [moby/moby#44794](https://github.com/moby/moby/pull/44794)
- Upgrade `rootlesskit` to `v0.14.4`. [moby/moby#42708](https://github.com/moby/moby/pull/42708)
- Upgrade `buildkit` to `v0.10.6`. [moby/moby#43239](https://github.com/moby/moby/pull/43239)
- Upgrade `buildx` to `v0.10.2`. [docker/docker-ce-packaging#840](https://github.com/docker/docker-ce-packaging/pull/840)
- Upgrade `swarmkit` to `v2.0.0-20230119195359-904c221ac281`. [moby/moby#44858](https://github.com/moby/moby/pull/44858)
- Upgrade `containerd` to `v1.6.16`. [moby/moby#44766](https://github.com/moby/moby/pull/44766), [moby/moby#44769](https://github.com/moby/moby/pull/44769), [moby/moby#44881](https://github.com/moby/moby/pull/44881)
- Upgrade `runc` to `v1.1.4`. [moby/moby#44039](https://github.com/moby/moby/pull/44039)
- Upgrade `hcsshim` `v0.9.6`. [moby/moby#44658](https://github.com/moby/moby/pull/44658)
- The `btrfs` storage driver now depends on Linux kernel headers (>= 4.12) instead of headers from btrfs-progs. [moby/moby#44776](https://github.com/moby/moby/pull/44776)
@z

@x
### Security
@y
### Security
@z

@x
- Change permissions on container `hostconfig.json` files to `0600` (was `0644`). [moby/moby#41620](https://github.com/moby/moby/pull/41620)
- Fix `--seccomp-profile` not accepting `unconfined` and renamed the default seccomp profile to `builtin`. [moby/moby#42481](https://github.com/moby/moby/pull/42481)
- Always build with seccomp support, and remove the `seccomp` build tag. [moby/moby#42501](https://github.com/moby/moby/pull/42501)
- Add seccomp support on `riscv64`. [moby/moby#43553](https://github.com/moby/moby/pull/43553)
- Add support for setting flags passed to `seccomp(2)` in seccomp profiles. [moby/moby#42648](https://github.com/moby/moby/pull/42648)
- Refactor seccomp types to reuse runtime-spec, and add support for `ErrnoRet`. [moby/moby#42005](https://github.com/moby/moby/pull/42005)
- Add support for `DefaultErrnoRet` in `seccomp` profiles. [moby/moby#42604](https://github.com/moby/moby/pull/42604)
- Add an explicit `DefaultErrnoRet` field to the default seccomp profile, with no behavior change. [moby/moby#42649](https://github.com/moby/moby/pull/42649)
- Block `socket` with `AF_VSOCK` in the default seccomp profile. [moby/moby#44563](https://github.com/moby/moby/pull/44563)
- Re-enable `process_vm_readv` and `process_vm_writev` in the default seccomp profile. [moby/moby#42083](https://github.com/moby/moby/pull/42083)
- Add syscalls related to PKU to the default seccomp profile. [moby/moby#43812](https://github.com/moby/moby/pull/43812)
- Allow `clock_settime64` with `CAP_SYS_TIME`. [moby/moby#43775](https://github.com/moby/moby/pull/43775)
- Allow `bpf` with `CAP_BPF` and `perf_event_open` with `CAP_PERFMON`. [moby/moby#43988](https://github.com/moby/moby/pull/43988)
- Explicitly set the `clone3` syscall to return `ENOSYS` in the default seccomp profile, in order to ensure `glibc` will correctly fallback to using `clone`. [moby/moby#42681](https://github.com/moby/moby/pull/42681)
@y
- Change permissions on container `hostconfig.json` files to `0600` (was `0644`). [moby/moby#41620](https://github.com/moby/moby/pull/41620)
- Fix `--seccomp-profile` not accepting `unconfined` and renamed the default seccomp profile to `builtin`. [moby/moby#42481](https://github.com/moby/moby/pull/42481)
- Always build with seccomp support, and remove the `seccomp` build tag. [moby/moby#42501](https://github.com/moby/moby/pull/42501)
- Add seccomp support on `riscv64`. [moby/moby#43553](https://github.com/moby/moby/pull/43553)
- Add support for setting flags passed to `seccomp(2)` in seccomp profiles. [moby/moby#42648](https://github.com/moby/moby/pull/42648)
- Refactor seccomp types to reuse runtime-spec, and add support for `ErrnoRet`. [moby/moby#42005](https://github.com/moby/moby/pull/42005)
- Add support for `DefaultErrnoRet` in `seccomp` profiles. [moby/moby#42604](https://github.com/moby/moby/pull/42604)
- Add an explicit `DefaultErrnoRet` field to the default seccomp profile, with no behavior change. [moby/moby#42649](https://github.com/moby/moby/pull/42649)
- Block `socket` with `AF_VSOCK` in the default seccomp profile. [moby/moby#44563](https://github.com/moby/moby/pull/44563)
- Re-enable `process_vm_readv` and `process_vm_writev` in the default seccomp profile. [moby/moby#42083](https://github.com/moby/moby/pull/42083)
- Add syscalls related to PKU to the default seccomp profile. [moby/moby#43812](https://github.com/moby/moby/pull/43812)
- Allow `clock_settime64` with `CAP_SYS_TIME`. [moby/moby#43775](https://github.com/moby/moby/pull/43775)
- Allow `bpf` with `CAP_BPF` and `perf_event_open` with `CAP_PERFMON`. [moby/moby#43988](https://github.com/moby/moby/pull/43988)
- Explicitly set the `clone3` syscall to return `ENOSYS` in the default seccomp profile, in order to ensure `glibc` will correctly fallback to using `clone`. [moby/moby#42681](https://github.com/moby/moby/pull/42681)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Promote `overlay2` to be the default storage driver (`btrfs` and `zfs` are now opt-in). [moby/moby#42661](https://github.com/moby/moby/pull/42661)
- Add a loading spinner to the `docker cp` command. [docker/cli#2708](https://github.com/docker/cli/pull/2708)
- Deprecate the `ElectAuthServer` function, and made it return the default registry without calling the `GET /info` API endpoint. [docker/cli#2819](https://github.com/docker/cli/pull/2819)
- Progress bars are no longer reversed when rolling back Swarm services. [docker/cli#2940](https://github.com/docker/cli/pull/2940)
- Use `net.JoinHostPort()` to fix formatting with IPv6 addresses. [docker/cli#2972](https://github.com/docker/cli/pull/2972)
- CLI error messages are now printed to `stderr`. [docker/cli#3044](https://github.com/docker/cli/pull/3044)
- Improve performance of `docker info` if a custom `--format` is used that only uses local information. With this change, the CLI only uses the daemon API if it detects that information from the daemon is needed. [docker/cli#3179](https://github.com/docker/cli/pull/3179)
- Remove the default value from the `--stop-signal` flag, as it may not reflect the actual default used by the daemon. [docker/cli#3245](https://github.com/docker/cli/pull/3245)
- Add Compose schema `3.10` to `docker stack`; allow omitting the `version` field (resulting in `latest`). [docker/cli#3257](https://github.com/docker/cli/pull/3257)
- Compose version `3` is now equivalent to `3.x` (latest) in `docker stack`. [docker/cli#3445](https://github.com/docker/cli/pull/3445)
- Fix `<Ctrl-c>` hanging on Windows to exit after running a container in non-interactive mode. [docker/cli#3302](https://github.com/docker/cli/pull/3302)
- Add relative source paths to the `run` command in the `-v`/`--volume` and `-m`/`--mount` flags. [docker/cli#3469](https://github.com/docker/cli/pull/3469)
- `docker exec -t` now sets the console size for the executed process immediately when it's created. [docker/cli#3627](https://github.com/docker/cli/pull/3627)
- Update the pretty-print format of `docker info` to provide more details on installed plugins. [docker/cli#3645](https://github.com/docker/cli/pull/3645)
- Print warning messages for the `docker context list` and `docker context use` commands when the context is overridden by the environment. [docker/cli#3668](https://github.com/docker/cli/pull/3668)
- Add a custom `aliases` annotation that can be used to print all available aliases for a command. [docker/cli#3694](https://github.com/docker/cli/pull/3694)
- The CLI no longer creates or updates the CLI configuration file when running `docker context use` and selecting the current context. [docker/cli#3721](https://github.com/docker/cli/pull/3721)
- Non-existing contexts are now ignored when running `docker context rm --force`. [docker/cli#3791](https://github.com/docker/cli/pull/3791)
- Add the ability to override integers to `0` in Compose files. [docker/cli#3812](https://github.com/docker/cli/pull/3812)
- SIGINT (`<Ctrl-c>`) now passes through to running containers instead of causing the CLI to exit. [docker/cli#3849](https://github.com/docker/cli/pull/3849)
- Improve `docker port CONTAINER` UX by sorting ports before printing. [docker/cli#3892](https://github.com/docker/cli/pull/3892)
- API: `GET /containers/{id}/logs` and `POST /containers/{id}/attach` now report which raw-stream format is in use using the `Content-type` response header on API version >= 1.42. [moby/moby#39812](https://github.com/moby/moby/pull/39812)
- Set default sandbox size for Windows layers to 127GB, and ensure that the `--storage-opts` flag applies to all storage on Windows. [moby/moby#41636](https://github.com/moby/moby/pull/41636)
- Remove the plugin section from the containerd configuration file (`/var/run/docker/containerd/containerd.toml`). [moby/moby#41675](https://github.com/moby/moby/pull/41675)
- Reject `null` manifests during tar import. [moby/moby#41842](https://github.com/moby/moby/pull/41842)
- Add shim config for custom runtimes for plugins. [moby/moby#41854](https://github.com/moby/moby/pull/41854)
- Container health checks now resume when the daemon is restarted. [moby/moby#41935](https://github.com/moby/moby/pull/41935)
- Quota is no longer disabled on cleanup of the `btrfs` driver. [moby/moby#42273](https://github.com/moby/moby/pull/42273)
- Host devices that are accessible can now be mounted in `--privileged` rootless containers. [moby/moby#42638](https://github.com/moby/moby/pull/42638)
- Fix incorrect handling of `**/foo` recursive wildcard directory patterns in `.dockerignore`. [moby/moby#42676](https://github.com/moby/moby/pull/42676)
- Extend `docker import --platform` to allow marking an imported image as a foreign architecture. [moby/moby#43103](https://github.com/moby/moby/pull/43103)
- Validation of CPU real-time options is now performed when the daemon starts instead of performing validations for each individual container, allowing startup to fail early. [moby/moby#43131](https://github.com/moby/moby/pull/43131)
- Freeze the `namesgenerator` package against new additions. Users will have to be satisfied with the existing 25359 adjective-name combinations. [moby/moby#43210](https://github.com/moby/moby/pull/43210)
- API: `containers/{id}/attach/ws` only to streams according by `stdin`, `stdout` and `stderr` parameters on API version >= 1.42. [moby/moby#43322](https://github.com/moby/moby/pull/43322)
- Fix UDP traffic in containers not working after the container is restarted under sustained traffic. [moby/moby#43409](https://github.com/moby/moby/pull/43409)
- Add support for pulling images with custom amd64 micro-architecture feature levels as supported by the latest versions of Go, GCC, LLVM, and other compiler tools. [moby/moby#43434](https://github.com/moby/moby/pull/43434)
- Improve validation of invalid JSON requests in the API. [moby/moby#43463](https://github.com/moby/moby/pull/43463)
- Mitigate the impact of slow `exec` starts on health checks. Check timeout now only applies to the duration that the health check command is running. The time it takes to start the command no longer counts against the timeout. [moby/moby#43480](https://github.com/moby/moby/pull/43480)
- Console `tty` size is set immediately on creation. [moby/moby#43593](https://github.com/moby/moby/pull/43593), [moby/moby#43622](https://github.com/moby/moby/pull/43622)
- Fix `overlay2` mounts not being cleaned up after failed container starts, or daemon shutdown. [moby/moby#43659](https://github.com/moby/moby/pull/43659)
- Match manifest list resolution with `containerd`. [moby/moby#43675](https://github.com/moby/moby/pull/43675)
- Skip use of `firewalld` for networking when the daemon is running in rootless mode. [moby/moby#43813](https://github.com/moby/moby/pull/43813)
- Custom NAT networks are now re-created after daemon restart if missing on Windows. [moby/moby#43858](https://github.com/moby/moby/pull/43858)
- Fix terminating the container health-check process when it times out. [moby/moby#43994](https://github.com/moby/moby/pull/43994)
- Fix `live-restore` with restart policies and volume refs. [moby/moby#44237](https://github.com/moby/moby/pull/44237)
- API: Only anonymous volumes now pruned by default on API version >= v1.42. Pass the filter `all=true` to prune named volumes in addition to anonymous. [moby/moby#44259](https://github.com/moby/moby/pull/44259)
- API: Support concurrent calls on the `GET /system/df` endpoint. [moby/moby#42715](https://github.com/moby/moby/pull/42715)
- Improve the reliability of the daemon dumping the stack and exits with code 2 when sent a SIGQUIT. [moby/moby#44831](https://github.com/moby/moby/pull/44831)
- Improve the reliability of `docker logs -f` on Windows, and prevent newlines from being dropped in the `local` log driver. [moby/moby#43294](https://github.com/moby/moby/pull/43294)
- Fix a rare deadlock in the daemon caused by buffering of container logs. [moby/moby#44856](https://github.com/moby/moby/pull/44856)
- Improve error handling in misc filesystem operations so that the daemon can start on a overlayfs backing filesystem. [moby/moby#44834](https://github.com/moby/moby/pull/44834)
- Fix an issue where `--ipc=host` wasn't handled correctly when the daemon is running in rootless mode. [moby/moby#44863](https://github.com/moby/moby/pull/44863)
- Fix a long-standing set of issues where stale conntrack entries caused incorrect routing of UDP traffic for containers. [moby/moby#44752](https://github.com/moby/moby/pull/44752)
- Fix half-registered containers being listed in the API, as well as a nil pointer de-reference and panic caused by using a partially registered container in API calls. [moby/moby#44633](https://github.com/moby/moby/pull/44633)
- Fix a failure to create the `DOCKER-USER` ip6tables chain. [moby/moby#44845](https://github.com/moby/moby/pull/44845)
- Fix a failure to clean up iptables rules when the `ip6tables` command isn't available. [moby/moby#44727](https://github.com/moby/moby/pull/44727)
- Fix an issue where some iptables NAT rules weren't cleaned up after enabling the userland proxy. [moby/moby#44811](https://github.com/moby/moby/pull/44811)
- Fix a potentially leaked process in rare situations where cleaning up a failed attempt to start a container was mishandled. [moby/moby#44400](https://github.com/moby/moby/pull/44400)
- Fix the `CreatedAt` time of a volume reflecting initialization and not creation. [moby/moby#44725](https://github.com/moby/moby/pull/44725)
- Fix an issue where the CLI incorrectly reported an incompatible server instead of an unreachable server in some commands. [docker/cli#3901](https://github.com/docker/cli/pull/3901), [docker/cli#3904](https://github.com/docker/cli/pull/3904)
- Fix broken completion of volumes in Zsh. [docker/cli#2998](https://github.com/docker/cli/pull/2998)
- Improve output of `docker context` when an invalid context is present. [docker/cli#3847](https://github.com/docker/cli/pull/3847)
- Remove ANSI decoration of CLI help annotations when the output isn't a TTY, and added a newline for readability. [docker/cli#3973](https://github.com/docker/cli/pull/3973)
- Add `docker container remove` as an alias for `docker container rm`. [docker/cli#3986](https://github.com/docker/cli/pull/3986)
@y
- Promote `overlay2` to be the default storage driver (`btrfs` and `zfs` are now opt-in). [moby/moby#42661](https://github.com/moby/moby/pull/42661)
- Add a loading spinner to the `docker cp` command. [docker/cli#2708](https://github.com/docker/cli/pull/2708)
- Deprecate the `ElectAuthServer` function, and made it return the default registry without calling the `GET /info` API endpoint. [docker/cli#2819](https://github.com/docker/cli/pull/2819)
- Progress bars are no longer reversed when rolling back Swarm services. [docker/cli#2940](https://github.com/docker/cli/pull/2940)
- Use `net.JoinHostPort()` to fix formatting with IPv6 addresses. [docker/cli#2972](https://github.com/docker/cli/pull/2972)
- CLI error messages are now printed to `stderr`. [docker/cli#3044](https://github.com/docker/cli/pull/3044)
- Improve performance of `docker info` if a custom `--format` is used that only uses local information. With this change, the CLI only uses the daemon API if it detects that information from the daemon is needed. [docker/cli#3179](https://github.com/docker/cli/pull/3179)
- Remove the default value from the `--stop-signal` flag, as it may not reflect the actual default used by the daemon. [docker/cli#3245](https://github.com/docker/cli/pull/3245)
- Add Compose schema `3.10` to `docker stack`; allow omitting the `version` field (resulting in `latest`). [docker/cli#3257](https://github.com/docker/cli/pull/3257)
- Compose version `3` is now equivalent to `3.x` (latest) in `docker stack`. [docker/cli#3445](https://github.com/docker/cli/pull/3445)
- Fix `<Ctrl-c>` hanging on Windows to exit after running a container in non-interactive mode. [docker/cli#3302](https://github.com/docker/cli/pull/3302)
- Add relative source paths to the `run` command in the `-v`/`--volume` and `-m`/`--mount` flags. [docker/cli#3469](https://github.com/docker/cli/pull/3469)
- `docker exec -t` now sets the console size for the executed process immediately when it's created. [docker/cli#3627](https://github.com/docker/cli/pull/3627)
- Update the pretty-print format of `docker info` to provide more details on installed plugins. [docker/cli#3645](https://github.com/docker/cli/pull/3645)
- Print warning messages for the `docker context list` and `docker context use` commands when the context is overridden by the environment. [docker/cli#3668](https://github.com/docker/cli/pull/3668)
- Add a custom `aliases` annotation that can be used to print all available aliases for a command. [docker/cli#3694](https://github.com/docker/cli/pull/3694)
- The CLI no longer creates or updates the CLI configuration file when running `docker context use` and selecting the current context. [docker/cli#3721](https://github.com/docker/cli/pull/3721)
- Non-existing contexts are now ignored when running `docker context rm --force`. [docker/cli#3791](https://github.com/docker/cli/pull/3791)
- Add the ability to override integers to `0` in Compose files. [docker/cli#3812](https://github.com/docker/cli/pull/3812)
- SIGINT (`<Ctrl-c>`) now passes through to running containers instead of causing the CLI to exit. [docker/cli#3849](https://github.com/docker/cli/pull/3849)
- Improve `docker port CONTAINER` UX by sorting ports before printing. [docker/cli#3892](https://github.com/docker/cli/pull/3892)
- API: `GET /containers/{id}/logs` and `POST /containers/{id}/attach` now report which raw-stream format is in use using the `Content-type` response header on API version >= 1.42. [moby/moby#39812](https://github.com/moby/moby/pull/39812)
- Set default sandbox size for Windows layers to 127GB, and ensure that the `--storage-opts` flag applies to all storage on Windows. [moby/moby#41636](https://github.com/moby/moby/pull/41636)
- Remove the plugin section from the containerd configuration file (`/var/run/docker/containerd/containerd.toml`). [moby/moby#41675](https://github.com/moby/moby/pull/41675)
- Reject `null` manifests during tar import. [moby/moby#41842](https://github.com/moby/moby/pull/41842)
- Add shim config for custom runtimes for plugins. [moby/moby#41854](https://github.com/moby/moby/pull/41854)
- Container health checks now resume when the daemon is restarted. [moby/moby#41935](https://github.com/moby/moby/pull/41935)
- Quota is no longer disabled on cleanup of the `btrfs` driver. [moby/moby#42273](https://github.com/moby/moby/pull/42273)
- Host devices that are accessible can now be mounted in `--privileged` rootless containers. [moby/moby#42638](https://github.com/moby/moby/pull/42638)
- Fix incorrect handling of `**/foo` recursive wildcard directory patterns in `.dockerignore`. [moby/moby#42676](https://github.com/moby/moby/pull/42676)
- Extend `docker import --platform` to allow marking an imported image as a foreign architecture. [moby/moby#43103](https://github.com/moby/moby/pull/43103)
- Validation of CPU real-time options is now performed when the daemon starts instead of performing validations for each individual container, allowing startup to fail early. [moby/moby#43131](https://github.com/moby/moby/pull/43131)
- Freeze the `namesgenerator` package against new additions. Users will have to be satisfied with the existing 25359 adjective-name combinations. [moby/moby#43210](https://github.com/moby/moby/pull/43210)
- API: `containers/{id}/attach/ws` only to streams according by `stdin`, `stdout` and `stderr` parameters on API version >= 1.42. [moby/moby#43322](https://github.com/moby/moby/pull/43322)
- Fix UDP traffic in containers not working after the container is restarted under sustained traffic. [moby/moby#43409](https://github.com/moby/moby/pull/43409)
- Add support for pulling images with custom amd64 micro-architecture feature levels as supported by the latest versions of Go, GCC, LLVM, and other compiler tools. [moby/moby#43434](https://github.com/moby/moby/pull/43434)
- Improve validation of invalid JSON requests in the API. [moby/moby#43463](https://github.com/moby/moby/pull/43463)
- Mitigate the impact of slow `exec` starts on health checks. Check timeout now only applies to the duration that the health check command is running. The time it takes to start the command no longer counts against the timeout. [moby/moby#43480](https://github.com/moby/moby/pull/43480)
- Console `tty` size is set immediately on creation. [moby/moby#43593](https://github.com/moby/moby/pull/43593), [moby/moby#43622](https://github.com/moby/moby/pull/43622)
- Fix `overlay2` mounts not being cleaned up after failed container starts, or daemon shutdown. [moby/moby#43659](https://github.com/moby/moby/pull/43659)
- Match manifest list resolution with `containerd`. [moby/moby#43675](https://github.com/moby/moby/pull/43675)
- Skip use of `firewalld` for networking when the daemon is running in rootless mode. [moby/moby#43813](https://github.com/moby/moby/pull/43813)
- Custom NAT networks are now re-created after daemon restart if missing on Windows. [moby/moby#43858](https://github.com/moby/moby/pull/43858)
- Fix terminating the container health-check process when it times out. [moby/moby#43994](https://github.com/moby/moby/pull/43994)
- Fix `live-restore` with restart policies and volume refs. [moby/moby#44237](https://github.com/moby/moby/pull/44237)
- API: Only anonymous volumes now pruned by default on API version >= v1.42. Pass the filter `all=true` to prune named volumes in addition to anonymous. [moby/moby#44259](https://github.com/moby/moby/pull/44259)
- API: Support concurrent calls on the `GET /system/df` endpoint. [moby/moby#42715](https://github.com/moby/moby/pull/42715)
- Improve the reliability of the daemon dumping the stack and exits with code 2 when sent a SIGQUIT. [moby/moby#44831](https://github.com/moby/moby/pull/44831)
- Improve the reliability of `docker logs -f` on Windows, and prevent newlines from being dropped in the `local` log driver. [moby/moby#43294](https://github.com/moby/moby/pull/43294)
- Fix a rare deadlock in the daemon caused by buffering of container logs. [moby/moby#44856](https://github.com/moby/moby/pull/44856)
- Improve error handling in misc filesystem operations so that the daemon can start on a overlayfs backing filesystem. [moby/moby#44834](https://github.com/moby/moby/pull/44834)
- Fix an issue where `--ipc=host` wasn't handled correctly when the daemon is running in rootless mode. [moby/moby#44863](https://github.com/moby/moby/pull/44863)
- Fix a long-standing set of issues where stale conntrack entries caused incorrect routing of UDP traffic for containers. [moby/moby#44752](https://github.com/moby/moby/pull/44752)
- Fix half-registered containers being listed in the API, as well as a nil pointer de-reference and panic caused by using a partially registered container in API calls. [moby/moby#44633](https://github.com/moby/moby/pull/44633)
- Fix a failure to create the `DOCKER-USER` ip6tables chain. [moby/moby#44845](https://github.com/moby/moby/pull/44845)
- Fix a failure to clean up iptables rules when the `ip6tables` command isn't available. [moby/moby#44727](https://github.com/moby/moby/pull/44727)
- Fix an issue where some iptables NAT rules weren't cleaned up after enabling the userland proxy. [moby/moby#44811](https://github.com/moby/moby/pull/44811)
- Fix a potentially leaked process in rare situations where cleaning up a failed attempt to start a container was mishandled. [moby/moby#44400](https://github.com/moby/moby/pull/44400)
- Fix the `CreatedAt` time of a volume reflecting initialization and not creation. [moby/moby#44725](https://github.com/moby/moby/pull/44725)
- Fix an issue where the CLI incorrectly reported an incompatible server instead of an unreachable server in some commands. [docker/cli#3901](https://github.com/docker/cli/pull/3901), [docker/cli#3904](https://github.com/docker/cli/pull/3904)
- Fix broken completion of volumes in Zsh. [docker/cli#2998](https://github.com/docker/cli/pull/2998)
- Improve output of `docker context` when an invalid context is present. [docker/cli#3847](https://github.com/docker/cli/pull/3847)
- Remove ANSI decoration of CLI help annotations when the output isn't a TTY, and added a newline for readability. [docker/cli#3973](https://github.com/docker/cli/pull/3973)
- Add `docker container remove` as an alias for `docker container rm`. [docker/cli#3986](https://github.com/docker/cli/pull/3986)
@z

@x
### Known issues
@y
### Known issues
@z

@x
#### apparmor_parser ([tracking issue](https://github.com/moby/moby/issues/44900))
@y
#### apparmor_parser ([tracking issue](https://github.com/moby/moby/issues/44900))
@z

@x
Some Debian users have reported issues with containers failing to start after upgrading to the 23.0 branch.
The error message indicates that the issue is due to a missing `apparmor_parser` binary:
@y
Some Debian users have reported issues with containers failing to start after upgrading to the 23.0 branch.
The error message indicates that the issue is due to a missing `apparmor_parser` binary:
@z

@x
```console
Error response from daemon: AppArmor enabled on system but the docker-default profile could not be loaded: running `apparmor_parser apparmor_parser --version` failed with output:
error: exec: "apparmor_parser": executable file not found in $PATH
Error: failed to start containers: somecontainer
```
@y
```console
Error response from daemon: AppArmor enabled on system but the docker-default profile could not be loaded: running `apparmor_parser apparmor_parser --version` failed with output:
error: exec: "apparmor_parser": executable file not found in $PATH
Error: failed to start containers: somecontainer
```
@z

@x
The workaround to this issue is to install the `apparmor` package manually:
@y
The workaround to this issue is to install the `apparmor` package manually:
@z

@x
```console
apt-get install apparmor
```
@y
```console
apt-get install apparmor
```
@z

@x
#### BuildKit inline cache ([tracking issue](https://github.com/moby/moby/issues/44918))
@y
#### BuildKit inline cache ([tracking issue](https://github.com/moby/moby/issues/44918))
@z

@x
Attempting to build an image with BuildKit's inline cache feature (e.g. `docker build --build-arg BUILDKIT_INLINE_CACHE=1 .`, `docker buildx build --cache-to type=inline .`) will result in the daemon unexpectedly exiting:
@y
Attempting to build an image with BuildKit's inline cache feature (e.g. `docker build --build-arg BUILDKIT_INLINE_CACHE=1 .`, `docker buildx build --cache-to type=inline .`) will result in the daemon unexpectedly exiting:
@z

@x
```
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x18 pc=0x147ff00]
@y
```
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x18 pc=0x147ff00]
@z

@x
goroutine 693 [running]:
github.com/docker/docker/vendor/github.com/moby/buildkit/cache.computeBlobChain.func4.1({0x245cca8, 0x4001394960})
        /go/src/github.com/docker/docker/vendor/github.com/moby/buildkit/cache/blobs.go:206 +0xc90
github.com/docker/docker/vendor/github.com/moby/buildkit/util/flightcontrol.(*call).run(0x40013c2240)
        /go/src/github.com/docker/docker/vendor/github.com/moby/buildkit/util/flightcontrol/flightcontrol.go:121 +0x64
sync.(*Once).doSlow(0x0?, 0x4001328240?)
        /usr/local/go/src/sync/once.go:74 +0x100
sync.(*Once).Do(0x4001328240?, 0x0?)
        /usr/local/go/src/sync/once.go:65 +0x24
created by github.com/docker/docker/vendor/github.com/moby/buildkit/util/flightcontrol.(*call).wait
```
@y
goroutine 693 [running]:
github.com/docker/docker/vendor/github.com/moby/buildkit/cache.computeBlobChain.func4.1({0x245cca8, 0x4001394960})
        /go/src/github.com/docker/docker/vendor/github.com/moby/buildkit/cache/blobs.go:206 +0xc90
github.com/docker/docker/vendor/github.com/moby/buildkit/util/flightcontrol.(*call).run(0x40013c2240)
        /go/src/github.com/docker/docker/vendor/github.com/moby/buildkit/util/flightcontrol/flightcontrol.go:121 +0x64
sync.(*Once).doSlow(0x0?, 0x4001328240?)
        /usr/local/go/src/sync/once.go:74 +0x100
sync.(*Once).Do(0x4001328240?, 0x0?)
        /usr/local/go/src/sync/once.go:65 +0x24
created by github.com/docker/docker/vendor/github.com/moby/buildkit/util/flightcontrol.(*call).wait
```
@z

@x
The daemon will restart if configured to do so (e.g. via systemd) after such a crash. The only available mitigation in this release is to avoid performing builds with the inline cache feature enabled.
@y
The daemon will restart if configured to do so (e.g. via systemd) after such a crash. The only available mitigation in this release is to avoid performing builds with the inline cache feature enabled.
@z

@x
#### BuildKit with warm cache ([tracking issue](https://github.com/moby/moby/issues/44943))
@y
#### BuildKit with warm cache ([tracking issue](https://github.com/moby/moby/issues/44943))
@z

@x
If an image was built with BuildKit on a previous version of the daemon, and is built with a 23.0 daemon, previously cached layers will not be restored correctly. The image may appear to build correctly if no lines are changed in the Dockerfile; however, if partial cache invalidation occurs due to changing some lines in the Dockerfile, the still valid and previously cached layers will not be loaded correctly.
@y
If an image was built with BuildKit on a previous version of the daemon, and is built with a 23.0 daemon, previously cached layers will not be restored correctly. The image may appear to build correctly if no lines are changed in the Dockerfile; however, if partial cache invalidation occurs due to changing some lines in the Dockerfile, the still valid and previously cached layers will not be loaded correctly.
@z

@x
This most often presents as files that should be present in the image not being present in a `RUN` stage, or any other stage that references files, after changing some lines in the Dockerfile:
@y
This most often presents as files that should be present in the image not being present in a `RUN` stage, or any other stage that references files, after changing some lines in the Dockerfile:
@z

@x
```
[+] Building 0.4s (6/6) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 102B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/node:18-alpine
 => [base 1/2] FROM docker.io/library/node:18-alpine@sha256:bc329c7332cffc30c2d4801e38df03cbfa8dcbae2a7a52a449db104794f168a3
 => CACHED [base 2/2] WORKDIR /app
 => ERROR [stage-1 1/1] RUN uname -a
------
 > [stage-1 1/1] RUN uname -a:
#0 0.138 runc run failed: unable to start container process: exec: "/bin/sh": stat /bin/sh: no such file or directory
------
Dockerfile:5
--------------------
   3 |
   4 |     FROM base
   5 | >>> RUN uname -a
   6 |
--------------------
ERROR: failed to solve: process "/bin/sh -c uname -a" did not complete successfully: exit code: 1
```
@y
```
[+] Building 0.4s (6/6) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 102B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/node:18-alpine
 => [base 1/2] FROM docker.io/library/node:18-alpine@sha256:bc329c7332cffc30c2d4801e38df03cbfa8dcbae2a7a52a449db104794f168a3
 => CACHED [base 2/2] WORKDIR /app
 => ERROR [stage-1 1/1] RUN uname -a
------
 > [stage-1 1/1] RUN uname -a:
#0 0.138 runc run failed: unable to start container process: exec: "/bin/sh": stat /bin/sh: no such file or directory
------
Dockerfile:5
--------------------
   3 |
   4 |     FROM base
   5 | >>> RUN uname -a
   6 |
--------------------
ERROR: failed to solve: process "/bin/sh -c uname -a" did not complete successfully: exit code: 1
```
@z

@x
To mitigate this, the previous build cache must be discarded. `docker builder prune -a` will completely empty the build cache, and allow the affected builds to proceed again by removing the mishandled cache layers.
@y
To mitigate this, the previous build cache must be discarded. `docker builder prune -a` will completely empty the build cache, and allow the affected builds to proceed again by removing the mishandled cache layers.
@z

@x
#### ipvlan networks ([tracking issue](https://github.com/moby/moby/issues/44925))
@y
#### ipvlan networks ([tracking issue](https://github.com/moby/moby/issues/44925))
@z

@x
When upgrading to the 23.0 branch, the existence of any [ipvlan](/engine/network/drivers/ipvlan.md) networks will prevent the daemon from starting:
@y
When upgrading to the 23.0 branch, the existence of any [ipvlan](engine/network/drivers/ipvlan.md) networks will prevent the daemon from starting:
@z

@x
```
panic: interface conversion: interface {} is nil, not string
@y
```
panic: interface conversion: interface {} is nil, not string
@z

@x
goroutine 1 [running]:
github.com/docker/docker/libnetwork/drivers/ipvlan.(*configuration).UnmarshalJSON(0x40011533b0, {0x400069c2d0, 0xef, 0xef})
        /go/src/github.com/docker/docker/libnetwork/drivers/ipvlan/ipvlan_store.go:196 +0x414
encoding/json.(*decodeState).object(0x4001153440, {0x5597157640?, 0x40011533b0?, 0x559524115c?})
        /usr/local/go/src/encoding/json/decode.go:613 +0x650
encoding/json.(*decodeState).value(0x4001153440, {0x5597157640?, 0x40011533b0?, 0x559524005c?})
        /usr/local/go/src/encoding/json/decode.go:374 +0x40
encoding/json.(*decodeState).unmarshal(0x4001153440, {0x5597157640?, 0x40011533b0?})
        /usr/local/go/src/encoding/json/decode.go:181 +0x204
encoding/json.Unmarshal({0x400069c2d0, 0xef, 0xef}, {0x5597157640, 0x40011533b0})
        /usr/local/go/src/encoding/json/decode.go:108 +0xf4
github.com/docker/docker/libnetwork/drivers/ipvlan.(*configuration).SetValue(0x4000d18050?, {0x400069c2d0?, 0x23?, 0x23?})
        /go/src/github.com/docker/docker/libnetwork/drivers/ipvlan/ipvlan_store.go:230 +0x38
```
@y
goroutine 1 [running]:
github.com/docker/docker/libnetwork/drivers/ipvlan.(*configuration).UnmarshalJSON(0x40011533b0, {0x400069c2d0, 0xef, 0xef})
        /go/src/github.com/docker/docker/libnetwork/drivers/ipvlan/ipvlan_store.go:196 +0x414
encoding/json.(*decodeState).object(0x4001153440, {0x5597157640?, 0x40011533b0?, 0x559524115c?})
        /usr/local/go/src/encoding/json/decode.go:613 +0x650
encoding/json.(*decodeState).value(0x4001153440, {0x5597157640?, 0x40011533b0?, 0x559524005c?})
        /usr/local/go/src/encoding/json/decode.go:374 +0x40
encoding/json.(*decodeState).unmarshal(0x4001153440, {0x5597157640?, 0x40011533b0?})
        /usr/local/go/src/encoding/json/decode.go:181 +0x204
encoding/json.Unmarshal({0x400069c2d0, 0xef, 0xef}, {0x5597157640, 0x40011533b0})
        /usr/local/go/src/encoding/json/decode.go:108 +0xf4
github.com/docker/docker/libnetwork/drivers/ipvlan.(*configuration).SetValue(0x4000d18050?, {0x400069c2d0?, 0x23?, 0x23?})
        /go/src/github.com/docker/docker/libnetwork/drivers/ipvlan/ipvlan_store.go:230 +0x38
```
@z

@x
To mitigate this, affected users can downgrade and remove the network, then upgrade again.
Alternatively, the entire network store can be removed, and networks can be recreated after the upgrade. The network store is located at `/var/lib/docker/network/files/local-kv.db`. If the daemon is using an alternate `--data-root`, substitute `/var/lib/docker` for the alternate path.
@y
To mitigate this, affected users can downgrade and remove the network, then upgrade again.
Alternatively, the entire network store can be removed, and networks can be recreated after the upgrade. The network store is located at `/var/lib/docker/network/files/local-kv.db`. If the daemon is using an alternate `--data-root`, substitute `/var/lib/docker` for the alternate path.
@z

@x
#### Kata Containers ([tracking issue](https://github.com/kata-containers/kata-containers/issues/6154))
@y
#### Kata Containers ([tracking issue](https://github.com/kata-containers/kata-containers/issues/6154))
@z

@x
The 23.0 branch brings support for alternate containerd shims, such as `io.containerd.runsc.v1` (gVisor) and `io.containerd.kata.v2` (Kata Containers).
@y
The 23.0 branch brings support for alternate containerd shims, such as `io.containerd.runsc.v1` (gVisor) and `io.containerd.kata.v2` (Kata Containers).
@z

@x
When using the Kata Containers runtime, exiting an `exec` session stops the running container, and hangs the connected CLI if a TTY was opened. There is no mitigation at this time beyond avoiding execing into containers running on the Kata runtime.
@y
When using the Kata Containers runtime, exiting an `exec` session stops the running container, and hangs the connected CLI if a TTY was opened. There is no mitigation at this time beyond avoiding execing into containers running on the Kata runtime.
@z

@x
The root cause of this issue is a long-standing bug in Moby. This will be resolved in a future release. Be advised that support for alternate OCI runtimes is a new feature and that similar issues may be discovered as more users start exercising this functionality.
@y
The root cause of this issue is a long-standing bug in Moby. This will be resolved in a future release. Be advised that support for alternate OCI runtimes is a new feature and that similar issues may be discovered as more users start exercising this functionality.
@z
