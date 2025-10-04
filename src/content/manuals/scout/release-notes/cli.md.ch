%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker Scout CLI release notes
linkTitle: CLI release notes
description: Learn about the latest features of the Docker Scout CLI plugin
keywords: docker scout, release notes, changelog, cli, features, changes, delta, new, releases, github actions
@y
title: Docker Scout CLI release notes
linkTitle: CLI release notes
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
## 1.18.4
@y
## 1.18.4
@z

@x
{{< release-date date="2025-10-02" >}}
@y
{{< release-date date="2025-10-02" >}}
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- VEX and SPDX fixes.
@y
- VEX and SPDX fixes.
@z

@x
## 1.18.3
@y
## 1.18.3
@z

@x
{{< release-date date="2025-08-13" >}}
@y
{{< release-date date="2025-08-13" >}}
@z

@x
### New
@y
### New
@z

@x
- Add `docker scout vex get` command to retrieve a merged VEX document from all VEX attestations.
@y
- Add `docker scout vex get` command to retrieve a merged VEX document from all VEX attestations.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Minor fixes for Docker Hardened Images (DHI).
@y
- Minor fixes for Docker Hardened Images (DHI).
@z

@x
## 1.18.2
@y
## 1.18.2
@z

@x
{{< release-date date="2025-07-21" >}}
@y
{{< release-date date="2025-07-21" >}}
@z

@x
### New
@y
### New
@z

@x
- Add `--skip-tlog` flag to `docker scout attest get` to skip signature verification against the transparency log.
@y
- Add `--skip-tlog` flag to `docker scout attest get` to skip signature verification against the transparency log.
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
- Add predicate type human-readable names for DHI FIPS and STIG attestations.
@y
- Add predicate type human-readable names for DHI FIPS and STIG attestations.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Do not filter CVEs that are marked with a VEX `under_investigation` statement.
- Minor fixes for Docker Hardened Images (DHI).
@y
- Do not filter CVEs that are marked with a VEX `under_investigation` statement.
- Minor fixes for Docker Hardened Images (DHI).
@z

@x
## 1.18.1
@y
## 1.18.1
@z

@x
{{< release-date date="2025-05-26" >}}
@y
{{< release-date date="2025-05-26" >}}
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fix issues with `docker scout attest list` and `docker scout attest get` for local images.
@y
- Fix issues with `docker scout attest list` and `docker scout attest get` for local images.
@z

@x
## 1.18.0
@y
## 1.18.0
@z

@x
{{< release-date date="2025-05-13" >}}
@y
{{< release-date date="2025-05-13" >}}
@z

@x
### New
@y
### New
@z

@x
- Add `docker scout attest list` and `docker scout attest get` commands to list attestations.
- Add support for Docker Hardened Images (DHI) VEX documents.
@y
- Add `docker scout attest list` and `docker scout attest get` commands to list attestations.
- Add support for Docker Hardened Images (DHI) VEX documents.
@z

@x
## 1.16.1
@y
## 1.16.1
@z

@x
{{< release-date date="2024-12-13" >}}
@y
{{< release-date date="2024-12-13" >}}
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fix in-toto subject digest for the `docker scout attestation add` command.
@y
- Fix in-toto subject digest for the `docker scout attestation add` command.
@z

@x
## 1.16.0
@y
## 1.16.0
@z

@x
{{< release-date date="2024-12-12" >}}
@y
{{< release-date date="2024-12-12" >}}
@z

@x
### New
@y
### New
@z

@x
- Add secret scanning to the `docker scout sbom` command.
- Add support for attestations for images from Tanzu Application Catalog.
@y
- Add secret scanning to the `docker scout sbom` command.
- Add support for attestations for images from Tanzu Application Catalog.
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
- Normalize licenses using the SPDX license list.
- Make licenses unique.
- Print platform in markdown output.
- Keep original pattern to find nested matches.
- Updates to make SPDX output spec-compliant.
- Update Go, crypto module, and Alpine dependencies.
@y
- Normalize licenses using the SPDX license list.
- Make licenses unique.
- Print platform in markdown output.
- Keep original pattern to find nested matches.
- Updates to make SPDX output spec-compliant.
- Update Go, crypto module, and Alpine dependencies.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fix behavior with multiple images in the `docker scout attest` command.
- Check directory existence before creating temporary file.
@y
- Fix behavior with multiple images in the `docker scout attest` command.
- Check directory existence before creating temporary file.
@z

@x
## 1.15.0
@y
## 1.15.0
@z

@x
{{< release-date date="2024-10-31" >}}
@y
{{< release-date date="2024-10-31" >}}
@z

@x
### New
@y
### New
@z

