%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: >
  Use roles in your organization to control who has access to content,
  registry, and organization management permissions.
keywords: members, teams, organization, company, roles, access, docker hub, admin console, security 
title: Roles and permissions
@y
description: >
  Use roles in your organization to control who has access to content,
  registry, and organization management permissions.
keywords: members, teams, organization, company, roles, access, docker hub, admin console, security 
title: Roles and permissions
@z

@x
Organization and company owners can assign roles to individuals giving them different permissions in the organization. This guide outlines Docker's organization roles and their permission scopes.
@y
Organization and company owners can assign roles to individuals giving them different permissions in the organization. This guide outlines Docker's organization roles and their permission scopes.
@z

@x
## Roles
@y
## Roles
@z

@x
When you invite users to your organization, you assign them a role. A role is a collection of permissions. Roles define whether users can create repositories, pull images, create teams, and configure organization settings.
@y
When you invite users to your organization, you assign them a role. A role is a collection of permissions. Roles define whether users can create repositories, pull images, create teams, and configure organization settings.
@z

@x
The following roles are available to assign:
@y
The following roles are available to assign:
@z

@x
- Member: Non-administrative role. Members can view other members that are in the same organization.
- Editor: Partial administrative access to the organization. Editors can create, edit, and delete repositories. They can also edit an existing team's access permissions.
- Organization owner: Full organization administrative access. Organization owners can manage organization repositories, teams, members, settings, and billing.
- Company owner: In addition to the permissions of an organization owner, company owners can configure settings for their associated organizations.
@y
- Member: Non-administrative role. Members can view other members that are in the same organization.
- Editor: Partial administrative access to the organization. Editors can create, edit, and delete repositories. They can also edit an existing team's access permissions.
- Organization owner: Full organization administrative access. Organization owners can manage organization repositories, teams, members, settings, and billing.
- Company owner: In addition to the permissions of an organization owner, company owners can configure settings for their associated organizations.
@z

@x
Owners can manage roles for members of an organization using Docker Hub or the Admin Console:
@y
Owners can manage roles for members of an organization using Docker Hub or the Admin Console:
@z

