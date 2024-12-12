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
keywords: Docker, docker, registry, teams, organizations, plans, Dockerfile, Docker
  Hub, docs, documentation
@y
description: Learn how to create an organization.
keywords: Docker, docker, registry, teams, organizations, plans, Dockerfile, Docker
  Hub, docs, documentation
@z

@x
This section describes how to create an organization. Before you begin:
@y
This section describes how to create an organization. Before you begin:
@z

@x
- You need a [Docker ID](/accounts/create-account/).
- Review the [Docker subscriptions and features](../../subscription/details.md) to determine what plan to choose for your organization.
@y
- You need a [Docker ID](__SUBDIR__/accounts/create-account/).
- Review the [Docker subscriptions and features](../../subscription/details.md) to determine what plan to choose for your organization.
@z

@x
## Create an organization
@y
## Create an organization
@z

@x
There are multiple ways to create an organization. You can create a brand new
organization using the **Create Organization** option in Docker Hub, or you can
convert an existing user account to an organization. The following section
contains instructions on how to create a new organization. For prerequisites and
detailed instructions on converting an existing user account to an organization, see
[Convert an account into an organization](../convert-account.md).
@y
There are multiple ways to create an organization. You can create a brand new
organization using the **Create Organization** option in Docker Hub, or you can
convert an existing user account to an organization. The following section
contains instructions on how to create a new organization. For prerequisites and
detailed instructions on converting an existing user account to an organization, see
[Convert an account into an organization](../convert-account.md).
@z

@x
To create an organization:
@y
To create an organization:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com/) using your Docker ID, your email address, or your social provider.
2. Select **Organizations** and then **Create Organization** to create a new
   organization.
3. Choose a plan for your organization and select **Buy Now**. See
[Docker Pricing](https://www.docker.com/pricing/)
for details on the features offered in the Team and Business plan.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/) using your Docker ID, your email address, or your social provider.
2. Select **Organizations** and then **Create Organization** to create a new
   organization.
