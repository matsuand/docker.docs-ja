%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
Vulnerability Exploitability eXchange (VEX) is a standardized framework
developed by the U.S. Cybersecurity and Infrastructure Security Agency (CISA) to
document the exploitability of vulnerabilities within software components.
Unlike traditional CVE (Common Vulnerabilities and Exposures) databases, VEX
provides contextual assessments, indicating whether a vulnerability is
exploitable in a given environment. This approach helps organizations prioritize
remediation efforts by distinguishing between vulnerabilities that are
exploitable and those that are not relevant to their specific use cases.
@y
Vulnerability Exploitability eXchange (VEX) is a standardized framework
developed by the U.S. Cybersecurity and Infrastructure Security Agency (CISA) to
document the exploitability of vulnerabilities within software components.
Unlike traditional CVE (Common Vulnerabilities and Exposures) databases, VEX
provides contextual assessments, indicating whether a vulnerability is
exploitable in a given environment. This approach helps organizations prioritize
remediation efforts by distinguishing between vulnerabilities that are
exploitable and those that are not relevant to their specific use cases.
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
- Reducing false positives: By providing context-specific assessments, VEX helps
  in filtering out vulnerabilities that do not pose a threat in a particular
  environment.
@y
- Reducing false positives: By providing context-specific assessments, VEX helps
  in filtering out vulnerabilities that do not pose a threat in a particular
  environment.
@z

@x
- Prioritizing remediation: Organizations can focus resources on addressing
  vulnerabilities that are exploitable in their specific context, improving
  efficiency in vulnerability management.
@y
- Prioritizing remediation: Organizations can focus resources on addressing
  vulnerabilities that are exploitable in their specific context, improving
  efficiency in vulnerability management.
@z

@x
- Enhancing compliance: VEX reports provide detailed information that can assist
  in meeting regulatory requirements and internal security standards.
@y
- Enhancing compliance: VEX reports provide detailed information that can assist
  in meeting regulatory requirements and internal security standards.
@z

@x
This approach is particularly beneficial in complex environments where numerous
components and configurations exist, and traditional CVE-based assessments may
lead to unnecessary remediation efforts.
@y
This approach is particularly beneficial in complex environments where numerous
components and configurations exist, and traditional CVE-based assessments may
lead to unnecessary remediation efforts.
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
- Assess exploitability: Determine whether known vulnerabilities in the image's
components are exploitable in their specific environment.
@y
- Assess exploitability: Determine whether known vulnerabilities in the image's
components are exploitable in their specific environment.
@z

@x
- Prioritize actions: Focus remediation efforts on vulnerabilities that pose
  actual risks, optimizing resource allocation.
@y
- Prioritize actions: Focus remediation efforts on vulnerabilities that pose
  actual risks, optimizing resource allocation.
@z

@x
- Streamline audits: Utilize the detailed information provided by VEX reports to
  simplify compliance audits and reporting.
@y
- Streamline audits: Utilize the detailed information provided by VEX reports to
  simplify compliance audits and reporting.
@z

@x
By combining the security features of DHI with the contextual insights of VEX,
organizations can achieve a more effective and efficient approach to
vulnerability management.
@y
By combining the security features of DHI with the contextual insights of VEX,
organizations can achieve a more effective and efficient approach to
vulnerability management.
@z

@x
## Use VEX to filter known non-exploitable CVEs
@y
## Use VEX to filter known non-exploitable CVEs
@z

@x
When using Docker Scout or Trivy, VEX statements are automatically applied as
shown in the examples in [Common Vulnerabilities and Exposures (CVEs)](./cves.md).
@y
When using Docker Scout or Trivy, VEX statements are automatically applied as
shown in the examples in [Common Vulnerabilities and Exposures (CVEs)](./cves.md).
@z

@x
For Grype, you need to export the VEX attestation to a file first before
scanning, as shown in the [Grype scanning example](./cves.md#scan-a-dhi-using-grype).
@y
For Grype, you need to export the VEX attestation to a file first before
scanning, as shown in the [Grype scanning example](./cves.md#scan-a-dhi-using-grype).
@z

@x
> [!NOTE]
>
> By default, VEX attestations are fetched from `registry.scout.docker.com`. Ensure that you can access this registry if
> your network has outbound restrictions. You can also mirror the attestations to an alternate registry. For more
> details, see [Mirror a Docker Hardened Image
> repository](../how-to/mirror.md#mirror-from-docker-hub-to-another-registry).
@y
> [!NOTE]
>
> By default, VEX attestations are fetched from `registry.scout.docker.com`. Ensure that you can access this registry if
> your network has outbound restrictions. You can also mirror the attestations to an alternate registry. For more
> details, see [Mirror a Docker Hardened Image
> repository](../how-to/mirror.md#mirror-from-docker-hub-to-another-registry).
@z

@x
To manually retrieve the VEX attestation for tools that support it:
@y
To manually retrieve the VEX attestation for tools that support it:
@z

@x
```console
$ docker scout vex get dhi.io/<image>:<tag> --output vex.json
```
@y
```console
$ docker scout vex get dhi.io/<image>:<tag> --output vex.json
```
@z

@x
> [!NOTE]
>
> The `docker scout vex get` command requires [Docker Scout
> CLI](https://github.com/docker/scout-cli/) version 1.18.3 or later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@y
> [!NOTE]
>
> The `docker scout vex get` command requires [Docker Scout
> CLI](https://github.com/docker/scout-cli/) version 1.18.3 or later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://dhi.io/python:3.13` instead of `dhi.io/python:3.13`.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker scout vex get dhi.io/python:3.13 --output vex.json
```
@y
```console
$ docker scout vex get dhi.io/python:3.13 --output vex.json
```
@z

@x
This creates a `vex.json` file containing the VEX statements for the specified
image. You can then use this file with tools that support VEX to filter out
known non-exploitable CVEs.
@y
This creates a `vex.json` file containing the VEX statements for the specified
image. You can then use this file with tools that support VEX to filter out
known non-exploitable CVEs.
@z
