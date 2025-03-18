%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Deactivate an organization
description: Learn how to deactivate a Docker organization.
keywords: Docker Hub, delete, deactivate organization, account, organization management
@y
title: Deactivate an organization
description: Learn how to deactivate a Docker organization.
keywords: Docker Hub, delete, deactivate organization, account, organization management
@z

@x
You can deactivate an account at any time. This section describes the prerequisites and steps to deactivate an organization account. For information on deactivating a user account, see [Deactivate a user account](../../accounts/deactivate-user-account.md).
@y
アカウントはいつでも無効化することができます。
This section describes the prerequisites and steps to deactivate an organization account. For information on deactivating a user account, see [Deactivate a user account](../../accounts/deactivate-user-account.md).
@z

@x
> [!WARNING]
>
> All Docker products and services that use your Docker account or organization account will be inaccessible after deactivating your account.
@y
> [!WARNING]
>
> All Docker products and services that use your Docker account or organization account will be inaccessible after deactivating your account.
@z

@x
## Prerequisites
@y
## Prerequisites
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
- If you have an active Docker subscription, [downgrade it to a free subscription](../../subscription/change.md).
@y
- If you have an active Docker subscription, [downgrade it to a free subscription](../../subscription/change.md).
@z

@x
- Remove all other members within the organization.
@y
- Remove all other members within the organization.
@z

@x
- Unlink your [Github and Bitbucket accounts](../../docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
@y
- Unlink your [Github and Bitbucket accounts](../../docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
@z

@x
## Deactivate
@y
## Deactivate
@z

@x
Once you have completed all the previous steps, you can deactivate your organization.
@y
Once you have completed all the previous steps, you can deactivate your organization.
@z

@x
> [!WARNING]
>
> This cannot be undone. Be sure you've gathered all the data you need from your organization before deactivating it.
@y
> [!WARNING]
>
> This cannot be undone. Be sure you've gathered all the data you need from your organization before deactivating it.
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
1. In Admin Console, choose the organization you want to deactivate.
2. Under **Organization settings**, select **Deactivate**.
3. Enter the organization name to confirm deactivation.
4. Select **Deactivate organization**.
@y
1. In Admin Console, choose the organization you want to deactivate.
2. Under **Organization settings**, select **Deactivate**.
3. Enter the organization name to confirm deactivation.
4. Select **Deactivate organization**.
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. On Docker Hub, select **My Hub**.
2. Choose the organization you want to deactivate.
3. In **Settings**, select the **Deactivate org** and then **Deactivate organization**.
@y
1. On Docker Hub, select **My Hub**.
2. Choose the organization you want to deactivate.
3. In **Settings**, select the **Deactivate org** and then **Deactivate organization**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
