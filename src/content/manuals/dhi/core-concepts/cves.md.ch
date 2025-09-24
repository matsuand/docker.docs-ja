%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Common Vulnerabilities and Exposures (CVEs)
linktitle: CVEs
description: Understand what CVEs are, how Docker Hardened Images reduce exposure, and how to scan images for vulnerabilities using popular tools.
keywords: docker cve scan, grype vulnerability scanner, trivy image scan, vex attestation, secure container images
@y
title: Common Vulnerabilities and Exposures (CVEs)
linktitle: CVEs
description: Understand what CVEs are, how Docker Hardened Images reduce exposure, and how to scan images for vulnerabilities using popular tools.
keywords: docker cve scan, grype vulnerability scanner, trivy image scan, vex attestation, secure container images
@z

@x
## What are CVEs?
@y
## What are CVEs?
@z

@x
CVEs are publicly disclosed cybersecurity flaws in software or hardware. Each
CVE is assigned a unique identifier (e.g., CVE-2024-12345) and includes a
standardized description, allowing organizations to track and address
vulnerabilities consistently.
@y
CVEs are publicly disclosed cybersecurity flaws in software or hardware. Each
CVE is assigned a unique identifier (e.g., CVE-2024-12345) and includes a
standardized description, allowing organizations to track and address
vulnerabilities consistently.
@z

@x
In the context of Docker, CVEs often pertain to issues within base images, or
application dependencies. These vulnerabilities can range from minor bugs to
critical security risks, such as remote code execution or privilege escalation.
@y
In the context of Docker, CVEs often pertain to issues within base images, or
application dependencies. These vulnerabilities can range from minor bugs to
critical security risks, such as remote code execution or privilege escalation.
@z

@x
## Why are CVEs important?
@y
## Why are CVEs important?
@z

@x
Regularly scanning and updating Docker images to mitigate CVEs is crucial for
maintaining a secure and compliant environment. Ignoring CVEs can lead to severe
security breaches, including:
@y
Regularly scanning and updating Docker images to mitigate CVEs is crucial for
maintaining a secure and compliant environment. Ignoring CVEs can lead to severe
security breaches, including:
@z

@x
- Unauthorized access: Exploits can grant attackers unauthorized access to
  systems.
- Data breaches: Sensitive information can be exposed or stolen.
- Service disruptions: Vulnerabilities can be leveraged to disrupt services or
  cause downtime.
- Compliance violations: Failure to address known vulnerabilities can lead to
  non-compliance with industry regulations and standards.
@y
- Unauthorized access: Exploits can grant attackers unauthorized access to
  systems.
- Data breaches: Sensitive information can be exposed or stolen.
- Service disruptions: Vulnerabilities can be leveraged to disrupt services or
  cause downtime.
- Compliance violations: Failure to address known vulnerabilities can lead to
  non-compliance with industry regulations and standards.
@z

@x
## How Docker Hardened Images help mitigate CVEs
@y
## How Docker Hardened Images help mitigate CVEs
@z

@x
Docker Hardened Images (DHIs) are crafted to minimize the risk of CVEs from the
outset. By adopting a security-first approach, DHIs offer several advantages in
CVE mitigation:
@y
Docker Hardened Images (DHIs) are crafted to minimize the risk of CVEs from the
outset. By adopting a security-first approach, DHIs offer several advantages in
CVE mitigation:
@z

@x
- Reduced attack surface: DHIs are built using a distroless approach, stripping
  away unnecessary components and packages. This reduction in image size, up to
  95% smaller than traditional images, limits the number of potential
  vulnerabilities, making it harder for attackers to exploit unneeded software.
@y
- Reduced attack surface: DHIs are built using a distroless approach, stripping
  away unnecessary components and packages. This reduction in image size, up to
  95% smaller than traditional images, limits the number of potential
  vulnerabilities, making it harder for attackers to exploit unneeded software.
@z

@x
- Faster CVE remediation: Maintained by Docker with an enterprise-grade SLA,
  DHIs are continuously updated to address known vulnerabilities. Critical and
  high-severity CVEs are patched quickly, ensuring that your containers remain
  secure without manual intervention.
@y
- Faster CVE remediation: Maintained by Docker with an enterprise-grade SLA,
  DHIs are continuously updated to address known vulnerabilities. Critical and
  high-severity CVEs are patched quickly, ensuring that your containers remain
  secure without manual intervention.
@z

