%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Discover how to manage access to repositories on Docker Hub.
keywords: Docker Hub, Hub, repository access, repository collaborators, repository privacy
title: Access management
LinkTItle: Access
@y
description: Discover how to manage access to repositories on Docker Hub.
keywords: Docker Hub, Hub, repository access, repository collaborators, repository privacy
title: Access management
LinkTItle: Access
@z

@x
In this topic learn about the features available to manage access to your
repositories. This includes visibility, collaborators, roles, teams, and
organization access tokens.
@y
In this topic learn about the features available to manage access to your
repositories. This includes visibility, collaborators, roles, teams, and
organization access tokens.
@z

@x
## Repository visibility
@y
## Repository visibility
@z

@x
The most basic repository access is controlled via the visibility. A
repository's visibility can be public or private.
@y
The most basic repository access is controlled via the visibility. A
repository's visibility can be public or private.
@z

@x
With public visibility, the repository appears in Docker Hub search results and
can be pulled by everyone. To manage push access to public personal
repositories, you can use collaborators. To manage push access to public
organization repositories, you can use roles, teams, or organization access
tokens.
@y
With public visibility, the repository appears in Docker Hub search results and
can be pulled by everyone. To manage push access to public personal
repositories, you can use collaborators. To manage push access to public
organization repositories, you can use roles, teams, or organization access
tokens.
@z

@x
With private visibility, the repository doesn't appear in Docker Hub search
results and is only accessible to those with granted permission. To manage push
and pull access to private personal repositories, you can use collaborators. To
manage push and pull access to private organization repositories, you can use
roles, teams, or organization access tokens.
@y
With private visibility, the repository doesn't appear in Docker Hub search
results and is only accessible to those with granted permission. To manage push
and pull access to private personal repositories, you can use collaborators. To
manage push and pull access to private organization repositories, you can use
roles, teams, or organization access tokens.
@z

@x
### Change repository visibility
@y
### Change repository visibility
@z

@x
When creating a repository in Docker Hub, you can set the repository visibility.
In addition, you can set the default repository visibility when a repository is
created in your personal repository settings. The following describes how to
change the visibility after the repository has been created.
@y
When creating a repository in Docker Hub, you can set the repository visibility.
In addition, you can set the default repository visibility when a repository is
created in your personal repository settings. The following describes how to
change the visibility after the repository has been created.
@z

@x
To change repository visibility:
@y
To change repository visibility:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Select a repository.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Settings** tab.
5. Under **Visibility settings**, select one of the following:
@y
4. Select the **Settings** tab.
5. Under **Visibility settings**, select one of the following:
@z

@x
   - **Make public**: The repository appears in Docker Hub search results and can be
     pulled by everyone.
   - **Make private**: The repository doesn't appear in Docker Hub search results
     and is only accessible to you and collaborators. In addition, if the
     repository is in an organization's namespace, then the repository
     is accessible to those with applicable roles or permissions.
@y
   - **Make public**: The repository appears in Docker Hub search results and can be
     pulled by everyone.
   - **Make private**: The repository doesn't appear in Docker Hub search results
     and is only accessible to you and collaborators. In addition, if the
     repository is in an organization's namespace, then the repository
     is accessible to those with applicable roles or permissions.
@z

@x
6. Type the repository's name to verify the change.
7. Select **Make public** or **Make private**.
@y
6. Type the repository's name to verify the change.
7. Select **Make public** or **Make private**.
@z

@x
## Collaborators
@y
## Collaborators
@z

@x
A collaborator is someone you want to give `push` and `pull` access to a
personal repository. Collaborators aren't able to perform any administrative
tasks such as deleting the repository or changing its visibility from private to
public. In addition, collaborators can't add other collaborators.
@y
A collaborator is someone you want to give `push` and `pull` access to a
personal repository. Collaborators aren't able to perform any administrative
tasks such as deleting the repository or changing its visibility from private to
public. In addition, collaborators can't add other collaborators.
@z

@x
Only personal repositories can use collaborators. You can add unlimited
collaborators to public repositories, and Docker Pro accounts can add up to 1
collaborator on private repositories.
@y
Only personal repositories can use collaborators. You can add unlimited
collaborators to public repositories, and Docker Pro accounts can add up to 1
collaborator on private repositories.
@z

@x
Organization repositories can't use collaborators, but can use member roles,
teams, or organization access tokens to manage access.
@y
Organization repositories can't use collaborators, but can use member roles,
teams, or organization access tokens to manage access.
@z

@x
### Manage collaborators
@y
### Manage collaborators
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **My Hub** > **Repositories**.
@y
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Collaborators** tab.
@y
4. Select the **Collaborators** tab.
@z

@x
5. Add or remove collaborators based on their Docker username.
@y
5. Add or remove collaborators based on their Docker username.
@z

@x
You can choose collaborators and manage their access to a private
repository from that repository's **Settings** page.
@y
You can choose collaborators and manage their access to a private
repository from that repository's **Settings** page.
@z

@x
## Organization roles
@y
## Organization roles
@z

@x
Organizations can use roles for individuals, giving them different
permissions in the organization. For more details, see [Roles and
permissions](/manuals/security/for-admins/roles-and-permissions.md).
@y
Organizations can use roles for individuals, giving them different
permissions in the organization. For more details, see [Roles and
permissions](manuals/security/for-admins/roles-and-permissions.md).
@z

@x
## Organization teams
@y
## Organization teams
@z

@x
Organizations can use teams. A team can be assigned fine-grained repository
access.
@y
Organizations can use teams. A team can be assigned fine-grained repository
access.
@z

@x
### Configure team repository permissions
@y
### Configure team repository permissions
@z

@x
You must create a team before you are able to configure repository permissions.
For more details, see [Create and manage a
team](/manuals/admin/organization/manage-a-team.md).
@y
You must create a team before you are able to configure repository permissions.
For more details, see [Create and manage a
team](manuals/admin/organization/manage-a-team.md).
@z

@x
To configure team repository permissions:
@y
To configure team repository permissions:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **My Hub** > **Repositories**.
@y
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Permissions** tab.
@y
4. Select the **Permissions** tab.
@z

@x
5. Add, modify, or remove a team's repository permissions.
@y
5. Add, modify, or remove a team's repository permissions.
@z

@x
   - Add: Specify the **Team**, select the **Permission**, and then select **Add**.
   - Modify: Specify the new permission next to the team.
   - Remove: Select the **Remove permission** icon next to the team.
@y
   - Add: Specify the **Team**, select the **Permission**, and then select **Add**.
   - Modify: Specify the new permission next to the team.
   - Remove: Select the **Remove permission** icon next to the team.
@z

@x
## Organization access tokens (OATs)
@y
## Organization access tokens (OATs)
@z

@x
Organizations can use OATs. OATs let you assign fine-grained repository access
permissions to tokens. For more details, see [Organization access
tokens](/manuals/security/for-admins/access-tokens.md).
@y
Organizations can use OATs. OATs let you assign fine-grained repository access
permissions to tokens. For more details, see [Organization access
tokens](manuals/security/for-admins/access-tokens.md).
@z
