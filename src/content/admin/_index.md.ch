%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Discover manuals on administration for accounts, organizations, and companies.
keywords: admin, administration, company, organization, Admin Console, user accounts, account management
title: Administration overview
grid:
- title: Company administration
  description: Explore how to manage a company.
  icon: apartment
  link: /admin/company/
- title: Organization administration
  description: Learn about organization administration.
  icon: store
  link: /admin/organization/
- title: Company FAQ
  description: Discover common questions and answers about companies.
  icon: help
  link: /faq/admin/company-faqs/
- title: Organization FAQ
  description: Explore popular FAQ topics about organizations.
  icon: help
  link: /faq/admin/organization-faqs/
- title: Security
  description: Explore security features for administrators.
  icon: shield_locked
  link: /security/
aliases:
- /docker-hub/admin-overview
---
@y
---
description: Discover manuals on administration for accounts, organizations, and companies.
keywords: admin, administration, company, organization, Admin Console, user accounts, account management
title: Administration overview
grid:
- title: Company administration
  description: Explore how to manage a company.
  icon: apartment
  link: __SUBDIR__/admin/company/
- title: Organization administration
  description: Learn about organization administration.
  icon: store
  link: __SUBDIR__/admin/organization/
- title: Company FAQ
  description: Discover common questions and answers about companies.
  icon: help
  link: __SUBDIR__/faq/admin/company-faqs/
- title: Organization FAQ
  description: Explore popular FAQ topics about organizations.
  icon: help
  link: __SUBDIR__/faq/admin/organization-faqs/
- title: Security
  description: Explore security features for administrators.
  icon: shield_locked
  link: __SUBDIR__/security/
aliases:
- /docker-hub/admin-overview
---
@z

@x
Administrators can manage companies and organizations using Docker Hub or the Docker Admin Console.
@y
Administrators can manage companies and organizations using Docker Hub or the Docker Admin Console.
@z

@x
The Docker Admin Console is available in [Early Access](../release-lifecycle.md#early-access-ea) to all company owners and organization owners that have a Docker Business or Docker Team subscription. The [Docker Admin Console](https://admin.docker.com) provides administrators with centralized observability, access management, and controls for their company and organizations. To provide these features, Docker uses the following hierarchy and roles.
@y
The Docker Admin Console is available in [Early Access](../release-lifecycle.md#early-access-ea) to all company owners and organization owners that have a Docker Business or Docker Team subscription. The [Docker Admin Console](https://admin.docker.com) provides administrators with centralized observability, access management, and controls for their company and organizations. To provide these features, Docker uses the following hierarchy and roles.
@z

@x
![Docker hierarchy](./images/docker-admin-structure.webp)
@y
![Docker hierarchy](./images/docker-admin-structure.webp)
@z

@x
- Company: A company simplifies the management of Docker organizations and settings. Creating a company is optional and only available to Docker Business subscribers.
  - Company owner: A company can have multiple owners. Company owners have company-wide observability and can manage company-wide settings that apply to all associated organizations. In addition, company owners have the same access as organization owners for all associated organizations.
- Organization: An organization is a collection of teams and repositories. Docker Team and Business subscribers must have at least one organization.
  - Organization owner: An organization can have multiple owners. Organization owners have observability into their organization and can manage its users and settings.
- Team: A team is a group of Docker members that belong to an organization. Organization and company owners can group members into additional teams to configure repository permissions on a per-team basis. Using teams to group members is optional.
- Member: A member is a Docker user that's a member of an organization. Organization and company owners can assign roles to members to define their permissions.
@y
- Company: A company simplifies the management of Docker organizations and settings. Creating a company is optional and only available to Docker Business subscribers.
  - Company owner: A company can have multiple owners. Company owners have company-wide observability and can manage company-wide settings that apply to all associated organizations. In addition, company owners have the same access as organization owners for all associated organizations.
- Organization: An organization is a collection of teams and repositories. Docker Team and Business subscribers must have at least one organization.
  - Organization owner: An organization can have multiple owners. Organization owners have observability into their organization and can manage its users and settings.
- Team: A team is a group of Docker members that belong to an organization. Organization and company owners can group members into additional teams to configure repository permissions on a per-team basis. Using teams to group members is optional.
- Member: A member is a Docker user that's a member of an organization. Organization and company owners can assign roles to members to define their permissions.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
