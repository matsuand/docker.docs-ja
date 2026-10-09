%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Organization accounts
linkTitle: Organization
description: How Docker organizations relate to members, teams, and
  repositories.
keywords: admin, organization, Docker Home, user accounts, account management,
  roles, members, permissions, organization settings, owners, teams,
  repositories
@y
title: Organization accounts
linkTitle: Organization
description: How Docker organizations relate to members, teams, and
  repositories.
keywords: admin, organization, Docker Home, user accounts, account management,
  roles, members, permissions, organization settings, owners, teams,
  repositories
@z

% grid:

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
    description: Review member activity across your organization and
      repositories.
    icon: clipboard-document-list
    link: /accounts/organization/activity-logs/
@y
  - title: Activity logs
    description: Review member activity across your organization and
      repositories.
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
A Docker organization is a shared workspace for members and repositories
under one namespace.
Organization owners administer membership, access, and security.
@y
A Docker organization is a shared workspace for members and repositories
under one namespace.
Organization owners administer membership, access, and security.
@z

@x
## Organization structure
@y
## Organization structure
@z

@x
Organization owners manage organizations that contain members,
repositories, and teams, which group members within an
organization.
@y
Organization owners manage organizations that contain members,
repositories, and teams, which group members within an
organization.
@z

@x
The following diagram shows that hierarchy:
@y
The following diagram shows that hierarchy:
@z

@x
```mermaid {title="Organization structure" caption="Organization owners manage an organization that contains members, repositories, and optional teams."}
flowchart TB
  oo(("Organization owners")) -.->|"manage"| org
  subgraph org["Organization"]
    direction TB
    m(("Members"))
    subgraph t["Teams (optional)"]
      tm(("Members"))
    end
    r[("Repositories")]
  end
  style org fill:#3b82f622,stroke:#3b82f6
  style t stroke-dasharray: 5 5
```
@y
```mermaid {title="Organization structure" caption="Organization owners manage an organization that contains members, repositories, and optional teams."}
flowchart TB
  oo(("Organization owners")) -.->|"manage"| org
  subgraph org["Organization"]
    direction TB
    m(("Members"))
    subgraph t["Teams (optional)"]
      tm(("Members"))
    end
    r[("Repositories")]
  end
  style org fill:#3b82f622,stroke:#3b82f6
  style t stroke-dasharray: 5 5
```
@z

@x
### Owners
@y
### Owners
@z

@x
Organization owners administer the organization. They invite members, assign
roles, and manage teams and repositories.
@y
Organization owners administer the organization. They invite members, assign
roles, and manage teams and repositories.
@z

@x
An organization can have multiple owners. All owners share the same
predefined permissions. For other roles and their permissions, see
[Roles and permissions](/manuals/security/roles-and-permissions/_index.md).
@y
An organization can have multiple owners. All owners share the same
predefined permissions. For other roles and their permissions, see
[Roles and permissions](manuals/security/roles-and-permissions/_index.md).
@z

@x
### Members
@y
### Members
@z

@x
A member is a Docker user invited to the organization. Organization owners
assign a role to each member, and that role sets organization-wide access.
@y
A member is a Docker user invited to the organization. Organization owners
assign a role to each member, and that role sets organization-wide access.
@z

@x
### Teams
@y
### Teams
@z

@x
Teams are optional. They group members so you can grant repository
access to many people at once. Use a team when several members need the
same repositories. Members can belong to the organization without joining
a team.
@y
Teams are optional. They group members so you can grant repository
access to many people at once. Use a team when several members need the
same repositories. Members can belong to the organization without joining
a team.
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
