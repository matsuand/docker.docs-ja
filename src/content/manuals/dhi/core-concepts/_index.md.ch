%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Core concepts
description: Learn the core concepts behind Docker Hardened Images, including security metadata, vulnerability management, image structure, and verification.
@y
title: 基本的な考え方
description: Learn the core concepts behind Docker Hardened Images, including security metadata, vulnerability management, image structure, and verification.
@z

% grid_concepts_metadata:

@x
    - title: Attestations
      description: Review the full set of signed attestations included with each Docker Hardened Image, such as SBOMs, VEX, build provenance, and scan results.
      icon: clipboard-document-list
      link: /dhi/core-concepts/attestations/
@y
    - title: Attestations
      description: Review the full set of signed attestations included with each Docker Hardened Image, such as SBOMs, VEX, build provenance, and scan results.
      icon: clipboard-document-list
      link: __SUBDIR__/dhi/core-concepts/attestations/
@z

@x
    - title: Software Bill of Materials (SBOMs)
      description: Learn what SBOMs are, why they matter, and how Docker Hardened Images include signed SBOMs to support transparency and compliance.
      icon: list-bullet
      link: /dhi/core-concepts/sbom/
@y
    - title: Software Bill of Materials (SBOMs)
      description: Learn what SBOMs are, why they matter, and how Docker Hardened Images include signed SBOMs to support transparency and compliance.
      icon: list-bullet
      link: __SUBDIR__/dhi/core-concepts/sbom/
@z

@x
    - title: Supply-chain Levels for Software Artifacts (SLSA)
      description: Learn how Docker Hardened Images comply with SLSA Build Level 3 and how to verify provenance for secure, tamper-resistant builds.
      icon: clipboard-document-check
      link: /dhi/core-concepts/slsa/
@y
    - title: Supply-chain Levels for Software Artifacts (SLSA)
      description: Learn how Docker Hardened Images comply with SLSA Build Level 3 and how to verify provenance for secure, tamper-resistant builds.
      icon: clipboard-document-check
      link: __SUBDIR__/dhi/core-concepts/slsa/
@z

@x
    - title: Image provenance
      description: Learn how build provenance metadata helps trace the origin of Docker Hardened Images and support compliance with SLSA.
      icon: pencil-square
      link: /dhi/core-concepts/provenance/
@y
    - title: Image provenance
      description: Learn how build provenance metadata helps trace the origin of Docker Hardened Images and support compliance with SLSA.
      icon: pencil-square
      link: __SUBDIR__/dhi/core-concepts/provenance/
@z

% grid_concepts_compliance:

@x
    - title: FIPS
      description: Learn how Docker Hardened Images support FIPS 140 by using validated cryptographic modules and providing signed attestations for compliance audits.
      icon: check-badge
      link: /dhi/core-concepts/fips/
@y
    - title: FIPS
      description: Learn how Docker Hardened Images support FIPS 140 by using validated cryptographic modules and providing signed attestations for compliance audits.
      icon: check-badge
      link: __SUBDIR__/dhi/core-concepts/fips/
@z

@x
    - title: STIG
      description: Learn how Docker Hardened Images provide STIG-ready container images with verifiable security scan attestations for government and enterprise compliance requirements.
      icon: shield-check
      link: /dhi/core-concepts/stig/
@y
    - title: STIG
      description: Learn how Docker Hardened Images provide STIG-ready container images with verifiable security scan attestations for government and enterprise compliance requirements.
      icon: shield-check
      link: __SUBDIR__/dhi/core-concepts/stig/
@z

@x
    - title: CIS Benchmarks
      description: Learn how Docker Hardened Images help you meet Center for Internet Security (CIS) Docker Benchmark requirements for secure container configuration and deployment.
      icon: check-circle
      link: /dhi/core-concepts/cis/
@y
    - title: CIS Benchmarks
      description: Learn how Docker Hardened Images help you meet Center for Internet Security (CIS) Docker Benchmark requirements for secure container configuration and deployment.
      icon: check-circle
      link: __SUBDIR__/dhi/core-concepts/cis/
@z

% grid_concepts_risk:

@x
    - title: Common Vulnerabilities and Exposures (CVEs)
      description: Understand what CVEs are, how Docker Hardened Images reduce exposure, and how to scan images for vulnerabilities using popular tools.
      icon: exclamation-circle
      link: /dhi/core-concepts/cves/
@y
    - title: Common Vulnerabilities and Exposures (CVEs)
      description: Understand what CVEs are, how Docker Hardened Images reduce exposure, and how to scan images for vulnerabilities using popular tools.
      icon: exclamation-circle
      link: __SUBDIR__/dhi/core-concepts/cves/
@z

@x
    - title: Vulnerability Exploitability eXchange (VEX)
      description: Learn how VEX helps you prioritize real risks by identifying which vulnerabilities in Docker Hardened Images are actually exploitable.
      icon: exclamation-triangle
      link: /dhi/core-concepts/vex/
@y
    - title: Vulnerability Exploitability eXchange (VEX)
      description: Learn how VEX helps you prioritize real risks by identifying which vulnerabilities in Docker Hardened Images are actually exploitable.
      icon: exclamation-triangle
      link: __SUBDIR__/dhi/core-concepts/vex/
@z

@x
    - title: Software Supply Chain Security
      description: Learn how Docker Hardened Images help secure every stage of your software supply chain with signed metadata, provenance, and minimal attack surface.
      icon: shield-check
      link: /dhi/core-concepts/sscs/
