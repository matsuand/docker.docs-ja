%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Core roles
description: Control access to content, registry, and organization management with roles in your organization.
keywords: members, teams, organization, company, roles, access, docker hub, admin console, security, permissions
@y
title: Core roles
description: Control access to content, registry, and organization management with roles in your organization.
keywords: members, teams, organization, company, roles, access, docker hub, admin console, security, permissions
@z

@x
{{< summary-bar feature_name="General admin" >}}
@y
{{< summary-bar feature_name="General admin" >}}
@z

@x
Core roles are Docker's built-in roles with predefined permission sets.
This page provides an overview of Docker's core roles and permissions for each role.
@y
Core roles are Docker's built-in roles with predefined permission sets.
This page provides an overview of Docker's core roles and permissions for each role.
@z

@x
## What are core roles?
@y
## What are core roles?
@z

@x
Docker organizations have three core roles:
@y
Docker organizations have three core roles:
@z

@x
- **Member**: Non-administrative role with basic access. Members can view other organization members and pull images from repositories they have access to.
- **Editor**: Partial administrative access. Editors can create, edit, and delete repositories. They can also manage team permissions for repositories.
- **Owner**: Full administrative access. Owners can manage all organization settings, including repositories, teams, members, billing, and security features.
@y
- **Member**: Non-administrative role with basic access. Members can view other organization members and pull images from repositories they have access to.
- **Editor**: Partial administrative access. Editors can create, edit, and delete repositories. They can also manage team permissions for repositories.
- **Owner**: Full administrative access. Owners can manage all organization settings, including repositories, teams, members, billing, and security features.
@z

@x
> [!NOTE]
>
> A company owner has the same organization management permissions as an organization owner, but there are some content and registry permissions that company owners don't have (for example, repository pull/push). For more information, see [Company overview](/admin/company/).
@y
> [!NOTE]
>
> A company owner has the same organization management permissions as an organization owner, but there are some content and registry permissions that company owners don't have (for example, repository pull/push). For more information, see [Company overview](__SUBDIR__/admin/company/).
@z

@x
### Content and registry permissions
@y
### Content and registry permissions
@z

@x
These permissions apply organization-wide, including all repositories in your organization's namespace.
@y
These permissions apply organization-wide, including all repositories in your organization's namespace.
@z

@x
| Permission                                            | Member | Editor | Owner |
| :---------------------------------------------------- | :----- | :----- | :---- |
| Explore images and extensions                         | ✅     | ✅     | ✅    |
| Star, favorite, vote, and comment on content          | ✅     | ✅     | ✅    |
| Pull images                                           | ✅     | ✅     | ✅    |
| Create and publish an extension                       | ✅     | ✅     | ✅    |
| Become a Verified, Official, or Open Source publisher | ❌     | ❌     | ✅    |
| Edit and delete publisher repository logos            | ❌     | ✅     | ✅    |
| Observe content engagement as a publisher             | ❌     | ❌     | ✅    |
| Create public and private repositories                | ❌     | ✅     | ✅    |
| Edit and delete repositories                          | ❌     | ✅     | ✅    |
| Manage tags                                           | ❌     | ✅     | ✅    |
| View repository activity                              | ❌     | ❌     | ✅    |
| Set up Automated builds                               | ❌     | ❌     | ✅    |
| Edit build settings                                   | ❌     | ❌     | ✅    |
| View teams                                            | ✅     | ✅     | ✅    |
| Assign team permissions to repositories               | ❌     | ✅     | ✅    |
@y
| Permission                                            | Member | Editor | Owner |
| :---------------------------------------------------- | :----- | :----- | :---- |
| Explore images and extensions                         | ✅     | ✅     | ✅    |
| Star, favorite, vote, and comment on content          | ✅     | ✅     | ✅    |
| Pull images                                           | ✅     | ✅     | ✅    |
| Create and publish an extension                       | ✅     | ✅     | ✅    |
| Become a Verified, Official, or Open Source publisher | ❌     | ❌     | ✅    |
| Edit and delete publisher repository logos            | ❌     | ✅     | ✅    |
| Observe content engagement as a publisher             | ❌     | ❌     | ✅    |
| Create public and private repositories                | ❌     | ✅     | ✅    |
| Edit and delete repositories                          | ❌     | ✅     | ✅    |
| Manage tags                                           | ❌     | ✅     | ✅    |
| View repository activity                              | ❌     | ❌     | ✅    |
| Set up Automated builds                               | ❌     | ❌     | ✅    |
| Edit build settings                                   | ❌     | ❌     | ✅    |
| View teams                                            | ✅     | ✅     | ✅    |
| Assign team permissions to repositories               | ❌     | ✅     | ✅    |
@z

@x
When you add members to teams, you can grant additional repository permissions
beyond their organization role:
@y
When you add members to teams, you can grant additional repository permissions
beyond their organization role:
@z

@x
1. Role permissions: Applied organization-wide (member or editor)
2. Team permissions: Additional permissions for specific repositories
@y
1. Role permissions: Applied organization-wide (member or editor)
2. Team permissions: Additional permissions for specific repositories
@z

