%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Custom roles
description: Create tailored permission sets for your organization with custom roles
keywords: custom roles, permissions, access control, organization management, docker hub, admin console, security
@y
title: Custom roles
description: Create tailored permission sets for your organization with custom roles
keywords: custom roles, permissions, access control, organization management, docker hub, admin console, security
@z

@x
{{< summary-bar feature_name="General admin" >}}
@y
{{< summary-bar feature_name="General admin" >}}
@z

@x
Custom roles allow you to create tailored permission sets that match your
organization's specific needs. This page covers custom roles and steps
to create and manage them.
@y
Custom roles allow you to create tailored permission sets that match your
organization's specific needs. This page covers custom roles and steps
to create and manage them.
@z

@x
## What are custom roles?
@y
## What are custom roles?
@z

@x
Custom roles let you create tailored permission sets for your organization. You
can assign custom roles to individual users or teams.
Users and teams get either a core role or custom role, but not both.
@y
Custom roles let you create tailored permission sets for your organization. You
can assign custom roles to individual users or teams.
Users and teams get either a core role or custom role, but not both.
@z

@x
Use custom roles when Docker's core roles don't fit your needs.
@y
Use custom roles when Docker's core roles don't fit your needs.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To configure custom roles, you need owner permissions in your Docker
organization.
@y
To configure custom roles, you need owner permissions in your Docker
organization.
@z

@x
## Create a custom role
@y
## Create a custom role
@z