@x
- Update a member role in [Docker Hub](/manuals/admin/organization/members.md#update-a-member-role)
- Update an organization's members or company in the [Admin Console](/manuals/admin/company/users.md#update-a-member-role)
- Learn more about [organizations and companies](/manuals/admin/_index.md)
@y
- Update a member role in [Docker Hub](/manuals/admin/organization/members.md#update-a-member-role)
- Update an organization's members or company in the [Admin Console](/manuals/admin/company/users.md#update-a-member-role)
- Learn more about [organizations and companies](/manuals/admin/_index.md)
@z

@x
## Permissions
@y
## Permissions
@z

@x
The following sections describe the permissions for each role.
@y
The following sections describe the permissions for each role.
@z

@x
### Content and registry permissions
@y
### Content and registry permissions
@z

@x
The following table outlines content and registry permissions for member, editor, and organization owner roles. These permissions and roles apply to the entire organization, including all the repositories in the namespace for the organization.
@y
The following table outlines content and registry permissions for member, editor, and organization owner roles. These permissions and roles apply to the entire organization, including all the repositories in the namespace for the organization.
@z

@x
| Permission                                            | Member | Editor | Organization owner |
| :---------------------------------------------------- | :----- | :----- | :----------------- |
| Explore images and extensions                         | ✅     | ✅     | ✅                 |
| Star, favorite, vote, and comment on content          | ✅     | ✅     | ✅                 |
| Pull images                                           | ✅     | ✅     | ✅                 |
| Create and publish an extension                       | ✅     | ✅     | ✅                 |
| Become a Verified, Official, or Open Source publisher | ❌     | ❌     | ✅                 |
| Observe content engagement as a publisher             | ❌     | ❌     | ✅                 |
| Create public and private repositories                | ❌     | ✅     | ✅                 |
| Edit and delete repositories                          | ❌     | ✅     | ✅                 |
| Manage tags                                           | ❌     | ✅     | ✅                 |
| View repository activity                              | ❌     | ❌     | ✅                 |
| Set up Automated builds                               | ❌     | ❌     | ✅                 |
| Edit build settings                                   | ❌     | ❌     | ✅                 |
| View teams                                            | ✅     | ✅     | ✅                 |
| Assign team permissions to repositories               | ❌     | ✅     | ✅                 |
@y
| Permission                                            | Member | Editor | Organization owner |
| :---------------------------------------------------- | :----- | :----- | :----------------- |
| Explore images and extensions                         | ✅     | ✅     | ✅                 |
| Star, favorite, vote, and comment on content          | ✅     | ✅     | ✅                 |
| Pull images                                           | ✅     | ✅     | ✅                 |
| Create and publish an extension                       | ✅     | ✅     | ✅                 |
| Become a Verified, Official, or Open Source publisher | ❌     | ❌     | ✅                 |
| Observe content engagement as a publisher             | ❌     | ❌     | ✅                 |
| Create public and private repositories                | ❌     | ✅     | ✅                 |
| Edit and delete repositories                          | ❌     | ✅     | ✅                 |
| Manage tags                                           | ❌     | ✅     | ✅                 |
| View repository activity                              | ❌     | ❌     | ✅                 |
| Set up Automated builds                               | ❌     | ❌     | ✅                 |
| Edit build settings                                   | ❌     | ❌     | ✅                 |
| View teams                                            | ✅     | ✅     | ✅                 |
| Assign team permissions to repositories               | ❌     | ✅     | ✅                 |
@z

@x
When you add members to a team, you can manage their repository permissions. For team repository permissions, see [Create and manage a team permissions reference](/manuals/admin/organization/manage-a-team.md#permissions-reference).
@y
When you add members to a team, you can manage their repository permissions. For team repository permissions, see [Create and manage a team permissions reference](manuals/admin/organization/manage-a-team.md#permissions-reference).
@z

@x
The following diagram provides an example of how permissions may work for a user. In this example, the first permission check is for the role: member or editor. Editors have administrative permissions for repositories across the namespace of the organization. Members may have administrative permissions for a repository if they're a member of a team that grants those permissions.
@y
The following diagram provides an example of how permissions may work for a user. In this example, the first permission check is for the role: member or editor. Editors have administrative permissions for repositories across the namespace of the organization. Members may have administrative permissions for a repository if they're a member of a team that grants those permissions.
@z

@x
![User repository permissions within an organization](../images/roles-and-permissions-member-editor-roles.png)
@y
![User repository permissions within an organization](../images/roles-and-permissions-member-editor-roles.png)
@z

@x
### Organization management permissions
@y
### Organization management permissions
@z

@x
The following table outlines organization management permissions for member, editor, organization owner, and company owner roles.
@y
The following table outlines organization management permissions for member, editor, organization owner, and company owner roles.
@z

@x
| Permission                                                        | Member | Editor | Organization owner | Company owner |
| :---------------------------------------------------------------- | :----- | :----- | :----------------- | :------------ |
| Create teams                                                      | ❌     | ❌     | ✅                 | ✅            |
| Manage teams (including delete)                                   | ❌     | ❌     | ✅                 | ✅            |
| Configure the organization's settings (including linked services) | ❌     | ❌     | ✅                 | ✅            |
| Add organizations to a company                                    | ❌     | ❌     | ✅                 | ✅            |
| Invite members                                                    | ❌     | ❌     | ✅                 | ✅            |
| Manage members                                                    | ❌     | ❌     | ✅                 | ✅            |
| Manage member roles and permissions                               | ❌     | ❌     | ✅                 | ✅            |
| View member activity                                              | ❌     | ❌     | ✅                 | ✅            |
| Export and reporting                                              | ❌     | ❌     | ✅                 | ✅            |
| Image Access Management                                           | ❌     | ❌     | ✅                 | ✅            |
| Registry Access Management                                        | ❌     | ❌     | ✅                 | ✅            |
| Set up Single Sign-On (SSO) and SCIM                              | ❌     | ❌     | ✅ \*              | ✅            |
| Require Docker Desktop sign-in                                    | ❌     | ❌     | ✅ \*              | ✅            |
| Manage billing information (for example, billing address)                 | ❌     | ❌     | ✅                 | ✅            |
| Manage payment methods (for example, credit card or invoice)              | ❌     | ❌     | ✅                 | ✅            |
| View billing history                                              | ❌     | ❌     | ✅                 | ✅            |
| Manage subscriptions                                              | ❌     | ❌     | ✅                 | ✅            |
| Manage seats                                                      | ❌     | ❌     | ✅                 | ✅            |
| Upgrade and downgrade plans                                       | ❌     | ❌     | ✅                 | ✅            |
@y
| Permission                                                        | Member | Editor | Organization owner | Company owner |
| :---------------------------------------------------------------- | :----- | :----- | :----------------- | :------------ |
| Create teams                                                      | ❌     | ❌     | ✅                 | ✅            |
| Manage teams (including delete)                                   | ❌     | ❌     | ✅                 | ✅            |
| Configure the organization's settings (including linked services) | ❌     | ❌     | ✅                 | ✅            |
| Add organizations to a company                                    | ❌     | ❌     | ✅                 | ✅            |
| Invite members                                                    | ❌     | ❌     | ✅                 | ✅            |
| Manage members                                                    | ❌     | ❌     | ✅                 | ✅            |
| Manage member roles and permissions                               | ❌     | ❌     | ✅                 | ✅            |
| View member activity                                              | ❌     | ❌     | ✅                 | ✅            |
| Export and reporting                                              | ❌     | ❌     | ✅                 | ✅            |
| Image Access Management                                           | ❌     | ❌     | ✅                 | ✅            |
| Registry Access Management                                        | ❌     | ❌     | ✅                 | ✅            |
| Set up Single Sign-On (SSO) and SCIM                              | ❌     | ❌     | ✅ \*              | ✅            |
| Require Docker Desktop sign-in                                    | ❌     | ❌     | ✅ \*              | ✅            |
| Manage billing information (for example, billing address)                 | ❌     | ❌     | ✅                 | ✅            |
| Manage payment methods (for example, credit card or invoice)              | ❌     | ❌     | ✅                 | ✅            |
| View billing history                                              | ❌     | ❌     | ✅                 | ✅            |
| Manage subscriptions                                              | ❌     | ❌     | ✅                 | ✅            |
| Manage seats                                                      | ❌     | ❌     | ✅                 | ✅            |
| Upgrade and downgrade plans                                       | ❌     | ❌     | ✅                 | ✅            |
@z

@x
_\* If not part of a company_
@y
_\* If not part of a company_
@z

@x
### Docker Scout permissions
@y
### Docker Scout permissions
@z

@x
The following table outlines Docker Scout management permissions for member, editor, and organization owner roles.
@y
The following table outlines Docker Scout management permissions for member, editor, and organization owner roles.
@z

@x
| Permission                                            | Member | Editor | Organization owner |
| :---------------------------------------------------- | :----- | :----- | :----------------- |
| View and compare analysis results                     | ✅     | ✅     | ✅                 |
| Upload analysis records                               | ✅     | ✅     | ✅                 |
| Activate and deactivate Docker Scout for a repository | ❌     | ✅     | ✅                 |
| Create environments                                   | ❌     | ❌     | ✅                 |
| Manage registry integrations                          | ❌     | ❌     | ✅                 |
@y
| Permission                                            | Member | Editor | Organization owner |
| :---------------------------------------------------- | :----- | :----- | :----------------- |
| View and compare analysis results                     | ✅     | ✅     | ✅                 |
| Upload analysis records                               | ✅     | ✅     | ✅                 |
| Activate and deactivate Docker Scout for a repository | ❌     | ✅     | ✅                 |
| Create environments                                   | ❌     | ❌     | ✅                 |
| Manage registry integrations                          | ❌     | ❌     | ✅                 |
@z
