%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Deactivate an organization
description: Learn how to deactivate a Docker organization and required prerequisite steps.
keywords: delete, deactivate organization, account, organization management, Admin Console, cancel subscription
@y
title: Deactivate an organization
description: Learn how to deactivate a Docker organization and required prerequisite steps.
keywords: delete, deactivate organization, account, organization management, Admin Console, cancel subscription
@z

@x
{{< summary-bar feature_name="General admin" >}}
@y
{{< summary-bar feature_name="General admin" >}}
@z

@x
Learn how to deactivate a Docker organization, including required prerequisite
steps. For information about deactivating user
accounts, see [Deactivate a user account](../../accounts/deactivate-user-account.md).
@y
Learn how to deactivate a Docker organization, including required prerequisite
steps. For information about deactivating user
accounts, see [Deactivate a user account](../../accounts/deactivate-user-account.md).
@z

@x
> [!WARNING]
>
> All Docker products and services that use your Docker account or organization
account will be inaccessible after deactivating your account.
@y
> [!WARNING]
>
> All Docker products and services that use your Docker account or organization
account will be inaccessible after deactivating your account.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You must complete all the following steps before you can deactivate your
organization:
@y
You must complete all the following steps before you can deactivate your
organization:
@z

@x
- Download any images and tags you want to keep:
  `docker pull -a <image>:<tag>`.
- If you have an active Docker subscription, [downgrade it to a free subscription](../../subscription/change.md).
- Remove all other members within the organization.
- Unlink your [GitHub and Bitbucket accounts](../../docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
- For Business organizations, [remove your SSO connection](/manuals/enterprise/security/single-sign-on/manage.md#remove-an-organization).
@y
- Download any images and tags you want to keep:
  `docker pull -a <image>:<tag>`.
- If you have an active Docker subscription, [downgrade it to a free subscription](../../subscription/change.md).
- Remove all other members within the organization.
- Unlink your [GitHub and Bitbucket accounts](../../docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
- For Business organizations, [remove your SSO connection](manuals/enterprise/security/single-sign-on/manage.md#remove-an-organization).
@z

@x
## Deactivate
@y
## Deactivate
@z

@x
You can deactivate your organization using either the Admin Console or
Docker Hub.
@y
You can deactivate your organization using either the Admin Console or
Docker Hub.
@z

@x
> [!WARNING]
>
> This cannot be undone. Be sure you've gathered all the data you need from
your organization before deactivating it.
@y
> [!WARNING]
>
> This cannot be undone. Be sure you've gathered all the data you need from
your organization before deactivating it.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select the organization
you want to deactivate.
1. Select **Admin Console**, then **Deactivate**. If the **Deactivate**
button is unavailable, confirm you've completed all [Prerequisites](#prerequisites).
1. Enter the organization name to confirm deactivation.
1. Select **Deactivate organization**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select the organization
you want to deactivate.
1. Select **Admin Console**, then **Deactivate**. If the **Deactivate**
button is unavailable, confirm you've completed all [Prerequisites](#prerequisites).
1. Enter the organization name to confirm deactivation.
1. Select **Deactivate organization**.
@z
