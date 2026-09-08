%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Company overview
linkTitle: Company
@y
title: Company overview
linkTitle: Company
@z

@x
description: Learn how to manage multiple organizations using companies, including managing users, owners, and security.
keywords: company, multiple organizations, manage companies, Docker Home, Docker Business settings
@y
description: Learn how to manage multiple organizations using companies, including managing users, owners, and security.
keywords: company, multiple organizations, manage companies, Docker Home, Docker Business settings
@z

@x
  - title: Create a company
    description: Get started by learning how to create a company.
    icon: building-office-2
    link: /admin/company/new-company/
@y
  - title: Create a company
    description: Get started by learning how to create a company.
    icon: building-office-2
    link: __SUBDIR__/admin/company/new-company/
@z

@x
  - title: Manage your company
    description: Add organizations, manage company owners, and invite members.
    icon: building-storefront
    link: /admin/company/manage/
@y
  - title: Manage your company
    description: Add organizations, manage company owners, and invite members.
    icon: building-storefront
    link: __SUBDIR__/admin/company/manage/
@z

@x
  - title: Configure SSO and SCIM
    description: Set up single sign-on and SCIM provisioning for your company.
    icon: key
    link: /enterprise/security/single-sign-on/
@y
  - title: Configure SSO and SCIM
    description: Set up single sign-on and SCIM provisioning for your company.
    icon: key
    link: __SUBDIR__/enterprise/security/single-sign-on/
@z

@x
  - title: Domain management
    description: Add and verify your company's domains.
    icon: check-badge
    link: /enterprise/security/domain-management/
@y
  - title: Domain management
    description: Add and verify your company's domains.
    icon: check-badge
    link: __SUBDIR__/enterprise/security/domain-management/
@z

@x
  - title: FAQs
    description: Explore frequently asked questions about companies.
    link: /faq/admin/company-faqs/
    icon: question-mark-circle
@y
  - title: FAQs
    description: Explore frequently asked questions about companies.
    link: __SUBDIR__/faq/admin/company-faqs/
    icon: question-mark-circle
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
A company provides a single point of visibility across multiple
organizations, for centralized organization and settings management.
Organization owners with a Docker Business subscription can create a company
and manage it through Docker Home.
@y
A company provides a single point of visibility across multiple
organizations, for centralized organization and settings management.
Organization owners with a Docker Business subscription can create a company
and manage it through Docker Home.
@z

@x
## Company structure
@y
## Company structure
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
![Diagram showing how companies relate to Docker organizations](admin/images/docker-admin-structure.webp)
@z

@x
For the full administration hierarchy, see the
[administration overview](/manuals/admin/_index.md#company-and-organization-hierarchy).
@y
For the full administration hierarchy, see the
[administration overview](manuals/admin/_index.md#company-and-organization-hierarchy).
@z

@x
## Company roles
@y
## Company roles
@z

@x
A company includes one or more company owners. The creator of a company
becomes both a company owner and an organization owner, and occupies a seat
as organization owner. After creation, a company can have multiple owners,
and each owner has visibility across the entire company. They can manage
settings for every organization under it and have the same access rights as
organization owners.
@y
A company includes one or more company owners. The creator of a company
becomes both a company owner and an organization owner, and occupies a seat
as organization owner. After creation, a company can have multiple owners,
and each owner has visibility across the entire company. They can manage
settings for every organization under it and have the same access rights as
organization owners.
@z

@x
- A company can have up to ten unique company owners.
- Company owners don't occupy a seat unless one of the following applies:
  - They're added as a member of an organization under the company.
  - SSO is enabled and the company owner signs in through SSO, which
    automatically adds them as an organization member.
@y
- A company can have up to ten unique company owners.
- Company owners don't occupy a seat unless one of the following applies:
  - They're added as a member of an organization under the company.
  - SSO is enabled and the company owner signs in through SSO, which
    automatically adds them as an organization member.
@z

@x
To add or remove company owners, see
[Manage your company](/manuals/admin/company/manage.md#company-owners).
@y
To add or remove company owners, see
[Manage your company](manuals/admin/company/manage.md#company-owners).
@z

@x
## Next steps
@y
## Next steps
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
