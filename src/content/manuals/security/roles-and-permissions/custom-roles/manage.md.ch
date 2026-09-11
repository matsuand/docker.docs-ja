%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage custom roles in Docker Home
linkTitle: Manage
description: >-
  Create, edit, assign, reassign, and delete custom roles in Docker Home
  for organization users and teams
keywords: >-
  custom roles, manage custom roles, role assignments, access control,
  Docker Home, Docker Business, organization roles, permissions, teams
@y
title: Manage custom roles in Docker Home
linkTitle: Manage
description: >-
  Create, edit, assign, reassign, and delete custom roles in Docker Home
  for organization users and teams
keywords: >-
  custom roles, manage custom roles, role assignments, access control,
  Docker Home, Docker Business, organization roles, permissions, teams
@z

@x
{{< summary-bar feature_name="Custom roles" >}}
@y
{{< summary-bar feature_name="Custom roles" >}}
@z

@x
Create custom roles, manage their permissions, and assign them to users
and teams. Use a custom role to grant only the permissions a user or
team needs. For a full list of permissions, see the
[custom roles permissions reference](permissions-reference.md).
@y
Create custom roles, manage their permissions, and assign them to users
and teams. Use a custom role to grant only the permissions a user or
team needs. For a full list of permissions, see the
[custom roles permissions reference](permissions-reference.md).
@z

@x
## Create a custom role
@y
## Create a custom role
@z

@x
Before you can assign a custom role, create one:
@y
Before you can assign a custom role, create one:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**, then **Create role**.
1. Define the role:
   - Provide a **Label**
   - Enter a unique **Name** identifier. The identifier is permanent.
   - Add an optional **Description**
1. Set permissions for the role by expanding permission categories and
   selecting the checkboxes for permissions. For a full list of available
   permissions, see the
   [custom roles permissions reference](permissions-reference.md).
1. Select **Review** to review the configuration and selected permissions.
1. Select **Create**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**, then **Create role**.
1. Define the role:
   - Provide a **Label**
   - Enter a unique **Name** identifier. The identifier is permanent.
   - Add an optional **Description**
1. Set permissions for the role by expanding permission categories and
   selecting the checkboxes for permissions. For a full list of available
   permissions, see the
   [custom roles permissions reference](permissions-reference.md).
1. Select **Review** to review the configuration and selected permissions.
1. Select **Create**.
@z

