%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
---
title: Get started with Policy Evaluation in Docker Scout
keywords: scout, supply chain, vulnerabilities, packages, cves, policy
description: |
  Policies in Docker Scout let you define supply chain rules and thresholds
  for your artifacts, and track how your artifacts perform against those
  requirements over time
---
@y
---
title: Get started with Policy Evaluation in Docker Scout
keywords: scout, supply chain, vulnerabilities, packages, cves, policy
description: |
  Policies in Docker Scout let you define supply chain rules and thresholds
  for your artifacts, and track how your artifacts perform against those
  requirements over time
---
@z

@x
> **Early Access**
>
> Policy Evaluation is an [Early Access](/release-lifecycle/#early-access-ea)
> feature of Docker Scout.
{ .restricted }
@y
> **Early Access**
>
> Policy Evaluation is an [Early Access](__SUBDIR__/release-lifecycle/#early-access-ea)
> feature of Docker Scout.
{ .restricted }
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

@x
When you activate Docker Scout for a repository, images that you push are
[automatically analyzed](../image-analysis.md). The analysis gives you insights
about the composition of your images, including what packages they contain and
what vulnerabilities they're exposed to. Policy Evaluation builds on top of the
image analysis feature, interpreting the analysis results against the rules
defined by policies.
@y
When you activate Docker Scout for a repository, images that you push are
[automatically analyzed](../image-analysis.md). The analysis gives you insights
about the composition of your images, including what packages they contain and
what vulnerabilities they're exposed to. Policy Evaluation builds on top of the
image analysis feature, interpreting the analysis results against the rules
defined by policies.
@z

@x
A policy defines one or more criteria that your artifacts should fulfill. For
example, one of the default policies in Docker Scout is the **Critical
vulnerabilities** policy, which requires that your artifacts must not contain
any critical vulnerabilities. If an artifact contains one or more
vulnerabilities with a critical severity, that artifact fails the evaluation.
@y
A policy defines one or more criteria that your artifacts should fulfill. For
example, one of the default policies in Docker Scout is the **Critical
vulnerabilities** policy, which requires that your artifacts must not contain
any critical vulnerabilities. If an artifact contains one or more
vulnerabilities with a critical severity, that artifact fails the evaluation.
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
- [Fixable critical and high vulnerabilities](#fixable-critical-and-high-vulnerabilities)
- [Critical vulnerabilities](#critical-vulnerabilities)
- [Copyleft licenses](#copyleft-licenses)
- [Outdated base images](#outdated-base-images)
- [High-profile vulnerabilities](#high-profile-vulnerabilities)
- [Supply chain attestations](#supply-chain-attestations)
- [Quality gates passed](#quality-gates-passed)
- [Default non-root user](#default-non-root-user)
- [Unapproved base images](#unapproved-base-images)
@y
- [Fixable critical and high vulnerabilities](#fixable-critical-and-high-vulnerabilities)
- [Critical vulnerabilities](#critical-vulnerabilities)
- [Copyleft licenses](#copyleft-licenses)
- [Outdated base images](#outdated-base-images)
- [High-profile vulnerabilities](#high-profile-vulnerabilities)
- [Supply chain attestations](#supply-chain-attestations)
- [Quality gates passed](#quality-gates-passed)
- [Default non-root user](#default-non-root-user)
- [Unapproved base images](#unapproved-base-images)
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
### Fixable critical and high vulnerabilities
@y
### Fixable critical and high vulnerabilities
@z

@x
The **Fixable critical and high vulnerabilities** policy requires that your
artifacts aren't exposed to known vulnerabilities where there's a fix version
available. Essentially, this means that there's an easy fix that you can deploy
for images that fail this policy: upgrade the vulnerable package to a version
containing a fix for the vulnerability.
@y
The **Fixable critical and high vulnerabilities** policy requires that your
artifacts aren't exposed to known vulnerabilities where there's a fix version
available. Essentially, this means that there's an easy fix that you can deploy
for images that fail this policy: upgrade the vulnerable package to a version
containing a fix for the vulnerability.
@z

@x
This policy only flags critical and high severity vulnerabilities that were
published more than 30 days ago. The rationale for only flagging
vulnerabilities of a certain age is that newly discovered vulnerabilities
shouldn't cause your evaluations to fail until you've had a chance to address
them.
@y
This policy only flags critical and high severity vulnerabilities that were
published more than 30 days ago. The rationale for only flagging
vulnerabilities of a certain age is that newly discovered vulnerabilities
shouldn't cause your evaluations to fail until you've had a chance to address
them.
@z

@x
This policy is unfulfilled if an artifact is affected by one or more critical-
or high-severity vulnerability, where a fix version is available.
@y
This policy is unfulfilled if an artifact is affected by one or more critical-
or high-severity vulnerability, where a fix version is available.
@z

@x
You can configure the severity level and age thresholds by creating a custom
policy. For more information, see [Configure policies](./configure.md).
@y
You can configure the severity level and age thresholds by creating a custom
policy. For more information, see [Configure policies](./configure.md).
@z

@x
### Critical vulnerabilities
@y
### Critical vulnerabilities
@z

@x
The **Critical vulnerabilities** policy requires that your artifacts contain no
known critical vulnerabilities. The policy is unfulfilled if your artifact
contains one or more critical vulnerabilities.
@y
The **Critical vulnerabilities** policy requires that your artifacts contain no
known critical vulnerabilities. The policy is unfulfilled if your artifact
contains one or more critical vulnerabilities.
@z

@x
This policy flags all critical vulnerabilities, whether or not there's a fix
version available, and regardless of how long it's been since the vulnerability
was first disclosed.
@y
This policy flags all critical vulnerabilities, whether or not there's a fix
version available, and regardless of how long it's been since the vulnerability
was first disclosed.
@z

@x
You can configure the severity level by creating a custom policy, see
[Configure policies](./configure.md).
@y
You can configure the severity level by creating a custom policy, see
[Configure policies](./configure.md).
@z

@x
### Copyleft licenses
@y
### Copyleft licenses
@z

@x
The **Copyleft licenses** policy requires that your artifacts don't contain
packages distributed under an AGPLv3 or GPLv3 license. These licenses are
protective [copyleft](https://en.wikipedia.org/wiki/Copyleft), and may be
unsuitable for use in your software because of the restrictions they enforce.
@y
The **Copyleft licenses** policy requires that your artifacts don't contain
packages distributed under an AGPLv3 or GPLv3 license. These licenses are
protective [copyleft](https://en.wikipedia.org/wiki/Copyleft), and may be
unsuitable for use in your software because of the restrictions they enforce.
@z

@x
This policy is unfulfilled if your artifacts contain one or more packages with
a violating license.
@y
This policy is unfulfilled if your artifacts contain one or more packages with
a violating license.
@z

@x
You can configure the list of licenses by creating a custom policy, see
[Configure policies](./configure.md).
@y
You can configure the list of licenses by creating a custom policy, see
[Configure policies](./configure.md).
@z

@x
### Outdated base images
@y
### Outdated base images
@z

@x
The **Outdated base images** policy requires that the base images you use are
up-to-date.
@y
The **Outdated base images** policy requires that the base images you use are
up-to-date.
@z

@x
It's unfulfilled when the tag you used to build your image points to a
different digest than what you're using. If there's a mismatch in digests, that
means the base image you're using is out of date.
@y
It's unfulfilled when the tag you used to build your image points to a
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
### High-profile vulnerabilities
@y
### High-profile vulnerabilities
@z

@x
The **High-profile vulnerabilities** policy requires that your artifacts don't
contain vulnerabilities from Docker Scout’s curated list. This list is kept
up-to-date with newly disclosed vulnerabilities that are widely recognized to
be risky.
@y
The **High-profile vulnerabilities** policy requires that your artifacts don't
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
@y
- [CVE-2014-0160 (OpenSSL Heartbleed)](https://scout.docker.com/v/CVE-2014-0160)
- [CVE-2021-44228 (Log4Shell)](https://scout.docker.com/v/CVE-2021-44228)
- [CVE-2023-38545 (cURL SOCKS5 heap buffer overflow)](https://scout.docker.com/v/CVE-2023-38545)
- [CVE-2023-44487 (HTTP/2 Rapid Reset)](https://scout.docker.com/v/CVE-2023-44487)
@z

@x
You can configure the CVEs included in this list by creating a custom policy.
For more information, see [Configure policies](./configure.md).
@y
You can configure the CVEs included in this list by creating a custom policy.
For more information, see [Configure policies](./configure.md).
@z

@x
### Supply chain attestations
@y
### Supply chain attestations
@z

@x
The **Supply chain attestations** policy requires that your artifacts have
[SBOM](../../build/attestations/sbom.md) and
[provenance](../../build/attestations/slsa-provenance.md) attestations.
@y
The **Supply chain attestations** policy requires that your artifacts have
[SBOM](../../build/attestations/sbom.md) and
[provenance](../../build/attestations/slsa-provenance.md) attestations.
@z

@x
This policy is unfulfilled if an artifact lacks either an SBOM attestation or a
provenance attestation with max mode. To ensure compliance,
update your build command to attach these attestations at build-time:
@y
This policy is unfulfilled if an artifact lacks either an SBOM attestation or a
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
For more information about
building with attestations, see
[Attestations](../../build/attestations/_index.md).
@y
For more information about
building with attestations, see
[Attestations](../../build/attestations/_index.md).
@z

@x
### Quality gates passed
@y
### Quality gates passed
@z

@x
The Quality gates passed policy builds on the [SonarQube
integration](../integrations/code-quality/sonarqube.md) to assess the quality
of your source code. This policy works by ingesting the SonarQube code analysis
results into Docker Scout.
@y
The Quality gates passed policy builds on the [SonarQube
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
Docker Scout uses [provenance](../../build/attestations/slsa-provenance.md)
attestations or the `org.opencontainers.image.revision` OCI annotation to link
SonarQube analysis results with container images. In addition to enabling the
SonarQube integration, you must also make sure that your images has either the
attestation or the label.
@y
Docker Scout uses [provenance](../../build/attestations/slsa-provenance.md)
attestations or the `org.opencontainers.image.revision` OCI annotation to link
SonarQube analysis results with container images. In addition to enabling the
SonarQube integration, you must also make sure that your images has either the
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
> **Note**
>
> Docker Scout can only access SonarQube analyses created after the integration
> is enabled. Docker Scout doesn't have access to historic evaluations. Trigger
> a SonarQube analysis and policy evaluation after enabling the integration to
> view the results in Docker Scout.
@y
> **Note**
>
> Docker Scout can only access SonarQube analyses created after the integration
> is enabled. Docker Scout doesn't have access to historic evaluations. Trigger
> a SonarQube analysis and policy evaluation after enabling the integration to
> view the results in Docker Scout.
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
```Dockerfile
FROM alpine
RUN echo "Hi"
```
@y
The following Dockerfile runs as `root` by default despite not being explicitly set:
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
> **Note**
>
> This policy only checks for the default user of the image, as set in the
> image configuration blob. Even if you do specify a non-root default user,
> it's still possible to override the default user at runtime, for example by
> using the `--user` flag for the `docker run` command.
@y
> **Note**
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
### Unapproved base images
@y
### Unapproved base images
@z

@x
The **Unapproved base images** policy lets you restrict which base
images you allow in your builds.
@y
The **Unapproved base images** policy lets you restrict which base
images you allow in your builds.
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
You can also configure the policy to:
@y
You can also configure the policy to:
@z

@x
- Allow only supported tags of Docker Official Images.
@y
- Allow only supported tags of Docker Official Images.
@z

@x
  When this option is enabled, images using unsupported tags of official images
  trigger a policy violation. Supported tags for official images are listed in
  the **Supported tags** section of the repository overview on Docker Hub.
@y
  When this option is enabled, images using unsupported tags of official images
  trigger a policy violation. Supported tags for official images are listed in
  the **Supported tags** section of the repository overview on Docker Hub.
@z

@x
- Allow only Docker Official Images of supported distro versions
@y
- Allow only Docker Official Images of supported distro versions
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
This policy isn't enabled by default. To enable the policy:
@y
This policy isn't enabled by default. To enable the policy:
@z

@x
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/).
2. Go to the **Policies** section.
3. Select the **Unapproved base images** policy in the list.
4. Enter the patterns that you want to allow.
5. Select whether you want to allow only supported tags or supported distro
   versions of official images.
6. Select **Save and enable**.
@y
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/).
2. Go to the **Policies** section.
3. Select the **Unapproved base images** policy in the list.
4. Enter the patterns that you want to allow.
5. Select whether you want to allow only supported tags or supported distro
   versions of official images.
6. Select **Save and enable**.
@z

@x
   The policy is now enabled for your current organization.
@y
   The policy is now enabled for your current organization.
@z

@x
Your images need provenance attestations for this policy to successfully
evaluate. For more information, see [No base image data](#no-base-image-data).
@y
Your images need provenance attestations for this policy to successfully
evaluate. For more information, see [No base image data](#no-base-image-data).
@z

@x
## No base image data
@y
## No base image data
@z

@x
There are cases when it's not possible to determine information about the base
images used in your builds. In such cases, the **Outdated base images** and
**Unapproved base images** policies get flagged as having **No data**.
@y
There are cases when it's not possible to determine information about the base
images used in your builds. In such cases, the **Outdated base images** and
**Unapproved base images** policies get flagged as having **No data**.
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
attach [provenance attestations](../../build/attestations/slsa-provenance.md)
at build-time. Docker Scout uses provenance attestations to find out the base
image version.
@y
To make sure that Docker Scout always knows about your base image, you can
attach [provenance attestations](../../build/attestations/slsa-provenance.md)
at build-time. Docker Scout uses provenance attestations to find out the base
image version.
@z
