%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Link to GitHub and BitBucket
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, trusted,
  builds, trusted builds, automated builds, GitHub
title: Configure automated builds from GitHub and BitBucket
linkTitle: Link accounts
@y
description: Link to GitHub and BitBucket
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, trusted,
  builds, trusted builds, automated builds, GitHub
title: Configure automated builds from GitHub and BitBucket
linkTitle: Link accounts
@z

@x
> [!NOTE]
>
> Automated builds require a Docker Pro, Team, or Business subscription.
@y
> [!NOTE]
>
> Automated builds require a Docker Pro, Team, or Business subscription.
@z

@x
To automate building and testing of your images, you link to your hosted source
code service to Docker Hub so that it can access your source code
repositories. You can configure this link for user accounts or
organizations.
@y
To automate building and testing of your images, you link to your hosted source
code service to Docker Hub so that it can access your source code
repositories. You can configure this link for user accounts or
organizations.
@z

@x
If you are linking a source code provider to create autobuilds for a team, follow the instructions to [create a service account](index.md#service-users-for-team-autobuilds) for the team before linking the account as described below.
@y
If you are linking a source code provider to create autobuilds for a team, follow the instructions to [create a service account](index.md#service-users-for-team-autobuilds) for the team before linking the account as described below.
@z

@x
## Link to a GitHub user account
@y
## Link to a GitHub user account
@z

@x
1. Sign in to Docker Hub.
@y
1. Sign in to Docker Hub.
@z

@x
2. Select **My Hub** > **Settings** > **Linked accounts**.
@y
2. Select **My Hub** > **Settings** > **Linked accounts**.
@z

@x
3. Select **Link provider** for the source provider you want to link.
@y
3. Select **Link provider** for the source provider you want to link.
@z

@x
    If you want to unlink your current GitHub account and relink to a new GitHub account, make sure to completely sign out of [GitHub](https://github.com/) before linking via Docker Hub.
@y
    If you want to unlink your current GitHub account and relink to a new GitHub account, make sure to completely sign out of [GitHub](https://github.com/) before linking via Docker Hub.
@z

@x
4. Review the settings for the **Docker Hub Builder** OAuth application.
@y
4. Review the settings for the **Docker Hub Builder** OAuth application.
@z

@x
    ![Granting access to GitHub account](images/authorize-builder.png)
@y
    ![Granting access to GitHub account](images/authorize-builder.png)
@z

@x
    > [!NOTE]
    >
    > If you are the owner of any GitHub organizations, you might see
    options to grant Docker Hub access to them from this screen. You can also
    individually edit an organization's third-party access settings to grant or
    revoke Docker Hub's access. See
    [Grant access to a GitHub organization](link-source.md#grant-access-to-a-github-organization)
    to learn more.
@y
    > [!NOTE]
    >
    > If you are the owner of any GitHub organizations, you might see
    options to grant Docker Hub access to them from this screen. You can also
    individually edit an organization's third-party access settings to grant or
    revoke Docker Hub's access. See
    [Grant access to a GitHub organization](link-source.md#grant-access-to-a-github-organization)
    to learn more.
@z

@x
5. Select **Authorize docker** to save the link.
@y
5. Select **Authorize docker** to save the link.
@z

@x
### Grant access to a GitHub organization
@y
### Grant access to a GitHub organization
@z

@x
If you are the owner of a GitHub organization, you can grant or revoke Docker
Hub's access to the organization's repositories. Depending on the GitHub
organization's settings, you may need to be an organization owner.
@y
If you are the owner of a GitHub organization, you can grant or revoke Docker
Hub's access to the organization's repositories. Depending on the GitHub
organization's settings, you may need to be an organization owner.
@z

@x
If the organization has not had specific access granted or revoked before, you
can often grant access at the same time as you link your user account. In this
case, a **Grant access** button appears next to the organization name in the
link accounts screen, as shown below. If this button does not appear, you must
manually grant the application's access.
@y
If the organization has not had specific access granted or revoked before, you
can often grant access at the same time as you link your user account. In this
case, a **Grant access** button appears next to the organization name in the
link accounts screen, as shown below. If this button does not appear, you must
manually grant the application's access.
@z

@x
To manually grant Docker Hub access to a GitHub organization:
@y
To manually grant Docker Hub access to a GitHub organization:
@z

@x
1. Link your user account using the instructions above.
@y
1. Link your user account using the instructions above.
@z

@x
2. From your GitHub Account settings, locate the **Organization settings**
section at the lower left.
@y
2. From your GitHub Account settings, locate the **Organization settings**
section at the lower left.
@z

@x
3. Select the organization you want to give Docker Hub access to.
@y
3. Select the organization you want to give Docker Hub access to.
@z

@x
4. Select **Third-party access**.
@y
4. Select **Third-party access**.
@z

@x
    The page displays a list of third party applications and their access
    status.
@y
    The page displays a list of third party applications and their access
    status.
@z

@x
5. Select the pencil icon next to **Docker Hub Builder**.
@y
5. Select the pencil icon next to **Docker Hub Builder**.
@z

@x
6. Select **Grant access** next to the organization.
@y
6. Select **Grant access** next to the organization.
@z

@x
### Revoke access to a GitHub organization
@y
### Revoke access to a GitHub organization
@z

@x
To revoke Docker Hub's access to an organization's GitHub repositories:
@y
To revoke Docker Hub's access to an organization's GitHub repositories:
@z

@x
1. From your GitHub Account settings, locate the **Organization settings** section at the lower left.
@y
1. From your GitHub Account settings, locate the **Organization settings** section at the lower left.
@z

@x
2. Select the organization you want to revoke Docker Hub's access to.
@y
2. Select the organization you want to revoke Docker Hub's access to.
@z

@x
3. From the Organization Profile menu, select **Third-party access**.
    The page displays a list of third party applications and their access status.
@y
3. From the Organization Profile menu, select **Third-party access**.
    The page displays a list of third party applications and their access status.
@z

@x
4. Select the pencil icon next to Docker Hub Builder.
@y
4. Select the pencil icon next to Docker Hub Builder.
@z

@x
5. On the next page, select **Deny access**.
@y
5. On the next page, select **Deny access**.
@z

@x
### Unlink a GitHub user account
@y
### Unlink a GitHub user account
@z

@x
To revoke Docker Hub's access to your GitHub account, you must unlink it both
from Docker Hub, and from your GitHub account.
@y
To revoke Docker Hub's access to your GitHub account, you must unlink it both
from Docker Hub, and from your GitHub account.
@z

@x
1. Select **My Hub** > **Settings** > **Linked accounts**.
@y
1. Select **My Hub** > **Settings** > **Linked accounts**.
@z

@x
2. Select **Unlink provider** next to the source provider you want to remove.
@y
2. Select **Unlink provider** next to the source provider you want to remove.
@z

@x
3. Go to your GitHub account's **Settings** page.
@y
3. Go to your GitHub account's **Settings** page.
@z

@x
4. Select **Applications** in the left navigation bar.
@y
4. Select **Applications** in the left navigation bar.
@z

@x
5. Select the `...` menu to the right of the Docker Hub Builder application and select **Revoke**.
@y
5. Select the `...` menu to the right of the Docker Hub Builder application and select **Revoke**.
@z

@x
> [!NOTE]
>
> Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository.
This webhook is not automatically removed when you revoke access to a source
code provider.
@y
> [!NOTE]
>
> Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository.
This webhook is not automatically removed when you revoke access to a source
code provider.
@z

@x
## Link to a Bitbucket user account
@y
## Link to a Bitbucket user account
@z

@x
1. Sign in to Docker Hub using your Docker ID.
@y
1. Sign in to Docker Hub using your Docker ID.
@z

@x
2. Select **My Hub** > **Settings** > **Linked accounts**.
@y
2. Select **My Hub** > **Settings** > **Linked accounts**.
@z

@x
3. Select **Link provider** for the source provider you want to link.
@y
3. Select **Link provider** for the source provider you want to link.
@z

@x
4. If necessary, sign in to Bitbucket.
@y
4. If necessary, sign in to Bitbucket.
@z

@x
5. On the page that appears, select **Grant access**.
@y
5. On the page that appears, select **Grant access**.
@z

@x
### Unlink a Bitbucket user account
@y
### Unlink a Bitbucket user account
@z

@x
To permanently revoke Docker Hub's access to your Bitbucket account, you must
unlink it both from Docker Hub, and revoke authorization in your Bitbucket account.
@y
To permanently revoke Docker Hub's access to your Bitbucket account, you must
unlink it both from Docker Hub, and revoke authorization in your Bitbucket account.
@z

@x
1. Sign in to Docker Hub.
@y
1. Sign in to Docker Hub.
@z

@x
2. Select **My Hub** > **Settings** > **Linked accounts**.
@y
2. Select **My Hub** > **Settings** > **Linked accounts**.
@z

@x
3. Select **Unlink provider** next to the source provider you want to remove.
@y
3. Select **Unlink provider** next to the source provider you want to remove.
@z

@x
> [!IMPORTANT]
> After unlinking the account on Docker Hub, you must also revoke the authorization on the Bitbucket end.
@y
> [!IMPORTANT]
> After unlinking the account on Docker Hub, you must also revoke the authorization on the Bitbucket end.
@z

@x
To revoke authorization in your Bitbucket account:
@y
To revoke authorization in your Bitbucket account:
@z

@x
1. Go to your Bitbucket account and navigate to [**Bitbucket settings**](https://bitbucket.org/account/settings/app-authorizations/).
@y
1. Go to your Bitbucket account and navigate to [**Bitbucket settings**](https://bitbucket.org/account/settings/app-authorizations/).
@z

@x
2. On the page that appears, select **OAuth**.
@y
2. On the page that appears, select **OAuth**.
@z

@x
3. Select **Revoke** next to the Docker Hub line.
@y
3. Select **Revoke** next to the Docker Hub line.
@z

@x
![Bitbucket Authorization revocation page](images/bitbucket-revoke.png)
@y
![Bitbucket Authorization revocation page](images/bitbucket-revoke.png)
@z

@x
> [!NOTE]
>
> Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository. This
webhook is not automatically removed when you revoke access to a source code
provider.
@y
> [!NOTE]
>
> Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository. This
webhook is not automatically removed when you revoke access to a source code
provider.
@z
