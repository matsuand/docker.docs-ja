%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: DHI CLI release notes
linkTitle: CLI release notes
description: New features, bug fixes, and changes in the DHI CLI
keywords: docker hardened images, dhi, dhictl, cli, release notes, changelog
@y
title: DHI CLI release notes
linkTitle: CLI release notes
description: New features, bug fixes, and changes in the DHI CLI
keywords: docker hardened images, dhi, dhictl, cli, release notes, changelog
@z

@x
This page lists changes in recent stable releases of the DHI CLI (`docker dhi`). For
the full release history, including pre-releases and downloads, see the
[dhictl releases on GitHub](https://github.com/docker-hardened-images/dhictl/releases).
@y
This page lists changes in recent stable releases of the DHI CLI (`docker dhi`). For
the full release history, including pre-releases and downloads, see the
[dhictl releases on GitHub](https://github.com/docker-hardened-images/dhictl/releases).
@z

@x
<!-- BEGIN GENERATED RELEASES -->
@y
<!-- BEGIN GENERATED RELEASES -->
@z

@x
## 0.0.13
@y
## 0.0.13
@z

@x
{{< release-date date="2026-11-05" >}}
@y
{{< release-date date="2026-11-05" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.13)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.13)
@z

@x
Maintenance release with dependency updates.
@y
Maintenance release with dependency updates.
@z

@x
## 0.0.12
@y
## 0.0.12
@z

@x
{{< release-date date="2026-11-05" >}}
@y
{{< release-date date="2026-11-05" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.12)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.12)
@z

@x
Maintenance release with dependency updates.
@y
Maintenance release with dependency updates.
@z

@x
## 0.0.11
@y
## 0.0.11
@z

@x
{{< release-date date="2026-11-04" >}}
@y
{{< release-date date="2026-11-04" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.11)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.11)
@z

@x
This release adds platform validation for image customizations in `dhictl customization create`.
@y
This release adds platform validation for image customizations in `dhictl customization create`.
@z

@x
### What's New
@y
### What's New
@z

@x
- Adds platforms validation to `dhictl customization create`, requiring platforms to be specified for image customizations and checking that every target's tag definition supports them — missing or unsupported platforms now fail with an error
@y
- Adds platforms validation to `dhictl customization create`, requiring platforms to be specified for image customizations and checking that every target's tag definition supports them — missing or unsupported platforms now fail with an error
@z

@x
## 0.0.10
@y
## 0.0.10
@z

@x
{{< release-date date="2026-10-29" >}}
@y
{{< release-date date="2026-10-29" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.10)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.10)
@z

@x
This release adds support for Helm chart customization variable mappings in dhictl.
@y
This release adds support for Helm chart customization variable mappings in dhictl.
@z

@x
### What's New
@y
### What's New
@z

@x
- Adds `variable_mappings` support for Helm chart customizations, allowing each chart variable to point at a DHI image, a mirrored image tag definition, or a customization
@y
- Adds `variable_mappings` support for Helm chart customizations, allowing each chart variable to point at a DHI image, a mirrored image tag definition, or a customization
@z

@x
## 0.0.9
@y
## 0.0.9
@z

@x
{{< release-date date="2026-10-21" >}}
@y
{{< release-date date="2026-10-21" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.9)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.9)
@z

@x
This release adds working directory support for image customizations, improves customization inheritance behavior, and enhances the helm chart `get` command output.
@y
This release adds working directory support for image customizations, improves customization inheritance behavior, and enhances the helm chart `get` command output.
@z

@x
### What's New
@y
### What's New
@z

@x
- Adds `working-directory` field support for image customizations (single customizations only; bulk customizations display a "cannot be customized" comment and `create`/`edit` reject it with an error)
- Displays tag definition ID in the output of the `catalog get` command for helm charts
@y
- Adds `working-directory` field support for image customizations (single customizations only; bulk customizations display a "cannot be customized" comment and `create`/`edit` reject it with an error)
- Displays tag definition ID in the output of the `catalog get` command for helm charts
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixes `customization prepare` to write base image values as commented-out fields instead of live settings, allowing proper inheritance from tag definitions rather than freezing values at scaffold time
@y
- Fixes `customization prepare` to write base image values as commented-out fields instead of live settings, allowing proper inheritance from tag definitions rather than freezing values at scaffold time
@z

@x
## 0.0.8
@y
## 0.0.8
@z

@x
{{< release-date date="2026-10-14" >}}
@y
{{< release-date date="2026-10-14" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.8)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.8)
@z

@x
This release adds symlink support to customization files in dhictl.
@y
This release adds symlink support to customization files in dhictl.
@z

@x
### What's New
@y
### What's New
@z

@x
- Adds a `symlinks` section to customization YAML files, enabling `create`, `edit`, and `get` commands to manage symlinks with `path`, `source`, and optional `uid`/`gid` fields
@y
- Adds a `symlinks` section to customization YAML files, enabling `create`, `edit`, and `get` commands to manage symlinks with `path`, `source`, and optional `uid`/`gid` fields
@z

@x
## 0.0.7
@y
## 0.0.7
@z

@x
{{< release-date date="2026-07-21" >}}
@y
{{< release-date date="2026-07-21" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.7)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.7)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixes JSON output incorrectly escaping ampersands as `\u0026` — values such as catalog categories containing `&` now appear as-is in output
@y
- Fixes JSON output incorrectly escaping ampersands as `\u0026` — values such as catalog categories containing `&` now appear as-is in output
@z

@x
## 0.0.6
@y
## 0.0.6
@z

@x
{{< release-date date="2026-07-13" >}}
@y
{{< release-date date="2026-07-13" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.6)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.6)
@z

@x
This release fixes an issue that prevented customizations from being created via the CLI.
@y
This release fixes an issue that prevented customizations from being created via the CLI.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixes `dhictl customization create` failing when GraphQL rejected mutation inputs that incorrectly included the output-only `__typename` field from OCI artifact data
@y
- Fixes `dhictl customization create` failing when GraphQL rejected mutation inputs that incorrectly included the output-only `__typename` field from OCI artifact data
@z

@x
## 0.0.5
@y
## 0.0.5
@z

@x
{{< release-date date="2026-06-29" >}}
@y
{{< release-date date="2026-06-29" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.5)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.5)
@z

@x
Maintenance release with dependency updates.
@y
Maintenance release with dependency updates.
@z

@x
## 0.0.4
@y
## 0.0.4
@z

@x
{{< release-date date="2026-05-25" >}}
@y
{{< release-date date="2026-05-25" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.4)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.4)
@z

@x
### What's New
@y
### What's New
@z

@x
- Adds `deb` subcommand for DHI DEB repositories that emits netrc-style credentials for authenticating against DHI DEB repositories
@y
- Adds `deb` subcommand for DHI DEB repositories that emits netrc-style credentials for authenticating against DHI DEB repositories
@z

@x
## 0.0.3
@y
## 0.0.3
@z

@x
{{< release-date date="2026-04-22" >}}
@y
{{< release-date date="2026-04-22" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.3)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.3)
@z

@x
### What's New
@y
### What's New
@z

@x
- Adds attestation list and get commands for managing attestations
- Adds SBOM subcommand for software bill of materials attestation
- Adds bulk support to prepare command for customizations
- Adds compression field support for customizations
- Adds tag-definition-id column to catalog get output
@y
- Adds attestation list and get commands for managing attestations
- Adds SBOM subcommand for software bill of materials attestation
- Adds bulk support to prepare command for customizations
- Adds compression field support for customizations
- Adds tag-definition-id column to catalog get output
@z

@x
### Breaking change
@y
### Breaking change
@z

@x
We removed the `--output` flags from the few commands that had it (`customization prepare` and `customization get`) in favor of stdout redirections.
```console
# before
dhictl customization prepare --org my-org golang 1.25 --output my-customization.yaml
@y
We removed the `--output` flags from the few commands that had it (`customization prepare` and `customization get`) in favor of stdout redirections.
```console
# before
dhictl customization prepare --org my-org golang 1.25 --output my-customization.yaml
@z

@x
# after 
dhictl customization prepare --org my-org golang 1.25 > my-customization.yaml
```
@y
# after 
dhictl customization prepare --org my-org golang 1.25 > my-customization.yaml
```
@z

@x
## 0.0.2
@y
## 0.0.2
@z

@x
{{< release-date date="2026-03-19" >}}
@y
{{< release-date date="2026-03-19" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.2)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.2)
@z

@x
This is a maintenance release focused on build system improvements.
@y
This is a maintenance release focused on build system improvements.
@z

@x
### Technical Changes
@y
### Technical Changes
@z

@x
- Disables CGO globally to fix macOS 16 dyld crash and simplify build process
@y
- Disables CGO globally to fix macOS 16 dyld crash and simplify build process
@z

@x
## 0.0.1
@y
## 0.0.1
@z

@x
{{< release-date date="2026-03-12" >}}
@y
{{< release-date date="2026-03-12" >}}
@z

@x
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.1)
@y
[GitHub release](https://github.com/docker-hardened-images/dhictl/releases/tag/v0.0.1)
@z

@x
This release improves the mirroring functionality in dhictl by allowing command arguments.
@y
This release improves the mirroring functionality in dhictl by allowing command arguments.
@z

@x
### Improvements
@y
### Improvements
@z

@x
- Mirror start command now accepts arguments for more flexible mirroring operations
@y
- Mirror start command now accepts arguments for more flexible mirroring operations
@z

@x
<!-- END GENERATED RELEASES -->
@y
<!-- END GENERATED RELEASES -->
@z

@x
## Earlier releases
@y
## Earlier releases
@z

@x
For older versions, see the
[dhictl releases on GitHub](https://github.com/docker-hardened-images/dhictl/releases).
@y
For older versions, see the
[dhictl releases on GitHub](https://github.com/docker-hardened-images/dhictl/releases).
@z
