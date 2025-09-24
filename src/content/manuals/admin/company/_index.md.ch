%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Company administration overview
@y
title: Company administration overview
@z

@x
description: Learn how to manage multiple organizations using companies, including managing users, owners, and security.
keywords: company, multiple organizations, manage companies, admin console, Docker Business settings
@y
description: Learn how to manage multiple organizations using companies, including managing users, owners, and security.
keywords: company, multiple organizations, manage companies, admin console, Docker Business settings
@z

% grid:

@x
- title: Create a company
  description: Get started by learning how to create a company.
  icon: apartment
  link: /admin/company/new-company/
@y
- title: Create a company
  description: Get started by learning how to create a company.
  icon: apartment
  link: __SUBDIR__/admin/company/new-company/
@z

@x
- title: Manage organizations
  description: Learn how to add and manage organizations as well as seats within your
    company.
  icon: store
  link: /admin/company/organizations/
@y
- title: Manage organizations
  description: Learn how to add and manage organizations as well as seats within your
    company.
  icon: store
  link: __SUBDIR__/admin/company/organizations/
@z

@x
- title: Manage users
  description: Explore how to manage users in all organizations.
  icon: group_add
  link: /admin/company/users/
@y
- title: Manage users
  description: Explore how to manage users in all organizations.
  icon: group_add
  link: __SUBDIR__/admin/company/users/
@z

@x
- title: Configure single sign-on
  description: Discover how to configure SSO for your entire company.
  icon: key
  link: /security/for-admins/single-sign-on/
@y
- title: Configure single sign-on
  description: Discover how to configure SSO for your entire company.
  icon: key
  link: __SUBDIR__/security/for-admins/single-sign-on/
@z

@x
- title: Set up SCIM
  description: Set up SCIM to automatically provision and deprovision users in your
    company.
  icon: checklist
  link: /security/for-admins/provisioning/scim/
@y
- title: Set up SCIM
  description: Set up SCIM to automatically provision and deprovision users in your
    company.
  icon: checklist
  link: __SUBDIR__/security/for-admins/provisioning/scim/
@z

@x
- title: Domain management
  description: Add and verify your company's domains.
  icon: domain_verification
  link: /security/for-admins/domain-management/
@y
- title: Domain management
  description: Add and verify your company's domains.
  icon: domain_verification
  link: __SUBDIR__/security/for-admins/domain-management/
@z

@x
- title: FAQs
  description: Explore frequently asked questions about companies.
  link: /faq/admin/company-faqs/
  icon: help
@y
- title: FAQs
  description: Explore frequently asked questions about companies.
  link: __SUBDIR__/faq/admin/company-faqs/
  icon: help
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
A company provides a single point of visibility across multiple organizations,
simplifying organization and settings management.
@y
A company provides a single point of visibility across multiple organizations,
simplifying organization and settings management.
@z

@x
Organization owners with a Docker Business subscription can create a company
and manage it through the [Docker Admin Console](https://app.docker.com/admin).
@y
Organization owners with a Docker Business subscription can create a company
and manage it through the [Docker Admin Console](https://app.docker.com/admin).
@z

@x
The following diagram shows how a company relates to its associated
organizations.
@y
The following diagram shows how a company relates to its associated
organizations.
@z

@x
![Diagram showing how companies relate to Docker organizations](/admin/images/docker-admin-structure.webp)
@y
![Diagram showing how companies relate to Docker organizations](__SUBDIR__/admin/images/docker-admin-structure.webp)
@z

@x
## Key features
@y
## Key features
@z

@x
With a company, administrators can:
@y
With a company, administrators can:
@z

@x
- View and manage all nested organizations
- Configure company and organization settings centrally
- Control access to the company
- Have up to ten unique users assigned to the company owner role
- Configure SSO and SCIM for all nested organizations
- Enforce SSO for all users in the company
@y
- View and manage all nested organizations
- Configure company and organization settings centrally
- Control access to the company
- Have up to ten unique users assigned to the company owner role
- Configure SSO and SCIM for all nested organizations
- Enforce SSO for all users in the company
@z

@x
## Create and manage your company
@y
## Create and manage your company
@z

@x
Learn how to create and manage a company in the following sections.
@y
Learn how to create and manage a company in the following sections.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
