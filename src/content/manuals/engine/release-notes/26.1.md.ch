%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Docker Engine 26.1 release notes
linkTitle: Engine v26.1
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@y
title: Docker Engine 26.1 リリースノート
linkTitle: Engine v26.1
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
@z

@x
This page describes the latest changes, additions, known issues, and fixes for Docker Engine version 26.1.
@y
本ページでは Docker Engine バージョン 26.1 に関する最新の変更、追加、既知の問題、バグフィックスについて示します。
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
## 26.1.0
@y
## 26.1.0
@z

@x
{{< release-date date="2024-04-22" >}}
@y
{{< release-date date="2024-04-22" >}}
@z

@x
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@y
For a full list of pull requests and changes in this release, refer to the relevant GitHub milestones:
@z

@x
- [docker/cli, 26.1.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.1.0)
- [moby/moby, 26.1.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.1.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.1.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.1.0/docs/api/version-history.md).
@y
- [docker/cli, 26.1.0 milestone](https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A26.1.0)
- [moby/moby, 26.1.0 milestone](https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A26.1.0)
- Deprecated and removed features, see [Deprecated Features](https://github.com/docker/cli/blob/v26.1.0/docs/deprecated.md).
- Changes to the Engine API, see [API version history](https://github.com/moby/moby/blob/v26.1.0/docs/api/version-history.md).
@z

@x
### New
@y
### New
@z

@x
- Added configurable OpenTelemetry utilities and basic instrumentation to commands.
  For more information, see [OpenTelemetry for the Docker CLI](https://docs.docker.com/config/otel). [docker/cli#4889](https://github.com/docker/cli/pull/4889)
@y
- Added configurable OpenTelemetry utilities and basic instrumentation to commands.
  For more information, see [OpenTelemetry for the Docker CLI](https://docs.docker.com/config/otel). [docker/cli#4889](https://github.com/docker/cli/pull/4889)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Native Windows containers are configured with an internal DNS server for container name resolution, and external DNS servers for other lookups.
  Not all resolvers, including `nslookup`, fall back to the external resolvers when they get a `SERVFAIL` answer from the internal server.
  So, the internal DNS server can now be configured to forward requests to the external resolvers, by setting a `feature` option in the `daemon.json` file:
@y
- Native Windows containers are configured with an internal DNS server for container name resolution, and external DNS servers for other lookups.
  Not all resolvers, including `nslookup`, fall back to the external resolvers when they get a `SERVFAIL` answer from the internal server.
  So, the internal DNS server can now be configured to forward requests to the external resolvers, by setting a `feature` option in the `daemon.json` file:
@z

@x
  ```json
  {
    "features": {
      "windows-dns-proxy": true
    }
  }
  ```
@y
  ```json
  {
    "features": {
      "windows-dns-proxy": true
    }
  }
  ```
@z

@x
  [moby/moby#47584](https://github.com/moby/moby/pull/47584)
@y
  [moby/moby#47584](https://github.com/moby/moby/pull/47584)
@z

@x
  > [!NOTE]
  >
  > - This will be the new default behavior in Docker Engine 27.0.
  > - The `windows-dns-proxy` feature flag will be removed in a future release.
@y
  > [!NOTE]
  >
  > - This will be the new default behavior in Docker Engine 27.0.
  > - The `windows-dns-proxy` feature flag will be removed in a future release.
@z

@x
- Swarm: Fix `Subpath` not being passed to the container config. [moby/moby#47711](https://github.com/moby/moby/pull/47711)
- Classic builder: Fix cache miss on `WORKDIR <directory>/` build step (directory with a trailing slash). [moby/moby#47723](https://github.com/moby/moby/pull/47723)
- containerd image store: Fix `docker images` failing when any image in the store has unexpected target. [moby/moby#47738](https://github.com/moby/moby/pull/47738)
@y
- Swarm: Fix `Subpath` not being passed to the container config. [moby/moby#47711](https://github.com/moby/moby/pull/47711)
- Classic builder: Fix cache miss on `WORKDIR <directory>/` build step (directory with a trailing slash). [moby/moby#47723](https://github.com/moby/moby/pull/47723)
- containerd image store: Fix `docker images` failing when any image in the store has unexpected target. [moby/moby#47738](https://github.com/moby/moby/pull/47738)
@z
