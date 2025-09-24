%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: What are hardened images and why use them?
linktitle: Hardened images
description: Learn what a hardened image is, why it matters, and how Docker Hardened Images offer stronger security, compliance, and operational efficiency.
keywords: hardened container image, docker hardened images, distroless container, slsa build level 3, signed sbom, vulnerability scan, compliance-ready container
@y
title: What are hardened images and why use them?
linktitle: Hardened images
description: Learn what a hardened image is, why it matters, and how Docker Hardened Images offer stronger security, compliance, and operational efficiency.
keywords: hardened container image, docker hardened images, distroless container, slsa build level 3, signed sbom, vulnerability scan, compliance-ready container
@z

@x
In today’s diverse software environments, container images are often designed
for flexibility and broad compatibility. While that makes them ideal for many
use cases, it can also result in images that include more components than needed
for specific workloads. Docker Hardened Images take a minimal-by-design approach
to help reduce image size, limit the attack surface, and streamline security and
compliance workflows.
@y
In today’s diverse software environments, container images are often designed
for flexibility and broad compatibility. While that makes them ideal for many
use cases, it can also result in images that include more components than needed
for specific workloads. Docker Hardened Images take a minimal-by-design approach
to help reduce image size, limit the attack surface, and streamline security and
compliance workflows.
@z

@x
Hardened images solve this by minimizing what's in the container image. Less
software means fewer vulnerabilities, faster deployments, and fewer red
dashboards to chase down every week.
@y
Hardened images solve this by minimizing what's in the container image. Less
software means fewer vulnerabilities, faster deployments, and fewer red
dashboards to chase down every week.
@z

@x
For platform engineers and security teams, hardened images offer a way out of
the CVE triage cycle, letting you focus on delivering secure, compliant
infrastructure without constant firefighting.
@y
For platform engineers and security teams, hardened images offer a way out of
the CVE triage cycle, letting you focus on delivering secure, compliant
infrastructure without constant firefighting.
@z

@x
## What is a hardened image?
@y
## What is a hardened image?
@z

@x
A hardened image is a container image that has been deliberately minimized and
secured to reduce vulnerabilities and meet stringent security and compliance
requirements. Unlike standard images, which may include non-essential components
that increase risk, hardened images are streamlined to include only what’s
needed to run your application securely.
@y
A hardened image is a container image that has been deliberately minimized and
secured to reduce vulnerabilities and meet stringent security and compliance
requirements. Unlike standard images, which may include non-essential components
that increase risk, hardened images are streamlined to include only what’s
needed to run your application securely.
@z

@x
## Benefits of hardened images
@y
## Benefits of hardened images
@z

@x
- Reduced attack surface: By removing non-essential components, hardened images
  limit potential entry points for attackers.
- Improved security posture: Regular updates and vulnerability scans help ensure
  hardened images remain secure over time.
- Compliance facilitation: Inclusion of signed metadata like SBOMs supports
  meeting regulatory and organizational compliance standards.
- Operational efficiency: Smaller image sizes lead to faster pulls, lower runtime overhead, and reduced cloud resource costs.
@y
- Reduced attack surface: By removing non-essential components, hardened images
  limit potential entry points for attackers.
- Improved security posture: Regular updates and vulnerability scans help ensure
  hardened images remain secure over time.
- Compliance facilitation: Inclusion of signed metadata like SBOMs supports
  meeting regulatory and organizational compliance standards.
- Operational efficiency: Smaller image sizes lead to faster pulls, lower runtime overhead, and reduced cloud resource costs.
@z

@x
## What is a Docker Hardened Image?
@y
## What is a Docker Hardened Image?
@z

@x
Docker Hardened Images (DHIs) take hardened images even further by combining
minimal, secure design with enterprise-grade support and tooling. Built with
security at the core, these images are continuously maintained, tested, and
validated to meet today’s toughest software supply chain and compliance
standards.
@y
Docker Hardened Images (DHIs) take hardened images even further by combining
minimal, secure design with enterprise-grade support and tooling. Built with
security at the core, these images are continuously maintained, tested, and
validated to meet today’s toughest software supply chain and compliance
standards.
@z

@x
Docker Hardened Images are secure by default, minimal by design, and maintained
so you don’t have to.
@y
Docker Hardened Images are secure by default, minimal by design, and maintained
so you don’t have to.
@z

@x
## How Docker Hardened Images differ from generic hardened images
@y
## How Docker Hardened Images differ from generic hardened images
@z