@y
    - title: Software Supply Chain Security
      description: Learn how Docker Hardened Images help secure every stage of your software supply chain with signed metadata, provenance, and minimal attack surface.
      icon: shield-check
      link: __SUBDIR__/dhi/core-concepts/sscs/
@z

@x
    - title: Secure Software Development Lifecycle (SSDLC)
      description: See how Docker Hardened Images support a secure SDLC by integrating with scanning, signing, and debugging tools.
      icon: wrench-screwdriver
      link: /dhi/core-concepts/ssdlc/
@y
    - title: Secure Software Development Lifecycle (SSDLC)
      description: See how Docker Hardened Images support a secure SDLC by integrating with scanning, signing, and debugging tools.
      icon: wrench-screwdriver
      link: __SUBDIR__/dhi/core-concepts/ssdlc/
@z

% grid_concepts_structure:

@x
    - title: Distroless images
      description: Learn how Docker Hardened Images use distroless variants to minimize attack surface and remove unnecessary components.
      icon: squares-2x2
      link: /dhi/core-concepts/distroless/
@y
    - title: Distroless images
      description: Learn how Docker Hardened Images use distroless variants to minimize attack surface and remove unnecessary components.
      icon: squares-2x2
      link: __SUBDIR__/dhi/core-concepts/distroless/
@z

@x
    - title: glibc and musl support in Docker Hardened Images
      description: Compare glibc and musl variants of DHIs to choose the right base image for your application’s compatibility, size, and performance needs.
      icon: arrows-up-down
      link: /dhi/core-concepts/glibc-musl/
@y
    - title: glibc and musl support in Docker Hardened Images
      description: Compare glibc and musl variants of DHIs to choose the right base image for your application’s compatibility, size, and performance needs.
      icon: arrows-up-down
      link: __SUBDIR__/dhi/core-concepts/glibc-musl/
@z

@x
    - title: Image immutability
      description: Understand how image digests, read-only containers, and signed metadata ensure Docker Hardened Images are tamper-resistant and immutable.
      icon: minus-circle
      link: /dhi/core-concepts/immutability/
@y
    - title: Image immutability
      description: Understand how image digests, read-only containers, and signed metadata ensure Docker Hardened Images are tamper-resistant and immutable.
      icon: minus-circle
      link: __SUBDIR__/dhi/core-concepts/immutability/
@z

@x
    - title: Image hardening
      description: Learn how Docker Hardened Images are designed for security, with minimal components, nonroot execution, and secure-by-default configurations.
      icon: shield-check
      link: /dhi/core-concepts/hardening/
@y
    - title: Image hardening
      description: Learn how Docker Hardened Images are designed for security, with minimal components, nonroot execution, and secure-by-default configurations.
      icon: shield-check
      link: __SUBDIR__/dhi/core-concepts/hardening/
@z

% grid_concepts_verification:

@x
    - title: Digests
      description: Learn how to use immutable image digests to guarantee consistency and verify the exact Docker Hardened Image you're running.
      icon: finger-print
      link: /dhi/core-concepts/digests/
@y
    - title: Digests
      description: Learn how to use immutable image digests to guarantee consistency and verify the exact Docker Hardened Image you're running.
      icon: finger-print
      link: __SUBDIR__/dhi/core-concepts/digests/
@z

@x
    - title: Code signing
      description: Understand how Docker Hardened Images are cryptographically signed using Cosign to verify authenticity, integrity, and secure provenance.
      icon: key
      link: /dhi/core-concepts/signatures/
@y
    - title: Code signing
      description: Understand how Docker Hardened Images are cryptographically signed using Cosign to verify authenticity, integrity, and secure provenance.
      icon: key
      link: __SUBDIR__/dhi/core-concepts/signatures/
@z

@x
Docker Hardened Images (DHIs) are built on a foundation of secure software
supply chain practices. This section explains the core concepts behind that
foundation, from signed attestations and immutable digests to standards like SLSA
and VEX.
@y
Docker Hardened Images (DHIs) are built on a foundation of secure software
supply chain practices. This section explains the core concepts behind that
foundation, from signed attestations and immutable digests to standards like SLSA
and VEX.
@z

@x
Start here if you want to understand how Docker Hardened Images support compliance,
transparency, and security.
@y
Start here if you want to understand how Docker Hardened Images support compliance,
transparency, and security.
@z

@x
## Security metadata and attestations
@y
## Security metadata and attestations
@z

@x
{{< grid items="grid_concepts_metadata" >}}
@y
{{< grid items="grid_concepts_metadata" >}}
@z

@x
## Compliance standards
@y
## Compliance standards
@z

@x
{{< grid items="grid_concepts_compliance" >}}
@y
{{< grid items="grid_concepts_compliance" >}}
@z

@x
## Vulnerability and risk management
@y
## Vulnerability and risk management
@z

@x
{{< grid items="grid_concepts_risk" >}}
@y
{{< grid items="grid_concepts_risk" >}}
@z

@x
## Image structure and behavior
@y
## Image structure and behavior
@z

@x
{{< grid items="grid_concepts_structure" >}}
@y
{{< grid items="grid_concepts_structure" >}}
@z

@x
## Verification and traceability
@y
## Verification and traceability
@z

@x
{{< grid items="grid_concepts_verification" >}}
@y
{{< grid items="grid_concepts_verification" >}}
@z