@x
- Proactive vulnerability management: By utilizing DHIs, organizations can
  proactively manage vulnerabilities. The images come with CVE and Vulnerability
  Exposure (VEX) feeds, enabling teams to stay informed about potential threats
  and take necessary actions promptly.
@y
- Proactive vulnerability management: By utilizing DHIs, organizations can
  proactively manage vulnerabilities. The images come with CVE and Vulnerability
  Exposure (VEX) feeds, enabling teams to stay informed about potential threats
  and take necessary actions promptly.
@z

@x
## Scan images for CVEs
@y
## Scan images for CVEs
@z

@x
Regularly scanning Docker images for CVEs is essential for maintaining a secure
containerized environment. While Docker Scout is integrated into Docker Desktop
and the Docker CLI, tools like Grype and Trivy offer alternative scanning
capabilities. The following are instructions for using each tool to scan Docker
images for CVEs.
@y
Regularly scanning Docker images for CVEs is essential for maintaining a secure
containerized environment. While Docker Scout is integrated into Docker Desktop
and the Docker CLI, tools like Grype and Trivy offer alternative scanning
capabilities. The following are instructions for using each tool to scan Docker
images for CVEs.
@z

@x
### Docker Scout
@y
### Docker Scout
@z

@x
Docker Scout is integrated into Docker Desktop and the Docker CLI. It provides
vulnerability insights, CVE summaries, and direct links to remediation guidance.
@y
Docker Scout is integrated into Docker Desktop and the Docker CLI. It provides
vulnerability insights, CVE summaries, and direct links to remediation guidance.
@z

@x
#### Scan a DHI using Docker Scout
@y
#### Scan a DHI using Docker Scout
@z

@x
To scan a Docker Hardened Image using Docker Scout, run the following
command:
@y
To scan a Docker Hardened Image using Docker Scout, run the following
command:
@z

@x
```console
$ docker scout cves <your-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker scout cves <your-namespace>/dhi-<image>:<tag>
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
    v SBOM obtained from attestation, 101 packages found
    v Provenance obtained from attestation
    v VEX statements obtained from attestation
    v No vulnerable package detected
    ...
```
@y
```plaintext
    v SBOM obtained from attestation, 101 packages found
    v Provenance obtained from attestation
    v VEX statements obtained from attestation
    v No vulnerable package detected
    ...
```
@z

@x
For more detailed filtering and JSON output, see [Docker Scout CLI reference](../../../reference/cli/docker/scout/_index.md).
@y
For more detailed filtering and JSON output, see [Docker Scout CLI reference](../../../reference/cli/docker/scout/_index.md).
@z

@x
### Grype
@y
### Grype
@z

