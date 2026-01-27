%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Vulnerability Exploitability eXchange (VEX)
linktitle: VEX
description: Learn how VEX helps you prioritize real risks by identifying which vulnerabilities in Docker Hardened Images are actually exploitable.
keywords: vex container security, vulnerability exploitability, filter false positives, docker scout vex, cve prioritization
@y
title: Vulnerability Exploitability eXchange (VEX)
linktitle: VEX
description: Learn how VEX helps you prioritize real risks by identifying which vulnerabilities in Docker Hardened Images are actually exploitable.
keywords: vex container security, vulnerability exploitability, filter false positives, docker scout vex, cve prioritization
@z

@x
## What is VEX?
@y
## What is VEX?
@z

@x
Vulnerability Exploitability eXchange (VEX) is a specification for documenting
the exploitability status of vulnerabilities within software components. VEX is
primarily defined through industry standards such as CSAF (OASIS) and CycloneDX
VEX, with the U.S. Cybersecurity and Infrastructure Security Agency (CISA)
encouraging its adoption. VEX complements CVE (Common Vulnerabilities and
Exposures) identifiers by adding producer-asserted status information,
indicating whether a vulnerability is exploitable in the product as shipped.
This helps organizations prioritize remediation efforts by identifying
vulnerabilities that do not affect their specific product configurations.
@y
Vulnerability Exploitability eXchange (VEX) is a specification for documenting
the exploitability status of vulnerabilities within software components. VEX is
primarily defined through industry standards such as CSAF (OASIS) and CycloneDX
VEX, with the U.S. Cybersecurity and Infrastructure Security Agency (CISA)
encouraging its adoption. VEX complements CVE (Common Vulnerabilities and
Exposures) identifiers by adding producer-asserted status information,
indicating whether a vulnerability is exploitable in the product as shipped.
This helps organizations prioritize remediation efforts by identifying
vulnerabilities that do not affect their specific product configurations.
@z

@x
## Why is VEX important?
@y
## Why is VEX important?
@z

@x
VEX enhances traditional vulnerability management by:
@y
VEX enhances traditional vulnerability management by:
@z

@x
- Suppressing non-applicable vulnerabilities: By providing product-level
  exploitability assertions from the supplier, VEX helps filter out
  vulnerabilities that do not affect the product as shipped.
@y
- Suppressing non-applicable vulnerabilities: By providing product-level
  exploitability assertions from the supplier, VEX helps filter out
  vulnerabilities that do not affect the product as shipped.
@z

@x
- Prioritizing remediation: Organizations can focus resources on addressing
  vulnerabilities that the producer has confirmed are exploitable in the
  product, improving efficiency in vulnerability management.
@y
- Prioritizing remediation: Organizations can focus resources on addressing
  vulnerabilities that the producer has confirmed are exploitable in the
  product, improving efficiency in vulnerability management.
@z

@x
- Supporting vulnerability documentation: VEX statements can support audit
  discussions and help document why certain vulnerabilities do not require
  remediation.
@y
- Supporting vulnerability documentation: VEX statements can support audit
  discussions and help document why certain vulnerabilities do not require
  remediation.
@z

@x
This approach is particularly beneficial when working with complex software
components where not all reported CVEs apply to the specific product
configuration.
@y
This approach is particularly beneficial when working with complex software
components where not all reported CVEs apply to the specific product
configuration.
@z

@x
## How Docker Hardened Images integrate VEX
@y
## How Docker Hardened Images integrate VEX
@z

@x
To enhance vulnerability management, Docker Hardened Images (DHI) incorporate
VEX reports, providing context-specific assessments of known vulnerabilities.
@y
To enhance vulnerability management, Docker Hardened Images (DHI) incorporate
VEX reports, providing context-specific assessments of known vulnerabilities.
@z

@x
This integration allows you to:
@y
This integration allows you to:
@z

@x
- Consume producer assertions: Review Docker's assertions about whether known
  vulnerabilities in the image's components are exploitable in the product as
  shipped.
@y
- Consume producer assertions: Review Docker's assertions about whether known
  vulnerabilities in the image's components are exploitable in the product as
  shipped.
@z

@x
- Prioritize actions: Focus remediation efforts on vulnerabilities that Docker
  has confirmed are exploitable in the image, optimizing resource allocation.
@y
- Prioritize actions: Focus remediation efforts on vulnerabilities that Docker
  has confirmed are exploitable in the image, optimizing resource allocation.
@z

@x
- Support audit documentation: Use VEX statements to document why certain
  reported vulnerabilities do not require immediate action.
@y
- Support audit documentation: Use VEX statements to document why certain
  reported vulnerabilities do not require immediate action.
@z

@x
By combining the security features of DHI with VEX's product-level
exploitability assertions, organizations can achieve a more effective and
efficient approach to vulnerability management.
@y
By combining the security features of DHI with VEX's product-level
exploitability assertions, organizations can achieve a more effective and
efficient approach to vulnerability management.
@z

@x
> [!TIP]
>
> To understand which scanners support VEX and why it matters for your security
> workflow, see [Scanner integrations](/manuals/dhi/explore/scanner-integrations.md).
@y
> [!TIP]
>
> To understand which scanners support VEX and why it matters for your security
> workflow, see [Scanner integrations](manuals/dhi/explore/scanner-integrations.md).
@z

@x
## Use VEX to suppress non-applicable CVEs
@y
## Use VEX to suppress non-applicable CVEs
@z

@x
Docker Hardened Images include VEX attestations that can be consumed by
vulnerability scanners to suppress non-applicable CVEs. For detailed
instructions on scanning with VEX support across different tools including
Docker Scout, Trivy, and Grype, see [Scan Docker Hardened
Images](/manuals/dhi/how-to/scan.md).
@y
Docker Hardened Images include VEX attestations that can be consumed by
vulnerability scanners to suppress non-applicable CVEs. For detailed
instructions on scanning with VEX support across different tools including
Docker Scout, Trivy, and Grype, see [Scan Docker Hardened
Images](manuals/dhi/how-to/scan.md).
@z
