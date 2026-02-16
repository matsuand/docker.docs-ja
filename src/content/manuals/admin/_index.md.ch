%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Administration
@y
title: Administration
@z

@x
description: Overview of administration features and roles in the Docker Admin Console
keywords: admin, administration, company, organization, Admin Console, user accounts, account management
@y
description: Overview of administration features and roles in the Docker Admin Console
keywords: admin, administration, company, organization, Admin Console, user accounts, account management
@z

% grid:

@x
- title: Company administration
  description: Explore how to manage a company.
  icon: apartment
  link: /admin/company/
@y
- title: Company administration
  description: Explore how to manage a company.
  icon: apartment
  link: __SUBDIR__/admin/company/
@z

@x
- title: Organization administration
  description: Learn about organization administration.
  icon: store
  link: /admin/organization/
@y
- title: Organization administration
  description: Learn about organization administration.
  icon: store
  link: __SUBDIR__/admin/organization/
@z

@x
- title: Onboard your organization
  description: Learn how to onboard and secure your organization.
  icon: explore
  link: /admin/organization/onboard
@y
- title: Onboard your organization
  description: Learn how to onboard and secure your organization.
  icon: explore
  link: __SUBDIR__/admin/organization/onboard
@z

@x
- title: Company FAQ
  description: Discover common questions and answers about companies.
  icon: help
  link: /faq/admin/company-faqs/
@y
- title: Company FAQ
  description: Discover common questions and answers about companies.
  icon: help
  link: __SUBDIR__/faq/admin/company-faqs/
@z

@x
- title: Organization FAQ
  description: Explore popular FAQ topics about organizations.
  icon: help
  link: /faq/admin/organization-faqs/
@y
- title: Organization FAQ
  description: Explore popular FAQ topics about organizations.
  icon: help
  link: __SUBDIR__/faq/admin/organization-faqs/
@z

@x
- title: Security
  description: Explore security features for administrators.
  icon: shield_locked
  link: /security/
@y
- title: Security
  description: Explore security features for administrators.
  icon: shield_locked
  link: __SUBDIR__/security/
@z

@x
Administrators can manage companies and organizations using the
[Docker Admin Console](https://app.docker.com/admin). The Admin Console
provides centralized observability, access management, and security controls
across Docker environments.
@y
Administrators can manage companies and organizations using the
[Docker Admin Console](https://app.docker.com/admin). The Admin Console
provides centralized observability, access management, and security controls
across Docker environments.
@z

@x
## Company and organization hierarchy
@y
## Company and organization hierarchy
@z

@x
The [Docker Admin Console](https://app.docker.com/admin) provides administrators with centralized observability, access management, and controls for their company and organizations. To provide these features, Docker uses the following hierarchy and roles.
@y
The [Docker Admin Console](https://app.docker.com/admin) provides administrators with centralized observability, access management, and controls for their company and organizations. To provide these features, Docker uses the following hierarchy and roles.
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
A company groups multiple Docker organizations for centralized configuration.
Companies are only available for Docker Business subscribers.
@y
A company groups multiple Docker organizations for centralized configuration.
Companies are only available for Docker Business subscribers.
@z

@x
Companies have the company owner administrator role available:
@y
Companies have the company owner administrator role available:
@z

@x
- Can view and manage all organizations within the company
- Has full access to company-wide settings and inherits the same permissions as organization owners
- Do not occupy a seat
@y
- Can view and manage all organizations within the company
- Has full access to company-wide settings and inherits the same permissions as organization owners
- Do not occupy a seat
@z

@x
### Organization
@y
### Organization
@z

@x
An organization contains teams and repositories. All Docker Team and Business
subscribers must have at least one organization.
@y
An organization contains teams and repositories. All Docker Team and Business
subscribers must have at least one organization.
@z

@x
Organization owners have the organization owner administrator role available. They can manage organization settings, users, and access controls, but occupy a [seat](/admin/faqs/organization-faqs/#what-is-the-difference-between-user-invitee-seat-and-member). If you want to [upgrade to a Docker Business plan](https://www.docker.com/pricing/), you can access the company owner role.
@y
Organization owners have the organization owner administrator role available. They can manage organization settings, users, and access controls, but occupy a [seat](/admin/faqs/organization-faqs/#what-is-the-difference-between-user-invitee-seat-and-member). If you want to [upgrade to a Docker Business plan](https://www.docker.com/pricing/), you can access the company owner role.
@z

@x
While creating a company is optional, organizations are required for Team and Business subscriptions.
@y
While creating a company is optional, organizations are required for Team and Business subscriptions.
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
## Admin Console features
@y
## Admin Console features
@z

@x
Docker's [Admin Console](https://app.docker.com/admin) allows you to:
@y
Docker's [Admin Console](https://app.docker.com/admin) allows you to:
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
## Manage companies and organizations
@y
## Manage companies and organizations
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
