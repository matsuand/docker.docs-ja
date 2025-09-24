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
permissions](/manuals/enterprise/security/roles-and-permissions.md).
@y
Organizations can use roles for individuals, giving them different
permissions in the organization. For more details, see [Roles and
permissions](manuals/enterprise/security/roles-and-permissions.md).
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
tokens](/manuals/enterprise/security/access-tokens.md).
@y
Organizations can use OATs. OATs let you assign fine-grained repository access
permissions to tokens. For more details, see [Organization access
tokens](manuals/enterprise/security/access-tokens.md).
@z

@x
## Gated distribution
@y
## Gated distribution
@z

@x
{{< summary-bar feature_name="Gated distribution" >}}
@y
{{< summary-bar feature_name="Gated distribution" >}}
@z

@x
Gated distribution allows publishers to securely share private container images with external customers or partners, without giving them full organization access or visibility into your teams, collaborators, or other repositories.
@y
Gated distribution allows publishers to securely share private container images with external customers or partners, without giving them full organization access or visibility into your teams, collaborators, or other repositories.
@z

@x
This feature is ideal for commercial software publishers who want to control who can pull specific images while preserving a clean separation between internal users and external consumers.
@y
This feature is ideal for commercial software publishers who want to control who can pull specific images while preserving a clean separation between internal users and external consumers.
@z

@x
If you are interested in Gated Distribution contact the [Docker Sales Team](https://www.docker.com/pricing/contact-sales/) for more information.
@y
If you are interested in Gated Distribution contact the [Docker Sales Team](https://www.docker.com/pricing/contact-sales/) for more information.
@z

@x
### Key features
@y
### Key features
@z

@x
- **Private repository distribution**: Content is stored in private repositories and only accessible to explicitly invited users.
@y
- **Private repository distribution**: Content is stored in private repositories and only accessible to explicitly invited users.
@z

@x
- **External access without organization membership**: External users don't need to be added to your internal organization to pull images.
@y
- **External access without organization membership**: External users don't need to be added to your internal organization to pull images.
@z

@x
- **Pull-only permissions**: External users receive pull-only access and cannot push or modify repository content.
@y
- **Pull-only permissions**: External users receive pull-only access and cannot push or modify repository content.
@z

@x
- **Invite-only access**: Access is granted through authenticated email invites, managed via API.
@y
- **Invite-only access**: Access is granted through authenticated email invites, managed via API.
@z

@x
### Invite distributor members via API
@y
### Invite distributor members via API
@z

@x
> [!NOTE]
> When you invite members, you assign them a role. See [Roles and permissions](/manuals/enterprise/security/roles-and-permissions.md) for details about the access permissions for each role.
@y
> [!NOTE]
> When you invite members, you assign them a role. See [Roles and permissions](manuals/enterprise/security/roles-and-permissions.md) for details about the access permissions for each role.
@z

@x
Distributor members (used for gated distribution) can only be invited using the Docker Hub API. UI-based invitations are not currently supported for this role. To invite distributor members, use the Bulk create invites API endpoint.
@y
Distributor members (used for gated distribution) can only be invited using the Docker Hub API. UI-based invitations are not currently supported for this role. To invite distributor members, use the Bulk create invites API endpoint.
@z

@x
To invite distributor members:
@y
To invite distributor members:
@z

@x
1. Use the [Authentication API](https://docs.docker.com/reference/api/hub/latest/#tag/authentication-api/operation/AuthCreateAccessToken) to generate a bearer token for your Docker Hub account.
@y
1. Use the [Authentication API](https://docs.docker.com/reference/api/hub/latest/#tag/authentication-api/operation/AuthCreateAccessToken) to generate a bearer token for your Docker Hub account.
@z

@x
2. Create a team in the Hub UI or use the [Teams API](https://docs.docker.com/reference/api/hub/latest/#tag/groups/paths/~1v2~1orgs~1%7Borg_name%7D~1groups/post).
@y
2. Create a team in the Hub UI or use the [Teams API](https://docs.docker.com/reference/api/hub/latest/#tag/groups/paths/~1v2~1orgs~1%7Borg_name%7D~1groups/post).
@z

@x
3. Grant repository access to the team:
   - In the Hub UI: Navigate to your repository settings and add the team with "Read-only" permissions
   - Using the [Repository Teams API](https://docs.docker.com/reference/api/hub/latest/#tag/repositories/paths/~1v2~1repositories~1%7Bnamespace%7D~1%7Brepository%7D~1groups/post): Assign the team to your repositories with "read-only" access level
@y
3. Grant repository access to the team:
   - In the Hub UI: Navigate to your repository settings and add the team with "Read-only" permissions
   - Using the [Repository Teams API](https://docs.docker.com/reference/api/hub/latest/#tag/repositories/paths/~1v2~1repositories~1%7Bnamespace%7D~1%7Brepository%7D~1groups/post): Assign the team to your repositories with "read-only" access level
@z

@x
4. Use the [Bulk create invites endpoint](https://docs.docker.com/reference/api/hub/latest/#tag/invites/paths/~1v2~1invites~1bulk/post) to send email invites with the distributor member role. In the request body, set the "role" field to "distributor_member".
@y
4. Use the [Bulk create invites endpoint](https://docs.docker.com/reference/api/hub/latest/#tag/invites/paths/~1v2~1invites~1bulk/post) to send email invites with the distributor member role. In the request body, set the "role" field to "distributor_member".
@z

@x
5. The invited user will receive an email with a link to accept the invite. After signing in with their Docker ID, they'll be granted pull-only access to the specified private repository as a distributor member.
@y
5. The invited user will receive an email with a link to accept the invite. After signing in with their Docker ID, they'll be granted pull-only access to the specified private repository as a distributor member.
@z