@x
### Organization management permissions
@y
### Organization management permissions
@z

@x
| Permission                                                        | Member | Editor | Owner |
| :---------------------------------------------------------------- | :----- | :----- | :---- |
| Create teams                                                      | ❌     | ❌     | ✅    |
| Manage teams (including delete)                                   | ❌     | ❌     | ✅    |
| Configure the organization's settings (including linked services) | ❌     | ❌     | ✅    |
| Add organizations to a company                                    | ❌     | ❌     | ✅    |
| Invite members                                                    | ❌     | ❌     | ✅    |
| Manage members                                                    | ❌     | ❌     | ✅    |
| Manage member roles and permissions                               | ❌     | ❌     | ✅    |
| View member activity                                              | ❌     | ❌     | ✅    |
| Export and reporting                                              | ❌     | ❌     | ✅    |
| Image Access Management                                           | ❌     | ❌     | ✅    |
| Registry Access Management                                        | ❌     | ❌     | ✅    |
| Set up Single Sign-On (SSO) and SCIM                              | ❌     | ❌     | ✅ \* |
| Require Docker Desktop sign-in                                    | ❌     | ❌     | ✅ \* |
| Manage billing information (for example, billing address)         | ❌     | ❌     | ✅    |
| Manage payment methods (for example, credit card or invoice)      | ❌     | ❌     | ✅    |
| View billing history                                              | ❌     | ❌     | ✅    |
| Manage subscriptions                                              | ❌     | ❌     | ✅    |
| Manage seats                                                      | ❌     | ❌     | ✅    |
| Upgrade and downgrade plans                                       | ❌     | ❌     | ✅    |
@y
| Permission                                                        | Member | Editor | Owner |
| :---------------------------------------------------------------- | :----- | :----- | :---- |
| Create teams                                                      | ❌     | ❌     | ✅    |
| Manage teams (including delete)                                   | ❌     | ❌     | ✅    |
| Configure the organization's settings (including linked services) | ❌     | ❌     | ✅    |
| Add organizations to a company                                    | ❌     | ❌     | ✅    |
| Invite members                                                    | ❌     | ❌     | ✅    |
| Manage members                                                    | ❌     | ❌     | ✅    |
| Manage member roles and permissions                               | ❌     | ❌     | ✅    |
| View member activity                                              | ❌     | ❌     | ✅    |
| Export and reporting                                              | ❌     | ❌     | ✅    |
| Image Access Management                                           | ❌     | ❌     | ✅    |
| Registry Access Management                                        | ❌     | ❌     | ✅    |
| Set up Single Sign-On (SSO) and SCIM                              | ❌     | ❌     | ✅ \* |
| Require Docker Desktop sign-in                                    | ❌     | ❌     | ✅ \* |
| Manage billing information (for example, billing address)         | ❌     | ❌     | ✅    |
| Manage payment methods (for example, credit card or invoice)      | ❌     | ❌     | ✅    |
| View billing history                                              | ❌     | ❌     | ✅    |
| Manage subscriptions                                              | ❌     | ❌     | ✅    |
| Manage seats                                                      | ❌     | ❌     | ✅    |
| Upgrade and downgrade plans                                       | ❌     | ❌     | ✅    |
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
| Permission                                            | Member | Editor | Owner |
| :---------------------------------------------------- | :----- | :----- | :---- |
| View and compare analysis results                     | ✅     | ✅     | ✅    |
| Upload analysis records                               | ✅     | ✅     | ✅    |
| Activate and deactivate Docker Scout for a repository | ❌     | ✅     | ✅    |
| Create environments                                   | ❌     | ❌     | ✅    |
| Manage registry integrations                          | ❌     | ❌     | ✅    |
@y
| Permission                                            | Member | Editor | Owner |
| :---------------------------------------------------- | :----- | :----- | :---- |
| View and compare analysis results                     | ✅     | ✅     | ✅    |
| Upload analysis records                               | ✅     | ✅     | ✅    |
| Activate and deactivate Docker Scout for a repository | ❌     | ✅     | ✅    |
| Create environments                                   | ❌     | ❌     | ✅    |
| Manage registry integrations                          | ❌     | ❌     | ✅    |
@z

@x
### Docker Build Cloud permissions
@y
### Docker Build Cloud permissions
@z

@x
| Permission                 | Member | Editor | Owner |
| -------------------------- | :----- | :----- | :---- |
| Use a cloud builder        | ✅     | ✅     | ✅    |
| Create and remove builders | ✅     | ✅     | ✅    |
| Configure builder settings | ✅     | ✅     | ✅    |
| Buy minutes                | ❌     | ❌     | ✅    |
| Manage subscription        | ❌     | ❌     | ✅    |
@y
| Permission                 | Member | Editor | Owner |
| -------------------------- | :----- | :----- | :---- |
| Use a cloud builder        | ✅     | ✅     | ✅    |
| Create and remove builders | ✅     | ✅     | ✅    |
| Configure builder settings | ✅     | ✅     | ✅    |
| Buy minutes                | ❌     | ❌     | ✅    |
| Manage subscription        | ❌     | ❌     | ✅    |
@z
