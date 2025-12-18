%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Scan Docker Hardened Images
linktitle: Scan an image
description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, or Trivy.
keywords: scan container image, docker scout cves, grype scanner, trivy container scanner, vex attestation
@y
title: Scan Docker Hardened Images
linktitle: Scan an image
description: Learn how to scan Docker Hardened Images for known vulnerabilities using Docker Scout, Grype, or Trivy.
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
You can scan DHIs using the same tools you already use for standard images, such
as Docker Scout, Grype, and Trivy. DHIs follow the same formats and standards
for compatibility across your security tooling. Before you scan an image, the image must
be mirrored into your organization on Docker Hub.
@y
You can scan DHIs using the same tools you already use for standard images, such
as Docker Scout, Grype, and Trivy. DHIs follow the same formats and standards
for compatibility across your security tooling. Before you scan an image, the image must
be mirrored into your organization on Docker Hub.
@z

@x
> [!NOTE]
>
> When you have a Docker Hardened Images Enterprise subscription, [Docker
> Scout](/manuals/scout/_index.md) is automatically enabled at no additional
> cost for all mirrored Docker Hardened Image repositories on Docker Hub. You
> can view scan results directly in the Docker Hub UI under your organization's
> repository.
@y
> [!NOTE]
>
> When you have a Docker Hardened Images Enterprise subscription, [Docker
> Scout](manuals/scout/_index.md) is automatically enabled at no additional
> cost for all mirrored Docker Hardened Image repositories on Docker Hub. You
> can view scan results directly in the Docker Hub UI under your organization's
> repository.
@z

@x
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Image registry (`dhi.io`) to pull images. To
> do this, you can use [`docker login`](../../../reference/cli/docker/login.md):
>
> ```console
> $ docker login dhi.io
> ```
@y
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Image registry (`dhi.io`) to pull images. To
> do this, you can use [`docker login`](../../../reference/cli/docker/login.md):
>
> ```console
> $ docker login dhi.io
> ```
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

@x
```console
$ docker scout cves dhi.io/<image>:<tag> --platform <platform>
```
@y
```console
$ docker scout cves dhi.io/<image>:<tag> --platform <platform>
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

@x
```yaml {collapse="true"}
name: DHI Vulnerability Scan
@y
```yaml {collapse="true"}
name: DHI Vulnerability Scan
@z

@x
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ "**" ]
@y
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ "**" ]
@z

@x
env:
  REGISTRY: docker.io
  IMAGE_NAME: ${{ github.repository }}
  SHA: ${{ github.event.pull_request.head.sha || github.event.after }}
@y
env:
  REGISTRY: docker.io
  IMAGE_NAME: ${{ github.repository }}
  SHA: ${{ github.event.pull_request.head.sha || github.event.after }}
@z

@x
jobs:
  scan:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
      pull-requests: write
@y
jobs:
  scan:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
      pull-requests: write
@z

@x
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
@y
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
@y
      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
@z

@x
      - name: Build Docker image
        run: |
          docker build -t ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ env.SHA }} .
@y
      - name: Build Docker image
        run: |
          docker build -t ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ env.SHA }} .
@z

@x
      - name: Run Docker Scout CVE scan
        uses: docker/scout-action@v1
        with:
          command: cves
          image: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ env.SHA }}
          only-severities: critical,high
          exit-code: true
```
@y
      - name: Run Docker Scout CVE scan
        uses: docker/scout-action@v1
        with:
          command: cves
          image: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ env.SHA }}
          only-severities: critical,high
          exit-code: true
