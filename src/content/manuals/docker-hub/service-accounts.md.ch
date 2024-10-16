%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Docker Service accounts
keywords: Docker, service, accounts, Docker Hub
title: Service accounts
@y
description: Docker Service accounts
keywords: Docker, service, accounts, Docker Hub
title: Service accounts
@z

@x
{{< include "new-plans.md" >}}
@y
{{< include "new-plans.md" >}}
@z

@x
> [!NOTE]
>
> Service accounts require a
> [Docker Team, or Business subscription](../subscription/_index.md).
>
> Docker recommends that you use organization access tokens instead of service
> accounts. For more details, see [Organization access
> tokens](/security/for-admins/access-tokens/).
@y
> [!NOTE]
>
> Service accounts require a
> [Docker Team, or Business subscription](../subscription/_index.md).
>
> Docker recommends that you use organization access tokens instead of service
> accounts. For more details, see [Organization access
> tokens](__SUBDIR__/security/for-admins/access-tokens/).
@z

@x
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and don't share Docker IDs with the members in the organization. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@y
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and don't share Docker IDs with the members in the organization. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@z

@x
> [!NOTE]
>
> All paid Docker subscriptions include up to 5000 pulls per day per authenticated user. If you require a higher number of pulls, you can purchase an Enhanced Service Account add-on.
@y
> [!NOTE]
>
> All paid Docker subscriptions include up to 5000 pulls per day per authenticated user. If you require a higher number of pulls, you can purchase an Enhanced Service Account add-on.
@z

@x
## Enhanced Service Account add-on pricing
@y
## Enhanced Service Account add-on pricing
@z

@x
Refer to the following table for details on the Enhanced Service Account add-on pricing:
@y
Refer to the following table for details on the Enhanced Service Account add-on pricing:
@z

@x
| Tier | Pull Rates Per Day* | Annual Fee |
| ------ | ------ | ------ |
| 1 | 5,000-10,000 | $9,950/yr |
| 2 | 10,000-25,000 | $17,950/yr |
| 3 | 25,000-50,000 | $32,950/yr |
| 4 | 50,000-100,000 | $58,950/yr |
| 5 | 100,000+ | [Contact Sales](https://www.docker.com/pricing/contact-sales/) |
@y
| Tier | Pull Rates Per Day* | Annual Fee |
| ------ | ------ | ------ |
| 1 | 5,000-10,000 | $9,950/yr |
| 2 | 10,000-25,000 | $17,950/yr |
| 3 | 25,000-50,000 | $32,950/yr |
| 4 | 50,000-100,000 | $58,950/yr |
| 5 | 100,000+ | [Contact Sales](https://www.docker.com/pricing/contact-sales/) |
@z

@x
<sub>*Once you establish the initial Tier, that's the minimum fee for the year. Annual commitment required. The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees. Reports on consumption are available upon request. At the end of the initial 1-year term, the appropriate Tier will be established for the following year.<sub>
@y
<sub>*Once you establish the initial Tier, that's the minimum fee for the year. Annual commitment required. The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees. Reports on consumption are available upon request. At the end of the initial 1-year term, the appropriate Tier will be established for the following year.<sub>
@z

@x
## How a pull is defined
@y
## How a pull is defined
@z

@x
- Pulls are accounted to the user doing the pull, not to the owner of the image.
- A pull request is defined as up to two `GET` requests on registry manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a single manifest request.
- A pull request for a multi-arch image makes two manifest requests. 
- `HEAD` requests aren't counted.
- Some images are unlimited through our [Docker Sponsored Open Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/) and [Docker Verified Publisher](https://www.docker.com/partners/programs) programs.
@y
- Pulls are accounted to the user doing the pull, not to the owner of the image.
- A pull request is defined as up to two `GET` requests on registry manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a single manifest request.
- A pull request for a multi-arch image makes two manifest requests. 
- `HEAD` requests aren't counted.
- Some images are unlimited through our [Docker Sponsored Open Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/) and [Docker Verified Publisher](https://www.docker.com/partners/programs) programs.
@z

@x
## Creating a new service account
@y
## Creating a new service account
@z

@x
To create a new service account for your Team account:
@y
To create a new service account for your Team account:
@z

@x
1. Create a new Docker ID.
2. Create a [team](manage-a-team.md) in your organization and grant it read-only access to your private repositories.
3. Add the new Docker ID to your [organization](orgs.md).
4. Add the new Docker ID  to the [team](manage-a-team.md) you created earlier.
5. Create a new [personal access token (PAT)](/security/for-developers/access-tokens/) from the user account and use it for CI.
@y
1. Create a new Docker ID.
2. Create a [team](manage-a-team.md) in your organization and grant it read-only access to your private repositories.
3. Add the new Docker ID to your [organization](orgs.md).
4. Add the new Docker ID  to the [team](manage-a-team.md) you created earlier.
5. Create a new [personal access token (PAT)](__SUBDIR__/security/for-developers/access-tokens/) from the user account and use it for CI.
@z

@x
> [!NOTE]
>
> If you want a read-only PAT just for your open-source repositories, or to access
official images and other public images, you don't have to grant any access permissions to the new Docker ID.
@y
> [!NOTE]
>
> If you want a read-only PAT just for your open-source repositories, or to access
official images and other public images, you don't have to grant any access permissions to the new Docker ID.
@z

@x
## Additional information
@y
## Additional information
@z

@x
Refer to the following topics for additional information:
@y
Refer to the following topics for additional information:
@z

@x
- [Mirroring Docker Hub](./mirror.md)
- [Docker pricing FAQs](https://www.docker.com/pricing/faq/)
@y
- [Mirroring Docker Hub](./mirror.md)
- [Docker pricing FAQs](https://www.docker.com/pricing/faq/)
@z
