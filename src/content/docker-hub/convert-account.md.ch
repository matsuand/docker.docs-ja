%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Convert your Docker Hub user account into an organization
title: Convert an account into an organization
keywords: docker hub, hub, organization
---
@y
---
description: Convert your Docker Hub user account into an organization
title: Convert an account into an organization
keywords: docker hub, hub, organization
---
@z

@x
You can convert an existing user account to an organization. This is useful if you need multiple users to access your account and the repositories that it’s connected to. Converting it to an organization gives you better control over permissions for these users through [teams](manage-a-team.md) and [roles](roles-and-permissions.md).
@y
You can convert an existing user account to an organization. This is useful if you need multiple users to access your account and the repositories that it’s connected to. Converting it to an organization gives you better control over permissions for these users through [teams](manage-a-team.md) and [roles](roles-and-permissions.md).
@z

@x
When you convert a user account to an organization, the account is migrated to a Team plan that requires a paid subscription. For more information, see [Docker Pricing](https://www.docker.com/pricing).
@y
When you convert a user account to an organization, the account is migrated to a Team plan that requires a paid subscription. For more information, see [Docker Pricing](https://www.docker.com/pricing).
@z

@x
> **Important**
>
> Once you convert your account to an organization, you can’t revert it to a user account. 
{ .important }
@y
> **Important**
>
> Once you convert your account to an organization, you can’t revert it to a user account. 
{ .important }
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you convert a user account to an organization, ensure that you meet the following requirements:
@y
Before you convert a user account to an organization, ensure that you meet the following requirements:
@z

@x
- The user account that you want to convert must not be a member of a company or any teams or organizations. You must remove the account from all teams, organizations, or the company.
@y
- The user account that you want to convert must not be a member of a company or any teams or organizations. You must remove the account from all teams, organizations, or the company.
@z

@x
    To do this:
    1. Navigate to **Organizations** and then select the organization(s) you need to leave.
    2. Find your username in the **Members** tab.
    3. Select the **More options** menu and then select **Leave organization**.
@y
    To do this:
    1. Navigate to **Organizations** and then select the organization(s) you need to leave.
    2. Find your username in the **Members** tab.
    3. Select the **More options** menu and then select **Leave organization**.
@z

@x
    If the user account is the sole owner of any organization or company, assign another user the owner role and then remove yourself from the organization or company.
@y
    If the user account is the sole owner of any organization or company, assign another user the owner role and then remove yourself from the organization or company.
@z

@x
-  You must have a separate Docker ID ready to assign as the owner of the organization during conversion.
@y
-  You must have a separate Docker ID ready to assign as the owner of the organization during conversion.
@z

@x
    If you want to convert your user account into an organization account and you don't have any other user accounts, you need to create a new user account to assign it as the owner of the new organization. With the owner role assigned, this user account has full administrative access to configure and manage the organization. You can assign more users the owner role after the conversion.
@y
    If you want to convert your user account into an organization account and you don't have any other user accounts, you need to create a new user account to assign it as the owner of the new organization. With the owner role assigned, this user account has full administrative access to configure and manage the organization. You can assign more users the owner role after the conversion.
@z

@x
## Effects of converting an account into an organization
@y
## Effects of converting an account into an organization
@z

@x
Consider the following effects of converting your account:
@y
Consider the following effects of converting your account:
@z

@x
- This process removes the email address for the account, and organization owners will receive notification emails instead. You'll be able to reuse the removed email address for another account after converting.
@y
- This process removes the email address for the account, and organization owners will receive notification emails instead. You'll be able to reuse the removed email address for another account after converting.
@z

@x
- The current plan will cancel and your new subscription will start.
@y
- The current plan will cancel and your new subscription will start.
@z

@x
- Repository namespaces and names won't change, but converting your account removes any repository collaborators. Once you convert the account, you'll need to add those users as team members.
@y
- Repository namespaces and names won't change, but converting your account removes any repository collaborators. Once you convert the account, you'll need to add those users as team members.
@z

@x
- Existing automated builds will appear as if they were set up by the first owner added to the organization. See [Convert an account into an organization](#convert-an-account-into-an-organization) for steps on adding the first owner.
@y
- Existing automated builds will appear as if they were set up by the first owner added to the organization. See [Convert an account into an organization](#convert-an-account-into-an-organization) for steps on adding the first owner.
@z

@x
- The user account that you add as the first owner will have full administrative access to configure and manage the organization.
@y
- The user account that you add as the first owner will have full administrative access to configure and manage the organization.
@z

@x
## Convert an account into an organization
@y
## Convert an account into an organization
@z

@x
1. Ensure you have removed your user account from any company or teams or organizations. Also make sure that you have a new Docker ID before you convert an account. See the [Prerequisites](#prerequisites) section for details.
@y
1. Ensure you have removed your user account from any company or teams or organizations. Also make sure that you have a new Docker ID before you convert an account. See the [Prerequisites](#prerequisites) section for details.
@z

@x
2. In the top-right of Docker Hub, select your account name and then from the drop-down menu, select **My Account**.
@y
2. In the top-right of Docker Hub, select your account name and then from the drop-down menu, select **My Account**.
@z

@x
3. From the **Convert Account** tab, select **Convert to Organization**.
@y
3. From the **Convert Account** tab, select **Convert to Organization**.
@z

@x
4. Review the warning displayed about converting a user account. This action cannot be undone and has considerable implications for your assets and the account.
@y
4. Review the warning displayed about converting a user account. This action cannot be undone and has considerable implications for your assets and the account.
@z

@x
5. Enter a **Docker ID** to set an organization owner. This is the user account that will manage the organization, and the only way to access the organization settings after conversion. You cannot use the same Docker ID as the account you are trying to convert.
@y
5. Enter a **Docker ID** to set an organization owner. This is the user account that will manage the organization, and the only way to access the organization settings after conversion. You cannot use the same Docker ID as the account you are trying to convert.
@z

@x
6. Select **Convert and Purchase** to confirm. The new owner receives a notification email. Use that owner account to sign in to your new organization.
@y
6. Select **Convert and Purchase** to confirm. The new owner receives a notification email. Use that owner account to sign in to your new organization.
@z
