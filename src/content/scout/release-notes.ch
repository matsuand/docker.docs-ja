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
## 2023-10-04
@y
## 2023-10-04
@z

@x
This marks the General Availability (GA) release of Docker Scout.
@y
This marks the General Availability (GA) release of Docker Scout.
@z

@x
### New
@y
### New
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
### Known limitations
@y
### Known limitations
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
