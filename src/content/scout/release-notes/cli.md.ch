%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Scout CLI release notes
description: Learn about the latest features of the Docker Scout CLI plugin
keywords: docker scout, release notes, changelog, cli, features, changes, delta, new, releases, github actions
@y
title: Docker Scout CLI release notes
description: Learn about the latest features of the Docker Scout CLI plugin
keywords: docker scout, release notes, changelog, cli, features, changes, delta, new, releases, github actions
@z

@x
This page contains information about the new features, improvements, known
issues, and bug fixes in the Docker Scout [CLI plugin](https://github.com/docker/scout-cli/)
and the `docker/scout-action` [GitHub Action](https://github.com/docker/scout-action).
@y
This page contains information about the new features, improvements, known
issues, and bug fixes in the Docker Scout [CLI plugin](https://github.com/docker/scout-cli/)
and the `docker/scout-action` [GitHub Action](https://github.com/docker/scout-action).
@z

@x
## 1.13.0
@y
## 1.13.0
@z

@x
{{< release-date date="2024-08-05" >}}
@y
{{< release-date date="2024-08-05" >}}
@z

@x
### New
@y
### New
@z

@x
- Add `--only-policy` filter option to the `docker scout quickview`, `docker scout policy` and `docker scout compare` commands.
- Add `--ignore-suppressed` filter option to `docker scout cves` and `docker scout quickview`  commands to filter out CVEs affected by [exceptions](/scout/explore/exceptions/).
@y
- Add `--only-policy` filter option to the `docker scout quickview`, `docker scout policy` and `docker scout compare` commands.
- Add `--ignore-suppressed` filter option to `docker scout cves` and `docker scout quickview`  commands to filter out CVEs affected by [exceptions](__SUBDIR__/scout/explore/exceptions/).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Use conditional policy name in checks.
- Add support for detecting the version of a Go project set using linker flags,
  for example:
@y
- Use conditional policy name in checks.
- Add support for detecting the version of a Go project set using linker flags,
  for example:
@z

@x
  ```console
  $ go build -ldflags "-X main.Version=1.2.3"
  ```
@y
  ```console
  $ go build -ldflags "-X main.Version=1.2.3"
  ```
@z

@x
## 1.12.0
@y
## 1.12.0
@z

@x
{{< release-date date="2024-07-31" >}}
@y
{{< release-date date="2024-07-31" >}}
@z

@x
### New
@y
### New
@z

@x
- Only display vulnerabilities from the base image:
@y
- Only display vulnerabilities from the base image:
@z

@x
  ```console {title="CLI"}
  $ docker scout cves --only-base IMAGE
  ```
@y
  ```console {title="CLI"}
  $ docker scout cves --only-base IMAGE
  ```
@z

@x
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: cves
    image: [IMAGE]
    only-base: true
  ```
@y
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: cves
    image: [IMAGE]
    only-base: true
  ```
@z

@x
- Account for VEX in `quickview` command.
@y
- Account for VEX in `quickview` command.
@z

% snip command...
% snip code...

@x
- Account for VEX in `cves` command (GitHub Actions).
@y
- Account for VEX in `cves` command (GitHub Actions).
@z

% snip code...

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Update `github.com/docker/docker` to `v26.1.5+incompatible` to fix CVE-2024-41110.
- Update Syft to 1.10.0.
@y
- Update `github.com/docker/docker` to `v26.1.5+incompatible` to fix CVE-2024-41110.
- Update Syft to 1.10.0.
@z

@x
## 1.11.0
@y
## 1.11.0
@z

@x
{{< release-date date="2024-07-25" >}}
@y
{{< release-date date="2024-07-25" >}}
@z

@x
### New
@y
### New
@z

@x
- Filter CVEs listed in the CISA Known Exploited Vulnerabilities catalog.
@y
- Filter CVEs listed in the CISA Known Exploited Vulnerabilities catalog.
@z

% snip command...
% snip code...

@x
- Add new classifiers:
  - `spiped`
  - `swift`
  - `eclipse-mosquitto`
  - `znc`
@y
- Add new classifiers:
  - `spiped`
  - `swift`
  - `eclipse-mosquitto`
  - `znc`
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Allow VEX matching when no subcomponents.
- Fix panic when attaching an invalid VEX document.
- Fix SPDX document root.
- Fix base image detection when image uses SCRATCH as the base image.
@y
- Allow VEX matching when no subcomponents.
- Fix panic when attaching an invalid VEX document.
- Fix SPDX document root.
- Fix base image detection when image uses SCRATCH as the base image.
@z

@x
## 1.10.0
@y
## 1.10.0
@z

@x
{{< release-date date="2024-06-26" >}}
@y
{{< release-date date="2024-06-26" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Add new classifiers:
  - `irssi`
  - `Backdrop`
  - `CrateDB CLI (Crash)`
  - `monica`
  - `Openliberty`
  - `dumb-init`
  - `friendica`
  - `redmine`
- Fix whitespace-only originator on package breaking BuildKit exporters
- Fix parsing image references in SPDX statement for images with a digest
- Support `sbom://` prefix for image comparison:
@y
- Add new classifiers:
  - `irssi`
  - `Backdrop`
  - `CrateDB CLI (Crash)`
  - `monica`
  - `Openliberty`
  - `dumb-init`
  - `friendica`
  - `redmine`
- Fix whitespace-only originator on package breaking BuildKit exporters
- Fix parsing image references in SPDX statement for images with a digest
- Support `sbom://` prefix for image comparison:
@z

% snip command...
% snip code...

@x
## 1.9.3
@y
## 1.9.3
@z

@x
{{< release-date date="2024-05-28" >}}
@y
{{< release-date date="2024-05-28" >}}
@z

@x
### Bug fix
@y
### Bug fix
@z

@x
- Fix a panic while retrieving cached SBOMs.
@y
- Fix a panic while retrieving cached SBOMs.
@z

@x
## 1.9.1
@y
## 1.9.1
@z

@x
{{< release-date date="2024-05-27" >}}
@y
{{< release-date date="2024-05-27" >}}
@z

@x
### New
@y
### New
@z

@x
- Add support for the [GitLab container scanning file format](https://docs.gitlab.com/ee/development/integrations/secure.html#container-scanning) with `--format gitlab` on `docker scout cves` command.
@y
- Add support for the [GitLab container scanning file format](https://docs.gitlab.com/ee/development/integrations/secure.html#container-scanning) with `--format gitlab` on `docker scout cves` command.
@z

@x
  Here is an example pipeline:
@y
  Here is an example pipeline:
@z

% snip code...

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Support single-architecture images for `docker scout attest add` command
- Indicate on the `docker scout quickview` and `docker scout recommendations` commands if image provenance was not created using `mode=max`.
  Without `mode=max`, base images may be incorrectly detected, resulting in less accurate results.
@y
- Support single-architecture images for `docker scout attest add` command
- Indicate on the `docker scout quickview` and `docker scout recommendations` commands if image provenance was not created using `mode=max`.
  Without `mode=max`, base images may be incorrectly detected, resulting in less accurate results.
@z

@x
## 1.9.0
@y
## 1.9.0
@z

@x
{{< release-date date="2024-05-24" >}}
@y
{{< release-date date="2024-05-24" >}}
@z

@x
Discarded in favor of [1.9.1](#191).
@y
Discarded in favor of [1.9.1](#191).
@z

@x
## 1.8.0
@y
## 1.8.0
@z

@x
{{< release-date date="2024-04-25" >}}
@y
{{< release-date date="2024-04-25" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Improve format of EPSS score and percentile.
@y
- Improve format of EPSS score and percentile.
@z

@x
  Before:
@y
  Before:
@z

% snip text...

@x
  After:
@y
  After:
@z

% snip text...

@x
- Fix markdown output of the `docker scout cves` command when analyzing local filesystem. [docker/scout-cli#113](https://github.com/docker/scout-cli/issues/113)
@y
- Fix markdown output of the `docker scout cves` command when analyzing local filesystem. [docker/scout-cli#113](https://github.com/docker/scout-cli/issues/113)
@z

@x
## 1.7.0
@y
## 1.7.0
@z

@x
{{< release-date date="2024-04-15" >}}
@y
{{< release-date date="2024-04-15" >}}
@z

@x
### New
@y
### New
@z

@x
- The [`docker scout push` command](/reference/cli/docker/scout/push/) is now fully available: analyze images locally and push the SBOM to Docker Scout.
@y
- The [`docker scout push` command](__SUBDIR__/reference/cli/docker/scout/push/) is now fully available: analyze images locally and push the SBOM to Docker Scout.
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix adding attestations with `docker scout attestation add` to images in private repositories
- Fix image processing for images based on the empty `scratch` base image
- A new `sbom://` protocol for Docker Scout CLI commands let you read a Docker Scout SBOM from standard input.
@y
- Fix adding attestations with `docker scout attestation add` to images in private repositories
- Fix image processing for images based on the empty `scratch` base image
- A new `sbom://` protocol for Docker Scout CLI commands let you read a Docker Scout SBOM from standard input.
@z

@x
  ```console
  $ docker scout sbom IMAGE | docker scout qv sbom://
  ```
@y
  ```console
  $ docker scout sbom IMAGE | docker scout qv sbom://
  ```
@z

@x
- Add classifier for Joomla packages
@y
- Add classifier for Joomla packages
@z

@x
## 1.6.4
@y
## 1.6.4
@z

@x
{{< release-date date="2024-03-26" >}}
@y
{{< release-date date="2024-03-26" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix epoch handling for RPM-based Linux distributions
@y
- Fix epoch handling for RPM-based Linux distributions
@z

@x
## 1.6.3
@y
## 1.6.3
@z

@x
{{< release-date date="2024-03-22" >}}
@y
{{< release-date date="2024-03-22" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Improve package detection to ignore referenced but not installed packages.
@y
- Improve package detection to ignore referenced but not installed packages.
@z

@x
## 1.6.2
@y
## 1.6.2
@z

@x
{{< release-date date="2024-03-22" >}}
@y
{{< release-date date="2024-03-22" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- EPSS data is now fetched via the backend, as opposed to via the CLI client.
- Fix an issue when rendering markdown output using the `sbom://` prefix.
@y
- EPSS data is now fetched via the backend, as opposed to via the CLI client.
- Fix an issue when rendering markdown output using the `sbom://` prefix.
@z

@x
### Removed
@y
### Removed
@z

@x
- The `docker scout cves --epss-date` and `docker scout cache prune --epss` flags have been removed.
@y
- The `docker scout cves --epss-date` and `docker scout cache prune --epss` flags have been removed.
@z

@x
## 1.6.1
@y
## 1.6.1
@z

@x
{{< release-date date="2024-03-20" >}}
@y
{{< release-date date="2024-03-20" >}}
@z

@x
> **Note**
>
> This release only affects the `docker/scout-action` GitHub Action.
@y
> **Note**
>
> This release only affects the `docker/scout-action` GitHub Action.
@z

@x
### New
@y
### New
@z

@x
- Add support for passing in SBOM files in SDPX or in-toto SDPX format
@y
- Add support for passing in SBOM files in SDPX or in-toto SDPX format
@z

@x
  ```yaml
  uses: docker/scout-action@v1
  with:
      command: cves
      image: sbom://alpine.spdx.json
  ```
@y
  ```yaml
  uses: docker/scout-action@v1
  with:
      command: cves
      image: sbom://alpine.spdx.json
  ```
@z

@x
- Add support for SBOM files in `syft-json` format
@y
- Add support for SBOM files in `syft-json` format
@z

@x
  ```yaml
  uses: docker/scout-action@v1
  with:
      command: cves
      image: sbom://alpine.syft.json
  ```
@y
  ```yaml
  uses: docker/scout-action@v1
  with:
      command: cves
      image: sbom://alpine.syft.json
  ```
@z

@x
## 1.6.0
@y
## 1.6.0
@z

@x
{{< release-date date="2024-03-19" >}}
@y
{{< release-date date="2024-03-19" >}}
@z

@x
> **Note**
>
> This release only affects the CLI plugin, not the GitHub Action
@y
> **Note**
>
> This release only affects the CLI plugin, not the GitHub Action
@z

@x
### New
@y
### New
@z

@x
- Add support for passing in SBOM files in SDPX or in-toto SDPX format
@y
- Add support for passing in SBOM files in SDPX or in-toto SDPX format
@z

@x
  ```console
  $ docker scout cves sbom://path/to/sbom.spdx.json
  ```
@y
  ```console
  $ docker scout cves sbom://path/to/sbom.spdx.json
  ```
@z

@x
- Add support for SBOM files in `syft-json` format
@y
- Add support for SBOM files in `syft-json` format
@z

@x
  ```console
  $ docker scout cves sbom://path/to/sbom.syft.json
  ```
@y
  ```console
  $ docker scout cves sbom://path/to/sbom.syft.json
  ```
@z

@x
- Reads SBOM files from standard input
@y
- Reads SBOM files from standard input
@z

@x
  ```console
  $ syft -o json alpine | docker scout cves sbom://
  ```
@y
  ```console
  $ syft -o json alpine | docker scout cves sbom://
  ```
@z

@x
- Prioritize CVEs by EPSS score
@y
- Prioritize CVEs by EPSS score
@z

@x
  - `--epss` to display and prioritise the CVEs
  - `--epss-score` and `--epss-percentile` to filter by score and percentile
  - Prune cached EPSS files with `docker scout cache prune --epss`
@y
  - `--epss` to display and prioritise the CVEs
  - `--epss-score` and `--epss-percentile` to filter by score and percentile
  - Prune cached EPSS files with `docker scout cache prune --epss`
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Use Windows cache from WSL2
@y
- Use Windows cache from WSL2
@z

@x
  When inside WSL2 with Docker Desktop running, the Docker Scout CLI plugin now
  uses the cache from Windows. That way, if an image has been indexed for
  instance by Docker Desktop there's no need anymore to re-index it on WSL2
  side.
@y
  When inside WSL2 with Docker Desktop running, the Docker Scout CLI plugin now
  uses the cache from Windows. That way, if an image has been indexed for
  instance by Docker Desktop there's no need anymore to re-index it on WSL2
  side.
@z

@x
- Fix a panic that would occur when analyzing a single-image `oci-dir` input
- Improve local attestation support with the containerd image store
@y
- Fix a panic that would occur when analyzing a single-image `oci-dir` input
- Improve local attestation support with the containerd image store
@z

@x
## Earlier versions
@y
## Earlier versions
@z

@x
Release notes for earlier versions of the Docker Scout CLI plugin are available
on [GitHub](https://github.com/docker/scout-cli/releases).
@y
Release notes for earlier versions of the Docker Scout CLI plugin are available
on [GitHub](https://github.com/docker/scout-cli/releases).
@z
