%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Set up a Docker organization
linkTitle: Setup
@y
title: Set up a Docker organization
linkTitle: Setup
@z

@x
description: >
  Create, convert, or onboard a Docker organization under one namespace and
  subscription.
keywords:
  - Docker organization setup
  - create organization
  - onboard organization
  - convert Docker account
  - organization namespace
  - Docker Home
@y
description: >
  Create, convert, or onboard a Docker organization under one namespace and
  subscription.
keywords:
  - Docker organization setup
  - create organization
  - onboard organization
  - convert Docker account
  - organization namespace
  - Docker Home
@z

%grid:

@x
  - title: Create your organization
    description: Choose a new namespace and subscription.
    icon: building-storefront
    link: /accounts/organization/setup/orgs/
@y
  - title: Create your organization
    description: Choose a new namespace and subscription.
    icon: building-storefront
    link: __SUBDIR__/accounts/organization/setup/orgs/
@z

@x
  - title: Convert your account
    description: Keep an existing Docker ID as the organization namespace.
    icon: arrows-right-left
    link: /accounts/organization/setup/convert-account/
@y
  - title: Convert your account
    description: Keep an existing Docker ID as the organization namespace.
    icon: arrows-right-left
    link: __SUBDIR__/accounts/organization/setup/convert-account/
@z

@x
  - title: Onboard your organization
    description: Invite members and configure sign-in.
    icon: magnifying-glass-plus
    link: /accounts/organization/setup/onboard/
@y
  - title: Onboard your organization
    description: Invite members and configure sign-in.
    icon: magnifying-glass-plus
    link: __SUBDIR__/accounts/organization/setup/onboard/
@z

@x
  - title: Manage your organization
    description: Add members, teams, licenses, and seats after setup.
    icon: user-group
    link: /accounts/organization/manage/
@y
  - title: Manage your organization
    description: Add members, teams, licenses, and seats after setup.
    icon: user-group
    link: __SUBDIR__/accounts/organization/manage/
@z

@x
  - title: Security
    description: Configure single sign-on, provisioning, and access management.
    icon: shield-check
    link: /security/
@y
  - title: Security
    description: Configure single sign-on, provisioning, and access management.
    icon: shield-check
    link: __SUBDIR__/security/
@z

@x
An organization groups members and teams under one namespace and one
subscription. Anyone with a [Docker ID](/manuals/accounts/_index.md) can
create an organization or convert an individual account into one.
@y
An organization groups members and teams under one namespace and one
subscription. Anyone with a [Docker ID](manuals/accounts/_index.md) can
create an organization or convert an individual account into one.
@z

@x
You start by creating a new organization or converting an individual
account. After creating or converting, you can onboard your organization.
@y
You start by creating a new organization or converting an individual
account. After creating or converting, you can onboard your organization.
@z

@x
## Names versus namespaces
@y
## Names versus namespaces
@z

@x
When you create an organization, you set two values:
@y
When you create an organization, you set two values:
@z

@x
- Organization namespace is the permanent, unique identifier for your
  organization. It becomes the first part of every image name you push, as
  in `namespace/image:tag`. You can't change it after you create the
  organization.
  - Docker IDs and organization namespaces must be unique.
  - If a Docker ID is `acme`, no organization can use `acme` as its
    namespace.
- Organization name is the display name shown on your organization's
  Docker profile. You can change it at any time. See
  [Change organization information](/manuals/accounts/organization/manage/general-settings.md).
@y
- Organization namespace is the permanent, unique identifier for your
  organization. It becomes the first part of every image name you push, as
  in `namespace/image:tag`. You can't change it after you create the
  organization.
  - Docker IDs and organization namespaces must be unique.
  - If a Docker ID is `acme`, no organization can use `acme` as its
    namespace.
- Organization name is the display name shown on your organization's
  Docker profile. You can change it at any time. See
  [Change organization information](manuals/accounts/organization/manage/general-settings.md).
@z

@x
## Choose how to set up
@y
## Choose how to set up
@z

@x
The difference between creating and converting is what happens to your
existing repositories.
@y
The difference between creating and converting is what happens to your
existing repositories.
@z

@x
- Create an organization: Choose a new namespace. Your existing
  repositories stay under your personal Docker ID.
- Convert your account: Your Docker ID becomes the organization’s
  namespace. Your repositories and image names stay the same, so anyone
  pulling your images can keep using their existing image references.
@y
- Create an organization: Choose a new namespace. Your existing
  repositories stay under your personal Docker ID.
- Convert your account: Your Docker ID becomes the organization’s
  namespace. Your repositories and image names stay the same, so anyone
  pulling your images can keep using their existing image references.
@z

@x
## Next steps
@y
## Next steps
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
