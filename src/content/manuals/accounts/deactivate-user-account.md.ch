%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Deactivate a Docker account
linkTitle: Deactivate an account
@y
title: Docker アカウントの無効化
linkTitle: アカウントの無効化
@z

@x
description: Learn how to deactivate a Docker user account.
keywords: Docker Hub, delete, deactivate, account, account management, delete Docker account, close Docker account, disable Docker account
@y
description: Docker ユーザーアカウントの無効化方法について学びます。
keywords: Docker Hub, delete, deactivate, account, account management, delete Docker account, close Docker account, disable Docker account
@z

@x
Learn how to deactivate an individual Docker account, including prerequisites required
for deactivation.
@y
Learn how to deactivate an individual Docker account, including prerequisites required
for deactivation.
@z

@x
For information on deactivating an organization,
see [Deactivating an organization](../admin/organization/deactivate-account.md).
@y
For information on deactivating an organization,
see [Deactivating an organization](../admin/organization/deactivate-account.md).
@z

@x
> [!WARNING]
>
> All Docker products and services that use your Docker account are
inaccessible after deactivating your account.
@y
> [!WARNING]
>
> All Docker products and services that use your Docker account are
inaccessible after deactivating your account.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Before deactivating your Docker account, ensure you meet the following requirements:
@y
Docker アカウントの無効化を行うにあたっては、以下の条件を満たしている必要があります。
@z

@x
- If you are an organization or company owner, you must leave your organization
or company before deactivating your Docker account:
@y
- If you are an organization or company owner, you must leave your organization
or company before deactivating your Docker account:
@z

@x
    1. Sign in to [Docker Home](https://app.docker.com/admin) and choose
    your organization.
    1. Select **Members** and find your username.
    1. Select the **Actions** menu and then select **Leave organization**.
@y
    1. Sign in to [Docker Home](https://app.docker.com/admin) and choose
    your organization.
    1. Select **Members** and find your username.
    1. Select the **Actions** menu and then select **Leave organization**.
@z

@x
- If you are the sole owner of an organization, you must assign the owner role
to another member of the organization and then remove yourself from the
organization, or deactivate the organization. Similarly, if you are the sole
owner of a company, either add someone else as a company owner and then remove
yourself, or deactivate the company.
- If you have an active Docker subscription, [downgrade it to a Docker Personal subscription](../subscription/change.md).
- Download any images and tags you want to keep. Use `docker pull -a <image>:<tag>`.
- Unlink your [GitHub and account](../docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
@y
- If you are the sole owner of an organization, you must assign the owner role
to another member of the organization and then remove yourself from the
organization, or deactivate the organization. Similarly, if you are the sole
owner of a company, either add someone else as a company owner and then remove
yourself, or deactivate the company.
- If you have an active Docker subscription, [downgrade it to a Docker Personal subscription](../subscription/change.md).
- Download any images and tags you want to keep. Use `docker pull -a <image>:<tag>`.
- Unlink your [GitHub and account](../docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
@z

@x
## Deactivate
@y
## 無効化 {#deactivate}
@z

@x
Once you have completed all the previous steps, you can deactivate your account.
@y
Once you have completed all the previous steps, you can deactivate your account.
@z

@x
> [!WARNING]
>
> Deactivating your account is permanent and can't be undone. Make sure
to back up any important data.
@y
> [!WARNING]
>
> Deactivating your account is permanent and can't be undone. Make sure
to back up any important data.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar to open the drop-down menu.
1. Select **Account settings**.
1. Select **Deactivate**.
1. Select **Deactivate account**, then select again to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar to open the drop-down menu.
1. Select **Account settings**.
1. Select **Deactivate**.
1. Select **Deactivate account**, then select again to confirm.
@z
