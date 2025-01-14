%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Docker Scout image analysis
description:
  Docker Scout image analysis provides a detailed view into the composition of
  your images and the vulnerabilities that they contain
keywords: scout, scanning, vulnerabilities, supply chain, security, analysis
@y
title: Docker Scout のイメージ分析
description:
  Docker Scout image analysis provides a detailed view into the composition of
  your images and the vulnerabilities that they contain
keywords: scout, scanning, vulnerabilities, supply chain, security, analysis
@z

@x
When you activate image analysis for a repository,
Docker Scout automatically analyzes new images that you push to that repository.
@y
リポジトリにおいてイメージ分析をアクティブにした場合、そのリポジトリへのプッシュが行われると Docker Scout は新たなイメージに対して自動的に分析を行います。
@z

@x
Image analysis extracts the Software Bill of Material (SBOM)
and other image metadata,and evaluates it against vulnerability data from
[security advisories](/manuals/scout/deep-dive/advisory-db-sources.md).
@y
Image analysis extracts the Software Bill of Material (SBOM)
and other image metadata,and evaluates it against vulnerability data from
[security advisories](manuals/scout/deep-dive/advisory-db-sources.md).
@z

@x
If you run image analysis as a one-off task using the CLI or Docker Desktop,
Docker Scout won't store any data about your image.
If you enable Docker Scout for your container image repositories however,
Docker Scout saves a metadata snapshot of your images after the analysis.
As new vulnerability data becomes available, Docker Scout recalibrates the analysis using the metadata snapshot, which means your security status for images is updated in real-time.
This dynamic evaluation means there's no need to re-analyze images when new CVE information is disclosed.
@y
If you run image analysis as a one-off task using the CLI or Docker Desktop,
Docker Scout won't store any data about your image.
If you enable Docker Scout for your container image repositories however,
Docker Scout saves a metadata snapshot of your images after the analysis.
As new vulnerability data becomes available, Docker Scout recalibrates the analysis using the metadata snapshot, which means your security status for images is updated in real-time.
This dynamic evaluation means there's no need to re-analyze images when new CVE information is disclosed.
@z

@x
Docker Scout image analysis is available by default for Docker Hub repositories.
You can also integrate third-party registries and other services. To learn more,
see [Integrating Docker Scout with other systems](/manuals/scout/integrations/_index.md).
@y
Docker Scout image analysis is available by default for Docker Hub repositories.
You can also integrate third-party registries and other services. To learn more,
see [Integrating Docker Scout with other systems](manuals/scout/integrations/_index.md).
@z

@x
## Activate Docker Scout on a repository
@y
## Activate Docker Scout on a repository
@z

@x
Docker Personal comes with 1 Scout-enabled repository. You can upgrade your
Docker subscription if you need additional repositories.
See [Subscriptions and features](../../subscription/details.md)
to learn how many Scout-enabled
repositories come with each subscription tier.
@y
Docker Personal comes with 1 Scout-enabled repository. You can upgrade your
Docker subscription if you need additional repositories.
See [Subscriptions and features](../../subscription/details.md)
to learn how many Scout-enabled
repositories come with each subscription tier.
@z

