%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: >-
  Provision Docker organization users with SCIM, JIT, group mapping, or
  auto-provisioning, and map SSO and SAML attributes from your identity
  provider.
keywords: provision users, user provisioning, JIT, SCIM, group mapping,
  auto-provisioning, SSO, SAML, identity provider, dockerOrg, dockerRole,
  dockerTeam, dockerSessionMinutes, Docker Home, admin, security
title: User provisioning overview
linkTitle: Provision
@y
description: >-
  Provision Docker organization users with SCIM, JIT, group mapping, or
  auto-provisioning, and map SSO and SAML attributes from your identity
  provider.
keywords: provision users, user provisioning, JIT, SCIM, group mapping,
  auto-provisioning, SSO, SAML, identity provider, dockerOrg, dockerRole,
  dockerTeam, dockerSessionMinutes, Docker Home, admin, security
title: User provisioning overview
linkTitle: Provision
@z

% grid:

@x
  - title: Add and manage domains
    description: Add, verify, and manage domains for auto-provisioning.
    icon: globe-alt
    link: "domain-management/"
@y
  - title: Add and manage domains
    description: Add, verify, and manage domains for auto-provisioning.
    icon: globe-alt
    link: "domain-management/"
@z

@x
  - title: SCIM provisioning
    description: Sync user data between your IdP and Docker with SCIM.
    icon: arrow-path
    link: "scim/"
@y
  - title: SCIM provisioning
    description: Sync user data between your IdP and Docker with SCIM.
    icon: arrow-path
    link: "scim/"
@z

@x
  - title: Just-in-Time (JIT) provisioning
    description: Create user accounts automatically on first SSO sign-in.
    icon: clock
    link: "just-in-time/"
@y
  - title: Just-in-Time (JIT) provisioning
    description: Create user accounts automatically on first SSO sign-in.
    icon: clock
    link: "just-in-time/"
@z

@x
  - title: Auto-provisioning
    description: Add users whose email addresses match a verified domain.
    icon: user-group
    link: "auto-provisioning/"
@y
  - title: Auto-provisioning
    description: Add users whose email addresses match a verified domain.
    icon: user-group
    link: "auto-provisioning/"
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
After you configure single sign-on (SSO), provision users so they can
access your organization through automated account management.
@y
After you configure single sign-on (SSO), provision users so they can
access your organization through automated account management.
@z

@x
## Provisioning methods
@y
## Provisioning methods
@z

@x
Provisioning automates account creation, updates, and deactivation using
data from your identity provider (IdP). Docker supports the following
methods:
@y
Provisioning automates account creation, updates, and deactivation using
data from your identity provider (IdP). Docker supports the following
methods:
@z

@x
| Provisioning method | When it runs | Lifecycle management | Default setting |
| :--- | :--- | :--- | :--- |
| [System for Cross-domain Identity Management (SCIM)](/manuals/security/provisioning/scim/_index.md) | On the IdP's synchronization schedule or through Provision on Demand | Creates and updates users, synchronizes configured groups, and deprovisions users | Disabled |
| [Just-in-Time (JIT)](/manuals/security/provisioning/just-in-time.md) | When a user signs in through SSO | Creates users and applies attributes from the SSO assertion. It doesn't deprovision users | Enabled when you configure SSO |
| [Auto-provisioning](/manuals/security/provisioning/auto-provisioning.md) | When an existing Docker user signs in or verifies their email, and that address uses a verified domain | Adds the user to the organization. It doesn't create or deprovision accounts | Disabled |
@y
| Provisioning method | When it runs | Lifecycle management | Default setting |
| :--- | :--- | :--- | :--- |
| [System for Cross-domain Identity Management (SCIM)](manuals/security/provisioning/scim/_index.md) | On the IdP's synchronization schedule or through Provision on Demand | Creates and updates users, synchronizes configured groups, and deprovisions users | Disabled |
| [Just-in-Time (JIT)](manuals/security/provisioning/just-in-time.md) | When a user signs in through SSO | Creates users and applies attributes from the SSO assertion. It doesn't deprovision users | Enabled when you configure SSO |
| [Auto-provisioning](manuals/security/provisioning/auto-provisioning.md) | When an existing Docker user signs in or verifies their email, and that address uses a verified domain | Adds the user to the organization. It doesn't create or deprovision accounts | Disabled |
@z

@x
[Group mapping](/manuals/security/provisioning/scim/group-mapping.md) assigns
users to Docker organizations and teams. Use it with SAML SSO or SCIM. You can
also invite users manually when automatic provisioning isn't configured.
@y
[Group mapping](manuals/security/provisioning/scim/group-mapping.md) assigns
users to Docker organizations and teams. Use it with SAML SSO or SCIM. You can
also invite users manually when automatic provisioning isn't configured.
@z

