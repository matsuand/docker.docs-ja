%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

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

% snip command...

@x
Example output:
@y
Example output:
@z

% snip output...

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
the image and running the scan command. Grype requires you to export the VEX
attestation to a file first:
@y
After installing Grype, you can scan a Docker Hardened Image by pulling
the image and running the scan command. Grype requires you to export the VEX
attestation to a file first:
@z

% snip command...

@x
Example output:
@y
Example output:
@z

% snip output...

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

% snip command...

@x
Example output:
@y
Example output:
@z

% snip output...

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
When using Docker Scout or Trivy, these VEX statements are automatically
applied using the previous examples, and no manual configuration needed.
@y
When using Docker Scout or Trivy, these VEX statements are automatically
applied using the previous examples, and no manual configuration needed.
@z

@x
To manually retrieve the VEX attestation for tools that support it:
@y
To manually retrieve the VEX attestation for tools that support it:
@z

% snip command...

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

% snip command...

@x
This creates a `vex.json` file containing the VEX statements for the specified
image. You can then use this file with tools that support VEX to filter out known non-exploitable CVEs.
@y
This creates a `vex.json` file containing the VEX statements for the specified
image. You can then use this file with tools that support VEX to filter out known non-exploitable CVEs.
@z
