%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: How to set up Docker Scout with other systems.
keywords: supply chain, security, integrations, registries, ci, environments
title: Integrating Docker Scout with other systems
linkTitle: Integrations
@y
description: How to set up Docker Scout with other systems.
keywords: supply chain, security, integrations, registries, ci, environments
title: Integrating Docker Scout with other systems
linkTitle: Integrations
@z

@x
By default, Docker Scout integrates with your Docker organization and your
Docker Scout-enabled repositories on Docker Hub. You can integrate Docker Scout
with additional third-party systems to get access to even more insights,
including real-time information about you running workloads.
@y
By default, Docker Scout integrates with your Docker organization and your
Docker Scout-enabled repositories on Docker Hub. You can integrate Docker Scout
with additional third-party systems to get access to even more insights,
including real-time information about you running workloads.
@z

@x
## Integration categories
@y
## Integration categories
@z

@x
You'll get different insights depending on where and how you choose to integrate
Docker Scout.
@y
You'll get different insights depending on where and how you choose to integrate
Docker Scout.
@z

@x
### Container registries
@y
### Container registries
@z

@x
Integrating Docker Scout with third-party container
registries enables Docker Scout to run image analysis on those repositories,
so that you can get insights into the composition of those images even if they
aren't hosted on Docker Hub.
@y
Integrating Docker Scout with third-party container
registries enables Docker Scout to run image analysis on those repositories,
so that you can get insights into the composition of those images even if they
aren't hosted on Docker Hub.
@z

@x
Docker Scout integrates with any Docker/OCI-compliant registry using
[`docker scout watch`](./registry.md), including Amazon ECR, Azure
Container Registry, JFrog Artifactory, Harbor, and Sonatype Nexus.
@y
Docker Scout integrates with any Docker/OCI-compliant registry using
[`docker scout watch`](./registry.md), including Amazon ECR, Azure
Container Registry, JFrog Artifactory, Harbor, and Sonatype Nexus.
@z

@x
### Continuous Integration
@y
### Continuous Integration
@z

@x
Integrating Docker Scout with Continuous Integration (CI) systems is a great way
to get instant, automatic feedback about your security posture in your inner
loop. Analysis running in CI also gets the benefit of additional context that's
useful for getting even more insights.
@y
Integrating Docker Scout with Continuous Integration (CI) systems is a great way
to get instant, automatic feedback about your security posture in your inner
loop. Analysis running in CI also gets the benefit of additional context that's
useful for getting even more insights.
@z

@x
The following CI integrations are available:
@y
The following CI integrations are available:
@z

@x
- [GitHub Actions](./ci/gha.md)
- [GitLab](./ci/gitlab.md)
- [Microsoft Azure DevOps Pipelines](./ci/azure.md)
- [Circle CI](./ci/circle-ci.md)
- [Jenkins](./ci/jenkins.md)
@y
- [GitHub Actions](./ci/gha.md)
- [GitLab](./ci/gitlab.md)
- [Microsoft Azure DevOps Pipelines](./ci/azure.md)
- [Circle CI](./ci/circle-ci.md)
- [Jenkins](./ci/jenkins.md)
@z

@x
### Environment monitoring
@y
### Environment monitoring
@z

@x
Environment monitoring refers to integrating Docker Scout with your deployments.
This can give you information in real-time about your running container workloads.
@y
Environment monitoring refers to integrating Docker Scout with your deployments.
This can give you information in real-time about your running container workloads.
@z

@x
Integrating with environments lets you compare production workloads to other
versions, in your image repositories or in your other environments.
@y
Integrating with environments lets you compare production workloads to other
versions, in your image repositories or in your other environments.
@z

@x
The following environment monitoring integrations are available:
@y
The following environment monitoring integrations are available:
@z

@x
- [Generic CLI integration](./environment/cli.md)
@y
- [Generic CLI integration](./environment/cli.md)
@z

@x
For more information about environment integrations, see
[Environments](./environment/_index.md).
@y
For more information about environment integrations, see
[Environments](./environment/_index.md).
@z