@x
Before you can assign a custom role to users, you must create one in the
Admin Console:
@y
Before you can assign a custom role to users, you must create one in the
Admin Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**, then **Create role**.
4. Create a name and describe what the role is for:
   - Provide a **Label**
   - Enter a unique **Name** identifier (can't be changed later)
   - Add an optional **Description**
5. Set permissions for the role by expanding permission categories and selecting
   the checkboxes for permissions. For a full list of available permissions, see
   the [custom roles permissions reference](#custom-roles-permissions-reference).
6. Select **Review** to review your custom roles configuration and see a summary
   of selected permissions.
7. Select **Create**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**, then **Create role**.
4. Create a name and describe what the role is for:
   - Provide a **Label**
   - Enter a unique **Name** identifier (can't be changed later)
   - Add an optional **Description**
5. Set permissions for the role by expanding permission categories and selecting
   the checkboxes for permissions. For a full list of available permissions, see
   the [custom roles permissions reference](#custom-roles-permissions-reference).
6. Select **Review** to review your custom roles configuration and see a summary
   of selected permissions.
7. Select **Create**.
@z

@x
With a custom role created, you can now [assign custom roles to users](#assign-custom-roles).
@y
With a custom role created, you can now [assign custom roles to users](#assign-custom-roles).
@z

@x
## Edit a custom role
@y
## Edit a custom role
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**.
4. Find your custom role from the list, and select the **Actions menu**.
5. Select **Edit**.
6. You can edit the following custom role settings:
   - Label
   - Description
   - Permissions
7. After you have finished editing, select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**.
4. Find your custom role from the list, and select the **Actions menu**.
5. Select **Edit**.
6. You can edit the following custom role settings:
   - Label
   - Description
   - Permissions
7. After you have finished editing, select **Save**.
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
2. Select **Members**.
3. Locate the member you want to assign a custom role to, then select the
   **Actions menu**.
4. In the drop-down, select **Change role**.
5. In the **Select a role** drop-down, select your custom role.
6. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Members**.
3. Locate the member you want to assign a custom role to, then select the
   **Actions menu**.
4. In the drop-down, select **Change role**.
5. In the **Select a role** drop-down, select your custom role.
6. Select **Save**.
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
2. Select **Members**.
3. Use the checkboxes in the username column to select all users you want
   to assign a custom role to.
4. Select **Change role**.
5. In the **Select a role** drop-down, select your custom role or a core role.
6. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Members**.
3. Use the checkboxes in the username column to select all users you want
   to assign a custom role to.
4. Select **Change role**.
5. In the **Select a role** drop-down, select your custom role or a core role.
6. Select **Save**.
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
2. Select **Teams**.
3. Locate the team you want to assign a custom role to, then select
   the **Actions menu**.
4. Select **Assign role**.
5. Select your custom role, then select **Assign**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Teams**.
3. Locate the team you want to assign a custom role to, then select
   the **Actions menu**.
4. Select **Assign role**.
5. Select your custom role, then select **Assign**.
@z

@x
The role column will update to the newly assigned role.
@y
The role column will update to the newly assigned role.
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
2. Select **Admin Console**, then **User management**.
3. Select **Roles**.
4. In the roles list, view the **Users** and **Teams** columns to see
   assignment counts.
5. Select a specific role to view its permissions and assignments in detail.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**.
4. In the roles list, view the **Users** and **Teams** columns to see
   assignment counts.
5. Select a specific role to view its permissions and assignments in detail.
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
2. Select **Members**.
3. Locate the member you want to reassign, then select the **Actions menu**.
4. Select **Change role**.
5. In the **Select a role** drop-down, select the new role.
6. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Members**.
3. Locate the member you want to reassign, then select the **Actions menu**.
4. Select **Change role**.
5. In the **Select a role** drop-down, select the new role.
6. Select **Save**.
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
2. Select **Members**.
3. Use the checkboxes in the username column to select all users you want
   to reassign.
4. Select **Change role**.
5. In the **Select a role** drop-down, select the new role.
6. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Members**.
3. Use the checkboxes in the username column to select all users you want
   to reassign.
4. Select **Change role**.
5. In the **Select a role** drop-down, select the new role.
6. Select **Save**.
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
2. Select **Teams**.
3. Locate the team, then select the **Actions menu**.
4. Select **Change role**.
5. In the pop-up window, select a role from the drop-down menu, then
   select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Teams**.
3. Locate the team, then select the **Actions menu**.
4. Select **Change role**.
5. In the pop-up window, select a role from the drop-down menu, then
   select **Save**.
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
Before deleting a custom role, you must reassign all users and teams to different roles.
@y
Before deleting a custom role, you must reassign all users and teams to different roles.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**.
4. Find your custom role from the list, and select the **Actions menu**.
5. If the role has assigned users or teams:
   - Navigate to the **Members** page and change the role for all users assigned to this custom role
   - Navigate to the **Teams** page and reassign all teams that have this custom role
6. Once no users or teams are assigned, return to **Roles**.
7. Find your custom role and select the **Actions menu**.
8. Select **Delete**.
9. In the confirmation window, select **Delete** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com).
2. Select **Admin Console**, then **User management**.
3. Select **Roles**.
4. Find your custom role from the list, and select the **Actions menu**.
5. If the role has assigned users or teams:
   - Navigate to the **Members** page and change the role for all users assigned to this custom role
   - Navigate to the **Teams** page and reassign all teams that have this custom role
6. Once no users or teams are assigned, return to **Roles**.
7. Find your custom role and select the **Actions menu**.
8. Select **Delete**.
9. In the confirmation window, select **Delete** to confirm.
@z

@x
## Custom roles permissions reference
@y
## Custom roles permissions reference
@z

@x
Custom roles are built by selecting specific permissions across different categories. The following tables list all available permissions you can assign to a custom role.
@y
Custom roles are built by selecting specific permissions across different categories. The following tables list all available permissions you can assign to a custom role.
@z

@x
### Organization management
@y
### Organization management
@z

@x
| Permission                        | Description                                                                                     |
| :-------------------------------- | :---------------------------------------------------------------------------------------------- |
| View teams                        | View teams and team members                                                                     |
| Manage teams                      | Create, update, and delete teams and team members                                               |
| Manage registry access            | Control which registries members can access                                                     |
| Manage image access               | Set policies for which images members can pull and use                                          |
| Update organization information   | Update organization information such as name and location                                       |
| Member management                 | Manage organization members, invites, and roles                                                 |
| View custom roles                 | View existing custom roles and their permissions                                                |
| Manage custom roles               | Full access to custom role management and assignment                                            |
| Manage organization access tokens | Create, update, and delete repositories in this org. Push/pull or registry actions not included |
| View activity logs                | Access organization audit logs and activity history                                             |
| View domains                      | View domains and domain audit settings                                                          |
| Manage domains                    | Manage verified domains and domain audit settings                                               |
| View SSO and SCIM                 | View single sign-on and user provisioning configurations                                        |
| Manage SSO and SCIM               | Full access to SSO and SCIM management                                                          |
| Manage Desktop settings           | Configure Docker Desktop settings policies and view usage reports                               |
@y
| Permission                        | Description                                                                                     |
| :-------------------------------- | :---------------------------------------------------------------------------------------------- |
| View teams                        | View teams and team members                                                                     |
| Manage teams                      | Create, update, and delete teams and team members                                               |
| Manage registry access            | Control which registries members can access                                                     |
| Manage image access               | Set policies for which images members can pull and use                                          |
| Update organization information   | Update organization information such as name and location                                       |
| Member management                 | Manage organization members, invites, and roles                                                 |
| View custom roles                 | View existing custom roles and their permissions                                                |
| Manage custom roles               | Full access to custom role management and assignment                                            |
| Manage organization access tokens | Create, update, and delete repositories in this org. Push/pull or registry actions not included |
| View activity logs                | Access organization audit logs and activity history                                             |
| View domains                      | View domains and domain audit settings                                                          |
| Manage domains                    | Manage verified domains and domain audit settings                                               |
| View SSO and SCIM                 | View single sign-on and user provisioning configurations                                        |
| Manage SSO and SCIM               | Full access to SSO and SCIM management                                                          |
| Manage Desktop settings           | Configure Docker Desktop settings policies and view usage reports                               |
@z

@x
### Docker Hub
@y
### Docker Hub
@z

@x
| Permission          | Description                                                |
| :------------------ | :--------------------------------------------------------- |
| View repositories   | View repository details and contents                       |
| Manage repositories | Create, update, and delete repositories and their contents |
@y
| Permission          | Description                                                |
| :------------------ | :--------------------------------------------------------- |
| View repositories   | View repository details and contents                       |
| Manage repositories | Create, update, and delete repositories and their contents |
@z

@x
### Billing
@y
### Billing
@z

@x
| Permission     | Description                                      |
| :------------- | :----------------------------------------------- |
| View billing   | View organization billing information            |
| Manage billing | Complete access to managing organization billing |
@y
| Permission     | Description                                      |
| :------------- | :----------------------------------------------- |
| View billing   | View organization billing information            |
| Manage billing | Complete access to managing organization billing |
@z
