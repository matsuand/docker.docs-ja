%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Scout image analysis
description:
  Docker Scout image analysis provides a detailed view into the composition of
  your images and the vulnerabilities that they contain
keywords: scanning, vulnerabilities, supply chain, security, analysis
aliases:
  - /scout/advanced-image-analysis/
---
@y
---
title: Docker Scout image analysis
description:
  Docker Scout image analysis provides a detailed view into the composition of
  your images and the vulnerabilities that they contain
keywords: scanning, vulnerabilities, supply chain, security, analysis
aliases:
  - /scout/advanced-image-analysis/
---
@z

@x
When you activate image analysis for a repository,
Docker Scout automatically analyzes new images that you push to that repository.
@y
When you activate image analysis for a repository,
Docker Scout automatically analyzes new images that you push to that repository.
@z

@x
Image analysis extracts the Software Bill of Material (SBOM)
and other image metadata,and evaluates it against vulnerability data from
[security advisories](./advisory-db-sources.md).
@y
Image analysis extracts the Software Bill of Material (SBOM)
and other image metadata,and evaluates it against vulnerability data from
[security advisories](./advisory-db-sources.md).
@z

@x
If you run image analysis as a one-off task using the CLI or Docker Desktop,
Docker Scout won't store any data about your image.
If you enable Docker Scout for your container image repositories however,
Docker Scout saves a metadata snapshot of your images after the analysis.
As new vulnerability data becomes available, Docker Scout recalibrates the analysis using the metadata snapshot,
which means your security status for images is updated in real-time.
This dynamic evaluation means there's no need to re-analyze images when new CVE information is disclosed.
@y
If you run image analysis as a one-off task using the CLI or Docker Desktop,
Docker Scout won't store any data about your image.
If you enable Docker Scout for your container image repositories however,
Docker Scout saves a metadata snapshot of your images after the analysis.
As new vulnerability data becomes available, Docker Scout recalibrates the analysis using the metadata snapshot,
which means your security status for images is updated in real-time.
This dynamic evaluation means there's no need to re-analyze images when new CVE information is disclosed.
@z

@x
Docker Scout image analysis is available by default for Docker Hub repositories.
You can also integrate third-party registries and other services. To learn more,
see [Integrating Docker Scout with other systems](./integrations/_index.md).
@y
Docker Scout image analysis is available by default for Docker Hub repositories.
You can also integrate third-party registries and other services. To learn more,
see [Integrating Docker Scout with other systems](./integrations/_index.md).
@z

@x
## Activate Docker Scout on a repository
@y
## Activate Docker Scout on a repository
@z

@x
The free tier of Docker Scout lets you use Docker Scout for up to 3
repositories per Docker organization. You can update your Docker Scout plan if
you need additional repositories, see [Docker Scout
billing](../billing/scout-billing.md).
@y
The free tier of Docker Scout lets you use Docker Scout for up to 3
repositories per Docker organization. You can update your Docker Scout plan if
you need additional repositories, see [Docker Scout
billing](../billing/scout-billing.md).
@z

@x
Before you can activate image analysis on a repository in a third-party registry,
the registry must be integrated with Docker Scout for your Docker organization.
Docker Hub is integrated by default. For more information, see
See [Container registry integrations](./integrations/_index.md#container-registries)
@y
Before you can activate image analysis on a repository in a third-party registry,
the registry must be integrated with Docker Scout for your Docker organization.
Docker Hub is integrated by default. For more information, see
See [Container registry integrations](./integrations/_index.md#container-registries)
@z

@x
> **Note**
>
> You must have the **Editor** or **Owner** role in the Docker organization to
> activate image analysis on a repository.
@y
> **Note**
>
> You must have the **Editor** or **Owner** role in the Docker organization to
> activate image analysis on a repository.
@z

@x
To activate image analysis:
@y
To activate image analysis:
@z

@x
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/)
2. Sign in with your Docker ID.
3. Make sure that the correct Docker organization is selected.
4. Open the settings menu and select **Repository settings**.
5. Select the repositories that you want to enable.
6. Select **Enable image analysis**.
@y
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/)
2. Sign in with your Docker ID.
3. Make sure that the correct Docker organization is selected.
4. Open the settings menu and select **Repository settings**.
5. Select the repositories that you want to enable.
6. Select **Enable image analysis**.
@z

