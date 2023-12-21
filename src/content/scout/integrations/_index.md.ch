%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to setup Docker Scout with other systems.
keywords: supply chain, security, integrations, registries, ci, environments
title: Integrating Docker Scout with other systems
---
@y
---
description: How to setup Docker Scout with other systems.
keywords: supply chain, security, integrations, registries, ci, environments
title: Integrating Docker Scout with other systems
---
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
The following container registry integrations are available:
@y
The following container registry integrations are available:
@z

@x
- [Artifactory](./registry/artifactory.md)
- [Amazon Elastic Container Registry](./registry/ecr.md)
- [Azure Container Registry](./registry/acr.md) {{< badge color=violet text="Early Access" >}}
@y
- [Artifactory](./registry/artifactory.md)
- [Amazon Elastic Container Registry](./registry/ecr.md)
- [Azure Container Registry](./registry/acr.md) {{< badge color=violet text="Early Access" >}}
@z

@x
### Continuous Integration
@y
### Continuous Integration
@z

@x
Integrating Docker Scout with Continuous Integration (CI) systems is a great
way to get instant, automatic feedback about your security posture in your inner
loop. Analysis running in CI also gets the benefit of additional context that's
useful for getting even more insights.
@y
Integrating Docker Scout with Continuous Integration (CI) systems is a great
way to get instant, automatic feedback about your security posture in your inner
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
The following environment monitoring integrations are available
@y
The following environment monitoring integrations are available
@z

@x
- [Sysdig](./environment/sysdig.md)
@y
- [Sysdig](./environment/sysdig.md)
@z

@x
For more information about environment integrations, see
[Environments](./environment/index.md).
@y
For more information about environment integrations, see
[Environments](./environment/index.md).
@z

@x
### Code quality
@y
### Code quality
@z

@x
Integrating Docker Scout with code analysis tools enables quality checks
directly on source code, helping you keep track of bugs, security issues, test
coverage, and more. In addition to image analysis and environment monitoring,
code quality gates let you shift left your supply chain management with Docker
Scout.
@y
Integrating Docker Scout with code analysis tools enables quality checks
directly on source code, helping you keep track of bugs, security issues, test
coverage, and more. In addition to image analysis and environment monitoring,
code quality gates let you shift left your supply chain management with Docker
Scout.
@z

@x
Once you enable a code quality integration, Docker Scout includes the code
quality assessments as policy evaluation results for the repositories where
you've enabled the integration.
@y
Once you enable a code quality integration, Docker Scout includes the code
quality assessments as policy evaluation results for the repositories where
you've enabled the integration.
@z

@x
The following code quality integrations are available:
@y
The following code quality integrations are available:
@z

@x
- [SonarQube](sonarqube.md)
@y
- [SonarQube](sonarqube.md)
@z
