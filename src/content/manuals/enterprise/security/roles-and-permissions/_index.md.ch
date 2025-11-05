%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Roles and permissions
linkTitle: Roles and permissions
description: Control access to content, registry, and organization management with Docker's role system
keywords: roles, permissions, custom roles, core roles, access control, organization management, docker hub, admin console, security
@y
title: Roles and permissions
linkTitle: Roles and permissions
description: Control access to content, registry, and organization management with Docker's role system
keywords: roles, permissions, custom roles, core roles, access control, organization management, docker hub, admin console, security
@z

% grid:

@x
  - title: "Core roles"
    description: Learn about Docker's built-in Member, Editor, and Owner roles with predefined permissions.
    icon: "admin_panel_settings"
    link: /enterprise/security/roles-and-permissions/core-roles/
@y
  - title: "Core roles"
    description: Learn about Docker's built-in Member, Editor, and Owner roles with predefined permissions.
    icon: "admin_panel_settings"
    link: __SUBDIR__/enterprise/security/roles-and-permissions/core-roles/
@z

@x
  - title: "Custom roles"
    description: Create tailored permission sets that match your organization's specific needs.
    icon: "tune"
    link: /enterprise/security/roles-and-permissions/custom-roles/
@y
  - title: "Custom roles"
    description: Create tailored permission sets that match your organization's specific needs.
    icon: "tune"
    link: __SUBDIR__/enterprise/security/roles-and-permissions/custom-roles/
@z

@x
{{< summary-bar feature_name="General admin" >}}
@y
{{< summary-bar feature_name="General admin" >}}
@z

@x
Roles control what users can do in your Docker organization. When you invite users or create teams, you assign them roles that determine their permissions for repositories, teams, and organization settings.
@y
Roles control what users can do in your Docker organization. When you invite users or create teams, you assign them roles that determine their permissions for repositories, teams, and organization settings.
@z

@x
Docker provides two types of roles to meet different organizational needs:
@y
Docker provides two types of roles to meet different organizational needs:
@z

@x
- [Core roles](/manuals/enterprise/security/roles-and-permissions/core-roles.md) with predefined permissions
- [Custom roles](/manuals/enterprise/security/roles-and-permissions/custom-roles.md) that you can tailor to your specific requirements
@y
- [Core roles](manuals/enterprise/security/roles-and-permissions/core-roles.md) with predefined permissions
- [Custom roles](manuals/enterprise/security/roles-and-permissions/custom-roles.md) that you can tailor to your specific requirements
@z

@x
## Docker roles
@y
## Docker roles
@z

@x
### Core roles
@y
### Core roles
@z

@x
Core roles are Docker's built-in roles with predefined permission sets:
@y
Core roles are Docker's built-in roles with predefined permission sets:
@z

@x
- **Member**: Non-administrative role with basic access. Members can view other organization members and pull images from repositories they have access to.
- **Editor**: Partial administrative access. Editors can create, edit, and delete repositories, and manage team permissions for repositories.
- **Owner**: Full administrative access. Owners can manage all organization settings, including repositories, teams, members, billing, and security features.
@y
- **Member**: Non-administrative role with basic access. Members can view other organization members and pull images from repositories they have access to.
- **Editor**: Partial administrative access. Editors can create, edit, and delete repositories, and manage team permissions for repositories.
- **Owner**: Full administrative access. Owners can manage all organization settings, including repositories, teams, members, billing, and security features.
@z

@x
### Custom roles
@y
### Custom roles
@z

@x
Custom roles allow you to create tailored permission sets by selecting specific permissions from categories like user management, team management, billing, and Hub permissions. Use custom roles when Docker's core roles don't fit your needs.
@y
Custom roles allow you to create tailored permission sets by selecting specific permissions from categories like user management, team management, billing, and Hub permissions. Use custom roles when Docker's core roles don't fit your needs.
@z

@x
## When to use each role
@y
## When to use each role
@z

@x
Use core roles when:
@y
Use core roles when:
@z

@x
- Docker's predefined permission sets match your organizational structure
- You want simple, straightforward role assignments
- You're getting started with Docker organization management
- Your access control needs are standard and don't require fine-grained permissions
@y
- Docker's predefined permission sets match your organizational structure
- You want simple, straightforward role assignments
- You're getting started with Docker organization management
- Your access control needs are standard and don't require fine-grained permissions
@z

@x
Use custom roles when:
@y
Use custom roles when:
@z

@x
- You need specific permission combinations not available in core roles
- You want to create specialized roles like billing administrators, security auditors, or repository managers
- You need department-specific access control
- You want to implement the principle of least privilege with precise permission grants
@y
- You need specific permission combinations not available in core roles
- You want to create specialized roles like billing administrators, security auditors, or repository managers
- You need department-specific access control
- You want to implement the principle of least privilege with precise permission grants
@z

@x
## How roles work together
@y
## How roles work together
@z

@x
Users and teams can be assigned either a core role or a custom role, but not both. However, roles work in combination with team permissions:
@y
Users and teams can be assigned either a core role or a custom role, but not both. However, roles work in combination with team permissions:
@z

@x
1. **Role permissions**: Applied organization-wide (core or custom role). Custom roles can grant permissions to both organization-wide settings and repository access.
2. **Team permissions**: Additional repository-specific permissions when users are added to teams. This is a separate permission system from role-based permissions.
@y
1. **Role permissions**: Applied organization-wide (core or custom role). Custom roles can grant permissions to both organization-wide settings and repository access.
2. **Team permissions**: Additional repository-specific permissions when users are added to teams. This is a separate permission system from role-based permissions.
@z

@x
This layered approach gives you flexibility to provide broad organizational access through roles and specific repository access through team memberships.
@y
This layered approach gives you flexibility to provide broad organizational access through roles and specific repository access through team memberships.
@z

@x
## Next steps
@y
## Next steps
@z

@x
Choose the role type that best fits your organization's needs:
@y
Choose the role type that best fits your organization's needs:
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
