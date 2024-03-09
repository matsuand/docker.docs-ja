%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deactivating an account or an organization
description: Learn how to deactivate a Docker Hub account or an organization
keywords: Docker Hub, delete, deactivate, account, organization
aliases:
- /docker-hub/deactivate-account/
---
@y
---
title: Deactivating an account or an organization
description: Learn how to deactivate a Docker Hub account or an organization
keywords: Docker Hub, delete, deactivate, account, organization
aliases:
- /docker-hub/deactivate-account/
---
@z

@x
You can deactivate an account at any time. 
@y
You can deactivate an account at any time. 
@z

@x
>**Warning**
>
> All Docker products and services that use your Docker account or organization account will be inaccessible after deactivating your account.
{ .warning }
@y
>**Warning**
>
> All Docker products and services that use your Docker account or organization account will be inaccessible after deactivating your account.
{ .warning }
@z

@x
## Deactivate a user account
@y
## Deactivate a user account
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before deactivating your Docker account, ensure that you meet the following requirements:
@y
Before deactivating your Docker account, ensure that you meet the following requirements:
@z

@x
- You must not be a member of a company or any teams or organizations. You must remove the account from all teams, organizations, or the company.
@y
- You must not be a member of a company or any teams or organizations. You must remove the account from all teams, organizations, or the company.
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
- If you are the sole owner of an organization, either assign another member of the organization the owner role and then remove yourself from the organization, or deactivate the organization. Similarly, if you are the sole owner of a company, either add someone else as a company owner and then remove yourself, or deactivate the company.
@y
- If you are the sole owner of an organization, either assign another member of the organization the owner role and then remove yourself from the organization, or deactivate the organization. Similarly, if you are the sole owner of a company, either add someone else as a company owner and then remove yourself, or deactivate the company.
@z

@x
- If you have an active Docker subscription, [downgrade it to a Docker Personal subscription](../subscription/core-subscription/downgrade.md).
@y
- If you have an active Docker subscription, [downgrade it to a Docker Personal subscription](../subscription/core-subscription/downgrade.md).
@z

@x
- If you have an active Docker Build Cloud Team subscription, [downgrade it to a Docker Build Cloud Starter subscription](../billing/build-billing.md#downgrade-your-subscription).
@y
- If you have an active Docker Build Cloud Team subscription, [downgrade it to a Docker Build Cloud Starter subscription](../billing/build-billing.md#downgrade-your-subscription).
@z

@x
- If you have an active Docker Scout subscription, [downgrade it to a Docker Scout Free subscription](../billing/scout-billing.md#downgrade-your-subscription).
@y
- If you have an active Docker Scout subscription, [downgrade it to a Docker Scout Free subscription](../billing/scout-billing.md#downgrade-your-subscription).
@z

@x
- Download any images and tags you want to keep. Use `docker pull -a <image>:<tag>`.
@y
- Download any images and tags you want to keep. Use `docker pull -a <image>:<tag>`.
@z

@x
- Unlink your [Github and Bitbucket accounts](../docker-hub/builds/link-source.md#unlink-a-github-user-account).
@y
- Unlink your [Github and Bitbucket accounts](../docker-hub/builds/link-source.md#unlink-a-github-user-account).
@z

@x
### Deactivate
@y
### Deactivate
@z

@x
Once you have completed all the steps above, you can deactivate your account. 
@y
Once you have completed all the steps above, you can deactivate your account. 
@z

@x
1. Select your account name in the top-right of Docker Hub and from the drop-down menu, select **My Account**.
2. From the **Deactivate Account** tab, select **Deactivate account**. 
@y
1. Select your account name in the top-right of Docker Hub and from the drop-down menu, select **My Account**.
2. From the **Deactivate Account** tab, select **Deactivate account**. 
@z

@x
> This cannot be undone. Be sure you've gathered all the data you need from your account before deactivating it.
{ .warning }
@y
> This cannot be undone. Be sure you've gathered all the data you need from your account before deactivating it.
{ .warning }
@z

@x
## Deactivate an organization
@y
## Deactivate an organization
@z

@x
Before deactivating an organization, complete the following:
@y
Before deactivating an organization, complete the following:
@z

@x
- Download any images and tags you want to keep:
  `docker pull -a <image>:<tag>`.
@y
- Download any images and tags you want to keep:
  `docker pull -a <image>:<tag>`.
@z

@x
- If you have an active Docker subscription, [downgrade it to a **Docker Free Team** subscription](../subscription/core-subscription/downgrade.md).
@y
- If you have an active Docker subscription, [downgrade it to a **Docker Free Team** subscription](../subscription/core-subscription/downgrade.md).
@z

@x
- If you have an active Docker Scout subscription, [downgrade it to a Docker Scout Free subscription](../billing/scout-billing.md#downgrade-your-subscription).
@y
- If you have an active Docker Scout subscription, [downgrade it to a Docker Scout Free subscription](../billing/scout-billing.md#downgrade-your-subscription).
@z

@x
- Remove all other members within the organization.
@y
- Remove all other members within the organization.
@z

@x
- Unlink your [Github and Bitbucket accounts](../docker-hub/builds/link-source.md#unlink-a-github-user-account).
@y
- Unlink your [Github and Bitbucket accounts](../docker-hub/builds/link-source.md#unlink-a-github-user-account).
@z

@x
### Deactivate
@y
### Deactivate
@z

@x
Once you have completed all the steps above, you can deactivate your organization. 
@y
Once you have completed all the steps above, you can deactivate your organization. 
@z

@x
1. On Docker Hub, select **Organizations**.
2. Choose the organization you want to deactivate. 
3. In **Settings**, select the **Deactivate Org** tab and then **Deactivate organization**.
@y
1. On Docker Hub, select **Organizations**.
2. Choose the organization you want to deactivate. 
3. In **Settings**, select the **Deactivate Org** tab and then **Deactivate organization**.
@z

@x
> This cannot be undone. Be sure you've gathered all the data you need from your organization before deactivating it.
{ .warning }
@y
> This cannot be undone. Be sure you've gathered all the data you need from your organization before deactivating it.
{ .warning }
@z
