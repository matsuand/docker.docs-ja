%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to create and manage teams for your organization
keywords: Docker, docker, registry, teams, organizations, plans, Dockerfile, Docker
  Hub, docs, documentation, repository permissions
title: Create and manage a team
aliases:
- /docker-hub/manage-a-team/
---
@y
---
description: Learn how to create and manage teams for your organization
keywords: Docker, docker, registry, teams, organizations, plans, Dockerfile, Docker
  Hub, docs, documentation, repository permissions
title: Create and manage a team
aliases:
- /docker-hub/manage-a-team/
---
@z

@x
You can create teams for your organization in Docker Hub and the Docker Admin Console. You can [configure repository access for a team](#configure-repository-permissions-for-a-team) in Docker Hub.
@y
You can create teams for your organization in Docker Hub and the Docker Admin Console. You can [configure repository access for a team](#configure-repository-permissions-for-a-team) in Docker Hub.
@z

@x
A team is a group of Docker users that belong to an organization. An
organization can have multiple teams. An
organization owner can then create new teams and add members to an existing team
using their Docker ID or email address and by selecting a team the user should be part of. Members aren't required to be part of a team to be associated with an organization.
@y
A team is a group of Docker users that belong to an organization. An
organization can have multiple teams. An
organization owner can then create new teams and add members to an existing team
using their Docker ID or email address and by selecting a team the user should be part of. Members aren't required to be part of a team to be associated with an organization.
@z

@x
The organization owner can add additional organization owners to help them manage users, teams, and repositories in the organization by assigning them the owner role.
@y
The organization owner can add additional organization owners to help them manage users, teams, and repositories in the organization by assigning them the owner role.
@z

@x
## Organization owner
@y
## Organization owner
@z

@x
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and org settings. An org
owner can also specify [permissions](#permissions-reference) for each team in
the organization. Only an org owner can enable [SSO](../../security/for-admins/single-sign-on/_index.md)
for
the organization. When SSO is enabled for your organization, the org owner can
also manage users. Docker can auto-provision Docker IDs for new end-users or
users who'd like to have a separate Docker ID for company use through SSO
enforcement.
@y
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and org settings. An org
owner can also specify [permissions](#permissions-reference) for each team in
the organization. Only an org owner can enable [SSO](../../security/for-admins/single-sign-on/_index.md)
for
the organization. When SSO is enabled for your organization, the org owner can
also manage users. Docker can auto-provision Docker IDs for new end-users or
users who'd like to have a separate Docker ID for company use through SSO
enforcement.
@z

@x
The org owner can also add additional org owners to help them manage users, teams, and repositories in the organization.
@y
The org owner can also add additional org owners to help them manage users, teams, and repositories in the organization.
@z

@x
## Create a team
@y
## Create a team
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Select the **Teams** tab and then select **Create Team**.
3. Fill out your team's information and select **Create**.
4. [Add members to your team](members.md#add-a-member-to-a-team).
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Select the **Teams** tab and then select **Create Team**.
3. Fill out your team's information and select **Create**.
4. [Add members to your team](members.md#add-a-member-to-a-team).
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
1. In Admin Console, select your organization.
2. In the **User management** section, select **Teams**.
3. Select **Create team**.
4. Fill out your team's information and select **Create**.
5. [Add members to your team](members.md#add-a-member-to-a-team).
@y
1. In Admin Console, select your organization.
2. In the **User management** section, select **Teams**.
3. Select **Create team**.
4. Fill out your team's information and select **Create**.
5. [Add members to your team](members.md#add-a-member-to-a-team).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Configure repository permissions for a team
@y
## Configure repository permissions for a team
@z

@x
Organization owners can configure repository permissions on a per-team basis.
For example, you can specify that all teams within an organization have "Read and
Write" access to repositories A and B, whereas only specific teams have "Admin"
access. Note that org owners have full administrative access to all repositories within the organization.
@y
Organization owners can configure repository permissions on a per-team basis.
For example, you can specify that all teams within an organization have "Read and
Write" access to repositories A and B, whereas only specific teams have "Admin"
access. Note that org owners have full administrative access to all repositories within the organization.
@z

@x
To give a team access to a repository
@y
To give a team access to a repository
@z

@x
1. Navigate to **Organizations** in Docker Hub, and select your organization.
2. Select the **Teams** tab and select the team that you'd like to configure repository access to.
3. Select the **Permissions** tab and select a repository from the
   **Repository** drop-down.
4. Choose a permission from the **Permissions** drop-down list and select
   **Add**.
@y
1. Navigate to **Organizations** in Docker Hub, and select your organization.
2. Select the **Teams** tab and select the team that you'd like to configure repository access to.
3. Select the **Permissions** tab and select a repository from the
   **Repository** drop-down.
4. Choose a permission from the **Permissions** drop-down list and select
   **Add**.
@z

@x
    ![Team Repo Permissions](../images/team-repo-permission.png)
@y
    ![Team Repo Permissions](../images/team-repo-permission.png)
@z

@x
Organization owners can also assign members the editor role to grant partial administrative access. See [Roles and permissions](../../security/for-admins/roles-and-permissions.md) for more about the editor role.
@y
Organization owners can also assign members the editor role to grant partial administrative access. See [Roles and permissions](../../security/for-admins/roles-and-permissions.md) for more about the editor role.
@z

@x
### Permissions reference
@y
### Permissions reference
@z

@x
- `Read-only` access lets users view, search, and pull a private repository in the same way as they can a public repository.
- `Read & Write` access lets users pull, push, and view a repository. In addition, it lets users view, cancel, retry or trigger builds
- `Admin` access lets users pull, push, view, edit, and delete a
  repository. You can also edit build settings, and update the repositories description, collaborators rights, public/private visibility, and delete.
@y
- `Read-only` access lets users view, search, and pull a private repository in the same way as they can a public repository.
- `Read & Write` access lets users pull, push, and view a repository. In addition, it lets users view, cancel, retry or trigger builds
- `Admin` access lets users pull, push, view, edit, and delete a
  repository. You can also edit build settings, and update the repositories description, collaborators rights, public/private visibility, and delete.
@z

@x
Permissions are cumulative. For example, if you have "Read & Write" permissions,
you automatically have "Read-only" permissions:
@y
Permissions are cumulative. For example, if you have "Read & Write" permissions,
you automatically have "Read-only" permissions:
@z

@x
| Action | Read-only | Read & Write | Admin |
|:------------------:|:---------:|:------------:|:-----:|
| Pull a Repository | ✅ | ✅ | ✅ |
| View a Repository | ✅ | ✅ | ✅ |
| Push a Repository | ❌ | ✅ | ✅ |
| Edit a Repository | ❌ | ❌ | ✅ |
| Delete a Repository | ❌ | ❌ | ✅ |
| Update a Repository Description | ❌ | ❌ | ✅ |
| View Builds | ✅ | ✅ | ✅ |
| Cancel Builds | ❌ | ✅ | ✅ |
| Retry Builds | ❌ | ✅ | ✅ |
| Trigger Builds | ❌ | ✅ | ✅ |
| Edit Build Settings | ❌ | ❌ | ✅ |
@y
| Action | Read-only | Read & Write | Admin |
|:------------------:|:---------:|:------------:|:-----:|
| Pull a Repository | ✅ | ✅ | ✅ |
| View a Repository | ✅ | ✅ | ✅ |
| Push a Repository | ❌ | ✅ | ✅ |
| Edit a Repository | ❌ | ❌ | ✅ |
| Delete a Repository | ❌ | ❌ | ✅ |
| Update a Repository Description | ❌ | ❌ | ✅ |
| View Builds | ✅ | ✅ | ✅ |
| Cancel Builds | ❌ | ✅ | ✅ |
| Retry Builds | ❌ | ✅ | ✅ |
| Trigger Builds | ❌ | ✅ | ✅ |
| Edit Build Settings | ❌ | ❌ | ✅ |
@z

@x
> **Note**
>
> A user who hasn't verified their email address only has
> `Read-only` access to the repository, regardless of the rights their team
> membership has given them.
@y
> **Note**
>
> A user who hasn't verified their email address only has
> `Read-only` access to the repository, regardless of the rights their team
> membership has given them.
@z

@x
## View a team's permissions for all repositories
@y
## View a team's permissions for all repositories
@z

@x
To view a team's permissions across all repositories:
@y
To view a team's permissions across all repositories:
@z

@x
1. Open **Organizations** > **_Your Organization_** > **Teams** > **_Team Name_**.
2. Select the **Permissions** tab, where you can view the repositories this team can access.
@y
1. Open **Organizations** > **_Your Organization_** > **Teams** > **_Team Name_**.
2. Select the **Permissions** tab, where you can view the repositories this team can access.
@z

@x
## Delete a team
@y
## Delete a team
@z

@x
Organization owners can delete a team in Docker Hub or Admin Console. When you remove a team from your organization, this action revokes the members' access to the team's permitted resources. It won't remove users from other teams that they belong to, nor will it delete any resources.
@y
Organization owners can delete a team in Docker Hub or Admin Console. When you remove a team from your organization, this action revokes the members' access to the team's permitted resources. It won't remove users from other teams that they belong to, nor will it delete any resources.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Select the **Teams** tab.
3. Select the name of the team that you want to delete.
4. Select **Settings**.
5. Select **Delete Team**.
6. Review the confirmation message, then select **Delete**.
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Select the **Teams** tab.
3. Select the name of the team that you want to delete.
4. Select **Settings**.
5. Select **Delete Team**.
6. Review the confirmation message, then select **Delete**.
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
1. In Admin Console, select your organization.
2. In the **User management** section, select **Teams**.
3. Select the **Actions** icon next to the name of the team you want to delete.
4. Select **Delete team**.
5. Review the confirmation message, then select **Delete**.
@y
1. In Admin Console, select your organization.
2. In the **User management** section, select **Teams**.
3. Select the **Actions** icon next to the name of the team you want to delete.
4. Select **Delete team**.
5. Review the confirmation message, then select **Delete**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## More resources
@y
## More resources
@z

@x
- [Video: Docker teams](https://youtu.be/WKlT1O-4Du8?feature=shared&t=348)
- [Video: Roles, teams, and repositories](https://youtu.be/WKlT1O-4Du8?feature=shared&t=435)
@y
- [Video: Docker teams](https://youtu.be/WKlT1O-4Du8?feature=shared&t=348)
- [Video: Roles, teams, and repositories](https://youtu.be/WKlT1O-4Du8?feature=shared&t=435)
@z
