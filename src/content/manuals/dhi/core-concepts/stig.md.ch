%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: STIG
description: Learn how Docker Hardened Images provide STIG-hardened container images with verifiable security scan attestations for government and enterprise compliance requirements.
keywords: docker stig, stig-hardened images, stig guidance, openscap docker, secure container images
@y
title: STIG
description: Learn how Docker Hardened Images provide STIG-hardened container images with verifiable security scan attestations for government and enterprise compliance requirements.
keywords: docker stig, stig-hardened images, stig guidance, openscap docker, secure container images
@z

@x
## What is STIG?
@y
## What is STIG?
@z

@x
[Security Technical Implementation Guides
(STIGs)](https://public.cyber.mil/stigs/) are configuration standards published
by the U.S. Defense Information Systems Agency (DISA). They define security
requirements for operating systems, applications, databases, and other
technologies used in U.S. Department of Defense (DoD) environments.
@y
[Security Technical Implementation Guides
(STIGs)](https://public.cyber.mil/stigs/) are configuration standards published
by the U.S. Defense Information Systems Agency (DISA). They define security
requirements for operating systems, applications, databases, and other
technologies used in U.S. Department of Defense (DoD) environments.
@z

@x
STIGs help ensure that systems are configured securely and consistently to
reduce vulnerabilities. They are often based on broader requirements like the
DoD's General Purpose Operating System Security Requirements Guide (GPOS SRG).
@y
STIGs help ensure that systems are configured securely and consistently to
reduce vulnerabilities. They are often based on broader requirements like the
DoD's General Purpose Operating System Security Requirements Guide (GPOS SRG).
@z

@x
## Why STIG guidance matters
@y
## Why STIG guidance matters
@z

@x
Following STIG guidance is critical for organizations that work with or support
U.S. government systems. It demonstrates alignment with DoD security standards
and helps:
@y
Following STIG guidance is critical for organizations that work with or support
U.S. government systems. It demonstrates alignment with DoD security standards
and helps:
@z

@x
- Accelerate Authority to Operate (ATO) processes for DoD systems
- Reduce the risk of misconfiguration and exploitable weaknesses
- Simplify audits and reporting through standardized baselines
@y
- Accelerate Authority to Operate (ATO) processes for DoD systems
- Reduce the risk of misconfiguration and exploitable weaknesses
- Simplify audits and reporting through standardized baselines
@z

@x
Even outside of federal environments, STIGs are used by security-conscious
organizations as a benchmark for hardened system configurations.
@y
Even outside of federal environments, STIGs are used by security-conscious
organizations as a benchmark for hardened system configurations.
@z

@x
STIGs are derived from broader NIST guidance, particularly [NIST Special
Publication 800-53](https://csrc.nist.gov/publications/sp800), which defines a
catalog of security and privacy controls for federal systems. Organizations
pursuing compliance with 800-53 or related frameworks (such as FedRAMP) can use
STIGs as implementation guides that help meet applicable control requirements.
@y
STIGs are derived from broader NIST guidance, particularly [NIST Special
Publication 800-53](https://csrc.nist.gov/publications/sp800), which defines a
catalog of security and privacy controls for federal systems. Organizations
pursuing compliance with 800-53 or related frameworks (such as FedRAMP) can use
STIGs as implementation guides that help meet applicable control requirements.
@z

@x
## How Docker Hardened Images help apply STIG guidance
@y
## How Docker Hardened Images help apply STIG guidance
@z

@x
Docker Hardened Images (DHIs) include STIG variants that are scanned against
custom STIG-based profiles and include signed STIG scan attestations. These
attestations can support audits and compliance reporting.
@y
Docker Hardened Images (DHIs) include STIG variants that are scanned against
custom STIG-based profiles and include signed STIG scan attestations. These
attestations can support audits and compliance reporting.
@z

@x
Docker creates custom STIG-based profiles for images based on the GPOS SRG and
DoD Container Hardening Process Guide. Because DISA has not published a STIG
specifically for containers, these profiles help apply STIG-like guidance to
container environments in a consistent, reviewable way and are designed to
reduce false positives common in container images.
@y
Docker creates custom STIG-based profiles for images based on the GPOS SRG and
DoD Container Hardening Process Guide. Because DISA has not published a STIG
specifically for containers, these profiles help apply STIG-like guidance to
container environments in a consistent, reviewable way and are designed to
reduce false positives common in container images.
@z

@x
## Identify images that include STIG scan results
@y
## Identify images that include STIG scan results
@z

@x
Docker Hardened Images that include STIG scan results are labeled as **STIG** in
the Docker Hardened Images catalog.
@y
Docker Hardened Images that include STIG scan results are labeled as **STIG** in
the Docker Hardened Images catalog.
@z

@x
To find DHI repositories with STIG image variants, [explore
images](../how-to/explore.md) and:
@y
To find DHI repositories with STIG image variants, [explore
images](../how-to/explore.md) and:
@z

@x
- Use the **STIG** filter on the catalog page
- Look for **STIG** labels on individual image listings
@y
- Use the **STIG** filter on the catalog page
- Look for **STIG** labels on individual image listings
@z

@x
To find a STIG image variant within a repository, go to the **Tags** tab in the
repository, and find images labeled with **STIG** in the **Compliance** column.
@y
To find a STIG image variant within a repository, go to the **Tags** tab in the
repository, and find images labeled with **STIG** in the **Compliance** column.
@z

@x
## View and verify STIG scan results
@y
## View and verify STIG scan results
@z

@x
Docker provides a signed [STIG scan
attestation](../core-concepts/attestations.md) for each STIG-hardened image.
These attestations include:
@y
Docker provides a signed [STIG scan
attestation](../core-concepts/attestations.md) for each STIG-hardened image.
These attestations include:
@z

@x
- A summary of the scan results, including the number of passed, failed, and not
  applicable checks
- The name and version of the STIG profile used
- Full output in both HTML and XCCDF (XML) formats
@y
- A summary of the scan results, including the number of passed, failed, and not
  applicable checks
- The name and version of the STIG profile used
- Full output in both HTML and XCCDF (XML) formats
@z

@x
### View STIG scan attestations
@y
### View STIG scan attestations
@z

@x
You can retrieve and inspect a STIG scan attestation using the Docker Scout CLI:
@y
You can retrieve and inspect a STIG scan attestation using the Docker Scout CLI:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  <your-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker scout attest get \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  <your-namespace>/dhi-<image>:<tag>
```
@z

@x
### Extract HTML report
@y
### Extract HTML report
@z

@x
To extract and view the human-readable HTML report:
@y
To extract and view the human-readable HTML report:
@z

@x
```console
$ docker scout attest get <your-namespace>/dhi-<image>:<tag> \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  | jq -r '.[0].output[] | select(.format == "html").content | @base64d' > stig_report.html
```
@y
```console
$ docker scout attest get <your-namespace>/dhi-<image>:<tag> \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  | jq -r '.[0].output[] | select(.format == "html").content | @base64d' > stig_report.html
```
@z

@x
### Extract XCCDF report
@y
### Extract XCCDF report
@z

@x
To extract the XML (XCCDF) report for integration with other tools:
@y
To extract the XML (XCCDF) report for integration with other tools:
@z

@x
```console
$ docker scout attest get <your-namespace>/dhi-<image>:<tag> \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  | jq -r '.[0].output[] | select(.format == "xccdf").content | @base64d' > stig_report.xml
```
@y
```console
$ docker scout attest get <your-namespace>/dhi-<image>:<tag> \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  | jq -r '.[0].output[] | select(.format == "xccdf").content | @base64d' > stig_report.xml
```
@z

@x
### View STIG scan summary
@y
### View STIG scan summary
@z

@x
To view just the scan summary without the full reports:
@y
To view just the scan summary without the full reports:
@z

@x
```console
$ docker scout attest get <your-namespace>/dhi-<image>:<tag> \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  | jq -r '.[0] | del(.output)'
```
@y
```console
$ docker scout attest get <your-namespace>/dhi-<image>:<tag> \
  --predicate-type https://docker.com/dhi/stig/v0.1 \
  --verify \
  --predicate \
  | jq -r '.[0] | del(.output)'
```
@z
