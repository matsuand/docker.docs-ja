%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Scout release notes
description: Learn about the latest features of Docker Scout
keywords: docker scout, release notes, changelog, features, changes, delta, new, releases
---
@y
---
title: Docker Scout release notes
description: Learn about the latest features of Docker Scout
keywords: docker scout, release notes, changelog, features, changes, delta, new, releases
---
@z

@x
This page contains information about the new features, improvements, known
issues, and bug fixes in Docker Scout releases. These release notes cover the
Docker Scout platform, including the Dashboard. For CLI release notes, refer to
the `docker/scout-cli` [GitHub repository](https://github.com/docker/scout-cli/releases).
@y
This page contains information about the new features, improvements, known
issues, and bug fixes in Docker Scout releases. These release notes cover the
Docker Scout platform, including the Dashboard. For CLI release notes, refer to
the `docker/scout-cli` [GitHub repository](https://github.com/docker/scout-cli/releases).
@z

@x
Take a look at the [Docker Public Roadmap](https://github.com/docker/roadmap/projects/1)
for what's coming next.
@y
Take a look at the [Docker Public Roadmap](https://github.com/docker/roadmap/projects/1)
for what's coming next.
@z

@x
## 2024 Q1
@y
## 2024 Q1
@z

@x
New features and enhancements released in Q1 of 2024.
@y
New features and enhancements released in Q1 of 2024.
@z

@x
### 2024-01-26
@y
### 2024-01-26
@z

@x
**Azure Container Registry** integration graduated from
[Early Access](../release-lifecycle.md#early-access-ea) to
[General Availability](../release-lifecycle.md#genera-availability-ga).
@y
**Azure Container Registry** integration graduated from
[Early Access](../release-lifecycle.md#early-access-ea) to
[General Availability](../release-lifecycle.md#genera-availability-ga).
@z

@x
For more information and setup instructions, see
[Integrate Azure Container Registry](./integrations/registry/acr.md).
@y
For more information and setup instructions, see
[Integrate Azure Container Registry](./integrations/registry/acr.md).
@z

@x
### 2024-01-23
@y
### 2024-01-23
@z

@x
New **Unapproved base images** policy, which lets you restrict which base
images you allow in your builds. You define the allowed base images using a
pattern. Base images whose image reference don't match the specified patterns
cause the policy to fail.
@y
New **Unapproved base images** policy, which lets you restrict which base
images you allow in your builds. You define the allowed base images using a
pattern. Base images whose image reference don't match the specified patterns
cause the policy to fail.
@z

@x
For more information, see
[Unapproved base images](./policy/_index.md#unapproved-base-images).
@y
For more information, see
[Unapproved base images](./policy/_index.md#unapproved-base-images).
@z

@x
### 2024-01-12
@y
### 2024-01-12
@z

@x
New **Default non-root user** policy, which flags images that would run as the
`root` superuser with full system administration privileges by default.
Specifying a non-root default user for your images can help strengthen your
runtime security.
@y
New **Default non-root user** policy, which flags images that would run as the
`root` superuser with full system administration privileges by default.
Specifying a non-root default user for your images can help strengthen your
runtime security.
@z

@x
For more information, see [Default non-root user](./policy/_index.md#default-non-root-user).
@y
For more information, see [Default non-root user](./policy/_index.md#default-non-root-user).
@z

@x
### 2024-01-11
@y
### 2024-01-11
@z

@x
[Beta](../release-lifecycle.md#beta) launch of a new GitHub app for integrating
Docker Scout with your source code management, and a remediation feature for
helping you improve policy compliance.
@y
[Beta](../release-lifecycle.md#beta) launch of a new GitHub app for integrating
Docker Scout with your source code management, and a remediation feature for
helping you improve policy compliance.
@z

@x
Remediation is a new capability for Docker Scout to provide contextual,
recommended actions based on policy evaluation results on how you can improve
compliance.
@y
Remediation is a new capability for Docker Scout to provide contextual,
recommended actions based on policy evaluation results on how you can improve
compliance.
@z

@x
The GitHub integration enhances the remediation feature. With the integration
enabled, Docker Scout is able to connect analysis results to the source. This
additional context about how your images are built is used to generate better,
more precise recommendations.
@y
The GitHub integration enhances the remediation feature. With the integration
enabled, Docker Scout is able to connect analysis results to the source. This
additional context about how your images are built is used to generate better,
more precise recommendations.
@z

@x
For more information about the types of recommendations that Docker Scout can
provide to help you improve policy compliance, see
[Remediation](./policy/remediation.md).
@y
For more information about the types of recommendations that Docker Scout can
provide to help you improve policy compliance, see
[Remediation](./policy/remediation.md).
@z

@x
For more information about how to authorize the Docker Scout GitHub app on your
source repositories, see
[Integrate Docker Scout with GitHub](./integrations/source-code-management/github.md).
@y
For more information about how to authorize the Docker Scout GitHub app on your
source repositories, see
[Integrate Docker Scout with GitHub](./integrations/source-code-management/github.md).
@z

@x
## 2023 Q4
@y
## 2023 Q4
@z

@x
New features and enhancements released in Q4 of 2023.
@y
New features and enhancements released in Q4 of 2023.
@z

@x
### 2023-12-20
@y
### 2023-12-20
@z

@x
**Azure Container Registry** integration graduated from
[Beta](../release-lifecycle.md#beta) to
[Early Access](../release-lifecycle.md#early-access-ea).
@y
**Azure Container Registry** integration graduated from
[Beta](../release-lifecycle.md#beta) to
[Early Access](../release-lifecycle.md#early-access-ea).
@z

@x
For more information and setup instructions, see
[Integrate Azure Container Registry](./integrations/registry/acr.md).
@y
For more information and setup instructions, see
[Integrate Azure Container Registry](./integrations/registry/acr.md).
@z

@x
### 2023-12-06
@y
### 2023-12-06
@z

@x
New [SonarQube](https://www.sonarsource.com/products/sonarqube/) integration
and related policy. SonarQube is an open-source platform for continuous
inspection of code quality. This integration lets you add SonarQube's quality
gates as a policy evaluation in Docker Scout. Enable the integration, push your
images, and see the SonarQube quality gate conditions surfaced in the new
**Quality gates passed** policy.
@y
New [SonarQube](https://www.sonarsource.com/products/sonarqube/) integration
and related policy. SonarQube is an open-source platform for continuous
inspection of code quality. This integration lets you add SonarQube's quality
gates as a policy evaluation in Docker Scout. Enable the integration, push your
images, and see the SonarQube quality gate conditions surfaced in the new
**Quality gates passed** policy.
@z

@x
For more information, see:
@y
For more information, see:
@z

@x
- [Integration and setup instructions](./integrations/code-quality/sonarqube.md)
- [Quality gates passed policy](./policy/_index.md#quality-gates-passed)
@y
- [Integration and setup instructions](./integrations/code-quality/sonarqube.md)
- [Quality gates passed policy](./policy/_index.md#quality-gates-passed)
@z

@x
### 2023-12-01
@y
### 2023-12-01
@z

@x
[Beta](../release-lifecycle.md#beta) release of a new **Azure Container
Registry** (ACR) integration, which lets Docker Scout pull and analyze images
in ACR repositories automatically.
@y
[Beta](../release-lifecycle.md#beta) release of a new **Azure Container
Registry** (ACR) integration, which lets Docker Scout pull and analyze images
in ACR repositories automatically.
@z

@x
To learn more about the integration and how to get started, see
[Integrate Azure Container Registry](./integrations/registry/acr.md).
@y
To learn more about the integration and how to get started, see
[Integrate Azure Container Registry](./integrations/registry/acr.md).
@z

@x
### 2023-11-21
@y
### 2023-11-21
@z

@x
New **configurable policies** feature, which enables you to tweak the
out-of-the-box policies according to your preferences, or disable them entirely
if they don't quite match your needs. Some examples of how you can adapt
policies for your organization include:
@y
New **configurable policies** feature, which enables you to tweak the
out-of-the-box policies according to your preferences, or disable them entirely
if they don't quite match your needs. Some examples of how you can adapt
policies for your organization include:
@z

@x
- Change the severity-thresholds that vulnerability-related policies use
- Customize the list of "high-profile vulnerabilities"
- Add or remove software licenses to flag as "copyleft"
@y
- Change the severity-thresholds that vulnerability-related policies use
- Customize the list of "high-profile vulnerabilities"
- Add or remove software licenses to flag as "copyleft"
@z

@x
For more information, see [Configurable policies](./policy/configure.md).
@y
For more information, see [Configurable policies](./policy/configure.md).
@z

@x
### 2023-11-10
@y
### 2023-11-10
@z

@x
New **Supply chain attestations** policy for helping you track whether your
images are built with SBOM and provenance attestations. Adding attestations to
images is a good first step in improving your supply chain conduct, and is
often a prerequisite for doing more.
@y
New **Supply chain attestations** policy for helping you track whether your
images are built with SBOM and provenance attestations. Adding attestations to
images is a good first step in improving your supply chain conduct, and is
often a prerequisite for doing more.
@z

@x
See [Supply chain attestations policy](./policy/_index.md#supply-chain-attestations)
for details.
@y
See [Supply chain attestations policy](./policy/_index.md#supply-chain-attestations)
for details.
@z

@x
### 2023-11-01
@y
### 2023-11-01
@z

@x
New **High-profile vulnerabilities** policy, which ensures your artifacts are
free from a curated list of vulnerabilities widely recognized to be risky.
@y
New **High-profile vulnerabilities** policy, which ensures your artifacts are
free from a curated list of vulnerabilities widely recognized to be risky.
@z

@x
For more information, see
[High-profile vulnerabilities policy](./policy/_index.md#high-profile-vulnerabilities).
@y
For more information, see
[High-profile vulnerabilities policy](./policy/_index.md#high-profile-vulnerabilities).
@z

@x
### 2023-10-04
@y
### 2023-10-04
@z

@x
This marks the General Availability (GA) release of Docker Scout.
@y
This marks the General Availability (GA) release of Docker Scout.
@z

@x
The following new features are included in this release:
@y
The following new features are included in this release:
@z

@x
- [Policy Evaluation](#policy-evaluation) (Early Access)
- [Amazon ECR integration](#amazon-ecr-integration)
- [Sysdig integration](#sysdig-integration)
- [JFrog Artifactory integration](#jfrog-artifactory-integration)
@y
- [Policy Evaluation](#policy-evaluation) (Early Access)
- [Amazon ECR integration](#amazon-ecr-integration)
- [Sysdig integration](#sysdig-integration)
- [JFrog Artifactory integration](#jfrog-artifactory-integration)
@z

@x
#### Policy evaluation
@y
#### Policy evaluation
@z

@x
Policy Evaluation is an early access feature that helps you ensure software
integrity and track how your artifacts are doing over time. This release ships
with four out-of-the-box policies, enabled by default for all organizations.
@y
Policy Evaluation is an early access feature that helps you ensure software
integrity and track how your artifacts are doing over time. This release ships
with four out-of-the-box policies, enabled by default for all organizations.
@z

@x
![Policy overview in Dashboard](./images/release-notes/policy-ea.webp)
@y
![Policy overview in Dashboard](./images/release-notes/policy-ea.webp)
@z

@x
- **Base images not up-to-date** evaluates whether the base images are out of
  date, and require updating. Up-to-date base images help you ensure that your
  environments are reliable and secure.
- **Critical and high vulnerabilities with fixes** reports if there are
  vulnerabilities with critical or high severity in your images, and where
  there's a fix version available that you can upgrade to.
- **All critical vulnerabilities** looks out for any vulnerabilities of
  critical severity found in your images.
- **Packages with AGPLv3, GPLv3 license** helps you catch possibly unwanted
  copyleft licenses used in your images.
@y
- **Base images not up-to-date** evaluates whether the base images are out of
  date, and require updating. Up-to-date base images help you ensure that your
  environments are reliable and secure.
- **Critical and high vulnerabilities with fixes** reports if there are
  vulnerabilities with critical or high severity in your images, and where
  there's a fix version available that you can upgrade to.
- **All critical vulnerabilities** looks out for any vulnerabilities of
  critical severity found in your images.
- **Packages with AGPLv3, GPLv3 license** helps you catch possibly unwanted
  copyleft licenses used in your images.
@z

@x
You can view and evaluate policy status for images using the Docker Scout
Dashboard and the `docker scout policy` CLI command. For more information,
refer to the [Policy Evaluation documentation](./policy/_index.md).
@y
You can view and evaluate policy status for images using the Docker Scout
Dashboard and the `docker scout policy` CLI command. For more information,
refer to the [Policy Evaluation documentation](./policy/_index.md).
@z

@x
#### Amazon ECR integration
@y
#### Amazon ECR integration
@z

@x
The new Amazon Elastic Container Registry (ECR) integration enables image
analysis for images hosted in ECR repositories.
@y
The new Amazon Elastic Container Registry (ECR) integration enables image
analysis for images hosted in ECR repositories.
@z

@x
You set up the integration using a pre-configured CloudFormation stack template
that bootstraps the necessary AWS resources in your account. Docker Scout
automatically analyzes images that you push to your registry, storing only the
metadata about the image contents, and not the container images themselves.
@y
You set up the integration using a pre-configured CloudFormation stack template
that bootstraps the necessary AWS resources in your account. Docker Scout
automatically analyzes images that you push to your registry, storing only the
metadata about the image contents, and not the container images themselves.
@z

@x
The integration offers a straightforward process for adding additional
repositories, activating Docker Scout for specific repositories, and removing
the integration if needed. To learn more, refer to the [Amazon ECR integration
documentation](./integrations/registry/ecr.md).
@y
The integration offers a straightforward process for adding additional
repositories, activating Docker Scout for specific repositories, and removing
the integration if needed. To learn more, refer to the [Amazon ECR integration
documentation](./integrations/registry/ecr.md).
@z

@x
#### Sysdig integration
@y
#### Sysdig integration
@z

@x
The new Sysdig integration gives you real-time security insights for your
Kubernetes runtime environments.
@y
The new Sysdig integration gives you real-time security insights for your
Kubernetes runtime environments.
@z

@x
Enabling this integration helps you address and prioritize risks for images
used to run your production workloads. It also helps reduce monitoring noise,
by automatically excluding vulnerabilities in programs that are never loaded
into memory, using VEX documents.
@y
Enabling this integration helps you address and prioritize risks for images
used to run your production workloads. It also helps reduce monitoring noise,
by automatically excluding vulnerabilities in programs that are never loaded
into memory, using VEX documents.
@z

@x
For more information and getting started, see [Sysdig integration
documentation](./integrations/environment/sysdig.md).
@y
For more information and getting started, see [Sysdig integration
documentation](./integrations/environment/sysdig.md).
@z

@x
#### JFrog Artifactory integration
@y
#### JFrog Artifactory integration
@z

@x
The new JFrog Artifactory integration enables automatic image analysis on
Artifactory registries.
@y
The new JFrog Artifactory integration enables automatic image analysis on
Artifactory registries.
@z

@x
![Animation of how to integrate Artifactory](./images/release-notes/artifactory-agent.gif)
@y
![Animation of how to integrate Artifactory](./images/release-notes/artifactory-agent.gif)
@z

@x
The integration involves deploying a Docker Scout Artifactory agent that polls
for new images, performs analysis, and uploads results to Docker Scout, all
while preserving the integrity of image data. Learn more in the [Artifactory
integration documentation](./integrations/registry/artifactory.md)
@y
The integration involves deploying a Docker Scout Artifactory agent that polls
for new images, performs analysis, and uploads results to Docker Scout, all
while preserving the integrity of image data. Learn more in the [Artifactory
integration documentation](./integrations/registry/artifactory.md)
@z

@x
#### Known limitations
@y
#### Known limitations
@z

@x
- Image analysis only works for Linux images
- Docker Scout can't process images larger than 12GB in compressed size
- Creating an image SBOM (part of image analysis) has a timeout limit of 4 minutes
@y
- Image analysis only works for Linux images
- Docker Scout can't process images larger than 12GB in compressed size
- Creating an image SBOM (part of image analysis) has a timeout limit of 4 minutes
@z
