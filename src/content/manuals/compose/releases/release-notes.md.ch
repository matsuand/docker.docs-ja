%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Compose v5 release notes
linkTitle: Release notes
@y
title: Docker Compose v5 release notes
linkTitle: Release notes
@z

@x
description: Learn about the new features, bug fixes, and breaking changes for the newest Docker Compose release
keywords: release notes, compose
@y
description: Learn about the new features, bug fixes, and breaking changes for the newest Docker Compose release
keywords: release notes, compose
@z

@x
For more detailed information, see the [release notes in the Compose repo](https://github.com/docker/compose/releases/).
@y
For more detailed information, see the [release notes in the Compose repo](https://github.com/docker/compose/releases/).
@z

@x
## 5.0.0
@y
## 5.0.0
@z

@x
{{< release-date date="2025-12-02" >}}
@y
{{< release-date date="2025-12-02" >}}
@z

@x
Major changes in this release:
@y
Major changes in this release:
@z

@x
- Compose v5 introduces a new official Go SDK. This SDK provides a comprehensive API that lets you integrate Compose functionality directly into your applications, allowing you to load, validate, and manage multi-container environments without relying on the Compose CLI. For more information, see the [Compose SDK docs](/manuals/compose/compose-sdk.md).
@y
- Compose v5 introduces a new official Go SDK. This SDK provides a comprehensive API that lets you integrate Compose functionality directly into your applications, allowing you to load, validate, and manage multi-container environments without relying on the Compose CLI. For more information, see the [Compose SDK docs](manuals/compose/compose-sdk.md).
@z

@x
> [!NOTE]
>
> To avoid confusion with the legacy Compose file formats labeled “v2” and “v3,” the versioning was advanced directly to v5.
@y
> [!NOTE]
>
> To avoid confusion with the legacy Compose file formats labeled “v2” and “v3,” the versioning was advanced directly to v5.
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Dropped support for internal buildkit builder.
- Introduced Compose SDK using functional parameters.
- Introduced abstractions to support SDK usage without requiring Docker CLI.
- Made progress Writer a configurable CLI component.
- Moved progress package to cmd as a CLI component.
- Added load project function to SDK.
- Introduced SDK docs.
- Documented support for OCI and Git remote resources.
- Added support for run hooks on restart.
- Fixed check for existing image to only select the target service in run command
- Introduced `--insecure-registry` flag, reserved for testing purpose.
- Added support for `build.no_cache_filter`.
- Added `--wait` option to the `docker compose start` command.
- Fixed OCI Compose override support.
- Fixed help output for `exec --no-tty` option.
- Fixed a typo in an error message.
- Disabled progress UI when build is ran with `--print`.
- Restores support for detach keys.
- Fixed images command to display the time the image was created.
- Fixed  support for port range.
- Fixed support for includes in publish command.
- Ignore runtime flags in model configuration.
@y
- Dropped support for internal buildkit builder.
- Introduced Compose SDK using functional parameters.
- Introduced abstractions to support SDK usage without requiring Docker CLI.
- Made progress Writer a configurable CLI component.
- Moved progress package to cmd as a CLI component.
- Added load project function to SDK.
- Introduced SDK docs.
- Documented support for OCI and Git remote resources.
- Added support for run hooks on restart.
- Fixed check for existing image to only select the target service in run command
- Introduced `--insecure-registry` flag, reserved for testing purpose.
- Added support for `build.no_cache_filter`.
- Added `--wait` option to the `docker compose start` command.
- Fixed OCI Compose override support.
- Fixed help output for `exec --no-tty` option.
- Fixed a typo in an error message.
- Disabled progress UI when build is ran with `--print`.
- Restores support for detach keys.
- Fixed images command to display the time the image was created.
- Fixed  support for port range.
- Fixed support for includes in publish command.
- Ignore runtime flags in model configuration.
@z

@x
### Update
@y
### Update
@z

@x
- Dependencies upgrade: bump compose go to v2.10.0
- Dependencies upgrade: bump docker 28.5.2
- Dependencies upgrade: bump containerd to 2.2.0
- Dependencies upgrade: bump docker/cli to 28.5.2
- Dependencies upgrade: bump buildx v0.30.0, buildkit v0.26.0, otel v1.38.0, otel/contrib v0.63.0
- Dependencies upgrade: bump golang.org/x/sys 0.38.0
- Dependencies upgrade: bump golang.org/x/sync to 0.18.0
- Dependencies upgrade: bump github.com/hashicorp/go-version to 1.8.0
- Dependencies upgrade: bump golang.org/x/crypto v0.45.0
- Dockerfile: update golangci-lint to v2.6.2
@y
- Dependencies upgrade: bump compose go to v2.10.0
- Dependencies upgrade: bump docker 28.5.2
- Dependencies upgrade: bump containerd to 2.2.0
- Dependencies upgrade: bump docker/cli to 28.5.2
- Dependencies upgrade: bump buildx v0.30.0, buildkit v0.26.0, otel v1.38.0, otel/contrib v0.63.0
- Dependencies upgrade: bump golang.org/x/sys 0.38.0
- Dependencies upgrade: bump golang.org/x/sync to 0.18.0
- Dependencies upgrade: bump github.com/hashicorp/go-version to 1.8.0
- Dependencies upgrade: bump golang.org/x/crypto v0.45.0
- Dockerfile: update golangci-lint to v2.6.2
@z
