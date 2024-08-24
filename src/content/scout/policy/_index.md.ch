%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Get started with Policy Evaluation in Docker Scout
keywords: scout, supply chain, vulnerabilities, packages, cves, policy
description: |
  Policies in Docker Scout let you define supply chain rules and thresholds
  for your artifacts, and track how your artifacts perform against those
  requirements over time
@y
title: Get started with Policy Evaluation in Docker Scout
keywords: scout, supply chain, vulnerabilities, packages, cves, policy
description: |
  Policies in Docker Scout let you define supply chain rules and thresholds
  for your artifacts, and track how your artifacts perform against those
  requirements over time
@z

@x
{{% restricted title="Early Access" %}}
Policy Evaluation is an [Early Access](/release-lifecycle/#early-access-ea)
feature of Docker Scout.
{{% /restricted %}}
@y
{{% restricted title="Early Access" %}}
Policy Evaluation is an [Early Access](__SUBDIR__/release-lifecycle/#early-access-ea)
feature of Docker Scout.
{{% /restricted %}}
@z

@x
In software supply chain management, maintaining the security and reliability
of artifacts is a top priority. Policy Evaluation in Docker Scout introduces a
layer of control, on top of existing analysis capabilities. It lets you define
supply chain rules for your artifacts, and helps you track how your artifacts
perform, relative to your rules and thresholds, over time.
@y
In software supply chain management, maintaining the security and reliability
of artifacts is a top priority. Policy Evaluation in Docker Scout introduces a
layer of control, on top of existing analysis capabilities. It lets you define
supply chain rules for your artifacts, and helps you track how your artifacts
perform, relative to your rules and thresholds, over time.
@z

@x
Learn how you can use Policy Evaluation to ensure that your artifacts align
with established best practices.
@y
Learn how you can use Policy Evaluation to ensure that your artifacts align
with established best practices.
@z

@x
## How Policy Evaluation works
@y
## How Policy Evaluation works
@z

@x (no slash) 対応
When you activate Docker Scout for a repository, images that you push are
[automatically analyzed](/scout/explore/analysis.md). The analysis gives you insights
about the composition of your images, including what packages they contain and
what vulnerabilities they're exposed to. Policy Evaluation builds on top of the
image analysis feature, interpreting the analysis results against the rules
defined by policies.
@y
When you activate Docker Scout for a repository, images that you push are
[automatically analyzed](scout/explore/analysis.md). The analysis gives you insights
about the composition of your images, including what packages they contain and
what vulnerabilities they're exposed to. Policy Evaluation builds on top of the
image analysis feature, interpreting the analysis results against the rules
defined by policies.
@z

@x
A policy defines image quality criteria that your artifacts should fulfill.
For example, the **No AGPL v3 licenses** policy flags any image containing packages distributed under the AGPL v3 license.
If an image contains such a package, that image is non-compliant with this policy.
Some policies, such as the **No AGPL v3 licenses** policy, are configurable.
Configurable policies let you adjust the criteria to better match your organization's needs.
@y
A policy defines image quality criteria that your artifacts should fulfill.
For example, the **No AGPL v3 licenses** policy flags any image containing packages distributed under the AGPL v3 license.
If an image contains such a package, that image is non-compliant with this policy.
Some policies, such as the **No AGPL v3 licenses** policy, are configurable.
Configurable policies let you adjust the criteria to better match your organization's needs.
@z

@x
In Docker Scout, policies are designed to help you ratchet forward your
security and supply chain stature. Where other tools focus on providing a pass
or fail status, Docker Scout policies visualizes how small, incremental changes
affect policy status, even when your artifacts don't meet the policy
requirements (yet). By tracking how the fail gap changes over time, you more
easily see whether your artifact is improving or deteriorating relative to
policy.
@y
In Docker Scout, policies are designed to help you ratchet forward your
security and supply chain stature. Where other tools focus on providing a pass
or fail status, Docker Scout policies visualizes how small, incremental changes
affect policy status, even when your artifacts don't meet the policy
requirements (yet). By tracking how the fail gap changes over time, you more
easily see whether your artifact is improving or deteriorating relative to
policy.
@z

@x
Policies don't necessarily have to be related to application security and
vulnerabilities. You can use policies to measure and track other aspects of
supply chain management as well, such as open-source license usage and base
image up-to-dateness.
@y
Policies don't necessarily have to be related to application security and
vulnerabilities. You can use policies to measure and track other aspects of
supply chain management as well, such as open-source license usage and base
image up-to-dateness.
@z

@x
## Out-of-the-box policies
@y
## Out-of-the-box policies
@z

@x
Docker Scout ships the following out-of-the-box policies:
@y
Docker Scout ships the following out-of-the-box policies:
@z

@x
- [No fixable critical or high vulnerabilities](#no-fixable-critical-or-high-vulnerabilities)
- [No AGPL v3 licenses](#no-agpl-v3-licenses)
- [No outdated base images](#no-outdated-base-images)
- [No high-profile vulnerabilities](#no-high-profile-vulnerabilities)
- [Supply chain attestations](#supply-chain-attestations)
- [Default non-root user](#default-non-root-user)
- [No unapproved base images](#no-unapproved-base-images)
@y
- [No fixable critical or high vulnerabilities](#no-fixable-critical-or-high-vulnerabilities)
- [No AGPL v3 licenses](#no-agpl-v3-licenses)
- [No outdated base images](#no-outdated-base-images)
- [No high-profile vulnerabilities](#no-high-profile-vulnerabilities)
- [Supply chain attestations](#supply-chain-attestations)
- [Default non-root user](#default-non-root-user)
- [No unapproved base images](#no-unapproved-base-images)
@z

@x
To give you a head start, Scout enables several policies by default for your
Scout-enabled repositories. You can customize the default configurations to
reflect internal requirements and standards. You can also disable a policy
altogether if it isn't relevant to you. For more information, see [Configure
policies](./configure.md).
@y
To give you a head start, Scout enables several policies by default for your
Scout-enabled repositories. You can customize the default configurations to
reflect internal requirements and standards. You can also disable a policy
altogether if it isn't relevant to you. For more information, see [Configure
policies](./configure.md).
@z

@x
### No fixable critical or high vulnerabilities
@y
### No fixable critical or high vulnerabilities
@z

@x
The **No fixable critical or high vulnerabilities** policy requires that your
artifacts aren't exposed to known vulnerabilities where there's a fix version
available. Essentially, this means that there's an easy fix that you can deploy
for images that fail this policy: upgrade the vulnerable package to a version
containing a fix for the vulnerability.
@y
The **No fixable critical or high vulnerabilities** policy requires that your
artifacts aren't exposed to known vulnerabilities where there's a fix version
available. Essentially, this means that there's an easy fix that you can deploy
for images that fail this policy: upgrade the vulnerable package to a version
containing a fix for the vulnerability.
@z

@x
By default, this policy only flags critical and high severity vulnerabilities.
@y
By default, this policy only flags critical and high severity vulnerabilities.
@z

@x
This policy is violated if an artifact is affected by one or more critical-
or high-severity vulnerability, where a fix version is available.
@y
This policy is violated if an artifact is affected by one or more critical-
or high-severity vulnerability, where a fix version is available.
@z

@x
You can configure the parameters of this policy by creating a custom version of the policy.
The following policy parameters are configurable in a custom version:
@y
You can configure the parameters of this policy by creating a custom version of the policy.
The following policy parameters are configurable in a custom version:
@z

@x
- **Age**: The minimum number of days since the vulnerability was first published
@y
- **Age**: The minimum number of days since the vulnerability was first published
@z

@x
  The rationale for only flagging vulnerabilities of a certain minimum age is
  that newly discovered vulnerabilities shouldn't cause your evaluations to
  fail until you've had a chance to address them.
@y
  The rationale for only flagging vulnerabilities of a certain minimum age is
  that newly discovered vulnerabilities shouldn't cause your evaluations to
  fail until you've had a chance to address them.
@z

@x
<!-- vale Vale.Spelling = NO -->
- **Severities**: Severity levels to consider (default: `Critical, High`)
<!-- vale Vale.Spelling = YES -->
@y
<!-- vale Vale.Spelling = NO -->
- **Severities**: Severity levels to consider (default: `Critical, High`)
<!-- vale Vale.Spelling = YES -->
@z

@x
- **Fixable vulnerabilities only**: Whether or not to only report
  vulnerabilities with a fix version available (enabled by default).
@y
- **Fixable vulnerabilities only**: Whether or not to only report
  vulnerabilities with a fix version available (enabled by default).
@z

@x
For more information about configuring policies, see [Configure policies](./configure.md).
@y
For more information about configuring policies, see [Configure policies](./configure.md).
@z

@x
### No AGPL v3 licenses
@y
### No AGPL v3 licenses
@z

@x
The **No AGPL v3 licenses** policy requires that your artifacts don't contain
packages distributed under an AGPLv3 license. This policy is violated if
your artifacts contain one or more packages with this license.
@y
The **No AGPL v3 licenses** policy requires that your artifacts don't contain
packages distributed under an AGPLv3 license. This policy is violated if
your artifacts contain one or more packages with this license.
@z

@x
You can configure the list of licenses that this policy should look out for,
and add exceptions by specifying an allow-list (in the form of PURLs).
See [Configure policies](./configure.md).
@y
You can configure the list of licenses that this policy should look out for,
and add exceptions by specifying an allow-list (in the form of PURLs).
See [Configure policies](./configure.md).
@z

@x
### No outdated base images
@y
### No outdated base images
@z

@x
The **No outdated base images** policy requires that the base images you use are
up-to-date.
@y
The **No outdated base images** policy requires that the base images you use are
up-to-date.
@z

@x
It's violated when the tag you used to build your image points to a
different digest than what you're using. If there's a mismatch in digests, that
means the base image you're using is out of date.
@y
It's violated when the tag you used to build your image points to a
different digest than what you're using. If there's a mismatch in digests, that
means the base image you're using is out of date.
@z

@x
Your images need provenance attestations for this policy to successfully
evaluate. For more information, see [No base image data](#no-base-image-data).
@y
Your images need provenance attestations for this policy to successfully
evaluate. For more information, see [No base image data](#no-base-image-data).
@z

@x
### No high-profile vulnerabilities
@y
### No high-profile vulnerabilities
@z

@x
The **No high-profile vulnerabilities** policy requires that your artifacts don't
contain vulnerabilities from Docker Scout’s curated list. This list is kept
up-to-date with newly disclosed vulnerabilities that are widely recognized to
be risky.
@y
The **No high-profile vulnerabilities** policy requires that your artifacts don't
contain vulnerabilities from Docker Scout’s curated list. This list is kept
up-to-date with newly disclosed vulnerabilities that are widely recognized to
be risky.
@z

@x
The list includes the following vulnerabilities:
@y
The list includes the following vulnerabilities:
@z

@x
- [CVE-2014-0160 (OpenSSL Heartbleed)](https://scout.docker.com/v/CVE-2014-0160)
- [CVE-2021-44228 (Log4Shell)](https://scout.docker.com/v/CVE-2021-44228)
- [CVE-2023-38545 (cURL SOCKS5 heap buffer overflow)](https://scout.docker.com/v/CVE-2023-38545)
- [CVE-2023-44487 (HTTP/2 Rapid Reset)](https://scout.docker.com/v/CVE-2023-44487)
- [CVE-2024-3094 (XZ backdoor)](https://scout.docker.com/v/CVE-2024-3094)
@y
- [CVE-2014-0160 (OpenSSL Heartbleed)](https://scout.docker.com/v/CVE-2014-0160)
- [CVE-2021-44228 (Log4Shell)](https://scout.docker.com/v/CVE-2021-44228)
- [CVE-2023-38545 (cURL SOCKS5 heap buffer overflow)](https://scout.docker.com/v/CVE-2023-38545)
- [CVE-2023-44487 (HTTP/2 Rapid Reset)](https://scout.docker.com/v/CVE-2023-44487)
- [CVE-2024-3094 (XZ backdoor)](https://scout.docker.com/v/CVE-2024-3094)
@z

@x
You can configure the CVEs included in this list by creating a custom policy.
Custom configuration options include:
@y
You can configure the CVEs included in this list by creating a custom policy.
Custom configuration options include:
@z

@x
- **CVEs to avoid**: Specify the CVEs that you want to avoid in your artifacts.
@y
- **CVEs to avoid**: Specify the CVEs that you want to avoid in your artifacts.
@z

@x
  Default: `CVE-2014-0160`, `CVE-2021-44228`, `CVE-2023-38545`, `CVE-2023-44487`, `CVE-2024-3094`
@y
  Default: `CVE-2014-0160`, `CVE-2021-44228`, `CVE-2023-38545`, `CVE-2023-44487`, `CVE-2024-3094`
@z

@x
- **CISA KEV**: Enable tracking of vulnerabilities from CISA's Known Exploited Vulnerabilities (KEV) catalog
@y
- **CISA KEV**: Enable tracking of vulnerabilities from CISA's Known Exploited Vulnerabilities (KEV) catalog
@z

@x
  The [CISA KEV catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
  includes vulnerabilities that are actively exploited in the wild. When enabled,
  the policy flags images that contain vulnerabilities from the CISA KEV catalog.
@y
  The [CISA KEV catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
  includes vulnerabilities that are actively exploited in the wild. When enabled,
  the policy flags images that contain vulnerabilities from the CISA KEV catalog.
@z

@x
  Enabled by default.
@y
  Enabled by default.
@z

@x
For more information on policy configuration, see [Configure policies](./configure.md).
@y
For more information on policy configuration, see [Configure policies](./configure.md).
@z

@x
### Supply chain attestations
@y
### Supply chain attestations
@z

@x
The **Supply chain attestations** policy requires that your artifacts have
[SBOM](../../build/metadata/attestations/sbom.md) and
[provenance](../../build/metadata/attestations/slsa-provenance.md) attestations.
@y
The **Supply chain attestations** policy requires that your artifacts have
[SBOM](../../build/metadata/attestations/sbom.md) and
[provenance](../../build/metadata/attestations/slsa-provenance.md) attestations.
@z

@x
This policy is violated if an artifact lacks either an SBOM attestation or a
provenance attestation with max mode. To ensure compliance,
update your build command to attach these attestations at build-time:
@y
This policy is violated if an artifact lacks either an SBOM attestation or a
provenance attestation with max mode. To ensure compliance,
update your build command to attach these attestations at build-time:
@z

@x
```console
$ docker buildx build --provenance=true --sbom=true -t <IMAGE> --push .
```
@y
```console
$ docker buildx build --provenance=true --sbom=true -t <IMAGE> --push .
```
@z

@x
For more information about building with attestations, see
[Attestations](../../build/metadata/attestations/_index.md).
@y
For more information about building with attestations, see
[Attestations](../../build/metadata/attestations/_index.md).
@z

@x
If you're using GitHub Actions to build and push your images,
learn how you can [configure the action](/build/ci/github-actions/attestations.md)
to apply SBOM and provenance attestations.
@y
If you're using GitHub Actions to build and push your images,
learn how you can [configure the action](/build/ci/github-actions/attestations.md)
to apply SBOM and provenance attestations.
@z

@x
### Default non-root user
@y
### Default non-root user
@z

@x
By default, containers run as the `root` superuser with full system
administration privileges inside the container, unless the Dockerfile specifies
a different default user. Running containers as a privileged user weakens their
runtime security, as it means any code that runs in the container can perform
administrative actions.
@y
By default, containers run as the `root` superuser with full system
administration privileges inside the container, unless the Dockerfile specifies
a different default user. Running containers as a privileged user weakens their
runtime security, as it means any code that runs in the container can perform
administrative actions.
@z

@x
The **Default non-root user** policy detects images that are set to run as the
default `root` user. To comply with this policy, images must specify a non-root
user in the image configuration. Images violate this policy if they don't
specify a non-root default user for the runtime stage.
@y
The **Default non-root user** policy detects images that are set to run as the
default `root` user. To comply with this policy, images must specify a non-root
user in the image configuration. Images violate this policy if they don't
specify a non-root default user for the runtime stage.
@z

@x
For non-compliant images, evaluation results show whether or not the `root`
user was set explicitly for the image. This helps you distinguish between
policy violations caused by images where the `root` user is implicit, and
images where `root` is set on purpose.
@y
For non-compliant images, evaluation results show whether or not the `root`
user was set explicitly for the image. This helps you distinguish between
policy violations caused by images where the `root` user is implicit, and
images where `root` is set on purpose.
@z

@x
The following Dockerfile runs as `root` by default despite not being explicitly set:
@y
The following Dockerfile runs as `root` by default despite not being explicitly set:
@z

@x
```Dockerfile
FROM alpine
RUN echo "Hi"
```
@y
```Dockerfile
FROM alpine
RUN echo "Hi"
```
@z

@x
Whereas in the following case, the `root` user is explicitly set:
@y
Whereas in the following case, the `root` user is explicitly set:
@z

@x
```Dockerfile
FROM alpine
USER root
RUN echo "Hi"
```
@y
```Dockerfile
FROM alpine
USER root
RUN echo "Hi"
```
@z

@x
> [!NOTE]
>
> This policy only checks for the default user of the image, as set in the
> image configuration blob. Even if you do specify a non-root default user,
> it's still possible to override the default user at runtime, for example by
> using the `--user` flag for the `docker run` command.
@y
> [!NOTE]
>
> This policy only checks for the default user of the image, as set in the
> image configuration blob. Even if you do specify a non-root default user,
> it's still possible to override the default user at runtime, for example by
> using the `--user` flag for the `docker run` command.
@z

@x
To make your images compliant with this policy, use the
[`USER`](../../reference/dockerfile.md#user) Dockerfile instruction to set
a default user that doesn't have root privileges for the runtime stage.
@y
To make your images compliant with this policy, use the
[`USER`](../../reference/dockerfile.md#user) Dockerfile instruction to set
a default user that doesn't have root privileges for the runtime stage.
@z

@x
The following Dockerfile snippets shows the difference between a compliant and
non-compliant image.
@y
The following Dockerfile snippets shows the difference between a compliant and
non-compliant image.
@z

@x
{{< tabs >}}
{{< tab name="Non-compliant" >}}
@y
{{< tabs >}}
{{< tab name="Non-compliant" >}}
@z

@x
```dockerfile
FROM alpine AS builder
COPY Makefile ./src /
RUN make build
@y
```dockerfile
FROM alpine AS builder
COPY Makefile ./src /
RUN make build
@z

@x
FROM alpine AS runtime
COPY --from=builder bin/production /app
ENTRYPOINT ["/app/production"]
```
@y
FROM alpine AS runtime
COPY --from=builder bin/production /app
ENTRYPOINT ["/app/production"]
```
@z

@x
{{< /tab >}}
{{< tab name="Compliant" >}}
@y
{{< /tab >}}
{{< tab name="Compliant" >}}
@z

@x
```dockerfile {hl_lines=7}
FROM alpine AS builder
COPY Makefile ./src /
RUN make build
@y
```dockerfile {hl_lines=7}
FROM alpine AS builder
COPY Makefile ./src /
RUN make build
@z

@x
FROM alpine AS runtime
COPY --from=builder bin/production /app
USER nonroot
ENTRYPOINT ["/app/production"]
```
@y
FROM alpine AS runtime
COPY --from=builder bin/production /app
USER nonroot
ENTRYPOINT ["/app/production"]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### No unapproved base images
@y
### No unapproved base images
@z

@x
The **No unapproved base images** policy ensures that the base images you use
in your builds are maintained and secure.
@y
The **No unapproved base images** policy ensures that the base images you use
in your builds are maintained and secure.
@z

@x
This policy checks whether the base images used in your builds match any of the
patterns specified in the policy configuration. The following table shows a few
example patterns for this policy.
@y
This policy checks whether the base images used in your builds match any of the
patterns specified in the policy configuration. The following table shows a few
example patterns for this policy.
@z

@x
| Use case                                                        | Pattern                          |
| --------------------------------------------------------------- | -------------------------------- |
| Allow all images from Docker Hub                                | `docker.io/*`                    |
| Allow all Docker Official Images                                | `docker.io/library/*`            |
| Allow images from a specific organization                       | `docker.io/orgname/*`            |
| Allow tags of a specific repository                             | `docker.io/orgname/repository:*` |
| Allow images on a registry with hostname `registry.example.com` | `registry.example.com/*`         |
| Allow slim tags of NodeJS images                                | `docker.io/library/node:*-slim`  |
@y
| Use case                                                        | Pattern                          |
| --------------------------------------------------------------- | -------------------------------- |
| Allow all images from Docker Hub                                | `docker.io/*`                    |
| Allow all Docker Official Images                                | `docker.io/library/*`            |
| Allow images from a specific organization                       | `docker.io/orgname/*`            |
| Allow tags of a specific repository                             | `docker.io/orgname/repository:*` |
| Allow images on a registry with hostname `registry.example.com` | `registry.example.com/*`         |
| Allow slim tags of NodeJS images                                | `docker.io/library/node:*-slim`  |
@z

@x
An asterisk (`*`) matches up until the character that follows, or until the end
of the image reference. Note that the `docker.io` prefix is required in order
to match Docker Hub images. This is the registry hostname of Docker Hub.
@y
An asterisk (`*`) matches up until the character that follows, or until the end
of the image reference. Note that the `docker.io` prefix is required in order
to match Docker Hub images. This is the registry hostname of Docker Hub.
@z

@x
This policy is configurable with the following options:
@y
This policy is configurable with the following options:
@z

@x
- **Approved base image sources**
@y
- **Approved base image sources**
@z

@x
  Specify the image reference patterns that you want to allow. The policy
  evaluates the base image references against these patterns.
@y
  Specify the image reference patterns that you want to allow. The policy
  evaluates the base image references against these patterns.
@z

@x
  Default: `[*]` (any reference is an allowed base image)
@y
  Default: `[*]` (any reference is an allowed base image)
@z

@x
- **Only supported tags**
@y
- **Only supported tags**
@z

@x
  Allow only supported tags when using Docker Official Images.
@y
  Allow only supported tags when using Docker Official Images.
@z

@x
  When this option is enabled, images using unsupported tags of official images
  as their base image trigger a policy violation. Supported tags for official
  images are listed in the **Supported tags** section of the repository
  overview on Docker Hub.
@y
  When this option is enabled, images using unsupported tags of official images
  as their base image trigger a policy violation. Supported tags for official
  images are listed in the **Supported tags** section of the repository
  overview on Docker Hub.
@z

@x
  Enabled by default.
@y
  Enabled by default.
@z

@x
- **Only supported OS distributions**
@y
- **Only supported OS distributions**
@z

@x
  Allow only Docker Official Images of supported Linux distribution versions.
@y
  Allow only Docker Official Images of supported Linux distribution versions.
@z

@x
  When this option is enabled, images using unsupported Linux distributions
  that have reached end of life (such as `ubuntu:18.04`) trigger a policy violation.
@y
  When this option is enabled, images using unsupported Linux distributions
  that have reached end of life (such as `ubuntu:18.04`) trigger a policy violation.
@z

@x
  Enabling this option may cause the policy to report no data
  if the operating system version cannot be determined.
@y
  Enabling this option may cause the policy to report no data
  if the operating system version cannot be determined.
@z

@x
  Enabled by default.
@y
  Enabled by default.
@z

@x
Your images need provenance attestations for this policy to successfully
evaluate. For more information, see [No base image data](#no-base-image-data).
@y
Your images need provenance attestations for this policy to successfully
evaluate. For more information, see [No base image data](#no-base-image-data).
@z

@x
## Additional policies
@y
## Additional policies
@z

@x
In addition to the [out-of-the-box policies](#out-of-the-box-policies) enabled
by default, Docker Scout supports the following optional policies. Before you
can enable these policies, you need to either configure the policies, or
configure the integration that the policy requires.
@y
In addition to the [out-of-the-box policies](#out-of-the-box-policies) enabled
by default, Docker Scout supports the following optional policies. Before you
can enable these policies, you need to either configure the policies, or
configure the integration that the policy requires.
@z

@x
- [SonarQube quality gates passed](#sonarqube-quality-gates-passed)
@y
- [SonarQube quality gates passed](#sonarqube-quality-gates-passed)
@z

@x
### SonarQube quality gates passed
@y
### SonarQube quality gates passed
@z

@x
The **SonarQube quality gates passed** policy builds on the [SonarQube
integration](../integrations/code-quality/sonarqube.md) to assess the quality
of your source code. This policy works by ingesting the SonarQube code analysis
results into Docker Scout.
@y
The **SonarQube quality gates passed** policy builds on the [SonarQube
integration](../integrations/code-quality/sonarqube.md) to assess the quality
of your source code. This policy works by ingesting the SonarQube code analysis
results into Docker Scout.
@z

@x
You define the criteria for this policy using SonarQube's [quality
gates](https://docs.sonarsource.com/sonarqube/latest/user-guide/quality-gates/).
SonarQube evaluates your source code against the quality gates you've defined
in SonarQube. Docker Scout surfaces the SonarQube assessment as a Docker Scout
policy.
@y
You define the criteria for this policy using SonarQube's [quality
gates](https://docs.sonarsource.com/sonarqube/latest/user-guide/quality-gates/).
SonarQube evaluates your source code against the quality gates you've defined
in SonarQube. Docker Scout surfaces the SonarQube assessment as a Docker Scout
policy.
@z

@x
Docker Scout uses [provenance](../../build/metadata/attestations/slsa-provenance.md)
attestations or the `org.opencontainers.image.revision` OCI annotation to link
SonarQube analysis results with container images. In addition to enabling the
SonarQube integration, you must also make sure that your images have either the
attestation or the label.
@y
Docker Scout uses [provenance](../../build/metadata/attestations/slsa-provenance.md)
attestations or the `org.opencontainers.image.revision` OCI annotation to link
SonarQube analysis results with container images. In addition to enabling the
SonarQube integration, you must also make sure that your images have either the
attestation or the label.
@z

@x
![Git commit SHA links image with SonarQube analysis](../images/scout-sq-commit-sha.webp)
@y
![Git commit SHA links image with SonarQube analysis](../images/scout-sq-commit-sha.webp)
@z

@x
Once you push an image and policy evaluation completes, the results from the
SonarQube quality gates display as a policy in the Docker Scout Dashboard, and
in the CLI.
@y
Once you push an image and policy evaluation completes, the results from the
SonarQube quality gates display as a policy in the Docker Scout Dashboard, and
in the CLI.
@z

@x
> [!NOTE]
>
> Docker Scout can only access SonarQube analyses created after the integration
> is enabled. Docker Scout doesn't have access to historic evaluations. Trigger
> a SonarQube analysis and policy evaluation after enabling the integration to
> view the results in Docker Scout.
@y
> [!NOTE]
>
> Docker Scout can only access SonarQube analyses created after the integration
> is enabled. Docker Scout doesn't have access to historic evaluations. Trigger
> a SonarQube analysis and policy evaluation after enabling the integration to
> view the results in Docker Scout.
@z

@x
## No base image data
@y
## No base image data
@z

@x
There are cases when it's not possible to determine information about the base
images used in your builds. In such cases, the **No outdated base images** and
**No unapproved base images** policies get flagged as having **No data**.
@y
There are cases when it's not possible to determine information about the base
images used in your builds. In such cases, the **No outdated base images** and
**No unapproved base images** policies get flagged as having **No data**.
@z

@x
This "no data" state occurs when:
@y
This "no data" state occurs when:
@z

@x
- Docker Scout doesn't know what base image tag you used
- The base image version you used has multiple tags, but not all tags are out
  of date
@y
- Docker Scout doesn't know what base image tag you used
- The base image version you used has multiple tags, but not all tags are out
  of date
@z

@x
To make sure that Docker Scout always knows about your base image, you can
attach [provenance attestations](../../build/metadata/attestations/slsa-provenance.md)
at build-time. Docker Scout uses provenance attestations to find out the base
image version.
@y
To make sure that Docker Scout always knows about your base image, you can
attach [provenance attestations](../../build/metadata/attestations/slsa-provenance.md)
at build-time. Docker Scout uses provenance attestations to find out the base
image version.
@z
