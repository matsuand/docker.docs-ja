%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: FAQs on companies
linkTitle: Company
@y
title: FAQs on companies
linkTitle: Company
@z

@x
description: Company FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, company, administration, company management
@y
description: Company FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, company, administration, company management
@z

@x
### Are existing subscriptions affected when you create a company and add organizations to it?
@y
### Are existing subscriptions affected when you create a company and add organizations to it?
@z

@x
You can manage subscriptions and related billing details at the organization level.
@y
You can manage subscriptions and related billing details at the organization level.
@z

@x
### Some of my organizations don’t have a Docker Business subscription. Can I still use a parent company?
@y
### Some of my organizations don’t have a Docker Business subscription. Can I still use a parent company?
@z

@x
Yes, but you can only add organizations with a Docker Business subscription to a company.
@y
Yes, but you can only add organizations with a Docker Business subscription to a company.
@z

@x
### What happens if one of my organizations downgrades from Docker Business, but I still need access as a company owner?
@y
### What happens if one of my organizations downgrades from Docker Business, but I still need access as a company owner?
@z

@x
To access and manage child organizations, the organization must have a Docker Business subscription. If the organization isn’t included in this subscription, the owner of the organization must manage the organization outside of the company.
@y
To access and manage child organizations, the organization must have a Docker Business subscription. If the organization isn’t included in this subscription, the owner of the organization must manage the organization outside of the company.
@z

@x
### Does my organization need to prepare for downtime during the migration process?
@y
### Does my organization need to prepare for downtime during the migration process?
@z

@x
No, you can continue with business as usual.
@y
No, you can continue with business as usual.
@z

@x
### How many company owners can I add?
@y
### How many company owners can I add?
@z

@x
You can add a maximum of 10 company owners to a single company account.
@y
You can add a maximum of 10 company owners to a single company account.
@z

@x
### Do company owners occupy a subscription seat?
@y
### Do company owners occupy a subscription seat?
@z

@x
Company owners do not occupy a seat unless one of the following is true:
@y
Company owners do not occupy a seat unless one of the following is true:
@z

@x
- They are added as a member of an organization under your company
- SSO is enabled
@y
- They are added as a member of an organization under your company
- SSO is enabled
@z

@x
Although company owners have the same access as organization owners across all
organizations in the company, it's not necessary to add them to any
organization. Doing so will cause them to occupy a seat.
@y
Although company owners have the same access as organization owners across all
organizations in the company, it's not necessary to add them to any
organization. Doing so will cause them to occupy a seat.
@z

@x
When you first create a company, your account is both a company owner and an
organization owner. In that case, your account will occupy a seat as long as
you remain an organization owner.
@y
When you first create a company, your account is both a company owner and an
organization owner. In that case, your account will occupy a seat as long as
you remain an organization owner.
@z

@x
To avoid occupying a seat, [assign another user as the organization owner](/manuals/admin/organization/members.md#update-a-member-role) and remove yourself from the organization.
You'll retain full administrative access as a company owner without using a
subscription seat.
@y
To avoid occupying a seat, [assign another user as the organization owner](manuals/admin/organization/members.md#update-a-member-role) and remove yourself from the organization.
You'll retain full administrative access as a company owner without using a
subscription seat.
@z

@x
### What permissions does the company owner have in the associated/nested organizations?
@y
### What permissions does the company owner have in the associated/nested organizations?
@z

@x
Company owners can navigate to the **Organizations** page to view all their nested organizations in a single location. They can also view or edit organization members and change single sign-on (SSO) and System for Cross-domain Identity Management (SCIM) settings. Changes to company settings impact all users in each organization under the company. For more information, see [Roles and permissions](../../security/for-admins/roles-and-permissions.md).
@y
Company owners can navigate to the **Organizations** page to view all their nested organizations in a single location. They can also view or edit organization members and change single sign-on (SSO) and System for Cross-domain Identity Management (SCIM) settings. Changes to company settings impact all users in each organization under the company. For more information, see [Roles and permissions](../../security/for-admins/roles-and-permissions.md).
@z

@x
### What features are supported at the company level?
@y
### What features are supported at the company level?
@z

@x
You can manage domain verification, SSO, and SCIM at the company level. The following features aren't supported at the company level, but you can manage them at the organization level:
@y
You can manage domain verification, SSO, and SCIM at the company level. The following features aren't supported at the company level, but you can manage them at the organization level:
@z

@x
- Image Access Management
- Registry Access Management
- User management
- Billing
@y
- Image Access Management
- Registry Access Management
- User management
- Billing
@z

@x
To view and manage users across all the organizations under your company, you can [manage users at the company level](../../admin/company/users.md) when you use the [Admin Console](https://admin.docker.com).
@y
To view and manage users across all the organizations under your company, you can [manage users at the company level](../../admin/company/users.md) when you use the [Admin Console](https://admin.docker.com).
@z

@x
Domain audit isn't supported for companies or organizations within a company.
@y
Domain audit isn't supported for companies or organizations within a company.
@z

@x
### What's required to create a company name?
@y
### What's required to create a company name?
@z

@x
A company name must be unique to that of its child organization. If a child organization requires the same name as a company, you should modify it slightly. For example, **Docker Inc** (parent company), **Docker** (child organization).
@y
A company name must be unique to that of its child organization. If a child organization requires the same name as a company, you should modify it slightly. For example, **Docker Inc** (parent company), **Docker** (child organization).
@z

@x
### How does a company owner add an organization to the company?
@y
### How does a company owner add an organization to the company?
@z

@x
You can add organizations to a company in the Admin Console. For more information, see [Add organizations to a company](../../admin/company/organizations.md#add-organizations-to-a-company.md).
@y
You can add organizations to a company in the Admin Console. For more information, see [Add organizations to a company](../../admin/company/organizations.md#add-organizations-to-a-company.md).
@z

@x
### How does a company owner manage SSO/SCIM settings for a company?
@y
### How does a company owner manage SSO/SCIM settings for a company?
@z

@x
See your [SCIM](scim.md) and [SSO](../../security/for-admins/single-sign-on/configure/_index.md) settings.
@y
See your [SCIM](scim.md) and [SSO](../../security/for-admins/single-sign-on/configure/_index.md) settings.
@z

@x
### How does a company owner enable group mapping in an IdP?
@y
### How does a company owner enable group mapping in an IdP?
@z

@x
See [SCIM](scim.md) and [group mapping](../../security/for-admins/provisioning/group-mapping.md) for more information.
@y
See [SCIM](scim.md) and [group mapping](../../security/for-admins/provisioning/group-mapping.md) for more information.
@z

@x
### What's the definition of a company versus an organization?
@y
### What's the definition of a company versus an organization?
@z

@x
A company is a collection of organizations that are managed together. An organization is a collection of repositories and teams that are managed together.
@y
A company is a collection of organizations that are managed together. An organization is a collection of repositories and teams that are managed together.
@z
