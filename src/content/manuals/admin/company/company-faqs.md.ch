%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Company FAQs
linkTitle: FAQs
@y
title: Company FAQs
linkTitle: FAQs
@z

@x
description: Frequently asked questions about Docker companies, including subscriptions, seats, company owners, and permissions.
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, company, administration, company management
@y
description: Frequently asked questions about Docker companies, including subscriptions, seats, company owners, and permissions.
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, company, administration, company management
@z

@x
### Some of my organizations don’t have a Docker Business subscription. Can I still use a parent company?
@y
### Some of my organizations don’t have a Docker Business subscription. Can I still use a parent company?
@z

@x
Yes, but you can only add organizations with a Docker Business subscription
to a company. For more details, see [Add more organizations](/manuals/admin/company/manage.md#add-more-organizations).
@y
Yes, but you can only add organizations with a Docker Business subscription
to a company. For more details, see [Add more organizations](manuals/admin/company/manage.md#add-more-organizations).
@z

@x
### What happens if one of my organizations downgrades from Docker Business, but I still need access as a company owner?
@y
### What happens if one of my organizations downgrades from Docker Business, but I still need access as a company owner?
@z

@x
To access and manage a nested organization, it must have a Docker Business
subscription. If an organization downgrades from Docker Business, its owner must
manage it outside of the company. For more details, see
[Add more organizations](/manuals/admin/company/manage.md#add-more-organizations).
@y
To access and manage a nested organization, it must have a Docker Business
subscription. If an organization downgrades from Docker Business, its owner must
manage it outside of the company. For more details, see
[Add more organizations](manuals/admin/company/manage.md#add-more-organizations).
@z

@x
### Do company owners occupy a subscription seat?
@y
### Do company owners occupy a subscription seat?
@z

@x
Company owners don't occupy a seat unless one of the following is true:
@y
Company owners don't occupy a seat unless one of the following is true:
@z

@x
- They are added as a member of an organization under your company
- SSO is enabled and the company owner signs in through SSO, which
  automatically adds them as an organization member
@y
- They are added as a member of an organization under your company
- SSO is enabled and the company owner signs in through SSO, which
  automatically adds them as an organization member
@z

@x
When you first create a company, your account is both a company owner and an
organization owner, so it occupies a seat as long as you remain an organization
owner. To free up that seat,
[assign another user as the organization owner](/manuals/admin/organization/manage/members.md#update-a-member-role)
and remove yourself from the organization. You keep full administrative access
as a company owner without using a subscription seat.
@y
When you first create a company, your account is both a company owner and an
organization owner, so it occupies a seat as long as you remain an organization
owner. To free up that seat,
[assign another user as the organization owner](manuals/admin/organization/manage/members.md#update-a-member-role)
and remove yourself from the organization. You keep full administrative access
as a company owner without using a subscription seat.
@z

@x
### What permissions does the company owner have in the associated/nested organizations?
@y
### What permissions does the company owner have in the associated/nested organizations?
@z

@x
Company owners can navigate to the **Organizations** page to view all their
nested organizations in a single location. They can also view or edit
organization members and change single sign-on (SSO) and System for
Cross-domain Identity Management (SCIM) settings. Changes to company settings
impact all users in each organization under the company.
@y
Company owners can navigate to the **Organizations** page to view all their
nested organizations in a single location. They can also view or edit
organization members and change single sign-on (SSO) and System for
Cross-domain Identity Management (SCIM) settings. Changes to company settings
impact all users in each organization under the company.
@z

@x
For more information, see [Roles and permissions](/manuals/enterprise/security/roles-and-permissions.md).
@y
For more information, see [Roles and permissions](manuals/enterprise/security/roles-and-permissions.md).
@z
