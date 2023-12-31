%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Learn about organizations.
keywords: organizations, admin, overview
title: Organization administration overview
grid:
- title: Manage members
  description: Explore how to manage members.
  icon: group_add
  link: /admin/organization/members/
- title: Activity logs
  description: Learn how to audit the activities of your members.
  icon: feed
  link: /admin/organization/activity-logs/
- title: Image Access Management
  description: Control which types of images your developers can pull.
  icon: photo_library
  link: /admin/organization/image-access/
- title: Registry Access Management
  description: Define which registries your developers can access.
  icon: home_storage
  link: /admin/organization/registry-access/
- title: General settings
  description: Configure general information or create a company.
  icon: settings_suggest
  link: /admin/organization/general-settings/
- title: SSO & SCIM
  description: 'Set up [Single Sign-On](/security/for-admins/single-sign-on/)
    and [SCIM](/security/for-admins/scim/) for your organization.
@y
---
description: Learn about organizations.
keywords: organizations, admin, overview
title: Organization administration overview
grid:
- title: Manage members
  description: Explore how to manage members.
  icon: group_add
  link: __SUBDIR__/admin/organization/members/
- title: Activity logs
  description: Learn how to audit the activities of your members.
  icon: feed
  link: __SUBDIR__/admin/organization/activity-logs/
- title: Image Access Management
  description: Control which types of images your developers can pull.
  icon: photo_library
  link: __SUBDIR__/admin/organization/image-access/
- title: Registry Access Management
  description: Define which registries your developers can access.
  icon: home_storage
  link: __SUBDIR__/admin/organization/registry-access/
- title: General settings
  description: Configure general information or create a company.
  icon: settings_suggest
  link: __SUBDIR__/admin/organization/general-settings/
- title: SSO & SCIM
  description: 'Set up [Single Sign-On](__SUBDIR__/security/for-admins/single-sign-on/)
    and [SCIM](__SUBDIR__/security/for-admins/scim/) for your organization.
@z

@x
    '
  icon: key
- title: Domain management
  description: Add, verify, and audit your domains.
  link: /admin/organization/security-settings/domains/
  icon: domain_verification
- title: FAQs
  description: Explore common organization FAQs.
  link: /faq/admin/organization-faqs/
  icon: help
---
@y
    '
  icon: key
- title: Domain management
  description: Add, verify, and audit your domains.
  link: __SUBDIR__/admin/organization/security-settings/domains/
  icon: domain_verification
- title: FAQs
  description: Explore common organization FAQs.
  link: __SUBDIR__/faq/admin/organization-faqs/
  icon: help
---
@z

@x
{{< include "admin-org-overview.md" >}}
@y
{{< include "admin-org-overview.md" >}}
@z

@x
To create an organization, see [Create your organization](../organization/orgs.md).
@y
To create an organization, see [Create your organization](../organization/orgs.md).
@z

@x
Learn how to administer an organization in the following sections.
@y
Learn how to administer an organization in the following sections.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