3. Choose a plan for your organization and select **Buy Now**. See
[Docker Pricing](https://www.docker.com/pricing/)
for details on the features offered in the Team and Business plan.
@z

@x
   > [!NOTE]
   >
   > Selecting **Buy Now** isn't an obligation to pay. You can complete
   > this step without incurring a payment.
@y
   > [!NOTE]
   >
   > Selecting **Buy Now** isn't an obligation to pay. You can complete
   > this step without incurring a payment.
@z

@x
4. Enter a name for your organization. This is the official, unique name for
your organization in Docker Hub. It's not possible to change the name of the
organization after you've created it.
@y
4. Enter a name for your organization. This is the official, unique name for
your organization in Docker Hub. It's not possible to change the name of the
organization after you've created it.
@z

@x
   > [!NOTE]
   >
   > You can't use the same name for the organization and your Docker ID. If you want to use your Docker ID as the organization name, then you must first [convert your account into an organization](../convert-account.md).
@y
   > [!NOTE]
   >
   > You can't use the same name for the organization and your Docker ID. If you want to use your Docker ID as the organization name, then you must first [convert your account into an organization](../convert-account.md).
@z

@x
5. Enter the name of your company. This is the full name of your company. Docker
displays the company name on your organization page and in the details of any
public images you publish. You can update the company name anytime by navigating
to your organization's **Settings** page.
6. Select **Purchase** to continue.
7. Enter the billing information for your organization.
8. Select **Submit** to continue to the billing portal.
9. In the billing portal, select **Qty** to update the number of seats you require, then select **Update**.
10. (Optional) Select annual or monthly billing cycle.
11. Follow the on-screen instructions to pay for your subscription.
@y
5. Enter the name of your company. This is the full name of your company. Docker
displays the company name on your organization page and in the details of any
public images you publish. You can update the company name anytime by navigating
to your organization's **Settings** page.
6. Select **Purchase** to continue.
7. Enter the billing information for your organization.
8. Select **Submit** to continue to the billing portal.
9. In the billing portal, select **Qty** to update the number of seats you require, then select **Update**.
10. (Optional) Select annual or monthly billing cycle.
11. Follow the on-screen instructions to pay for your subscription.
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
To view an organization:
@y
To view an organization:
@z

@x
1. Sign in to Docker Hub with a user account that is a member of any team in the
   organization. 
@y
1. Sign in to Docker Hub with a user account that is a member of any team in the
   organization. 
@z

@x
      > [!NOTE]
      >
      > You can't _directly_ log in to an organization. This is especially
      > important to note if you create an organization by
      [converting a user account](../convert-account.md), as conversion means you lose the ability to log into that
      > "account", since it no longer exists. To view the organization you 
      > need to log in with the new owner account assigned during the
      > conversion or another account that was added as a member. If you 
      > don't see the organization after logging in,
      > then you are neither a member or an owner of it. An organization
      > administrator needs to add you as a member of the organization.
@y
      > [!NOTE]
      >
      > You can't _directly_ log in to an organization. This is especially
      > important to note if you create an organization by
      [converting a user account](../convert-account.md), as conversion means you lose the ability to log into that
      > "account", since it no longer exists. To view the organization you 
      > need to log in with the new owner account assigned during the
      > conversion or another account that was added as a member. If you 
      > don't see the organization after logging in,
      > then you are neither a member or an owner of it. An organization
      > administrator needs to add you as a member of the organization.
@z

@x
2. Select **Organizations** in the top navigation bar, then choose your
   organization from the list.
@y
2. Select **Organizations** in the top navigation bar, then choose your
   organization from the list.
@z

@x
The organization landing page displays various options that allow you to
configure your organization.
@y
The organization landing page displays various options that allow you to
configure your organization.
@z

@x
- **Members**: Displays a list of team members. You
  can invite new members using the **Invite members** button. See [Manage members](./members.md) for details.
@y
- **Members**: Displays a list of team members. You
  can invite new members using the **Invite members** button. See [Manage members](./members.md) for details.
@z

@x
- **Teams**: Displays a list of existing teams and the number of
  members in each team. See [Create a team](./manage-a-team.md) for details.
@y
- **Teams**: Displays a list of existing teams and the number of
  members in each team. See [Create a team](./manage-a-team.md) for details.
@z

@x
- **Repositories**: Displays a list of repositories associated with the
  organization. See [Repositories](../../docker-hub/repos/_index.md) for detailed information about
  working with repositories.
@y
- **Repositories**: Displays a list of repositories associated with the
  organization. See [Repositories](../../docker-hub/repos/_index.md) for detailed information about
  working with repositories.
@z

@x
- **Activity** Displays the audit logs, a chronological list of activities that
  occur at organization and repository levels. It provides the org owners a
  report of all their team member activities. See [Audit logs](./activity-logs.md) for
  details.
@y
- **Activity** Displays the audit logs, a chronological list of activities that
  occur at organization and repository levels. It provides the org owners a
  report of all their team member activities. See [Audit logs](./activity-logs.md) for
  details.
@z

@x
- **Settings**: Displays information about your
  organization, and allows you to view and change your repository privacy
  settings, configure org permissions such as
  [Image Access Management](/manuals/security/for-admins/hardened-desktop/image-access-management.md), configure notification settings, and [deactivate](../deactivate-account.md#deactivate-an-organization) You can also update your organization name and company name that appear on your organization landing page. You must be an owner to access the
   organization's **Settings** page.
@y
- **Settings**: Displays information about your
  organization, and allows you to view and change your repository privacy
  settings, configure org permissions such as
  [Image Access Management](manuals/security/for-admins/hardened-desktop/image-access-management.md), configure notification settings, and [deactivate](../deactivate-account.md#deactivate-an-organization) You can also update your organization name and company name that appear on your organization landing page. You must be an owner to access the
   organization's **Settings** page.
@z

@x
- **Billing**: Displays information about your existing
[Docker subscription (plan)](../../subscription/_index.md), including the number of seats and next payment due date. For how to access the billing history and payment methods for your organization, see [View billing history](../../billing/history.md).
@y
- **Billing**: Displays information about your existing
[Docker subscription (plan)](../../subscription/_index.md), including the number of seats and next payment due date. For how to access the billing history and payment methods for your organization, see [View billing history](../../billing/history.md).
@z

@x
## Merge organizations
@y
## Merge organizations
@z

@x
If you have multiple organizations that you want to merge into one, complete the following:
@y
If you have multiple organizations that you want to merge into one, complete the following:
@z

@x
1. Based on the number of seats from the secondary organization, [purchase additional seats](../../subscription/manage-seats.md) for the primary organization account that you want to keep.
2. Manually add users to the primary organization and remove existing users from the secondary organization.
3. Manually move over your data, including all repositories.
4. Once you're done moving all of your users and data, [downgrade](../../subscription/change.md) the secondary account to a free subscription. Note that Docker does not offer refunds for downgrading organizations mid-billing cycle.
@y
1. Based on the number of seats from the secondary organization, [purchase additional seats](../../subscription/manage-seats.md) for the primary organization account that you want to keep.
2. Manually add users to the primary organization and remove existing users from the secondary organization.
3. Manually move over your data, including all repositories.
4. Once you're done moving all of your users and data, [downgrade](../../subscription/change.md) the secondary account to a free subscription. Note that Docker does not offer refunds for downgrading organizations mid-billing cycle.
@z

@x
> [!TIP]
>
> If your organization has a Docker Business subscription with a purchase order, contact Support or your Account Manager at Docker.
@y
> [!TIP]
>
> If your organization has a Docker Business subscription with a purchase order, contact Support or your Account Manager at Docker.
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
