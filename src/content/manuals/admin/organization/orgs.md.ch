%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Create your organization
@y
title: Create your organization
@z

@x
description: Learn how to create an organization.
keywords: docker organizations, organization, create organization, docker teams, docker admin console, organization management
@y
description: Learn how to create an organization.
keywords: docker organizations, organization, create organization, docker teams, docker admin console, organization management
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
There are multiple ways to create an organization. You can either:
@y
There are multiple ways to create an organization. You can either:
@z

@x
- Create a new organization using the **Create Organization** option in the
Admin Console or Docker Hub
- Convert an existing user account to an organization
@y
- Create a new organization using the **Create Organization** option in the
Admin Console or Docker Hub
- Convert an existing user account to an organization
@z

@x
These procedures walk you through creating an organization from the Admin Console. 
@y
These procedures walk you through creating an organization from the Admin Console. 
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* Before you create an organization, you need a [Docker ID](/accounts/create-account/). 
* For prerequisites and detailed instructions on converting an existing user account to an organization, see
[Convert an account into an organization](/manuals/admin/organization/convert-account.md).
@y
* Before you create an organization, you need a [Docker ID](__SUBDIR__/accounts/create-account/). 
* For prerequisites and detailed instructions on converting an existing user account to an organization, see
[Convert an account into an organization](manuals/admin/organization/convert-account.md).
@z

@x
> [!TIP]
> Need a different plan for your team's needs? Review different [Docker subscriptions and features](https://www.docker.com/pricing/) to choose a subscription for your organization.
@y
> [!TIP]
> Need a different plan for your team's needs? Review different [Docker subscriptions and features](https://www.docker.com/pricing/) to choose a subscription for your organization.
@z

@x
## Create an organization
@y
## Create an organization
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and navigate to the bottom
of the organization list. Select **Create new organization**.
1. Choose a subscription for your organization, a billing cycle, and specify how many seats you need. See [Docker Pricing](https://www.docker.com/pricing/) for details on the features offered in the Team and Business subscription.
1. Select **Continue to profile**, then **Create an organization** to create a new organization.
1. Enter an **Organization namespace**. This is the official, unique name for
your organization in Docker Hub. 
   * It's not possible to change the name of the organization after you've created it.
   * Your Docker ID and organization can't share the same name. 
   * If you want to use your Docker ID as the organization name, then you must first [convert your account into an organization](/manuals/admin/organization/convert-account.md).
1. Enter your **Company name**. This is the full name of your company. 
   * Docker displays the company name on your organization page and in the details of any
   public images you publish. 
   * You can update the company name anytime by navigating to your organization's **Settings** page.
1. Select **Continue to billing** to continue, then enter your organization's billing information. Select **Continue to payment** to continue to the billing portal.
1. Provide your payment details and select **Purchase**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and navigate to the bottom
of the organization list. Select **Create new organization**.
1. Choose a subscription for your organization, a billing cycle, and specify how many seats you need. See [Docker Pricing](https://www.docker.com/pricing/) for details on the features offered in the Team and Business subscription.
1. Select **Continue to profile**, then **Create an organization** to create a new organization.
1. Enter an **Organization namespace**. This is the official, unique name for
your organization in Docker Hub. 
   * It's not possible to change the name of the organization after you've created it.
   * Your Docker ID and organization can't share the same name. 
   * If you want to use your Docker ID as the organization name, then you must first [convert your account into an organization](manuals/admin/organization/convert-account.md).
1. Enter your **Company name**. This is the full name of your company. 
   * Docker displays the company name on your organization page and in the details of any
   public images you publish. 
   * You can update the company name anytime by navigating to your organization's **Settings** page.
1. Select **Continue to billing** to continue, then enter your organization's billing information. Select **Continue to payment** to continue to the billing portal.
1. Provide your payment details and select **Purchase**.
@z

@x
You've now created an organization.
@y
You've now created an organization.
@z

@x
## View an organization
@y
## View an organization
@z

@x
To view an organization in the Admin Console:
@y
To view an organization in the Admin Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
organization.
1. From the left-hand navigation menu, select **Admin Console**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
organization.
1. From the left-hand navigation menu, select **Admin Console**.
@z

@x
The Admin Console contains many options that let you to
configure your organization.
@y
The Admin Console contains many options that let you to
configure your organization.
@z

@x
## Merge organizations
@y
## Merge organizations
@z

@x
> [!WARNING]
>
> If you are merging organizations, it is recommended to do so at the _end_ of
> your billing cycle. When you merge an organization and downgrade another, you
> will lose seats on your downgraded organization. Docker does not offer
> refunds for downgrades.
@y
> [!WARNING]
>
> If you are merging organizations, it is recommended to do so at the _end_ of
> your billing cycle. When you merge an organization and downgrade another, you
> will lose seats on your downgraded organization. Docker does not offer
> refunds for downgrades.
@z

@x
If you have multiple organizations that you want to merge into one, complete
the following steps:
@y
If you have multiple organizations that you want to merge into one, complete
the following steps:
@z

@x
1. Based on the number of seats from the secondary organization, [purchase additional seats](../../subscription/manage-seats.md) for the primary organization account that you want to keep.
1. Manually add users to the primary organization and remove existing users from the secondary organization.
1. Manually move over your data, including all repositories.
1. Once you're done moving all of your users and data, [downgrade](../../subscription/change.md) the secondary account to a free subscription. Note that Docker does not offer refunds for downgrading organizations mid-billing cycle.
@y
1. Based on the number of seats from the secondary organization, [purchase additional seats](../../subscription/manage-seats.md) for the primary organization account that you want to keep.
1. Manually add users to the primary organization and remove existing users from the secondary organization.
1. Manually move over your data, including all repositories.
1. Once you're done moving all of your users and data, [downgrade](../../subscription/change.md) the secondary account to a free subscription. Note that Docker does not offer refunds for downgrading organizations mid-billing cycle.
@z

@x
If your organization has a Docker Business subscription with a purchase
order, contact Support or your Account Manager at Docker.
@y
If your organization has a Docker Business subscription with a purchase
order, contact Support or your Account Manager at Docker.
@z

@x
## More resources
@y
## More resources
@z

@x
- [Video: Docker Hub Organizations](https://www.youtube.com/watch?v=WKlT1O-4Du8)
@y
- [Video: Docker Hub Organizations](https://www.youtube.com/watch?v=WKlT1O-4Du8)
@z
