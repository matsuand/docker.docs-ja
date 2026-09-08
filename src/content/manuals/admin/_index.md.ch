%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Administration
description: Overview of administration features and roles in Docker Home
keywords: admin, administration, company, organization, Docker Home, user accounts, account management
@y
title: Administration
description: Overview of administration features and roles in Docker Home
keywords: admin, administration, company, organization, Docker Home, user accounts, account management
@z

@x
  - title: Company administration
    description: Explore how to manage a company.
    icon: building-office-2
    link: /admin/company/
@y
  - title: Company administration
    description: Explore how to manage a company.
    icon: building-office-2
    link: __SUBDIR__/admin/company/
@z

@x
  - title: Organization administration
    description: Learn about organization administration.
    icon: building-storefront
    link: /admin/organization/
@y
  - title: Organization administration
    description: Learn about organization administration.
    icon: building-storefront
    link: __SUBDIR__/admin/organization/
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
  - title: Security
    description: Explore security features for administrators.
    icon: shield-check
    link: /enterprise/security/
@y
  - title: Security
    description: Explore security features for administrators.
    icon: shield-check
    link: __SUBDIR__/enterprise/security/
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
## Company and organization hierarchy
@y
## Company and organization hierarchy
@z

@x
To provide centralized administration, Docker organizes companies and
organizations into the following hierarchy and roles.
@y
To provide centralized administration, Docker organizes companies and
organizations into the following hierarchy and roles.
@z

@x
![Diagram showing Docker’s administration hierarchy with Company at the top, followed by Organizations, Teams, and Members](./images/docker-admin-structure.webp)
@y
![Diagram showing Docker’s administration hierarchy with Company at the top, followed by Organizations, Teams, and Members](./images/docker-admin-structure.webp)
@z

@x
### Company
@y
### Company
@z

@x
A company groups multiple Docker organizations for centralized configuration. A
company owner can view and manage every organization in the company and its
company-wide settings, with the same access rights as an organization owner. For
the company owner role and how it affects seats, see
[Company roles](/manuals/admin/company/_index.md#company-roles).
@y
A company groups multiple Docker organizations for centralized configuration. A
company owner can view and manage every organization in the company and its
company-wide settings, with the same access rights as an organization owner. For
the company owner role and how it affects seats, see
[Company roles](manuals/admin/company/_index.md#company-roles).
@z

@x
Companies are only available for Docker Business subscribers.
@y
Companies are only available for Docker Business subscribers.
@z

@x
### Organization
@y
### Organization
@z

@x
An organization sits below the company and is where you group teams and
members and assign access to repositories. Every Docker Team and Business
subscriber has at least one organization.
@y
An organization sits below the company and is where you group teams and
members and assign access to repositories. Every Docker Team and Business
subscriber has at least one organization.
@z

@x
Organization owners hold the organization owner administrator role and manage
organization settings, users, and access controls. Each owner occupies a
[seat](/manuals/admin/organization/organization-faqs.md#what-is-the-difference-between-user-invitee-seat-and-member).
@y
Organization owners hold the organization owner administrator role and manage
organization settings, users, and access controls. Each owner occupies a
[seat](manuals/admin/organization/organization-faqs.md#what-is-the-difference-between-user-invitee-seat-and-member).
@z

@x
[Upgrading to a Docker Business plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsAdmin)
grants you the company owner role so you can manage multiple organizations.
@y
[Upgrading to a Docker Business plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsAdmin)
grants you the company owner role so you can manage multiple organizations.
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
## Next steps
@y
## Next steps
@z

@x
Learn how to manage companies and organizations in the following sections.
@y
Learn how to manage companies and organizations in the following sections.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
