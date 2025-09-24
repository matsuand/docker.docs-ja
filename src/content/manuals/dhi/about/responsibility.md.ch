%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Understanding roles and responsibilities for Docker Hardened Images
linkTitle: Responsibility overview
description: Understand the division of responsibilities between Docker, upstream projects, and you when using Docker Hardened Images.
keywords: software supply chain security, signed sbom, vex document, container provenance, image attestation
@y
title: Understanding roles and responsibilities for Docker Hardened Images
linkTitle: Responsibility overview
description: Understand the division of responsibilities between Docker, upstream projects, and you when using Docker Hardened Images.
keywords: software supply chain security, signed sbom, vex document, container provenance, image attestation
@z

@x
Docker Hardened Images (DHIs) are curated and maintained by Docker, and built
using upstream open source components. To deliver security, reliability, and
compliance, responsibilities are shared among three groups:
@y
Docker Hardened Images (DHIs) are curated and maintained by Docker, and built
using upstream open source components. To deliver security, reliability, and
compliance, responsibilities are shared among three groups:
@z

@x
- Upstream maintainers: the developers and communities responsible for the
  open source software included in each image.
- Docker: the provider of hardened, signed, and maintained container images.
- You (the customer): the consumer who runs and, optionally, customizes DHIs
  in your environment.
@y
- Upstream maintainers: the developers and communities responsible for the
  open source software included in each image.
- Docker: the provider of hardened, signed, and maintained container images.
- You (the customer): the consumer who runs and, optionally, customizes DHIs
  in your environment.
@z

@x
This topic outlines who handles what, so you can use DHIs effectively and
securely.
@y
This topic outlines who handles what, so you can use DHIs effectively and
securely.
@z

@x
## Releases
@y
## Releases
@z

@x
- Upstream: Publishes and maintains official releases of the software
  components included in DHIs. This includes versioning, changelogs, and
  deprecation notices.
- Docker: Builds, hardens, and signs Docker Hardened Images based on
  upstream versions. Docker maintains these images in line with upstream release
  timelines and internal policies.
- You: Ensure you're staying on supported versions of DHIs and upstream
  projects. Using outdated or unsupported components can introduce security
  risk.
@y
- Upstream: Publishes and maintains official releases of the software
  components included in DHIs. This includes versioning, changelogs, and
  deprecation notices.
- Docker: Builds, hardens, and signs Docker Hardened Images based on
  upstream versions. Docker maintains these images in line with upstream release
  timelines and internal policies.
- You: Ensure you're staying on supported versions of DHIs and upstream
  projects. Using outdated or unsupported components can introduce security
  risk.
@z

@x
## Patching
@y
## Patching
@z

@x
- Upstream: Maintains and updates the source code for each component,
  including fixing vulnerabilities in libraries and dependencies.
- Docker: Rebuilds and re-releases images with upstream patches applied.
  Docker also monitors for vulnerabilities and rapidly publishes updates to
  affected images.
- You: Apply DHI updates in your environments and patch any software or
  dependencies you install on top of the base image.
@y
- Upstream: Maintains and updates the source code for each component,
  including fixing vulnerabilities in libraries and dependencies.
- Docker: Rebuilds and re-releases images with upstream patches applied.
  Docker also monitors for vulnerabilities and rapidly publishes updates to
  affected images.
- You: Apply DHI updates in your environments and patch any software or
  dependencies you install on top of the base image.
@z

@x
## Testing
@y
## Testing
@z

@x
- Upstream: Defines the behavior and functionality of the original software,
  and is responsible for validating core features.
- Docker: Validates that DHIs start, run, and behave consistently with
  upstream expectations. Docker also runs security scans and includes a [testing
  attestation](../core-concepts/attestations.md) with each image.
- You: Test your application on top of DHIs and validate that any changes or
  customizations function as expected in your environment.
@y
- Upstream: Defines the behavior and functionality of the original software,
  and is responsible for validating core features.
- Docker: Validates that DHIs start, run, and behave consistently with
  upstream expectations. Docker also runs security scans and includes a [testing
  attestation](../core-concepts/attestations.md) with each image.
- You: Test your application on top of DHIs and validate that any changes or
  customizations function as expected in your environment.
@z

@x
## Security and compliance
@y
## Security and compliance
@z

@x
- Docker: Publishes signed SBOMs, VEX documents, provenance data, and CVE
  scan results with each image to support compliance and supply chain security.
- You: Integrate DHIs into your security and compliance workflows, including
  vulnerability management and auditing.
@y
- Docker: Publishes signed SBOMs, VEX documents, provenance data, and CVE
  scan results with each image to support compliance and supply chain security.
- You: Integrate DHIs into your security and compliance workflows, including
  vulnerability management and auditing.
@z

@x
## Summary
@y
## Summary
@z

@x
Docker Hardened Images give you a secure foundation, complete with signed
metadata and upstream transparency. Your role is to make informed use of these
images, apply updates promptly, and validate that your configurations and
applications meet your internal requirements.
@y
Docker Hardened Images give you a secure foundation, complete with signed
metadata and upstream transparency. Your role is to make informed use of these
images, apply updates promptly, and validate that your configurations and
applications meet your internal requirements.
@z
