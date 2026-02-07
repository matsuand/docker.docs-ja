%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Scan Docker Hardened Images
linktitle: Scan an image
description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, Trivy, or Wiz.
keywords: scan container image, docker scout cves, grype scanner, trivy container scanner, vex attestation
@y
title: Scan Docker Hardened Images
linktitle: Scan an image
description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, Trivy, or Wiz.
keywords: scan container image, docker scout cves, grype scanner, trivy container scanner, vex attestation
@z

@x
Docker Hardened Images (DHIs) are designed to be secure by default, but like any
container image, it's important to scan them regularly as part of your
vulnerability management process.
@y
Docker Hardened Images (DHIs) are designed to be secure by default, but like any
container image, it's important to scan them regularly as part of your
vulnerability management process.
@z

@x
## Scan with OpenVEX-compliant scanners
@y
## Scan with OpenVEX-compliant scanners
@z

@x
To get accurate vulnerability assessments, use scanners that support
[VEX](/manuals/dhi/core-concepts/vex.md) attestations. The following scanners can
read and apply the VEX statements included with Docker Hardened Images:
@y
To get accurate vulnerability assessments, use scanners that support
[VEX](manuals/dhi/core-concepts/vex.md) attestations. The following scanners can
read and apply the VEX statements included with Docker Hardened Images:
@z