@x
Before you can activate image analysis on a repository in a third-party registry,
the registry must be integrated with Docker Scout for your Docker organization.
Docker Hub is integrated by default. For more information, see
See [Container registry integrations](/manuals/scout/integrations/_index.md#container-registries)
@y
Before you can activate image analysis on a repository in a third-party registry,
the registry must be integrated with Docker Scout for your Docker organization.
Docker Hub is integrated by default. For more information, see
See [Container registry integrations](manuals/scout/integrations/_index.md#container-registries)
@z

@x
> [!NOTE]
>
> You must have the **Editor** or **Owner** role in the Docker organization to
> activate image analysis on a repository.
@y
> [!NOTE]
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
1. Go to [Repository settings](https://scout.docker.com/settings/repos) in the Docker Scout Dashboard.
2. Select the repositories that you want to enable.
3. Select **Enable image analysis**.
@y
1. Go to [Repository settings](https://scout.docker.com/settings/repos) in the Docker Scout Dashboard.
2. Select the repositories that you want to enable.
3. Select **Enable image analysis**.
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
> [!NOTE]
>
> Image analysis on the Docker Scout platform has a maximum image file size
> limit of 10 GB, unless the image has an SBOM attestation.
> See [Maximum image size](#maximum-image-size).
@y
> [!NOTE]
>
> Image analysis on the Docker Scout platform has a maximum image file size
> limit of 10 GB, unless the image has an SBOM attestation.
> See [Maximum image size](#maximum-image-size).
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

% snip command...

@x
   Building with the `--provenance=true` and `--sbom=true` flags attaches
   [build attestations](/manuals/build/metadata/attestations/_index.md) to the image. Docker
   Scout uses attestations to provide more fine-grained analysis results.
@y
   Building with the `--provenance=true` and `--sbom=true` flags attaches
   [build attestations](manuals/build/metadata/attestations/_index.md) to the image. Docker
   Scout uses attestations to provide more fine-grained analysis results.
@z

@x
   > [!NOTE]
   >
   > The default `docker` driver only supports build attestations if you use the
   > [containerd image store](/manuals/desktop/features/containerd.md).
@y
   > [!NOTE]
   >
   > The default `docker` driver only supports build attestations if you use the
   > [containerd image store](manuals/desktop/features/containerd.md).
@z

@x
3. Go to the [Images page](https://scout.docker.com/reports/images) in the Docker Scout Dashboard.
@y
3. Go to the [Images page](https://scout.docker.com/reports/images) in the Docker Scout Dashboard.
@z

@x
   The image appears in the list shortly after you push it to the registry.
   It may take a few minutes for the analysis results to appear.
@y
   The image appears in the list shortly after you push it to the registry.
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
> [!NOTE]
>
> Docker Desktop background indexing supports images up to 10 GB in size.
> See [Maximum image size](#maximum-image-size).
@y
> [!NOTE]
>
> Docker Desktop background indexing supports images up to 10 GB in size.
> See [Maximum image size](#maximum-image-size).
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

% snip command...

@x
If your the base image is out of date, the `quickview` command also shows how
updating your base image would change the vulnerability exposure of your image.
@y
If your the base image is out of date, the `quickview` command also shows how
updating your base image would change the vulnerability exposure of your image.
@z

% snip command...

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

% snip command...

@x
For more information about these commands and how to use them, refer to the CLI
reference documentation:
@y
For more information about these commands and how to use them, refer to the CLI
reference documentation:
@z

@x (no slash) 対応
- [`docker scout quickview`](/reference/cli/docker/scout/quickview.md)
- [`docker scout cves`](/reference/cli/docker/scout/cves.md)
@y
- [`docker scout quickview`](reference/cli/docker/scout/quickview.md)
- [`docker scout cves`](reference/cli/docker/scout/cves.md)
@z

@x
## Vulnerability severity assessment
@y
## Vulnerability severity assessment
@z

@x
Docker Scout assigns a severity rating to vulnerabilities based on
vulnerability data from [advisory sources](/manuals/scout/deep-dive/advisory-db-sources.md).
Advisories are ranked and prioritized depending on the type of package that's
affected by a vulnerability. For example, if a vulnerability affects an OS
package, the severity level assigned by the distribution maintainer is
prioritized.
@y
Docker Scout assigns a severity rating to vulnerabilities based on
vulnerability data from [advisory sources](manuals/scout/deep-dive/advisory-db-sources.md).
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

@x
## Maximum image size
@y
## Maximum image size
@z

@x
Image analysis on the Docker Scout platform, and analysis triggered by background
indexing in Docker Desktop, has an image file size limit of 10 GB (uncompressed).
To analyze images larger than that, you can either:
@y
Image analysis on the Docker Scout platform, and analysis triggered by background
indexing in Docker Desktop, has an image file size limit of 10 GB (uncompressed).
To analyze images larger than that, you can either:
@z

@x
- Attach [SBOM attestations](/manuals/build/metadata/attestations/sbom.md) at build-time
- Use the [CLI](#cli) to analyze the image locally
@y
- Attach [SBOM attestations](manuals/build/metadata/attestations/sbom.md) at build-time
- Use the [CLI](#cli) to analyze the image locally
@z

@x
Images analyzed locally with the CLI and images with SBOM attestations
have no maximum file size.
@y
Images analyzed locally with the CLI and images with SBOM attestations
have no maximum file size.
@z
