%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ �Ή�

@x
title: Docker Hardened Images features
linktitle: Features
description: Docker Hardened Images provide total transparency, minimal attack surface, and enterprise-grade security for every application—free and open source.
@y
title: Docker Hardened Images features
linktitle: Features
description: Docker Hardened Images provide total transparency, minimal attack surface, and enterprise-grade security for every application—free and open source.
@z

@x
Docker Hardened Images (DHI) are minimal, secure, and production-ready container
base and application images maintained by Docker. Designed to reduce
vulnerabilities and simplify compliance, DHI integrates easily into your
existing Docker-based workflows with little to no retooling required.
@y
Docker Hardened Images (DHI) are minimal, secure, and production-ready container
base and application images maintained by Docker. Designed to reduce
vulnerabilities and simplify compliance, DHI integrates easily into your
existing Docker-based workflows with little to no retooling required.
@z

@x
DHI provides security for everyone:
@y
DHI provides security for everyone:
@z

@x
- [DHI Free](#dhi-free-features) provides core security features available to
  everyone with no licensing restrictions under Apache 2.0
- [DHI Enterprise subscription
  features](#dhi-enterprise-subscription-features) add
  SLA-backed security updates, compliance variants (like FIPS and STIG), image
  customization, and optional Extended Lifecycle Support (ELS) for post-EOL
  coverage
@y
- [DHI Free](#dhi-free-features) provides core security features available to
  everyone with no licensing restrictions under Apache 2.0
- [DHI Enterprise subscription
  features](#dhi-enterprise-subscription-features) add
  SLA-backed security updates, compliance variants (like FIPS and STIG), image
  customization, and optional Extended Lifecycle Support (ELS) for post-EOL
  coverage
@z

@x
## DHI Free features
@y
## DHI Free features
@z

@x
DHI's core features are open and free to use, share, and build on with no
licensing surprises, backed by an Apache 2.0 license.
@y
DHI's core features are open and free to use, share, and build on with no
licensing surprises, backed by an Apache 2.0 license.
@z

@x
### Security by default
@y
### Security by default
@z

@x
- Near-zero CVEs: Continuously scanned and patched to maintain minimal known
  exploitable vulnerabilities, with no SLA-backed time commitments for non-DHI
  Enterprise users
- Minimal attack surface: Distroless variants reduce attack surface by up to 95% by removing unnecessary components
- Non-root execution: Run as non-root by default, following the principle of least privilege
- Transparent vulnerability reporting: Every CVE is visible and assessed using public data—no suppressed feeds or proprietary scoring
@y
- Near-zero CVEs: Continuously scanned and patched to maintain minimal known
  exploitable vulnerabilities, with no SLA-backed time commitments for non-DHI
  Enterprise users
- Minimal attack surface: Distroless variants reduce attack surface by up to 95% by removing unnecessary components
- Non-root execution: Run as non-root by default, following the principle of least privilege
- Transparent vulnerability reporting: Every CVE is visible and assessed using public data—no suppressed feeds or proprietary scoring
@z

@x
### Total transparency
@y
### Total transparency
@z

@x
Every image includes complete, verifiable security metadata:
@y
Every image includes complete, verifiable security metadata:
@z

@x
- SLSA Build Level 3 provenance: Verifiable, tamper-resistant builds that meet supply chain security standards
- Signed SBOMs: Complete Software Bill of Materials for every component
- VEX statements: Vulnerability Exploitability eXchange documents provide context about known CVEs
- Cryptographic signatures: All images and metadata are signed for authenticity
@y
- SLSA Build Level 3 provenance: Verifiable, tamper-resistant builds that meet supply chain security standards
- Signed SBOMs: Complete Software Bill of Materials for every component
- VEX statements: Vulnerability Exploitability eXchange documents provide context about known CVEs
- Cryptographic signatures: All images and metadata are signed for authenticity
@z

@x
### Built for developers
@y
### Built for developers
@z

@x
- Familiar foundations: Built on Alpine and Debian, requiring minimal changes to adopt
- glibc and musl support: Available in both variants for broad application compatibility
- Development and runtime variants: Use dev images for building, minimal runtime images for production
- Drop-in compatibility: Works seamlessly with existing Docker workflows, CI/CD pipelines, and tools
@y
- Familiar foundations: Built on Alpine and Debian, requiring minimal changes to adopt
- glibc and musl support: Available in both variants for broad application compatibility
- Development and runtime variants: Use dev images for building, minimal runtime images for production
- Drop-in compatibility: Works seamlessly with existing Docker workflows, CI/CD pipelines, and tools
@z

@x
### Continuous maintenance
@y
### Continuous maintenance
@z

@x
- Automatic patching: Images are rebuilt and updated when upstream security
  patches become available, with no SLA-backed time commitments for non-DHI
  Enterprise users
- Scanner integration: Direct integration with scanners and other security platforms
@y
- Automatic patching: Images are rebuilt and updated when upstream security
  patches become available, with no SLA-backed time commitments for non-DHI
  Enterprise users
- Scanner integration: Direct integration with scanners and other security platforms
@z

@x
### Kubernetes and Helm chart support
@y
### Kubernetes and Helm chart support
@z

@x
Docker Hardened Image (DHI) charts are Docker-provided Helm charts built from
upstream sources, designed for compatibility with Docker Hardened Images. These
charts are available as OCI artifacts within the DHI catalog on Docker Hub. DHI
charts are robustly tested after building to ensure they work out-of-the-box
with Docker Hardened Images. This removes friction in migration and reduces
developer workload in implementing the charts, ensuring seamless compatibility.
@y
Docker Hardened Image (DHI) charts are Docker-provided Helm charts built from
upstream sources, designed for compatibility with Docker Hardened Images. These
charts are available as OCI artifacts within the DHI catalog on Docker Hub. DHI
charts are robustly tested after building to ensure they work out-of-the-box
with Docker Hardened Images. This removes friction in migration and reduces
developer workload in implementing the charts, ensuring seamless compatibility.
@z

@x
Like the hardened images, DHI charts incorporate multiple layers of security
metadata to ensure transparency and trust:
@y
Like the hardened images, DHI charts incorporate multiple layers of security
metadata to ensure transparency and trust:
@z

@x
- SLSA Level 3 compliance: Each chart is built with Docker's SLSA Build Level 3
  system, including a detailed build provenance, and meeting the standards set
  by the Supply-chain Levels for Software Artifacts (SLSA) framework.
- Software Bill of Materials (SBOMs): Comprehensive SBOMs are provided,
  detailing all components referenced within the chart to facilitate
  vulnerability management and compliance audits.
- Cryptographic signing: All associated metadata is cryptographically signed by
  Docker, ensuring integrity and authenticity.
- Hardened configuration: Charts automatically reference Docker hardened images,
  ensuring security in deployments.
@y
- SLSA Level 3 compliance: Each chart is built with Docker's SLSA Build Level 3
  system, including a detailed build provenance, and meeting the standards set
  by the Supply-chain Levels for Software Artifacts (SLSA) framework.
- Software Bill of Materials (SBOMs): Comprehensive SBOMs are provided,
  detailing all components referenced within the chart to facilitate
  vulnerability management and compliance audits.
- Cryptographic signing: All associated metadata is cryptographically signed by
  Docker, ensuring integrity and authenticity.
- Hardened configuration: Charts automatically reference Docker hardened images,
  ensuring security in deployments.
@z

@x
## DHI Enterprise subscription features
@y
## DHI Enterprise subscription features
@z

@x
For organizations with strict security requirements, regulatory demands, or
operational needs, DHI Enterprise delivers additional capabilities.
@y
For organizations with strict security requirements, regulatory demands, or
operational needs, DHI Enterprise delivers additional capabilities.
@z

@x
### Compliance variants {tier="DHI Enterprise"}
@y
### Compliance variants {tier="DHI Enterprise"}
@z

@x
- FIPS-enabled images: For regulated industries and government systems
- STIG-ready images: Meet DoD Security Technical Implementation Guide requirements
@y
- FIPS-enabled images: For regulated industries and government systems
- STIG-ready images: Meet DoD Security Technical Implementation Guide requirements
@z

@x
### SLA-backed security {tier="DHI Enterprise"}
@y
### SLA-backed security {tier="DHI Enterprise"}
@z

@x
- CVE remediation SLA: 7-day SLA for critical and high severity vulnerabilities,
  with SLA commitments for other severity levels
- ELS CVE remediation SLA: Extended Lifecycle Support images have SLA commitments
  for CVE remediation, even after upstream end-of-life
- Enterprise support: Access to Docker's support team for mission-critical applications
@y
- CVE remediation SLA: 7-day SLA for critical and high severity vulnerabilities,
  with SLA commitments for other severity levels
- ELS CVE remediation SLA: Extended Lifecycle Support images have SLA commitments
  for CVE remediation, even after upstream end-of-life
- Enterprise support: Access to Docker's support team for mission-critical applications
@z

@x
### Customization and control {tier="DHI Enterprise"}
@y
### Customization and control {tier="DHI Enterprise"}
@z

@x
- Build custom images: Add your own packages, tools, certificates, and configurations
- Secure build infrastructure: Customizations built on Docker's trusted infrastructure
- Full chain of trust: Customized images maintain provenance and cryptographic signing
- Automatic updates: Custom images are automatically rebuilt when base images are patched
@y
- Build custom images: Add your own packages, tools, certificates, and configurations
- Secure build infrastructure: Customizations built on Docker's trusted infrastructure
- Full chain of trust: Customized images maintain provenance and cryptographic signing
- Automatic updates: Custom images are automatically rebuilt when base images are patched
@z

@x
### Extended Lifecycle Support {tier="DHI Enterprise add-on"}
@y
### Extended Lifecycle Support {tier="DHI Enterprise add-on"}
@z

@x
- Post-EOL security coverage: Continue receiving patches for years after upstream support ends
- Continuous compliance: Updated SBOMs, provenance, and signing for audit requirements
- Production continuity: Keep production running securely without forced migrations
@y
- Post-EOL security coverage: Continue receiving patches for years after upstream support ends
- Continuous compliance: Updated SBOMs, provenance, and signing for audit requirements
- Production continuity: Keep production running securely without forced migrations
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Explore how DHI images are built and more](/dhi/explore/)
- [Get started using DHIs](/dhi/get-started/)
- [Contact Docker for DHI Enterprise](https://www.docker.com/pricing/contact-sales/)
@y
- [Explore how DHI images are built and more](__SUBDIR__/dhi/explore/)
- [Get started using DHIs](__SUBDIR__/dhi/get-started/)
- [Contact Docker for DHI Enterprise](https://www.docker.com/pricing/contact-sales/)
@z
