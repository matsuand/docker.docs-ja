%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
> Policy Evaluation is an [Early Access](/release-lifecycle/#early-access-ea)
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
## Default policies
@y
## Default policies
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
@y
- [Fixable critical and high vulnerabilities](#fixable-critical-and-high-vulnerabilities)
- [Critical vulnerabilities](#critical-vulnerabilities)
- [Copyleft licenses](#copyleft-licenses)
- [Outdated base images](#outdated-base-images)
- [High-profile vulnerabilities](#high-profile-vulnerabilities)
- [Supply chain attestations](#supply-chain-attestations)
- [Quality gates passed](#quality-gates-passed)
@z

@x
Policies are enabled by default for Scout-enabled repositories. If you want to
customize the criteria of a policy, you can create custom policies based on the
default, out-of-the-box policies. You can also disable a policy altogether if
it isn't relevant to you. For more information, see [Configure
policies](./configure.md).
@y
Policies are enabled by default for Scout-enabled repositories. If you want to
customize the criteria of a policy, you can create custom policies based on the
default, out-of-the-box policies. You can also disable a policy altogether if
it isn't relevant to you. For more information, see [Configure
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
#### No base image data
@y
#### No base image data
@z

@x
There are cases when it's not possible to determine whether or not the base
image is up-to-date. In such cases, the **Outdated base images** policy
gets flagged as having **No data**.
@y
There are cases when it's not possible to determine whether or not the base
image is up-to-date. In such cases, the **Outdated base images** policy
gets flagged as having **No data**.
@z

@x
This occurs when:
@y
This occurs when:
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
provenance attestation, or if the provenance attestation lacks information
about the Git repository and base images being used. To ensure compliance,
update your build command to attach these attestations at build-time:
@y
This policy is unfulfilled if an artifact lacks either an SBOM attestation or a
provenance attestation, or if the provenance attestation lacks information
about the Git repository and base images being used. To ensure compliance,
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
BuildKit automatically detects the Git repository and base images when this
information is available in the build context. For more information about
building with attestations, see
[Attestations](../../build/attestations/_index.md).
@y
BuildKit automatically detects the Git repository and base images when this
information is available in the build context. For more information about
building with attestations, see
[Attestations](../../build/attestations/_index.md).
@z

@x
> **Note**
>
> Docker Scout is currently unable to discern the difference between using
> `scratch` as a base image and having no base image provenance. As a result,
> images based on `scratch` always fail the Supply chain attestations policy.
@y
> **Note**
>
> Docker Scout is currently unable to discern the difference between using
> `scratch` as a base image and having no base image provenance. As a result,
> images based on `scratch` always fail the Supply chain attestations policy.
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
