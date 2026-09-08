%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Deactivate an organization
linkTitle: Deactivate
description: Learn how to deactivate a Docker organization and required
  prerequisite steps.
keywords: deactivate organization, delete organization, organization
  management, Docker Home, cancel subscription, unlink GitHub, remove SSO
@y
title: Deactivate an organization
linkTitle: Deactivate
description: Learn how to deactivate a Docker organization and required
  prerequisite steps.
keywords: deactivate organization, delete organization, organization
  management, Docker Home, cancel subscription, unlink GitHub, remove SSO
@z

@x
{{< summary-bar feature_name="General admin" >}}
@y
{{< summary-bar feature_name="General admin" >}}
@z

@x
Learn how to deactivate a Docker organization, including required prerequisite
steps. For information about deactivating user accounts, see
[Deactivate a Docker
account](/manuals/accounts/deactivate-user-account.md).
@y
Learn how to deactivate a Docker organization, including required prerequisite
steps. For information about deactivating user accounts, see
[Deactivate a Docker
account](manuals/accounts/deactivate-user-account.md).
@z

@x
> [!WARNING]
>
> All Docker products and services that use this organization are
> inaccessible after you deactivate it. Your individual Docker account
> remains active.
@y
> [!WARNING]
>
> All Docker products and services that use this organization are
> inaccessible after you deactivate it. Your individual Docker account
> remains active.
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
- Download any images and tags you want to keep. Use `docker pull -a <image>`
  to pull all tags, or `docker pull <image>:<tag>` to pull a specific tag.
- If you have an active Docker subscription, [downgrade it to a basic
  organization
  account](/manuals/subscription/plans/docker.md#cancel-a-docker-plan).
- Remove all other members within the organization.
- Unlink your [GitHub and Bitbucket
  accounts](/manuals/docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
- For Business organizations, [remove your SSO
  connection](/manuals/enterprise/security/single-sign-on/manage.md#delete-a-connection).
@y
- Download any images and tags you want to keep. Use `docker pull -a <image>`
  to pull all tags, or `docker pull <image>:<tag>` to pull a specific tag.
- If you have an active Docker subscription, [downgrade it to a basic
  organization
  account](manuals/subscription/plans/docker.md#cancel-a-docker-plan).
- Remove all other members within the organization.
- Unlink your [GitHub and Bitbucket
  accounts](manuals/docker-hub/repos/manage/builds/link-source.md#unlink-a-github-user-account).
- For Business organizations, [remove your SSO
  connection](manuals/enterprise/security/single-sign-on/manage.md#delete-a-connection).
@z

@x
## Deactivate
@y
## Deactivate
@z

@x
> [!WARNING]
>
> Deactivating an organization is permanent and can't be undone. Make sure
> you've gathered all the data you need before you deactivate it.
@y
> [!WARNING]
>
> Deactivating an organization is permanent and can't be undone. Make sure
> you've gathered all the data you need before you deactivate it.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select the organization
   you want to deactivate.
1. Select **Organization settings**, then **Deactivate**. If the **Deactivate**
   button is unavailable, confirm you've completed all
   [Prerequisites](#prerequisites).
1. Enter the organization name to confirm deactivation.
1. Select **Deactivate organization**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select the organization
   you want to deactivate.
1. Select **Organization settings**, then **Deactivate**. If the **Deactivate**
   button is unavailable, confirm you've completed all
   [Prerequisites](#prerequisites).
1. Enter the organization name to confirm deactivation.
1. Select **Deactivate organization**.
@z