@x
- New `--format=cyclonedx` flag for the `docker scout sbom` to output the SBOM in CycloneDX format.
@y
- New `--format=cyclonedx` flag for the `docker scout sbom` to output the SBOM in CycloneDX format.
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
- Use high-to-low sort order for CVE summary.
- Support for enabling and disabling repositories that enabled by `docker scout push` or `docker scout watch`.
@y
- Use high-to-low sort order for CVE summary.
- Support for enabling and disabling repositories that enabled by `docker scout push` or `docker scout watch`.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Improve messaging when analyzing `oci` directories without attestations.
  Only single-platform images and multi-platform image _with attestations_ are supported.
  Multi-platform images without attestations are not supported.
- Improve classifiers and SBOM indexer:
  - Add classifier for Liquibase `lpm`.
  - Add Rakudo Star/MoarVM binary classifier.
  - Add binary classifiers for silverpeas utilities.
- Improve reading and caching of attestations with the containerd image store.
@y
- Improve messaging when analyzing `oci` directories without attestations.
  Only single-platform images and multi-platform image _with attestations_ are supported.
  Multi-platform images without attestations are not supported.
- Improve classifiers and SBOM indexer:
  - Add classifier for Liquibase `lpm`.
  - Add Rakudo Star/MoarVM binary classifier.
  - Add binary classifiers for silverpeas utilities.
- Improve reading and caching of attestations with the containerd image store.
@z

@x
## 1.14.0
@y
## 1.14.0
@z

@x
{{< release-date date="2024-09-24" >}}
@y
{{< release-date date="2024-09-24" >}}
@z

@x
### New
@y
### New
@z

@x
- Add suppression information at the CVE level in the `docker scout cves` command.
@y
- Add suppression information at the CVE level in the `docker scout cves` command.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fix listing CVEs for dangling images, for example: `local://sha256:...`
- Fix panic when analysing a file system input, for instance with `docker scout cves fs://.`
@y
- Fix listing CVEs for dangling images, for example: `local://sha256:...`
- Fix panic when analysing a file system input, for instance with `docker scout cves fs://.`
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

@x
  ```console {title="CLI"}
  $ docker scout quickview IMAGE --only-vex-affected --vex-location ./path/to/my.vex.json
  ```
@y
  ```console {title="CLI"}
  $ docker scout quickview IMAGE --only-vex-affected --vex-location ./path/to/my.vex.json
  ```
@z

@x
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: quickview
    image: [IMAGE]
    only-vex-affected: true
    vex-location: ./path/to/my.vex.json
  ```
@y
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: quickview
    image: [IMAGE]
    only-vex-affected: true
    vex-location: ./path/to/my.vex.json
  ```
@z

@x
- Account for VEX in `cves` command (GitHub Actions).
@y
- Account for VEX in `cves` command (GitHub Actions).
@z

@x
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: cves
    image: [IMAGE]
    only-vex-affected: true
    vex-location: ./path/to/my.vex.json
  ```
@y
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: cves
    image: [IMAGE]
    only-vex-affected: true
    vex-location: ./path/to/my.vex.json
  ```
@z

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

@x
  ```console {title="CLI"}
  $ docker scout cves [IMAGE] --only-cisa-kev
@y
  ```console {title="CLI"}
  $ docker scout cves [IMAGE] --only-cisa-kev
@z

@x
  ... (cropped output) ...
  ## Packages and Vulnerabilities
@y
  ... (cropped output) ...
  ## Packages and Vulnerabilities
@z

@x
  0C     1H     0M     0L  io.netty/netty-codec-http2 4.1.97.Final
  pkg:maven/io.netty/netty-codec-http2@4.1.97.Final
@y
  0C     1H     0M     0L  io.netty/netty-codec-http2 4.1.97.Final
  pkg:maven/io.netty/netty-codec-http2@4.1.97.Final
@z

@x
  ✗ HIGH CVE-2023-44487  CISA KEV  [OWASP Top Ten 2017 Category A9 - Using Components with Known Vulnerabilities]
    https://scout.docker.com/v/CVE-2023-44487
    Affected range  : <4.1.100
    Fixed version   : 4.1.100.Final
    CVSS Score      : 7.5
    CVSS Vector     : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
  ... (cropped output) ...
  ```
@y
  ✗ HIGH CVE-2023-44487  CISA KEV  [OWASP Top Ten 2017 Category A9 - Using Components with Known Vulnerabilities]
    https://scout.docker.com/v/CVE-2023-44487
    Affected range  : <4.1.100
    Fixed version   : 4.1.100.Final
    CVSS Score      : 7.5
    CVSS Vector     : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
  ... (cropped output) ...
  ```
@z

@x
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: cves
    image: [IMAGE]
    only-cisa-kev: true
  ```
@y
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: cves
    image: [IMAGE]
    only-cisa-kev: true
  ```
@z

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

@x
  ```console {title="CLI"}
  $ docker scout compare sbom://image1.json --to sbom://image2.json
  ```
@y
  ```console {title="CLI"}
  $ docker scout compare sbom://image1.json --to sbom://image2.json
  ```
