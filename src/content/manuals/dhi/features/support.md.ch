%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Enterprise support
description: Get enterprise-grade support and SLA-backed security updates for Docker Hardened Images (DHI), including 24x7x365 access to Docker’s support team and guaranteed CVE patching for critical and high vulnerabilities.
keywords: enterprise container support, sla-backed security, cve patching, secure container image, docker enterprise support
@y
title: Enterprise support
description: Get enterprise-grade support and SLA-backed security updates for Docker Hardened Images (DHI), including 24x7x365 access to Docker’s support team and guaranteed CVE patching for critical and high vulnerabilities.
keywords: enterprise container support, sla-backed security, cve patching, secure container image, docker enterprise support
@z

@x
Docker Hardened Images (DHI) are designed to provide flexibility and robust
support for enterprise environments, allowing teams to tailor images to their
specific needs while ensuring security and compliance.
@y
Docker Hardened Images (DHI) are designed to provide flexibility and robust
support for enterprise environments, allowing teams to tailor images to their
specific needs while ensuring security and compliance.
@z

@x
## Enterprise-grade support and SLA-backed security updates
@y
## Enterprise-grade support and SLA-backed security updates
@z

@x
Docker provides comprehensive enterprise support for DHI users, ensuring rapid
response to security threats and operational issues:
@y
Docker provides comprehensive enterprise support for DHI users, ensuring rapid
response to security threats and operational issues:
@z

@x
- Enterprise support: Access to Docker's support team, with
  response times designed to safeguard mission-critical applications and
  maintain operational continuity.
@y
- Enterprise support: Access to Docker's support team, with
  response times designed to safeguard mission-critical applications and
  maintain operational continuity.
@z

@x
- SLA-backed CVE mitigation: Docker aims to address Critical and High severity
  Common Vulnerabilities and Exposures (CVEs) within 7 working days of an
  upstream fix becoming available, with some exceptions. Faster than typical
  industry response times and backed by an enterprise-grade SLA, so your teams
  can rely on timely fixes to keep workloads secure.
@y
- SLA-backed CVE mitigation: Docker aims to address Critical and High severity
  Common Vulnerabilities and Exposures (CVEs) within 7 working days of an
  upstream fix becoming available, with some exceptions. Faster than typical
  industry response times and backed by an enterprise-grade SLA, so your teams
  can rely on timely fixes to keep workloads secure.
@z

@x
This level of support ensures that organizations can rely on DHI for their
mission-critical applications, with the assurance that security and stability
are maintained proactively.
@y
This level of support ensures that organizations can rely on DHI for their
mission-critical applications, with the assurance that security and stability
are maintained proactively.
@z

@x
### How Docker defines Critical and High severity vulnerabilities
@y
### How Docker defines Critical and High severity vulnerabilities
@z

@x
For consistent and accurate severity classification, Docker uses the same
severity and scoring principles as [Docker
Scout](../../scout/deep-dive/advisory-db-sources.md) when determining whether a
CVE is considered Critical or High.
@y
For consistent and accurate severity classification, Docker uses the same
severity and scoring principles as [Docker
Scout](../../scout/deep-dive/advisory-db-sources.md) when determining whether a
CVE is considered Critical or High.
@z

@x
#### Severity and scoring priority
@y
#### Severity and scoring priority
@z

@x
Docker Scout uses two main principles when determining severity and scoring for
CVEs:
@y
Docker Scout uses two main principles when determining severity and scoring for
CVEs:
@z

@x
   - Source priority
   - CVSS version preference
@y
   - Source priority
   - CVSS version preference
@z

@x
For source priority, Docker Scout follows this order:
@y
For source priority, Docker Scout follows this order:
@z

@x
  1. Vendor advisories: Scout always uses the severity and scoring data from the
     source that matches the package and version. For example, Debian data for
     Debian packages.
@y
  1. Vendor advisories: Scout always uses the severity and scoring data from the
     source that matches the package and version. For example, Debian data for
     Debian packages.
@z

@x
  2. NIST scoring data: If the vendor doesn't provide scoring data for a CVE,
     Scout falls back to NIST scoring data.
@y
  2. NIST scoring data: If the vendor doesn't provide scoring data for a CVE,
     Scout falls back to NIST scoring data.
@z

@x
For CVSS version preference, once Scout has selected a source, it prefers CVSS
v4 over v3 when both are available, as v4 is the more modern and precise scoring
model.
@y
For CVSS version preference, once Scout has selected a source, it prefers CVSS
v4 over v3 when both are available, as v4 is the more modern and precise scoring
model.
@z

@x
#### Vulnerability matching
@y
#### Vulnerability matching
@z

@x
Traditional tools often rely on broad [Common Product Enumeration
(CPE)](https://en.wikipedia.org/wiki/Common_Platform_Enumeration) matching,
which can lead to many false-positive results.
@y
Traditional tools often rely on broad [Common Product Enumeration
(CPE)](https://en.wikipedia.org/wiki/Common_Platform_Enumeration) matching,
which can lead to many false-positive results.
@z

@x
Docker Scout uses [Package URLs
(PURLs)](https://github.com/package-url/purl-spec) to match packages against
CVEs, which yields more precise identification of vulnerabilities. PURLs
significantly reduce the chances of false positives, focusing only on genuinely
affected packages.
@y
Docker Scout uses [Package URLs
(PURLs)](https://github.com/package-url/purl-spec) to match packages against
CVEs, which yields more precise identification of vulnerabilities. PURLs
significantly reduce the chances of false positives, focusing only on genuinely
affected packages.
@z