@x
## Default provisioning setup
@y
## Default provisioning setup
@z

@x
Docker turns on JIT provisioning when you configure an SSO connection. If you
also enable SCIM, Docker recommends choosing one provisioning source to manage
users and attributes. Before configuring SCIM, review
[how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
@y
Docker turns on JIT provisioning when you configure an SSO connection. If you
also enable SCIM, Docker recommends choosing one provisioning source to manage
users and attributes. Before configuring SCIM, review
[how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
@z

@x
For a domain that belongs to an SSO connection, JIT adds the user instead of
auto-provisioning.
@y
For a domain that belongs to an SSO connection, JIT adds the user instead of
auto-provisioning.
@z

@x
## SSO attributes
@y
## SSO attributes
@z

@x
Each time a user signs in through SSO, Docker reads attributes from your
IdP to set the user's identity and permissions:
@y
Each time a user signs in through SSO, Docker reads attributes from your
IdP to set the user's identity and permissions:
@z

@x
| Attribute | Required | Description |
| :--- | :--- | :--- |
| Email address | Yes | Unique identifier for the user |
| Full name | Yes | User's complete name |
| Groups | No | Group-based access control |
| Docker Org | No | Organization the user belongs to |
| Docker Team | No | Team within the organization |
| Docker Role | No | Permissions in Docker |
| Docker session minutes | No | Session duration, in minutes, before users must re-authenticate with their IdP. Must be a positive integer greater than 0. If omitted, default session timeouts apply |
@y
| Attribute | Required | Description |
| :--- | :--- | :--- |
| Email address | Yes | Unique identifier for the user |
| Full name | Yes | User's complete name |
| Groups | No | Group-based access control |
| Docker Org | No | Organization the user belongs to |
| Docker Team | No | Team within the organization |
| Docker Role | No | Permissions in Docker |
| Docker session minutes | No | Session duration, in minutes, before users must re-authenticate with their IdP. Must be a positive integer greater than 0. If omitted, default session timeouts apply |
@z

@x
> [!NOTE]
>
> Default session timeouts apply when Docker session minutes is not
> specified. Docker Desktop sessions expire after 90 days or 30 days of
> inactivity. Docker Hub and Docker Home sessions expire after 24 hours.
@y
> [!NOTE]
>
> Default session timeouts apply when Docker session minutes is not
> specified. Docker Desktop sessions expire after 90 days or 30 days of
> inactivity. Docker Hub and Docker Home sessions expire after 24 hours.
@z

@x
## SAML attribute mapping
@y
## SAML attribute mapping
@z

@x
If your organization uses SAML for SSO, Docker reads these attributes
from the SAML assertion. Identity providers may use different names for
the same attributes.
@y
If your organization uses SAML for SSO, Docker reads these attributes
from the SAML assertion. Identity providers may use different names for
the same attributes.
@z

@x
| SSO attribute | SAML assertion attributes |
| :--- | :--- |
| Email address | `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"`, `email` |
| Full name | `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"`, `name`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname"` |
| Groups (optional) | `"http://schemas.xmlsoap.org/claims/Group"`, `"http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"`, `Groups`, `groups` |
| Docker Org (optional) | `dockerOrg` |
| Docker Team (optional) | `dockerTeam` |
| Docker Role (optional) | `dockerRole` |
| Docker session minutes (optional) | `dockerSessionMinutes`, must be a positive integer greater than 0 |
@y
| SSO attribute | SAML assertion attributes |
| :--- | :--- |
| Email address | `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"`, `email` |
| Full name | `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"`, `name`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname"` |
| Groups (optional) | `"http://schemas.xmlsoap.org/claims/Group"`, `"http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"`, `Groups`, `groups` |
| Docker Org (optional) | `dockerOrg` |
| Docker Team (optional) | `dockerTeam` |
| Docker Role (optional) | `dockerRole` |
| Docker session minutes (optional) | `dockerSessionMinutes`, must be a positive integer greater than 0 |
@z

@x
## Next steps
@y
## Next steps
@z

@x
Choose the provisioning method that fits your organization:
@y
Choose the provisioning method that fits your organization:
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z

@x
If users get the wrong role or team after you change methods, see
[Troubleshoot provisioning](/manuals/security/provisioning/troubleshoot-provisioning.md).
@y
If users get the wrong role or team after you change methods, see
[Troubleshoot provisioning](manuals/security/provisioning/troubleshoot-provisioning.md).
@z
