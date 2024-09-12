%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deactivate an account
weight: 30
description: Learn how to deactivate a Docker user account.
keywords: Docker Hub, delete, deactivate, account, account management
---
@y
---
title: Deactivate an account
weight: 30
description: Learn how to deactivate a Docker user account.
keywords: Docker Hub, delete, deactivate, account, account management
---
@z

@x
You can deactivate an account at any time. This section describes the prerequisites and steps to deactivate a user account. For information on deactivating an organization, see [Deactivating an organization](../admin/deactivate-account.md).
@y
You can deactivate an account at any time. This section describes the prerequisites and steps to deactivate a user account. For information on deactivating an organization, see [Deactivating an organization](../admin/deactivate-account.md).
@z

@x
>**Warning**
>
> All Docker products and services that use your Docker account will be inaccessible after deactivating your account.
@y
>**Warning**
>
> All Docker products and services that use your Docker account will be inaccessible after deactivating your account.
@z

@x
## Prerequisites
@y
## Prerequisites
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
- If you have an active Docker Build Cloud Paid subscription, [downgrade it to a Docker Build Cloud Starter subscription](../billing/build-billing.md#downgrade-your-subscription).
@y
- If you have an active Docker Build Cloud Paid subscription, [downgrade it to a Docker Build Cloud Starter subscription](../billing/build-billing.md#downgrade-your-subscription).
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
- Unlink your [GitHub and Bitbucket accounts](../docker-hub/builds/link-source.md#unlink-a-github-user-account).
@y
- Unlink your [GitHub and Bitbucket accounts](../docker-hub/builds/link-source.md#unlink-a-github-user-account).
@z

@x
## Deactivate
@y
## Deactivate
@z

@x
Once you have completed all the previous steps, you can deactivate your account.
@y
Once you have completed all the previous steps, you can deactivate your account.
@z

@x
> [!WARNING]
>
> This cannot be undone. Be sure you've gathered all the data you need from your account before deactivating it.
@y
> [!WARNING]
>
> This cannot be undone. Be sure you've gathered all the data you need from your account before deactivating it.
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
2. In Docker Home, select your avatar in the top-right corner to open the drop-down.
3. Select **Account settings**.
4. In the **Account management** section, select **Deactivate account** to open to deactivate account page.
5. To confirm, select **Deactivate account**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
2. In Docker Home, select your avatar in the top-right corner to open the drop-down.
3. Select **Account settings**.
4. In the **Account management** section, select **Deactivate account** to open to deactivate account page.
5. To confirm, select **Deactivate account**.
@z
