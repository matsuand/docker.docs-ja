%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Scanner integrations
description: Learn which vulnerability scanners work with Docker Hardened Images and how to choose the right scanner for accurate vulnerability assessment.
keywords: scanner integration, vulnerability scanning, docker scout, trivy, grype, container security scanners
@y
title: Scanner integrations
description: Learn which vulnerability scanners work with Docker Hardened Images and how to choose the right scanner for accurate vulnerability assessment.
keywords: scanner integration, vulnerability scanning, docker scout, trivy, grype, container security scanners
@z

@x
Docker Hardened Images work with various vulnerability scanners. However, to get
accurate results that reflect the actual security posture of these images, your
scanner needs to understand the VEX (Vulnerability Exploitability eXchange)
attestations included with each image.
@y
Docker Hardened Images work with various vulnerability scanners. However, to get
accurate results that reflect the actual security posture of these images, your
scanner needs to understand the VEX (Vulnerability Exploitability eXchange)
attestations included with each image.
@z

@x
## Scanners with VEX support
@y
## Scanners with VEX support
@z

@x
The following scanners can read and apply VEX attestations included with Docker
Hardened Images to deliver more accurate vulnerability assessments:
@y
The following scanners can read and apply VEX attestations included with Docker
Hardened Images to deliver more accurate vulnerability assessments:
@z

@x
- [Docker Scout](/scout/): Automatically applies VEX statements with
  zero configuration. Integrated directly into Docker Desktop and the Docker CLI.
