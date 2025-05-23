%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Learn about pull usage and limits for Docker Hub.
keywords: Docker Hub, pulls, usage, limit
title: Docker Hub pull usage and limits
linkTitle: Pulls
@y
description: Learn about pull usage and limits for Docker Hub.
keywords: Docker Hub, pulls, usage, limit
title: Docker Hub pull usage and limits
linkTitle: Pulls
@z

@x
Unauthenticated and Docker Personal users are subject to a 6-hour pull rate limit
on Docker Hub. In contrast, Docker Pro, Team, and Business users benefit from
an unlimited pull rate.
@y
Unauthenticated and Docker Personal users are subject to a 6-hour pull rate limit
on Docker Hub. In contrast, Docker Pro, Team, and Business users benefit from
an unlimited pull rate.
@z

@x
The following pull usage and limits apply based on your subscription, subject to
fair use:
@y
The following pull usage and limits apply based on your subscription, subject to
fair use:
@z

@x
| User type                | Pull rate limit per 6 hours             |
|--------------------------|-----------------------------------------|
| Business (authenticated) | Unlimited                               |
| Team (authenticated)     | Unlimited                               |
| Pro (authenticated)      | Unlimited                               |
| Personal (authenticated) | 200                                     |
| Unauthenticated Users    | 100 per IPv4 address or IPv6 /64 subnet |
@y
| User type                | Pull rate limit per 6 hours             |
|--------------------------|-----------------------------------------|
| Business (authenticated) | Unlimited                               |
| Team (authenticated)     | Unlimited                               |
| Pro (authenticated)      | Unlimited                               |
| Personal (authenticated) | 200                                     |
| Unauthenticated Users    | 100 per IPv4 address or IPv6 /64 subnet |
@z

@x
## Pull definition
@y
## Pull definition
@z

@x
A pull is defined as the following:
@y
A pull is defined as the following:
@z

@x
 - A Docker pull includes both a version check and any download that
   occurs as a result of the pull. Depending on the client, a `docker pull` can
   verify the existence of an image or tag without downloading it by performing
   a version check.
 - Version checks do not count towards usage pricing.
 - A pull for a normal image makes one pull for a [single
   manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md).
 - A pull for a multi-arch image will count as one pull for each
   different architecture.
@y
 - A Docker pull includes both a version check and any download that
   occurs as a result of the pull. Depending on the client, a `docker pull` can
   verify the existence of an image or tag without downloading it by performing
   a version check.
 - Version checks do not count towards usage pricing.
 - A pull for a normal image makes one pull for a [single
   manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md).
 - A pull for a multi-arch image will count as one pull for each
   different architecture.
@z

@x
## Pull attribution
@y
## Pull attribution
@z

