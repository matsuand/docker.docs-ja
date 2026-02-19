%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: How Docker Hardened Images are built
linkTitle: Build process
description: Learn how Docker builds, tests, and maintains Docker Hardened Images through an automated, security-focused pipeline.
keywords: docker hardened images, slsa build level 3, automated patching, ai guardrail, build process, signed sbom, supply chain security
@y
title: How Docker Hardened Images are built
linkTitle: Build process
description: Learn how Docker builds, tests, and maintains Docker Hardened Images through an automated, security-focused pipeline.
keywords: docker hardened images, slsa build level 3, automated patching, ai guardrail, build process, signed sbom, supply chain security
@z

@x
Docker Hardened Images are built through an automated pipeline that monitors
upstream sources, applies security updates, and publishes signed artifacts.
This page explains the build process for both base DHI images and DHI Enterprise
customized images.
@y
Docker Hardened Images are built through an automated pipeline that monitors
upstream sources, applies security updates, and publishes signed artifacts.
This page explains the build process for both base DHI images and DHI Enterprise
customized images.
@z

@x
With a DHI Enterprise subscription, the automated security update pipeline for
both base and customized images is backed by SLA commitments, including a 7-day
SLA for critical and high severity vulnerabilities. Only DHI Enterprise includes
SLAs. DHI Free offers a secure baseline but no guaranteed remediation timelines.
@y
With a DHI Enterprise subscription, the automated security update pipeline for
both base and customized images is backed by SLA commitments, including a 7-day
SLA for critical and high severity vulnerabilities. Only DHI Enterprise includes
SLAs. DHI Free offers a secure baseline but no guaranteed remediation timelines.
@z

@x
## Build transparency
@y
## Build transparency
@z

@x
Docker Hardened Images provide transparency into how images are built through
publicly available definitions and verifiable attestations.
@y
Docker Hardened Images provide transparency into how images are built through
publicly available definitions and verifiable attestations.
@z

@x
### Image definitions
@y
### Image definitions
@z