@x
If your repositories already contain images,
Docker Scout pulls and analyzes the latest images automatically.
@y
If your repositories already contain images,
Docker Scout pulls and analyzes the latest images automatically.
@z

@x
## Analyze registry images
@y
## Analyze registry images
@z

@x
To trigger image analysis for an image in a registry, push the image to a
registry that's integrated with Docker Scout, to a repository where image
analysis is activated.
@y
To trigger image analysis for an image in a registry, push the image to a
registry that's integrated with Docker Scout, to a repository where image
analysis is activated.
@z

@x
1. Sign in with your Docker ID, either using the `docker login` command or the
   **Sign in** button in Docker Desktop.
2. Build and push the image that you want to analyze.
@y
1. Sign in with your Docker ID, either using the `docker login` command or the
   **Sign in** button in Docker Desktop.
2. Build and push the image that you want to analyze.
@z

@x
   ```console
   $ docker build --push --tag <org>/<image:tag> --provenance=true --sbom=true .
   ```
@y
   ```console
   $ docker build --push --tag <org>/<image:tag> --provenance=true --sbom=true .
   ```
@z

@x
   Building with the `--provenance=true` and `--sbom=true` flags attaches
   [build attestations](../build/attestations/_index.md) to the image. Docker
   Scout uses attestations to provide more fine-grained analysis results.
@y
   Building with the `--provenance=true` and `--sbom=true` flags attaches
   [build attestations](../build/attestations/_index.md) to the image. Docker
   Scout uses attestations to provide more fine-grained analysis results.
@z

@x
   > **Note**
   >
   > The default `docker` driver only supports build attestations if you use the
   > [containerd image store](../desktop/containerd.md).
@y
   > **Note**
   >
   > The default `docker` driver only supports build attestations if you use the
   > [containerd image store](../desktop/containerd.md).
@z