- [Trivy](https://trivy.dev/): Supports VEX through VEX Hub for automatic
  updates or local VEX files for air-gapped environments.
- [Grype](https://github.com/anchore/grype): Supports VEX via the `--vex`
  flag for local VEX file processing.
- [Wiz](https://www.wiz.io/): Automatically applies VEX statements with
  zero configuration.
@y
- [Docker Scout](__SUBDIR__/scout/): Automatically applies VEX statements with
  zero configuration. Integrated directly into Docker Desktop and the Docker CLI.
- [Trivy](https://trivy.dev/): Supports VEX through VEX Hub for automatic
  updates or local VEX files for air-gapped environments.
- [Grype](https://github.com/anchore/grype): Supports VEX via the `--vex`
  flag for local VEX file processing.
- [Wiz](https://www.wiz.io/): Automatically applies VEX statements with
  zero configuration.
@z

@x
For step-by-step instructions, see [Scan Docker Hardened Images](/manuals/dhi/how-to/scan.md).
@y
For step-by-step instructions, see [Scan Docker Hardened Images](manuals/dhi/how-to/scan.md).
@z

@x
## Choosing a scanner for Docker Hardened Images
@y
## Choosing a scanner for Docker Hardened Images
@z

@x
When selecting a scanner for use with Docker Hardened Images, whether it
supports open standards like OpenVEX is the key differentiator.
@y
When selecting a scanner for use with Docker Hardened Images, whether it
supports open standards like OpenVEX is the key differentiator.
@z

@x
Docker Hardened Images include signed VEX attestations that follow the
[OpenVEX standard](https://openvex.dev/). OpenVEX is an open standard that meets
the minimum requirements for VEX defined by CISA (Cybersecurity and
Infrastructure Security Agency), the U.S. government agency responsible for
cybersecurity guidance. These attestations document which vulnerabilities don't
apply to the image and why, helping you focus on real risks. To understand what
VEX is and how it works, see the [VEX core concept](/manuals/dhi/core-concepts/vex.md).
@y
Docker Hardened Images include signed VEX attestations that follow the
[OpenVEX standard](https://openvex.dev/). OpenVEX is an open standard that meets
the minimum requirements for VEX defined by CISA (Cybersecurity and
Infrastructure Security Agency), the U.S. government agency responsible for
cybersecurity guidance. These attestations document which vulnerabilities don't
apply to the image and why, helping you focus on real risks. To understand what
VEX is and how it works, see the [VEX core concept](manuals/dhi/core-concepts/vex.md).
@z

@x
Because OpenVEX is an open standard with government backing, it has strong
industry momentum and any tool can implement it without vendor-specific
integrations. This matters when you bring in third-party auditors with their own
scanning tools, or when you want to use multiple security tools in your
pipeline. With VEX, these tools can all read and verify the same vulnerability
data directly from your images.
@y
Because OpenVEX is an open standard with government backing, it has strong
industry momentum and any tool can implement it without vendor-specific
integrations. This matters when you bring in third-party auditors with their own
scanning tools, or when you want to use multiple security tools in your
pipeline. With VEX, these tools can all read and verify the same vulnerability
data directly from your images.
@z

@x
Without open standards like VEX, vendors make exploitability decisions using
proprietary methods, making it difficult to verify claims or compare results
across tools. This fragments your security toolchain and creates inconsistent
vulnerability assessments across different scanning tools.
@y
Without open standards like VEX, vendors make exploitability decisions using
proprietary methods, making it difficult to verify claims or compare results
across tools. This fragments your security toolchain and creates inconsistent
vulnerability assessments across different scanning tools.
@z

@x
### Benefits of scanners with VEX support
@y
### Benefits of scanners with VEX support
@z

@x
Scanners that support open standards like OpenVEX and can interpret VEX attestations
from Docker Hardened Images offer the following benefits:
@y
Scanners that support open standards like OpenVEX and can interpret VEX attestations
from Docker Hardened Images offer the following benefits:
@z

@x
- Accurate vulnerability counts: Automatically filter out vulnerabilities
  that don't apply to your specific image, often reducing false positives
  dramatically.
- Transparency and auditability: Verify exactly why vulnerabilities are or
  aren't flagged; security teams and compliance officers can review the reasoning
  rather than trusting a vendor's black box.
- Scanner flexibility: Switch between any VEX-enabled scanner (Docker Scout,
  Trivy, Grype, etc.) without losing vulnerability context or rebuilding
  exclusion lists.
- Consistent results: VEX-enabled scanners interpret the same data the
  same way, eliminating discrepancies between tools.
- Faster workflows: Focus on real risks rather than researching why reported
  CVEs don't actually affect your deployment.
@y
- Accurate vulnerability counts: Automatically filter out vulnerabilities
  that don't apply to your specific image, often reducing false positives
  dramatically.
- Transparency and auditability: Verify exactly why vulnerabilities are or
  aren't flagged; security teams and compliance officers can review the reasoning
  rather than trusting a vendor's black box.
- Scanner flexibility: Switch between any VEX-enabled scanner (Docker Scout,
  Trivy, Grype, etc.) without losing vulnerability context or rebuilding
  exclusion lists.
- Consistent results: VEX-enabled scanners interpret the same data the
  same way, eliminating discrepancies between tools.
- Faster workflows: Focus on real risks rather than researching why reported
  CVEs don't actually affect your deployment.
@z

@x
### Scanners without VEX support
@y
### Scanners without VEX support
@z

@x
Scanners that can't read VEX attestations will report vulnerabilities that don't
apply to Docker Hardened Images. This creates operational challenges:
@y
Scanners that can't read VEX attestations will report vulnerabilities that don't
apply to Docker Hardened Images. This creates operational challenges:
@z

@x
- Manual filtering required: You'll need to maintain scanner-specific ignore
  lists to replicate what VEX statements already document.
- Higher false positive rates: Expect to see more reported vulnerabilities
  that don't represent real risks.
- Increased investigation time: Security teams spend time researching why
  CVEs don't apply instead of addressing actual vulnerabilities. With Docker
  Hardened Images, security experts at Docker manage this investigation for
  you, thoroughly vetting each justification before adding it to a VEX statement.
- CI/CD friction: Build pipelines may fail on vulnerabilities that aren't
  exploitable in your images.
@y
- Manual filtering required: You'll need to maintain scanner-specific ignore
  lists to replicate what VEX statements already document.
- Higher false positive rates: Expect to see more reported vulnerabilities
  that don't represent real risks.
- Increased investigation time: Security teams spend time researching why
  CVEs don't apply instead of addressing actual vulnerabilities. With Docker
  Hardened Images, security experts at Docker manage this investigation for
  you, thoroughly vetting each justification before adding it to a VEX statement.
- CI/CD friction: Build pipelines may fail on vulnerabilities that aren't
  exploitable in your images.
@z

@x
### VEX-based vulnerability handling versus proprietary approaches
@y
### VEX-based vulnerability handling versus proprietary approaches
@z

@x
Docker Hardened Images use VEX attestations based on the OpenVEX open standard to document vulnerability exploitability. OpenVEX is an open standard that is recognized by government agencies such as CISA. This open standards approach differs from how some other image vendors handle vulnerabilities using proprietary methods.
@y
Docker Hardened Images use VEX attestations based on the OpenVEX open standard to document vulnerability exploitability. OpenVEX is an open standard that is recognized by government agencies such as CISA. This open standards approach differs from how some other image vendors handle vulnerabilities using proprietary methods.
@z

@x
#### Docker Hardened Images with VEX
@y
#### Docker Hardened Images with VEX
@z

@x
The image includes signed attestations that explain which vulnerabilities don't
apply and why. Any VEX-enabled scanner can read these attestations, giving you:
@y
The image includes signed attestations that explain which vulnerabilities don't
apply and why. Any VEX-enabled scanner can read these attestations, giving you:
@z

@x
- Tool flexibility: Use any scanner that supports OpenVEX (Docker Scout,
  Trivy, Grype, Wiz, etc.)
- Complete transparency: Review the exact reasoning for each vulnerability
  assessment
- Full auditability: Security teams and compliance officers can independently
  verify all vulnerability assessments and reasoning
- Historical visibility: VEX statements remain with the image, so you can
  always check vulnerability status, even for older versions
@y
- Tool flexibility: Use any scanner that supports OpenVEX (Docker Scout,
  Trivy, Grype, Wiz, etc.)
- Complete transparency: Review the exact reasoning for each vulnerability
  assessment
- Full auditability: Security teams and compliance officers can independently
  verify all vulnerability assessments and reasoning
- Historical visibility: VEX statements remain with the image, so you can
  always check vulnerability status, even for older versions
@z

@x
#### Proprietary vulnerability handling
@y
#### Proprietary vulnerability handling
@z

@x
Some image vendors use proprietary advisory feeds or internal databases instead
of VEX. While this may result in fewer reported vulnerabilities, it creates
significant limitations:
@y
Some image vendors use proprietary advisory feeds or internal databases instead
of VEX. While this may result in fewer reported vulnerabilities, it creates
significant limitations:
@z

@x
- Tool dependency: You must use the vendor's preferred scanning tools to see
  their vulnerability filtering, while standard scanners will still report all
  CVEs; scanners must implement proprietary feeds rather than using open
  standards that work with all images
- No transparency: Proprietary feeds act as "black boxes" - vulnerabilities
  simply disappear from vendor tools with no explanation
- Limited verifiability: Security teams have no way to independently verify
  why vulnerabilities are excluded or whether the reasoning is sound
- Maintenance challenges: If you scan older image versions with standard
  tools, you can't determine which vulnerabilities actually applied at that
  time, making long-term security tracking difficult
- Ecosystem incompatibility: Your existing security tools (SCA, policy
  engines, compliance scanners) can't access or verify the vendor's proprietary
  vulnerability data
@y
- Tool dependency: You must use the vendor's preferred scanning tools to see
  their vulnerability filtering, while standard scanners will still report all
  CVEs; scanners must implement proprietary feeds rather than using open
  standards that work with all images
- No transparency: Proprietary feeds act as "black boxes" - vulnerabilities
  simply disappear from vendor tools with no explanation
- Limited verifiability: Security teams have no way to independently verify
  why vulnerabilities are excluded or whether the reasoning is sound
- Maintenance challenges: If you scan older image versions with standard
  tools, you can't determine which vulnerabilities actually applied at that
  time, making long-term security tracking difficult
- Ecosystem incompatibility: Your existing security tools (SCA, policy
  engines, compliance scanners) can't access or verify the vendor's proprietary
  vulnerability data
@z

@x
The fundamental difference: VEX-based approaches explain vulnerability
assessments using open standards that any tool can verify and audit. Proprietary
approaches hide vulnerabilities in vendor-specific systems where the reasoning
can't be independently validated.
@y
The fundamental difference: VEX-based approaches explain vulnerability
assessments using open standards that any tool can verify and audit. Proprietary
approaches hide vulnerabilities in vendor-specific systems where the reasoning
can't be independently validated.
@z

@x
For Docker Hardened Images, use VEX-enabled scanners to get accurate results
that work across your entire security toolchain.
@y
For Docker Hardened Images, use VEX-enabled scanners to get accurate results
that work across your entire security toolchain.
@z

@x
## What to expect from different scanners
@y
## What to expect from different scanners
@z

@x
When scanning Docker Hardened Images with different tools, you'll see
significant differences in reported vulnerability counts.
@y
When scanning Docker Hardened Images with different tools, you'll see
significant differences in reported vulnerability counts.
@z

@x
### What VEX-enabled scanners filter automatically
@y
### What VEX-enabled scanners filter automatically
@z

@x
When you scan Docker Hardened Images with VEX-enabled scanners, they
automatically exclude vulnerabilities that don't apply:
@y
When you scan Docker Hardened Images with VEX-enabled scanners, they
automatically exclude vulnerabilities that don't apply:
@z

@x
- Hardware-specific vulnerabilities: Issues that only affect specific
  hardware architectures (for example, Power10 processors) that are irrelevant to
  containerized workloads.
- Unreachable code paths: CVEs in code that exists in the package but isn't
  executed in the image's runtime configuration.
- Build-time only issues: Vulnerabilities in build tools or dependencies
  that don't exist in the final runtime image.
- Temporary identifiers: Placeholder vulnerability IDs (like Debian's
  `TEMP-xxxxxxx`) that aren't intended for external tracking.
@y
- Hardware-specific vulnerabilities: Issues that only affect specific
  hardware architectures (for example, Power10 processors) that are irrelevant to
  containerized workloads.
- Unreachable code paths: CVEs in code that exists in the package but isn't
  executed in the image's runtime configuration.
- Build-time only issues: Vulnerabilities in build tools or dependencies
  that don't exist in the final runtime image.
- Temporary identifiers: Placeholder vulnerability IDs (like Debian's
  `TEMP-xxxxxxx`) that aren't intended for external tracking.
@z

@x
### Using scanners without VEX support
@y
### Using scanners without VEX support
@z

@x
If your scanner doesn't support VEX, you'll need to manually exclude
vulnerabilities through scanner-specific mechanisms like ignore lists or policy
exceptions. This requires:
@y
If your scanner doesn't support VEX, you'll need to manually exclude
vulnerabilities through scanner-specific mechanisms like ignore lists or policy
exceptions. This requires:
@z

@x
- Reviewing VEX statements from Docker Hardened Images
- Translating VEX justifications into your scanner's format
- Maintaining these exclusions as new vulnerabilities are discovered
- Repeating this process if you switch scanners or add additional scanning tools
@y
- Reviewing VEX statements from Docker Hardened Images
- Translating VEX justifications into your scanner's format
- Maintaining these exclusions as new vulnerabilities are discovered
- Repeating this process if you switch scanners or add additional scanning tools
@z

@x
## What's next
@y
## What's next
@z

@x
Learn how to [scan Docker Hardened Images](/manuals/dhi/how-to/scan.md) with
VEX-compliant scanners.
@y
Learn how to [scan Docker Hardened Images](manuals/dhi/how-to/scan.md) with
VEX-compliant scanners.
@z
