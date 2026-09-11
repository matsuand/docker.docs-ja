%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Organization accounts
linkTitle: Organization
description: Overview of administration features and roles in Docker Home
keywords: admin, administration, company, organization, Docker Home, user
  accounts, account management, organizations, manage teams, roles, members,
  permissions, organization settings, organization account, individual account,
  Docker ID, account types, owners, teams
@y
title: Organization accounts
linkTitle: Organization
description: Overview of administration features and roles in Docker Home
keywords: admin, administration, company, organization, Docker Home, user
  accounts, account management, organizations, manage teams, roles, members,
  permissions, organization settings, organization account, individual account,
  Docker ID, account types, owners, teams
@z

@x
  - title: Set up your organization
    description: Create, onboard, and configure your organization.
    icon: magnifying-glass-plus
    link: /accounts/organization/setup/
@y
  - title: Set up your organization
    description: Create, onboard, and configure your organization.
    icon: magnifying-glass-plus
    link: __SUBDIR__/accounts/organization/setup/
@z

@x
  - title: Manage your organization
    description: Manage members, teams, seats, and product access.
    icon: user-plus
    link: /accounts/organization/manage/
@y
  - title: Manage your organization
    description: Manage members, teams, seats, and product access.
    icon: user-plus
    link: __SUBDIR__/accounts/organization/manage/
@z

@x
  - title: Activity logs
    description: Review member activity across your organization and repositories.
    icon: clipboard-document-list
    link: /accounts/organization/activity-logs/
@y
  - title: Activity logs
    description: Review member activity across your organization and repositories.
    icon: clipboard-document-list
    link: __SUBDIR__/accounts/organization/activity-logs/
@z

@x
  - title: Insights
    description: See how people in your organization use Docker.
    icon: chart-bar
    link: /accounts/organization/insights/
@y
  - title: Insights
    description: See how people in your organization use Docker.
    icon: chart-bar
    link: __SUBDIR__/accounts/organization/insights/
@z

@x
  - title: Security
    description: Explore security features for administrators.
    icon: shield-check
    link: /security/
@y
  - title: Security
    description: Explore security features for administrators.
    icon: shield-check
    link: __SUBDIR__/security/
@z

@x
Organization and company owners can manage members, control access, and enforce
security across their Docker environments. You perform these tasks in Docker
Home, which provides centralized observability, access management, and security
controls.
@y
Organization and company owners can manage members, control access, and enforce
security across their Docker environments. You perform these tasks in Docker
Home, which provides centralized observability, access management, and security
controls.
@z

@x
A Docker organization is a collection of teams and repositories under
centralized management. Organization administrators group members and
assign repository access at scale.
@y
A Docker organization is a collection of teams and repositories under
centralized management. Organization administrators group members and
assign repository access at scale.
@z

@x
As an organization or company owner, you can:
@y
As an organization or company owner, you can:
@z

@x
- Create and manage companies and organizations
- Assign roles and permissions to members
- Group members into teams to manage access by project or role
- Set company-wide policies, including SCIM provisioning and security
  enforcement
@y
- Create and manage companies and organizations
- Assign roles and permissions to members
- Group members into teams to manage access by project or role
- Set company-wide policies, including SCIM provisioning and security
  enforcement
@z

@x
For how individual, organization, and company accounts compare, see
[Accounts](/manuals/accounts/_index.md). For individual accounts, see
[Docker individual accounts](/manuals/accounts/individual/_index.md).
@y
For how individual, organization, and company accounts compare, see
[Accounts](manuals/accounts/_index.md). For individual accounts, see
[Docker individual accounts](manuals/accounts/individual/_index.md).
@z

@x
## Organization structure
@y
## Organization structure
@z

@x
The following diagram shows how organizations relate to teams and members.
@y
The following diagram shows how organizations relate to teams and members.
@z

@x
![Diagram showing how teams and members relate within a Docker
organization](./images/org-structure.webp)
@y
![Diagram showing how teams and members relate within a Docker
organization](./images/org-structure.webp)
@z

@x
An organization includes owners, members, and optional teams. Organization
owners have full administrator access to manage members, roles, and teams.
@y
An organization includes owners, members, and optional teams. Organization
owners have full administrator access to manage members, roles, and teams.
@z

@x
### Team
@y
### Team
@z

@x
Teams are optional and let you group members to assign repository permissions
collectively. Teams simplify permission management across projects
or functions.
@y
Teams are optional and let you group members to assign repository permissions
collectively. Teams simplify permission management across projects
or functions.
@z

@x
### Member
@y
### Member
@z

@x
A member is any Docker user added to an organization. Organization and company
owners can assign roles to members to define their level of access.
@y
A member is any Docker user added to an organization. Organization and company
owners can assign roles to members to define their level of access.
@z

@x
For details about each role and its permissions, see
[Roles and
permissions](/manuals/security/roles-and-permissions/_index.md).
@y
For details about each role and its permissions, see
[Roles and
permissions](manuals/security/roles-and-permissions/_index.md).
@z

@x
For how companies relate to organizations, see
[Company structure](/manuals/accounts/company/_index.md#company-structure).
@y
For how companies relate to organizations, see
[Company structure](manuals/accounts/company/_index.md#company-structure).
@z

@x
## Next steps
@y
## Next steps
@z

@x
Learn how to manage organizations in the following sections.
@y
Learn how to manage organizations in the following sections.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
