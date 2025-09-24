%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Hardened, secure images
description: Learn how Docker Hardened Images reduce vulnerabilities, enforce non-root execution, and include SLSA-compliant metadata for supply chain security.
keywords: non-root containers, slsa build level 3, signed sbom, vex document, hardened container image
@y
title: Hardened, secure images
description: Learn how Docker Hardened Images reduce vulnerabilities, enforce non-root execution, and include SLSA-compliant metadata for supply chain security.
keywords: non-root containers, slsa build level 3, signed sbom, vex document, hardened container image
@z

@x
Docker Hardened Images (DHI) are engineered to provide a robust security
foundation for containerized applications, addressing the evolving challenges of
software supply chain security.
@y
Docker Hardened Images (DHI) are engineered to provide a robust security
foundation for containerized applications, addressing the evolving challenges of
software supply chain security.
@z

@x
## Near-zero vulnerabilities and non-root execution
@y
## Near-zero vulnerabilities and non-root execution
@z

@x
Each DHI is meticulously built to eliminate known vulnerabilities, achieving
near-zero Common Vulnerabilities and Exposures (CVEs) through continuous
scanning and updates. By adhering to the principle of least privilege, DHI
images run as non-root by default, reducing the risk of privilege escalation
attacks in production environments.
@y
Each DHI is meticulously built to eliminate known vulnerabilities, achieving
near-zero Common Vulnerabilities and Exposures (CVEs) through continuous
scanning and updates. By adhering to the principle of least privilege, DHI
images run as non-root by default, reducing the risk of privilege escalation
attacks in production environments.
@z

@x
## Comprehensive supply chain security
@y
## Comprehensive supply chain security
@z

@x
DHI incorporates multiple layers of security metadata to ensure transparency and
trust:
@y
DHI incorporates multiple layers of security metadata to ensure transparency and
trust:
@z

@x
- SLSA Level 3 compliance: Each image includes detailed build provenance,
  meeting the standards set by the Supply-chain Levels for Software Artifacts
  (SLSA) framework.
@y
- SLSA Level 3 compliance: Each image includes detailed build provenance,
  meeting the standards set by the Supply-chain Levels for Software Artifacts
  (SLSA) framework.
@z

@x
- Software Bill of Materials (SBOMs): Comprehensive SBOMs are provided,
  detailing all components within the image to facilitate vulnerability
  management and compliance audits.
@y
- Software Bill of Materials (SBOMs): Comprehensive SBOMs are provided,
  detailing all components within the image to facilitate vulnerability
  management and compliance audits.
@z

@x
- Vulnerability Exploitability eXchange (VEX) statements: VEX documents
  accompany each image, providing context about known vulnerabilities and their
  exploitability status.
@y
- Vulnerability Exploitability eXchange (VEX) statements: VEX documents
  accompany each image, providing context about known vulnerabilities and their
  exploitability status.
@z

@x
- Cryptographic signing and attestations: All images and associated metadata are
  cryptographically signed, ensuring integrity and authenticity.
@y
- Cryptographic signing and attestations: All images and associated metadata are
  cryptographically signed, ensuring integrity and authenticity.
@z

@x
## Minimal and developer-friendly options
@y
## Minimal and developer-friendly options
@z

@x
DHI provides both minimal and development-friendly image variants:
@y
DHI provides both minimal and development-friendly image variants:
@z

@x
- Minimal images: Built using a distroless approach, these images remove
  unnecessary components, reducing the attack surface by up to 95% and improving
  startup times.
@y
- Minimal images: Built using a distroless approach, these images remove
  unnecessary components, reducing the attack surface by up to 95% and improving
  startup times.
@z

@x
- Development images: Equipped with essential development tools and libraries,
  these images facilitate secure application building and testing.
@y
- Development images: Equipped with essential development tools and libraries,
  these images facilitate secure application building and testing.
@z