@x
3. Go to the [Docker Scout Dashboard](https://scout.docker.com/)
4. Sign in with your Docker ID.
5. Select the Docker organization that contains the image you just pushed.
6. Go to the **Images** tab. The image appears in the list shortly after you
   push it to the registry.
@y
3. Go to the [Docker Scout Dashboard](https://scout.docker.com/)
4. Sign in with your Docker ID.
5. Select the Docker organization that contains the image you just pushed.
6. Go to the **Images** tab. The image appears in the list shortly after you
   push it to the registry.
@z

@x
   It may take a few minutes for the analysis results to appear.
@y
   It may take a few minutes for the analysis results to appear.
@z

@x
## Analyze images locally
@y
## Analyze images locally
@z

@x
You can analyze local images with Docker Scout using Docker Desktop or the
`docker scout` commands for the Docker CLI.
@y
You can analyze local images with Docker Scout using Docker Desktop or the
`docker scout` commands for the Docker CLI.
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
> **Note**
>
> There is a 3 GB size limit on images analyzed by Docker Scout in Docker
> Desktop.
@y
> **Note**
>
> There is a 3 GB size limit on images analyzed by Docker Scout in Docker
> Desktop.
@z

@x
To analyze an image locally using the Docker Desktop GUI:
@y
To analyze an image locally using the Docker Desktop GUI:
@z

@x
1. Pull or build the image that you want to analyze.
2. Go to the **Images** view in the Docker Dashboard.
3. Select one of your local images in the list.
@y
1. Pull or build the image that you want to analyze.
2. Go to the **Images** view in the Docker Dashboard.
3. Select one of your local images in the list.
@z

@x
   This opens the [Image details view](./image-details-view.md), showing a
   breakdown of packages and vulnerabilities found by the Docker Scout analysis
   for the image you selected.
@y
   This opens the [Image details view](./image-details-view.md), showing a
   breakdown of packages and vulnerabilities found by the Docker Scout analysis
   for the image you selected.
@z

@x
### CLI
@y
### CLI
@z

@x
The `docker scout` CLI commands provide a command line interface for using Docker
Scout from your terminal.
@y
The `docker scout` CLI commands provide a command line interface for using Docker
Scout from your terminal.
@z

@x
- `docker scout quickview`: summary of the specified image, see [Quickview](#quickview)
- `docker scout cves`: local analysis of the specified image, see [CVEs](#cves)
- `docker scout compare`: analyzes and compares two images
@y
- `docker scout quickview`: summary of the specified image, see [Quickview](#quickview)
- `docker scout cves`: local analysis of the specified image, see [CVEs](#cves)
- `docker scout compare`: analyzes and compares two images
@z

@x
By default, the results are printed to standard output.
You can also export results to a file in a structured format,
such as Static Analysis Results Interchange Format (SARIF).
@y
By default, the results are printed to standard output.
You can also export results to a file in a structured format,
such as Static Analysis Results Interchange Format (SARIF).
@z

@x
#### Install
@y
#### Install
@z

@x
The Docker Scout CLI plugin comes pre-installed with Docker Desktop.
You can also install it as a standalone binary.
@y
The Docker Scout CLI plugin comes pre-installed with Docker Desktop.
You can also install it as a standalone binary.
@z

@x
To install the latest version of the plugin manually, run the following commands:
@y
To install the latest version of the plugin manually, run the following commands:
@z

@x
```console
$ curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
$ sh install-scout.sh
```
@y
```console
$ curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
$ sh install-scout.sh
```
@z

@x
> **Note**
>
> Always examine scripts downloaded from the internet before running them
> locally. Before installing, make yourself familiar with potential risks and
> limitations of the convenience script.
@y
> **Note**
>
> Always examine scripts downloaded from the internet before running them
> locally. Before installing, make yourself familiar with potential risks and
> limitations of the convenience script.
@z

@x
If you want to install the plugin manually, you can find full instructions in
the [plugin's repository](https://github.com/docker/scout-cli).
@y
If you want to install the plugin manually, you can find full instructions in
the [plugin's repository](https://github.com/docker/scout-cli).
@z

@x
The plugin is also available as [a container image](https://hub.docker.com/r/docker/scout-cli)
and as [a GitHub action](https://github.com/docker/scout-action).
@y
The plugin is also available as [a container image](https://hub.docker.com/r/docker/scout-cli)
and as [a GitHub action](https://github.com/docker/scout-action).
@z

@x
#### Quickview
@y
#### Quickview
@z

@x
The `docker scout quickview` command provides an overview of the
vulnerabilities found in a given image and its base image.
@y
The `docker scout quickview` command provides an overview of the
vulnerabilities found in a given image and its base image.
@z

@x
```console
$ docker scout quickview traefik:latest
    ✓ SBOM of image already cached, 311 packages indexed
@y
```console
$ docker scout quickview traefik:latest
    ✓ SBOM of image already cached, 311 packages indexed
@z

@x
  Your image  traefik:latest  │    0C     2H     8M     1L
  Base image  alpine:3        │    0C     0H     0M     0L
```
@y
  Your image  traefik:latest  │    0C     2H     8M     1L
  Base image  alpine:3        │    0C     0H     0M     0L
```
@z

@x
If your the base image is out of date, the `quickview` command also shows how
updating your base image would change the vulnerability exposure of your image.
@y
If your the base image is out of date, the `quickview` command also shows how
updating your base image would change the vulnerability exposure of your image.
@z

@x
```console
$ docker scout quickview postgres:13.1
    ✓ Pulled
    ✓ Image stored for indexing
    ✓ Indexed 187 packages
@y
```console
$ docker scout quickview postgres:13.1
    ✓ Pulled
    ✓ Image stored for indexing
    ✓ Indexed 187 packages
@z

@x
  Your image  postgres:13.1                 │   17C    32H    35M    33L
  Base image  debian:buster-slim            │    9C    14H     9M    23L
  Refreshed base image  debian:buster-slim  │    0C     1H     6M    29L
                                            │    -9    -13     -3     +6
  Updated base image  debian:stable-slim    │    0C     0H     0M    17L
                                            │    -9    -14     -9     -6
```
@y
  Your image  postgres:13.1                 │   17C    32H    35M    33L
  Base image  debian:buster-slim            │    9C    14H     9M    23L
  Refreshed base image  debian:buster-slim  │    0C     1H     6M    29L
                                            │    -9    -13     -3     +6
  Updated base image  debian:stable-slim    │    0C     0H     0M    17L
                                            │    -9    -14     -9     -6
```
@z

@x
#### CVEs
@y
#### CVEs
@z

@x
The `docker scout cves` command gives you a complete view of all the
vulnerabilities in the image. This command supports several flags that lets you
specify more precisely which vulnerabilities you're interested in, for example,
by severity or package type:
@y
The `docker scout cves` command gives you a complete view of all the
vulnerabilities in the image. This command supports several flags that lets you
specify more precisely which vulnerabilities you're interested in, for example,
by severity or package type:
@z

@x
```console
$ docker scout cves --format only-packages --only-vuln-packages \
  --only-severity critical postgres:13.1
    ✓ SBOM of image already cached, 187 packages indexed
    ✗ Detected 10 vulnerable packages with a total of 17 vulnerabilities
@y
```console
$ docker scout cves --format only-packages --only-vuln-packages \
  --only-severity critical postgres:13.1
    ✓ SBOM of image already cached, 187 packages indexed
    ✗ Detected 10 vulnerable packages with a total of 17 vulnerabilities
@z

@x
     Name            Version         Type        Vulnerabilities
───────────────────────────────────────────────────────────────────────────
  dpkg        1.19.7                 deb      1C     0H     0M     0L
  glibc       2.28-10                deb      4C     0H     0M     0L
  gnutls28    3.6.7-4+deb10u6        deb      2C     0H     0M     0L
  libbsd      0.9.1-2                deb      1C     0H     0M     0L
  libksba     1.3.5-2                deb      2C     0H     0M     0L
  libtasn1-6  4.13-3                 deb      1C     0H     0M     0L
  lz4         1.8.3-1                deb      1C     0H     0M     0L
  openldap    2.4.47+dfsg-3+deb10u5  deb      1C     0H     0M     0L
  openssl     1.1.1d-0+deb10u4       deb      3C     0H     0M     0L
  zlib        1:1.2.11.dfsg-1        deb      1C     0H     0M     0L
```
@y
     Name            Version         Type        Vulnerabilities
───────────────────────────────────────────────────────────────────────────
  dpkg        1.19.7                 deb      1C     0H     0M     0L
  glibc       2.28-10                deb      4C     0H     0M     0L
  gnutls28    3.6.7-4+deb10u6        deb      2C     0H     0M     0L
  libbsd      0.9.1-2                deb      1C     0H     0M     0L
  libksba     1.3.5-2                deb      2C     0H     0M     0L
  libtasn1-6  4.13-3                 deb      1C     0H     0M     0L
  lz4         1.8.3-1                deb      1C     0H     0M     0L
  openldap    2.4.47+dfsg-3+deb10u5  deb      1C     0H     0M     0L
  openssl     1.1.1d-0+deb10u4       deb      3C     0H     0M     0L
  zlib        1:1.2.11.dfsg-1        deb      1C     0H     0M     0L
```
@z

@x
For more information about these commands and how to use them, refer to the CLI
reference documentation:
@y
For more information about these commands and how to use them, refer to the CLI
reference documentation:
@z

@x
- [`docker scout quickview`](../reference/cli/docker/scout/quickview.md)
- [`docker scout cves`](../reference/cli/docker/scout/cves.md)
@y
- [`docker scout quickview`](../reference/cli/docker/scout/quickview.md)
- [`docker scout cves`](../reference/cli/docker/scout/cves.md)
@z

@x
## Vulnerability severity assessment
@y
## Vulnerability severity assessment
@z

@x
Docker Scout assigns a severity rating to vulnerabilities based on
vulnerability data from [advisory sources](./advisory-db-sources.md).
Advisories are ranked and prioritized depending on the type of package that's
affected by a vulnerability. For example, if a vulnerability affects an OS
package, the severity level assigned by the distribution maintainer is
prioritized.
@y
Docker Scout assigns a severity rating to vulnerabilities based on
vulnerability data from [advisory sources](./advisory-db-sources.md).
Advisories are ranked and prioritized depending on the type of package that's
affected by a vulnerability. For example, if a vulnerability affects an OS
package, the severity level assigned by the distribution maintainer is
prioritized.
@z

@x
If the preferred advisory source has assigned a severity rating to a CVE, but
not a CVSS score, Docker Scout falls back to displaying a CVSS score from
another source. The severity rating from the preferred advisory and the CVSS
score from the fallback advisory are displayed together. This means a
vulnerability can have a severity rating of `LOW` with a CVSS score of 9.8, if
the preferred advisory assigns a `LOW` rating but no CVSS score, and a fallback
advisory assigns a CVSS score of 9.8.
@y
If the preferred advisory source has assigned a severity rating to a CVE, but
not a CVSS score, Docker Scout falls back to displaying a CVSS score from
another source. The severity rating from the preferred advisory and the CVSS
score from the fallback advisory are displayed together. This means a
vulnerability can have a severity rating of `LOW` with a CVSS score of 9.8, if
the preferred advisory assigns a `LOW` rating but no CVSS score, and a fallback
advisory assigns a CVSS score of 9.8.
@z

@x
Vulnerabilities that haven't been assigned a CVSS score in any source are
categorized as **Unspecified** (U).
@y
Vulnerabilities that haven't been assigned a CVSS score in any source are
categorized as **Unspecified** (U).
@z

@x
Docker Scout doesn't implement a proprietary vulnerability metrics system. All
metrics are inherited from security advisories that Docker Scout integrates
with. Advisories may use different thresholds for classifying vulnerabilities,
but most of them adhere to the CVSS v3.0 specification, which maps CVSS scores
to severity ratings according to the following table:
@y
Docker Scout doesn't implement a proprietary vulnerability metrics system. All
metrics are inherited from security advisories that Docker Scout integrates
with. Advisories may use different thresholds for classifying vulnerabilities,
but most of them adhere to the CVSS v3.0 specification, which maps CVSS scores
to severity ratings according to the following table:
@z

@x
| CVSS score | Severity rating  |
| ---------- | ---------------- |
| 0.1 – 3.9  | **Low** (L)      |
| 4.0 – 6.9  | **Medium** (M)   |
| 7.0 – 8.9  | **High** (H)     |
| 9.0 – 10.0 | **Critical** (C) |
@y
| CVSS score | Severity rating  |
| ---------- | ---------------- |
| 0.1 – 3.9  | **Low** (L)      |
| 4.0 – 6.9  | **Medium** (M)   |
| 7.0 – 8.9  | **High** (H)     |
| 9.0 – 10.0 | **Critical** (C) |
@z

@x
For more information, see [Vulnerability Metrics (NIST)](https://nvd.nist.gov/vuln-metrics/cvss).
@y
For more information, see [Vulnerability Metrics (NIST)](https://nvd.nist.gov/vuln-metrics/cvss).
@z

@x
Note that, given the advisory prioritization and fallback mechanism described
earlier, severity ratings displayed in Docker Scout may deviate from this
rating system.
@y
Note that, given the advisory prioritization and fallback mechanism described
earlier, severity ratings displayed in Docker Scout may deviate from this
rating system.
@z