@x
[Grype](https://github.com/anchore/grype) is an open-source scanner that checks
container images against vulnerability databases like the NVD and distro
advisories.
@y
[Grype](https://github.com/anchore/grype) is an open-source scanner that checks
container images against vulnerability databases like the NVD and distro
advisories.
@z

@x
#### Scan a DHI using Grype
@y
#### Scan a DHI using Grype
@z

@x
After installing Grype, you can scan a Docker Hardened Image by pulling
the image and running the scan command:
@y
After installing Grype, you can scan a Docker Hardened Image by pulling
the image and running the scan command:
@z

@x
```console
$ docker pull <your-namespace>/dhi-<image>:<tag>
$ grype <your-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker pull <your-namespace>/dhi-<image>:<tag>
$ grype <your-namespace>/dhi-<image>:<tag>
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
NAME               INSTALLED              FIXED-IN     TYPE  VULNERABILITY     SEVERITY    EPSS%  RISK
libperl5.36        5.36.0-7+deb12u2       (won't fix)  deb   CVE-2023-31484    High        79.45    1.1
perl               5.36.0-7+deb12u2       (won't fix)  deb   CVE-2023-31484    High        79.45    1.1
perl-base          5.36.0-7+deb12u2       (won't fix)  deb   CVE-2023-31484    High        79.45    1.1
...
```
@y
```plaintext
NAME               INSTALLED              FIXED-IN     TYPE  VULNERABILITY     SEVERITY    EPSS%  RISK
libperl5.36        5.36.0-7+deb12u2       (won't fix)  deb   CVE-2023-31484    High        79.45    1.1
perl               5.36.0-7+deb12u2       (won't fix)  deb   CVE-2023-31484    High        79.45    1.1
perl-base          5.36.0-7+deb12u2       (won't fix)  deb   CVE-2023-31484    High        79.45    1.1
...
```
@z

@x
### Trivy
@y
### Trivy
@z

@x
[Trivy](https://github.com/aquasecurity/trivy) is an open-source vulnerability
scanner for containers and other artifacts. It detects vulnerabilities in OS
packages and application dependencies.
@y
[Trivy](https://github.com/aquasecurity/trivy) is an open-source vulnerability
scanner for containers and other artifacts. It detects vulnerabilities in OS
packages and application dependencies.
@z

@x
#### Scan a DHI using Trivy
@y
#### Scan a DHI using Trivy
@z

@x
After installing Trivy, you can scan a Docker Hardened Image by pulling
the image and running the scan command:
@y
After installing Trivy, you can scan a Docker Hardened Image by pulling
the image and running the scan command:
@z

@x
```console
$ docker pull <your-namespace>/dhi-<image>:<tag>
$ trivy image <your-namespace>/dhi-<image>:<tag>
```
@y
```console
$ docker pull <your-namespace>/dhi-<image>:<tag>
$ trivy image <your-namespace>/dhi-<image>:<tag>
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
Report Summary
@y
```plaintext
Report Summary
@z

@x
┌──────────────────────────────────────────────────────────────────────────────┬────────────┬─────────────────┬─────────┐
│                                    Target                                    │    Type    │ Vulnerabilities │ Secrets │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ <namespace>/dhi-<image>:<tag> (debian 12.11)                                 │   debian   │       66        │    -    │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ opt/python-3.13.4/lib/python3.13/site-packages/pip-25.1.1.dist-info/METADATA │ python-pkg │        0        │    -    │
└──────────────────────────────────────────────────────────────────────────────┴────────────┴─────────────────┴─────────┘
```
@y
┌──────────────────────────────────────────────────────────────────────────────┬────────────┬─────────────────┬─────────┐
│                                    Target                                    │    Type    │ Vulnerabilities │ Secrets │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ <namespace>/dhi-<image>:<tag> (debian 12.11)                                 │   debian   │       66        │    -    │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ opt/python-3.13.4/lib/python3.13/site-packages/pip-25.1.1.dist-info/METADATA │ python-pkg │        0        │    -    │
└──────────────────────────────────────────────────────────────────────────────┴────────────┴─────────────────┴─────────┘
```
@z

@x
## Use VEX to filter known non-exploitable CVEs
@y
## Use VEX to filter known non-exploitable CVEs
@z

@x
Docker Hardened Images include signed [VEX (Vulnerability Exploitability
eXchange)](./vex.md) attestations that identify vulnerabilities not relevant to the image’s
runtime behavior.
@y
Docker Hardened Images include signed [VEX (Vulnerability Exploitability
eXchange)](./vex.md) attestations that identify vulnerabilities not relevant to the image’s
runtime behavior.
@z

@x
When using Docker Scout, these VEX statements are automatically applied and no
manual configuration needed.
@y
When using Docker Scout, these VEX statements are automatically applied and no
manual configuration needed.
@z

@x
To manually retrieve the VEX attestation for tools that support it:
@y
To manually retrieve the VEX attestation for tools that support it:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://openvex.dev/ns/v0.2.0 \
  --predicate \
  <your-namespace>/dhi-<image>:<tag> --platform <platform> > vex.json
```
@y
```console
$ docker scout attest get \
  --predicate-type https://openvex.dev/ns/v0.2.0 \
  --predicate \
  <your-namespace>/dhi-<image>:<tag> --platform <platform> > vex.json
```
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker scout attest get \
  --predicate-type https://openvex.dev/ns/v0.2.0 \
  --predicate \
  docs/dhi-python:3.13 --platform linux/amd64 > vex.json
```
@y
```console
$ docker scout attest get \
  --predicate-type https://openvex.dev/ns/v0.2.0 \
  --predicate \
  docs/dhi-python:3.13 --platform linux/amd64 > vex.json
```
@z

@x
This creates a `vex.json` file containing the VEX statements for the specified
image. You can then use this file with tools that support VEX to filter out known non-exploitable CVEs.
@y
This creates a `vex.json` file containing the VEX statements for the specified
image. You can then use this file with tools that support VEX to filter out known non-exploitable CVEs.
@z

@x
For example, with Grype and Trivy, you can use the `--vex` flag to apply the VEX
statements during the scan:
@y
For example, with Grype and Trivy, you can use the `--vex` flag to apply the VEX
statements during the scan:
@z

@x
```console
$ grype <your-namespace>/dhi-<image>:<tag> --vex vex.json
```
@y
```console
$ grype <your-namespace>/dhi-<image>:<tag> --vex vex.json
```
@z