```
@z

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
### Comparing Docker Scout results with other scanners
@y
### Comparing Docker Scout results with other scanners
@z

@x
Some vulnerabilities reported by other scanners may not appear in Docker Scout results. This can happen for several
reasons:
@y
Some vulnerabilities reported by other scanners may not appear in Docker Scout results. This can happen for several
reasons:
@z

@x
- Hardware-specific vulnerabilities: Certain vulnerabilities may only affect specific hardware architectures (for
  example, Power10 processors) that are not relevant to Docker images, so they are not reported by Docker Scout.
- VEX statement filtering: Docker Scout automatically applies VEX statements to document and suppress vulnerabilities
  that do not apply to the image. If your scanner does not consume VEX statements, you may see more vulnerabilities
  reported than what appears in Docker Scout results.
- Temporary vulnerability identifiers: Temporary vulnerability identifiers (like `TEMP-xxxxxxx` from Debian) are not
  surfaced by Docker Scout, as they are not intended for external reference.
@y
- Hardware-specific vulnerabilities: Certain vulnerabilities may only affect specific hardware architectures (for
  example, Power10 processors) that are not relevant to Docker images, so they are not reported by Docker Scout.
- VEX statement filtering: Docker Scout automatically applies VEX statements to document and suppress vulnerabilities
  that do not apply to the image. If your scanner does not consume VEX statements, you may see more vulnerabilities
  reported than what appears in Docker Scout results.
- Temporary vulnerability identifiers: Temporary vulnerability identifiers (like `TEMP-xxxxxxx` from Debian) are not
  surfaced by Docker Scout, as they are not intended for external reference.
@z

@x
While Docker Scout handles this filtering automatically, you can manually configure similar filtering with other
scanners using [Grype ignore rules](https://github.com/anchore/grype#specifying-matches-to-ignore) in its configuration
file (`~/.grype.yaml`) or [Trivy policy exceptions](https://trivy.dev/v0.19.2/misconfiguration/policy/exceptions/) using
REGO rules to filter out specific vulnerabilities by CVE ID, package name, fix state, or other criteria. You can also
use VEX statements with other scanners as described in [Use VEX to filter known non-exploitable
CVEs](#use-vex-to-filter-known-non-exploitable-cves).
@y
While Docker Scout handles this filtering automatically, you can manually configure similar filtering with other
scanners using [Grype ignore rules](https://github.com/anchore/grype#specifying-matches-to-ignore) in its configuration
file (`~/.grype.yaml`) or [Trivy policy exceptions](https://trivy.dev/v0.19.2/misconfiguration/policy/exceptions/) using
REGO rules to filter out specific vulnerabilities by CVE ID, package name, fix state, or other criteria. You can also
use VEX statements with other scanners as described in [Use VEX to filter known non-exploitable
CVEs](#use-vex-to-filter-known-non-exploitable-cves).
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
After installing Grype, you can scan a Docker Hardened Image by pulling
the image and running the scan command:
@y
After installing Grype, you can scan a Docker Hardened Image by pulling
the image and running the scan command:
@z

@x
```console
$ docker pull dhi.io/<image>:<tag>
$ grype dhi.io/<image>:<tag>
```
@y
```console
$ docker pull dhi.io/<image>:<tag>
$ grype dhi.io/<image>:<tag>
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
You should include the `--vex` flag to apply VEX statements during the scan,
which filter out known non-exploitable CVEs. For more information, see the [VEX
section](#use-vex-to-filter-known-non-exploitable-cves).
@y
You should include the `--vex` flag to apply VEX statements during the scan,
which filter out known non-exploitable CVEs. For more information, see the [VEX
section](#use-vex-to-filter-known-non-exploitable-cves).
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

@x
```console
$ docker pull dhi.io/<image>:<tag>
$ trivy image --scanners vuln --vex repo dhi.io/<image>:<tag>
```
@y
```console
$ docker pull dhi.io/<image>:<tag>
$ trivy image --scanners vuln --vex repo dhi.io/<image>:<tag>
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
│ dhi.io/<image>:<tag> (debian 12.11)                                          │   debian   │       66        │    -    │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ opt/python-3.13.4/lib/python3.13/site-packages/pip-25.1.1.dist-info/METADATA │ python-pkg │        0        │    -    │
└──────────────────────────────────────────────────────────────────────────────┴────────────┴─────────────────┴─────────┘
```
@y
┌──────────────────────────────────────────────────────────────────────────────┬────────────┬─────────────────┬─────────┐
│                                    Target                                    │    Type    │ Vulnerabilities │ Secrets │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ dhi.io/<image>:<tag> (debian 12.11)                                          │   debian   │       66        │    -    │
├──────────────────────────────────────────────────────────────────────────────┼────────────┼─────────────────┼─────────┤
│ opt/python-3.13.4/lib/python3.13/site-packages/pip-25.1.1.dist-info/METADATA │ python-pkg │        0        │    -    │
└──────────────────────────────────────────────────────────────────────────────┴────────────┴─────────────────┴─────────┘
```
@z

@x
You should include the `--vex` flag to apply VEX statements during the scan,
which filter out known non-exploitable CVEs.
@y
You should include the `--vex` flag to apply VEX statements during the scan,
which filter out known non-exploitable CVEs.
@z

@x
## Use VEX to filter known non-exploitable CVEs
@y
## Use VEX to filter known non-exploitable CVEs
@z

@x
Docker Hardened Images include signed VEX (Vulnerability Exploitability
eXchange) attestations that identify vulnerabilities not relevant to the image’s
runtime behavior.
@y
Docker Hardened Images include signed VEX (Vulnerability Exploitability
eXchange) attestations that identify vulnerabilities not relevant to the image’s
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
To manually create a JSON file of VEX attestations for tools that support it:
@y
To manually create a JSON file of VEX attestations for tools that support it:
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

@x
For example, with Grype you can use the `--vex` flag to apply the VEX
statements during the scan:
@y
For example, with Grype you can use the `--vex` flag to apply the VEX
statements during the scan:
@z

@x
```console
$ grype dhi.io/python:3.13 --vex vex.json
```
@y
```console
$ grype dhi.io/python:3.13 --vex vex.json
```
@z