@z

@x
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: compare
    image: sbom://image1.json
    to: sbom://image2.json
  ```
@y
  ```yaml {title="GitHub Action"}
  uses: docker/scout-action@v1
  with:
    command: compare
    image: sbom://image1.json
    to: sbom://image2.json
  ```
@z

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

@x
  ```yaml
     docker-build:
    # Use the official docker image.
    image: docker:cli
    stage: build
    services:
      - docker:dind
    variables:
      DOCKER_IMAGE_NAME: $CI_REGISTRY_IMAGE:$CI_COMMIT_REF_SLUG
    before_script:
      - docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" $CI_REGISTRY
@y
  ```yaml
     docker-build:
    # Use the official docker image.
    image: docker:cli
    stage: build
    services:
      - docker:dind
    variables:
      DOCKER_IMAGE_NAME: $CI_REGISTRY_IMAGE:$CI_COMMIT_REF_SLUG
    before_script:
      - docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" $CI_REGISTRY
@z

@x
      # Install curl and the Docker Scout CLI
      - |
        apk add --update curl
        curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s --
        apk del curl
        rm -rf /var/cache/apk/*
      # Login to Docker Hub required for Docker Scout CLI
      - echo "$DOCKER_HUB_PAT" | docker login --username "$DOCKER_HUB_USER" --password-stdin
@y
      # Install curl and the Docker Scout CLI
      - |
        apk add --update curl
        curl -sSfL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh | sh -s --
        apk del curl
        rm -rf /var/cache/apk/*
      # Login to Docker Hub required for Docker Scout CLI
      - echo "$DOCKER_HUB_PAT" | docker login --username "$DOCKER_HUB_USER" --password-stdin
@z

@x
    # All branches are tagged with $DOCKER_IMAGE_NAME (defaults to commit ref slug)
    # Default branch is also tagged with `latest`
    script:
      - docker buildx b --pull -t "$DOCKER_IMAGE_NAME" .
      - docker scout cves "$DOCKER_IMAGE_NAME" --format gitlab --output gl-container-scanning-report.json
      - docker push "$DOCKER_IMAGE_NAME"
      - |
        if [[ "$CI_COMMIT_BRANCH" == "$CI_DEFAULT_BRANCH" ]]; then
          docker tag "$DOCKER_IMAGE_NAME" "$CI_REGISTRY_IMAGE:latest"
          docker push "$CI_REGISTRY_IMAGE:latest"
        fi
    # Run this job in a branch where a Dockerfile exists
    rules:
      - if: $CI_COMMIT_BRANCH
        exists:
          - Dockerfile
    artifacts:
      reports:
        container_scanning: gl-container-scanning-report.json
  ```
@y
    # All branches are tagged with $DOCKER_IMAGE_NAME (defaults to commit ref slug)
    # Default branch is also tagged with `latest`
    script:
      - docker buildx b --pull -t "$DOCKER_IMAGE_NAME" .
      - docker scout cves "$DOCKER_IMAGE_NAME" --format gitlab --output gl-container-scanning-report.json
      - docker push "$DOCKER_IMAGE_NAME"
      - |
        if [[ "$CI_COMMIT_BRANCH" == "$CI_DEFAULT_BRANCH" ]]; then
          docker tag "$DOCKER_IMAGE_NAME" "$CI_REGISTRY_IMAGE:latest"
          docker push "$CI_REGISTRY_IMAGE:latest"
        fi
    # Run this job in a branch where a Dockerfile exists
    rules:
      - if: $CI_COMMIT_BRANCH
        exists:
          - Dockerfile
    artifacts:
      reports:
        container_scanning: gl-container-scanning-report.json
  ```
@z

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

@x
  ```text
  EPSS Score      : 0.000440
  EPSS Percentile : 0.092510
  ```
@y
  ```text
  EPSS Score      : 0.000440
  EPSS Percentile : 0.092510
  ```
@z

@x
  After:
@y
  After:
@z

@x
  ```text
  EPSS Score      : 0.04%
  EPSS Percentile : 9th percentile
  ```
@y
  ```text
  EPSS Score      : 0.04%
  EPSS Percentile : 9th percentile
  ```
@z

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
> [!NOTE]
>
> This release only affects the `docker/scout-action` GitHub Action.
@y
> [!NOTE]
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
> [!NOTE]
>
> This release only affects the CLI plugin, not the GitHub Action
@y
> [!NOTE]
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
- Indexing is now blocked in the CLI if it has been disabled using
  [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md) feature.
@y
  When inside WSL2 with Docker Desktop running, the Docker Scout CLI plugin now
  uses the cache from Windows. That way, if an image has been indexed for
  instance by Docker Desktop there's no need anymore to re-index it on WSL2
  side.
- Indexing is now blocked in the CLI if it has been disabled using
  [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md) feature.
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
