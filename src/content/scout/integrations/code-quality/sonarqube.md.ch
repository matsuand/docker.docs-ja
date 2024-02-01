%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Integrate Docker Scout with SonarQube
description: Evaluate your images with the SonarQube quality gates defined in your projects
keywords: scout, supply chain, integration, code quality
---
@y
---
title: Integrate Docker Scout with SonarQube
description: Evaluate your images with the SonarQube quality gates defined in your projects
keywords: scout, supply chain, integration, code quality
---
@z

@x
The SonarQube integration enables Docker Scout to surface SonarQube quality
gate checks through Policy Evaluation, under a new [Quality gates passed
policy](../../policy/_index.md#quality-gates-passed).
@y
The SonarQube integration enables Docker Scout to surface SonarQube quality
gate checks through Policy Evaluation, under a new [Quality gates passed
policy](../../policy/_index.md#quality-gates-passed).
@z

@x
## How it works
@y
## How it works
@z

@x
This integration uses [SonarQube
webhooks](https://docs.sonarsource.com/sonarqube/latest/project-administration/webhooks/)
to notify Docker Scout of when a SonarQube project analysis has completed. When
the webhook is called, Docker Scout receives the analysis results, and stores
them in the database.
@y
This integration uses [SonarQube
webhooks](https://docs.sonarsource.com/sonarqube/latest/project-administration/webhooks/)
to notify Docker Scout of when a SonarQube project analysis has completed. When
the webhook is called, Docker Scout receives the analysis results, and stores
them in the database.
@z

@x
When you push a new image to a repository, Docker Scout evaluates the results
of the SonarQube analysis record corresponding to the image. Docker Scout uses
Git provenance metadata on the images, from  provenance attestations or an OCI
annotations, to link image repositories with SonarQube analysis results.
@y
When you push a new image to a repository, Docker Scout evaluates the results
of the SonarQube analysis record corresponding to the image. Docker Scout uses
Git provenance metadata on the images, from  provenance attestations or an OCI
annotations, to link image repositories with SonarQube analysis results.
@z

@x
> **Note**
>
> Docker Scout doesn't have access to historic SonarQube analysis records. Only
> analysis results recorded after the integration is enabled will be available
> to Docker Scout.
@y
> **Note**
>
> Docker Scout doesn't have access to historic SonarQube analysis records. Only
> analysis results recorded after the integration is enabled will be available
> to Docker Scout.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To integrate Docker Scout with SonarQube, ensure that:
@y
To integrate Docker Scout with SonarQube, ensure that:
@z

@x
- Your image repository is [integrated with Docker Scout](../_index.md#container-registries).
- Your images are built with [provenance attestations](../../../build/attestations/slsa-provenance.md),
  or the `org.opencontainers.image.revision` annotation,
  containing information about the Git repository.
@y
- Your image repository is [integrated with Docker Scout](../_index.md#container-registries).
- Your images are built with [provenance attestations](../../../build/attestations/slsa-provenance.md),
  or the `org.opencontainers.image.revision` annotation,
  containing information about the Git repository.
@z

@x
## Enable the SonarQube integration
@y
## Enable the SonarQube integration
@z

@x
1. Go to the [SonarQube integrations page](https://scout.docker.com/settings/integrations/sonarqube/)
   on the Docker Scout Dashboard.
2. In the **How to integrate** section, enter a configuration name for this
   integration. Docker Scout uses this label as a display name for the
   integration, and to name the webhook.
3. Select **Next**.
4. Enter the configuration details for your SonarQube instance. Docker Scout
   uses this information to create SonarQube webhook.
@y
1. Go to the [SonarQube integrations page](https://scout.docker.com/settings/integrations/sonarqube/)
   on the Docker Scout Dashboard.
2. In the **How to integrate** section, enter a configuration name for this
   integration. Docker Scout uses this label as a display name for the
   integration, and to name the webhook.
3. Select **Next**.
4. Enter the configuration details for your SonarQube instance. Docker Scout
   uses this information to create SonarQube webhook.
@z

@x
   In SonarQube, [generate a new **User token**](https://docs.sonarsource.com/sonarqube/latest/user-guide/user-account/generating-and-using-tokens/#generating-a-token).
   The token requires 'Administer' permission on the specified project, or
   global 'Administer' permission.
@y
   In SonarQube, [generate a new **User token**](https://docs.sonarsource.com/sonarqube/latest/user-guide/user-account/generating-and-using-tokens/#generating-a-token).
   The token requires 'Administer' permission on the specified project, or
   global 'Administer' permission.
@z

@x
   Enter the token, your SonarQube URL, and the ID of your SonarQube
   organization. The SonarQube organization is required if you're using
   SonarCloud.
@y
   Enter the token, your SonarQube URL, and the ID of your SonarQube
   organization. The SonarQube organization is required if you're using
   SonarCloud.
@z

@x
5. Select **Enable configuration**.
@y
5. Select **Enable configuration**.
@z

@x
   Docker Scout performs a connection test to verify that the provided details
   are correct, and that the token has the necessary permissions.
@y
   Docker Scout performs a connection test to verify that the provided details
   are correct, and that the token has the necessary permissions.
@z

@x
6. After a successful connection test, you're redirected to the SonarQube
   integration overview, which lists all your SonarQube integrations and their
   statuses.
@y
6. After a successful connection test, you're redirected to the SonarQube
   integration overview, which lists all your SonarQube integrations and their
   statuses.
@z

@x
From the integration overview page, you can go directly to the Quality gates
passed policy. This policy will have no results initially. To start seeing
evaluation results for this policy, trigger a new SonarQube analysis of your
project and push the corresponding image to a repository. For more information,
refer to the [Quality gates passed policy](../../policy/_index.md#quality-gates-passed).
@y
From the integration overview page, you can go directly to the Quality gates
passed policy. This policy will have no results initially. To start seeing
evaluation results for this policy, trigger a new SonarQube analysis of your
project and push the corresponding image to a repository. For more information,
refer to the [Quality gates passed policy](../../policy/_index.md#quality-gates-passed).
@z