@x
- [Docker Scout](#docker-scout): Automatically applies VEX statements with zero configuration
- [Trivy](#trivy): Supports VEX through VEX Hub or local VEX files
- [Grype](#grype): Supports VEX via the `--vex` flag
- [Wiz](#wiz): Automatically applies VEX statements with
  zero configuration
@y
- [Docker Scout](#docker-scout): Automatically applies VEX statements with zero configuration
- [Trivy](#trivy): Supports VEX through VEX Hub or local VEX files
- [Grype](#grype): Supports VEX via the `--vex` flag
- [Wiz](#wiz): Automatically applies VEX statements with
  zero configuration
@z

@x
For guidance on choosing the right scanner and understanding the differences
between VEX-enabled and non-VEX scanners, see [Scanner
integrations](/manuals/dhi/explore/scanner-integrations.md).
@y
For guidance on choosing the right scanner and understanding the differences
between VEX-enabled and non-VEX scanners, see [Scanner
integrations](manuals/dhi/explore/scanner-integrations.md).
@z

@x
## Docker Scout
@y
## Docker Scout
@z

@x
Docker Scout is integrated into Docker Desktop and the Docker CLI. It provides
vulnerability insights, CVE summaries, and direct links to remediation guidance.
@y
Docker Scout is integrated into Docker Desktop and the Docker CLI. It provides
vulnerability insights, CVE summaries, and direct links to remediation guidance.
@z

@x
### Scan a DHI using Docker Scout
@y
### Scan a DHI using Docker Scout
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
### Automate DHI scanning in CI/CD with Docker Scout
@y
### Automate DHI scanning in CI/CD with Docker Scout
@z

@x
Integrating Docker Scout into your CI/CD pipeline enables you to automatically
verify that images built from Docker Hardened Images remain free from known
vulnerabilities during the build process. This proactive approach ensures the
continued security integrity of your images throughout the development
lifecycle.
@y
Integrating Docker Scout into your CI/CD pipeline enables you to automatically
verify that images built from Docker Hardened Images remain free from known
vulnerabilities during the build process. This proactive approach ensures the
continued security integrity of your images throughout the development
lifecycle.
@z

@x
#### Example GitHub Actions workflow
@y
#### Example GitHub Actions workflow
@z

@x
The following is a sample GitHub Actions workflow that builds an image and scans
it using Docker Scout:
@y
The following is a sample GitHub Actions workflow that builds an image and scans
it using Docker Scout:
@z

% snip code...

@x
The `exit-code: true` parameter ensures that the workflow fails if any critical or
high-severity vulnerabilities are detected, preventing the deployment of
insecure images.
@y
The `exit-code: true` parameter ensures that the workflow fails if any critical or
high-severity vulnerabilities are detected, preventing the deployment of
insecure images.
@z

@x
For more details on using Docker Scout in CI, see [Integrating Docker
Scout with other systems](/manuals/scout/integrations/_index.md).
@y
For more details on using Docker Scout in CI, see [Integrating Docker
Scout with other systems](manuals/scout/integrations/_index.md).
@z

@x
## Grype
@y
## Grype
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
### Scan a DHI using Grype
@y
### Scan a DHI using Grype
@z

@x
To scan a Docker Hardened Image using Grype with VEX filtering, first export
the VEX attestation and then scan with the `--vex` flag:
@y
To scan a Docker Hardened Image using Grype with VEX filtering, first export
the VEX attestation and then scan with the `--vex` flag:
@z

% snip command...

@x
The `--vex` flag applies VEX statements during the scan, filtering out known
non-exploitable CVEs for accurate results.
@y
The `--vex` flag applies VEX statements during the scan, filtering out known
non-exploitable CVEs for accurate results.
@z

@x
For more information on exporting VEX attestations, see [Export VEX
attestations](#export-vex-attestations).
@y
For more information on exporting VEX attestations, see [Export VEX
attestations](#export-vex-attestations).
@z

@x
## Trivy
@y
## Trivy
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
### Scan a DHI using Trivy
@y
### Scan a DHI using Trivy
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
To filter vulnerabilities using VEX statements, Trivy supports multiple
approaches. Docker recommends using VEX Hub, which provides a seamless workflow
for automatically downloading and applying VEX statements from configured
repositories.
@y
To filter vulnerabilities using VEX statements, Trivy supports multiple
approaches. Docker recommends using VEX Hub, which provides a seamless workflow
for automatically downloading and applying VEX statements from configured
repositories.
@z

@x
#### Using VEX Hub (recommended)
@y
#### Using VEX Hub (recommended)
@z

@x
Configure Trivy to download the Docker Hardened Images advisories repository
from VEX Hub. Run the following commands to set up the VEX repository:
@y
Configure Trivy to download the Docker Hardened Images advisories repository
from VEX Hub. Run the following commands to set up the VEX repository:
@z

% snip command...

@x
After setting up VEX Hub, you can scan a Docker Hardened Image with VEX filtering:
@y
After setting up VEX Hub, you can scan a Docker Hardened Image with VEX filtering:
@z

% snip command...

@x
For example, scanning the `dhi.io/python:3.13` image:
@y
For example, scanning the `dhi.io/python:3.13` image:
@z

% snip command...

@x
Example output:
@y
Example output:
@z

% snip output...

@x
The `--vex repo` flag applies VEX statements from the configured repository during the scan,
which filters out known non-exploitable CVEs.
@y
The `--vex repo` flag applies VEX statements from the configured repository during the scan,
which filters out known non-exploitable CVEs.
@z

@x
#### Using local VEX files
@y
#### Using local VEX files
@z

@x
In addition to VEX Hub, Trivy also supports the use of local VEX files for
vulnerability filtering. You can download the VEX attestation that Docker
Hardened Images provide and use it directly with Trivy.
@y
In addition to VEX Hub, Trivy also supports the use of local VEX files for
vulnerability filtering. You can download the VEX attestation that Docker
Hardened Images provide and use it directly with Trivy.
@z

@x
First, download the VEX attestation for your image:
@y
First, download the VEX attestation for your image:
@z

% snip command...

@x
Then scan the image with the local VEX file:
@y
Then scan the image with the local VEX file:
@z

% snip command...

@x
## Wiz
@y
## Wiz
@z

@x
[Wiz](https://www.wiz.io/) is a cloud security platform that includes container
image scanning capabilities with support for DHI VEX attestations. Wiz CLI
automatically consumes VEX statements from Docker Hardened Images to provide
accurate vulnerability assessments.
@y
[Wiz](https://www.wiz.io/) is a cloud security platform that includes container
image scanning capabilities with support for DHI VEX attestations. Wiz CLI
automatically consumes VEX statements from Docker Hardened Images to provide
accurate vulnerability assessments.
@z

@x
### Scan a DHI using Wiz CLI
@y
### Scan a DHI using Wiz CLI
@z

@x
After acquiring a Wiz subscription and installing the Wiz CLI, you can scan a
Docker Hardened Image by pulling the image and running the scan command:
@y
After acquiring a Wiz subscription and installing the Wiz CLI, you can scan a
Docker Hardened Image by pulling the image and running the scan command:
@z

% snip command...

@x
## Export VEX attestations
@y
## Export VEX attestations
@z

@x
For scanners that need local VEX files (like Grype or Trivy with local files),
you can export the VEX attestations from Docker Hardened Images.
@y
For scanners that need local VEX files (like Grype or Trivy with local files),
you can export the VEX attestations from Docker Hardened Images.
@z

@x
> [!NOTE]
>
> By default, VEX attestations are fetched from `registry.scout.docker.com`. Ensure that you can access this registry
> if your network has outbound restrictions. You can also mirror the attestations to an alternate registry. For more
> details, see [Mirror to a third-party registry](mirror.md#mirror-to-a-third-party-registry).
@y
> [!NOTE]
>
> By default, VEX attestations are fetched from `registry.scout.docker.com`. Ensure that you can access this registry
> if your network has outbound restrictions. You can also mirror the attestations to an alternate registry. For more
> details, see [Mirror to a third-party registry](mirror.md#mirror-to-a-third-party-registry).
@z

@x
Export VEX attestations to a JSON file:
@y
Export VEX attestations to a JSON file:
@z

% snip command...

@x
> [!NOTE]
>
> The `docker scout vex get` command requires [Docker Scout
> CLI](https://github.com/docker/scout-cli/) version 1.18.3 or later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@y
> [!NOTE]
>
> The `docker scout vex get` command requires [Docker Scout
> CLI](https://github.com/docker/scout-cli/) version 1.18.3 or later.
>
> If the image exists locally on your device, you must prefix the image name with `registry://`. For example, use
> `registry://docs/dhi-python:3.13` instead of `docs/dhi-python:3.13`.
@z
