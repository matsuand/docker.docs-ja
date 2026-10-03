%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Create a Docker organization
linkTitle: Create
@y
title: Create a Docker organization
linkTitle: Create
@z

@x
description: Create a Docker organization and choose its namespace and plan.
keywords:
  - create Docker organization
  - organization namespace
  - organization name
  - Docker Team
  - Docker Business
  - Docker Home
@y
description: Create a Docker organization and choose its namespace and plan.
keywords:
  - create Docker organization
  - organization namespace
  - organization name
  - Docker Team
  - Docker Business
  - Docker Home
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
Create an organization to group members and teams under one namespace and
one subscription. Your Docker ID stays an individual account. To use an
existing Docker ID as the namespace, see
[Convert a Docker account to an organization](/manuals/accounts/organization/setup/convert-account.md).
@y
Create an organization to group members and teams under one namespace and
one subscription. Your Docker ID stays an individual account. To use an
existing Docker ID as the namespace, see
[Convert a Docker account to an organization](manuals/accounts/organization/setup/convert-account.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You need a [Docker ID](/manuals/accounts/_index.md) before you create an
organization.
@y
You need a [Docker ID](manuals/accounts/_index.md) before you create an
organization.
@z

@x
> [!TIP]
>
> Review [Docker subscriptions and features](https://www.docker.com/pricing?ref=Docs&refAction=DocsAdminOrgs)
> before you choose a plan.
@y
> [!TIP]
>
> Review [Docker subscriptions and features](https://www.docker.com/pricing?ref=Docs&refAction=DocsAdminOrgs)
> before you choose a plan.
@z

@x
## Create an organization
@y
## Create an organization
@z

@x
When you create a new organization, you must select a Docker plan,
enter organization details, and verify billing details.
@y
When you create a new organization, you must select a Docker plan,
enter organization details, and verify billing details.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select
   **Create new organization** at the bottom of the organization list.
1. On **Plan**, choose a subscription, a billing cycle, and the number of
   seats. Select **Continue to profile**.
1. On **Organization**, enter the details for the new organization.
   - If you already belong to one or more organizations, this step opens
     as **Choose an organization**, which applies the subscription to an
     existing organization.
   - Select **Create an organization** to make a new one instead. The
     picker is replaced by the **Organization namespace** and
     **Organization name** fields.
   - For what each field means, see
     [Names versus namespaces](/manuals/accounts/organization/setup/_index.md#names-versus-namespaces).
1. Select **Continue to billing**.
1. On **Billing**, enter billing information and select
   **Continue to payment**.
1. On **Payment**, enter payment details and select **Purchase**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select
   **Create new organization** at the bottom of the organization list.
1. On **Plan**, choose a subscription, a billing cycle, and the number of
   seats. Select **Continue to profile**.
1. On **Organization**, enter the details for the new organization.
   - If you already belong to one or more organizations, this step opens
     as **Choose an organization**, which applies the subscription to an
     existing organization.
   - Select **Create an organization** to make a new one instead. The
     picker is replaced by the **Organization namespace** and
     **Organization name** fields.
   - For what each field means, see
     [Names versus namespaces](manuals/accounts/organization/setup/_index.md#names-versus-namespaces).
1. Select **Continue to billing**.
1. On **Billing**, enter billing information and select
   **Continue to payment**.
1. On **Payment**, enter payment details and select **Purchase**.
@z

@x
You can now view your new organization.
@y
You can now view your new organization.
@z

@x
## View an organization
@y
## View an organization
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select your organization.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select your organization.
@z

@x
Docker Home lists the options you use to configure the organization.
@y
Docker Home lists the options you use to configure the organization.
@z

@x
## Merge organizations
@y
## Merge organizations
@z

@x
> [!WARNING]
>
> Merge organizations at the end of your billing cycle. When you merge an
> organization and downgrade another, you lose seats on the downgraded
> organization. Docker doesn't offer refunds for downgrades.
@y
> [!WARNING]
>
> Merge organizations at the end of your billing cycle. When you merge an
> organization and downgrade another, you lose seats on the downgraded
> organization. Docker doesn't offer refunds for downgrades.
@z

@x
If you have multiple organizations that you want to merge into one:
@y
If you have multiple organizations that you want to merge into one:
@z

@x
1. Based on the number of seats from the secondary organization,
   [purchase additional seats](../manage/manage-seats.md) for the primary
   organization you want to keep.
1. Add users to the primary organization and remove them from the
   secondary organization.
1. Move your data, including repositories.
1. After the users and data are on the primary organization,
   [downgrade](../../../subscription-billing/plans/docker.md#cancel-a-docker-plan)
   the secondary account to a free subscription. Docker doesn't offer
   refunds for a downgrade in the middle of a billing cycle.
@y
1. Based on the number of seats from the secondary organization,
   [purchase additional seats](../manage/manage-seats.md) for the primary
   organization you want to keep.
1. Add users to the primary organization and remove them from the
   secondary organization.
1. Move your data, including repositories.
1. After the users and data are on the primary organization,
   [downgrade](../../../subscription-billing/plans/docker.md#cancel-a-docker-plan)
   the secondary account to a free subscription. Docker doesn't offer
   refunds for a downgrade in the middle of a billing cycle.
@z

@x
If your organization has a Docker Business subscription with a purchase
order, contact Support or your account manager at Docker.
@y
If your organization has a Docker Business subscription with a purchase
order, contact Support or your account manager at Docker.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Onboard your organization](/manuals/accounts/organization/setup/onboard.md)
- [Manage organization members](/manuals/accounts/organization/manage/members.md)
@y
- [Onboard your organization](manuals/accounts/organization/setup/onboard.md)
- [Manage organization members](manuals/accounts/organization/manage/members.md)
@z