@x
Pulls from authenticated users can be attributed to either a personal or an
[organization namespace](/manuals/admin/faqs/general-faqs.md#whats-an-organization-name-or-namespace).
@y
Pulls from authenticated users can be attributed to either a personal or an
[organization namespace](manuals/admin/faqs/general-faqs.md#whats-an-organization-name-or-namespace).
@z

@x
Attribution is based on the following:
@y
Attribution is based on the following:
@z

@x
- Private pulls: Pulls for private repositories are attributed to the
  repository's namespace owner.
- Public pulls: When pulling images from a public repository, attribution is
  determined based on domain affiliation and organization membership.
- Verified domain ownership: When pulling an image from an account linked to a
  verified domain, the attribution is set to be the owner of that
  [domain](/manuals/security/faqs/single-sign-on/domain-faqs.md).
- Single organization membership:
   - If the owner of the verified domain is a company and the user is part of
     only one organization within that
     [company](../../admin/faqs/company-faqs.md#what-features-are-supported-at-the-company-level),
     the pull is attributed to that specific organization.
   - If the user is part of only one organization, the pull is attributed to
     that specific organization.
- Multiple organization memberships: If the user is part of multiple
  organizations under the company, the pull is attributed to the user's personal
  namespace.
@y
- Private pulls: Pulls for private repositories are attributed to the
  repository's namespace owner.
- Public pulls: When pulling images from a public repository, attribution is
  determined based on domain affiliation and organization membership.
- Verified domain ownership: When pulling an image from an account linked to a
  verified domain, the attribution is set to be the owner of that
  [domain](manuals/security/faqs/single-sign-on/domain-faqs.md).
- Single organization membership:
   - If the owner of the verified domain is a company and the user is part of
     only one organization within that
     [company](../../admin/faqs/company-faqs.md#what-features-are-supported-at-the-company-level),
     the pull is attributed to that specific organization.
   - If the user is part of only one organization, the pull is attributed to
     that specific organization.
- Multiple organization memberships: If the user is part of multiple
  organizations under the company, the pull is attributed to the user's personal
  namespace.
@z

@x
### Authentication
@y
### Authentication
@z

@x
To ensure correct attribution of your pulls, you must authenticate with Docker
Hub. The following sections provide information on how to sign in to Docker Hub
to authenticate your pulls.
@y
To ensure correct attribution of your pulls, you must authenticate with Docker
Hub. The following sections provide information on how to sign in to Docker Hub
to authenticate your pulls.
@z

@x
#### Docker Desktop
@y
#### Docker Desktop
@z

@x
If you are using Docker Desktop, you can sign in to Docker Hub from the Docker
Desktop menu.
@y
If you are using Docker Desktop, you can sign in to Docker Hub from the Docker
Desktop menu.
@z

@x
Select **Sign in / Create Docker ID** from the Docker Desktop menu and follow
the on-screen instructions to complete the sign-in process.
@y
Select **Sign in / Create Docker ID** from the Docker Desktop menu and follow
the on-screen instructions to complete the sign-in process.
@z

@x
#### Docker Engine
@y
#### Docker Engine
@z

@x
If you're using a standalone version of Docker Engine, run the `docker login`
command from a terminal to authenticate with Docker Hub. For information on how
to use the command, see [docker login](/reference/cli/docker/login.md).
@y
If you're using a standalone version of Docker Engine, run the `docker login`
command from a terminal to authenticate with Docker Hub. For information on how
to use the command, see [docker login](reference/cli/docker/login.md).
@z

@x
#### Docker Swarm
@y
#### Docker Swarm
@z

@x
If you're running Docker Swarm, you must use the `--with-registry-auth` flag to
authenticate with Docker Hub. For more information, see [Create a
service](/reference/cli/docker/service/create.md#with-registry-auth). If you
are using a Docker Compose file to deploy an application stack, see [docker
stack deploy](/reference/cli/docker/stack/deploy.md).
@y
If you're running Docker Swarm, you must use the `--with-registry-auth` flag to
authenticate with Docker Hub. For more information, see [Create a
service](reference/cli/docker/service/create.md#with-registry-auth). If you
are using a Docker Compose file to deploy an application stack, see [docker
stack deploy](reference/cli/docker/stack/deploy.md).
@z

@x
#### GitHub Actions
@y
#### GitHub Actions
@z

@x
If you're using GitHub Actions to build and push Docker images to Docker Hub,
see [login action](https://github.com/docker/login-action#dockerhub). If you are
using another Action, you must add your username and access token in a similar
way for authentication.
@y
If you're using GitHub Actions to build and push Docker images to Docker Hub,
see [login action](https://github.com/docker/login-action#dockerhub). If you are
using another Action, you must add your username and access token in a similar
way for authentication.
@z

@x
#### Kubernetes
@y
#### Kubernetes
@z

@x
If you're running Kubernetes, follow the instructions in [Pull an Image from a
Private
Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)
for information on authentication.
@y
If you're running Kubernetes, follow the instructions in [Pull an Image from a
Private
Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)
for information on authentication.
@z

@x
#### Third-party platforms
@y
#### Third-party platforms
@z

@x
If you're using any third-party platforms, follow your provider’s instructions on using registry authentication.
@y
If you're using any third-party platforms, follow your provider’s instructions on using registry authentication.
@z

@x
- [Artifactory](https://www.jfrog.com/confluence/display/JFROG/Advanced+Settings#AdvancedSettings-RemoteCredentials)
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/)
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html)
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#sep-docreg)
- [Chipper CI](https://docs.chipperci.com/builds/docker/#rate-limit-auth)
- [CircleCI](https://circleci.com/docs/2.0/private-images/)
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/)
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images)
- [GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/#authenticate-with-the-container-registry)
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker)
- [TeamCity](https://www.jetbrains.com/help/teamcity/integrating-teamcity-with-docker.html#Conforming+with+Docker+download+rate+limits)
@y
- [Artifactory](https://www.jfrog.com/confluence/display/JFROG/Advanced+Settings#AdvancedSettings-RemoteCredentials)
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/)
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html)
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#sep-docreg)
- [Chipper CI](https://docs.chipperci.com/builds/docker/#rate-limit-auth)
- [CircleCI](https://circleci.com/docs/2.0/private-images/)
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/)
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images)
- [GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/#authenticate-with-the-container-registry)
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker)
- [TeamCity](https://www.jetbrains.com/help/teamcity/integrating-teamcity-with-docker.html#Conforming+with+Docker+download+rate+limits)
@z

@x
## View monthly pulls and included usage
@y
## View monthly pulls and included usage
@z

@x
You can view your monthly pulls on the [Usage page](https://hub.docker.com/usage/pulls) in Docker Hub.
@y
You can view your monthly pulls on the [Usage page](https://hub.docker.com/usage/pulls) in Docker Hub.
@z

@x
On that page, you can also send a report to your email that contains a comma
separated file with the following detailed information.
@y
On that page, you can also send a report to your email that contains a comma
separated file with the following detailed information.
@z

@x
| CSV column           | Definition                                                                                                                                                                                                         | Usage guidance                                                                                                                                                                      |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `datehour`           | The date and hour (`yyyy/mm/dd/hh`) of the pull that resulted in the data transfer.                                                                                                                                | This helps in identifying peak usage times and patterns.                                                                                                                            |
| `user_name`          | The Docker ID of the user that pulled the image                                                                                                                                                                    | This lets organization owners track data consumption per user and manage resources effectively.                                                                                     |
| `repository`         | The name of the repository of the image that was pulled.                                                                                                                                                           | This lets you identify which repositories are most frequently accessed and consume most of the data transfer.                                                                       |
| `access_token_name`  | Name of the access token that was used for authentication with Docker CLI. `generated` tokens are automatically generated by the Docker client when a user signs in.                                               | Personal access tokens are usually used to authenticate automated tools (Docker Desktop, CI/CD tools, etc.). This is useful for identifying which automated system issued the pull. |
| `ips`                | The IP address that was used to pull the image. This field is aggregated, so more than one IP address may appear, representing all the IPs used to pull an image within the same date and hour.                    | This helps you understand the origin of the data transfer, which is useful for diagnosing and identifying patterns in automated or manual pulls.                                    |
| `repository_privacy` | The privacy state of the image repository that was pulled. This can either be `public` or `private`.                                                                                                               | This distinguishes between public and private repositories to identify which data transfer threshold the pull impacts.                                                              |
| `tag`                | The tag for the image. The tag is only available if the pull included a tag.                                                                                                                                       | This helps in identifying the image. Tags are often used to identify specific versions or variants of an image.                                                                     |
| `digest`             | The unique image digest for the image.                                                                                                                                                                             | This helps in identifying the image.                                                                                                                                                |
| `version_checks`     | The number of version checks accumulated for the date and hour of each image repository. Depending on the client, a pull can do a version check to verify the existence of an image or tag without downloading it. | This helps identify the frequency of version checks, which you can use to analyze usage trends and potential unexpected behaviors.                                                  |
| `pulls`              | The number of pulls accumulated for the date and hour of each image repository.                                                                                                                                            | This helps identify the frequency of repository pulls, which you can use to analyze usage trends and potential unexpected behaviors.                                                |
@y
| CSV column           | Definition                                                                                                                                                                                                         | Usage guidance                                                                                                                                                                      |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `datehour`           | The date and hour (`yyyy/mm/dd/hh`) of the pull that resulted in the data transfer.                                                                                                                                | This helps in identifying peak usage times and patterns.                                                                                                                            |
| `user_name`          | The Docker ID of the user that pulled the image                                                                                                                                                                    | This lets organization owners track data consumption per user and manage resources effectively.                                                                                     |
| `repository`         | The name of the repository of the image that was pulled.                                                                                                                                                           | This lets you identify which repositories are most frequently accessed and consume most of the data transfer.                                                                       |
| `access_token_name`  | Name of the access token that was used for authentication with Docker CLI. `generated` tokens are automatically generated by the Docker client when a user signs in.                                               | Personal access tokens are usually used to authenticate automated tools (Docker Desktop, CI/CD tools, etc.). This is useful for identifying which automated system issued the pull. |
| `ips`                | The IP address that was used to pull the image. This field is aggregated, so more than one IP address may appear, representing all the IPs used to pull an image within the same date and hour.                    | This helps you understand the origin of the data transfer, which is useful for diagnosing and identifying patterns in automated or manual pulls.                                    |
| `repository_privacy` | The privacy state of the image repository that was pulled. This can either be `public` or `private`.                                                                                                               | This distinguishes between public and private repositories to identify which data transfer threshold the pull impacts.                                                              |
| `tag`                | The tag for the image. The tag is only available if the pull included a tag.                                                                                                                                       | This helps in identifying the image. Tags are often used to identify specific versions or variants of an image.                                                                     |
| `digest`             | The unique image digest for the image.                                                                                                                                                                             | This helps in identifying the image.                                                                                                                                                |
| `version_checks`     | The number of version checks accumulated for the date and hour of each image repository. Depending on the client, a pull can do a version check to verify the existence of an image or tag without downloading it. | This helps identify the frequency of version checks, which you can use to analyze usage trends and potential unexpected behaviors.                                                  |
| `pulls`              | The number of pulls accumulated for the date and hour of each image repository.                                                                                                                                            | This helps identify the frequency of repository pulls, which you can use to analyze usage trends and potential unexpected behaviors.                                                |
@z

@x
## View pull rate and limit
@y
## View pull rate and limit
@z

@x
The pull rate limit is calculated on a 6-hour basis. There is no pull rate
limit for users or automated systems with a paid subscription. Unauthenticated
and Docker Personal users using Docker Hub will experience rate limits on image
pulls.
@y
The pull rate limit is calculated on a 6-hour basis. There is no pull rate
limit for users or automated systems with a paid subscription. Unauthenticated
and Docker Personal users using Docker Hub will experience rate limits on image
pulls.
@z

@x
When you issue a pull and you are over the limit, Docker Hub returns a
`429` response code with the following body when the manifest is requested:
@y
When you issue a pull and you are over the limit, Docker Hub returns a
`429` response code with the following body when the manifest is requested:
@z

@x
```text
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@y
```text
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@z

@x
This error message appears in the Docker CLI or in the Docker Engine logs.
@y
This error message appears in the Docker CLI or in the Docker Engine logs.
@z

@x
To view your current pull rate and limit:
@y
To view your current pull rate and limit:
@z

@x
> [!NOTE]
>
> To check your limits, you need `curl`, `grep`, and `jq` installed.
@y
> [!NOTE]
>
> To check your limits, you need `curl`, `grep`, and `jq` installed.
@z

@x
1. Get a token.
@y
1. Get a token.
@z

@x
   - To get a token anonymously, if you are pulling anonymously:
@y
   - To get a token anonymously, if you are pulling anonymously:
@z

% snip command...

@x
   - To get a token with a user account, if you are authenticated, insert your
     username and password in the following command:
@y
   - To get a token with a user account, if you are authenticated, insert your
     username and password in the following command:
@z

% snip command...

@x
2. Get the headers that contain your limits. These headers are returned on both
   GET and HEAD requests. Using GET emulates a real pull and counts towards the
   limit. Using HEAD won't.
@y
2. Get the headers that contain your limits. These headers are returned on both
   GET and HEAD requests. Using GET emulates a real pull and counts towards the
   limit. Using HEAD won't.
@z

% snip command...

@x
3. Examine the headers. You should see the following headers.
@y
3. Examine the headers. You should see the following headers.
@z

% snip code...

@x
   In the previous example, the pull limit is 100 pulls per 21600 seconds (6
   hours), and there are 20 pulls remaining.
@y
   In the previous example, the pull limit is 100 pulls per 21600 seconds (6
   hours), and there are 20 pulls remaining.
@z

@x
   If you don't see any `ratelimit` header, it could be because the image or your IP
   is unlimited in partnership with a publisher, provider, or an open source
   organization. It could also mean that the user you are pulling as is part of a
   paid Docker plan. Pulling that image won't count toward pull rate limits if you
   don't see these headers.
@y
   If you don't see any `ratelimit` header, it could be because the image or your IP
   is unlimited in partnership with a publisher, provider, or an open source
   organization. It could also mean that the user you are pulling as is part of a
   paid Docker plan. Pulling that image won't count toward pull rate limits if you
   don't see these headers.
@z
