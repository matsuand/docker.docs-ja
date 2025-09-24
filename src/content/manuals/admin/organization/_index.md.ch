%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 /  .md リンクへの (no slash) 対応

@x
title: Organization administration overview
linkTitle: Organization administration
@y
title: Organization administration overview
linkTitle: Organization administration
@z

@x
description: Learn how to manage your Docker organization, including teams, members, permissions, and settings.
keywords: organizations, admin, overview, manage teams, roles
@y
description: Learn how to manage your Docker organization, including teams, members, permissions, and settings.
keywords: organizations, admin, overview, manage teams, roles
@z

% grid:

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
- title: Manage members
  description: Explore how to manage members.
  icon: group_add
  link: /admin/organization/members/
@y
- title: Manage members
  description: Explore how to manage members.
  icon: group_add
  link: __SUBDIR__/admin/organization/members/
@z

@x
- title: Activity logs
  description: Learn how to audit the activities of your members.
  icon: text_snippet
  link: /admin/organization/activity-logs/
@y
- title: Activity logs
  description: Learn how to audit the activities of your members.
  icon: text_snippet
  link: __SUBDIR__/admin/organization/activity-logs/
@z

@x
- title: Image Access Management
  description: Control which types of images your developers can pull.
  icon: photo_library
  link: /admin/organization/image-access/
@y
- title: Image Access Management
  description: Control which types of images your developers can pull.
  icon: photo_library
  link: __SUBDIR__/admin/organization/image-access/
@z

@x
- title: Registry Access Management
  description: Define which registries your developers can access.
  icon: home_storage
  link: /admin/organization/registry-access/
@y
- title: Registry Access Management
  description: Define which registries your developers can access.
  icon: home_storage
  link: __SUBDIR__/admin/organization/registry-access/
@z

@x
- title: Organization settings
  description: Configure information for your organization and manage settings.
  icon: settings
  link: /admin/organization/general-settings/
@y
- title: Organization settings
  description: Configure information for your organization and manage settings.
  icon: settings
  link: __SUBDIR__/admin/organization/general-settings/
@z

@x
- title: SSO and SCIM
  description: 'Set up [Single Sign-On](/security/for-admins/single-sign-on/)
    and [SCIM](/security/for-admins/provisioning/scim/) for your organization.

    '
  icon: key
@y
- title: SSO and SCIM
  description: 'Set up [Single Sign-On](__SUBDIR__/security/for-admins/single-sign-on/)
    and [SCIM](__SUBDIR__/security/for-admins/provisioning/scim/) for your organization.

    '
  icon: key
@z

@x
- title: Domain management
  description: Add, verify, and audit your domains.
  link: /security/for-admins/domain-management/
  icon: domain_verification
- title: FAQs
  description: Explore common organization FAQs.
  link: /faq/admin/organization-faqs/
  icon: help
@y
- title: Domain management
  description: Add, verify, and audit your domains.
  link: __SUBDIR__/security/for-admins/domain-management/
  icon: domain_verification
- title: FAQs
  description: Explore common organization FAQs.
  link: __SUBDIR__/faq/admin/organization-faqs/
  icon: help
@z

@x
A Docker organization is a collection of teams and repositories with centralized
management. It helps administrators group members and assign access in a
streamlined, scalable way.
@y
A Docker organization is a collection of teams and repositories with centralized
management. It helps administrators group members and assign access in a
streamlined, scalable way.
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
![Diagram showing how teams and members relate within a Docker organization](/admin/images/org-structure.webp)
@y
![Diagram showing how teams and members relate within a Docker organization](admin/images/org-structure.webp)
@z

@x
## Organization members
@y
## Organization members
@z

@x
Organization owners have full administrator access to manage members, roles,
and teams across the organization.
@y
Organization owners have full administrator access to manage members, roles,
and teams across the organization.
@z

@x
An organization includes members and optional teams. Teams help group members
and simplify permission management.
@y
An organization includes members and optional teams. Teams help group members
and simplify permission management.
@z

@x
## Create and manage your organization
@y
## Create and manage your organization
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