@x
- SLSA-compliant builds: Docker Hardened Images are built to meet [SLSA Build
  Level 3](../core-concepts/slsa.md), ensuring a tamper-resistant, verifiable,
  and auditable build process that protects against supply chain threats.
@y
- SLSA-compliant builds: Docker Hardened Images are built to meet [SLSA Build
  Level 3](../core-concepts/slsa.md), ensuring a tamper-resistant, verifiable,
  and auditable build process that protects against supply chain threats.
@z

@x
-  Distroless approach: Unlike traditional base images that bundle an entire OS
   with shells, package managers, and debugging tools, [distroless
   images](../core-concepts/distroless.md) retain only the minimal OS components
   required to run your application. By excluding unnecessary tooling and
   libraries, they reduce the attack surface by up to 95% and can improve
   performance and image size.
@y
-  Distroless approach: Unlike traditional base images that bundle an entire OS
   with shells, package managers, and debugging tools, [distroless
   images](../core-concepts/distroless.md) retain only the minimal OS components
   required to run your application. By excluding unnecessary tooling and
   libraries, they reduce the attack surface by up to 95% and can improve
   performance and image size.
@z

@x
- Continuous maintenance: All DHIs are continuously monitored and updated to
  maintain near-zero known exploitable [CVEs](../core-concepts/cves.md), helping
  your teams avoid patch fatigue and surprise alerts.
@y
- Continuous maintenance: All DHIs are continuously monitored and updated to
  maintain near-zero known exploitable [CVEs](../core-concepts/cves.md), helping
  your teams avoid patch fatigue and surprise alerts.
@z

@x
- Compliance-ready: Each image includes cryptographically signed metadata:
  - [SBOMs](../core-concepts/sbom.md) that show what's in the image
  - [VEX documents](../core-concepts/vex.md) to identify which vulnerabilities
    are actually exploitable
  - [Build provenance](../core-concepts/provenance.md) that proves how and where
    the image was built
@y
- Compliance-ready: Each image includes cryptographically signed metadata:
  - [SBOMs](../core-concepts/sbom.md) that show what's in the image
  - [VEX documents](../core-concepts/vex.md) to identify which vulnerabilities
    are actually exploitable
  - [Build provenance](../core-concepts/provenance.md) that proves how and where
    the image was built
@z

@x
- Compatibility-focused design: Docker Hardened Images provide a minimal runtime
  environment while maintaining compatibility with common Linux distributions.
  They remove non-essential components like shells and package managers to
  enhance security, yet retain a small base layer built on familiar distribution
  standards. Images are typically available with musl libc (Alpine-based) and
  glibc (Debian-based), supporting a broad range of application compatibility
  needs.
@y
- Compatibility-focused design: Docker Hardened Images provide a minimal runtime
  environment while maintaining compatibility with common Linux distributions.
  They remove non-essential components like shells and package managers to
  enhance security, yet retain a small base layer built on familiar distribution
  standards. Images are typically available with musl libc (Alpine-based) and
  glibc (Debian-based), supporting a broad range of application compatibility
  needs.
@z

@x
## Why use Docker Hardened Images?
@y
## Why use Docker Hardened Images?
@z

@x
Docker Hardened Images (DHIs) are secure by default, minimal by design, and
maintained so you don't have to. They offer:
@y
Docker Hardened Images (DHIs) are secure by default, minimal by design, and
maintained so you don't have to. They offer:
@z

@x
- Images built for peace of mind: Ultra-minimal and distroless, DHIs eliminate up to 95% of the traditional container attack surface.
- No more patch panic: With continuous CVE scanning and SLA-backed remediation, Docker helps you stay ahead of threats.
- Audit-ready images: All DHIs include signed SBOMs, VEX, and provenance that support security and compliance workflows.
- Images that work with your stack: Available in Alpine and Debian flavors, DHIs drop into your existing Dockerfiles and pipelines.
- Images backed by enterprise support: Get peace of mind with Docker's support and rapid response to critical vulnerabilities.
@y
- Images built for peace of mind: Ultra-minimal and distroless, DHIs eliminate up to 95% of the traditional container attack surface.
- No more patch panic: With continuous CVE scanning and SLA-backed remediation, Docker helps you stay ahead of threats.
- Audit-ready images: All DHIs include signed SBOMs, VEX, and provenance that support security and compliance workflows.
- Images that work with your stack: Available in Alpine and Debian flavors, DHIs drop into your existing Dockerfiles and pipelines.
- Images backed by enterprise support: Get peace of mind with Docker's support and rapid response to critical vulnerabilities.
@z
