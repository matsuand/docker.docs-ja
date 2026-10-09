%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Company accounts
linkTitle: Company
@y
title: Company accounts
linkTitle: Company
@z

@x
description: Why a Docker company groups organizations, and what company
  owners administer.
keywords: company, multiple organizations, Docker Home, Docker Business,
  company owners, SSO, SCIM
@y
description: Why a Docker company groups organizations, and what company
  owners administer.
keywords: company, multiple organizations, Docker Home, Docker Business,
  company owners, SSO, SCIM
@z

% grid:

@x
  - title: Create a company
    description: Get started by learning how to create a company.
    icon: building-office-2
    link: /accounts/company/new-company/
@y
  - title: Create a company
    description: Get started by learning how to create a company.
    icon: building-office-2
    link: /accounts/company/new-company/
@z

@x
  - title: Manage your company
    description: Add organizations, manage company owners, and invite members.
    icon: building-storefront
    link: /accounts/company/manage/
@y
  - title: Manage your company
    description: Add organizations, manage company owners, and invite members.
    icon: building-storefront
    link: __SUBDIR__/accounts/company/manage/
@z

@x
  - title: Configure SSO and SCIM
    description: Set up single sign-on and SCIM provisioning for your company.
    icon: key
    link: /security/authentication/single-sign-on/
@y
  - title: Configure SSO and SCIM
    description: Set up single sign-on and SCIM provisioning for your company.
    icon: key
    link: __SUBDIR__/security/authentication/single-sign-on/
@z

@x
  - title: Domain management
    description: Add and verify your company's domains.
    icon: check-badge
    link: /security/provisioning/domain-management/
@y
  - title: Domain management
    description: Add and verify your company's domains.
    icon: check-badge
    link: __SUBDIR__/security/provisioning/domain-management/
@z

@x
  - title: FAQs
    description: Explore frequently asked questions about companies.
    link: /faqs/accounts/
    icon: question-mark-circle
@y
  - title: FAQs
    description: Explore frequently asked questions about companies.
    link: __SUBDIR__/faqs/accounts/
    icon: question-mark-circle
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
A company is where you configure sign-in and administration for multiple
Docker organizations.
@y
A company is where you configure sign-in and administration for multiple
Docker organizations.
@z

@x
> [!TIP]
>
> Organization owners with a Docker Business subscription can
> [create a company](./new-company.md) in
> [Docker Home](https://app.docker.com/).
@y
> [!TIP]
>
> Organization owners with a Docker Business subscription can
> [create a company](./new-company.md) in
> [Docker Home](https://app.docker.com/).
@z

@x
## Company structure
@y
## Company structure
@z

@x
A company sits above its organizations, giving company owners full
administrative access across every organization in the company.
@y
A company sits above its organizations, giving company owners full
administrative access across every organization in the company.
@z

@x
The following diagram shows that hierarchy:
@y
The following diagram shows that hierarchy:
@z

@x
```mermaid {title="Company structure" caption="Company owners manage a company that contains one or more organizations."}
flowchart TB
  co(("Company owners")) -.->|"manage"| C
  subgraph C["Company"]
    direction TB
    subgraph O1["Organization A"]
      direction TB
      m1(("Members"))
      r1[("Repositories")]
    end
    subgraph O2["Organization B"]
      direction TB
      m2(("Members"))
      r2[("Repositories")]
    end
    O1 ~~~ O2
  end
  style C fill:#3b82f622,stroke:#3b82f6
```
@y
```mermaid {title="Company structure" caption="Company owners manage a company that contains one or more organizations."}
flowchart TB
  co(("Company owners")) -.->|"manage"| C
  subgraph C["Company"]
    direction TB
    subgraph O1["Organization A"]
      direction TB
      m1(("Members"))
      r1[("Repositories")]
    end
    subgraph O2["Organization B"]
      direction TB
      m2(("Members"))
      r2[("Repositories")]
    end
    O1 ~~~ O2
  end
  style C fill:#3b82f622,stroke:#3b82f6
```
@z

@x
## What a company lets you do
@y
## What a company lets you do
@z

@x
When you create a company, you can:
@y
When you create a company, you can:
@z

@x
- Administer every organization in the company from one place.
- Configure single sign-on (SSO) and System for Cross-domain Identity
  Management (SCIM) once for every organization in the company.
- Verify your domains once at the company level instead of in each
  organization. When you turn on auto-provisioning for a domain, you
  choose which organization new users join.
- View members and invitations from every organization in one list, and
  export that list as a CSV.
@y
- Administer every organization in the company from one place.
- Configure single sign-on (SSO) and System for Cross-domain Identity
  Management (SCIM) once for every organization in the company.
- Verify your domains once at the company level instead of in each
  organization. When you turn on auto-provisioning for a domain, you
  choose which organization new users join.
- View members and invitations from every organization in one list, and
  export that list as a CSV.
@z

@x
You can assign up to 10 company owners. Company owners occupy a purchased
seat only when they are also members of an organization. A company owner
who is not an organization member does not occupy a seat.
@y
You can assign up to 10 company owners. Company owners occupy a purchased
seat only when they are also members of an organization. A company owner
who is not an organization member does not occupy a seat.
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
