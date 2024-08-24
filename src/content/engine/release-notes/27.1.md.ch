%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Docker Engine 27.1 release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@y
title: Docker Engine 27.1 リリースノート
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 27.1.
@y
本ページでは Docker Engine バージョン 27.1 に関する最新の変更、追加、既知の問題、バグフィックスについて示します。
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
## 27.1.1
@y
## 27.1.1
@z

@x
{{< release-date date="2024-07-23" >}}
@y
{{< release-date date="2024-07-23" >}}
@z

@x
### Security
@y
### Security
@z

@x
This release contains a fix for [CVE-2024-41110](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-41110) / [GHSA-v23v-6jw2-98fq](https://github.com/moby/moby/security/advisories/GHSA-v23v-6jw2-98fq)
that impacted setups using [authorization plugins (AuthZ)](https://docs.docker.com/engine/extend/plugins_authorization/)
for access control. No other changes are included in this release, and this
release is otherwise identical for users not using AuthZ plugins.
@y
This release contains a fix for [CVE-2024-41110](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-41110) / [GHSA-v23v-6jw2-98fq](https://github.com/moby/moby/security/advisories/GHSA-v23v-6jw2-98fq)
that impacted setups using [authorization plugins (AuthZ)](https://docs.docker.com/engine/extend/plugins_authorization/)
for access control. No other changes are included in this release, and this
release is otherwise identical for users not using AuthZ plugins.
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Update Compose to [v2.29.1](https://github.com/docker/compose/releases/tag/v2.29.1). [moby/docker-ce-packaging#1041](https://github.com/docker/docker-ce-packaging/pull/1041)
@y
- Update Compose to [v2.29.1](https://github.com/docker/compose/releases/tag/v2.29.1). [moby/docker-ce-packaging#1041](https://github.com/docker/docker-ce-packaging/pull/1041)
@z

@x
## 27.1.0
@y
## 27.1.0
@z

@x
{{< release-date date="2024-07-22" >}}
@y
{{< release-date date="2024-07-22" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 27.1.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.1.0)
- [moby/moby, 27.1.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.1.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.1.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.1.0/docs/api/version-history.md).
@y
- [docker/cli, 27.1.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A27.1.0)
- [moby/moby, 27.1.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A27.1.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v27.1.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v27.1.0/docs/api/version-history.md).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- rootless: add `Requires=dbus.socket` to prevent errors when starting the daemon on a cgroup v2 host with systemd [moby/moby#48141](https://github.com/moby/moby/pull/48141)
- containerd integration: `image tag` event is now properly emitted when building images with BuildKit [moby/moby#48182](https://github.com/moby/moby/pull/48182)
- CLI: enable shell completion for `docker image rm`, `docker image history`, and `docker image inspect` [moby/moby#5261](https://github.com/moby/moby/pull/5261)
- CLI: add and improve shell completions for various flags [moby/moby#5261](https://github.com/moby/moby/pull/5261)
- CLI: add OOMScoreAdj to `docker service create` and `docker stack` [docker/cli#5274](https://github.com/docker/cli/pull/5274)
- CLI: add support for `DOCKER_CUSTOM_HEADERS` environment variable (experimental) [docker/cli#5271](https://github.com/docker/cli/pull/5271)
- CLI: containerd-integration: Fix `docker push` defaulting the `--platform` flag to a value of `DOCKER_DEFAULT_PLATFORM` environment variable on unsupported API versions [docker/cli#5248](https://github.com/docker/cli/pull/5248)
- CLI: fix: context cancellation on `login` prompt [docker/cli#5260](https://github.com/docker/cli/pull/5260)
- CLI: fix: wait for the container to exit before closing the stream when sending a termination request to the CLI while attached to a container [docker/cli#5250](https://github.com/docker/cli/pull/5250)
@y
- rootless: add `Requires=dbus.socket` to prevent errors when starting the daemon on a cgroup v2 host with systemd [moby/moby#48141](https://github.com/moby/moby/pull/48141)
- containerd integration: `image tag` event is now properly emitted when building images with BuildKit [moby/moby#48182](https://github.com/moby/moby/pull/48182)
- CLI: enable shell completion for `docker image rm`, `docker image history`, and `docker image inspect` [moby/moby#5261](https://github.com/moby/moby/pull/5261)
- CLI: add and improve shell completions for various flags [moby/moby#5261](https://github.com/moby/moby/pull/5261)
- CLI: add OOMScoreAdj to `docker service create` and `docker stack` [docker/cli#5274](https://github.com/docker/cli/pull/5274)
- CLI: add support for `DOCKER_CUSTOM_HEADERS` environment variable (experimental) [docker/cli#5271](https://github.com/docker/cli/pull/5271)
- CLI: containerd-integration: Fix `docker push` defaulting the `--platform` flag to a value of `DOCKER_DEFAULT_PLATFORM` environment variable on unsupported API versions [docker/cli#5248](https://github.com/docker/cli/pull/5248)
- CLI: fix: context cancellation on `login` prompt [docker/cli#5260](https://github.com/docker/cli/pull/5260)
- CLI: fix: wait for the container to exit before closing the stream when sending a termination request to the CLI while attached to a container [docker/cli#5250](https://github.com/docker/cli/pull/5250)
@z

@x
### Deprecated
@y
### Deprecated
@z

@x
- The `pkg/rootless/specconv` package is deprecated, and will be removed in the next release [moby/moby#48185](https://github.com/moby/moby/pull/48185)
- The `pkg/containerfs` package is deprecated, and will be removed in the next release [moby/moby#48185](https://github.com/moby/moby/pull/48185)
- The `pkg/directory` package is deprecated, and will be removed in the next release [moby/moby#48185](https://github.com/moby/moby/pull/48185)
- `api/types/system`: remove deprecated `Info.ExecutionDriver` [moby/moby#48184](https://github.com/moby/moby/pull/48184)
@y
- The `pkg/rootless/specconv` package is deprecated, and will be removed in the next release [moby/moby#48185](https://github.com/moby/moby/pull/48185)
- The `pkg/containerfs` package is deprecated, and will be removed in the next release [moby/moby#48185](https://github.com/moby/moby/pull/48185)
- The `pkg/directory` package is deprecated, and will be removed in the next release [moby/moby#48185](https://github.com/moby/moby/pull/48185)
- `api/types/system`: remove deprecated `Info.ExecutionDriver` [moby/moby#48184](https://github.com/moby/moby/pull/48184)
@z

@x
### Packaging updates
@y
### Packaging updates
@z

@x
- Update Buildx to [v0.16.1](https://github.com/docker/buildx/releases/tag/v0.16.1). [moby/docker-ce-packaging#1039](https://github.com/docker/docker-ce-packaging/pull/1039)
- Update Compose to [v2.29.0](https://github.com/docker/compose/releases/tag/v2.29.0). [moby/docker-ce-packaging#1038](https://github.com/docker/docker-ce-packaging/pull/1038)
- Update Containerd (static binaries only) to [v1.7.20](https://github.com/containerd/containerd/releases/tag/v1.7.20). [moby/moby#48191](https://github.com/moby/moby/pull/48191)
- Update BuildKit to [v0.15.0](https://github.com/moby/buildkit/releases/tag/v0.15.0). [moby/moby#48175](https://github.com/moby/moby/pull/48175)
- Update Go runtime to 1.21.12, which contains security fixes for [CVE-2024-24791](https://github.com/advisories/GHSA-hw49-2p59-3mhj) [moby/moby#48120](https://github.com/moby/moby/pull/48120)
@y
- Update Buildx to [v0.16.1](https://github.com/docker/buildx/releases/tag/v0.16.1). [moby/docker-ce-packaging#1039](https://github.com/docker/docker-ce-packaging/pull/1039)
- Update Compose to [v2.29.0](https://github.com/docker/compose/releases/tag/v2.29.0). [moby/docker-ce-packaging#1038](https://github.com/docker/docker-ce-packaging/pull/1038)
- Update Containerd (static binaries only) to [v1.7.20](https://github.com/containerd/containerd/releases/tag/v1.7.20). [moby/moby#48191](https://github.com/moby/moby/pull/48191)
- Update BuildKit to [v0.15.0](https://github.com/moby/buildkit/releases/tag/v0.15.0). [moby/moby#48175](https://github.com/moby/moby/pull/48175)
- Update Go runtime to 1.21.12, which contains security fixes for [CVE-2024-24791](https://github.com/advisories/GHSA-hw49-2p59-3mhj) [moby/moby#48120](https://github.com/moby/moby/pull/48120)
@z
