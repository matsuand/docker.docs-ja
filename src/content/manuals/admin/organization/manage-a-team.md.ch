%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Create and manage a team
@y
title: Create and manage a team
@z

@x
description: Learn how to create and manage teams for your organization
keywords: docker, registry, teams, organizations, plans, Dockerfile, Docker
  Hub, docs, documentation, repository permissions, configure repository access, team management
@y
description: Learn how to create and manage teams for your organization
keywords: docker, registry, teams, organizations, plans, Dockerfile, Docker
  Hub, docs, documentation, repository permissions, configure repository access, team management
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
You can create teams for your organization in the Admin Console or Docker Hub,
and configure team repository access in Docker Hub.
@y
You can create teams for your organization in the Admin Console or Docker Hub,
and configure team repository access in Docker Hub.
@z

@x
A team is a group of Docker users that belong to an organization. An
organization can have multiple teams. An organization owner can create new
teams and add members to an existing team using their Docker ID or email
address. Members aren't required to be part of a team to be associated with an
organization.
@y
A team is a group of Docker users that belong to an organization. An
organization can have multiple teams. An organization owner can create new
teams and add members to an existing team using their Docker ID or email
address. Members aren't required to be part of a team to be associated with an
organization.
@z

@x
The organization owner can add additional organization owners to help them
manage users, teams, and repositories in the organization by assigning them
the owner role.
@y
The organization owner can add additional organization owners to help them
manage users, teams, and repositories in the organization by assigning them
the owner role.
@z

@x
## What is an organization owner?
@y
## What is an organization owner?
@z

@x
An organization owner is an administrator who has the following permissions:
@y
An organization owner is an administrator who has the following permissions:
@z

@x
- Manage repositories and add team members to the organization
- Access private repositories, all teams, billing information, and
organization settings
- Specify [permissions](#permissions-reference) for each team in the
organization
- Enable [SSO](/manuals/enterprise/security/single-sign-on/_index.md) for the
organization
@y
- Manage repositories and add team members to the organization
- Access private repositories, all teams, billing information, and
organization settings
- Specify [permissions](#permissions-reference) for each team in the
organization
- Enable [SSO](manuals/enterprise/security/single-sign-on/_index.md) for the
organization
@z

@x
When SSO is enabled for your organization, the organization owner can
also manage users. Docker can auto-provision Docker IDs for new end-users or
users who'd like to have a separate Docker ID for company use through SSO
enforcement.
@y
When SSO is enabled for your organization, the organization owner can
also manage users. Docker can auto-provision Docker IDs for new end-users or
users who'd like to have a separate Docker ID for company use through SSO
enforcement.
@z

@x
Organization owners can add others with the owner role to help them
manage users, teams, and repositories in the organization.
@y
Organization owners can add others with the owner role to help them
manage users, teams, and repositories in the organization.
@z

@x
For more information on roles, see
[Roles and permissions](/manuals/enterprise/security/roles-and-permissions.md).
@y
For more information on roles, see
[Roles and permissions](manuals/enterprise/security/roles-and-permissions.md).
@z

@x
## Create a team
@y
## Create a team
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
organization.
1. Select **Teams**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
organization.
1. Select **Teams**.
@z

@x
## Set team repository permissions
@y
## Set team repository permissions
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
To set team repository permissions:
@y
To set team repository permissions:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub** > **Repositories**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
1. Select a repository.
@y
1. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
1. Select the **Permissions** tab.
1. Add, modify, or remove a team's repository permissions.
@y
1. Select the **Permissions** tab.
1. Add, modify, or remove a team's repository permissions.
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
### Permissions reference
@y
### Permissions reference
@z

@x
- `Read-only` access lets users view, search, and pull a private repository
in the same way as they can a public repository.
- `Read & Write` access lets users pull, push, and view a repository. In
addition, it lets users view, cancel, retry or trigger builds.
- `Admin` access lets users pull, push, view, edit, and delete a
  repository. You can also edit build settings and update the repository’s
  description, collaborator permissions, public/private visibility, and delete.
@y
- `Read-only` access lets users view, search, and pull a private repository
in the same way as they can a public repository.
- `Read & Write` access lets users pull, push, and view a repository. In
addition, it lets users view, cancel, retry or trigger builds.
- `Admin` access lets users pull, push, view, edit, and delete a
  repository. You can also edit build settings and update the repository’s
  description, collaborator permissions, public/private visibility, and delete.
@z

@x
Permissions are cumulative. For example, if you have "Read & Write" permissions,
you automatically have "Read-only" permissions.
@y
Permissions are cumulative. For example, if you have "Read & Write" permissions,
you automatically have "Read-only" permissions.
@z

@x
The following table shows what each permission level allows users to do:
@y
The following table shows what each permission level allows users to do:
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
> [!NOTE]
>
> A user who hasn't verified their email address only has `Read-only` access to
the repository, regardless of the rights their team membership has given them.
@y
> [!NOTE]
>
> A user who hasn't verified their email address only has `Read-only` access to
the repository, regardless of the rights their team membership has given them.
@z

@x
## View team permissions for all repositories
@y
## View team permissions for all repositories
@z

@x
To view a team's permissions across all repositories:
@y
To view a team's permissions across all repositories:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub** and choose your organization.
1. Select **Teams** and choose your team name.
1. Select the **Permissions** tab, where you can view the repositories this
team can access.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select **My Hub** and choose your organization.
1. Select **Teams** and choose your team name.
1. Select the **Permissions** tab, where you can view the repositories this
team can access.
@z

@x
## Delete a team
@y
## Delete a team
@z

@x
Organization owners can delete a team. When you remove a team from your
organization, this action revokes member access to the team's permitted
resources. It won't remove users from other teams that they belong to, and it
won't delete any resources.
@y
Organization owners can delete a team. When you remove a team from your
organization, this action revokes member access to the team's permitted
resources. It won't remove users from other teams that they belong to, and it
won't delete any resources.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Teams**.
1. Select the **Actions** icon next to the name of the team you want to delete.
1. Select **Delete team**.
1. Review the confirmation message, then select **Delete**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Teams**.
1. Select the **Actions** icon next to the name of the team you want to delete.
1. Select **Delete team**.
1. Review the confirmation message, then select **Delete**.
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
