%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker organization roles and permissions
linkTitle: Roles and permissions
description: >-
  Choose core or custom roles to control access to repositories, teams, and
  organization settings
keywords: >-
  Docker organization roles, permissions, core roles, custom roles, Member,
  Editor, Owner, access control, least privilege, Docker Business, security
@y
title: Docker organization roles and permissions
linkTitle: Roles and permissions
description: >-
  Choose core or custom roles to control access to repositories, teams, and
  organization settings
keywords: >-
  Docker organization roles, permissions, core roles, custom roles, Member,
  Editor, Owner, access control, least privilege, Docker Business, security
@z

@x
  - title: Core roles
    description: >-
      Compare permissions for the built-in Member, Editor, and Owner roles.
    icon: shield-check
    link: /enterprise/security/roles-and-permissions/core-roles/
@y
  - title: Core roles
    description: >-
      Compare permissions for the built-in Member, Editor, and Owner roles.
    icon: shield-check
    link: __SUBDIR__/enterprise/security/roles-and-permissions/core-roles/
@z

@x
  - title: Custom roles
    description: >-
      Build permission sets that match your organization's access control needs.
    icon: adjustments-horizontal
    link: /enterprise/security/roles-and-permissions/custom-roles/
@y
  - title: Custom roles
    description: >-
      Build permission sets that match your organization's access control needs.
    icon: adjustments-horizontal
    link: __SUBDIR__/enterprise/security/roles-and-permissions/custom-roles/
@z

@x
  - title: Custom roles permissions
    description: >-
      Review every permission you can assign to a custom role.
    icon: list-bullet
    link: /enterprise/security/roles-and-permissions/custom-roles/permissions-reference/
@y
  - title: Custom roles permissions
    description: >-
      Review every permission you can assign to a custom role.
    icon: list-bullet
    link: __SUBDIR__/enterprise/security/roles-and-permissions/custom-roles/permissions-reference/
@z

@x
{{< summary-bar feature_name="General admin" >}}
@y
{{< summary-bar feature_name="General admin" >}}
@z

@x
Roles determine what members can do in your Docker organization. When you
invite a user or create a team, you assign a role that grants permissions
for repositories, teams, and organization settings.
@y
Roles determine what members can do in your Docker organization. When you
invite a user or create a team, you assign a role that grants permissions
for repositories, teams, and organization settings.
@z

@x
Docker provides two role types. Users and teams get either a core role or a
custom role, but not both.
@y
Docker provides two role types. Users and teams get either a core role or a
custom role, but not both.
@z

@x
## Core roles
@y
## Core roles
@z

@x
Core roles are Docker's built-in Member, Editor, and Owner roles. Their
permissions are predefined. Use core roles when Docker's permission sets match
your organization's needs.
@y
Core roles are Docker's built-in Member, Editor, and Owner roles. Their
permissions are predefined. Use core roles when Docker's permission sets match
your organization's needs.
@z

@x
## Custom roles
@y
## Custom roles
@z

@x
Custom roles are permission sets you build by selecting individual
permissions, such as billing or team management. Use custom roles when you
need a combination that core roles don't offer. For example, you may create a custom role for a billing
administrator or a security auditor, or when you want to grant
least-privilege access.
@y
Custom roles are permission sets you build by selecting individual
permissions, such as billing or team management. Use custom roles when you
need a combination that core roles don't offer. For example, you may create a custom role for a billing
administrator or a security auditor, or when you want to grant
least-privilege access.
@z

@x
Custom roles require a Docker Business subscription.
@y
Custom roles require a Docker Business subscription.
@z

@x
## Roles and team permissions
@y
## Roles and team permissions
@z

@x
Roles apply organization-wide. Team permissions apply to specific
repositories. The two systems work together: a user's role sets their
organization-wide access and team membership can extend their access to
individual repositories.
@y
Roles apply organization-wide. Team permissions apply to specific
repositories. The two systems work together: a user's role sets their
organization-wide access and team membership can extend their access to
individual repositories.
@z

@x
## Next steps
@y
## Next steps
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
