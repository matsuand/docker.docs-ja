%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Software Supply Chain Security
linktitle: Software Supply Chain Security
description: Learn how Docker Hardened Images help secure every stage of your software supply chain with signed metadata, provenance, and minimal attack surface.
keywords: software supply chain security, secure container images, signed image provenance, docker sbom, distroless security
@y
title: Software Supply Chain Security
linktitle: Software Supply Chain Security
description: Learn how Docker Hardened Images help secure every stage of your software supply chain with signed metadata, provenance, and minimal attack surface.
keywords: software supply chain security, secure container images, signed image provenance, docker sbom, distroless security
@z

@x
## What is Software Supply Chain Security (SSCS)?
@y
## What is Software Supply Chain Security (SSCS)?
@z

@x
SSCS encompasses practices and strategies designed to safeguard the entire
lifecycle of software development from initial code creation to deployment and
maintenance. It focuses on securing all components. This includes code,
dependencies, build processes, and distribution channels in order to prevent
malicious actors from compromising the software supply chain. Given the
increasing reliance on open-source libraries and third-party components,
ensuring the integrity and security of these elements is paramount
@y
SSCS encompasses practices and strategies designed to safeguard the entire
lifecycle of software development from initial code creation to deployment and
maintenance. It focuses on securing all components. This includes code,
dependencies, build processes, and distribution channels in order to prevent
malicious actors from compromising the software supply chain. Given the
increasing reliance on open-source libraries and third-party components,
ensuring the integrity and security of these elements is paramount
@z

@x
## Why is SSCS important?
@y
## Why is SSCS important?
@z

@x
The significance of SSCS has escalated due to the rise in sophisticated
cyberattacks targeting software supply chains. Recent incidents and the
exploitation of vulnerabilities in open-source components have underscored the
critical need for robust supply chain security measures. Compromises at any
stage of the software lifecycle can lead to widespread vulnerabilities, data
breaches, and significant financial losses.
@y
The significance of SSCS has escalated due to the rise in sophisticated
cyberattacks targeting software supply chains. Recent incidents and the
exploitation of vulnerabilities in open-source components have underscored the
critical need for robust supply chain security measures. Compromises at any
stage of the software lifecycle can lead to widespread vulnerabilities, data
breaches, and significant financial losses.
@z

@x
## How Docker Hardened Images contribute to SSCS
@y
## How Docker Hardened Images contribute to SSCS
@z

@x
Docker Hardened Images (DHI) are purpose-built container images designed with
security at their core, addressing the challenges of modern software supply
chain security. By integrating DHI into your development and deployment
pipelines, you can enhance your organization's SSCS posture through the
following features:
@y
Docker Hardened Images (DHI) are purpose-built container images designed with
security at their core, addressing the challenges of modern software supply
chain security. By integrating DHI into your development and deployment
pipelines, you can enhance your organization's SSCS posture through the
following features:
@z

@x
- Minimal attack surface: DHIs are engineered to be ultra-minimal, stripping
  away unnecessary components and reducing the attack surface by up to 95%. This
  distroless approach minimizes potential entry points for malicious actors.
@y
- Minimal attack surface: DHIs are engineered to be ultra-minimal, stripping
  away unnecessary components and reducing the attack surface by up to 95%. This
  distroless approach minimizes potential entry points for malicious actors.
@z

@x
- Cryptographic signing and provenance: Each DHI is cryptographically signed,
  ensuring authenticity and integrity. Build provenance is maintained, providing
  verifiable evidence of the image's origin and build process, aligning with
  standards like SLSA (Supply-chain Levels for Software Artifacts).
@y
- Cryptographic signing and provenance: Each DHI is cryptographically signed,
  ensuring authenticity and integrity. Build provenance is maintained, providing
  verifiable evidence of the image's origin and build process, aligning with
  standards like SLSA (Supply-chain Levels for Software Artifacts).
@z

@x
- Software Bill of Materials (SBOM): DHIs include a comprehensive SBOM,
  detailing all components and dependencies within the image. This transparency
  aids in vulnerability management and compliance tracking, enabling teams to
  assess and mitigate risks effectively.
@y
- Software Bill of Materials (SBOM): DHIs include a comprehensive SBOM,
  detailing all components and dependencies within the image. This transparency
  aids in vulnerability management and compliance tracking, enabling teams to
  assess and mitigate risks effectively.
@z

@x
- Continuous maintenance and rapid CVE remediation: Docker maintains DHIs with
  regular updates and security patches, backed by an SLA for addressing critical
  and high-severity vulnerabilities. This proactive approach helps ensure that
  images remain secure and compliant with enterprise standards.
@y
- Continuous maintenance and rapid CVE remediation: Docker maintains DHIs with
  regular updates and security patches, backed by an SLA for addressing critical
  and high-severity vulnerabilities. This proactive approach helps ensure that
  images remain secure and compliant with enterprise standards.
@z