@x
All image definitions are publicly available in the [catalog
repository](https://github.com/docker-hardened-images/catalog).
@y
All image definitions are publicly available in the [catalog
repository](https://github.com/docker-hardened-images/catalog).
@z

@x
Each image definition is a declarative YAML specification that includes metadata,
contents, build pipeline steps, security configurations, and runtime settings.
@y
Each image definition is a declarative YAML specification that includes metadata,
contents, build pipeline steps, security configurations, and runtime settings.
@z

@x
### SLSA attestations
@y
### SLSA attestations
@z

@x
Every Docker Hardened Image includes a SLSA Build Level 3 attestation that
provides verifiable build provenance. For details on SLSA attestations and how to
verify them, see [SLSA](../core-concepts/slsa.md).
@y
Every Docker Hardened Image includes a SLSA Build Level 3 attestation that
provides verifiable build provenance. For details on SLSA attestations and how to
verify them, see [SLSA](../core-concepts/slsa.md).
@z

@x
## Build triggers
@y
## Build triggers
@z

@x
Builds start automatically. You don't trigger them manually. The system monitors
for changes and starts builds in two scenarios:
@y
Builds start automatically. You don't trigger them manually. The system monitors
for changes and starts builds in two scenarios:
@z

@x
- [Upstream updates](#upstream-updates)
- [Customization changes](#customization-changes)
@y
- [Upstream updates](#upstream-updates)
- [Customization changes](#customization-changes)
@z

@x
### Upstream updates
@y
### Upstream updates
@z

@x
New releases, package updates, or CVE fixes from upstream projects trigger base
image rebuilds. These builds go through quality checks to ensure security and
reliability.
@y
New releases, package updates, or CVE fixes from upstream projects trigger base
image rebuilds. These builds go through quality checks to ensure security and
reliability.
@z

@x
#### Monitoring for updates
@y
#### Monitoring for updates
@z

@x
Docker continuously monitors upstream projects for new releases, package
updates, and security advisories. When changes are detected, the system
automatically queues affected images for rebuild using a SLSA Build Level
3-compliant build system.
@y
Docker continuously monitors upstream projects for new releases, package
updates, and security advisories. When changes are detected, the system
automatically queues affected images for rebuild using a SLSA Build Level
3-compliant build system.
@z

@x
Docker uses three strategies to track updates:
@y
Docker uses three strategies to track updates:
@z

@x
- GitHub releases: Monitors specific GitHub repositories for new releases and
  automatically updates the image definition when a new version is published.
- GitHub tags: Tracks tags in GitHub repositories to detect new versions.
- Package repositories: Monitors Alpine Linux, Debian, and Ubuntu package
  repositories through Docker Scout's package database to detect updated
  packages.
@y
- GitHub releases: Monitors specific GitHub repositories for new releases and
  automatically updates the image definition when a new version is published.
- GitHub tags: Tracks tags in GitHub repositories to detect new versions.
- Package repositories: Monitors Alpine Linux, Debian, and Ubuntu package
  repositories through Docker Scout's package database to detect updated
  packages.
@z

@x
In addition to explicit upstream tracking, Docker also monitors transitive
dependencies. When a package update is detected (for example, a security patch
for a library), Docker automatically identifies and rebuilds all images within
the support window that use that package.
@y
In addition to explicit upstream tracking, Docker also monitors transitive
dependencies. When a package update is detected (for example, a security patch
for a library), Docker automatically identifies and rebuilds all images within
the support window that use that package.
@z

@x
### Customization changes {tier="DHI Enterprise"}
@y
### Customization changes {tier="DHI Enterprise"}
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
Updates to your OCI artifact customizations trigger rebuilds of your customized
images.
@y
Updates to your OCI artifact customizations trigger rebuilds of your customized
images.
@z

@x
When you customize a DHI image with DHI Enterprise, your changes are packaged as
OCI artifacts that layer on top of the base image. Docker monitors your artifact
repositories and automatically rebuilds your customized images whenever you push
updates.
@y
When you customize a DHI image with DHI Enterprise, your changes are packaged as
OCI artifacts that layer on top of the base image. Docker monitors your artifact
repositories and automatically rebuilds your customized images whenever you push
updates.
@z

@x
The rebuild process fetches the current base image, applies your OCI artifacts,
signs the result, and publishes it automatically. You don't need to manage
builds or maintain CI pipelines for your customized images.
@y
The rebuild process fetches the current base image, applies your OCI artifacts,
signs the result, and publishes it automatically. You don't need to manage
builds or maintain CI pipelines for your customized images.
@z

@x
Customized images are also rebuilt automatically when the base DHI image they
depend on receives updates, ensuring your images always include the latest
security patches.
@y
Customized images are also rebuilt automatically when the base DHI image they
depend on receives updates, ensuring your images always include the latest
security patches.
@z

@x
## Build pipeline
@y
## Build pipeline
@z

@x
The following sections describe the build pipeline architecture and workflow for
Docker Hardened Images based on:
@y
The following sections describe the build pipeline architecture and workflow for
Docker Hardened Images based on:
@z

@x
- [Base image pipeline](#base-image-pipeline)
- [Customized image pipeline](#customized-image-pipeline)
@y
- [Base image pipeline](#base-image-pipeline)
- [Customized image pipeline](#customized-image-pipeline)
@z

@x
### Base image pipeline
@y
### Base image pipeline
@z

@x
Each Docker Hardened Image is built through an automated pipeline:
@y
Each Docker Hardened Image is built through an automated pipeline:
@z

@x
1. Monitoring: Docker monitors upstream sources for updates (new releases,
   package updates, security advisories).
2. Rebuild trigger: When changes are detected, an automated rebuild starts.
3. AI guardrail: An AI system fetches upstream diffs and scans them with
   language-aware checks. The guardrail focuses on high-leverage issues that can
   cause significant problems, such as inverted error checks, ignored failures,
   resource mishandling, or suspicious contributor activity. When it spots
   potential risks, it blocks the PR from auto-merging.
4. Human review: If the AI identifies risks with high confidence,
   Docker engineers review the flagged code, reproduce the issue, and decide on
   the appropriate action. Engineers often contribute fixes back to upstream
   projects, improving the code for the entire community. When fixes are accepted
   upstream, the DHI build pipeline applies the patch immediately to protect
   customers while the fix moves through the upstream release process.
5. Testing: Images undergo comprehensive testing for compatibility and
   functionality.
6. Signing and attestations: Docker signs each image and generates
   attestations (SBOMs, VEX documents, build provenance).
7. Publishing: The signed image is published to the DHI registry and the
   attestations are published to the Docker Scout registry.
8. Cascade rebuilds: If any customized images use this base, their rebuilds
   are automatically triggered.
@y
1. Monitoring: Docker monitors upstream sources for updates (new releases,
   package updates, security advisories).
2. Rebuild trigger: When changes are detected, an automated rebuild starts.
3. AI guardrail: An AI system fetches upstream diffs and scans them with
   language-aware checks. The guardrail focuses on high-leverage issues that can
   cause significant problems, such as inverted error checks, ignored failures,
   resource mishandling, or suspicious contributor activity. When it spots
   potential risks, it blocks the PR from auto-merging.
4. Human review: If the AI identifies risks with high confidence,
   Docker engineers review the flagged code, reproduce the issue, and decide on
   the appropriate action. Engineers often contribute fixes back to upstream
   projects, improving the code for the entire community. When fixes are accepted
   upstream, the DHI build pipeline applies the patch immediately to protect
   customers while the fix moves through the upstream release process.
5. Testing: Images undergo comprehensive testing for compatibility and
   functionality.
6. Signing and attestations: Docker signs each image and generates
   attestations (SBOMs, VEX documents, build provenance).
7. Publishing: The signed image is published to the DHI registry and the
   attestations are published to the Docker Scout registry.
8. Cascade rebuilds: If any customized images use this base, their rebuilds
   are automatically triggered.
@z

@x
Docker responds quickly to critical vulnerabilities. By building essential
components from source rather than waiting for packaged updates, Docker can
patch critical and high severity CVEs within days of upstream fixes and publish
updated images with new attestations. For DHI Enterprise subscriptions, this
rapid response is backed by a 7-day SLA for critical and high severity
vulnerabilities.
@y
Docker responds quickly to critical vulnerabilities. By building essential
components from source rather than waiting for packaged updates, Docker can
patch critical and high severity CVEs within days of upstream fixes and publish
updated images with new attestations. For DHI Enterprise subscriptions, this
rapid response is backed by a 7-day SLA for critical and high severity
vulnerabilities.
@z

@x
The following diagram shows the base image build flow:
@y
The following diagram shows the base image build flow:
@z

@x
```goat {class="text-sm"}
.-------------------.      .-------------------.      .-------------------.      .-------------------.
| Docker monitors   |----->| Trigger rebuild   |----->| AI guardrail      |----->| Human review      |
| upstream sources  |      |                   |      | scans changes     |      |                   |
'-------------------'      '-------------------'      '-------------------'      '-------------------'
                                                                                           |
                                                                                           v
.-------------------.      .-------------------.      .-------------------.      .-------------------.
| Cascade rebuilds  |<-----| Publish to        |<-----| Sign & generate   |<-----| Testing           |
| (if needed)       |      | DHI registry      |      | attestations      |      |                   |
'-------------------'      '-------------------'      '-------------------'      '-------------------'
```
@y
```goat {class="text-sm"}
.-------------------.      .-------------------.      .-------------------.      .-------------------.
| Docker monitors   |----->| Trigger rebuild   |----->| AI guardrail      |----->| Human review      |
| upstream sources  |      |                   |      | scans changes     |      |                   |
'-------------------'      '-------------------'      '-------------------'      '-------------------'
                                                                                           |
                                                                                           v
.-------------------.      .-------------------.      .-------------------.      .-------------------.
| Cascade rebuilds  |<-----| Publish to        |<-----| Sign & generate   |<-----| Testing           |
| (if needed)       |      | DHI registry      |      | attestations      |      |                   |
'-------------------'      '-------------------'      '-------------------'      '-------------------'
```
@z

@x
### Customized image pipeline {tier="DHI Enterprise"}
@y
### Customized image pipeline {tier="DHI Enterprise"}
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
When you customize a DHI image with DHI Enterprise, the build process is simplified:
@y
When you customize a DHI image with DHI Enterprise, the build process is simplified:
@z

@x
1. Monitoring: Docker monitors your OCI artifact repositories for changes.
2. Rebuild trigger: When you push updates to your OCI artifacts, or when the base
   DHI image is updated, an automated rebuild starts.
3. Fetch base image: The latest base DHI image is fetched.
4. Apply customizations: Your OCI artifacts are applied to the base image.
5. Signing and attestations: Docker signs the customized image and generates
   attestations (SBOMs, VEX documents, build provenance).
6. Publishing: The signed customized image is published to Docker Hub and the
   attestations are published to the Docker Scout registry.
@y
1. Monitoring: Docker monitors your OCI artifact repositories for changes.
2. Rebuild trigger: When you push updates to your OCI artifacts, or when the base
   DHI image is updated, an automated rebuild starts.
3. Fetch base image: The latest base DHI image is fetched.
4. Apply customizations: Your OCI artifacts are applied to the base image.
5. Signing and attestations: Docker signs the customized image and generates
   attestations (SBOMs, VEX documents, build provenance).
6. Publishing: The signed customized image is published to Docker Hub and the
   attestations are published to the Docker Scout registry.
@z

@x
Docker handles the entire process automatically, so you don't need to manage
builds for your customized images. However, you're responsible for testing your
customized images and managing any CVEs introduced by your OCI artifacts.
@y
Docker handles the entire process automatically, so you don't need to manage
builds for your customized images. However, you're responsible for testing your
customized images and managing any CVEs introduced by your OCI artifacts.
@z

@x
The following diagram shows the customized image build flow:
@y
The following diagram shows the customized image build flow:
@z

@x
```goat {class="text-sm"}
.-------------------.      .-------------------.      .-------------------.
| Docker monitors   |----->| Trigger rebuild   |----->| Fetch base        |
| OCI artifacts     |      |                   |      | DHI image         |
'-------------------'      '-------------------'      '-------------------'
                                                               |
                                                               v
.-------------------.      .-------------------.      .-------------------.
| Publish to        |<-----| Sign & generate   |<-----| Apply             |
| Docker Hub        |      | attestations      |      | customizations    |
'-------------------'      '-------------------'      '-------------------'
```
@y
```goat {class="text-sm"}
.-------------------.      .-------------------.      .-------------------.
| Docker monitors   |----->| Trigger rebuild   |----->| Fetch base        |
| OCI artifacts     |      |                   |      | DHI image         |
'-------------------'      '-------------------'      '-------------------'
                                                               |
                                                               v
.-------------------.      .-------------------.      .-------------------.
| Publish to        |<-----| Sign & generate   |<-----| Apply             |
| Docker Hub        |      | attestations      |      | customizations    |
'-------------------'      '-------------------'      '-------------------'
```
@z