@x
After you create a custom role, you can
[assign it to users or teams](#assign-custom-roles).
@y
After you create a custom role, you can
[assign it to users or teams](#assign-custom-roles).
@z

@x
## Edit a custom role
@y
## Edit a custom role
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**.
1. Find your custom role in the list, then select the **Actions** menu.
1. Select **Edit**.
1. Edit any of the following settings:
   - **Label**
   - **Description**
   - **Permissions**
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**.
1. Find your custom role in the list, then select the **Actions** menu.
1. Select **Edit**.
1. Edit any of the following settings:
   - **Label**
   - **Description**
   - **Permissions**
1. Select **Save**.
@z

@x
## Assign custom roles
@y
## Assign custom roles
@z

@x
{{< tabs >}}
{{< tab name="Individual users" >}}
@y
{{< tabs >}}
{{< tab name="Individual users" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Locate the member you want to assign a custom role to, then select the
   **Actions** menu.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select your custom role.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Locate the member you want to assign a custom role to, then select the
   **Actions** menu.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select your custom role.
1. Select **Save**.
@z

@x
{{< /tab >}}
{{< tab name="Bulk users" >}}
@y
{{< /tab >}}
{{< tab name="Bulk users" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Use the checkboxes in the username column to select the users you want
   to assign a custom role to.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select your custom role or
   a core role.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Use the checkboxes in the username column to select the users you want
   to assign a custom role to.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select your custom role or
   a core role.
1. Select **Save**.
@z

@x
{{< /tab >}}
{{< tab name="Teams" >}}
@y
{{< /tab >}}
{{< tab name="Teams" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Teams**.
1. Locate the team you want to assign a custom role to, then select the
   **Actions** menu.
1. Select **Assign role**.
1. Select your custom role, then select **Assign**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Teams**.
1. Locate the team you want to assign a custom role to, then select the
   **Actions** menu.
1. Select **Assign role**.
1. Select your custom role, then select **Assign**.
@z

@x
The role column updates to the newly assigned role.
@y
The role column updates to the newly assigned role.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## View role assignments
@y
## View role assignments
@z

@x
To see which users and teams are assigned to roles:
@y
To see which users and teams are assigned to roles:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**.
1. In the roles list, view the **Users** and **Teams** columns for
   assignment counts.
1. Select a role to view its permissions and assignments in detail.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**.
1. In the roles list, view the **Users** and **Teams** columns for
   assignment counts.
1. Select a role to view its permissions and assignments in detail.
@z

@x
## Reassign custom roles
@y
## Reassign custom roles
@z

@x
{{< tabs >}}
{{< tab name="Individual users" >}}
@y
{{< tabs >}}
{{< tab name="Individual users" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Locate the member you want to reassign, then select the **Actions**
   menu.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select the new role.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Locate the member you want to reassign, then select the **Actions**
   menu.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select the new role.
1. Select **Save**.
@z

@x
{{< /tab >}}
{{< tab name="Bulk users" >}}
@y
{{< /tab >}}
{{< tab name="Bulk users" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Use the checkboxes in the username column to select the users you want
   to reassign.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select the new role.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Members**.
1. Use the checkboxes in the username column to select the users you want
   to reassign.
1. Select **Change role**.
1. From the **Select a role** drop-down list, select the new role.
1. Select **Save**.
@z

@x
{{< /tab >}}
{{< tab name="Teams" >}}
@y
{{< /tab >}}
{{< tab name="Teams" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Teams**.
1. Locate the team, then select the **Actions** menu.
1. Select **Change role**.
1. From the drop-down list, select a role, then select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Teams**.
1. Locate the team, then select the **Actions** menu.
1. Select **Change role**.
1. From the drop-down list, select a role, then select **Save**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Delete a custom role
@y
## Delete a custom role
@z

@x
> [!IMPORTANT]
>
> Before you delete a custom role, reassign every user and team that uses
> it to a different role.
@y
> [!IMPORTANT]
>
> Before you delete a custom role, reassign every user and team that uses
> it to a different role.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**.
1. Find your custom role in the list, then select the **Actions** menu.
1. If the role has assigned users or teams:
   - On the **Members** page, change the role for every user assigned to
     this custom role
   - On the **Teams** page, reassign every team that has this custom role
1. When no users or teams are assigned, return to **Roles**.
1. Find your custom role and select the **Actions** menu.
1. Select **Delete**.
1. In the confirmation window, select **Delete** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Roles**.
1. Find your custom role in the list, then select the **Actions** menu.
1. If the role has assigned users or teams:
   - On the **Members** page, change the role for every user assigned to
     this custom role
   - On the **Teams** page, reassign every team that has this custom role
1. When no users or teams are assigned, return to **Roles**.
1. Find your custom role and select the **Actions** menu.
1. Select **Delete**.
1. In the confirmation window, select **Delete** to confirm.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Custom roles permissions reference](permissions-reference.md): Review
  permissions you can grant to a custom role
- [Core roles and permissions](/manuals/security/roles-and-permissions/core-roles.md):
  Compare built-in Member, Editor, and Owner permissions
- [Manage organization members](/manuals/accounts/organization/manage/members.md):
  Invite and manage users in your organization
@y
- [Custom roles permissions reference](permissions-reference.md): Review
  permissions you can grant to a custom role
- [Core roles and permissions](manuals/security/roles-and-permissions/core-roles.md):
  Compare built-in Member, Editor, and Owner permissions
- [Manage organization members](manuals/accounts/organization/manage/members.md):
  Invite and manage users in your organization
@z
