%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 /  .md リンクへの (no slash) 対応

@x
title: Docker organization overview
linkTitle: Organization
@y
title: Docker organization overview
linkTitle: Organization
@z

@x
description: >
  Learn how Docker organization accounts relate to individual accounts, and how
  to manage teams, members, permissions, and settings.
keywords: organizations, admin, overview, manage teams, roles, members,
  permissions, organization settings, organization account, individual account,
  Docker ID, account types, owners, teams
@y
description: >
  Learn how Docker organization accounts relate to individual accounts, and how
  to manage teams, members, permissions, and settings.
keywords: organizations, admin, overview, manage teams, roles, members,
  permissions, organization settings, organization account, individual account,
  Docker ID, account types, owners, teams
@z

@x
  - title: Onboard your organization
    description: Learn how to onboard and secure your organization.
    icon: magnifying-glass-plus
    link: /admin/organization/setup/onboard
@y
  - title: Onboard your organization
    description: Learn how to onboard and secure your organization.
    icon: magnifying-glass-plus
    link: __SUBDIR__/admin/organization/setup/onboard
@z

@x
  - title: Manage members
    description: Learn how to manage members.
    icon: user-plus
    link: /admin/organization/manage/members/
@y
  - title: Manage members
    description: Learn how to manage members.
    icon: user-plus
    link: __SUBDIR__/admin/organization/manage/members/
@z

@x
  - title: Activity logs
    description: Learn how to audit the activities of your members.
    icon: document-text
    link: /admin/activity-logs/
@y
  - title: Activity logs
    description: Learn how to audit the activities of your members.
    icon: document-text
    link: __SUBDIR__/admin/activity-logs/
@z

@x
  - title: Security
    description:
      Start here to manage security and access for your organization, including
      single sign-on, provisioning, and image and registry access management.
    icon: shield-check
    link: /enterprise/security/
@y
  - title: Security
    description:
      Start here to manage security and access for your organization, including
      single sign-on, provisioning, and image and registry access management.
    icon: shield-check
    link: __SUBDIR__/enterprise/security/
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
organization](/admin/images/org-structure.webp)
@y
![Diagram showing how teams and members relate within a Docker
organization](admin/images/org-structure.webp)
@z

@x
For how organizations fit into the broader company hierarchy, see
[Administration
overview](/manuals/admin/_index.md#company-and-organization-hierarchy).
@y
For how organizations fit into the broader company hierarchy, see
[Administration
overview](manuals/admin/_index.md#company-and-organization-hierarchy).
@z

@x
## Individual and organization accounts
@y
## Individual and organization accounts
@z

@x
Docker has two primary account types:
@y
Docker has two primary account types:
@z

@x
- Individual accounts that are identified by a Docker ID.
- Organization accounts that are shared workspaces for teams and
  repositories.
@y
- Individual accounts that are identified by a Docker ID.
- Organization accounts that are shared workspaces for teams and
  repositories.
@z

@x
Every organization is created and administered by one or more individual
accounts. You always sign in with your individual account, then work in the
organizations you own or belong to. Organization owners and members are
individual accounts that hold a role in that organization. For individual
accounts, see [Accounts](/manuals/accounts/_index.md).
@y
Every organization is created and administered by one or more individual
accounts. You always sign in with your individual account, then work in the
organizations you own or belong to. Organization owners and members are
individual accounts that hold a role in that organization. For individual
accounts, see [Accounts](manuals/accounts/_index.md).
@z

@x
## Organization roles
@y
## Organization roles
@z

@x
An organization includes owners, members, and optional teams. Organization
owners have full administrator access to manage members, roles, and teams. A
team is an optional grouping of members that share the same repository
permissions.
@y
An organization includes owners, members, and optional teams. Organization
owners have full administrator access to manage members, roles, and teams. A
team is an optional grouping of members that share the same repository
permissions.
@z

@x
For details about each role and its permissions, see
[Roles and
permissions](/manuals/enterprise/security/roles-and-permissions/_index.md).
@y
For details about each role and its permissions, see
[Roles and
permissions](manuals/enterprise/security/roles-and-permissions/_index.md).
@z

@x
## Next steps
@y
## Next steps
@z

@x
Learn how to create and manage your organization in the following sections.
@y
Learn how to create and manage your organization in the following sections.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
