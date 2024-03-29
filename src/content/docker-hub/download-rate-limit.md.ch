%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how download rate limits for image pulls on Docker Hub work
keywords: Docker Hub, pulls, download, limit,
title: Docker Hub rate limit
---
@y
---
description: Learn how download rate limits for image pulls on Docker Hub work
keywords: Docker Hub, pulls, download, limit,
title: Docker Hub rate limit
---
@z

@x
## What's the download rate limit on Docker Hub?
@y
## What's the download rate limit on Docker Hub?
@z

@x
Docker Hub limits the number of Docker image downloads, or pulls, based on the account type of the user pulling the image. Pull rate limits are based on individual IP address.
@y
Docker Hub limits the number of Docker image downloads, or pulls, based on the account type of the user pulling the image. Pull rate limits are based on individual IP address.
@z

@x
| User type | Rate limit |
| --------- | ---------- |
| Anonymous users | 100 pulls per 6 hours per IP address |
| [Authenticated users](#how-do-i-authenticate-pull-requests)| 200 pulls per 6 hour period |
| Users with a paid [Docker subscription](https://www.docker.com/pricing) | Up to 5000 pulls per day |
@y
| User type | Rate limit |
| --------- | ---------- |
| Anonymous users | 100 pulls per 6 hours per IP address |
| [Authenticated users](#how-do-i-authenticate-pull-requests)| 200 pulls per 6 hour period |
| Users with a paid [Docker subscription](https://www.docker.com/pricing) | Up to 5000 pulls per day |
@z

@x
If you require a higher number of pulls, you can also buy an [Enhanced Service Account add-on](service-accounts.md#enhanced-service-account-add-on-pricing).
@y
If you require a higher number of pulls, you can also buy an [Enhanced Service Account add-on](service-accounts.md#enhanced-service-account-add-on-pricing).
@z

@x
## Definition of limits
@y
## Definition of limits
@z

@x
A user's limit is equal to the highest entitlement of their
personal account or any organization they belong to. To take 
advantage of this, you must sign in to 
[Docker Hub](https://hub.docker.com/) 
as an authenticated user. For more information, see
[How do I authenticate pull requests](#how-do-i-authenticate-pull-requests). 
Unauthenticated (anonymous) users will have the limits enforced via IP.
@y
A user's limit is equal to the highest entitlement of their
personal account or any organization they belong to. To take 
advantage of this, you must sign in to 
[Docker Hub](https://hub.docker.com/) 
as an authenticated user. For more information, see
[How do I authenticate pull requests](#how-do-i-authenticate-pull-requests). 
Unauthenticated (anonymous) users will have the limits enforced via IP.
@z

@x
- Pulls are accounted to the user doing the pull, not to the owner of the image.
- A pull request is defined as up to two `GET` requests on registry 
manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a 
single manifest request.
- A pull request for a multi-arch image makes two 
manifest requests. 
- `HEAD` requests aren't counted.
- Some images are unlimited through our [Docker Sponsored Open Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/) and [Docker Verified Publisher](https://www.docker.com/partners/programs) programs.
@y
- Pulls are accounted to the user doing the pull, not to the owner of the image.
- A pull request is defined as up to two `GET` requests on registry 
manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a 
single manifest request.
- A pull request for a multi-arch image makes two 
manifest requests. 
- `HEAD` requests aren't counted.
- Some images are unlimited through our [Docker Sponsored Open Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/) and [Docker Verified Publisher](https://www.docker.com/partners/programs) programs.
@z

@x
## How do I know my pull requests are being limited?
@y
## How do I know my pull requests are being limited?
@z

@x
When you issue a pull request and you are over the limit, Docker Hub returns a `429` response code with the following body when the manifest is requested:
@y
When you issue a pull request and you are over the limit, Docker Hub returns a `429` response code with the following body when the manifest is requested:
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
## How can I check my current rate?
@y
## How can I check my current rate?
@z

@x
Valid API requests to Hub usually include the following rate limit headers in the response:
@y
Valid API requests to Hub usually include the following rate limit headers in the response:
@z

@x
```text
ratelimit-limit    
ratelimit-remaining
docker-ratelimit-source
```
@y
```text
ratelimit-limit    
ratelimit-remaining
docker-ratelimit-source
```
@z

@x
These headers are returned on both GET and HEAD requests.
@y
These headers are returned on both GET and HEAD requests.
@z

@x
>**Note**
>
>Using GET emulates a real pull and counts towards the limit. Using HEAD won't. To check your limits, you need `curl`, `grep`, and `jq` installed.
@y
>**Note**
>
>Using GET emulates a real pull and counts towards the limit. Using HEAD won't. To check your limits, you need `curl`, `grep`, and `jq` installed.
@z

@x
To get a token anonymously, if you are pulling anonymously:
@y
To get a token anonymously, if you are pulling anonymously:
@z

@x
```console
$ TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@y
```console
$ TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@z

@x
To get a token with a user account, if you are authenticated (insert your username and password in the following command):
@y
To get a token with a user account, if you are authenticated (insert your username and password in the following command):
@z

@x
```console
$ TOKEN=$(curl --user 'username:password' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@y
```console
$ TOKEN=$(curl --user 'username:password' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@z

@x
Then to get the headers showing your limits, run the following:
@y
Then to get the headers showing your limits, run the following:
@z

@x
```console
$ curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest
```
@y
```console
$ curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest
```
@z

@x
Which should return the following headers:
@y
Which should return the following headers:
@z

@x
```http
ratelimit-limit: 100;w=21600
ratelimit-remaining: 76;w=21600
docker-ratelimit-source: 192.0.2.1
```
@y
```http
ratelimit-limit: 100;w=21600
ratelimit-remaining: 76;w=21600
docker-ratelimit-source: 192.0.2.1
```
@z

@x
In the previous example, the pull limit is 100 pulls per 21600 seconds (6 hours), and there are 76 pulls remaining.
@y
In the previous example, the pull limit is 100 pulls per 21600 seconds (6 hours), and there are 76 pulls remaining.
@z

@x
### I don't see any RateLimit headers
@y
### I don't see any RateLimit headers
@z

@x
If you don't see any RateLimit header, it could be because the image or your IP is unlimited in partnership with a publisher, provider, or an open-source organization. It could also mean that the user you are pulling as is part of a paid Docker plan. Pulling that image won’t count toward pull limits if you don’t see these headers. However, users with a paid Docker subscription pulling more than 5000 times daily require a [Service Account](../docker-hub/service-accounts.md) subscription.
@y
If you don't see any RateLimit header, it could be because the image or your IP is unlimited in partnership with a publisher, provider, or an open-source organization. It could also mean that the user you are pulling as is part of a paid Docker plan. Pulling that image won’t count toward pull limits if you don’t see these headers. However, users with a paid Docker subscription pulling more than 5000 times daily require a [Service Account](../docker-hub/service-accounts.md) subscription.
@z

@x
## I'm being limited to a lower rate even though I have a paid Docker subscription
@y
## I'm being limited to a lower rate even though I have a paid Docker subscription
@z

@x
To take advantage of the higher limits included in a paid Docker subscription, you must [authenticate pulls](#how-do-i-authenticate-pull-requests) with your user account.
@y
To take advantage of the higher limits included in a paid Docker subscription, you must [authenticate pulls](#how-do-i-authenticate-pull-requests) with your user account.
@z

@x
A Pro, Team, or a Business tier doesn't increase limits on your images for other users. See Docker's [Open Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/), [Publisher](https://www.docker.com/partners/programs), or [Large Organization](https://www.docker.com/pricing) offerings.
@y
A Pro, Team, or a Business tier doesn't increase limits on your images for other users. See Docker's [Open Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/), [Publisher](https://www.docker.com/partners/programs), or [Large Organization](https://www.docker.com/pricing) offerings.
@z

@x
## How do I authenticate pull requests?
@y
## How do I authenticate pull requests?
@z

@x
The following section contains information on how to sign in to Docker Hub to authenticate pull requests.
@y
The following section contains information on how to sign in to Docker Hub to authenticate pull requests.
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
If you are using Docker Desktop, you can sign in to Docker Hub from the Docker Desktop menu.
@y
If you are using Docker Desktop, you can sign in to Docker Hub from the Docker Desktop menu.
@z

@x
Select **Sign in / Create Docker ID** from the Docker Desktop menu and follow the on-screen instructions to complete the sign-in process.
@y
Select **Sign in / Create Docker ID** from the Docker Desktop menu and follow the on-screen instructions to complete the sign-in process.
@z

@x
### Docker Engine
@y
### Docker Engine
@z

@x
If you're using a standalone version of Docker Engine, run the `docker login` command from a terminal to authenticate with Docker Hub. For information on how to use the command, see [docker login](../reference/cli/docker/login.md).
@y
If you're using a standalone version of Docker Engine, run the `docker login` command from a terminal to authenticate with Docker Hub. For information on how to use the command, see [docker login](../reference/cli/docker/login.md).
@z

@x
### Docker Swarm
@y
### Docker Swarm
@z

@x
If you're running Docker Swarm, you must use the `-- with-registry-auth` flag to authenticate with Docker Hub. For more information, see [Create a service](../reference/cli/docker/service/create.md/#create-a-service). If you are using a Docker Compose file to deploy an application stack, see [docker stack deploy](../reference/cli/docker/stack/deploy.md).
@y
If you're running Docker Swarm, you must use the `-- with-registry-auth` flag to authenticate with Docker Hub. For more information, see [Create a service](../reference/cli/docker/service/create.md/#create-a-service). If you are using a Docker Compose file to deploy an application stack, see [docker stack deploy](../reference/cli/docker/stack/deploy.md).
@z

@x
### GitHub Actions
@y
### GitHub Actions
@z

@x
If you're using GitHub Actions to build and push Docker images to Docker Hub, see [login action](https://github.com/docker/login-action#dockerhub). If you are using another Action, you must add your username and access token in a similar way for authentication.
@y
If you're using GitHub Actions to build and push Docker images to Docker Hub, see [login action](https://github.com/docker/login-action#dockerhub). If you are using another Action, you must add your username and access token in a similar way for authentication.
@z

@x
### Kubernetes
@y
### Kubernetes
@z

@x
If you're running Kubernetes, follow the instructions in [Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) for information on authentication.
@y
If you're running Kubernetes, follow the instructions in [Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) for information on authentication.
@z

@x
### Third-party platforms
@y
### Third-party platforms
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
## Other limits
@y
## Other limits
@z

@x
Docker Hub also has an overall rate limit to protect the application 
and infrastructure. This limit applies to all requests to Hub 
properties including web pages, APIs, and image pulls. The limit is 
applied per-IP, and while the limit changes over time depending on load
and other factors, it's in the order of thousands of requests per 
minute. The overall rate limit applies to all users equally
regardless of account level.
@y
Docker Hub also has an overall rate limit to protect the application 
and infrastructure. This limit applies to all requests to Hub 
properties including web pages, APIs, and image pulls. The limit is 
applied per-IP, and while the limit changes over time depending on load
and other factors, it's in the order of thousands of requests per 
minute. The overall rate limit applies to all users equally
regardless of account level.
@z

@x
You can differentiate between these limits by looking at the error 
code. The "overall limit" returns a simple `429 Too Many Requests` 
response. The pull limit returns a longer error message that
includes a link to this page.
@y
You can differentiate between these limits by looking at the error 
code. The "overall limit" returns a simple `429 Too Many Requests` 
response. The pull limit returns a longer error message that
includes a link to this page.
@z
