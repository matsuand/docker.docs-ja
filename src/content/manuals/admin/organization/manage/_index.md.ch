%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Manage your organization
linkTitle: Manage
@y
title: Manage your organization
linkTitle: Manage
@z

@x
description: Learn how to manage your Docker organization, including members, teams, licenses, seats, and product access.
keywords: manage organization, members, teams, licenses, seats, product access, organization management, docker home
@y
description: Learn how to manage your Docker organization, including members, teams, licenses, seats, and product access.
keywords: manage organization, members, teams, licenses, seats, product access, organization management, docker home
@z

@x
  - title: Members
    description: Invite, manage, and assign roles to your organization members.
    icon: user-plus
    link: /admin/organization/manage/members/
@y
  - title: Members
    description: Invite, manage, and assign roles to your organization members.
    icon: user-plus
    link: __SUBDIR__/admin/organization/manage/members/
@z

@x
  - title: Product access and usage
    description: Manage access and view usage for Docker products across your organization.
    icon: squares-2x2
    link: /admin/organization/manage/manage-products/
@y
  - title: Product access and usage
    description: Manage access and view usage for Docker products across your organization.
    icon: squares-2x2
    link: __SUBDIR__/admin/organization/manage/manage-products/
@z

@x
  - title: Security
    description: Configure single sign-on, provisioning, and access management.
    icon: shield-check
    link: /enterprise/security/
@y
  - title: Security
    description: Configure single sign-on, provisioning, and access management.
    icon: shield-check
    link: __SUBDIR__/enterprise/security/
@z

@x
  - title: Billing
    description: Manage payment methods and view billing history.
    icon: credit-card
    link: /billing/
@y
  - title: Billing
    description: Manage payment methods and view billing history.
    icon: credit-card
    link: __SUBDIR__/billing/
@z

@x
As an organization owner, you manage your organization's membership, access,
and product usage. You can invite members, group them into teams, assign or
revoke licenses and seats, and change access to Docker products.
@y
As an organization owner, you manage your organization's membership, access,
and product usage. You can invite members, group them into teams, assign or
revoke licenses and seats, and change access to Docker products.
@z

@x
## Managing your organization
@y
## Managing your organization
@z

@x
You manage your organization from [Docker Home](https://app.docker.com) and
must be assigned the
[organization owner role](/manuals/enterprise/security/roles-and-permissions/_index.md).
@y
You manage your organization from [Docker Home](https://app.docker.com) and
must be assigned the
[organization owner role](manuals/enterprise/security/roles-and-permissions/_index.md).
@z

@x
## Seats and licenses
@y
## Seats and licenses
@z

@x
Seats and licenses both control access, but they apply to different kinds of
plans. The following table summarizes the difference.
@y
Seats and licenses both control access, but they apply to different kinds of
plans. The following table summarizes the difference.
@z

@x
| Entitlement | What it grants                                          | Applies to                                       | Managed from |
| ----------- | ------------------------------------------------------- | ------------------------------------------------ | ------------ |
| Seat        | Membership in your Docker Team or Business subscription | Docker Core subscription                         | Billing      |
| License     | Access to a specific product or add-on                  | AI Governance, Docker Offload, and other add-ons | Members      |
@y
| Entitlement | What it grants                                          | Applies to                                       | Managed from |
| ----------- | ------------------------------------------------------- | ------------------------------------------------ | ------------ |
| Seat        | Membership in your Docker Team or Business subscription | Docker Core subscription                         | Billing      |
| License     | Access to a specific product or add-on                  | AI Governance, Docker Offload, and other add-ons | Members      |
@z

@x
For details, see [Seats](/manuals/admin/organization/manage/manage-seats.md)
and [License assignment](/manuals/admin/organization/manage/manage-licenses.md).
@y
For details, see [Seats](manuals/admin/organization/manage/manage-seats.md)
and [License assignment](manuals/admin/organization/manage/manage-licenses.md).
@z

@x
## Next steps
@y
## Next steps
@z

@x
Explore the following sections to manage your organization.
@y
Explore the following sections to manage your organization.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
