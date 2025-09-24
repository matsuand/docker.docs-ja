%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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
{{% include "new-plans.md" %}}
@y
{{% include "new-plans.md" %}}
@z

@x
> [!IMPORTANT]
>
> As of December 10, 2024, Enhanced Service Account add-ons are no longer
> available. Existing Service Account agreements will be honored until their
> current term expires, but new purchases or renewals of Enhanced Service
> Account add-ons are no longer available and customers must renew under a new
> subscription.
>
> Docker recommends transitioning to [Organization Access Tokens
> (OATs)](/manuals/enterprise/security/access-tokens.md), which can provide similar
> functionality.
@y
> [!IMPORTANT]
>
> As of December 10, 2024, Enhanced Service Account add-ons are no longer
> available. Existing Service Account agreements will be honored until their
> current term expires, but new purchases or renewals of Enhanced Service
> Account add-ons are no longer available and customers must renew under a new
> subscription.
>
> Docker recommends transitioning to [Organization Access Tokens
> (OATs)](manuals/enterprise/security/access-tokens.md), which can provide similar
> functionality.
@z

@x
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and don't share Docker IDs with the members in the organization. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@y
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and don't share Docker IDs with the members in the organization. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@z

@x
## Enhanced Service Account add-on tiers
@y
## Enhanced Service Account add-on tiers
@z

@x
Refer to the following table for details on the Enhanced Service Account add-ons:
@y
Refer to the following table for details on the Enhanced Service Account add-ons:
@z

@x
| Tier | Pull Rates Per Day\* |
| ------ | ------ |
| 1 | 5,000-10,000 |
| 2 | 10,000-25,000 |
| 3 | 25,000-50,000 |
| 4 | 50,000-100,000 |
| 5 | 100,000+ |
@y
| Tier | Pull Rates Per Day\* |
| ------ | ------ |
| 1 | 5,000-10,000 |
| 2 | 10,000-25,000 |
| 3 | 25,000-50,000 |
| 4 | 50,000-100,000 |
| 5 | 100,000+ |
@z

@x
<sub>*The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees. Reports on consumption are available upon request.<sub>
@y
<sub>*The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees. Reports on consumption are available upon request.<sub>
@z
