%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Authentication
linkTitle: Authentication
description: Configure single sign-on, OIDC connections, and two-factor authentication.
keywords: authentication, SSO, OIDC, two-factor authentication, 2FA, Docker security
@y
title: Authentication
linkTitle: Authentication
description: Configure single sign-on, OIDC connections, and two-factor authentication.
keywords: authentication, SSO, OIDC, two-factor authentication, 2FA, Docker security
@z

@x
  - title: Single sign-on
    description: Authenticate users through your identity provider.
    icon: key
    link: /security/authentication/single-sign-on/
@y
  - title: Single sign-on
    description: Authenticate users through your identity provider.
    icon: key
    link: __SUBDIR__/security/authentication/single-sign-on/
@z

@x
  - title: Two-factor authentication
    description: Add a TOTP security code to an individual Docker account.
    icon: device-phone-mobile
    link: /security/authentication/2fa/
@y
  - title: Two-factor authentication
    description: Add a TOTP security code to an individual Docker account.
    icon: device-phone-mobile
    link: __SUBDIR__/security/authentication/2fa/
@z

@x
  - title: OIDC connections
    description: Authenticate GitHub Actions with short-lived tokens.
    icon: lock-closed
    link: /security/authentication/oidc-connections/
@y
  - title: OIDC connections
    description: Authenticate GitHub Actions with short-lived tokens.
    icon: lock-closed
    link: __SUBDIR__/security/authentication/oidc-connections/
@z

@x
Authentication in Docker Home is how users and workloads prove who they are
before they access Docker products.
@y
Authentication in Docker Home is how users and workloads prove who they are
before they access Docker products.
@z

@x
Two-factor authentication (2FA) protects an individual account. Single
sign-on (SSO) federates sign-in for an organization or company. OpenID
Connect (OIDC) connections authenticate CI workloads such as GitHub Actions.
@y
Two-factor authentication (2FA) protects an individual account. Single
sign-on (SSO) federates sign-in for an organization or company. OpenID
Connect (OIDC) connections authenticate CI workloads such as GitHub Actions.
@z

@x
## Choose an authentication method
@y
## Choose an authentication method
@z

@x
| Method | Who it covers | Who configures it | How authentication works |
| --- | --- | --- | --- |
| Two-factor authentication (2FA) | An individual Docker account | The account holder | Password plus a time-based one-time password (TOTP) from an authenticator app |
| Single sign-on (SSO) | An organization or company | An organization or company owner | Users sign in through the organization's identity provider (IdP) |
| OIDC connections | GitHub Actions and similar workloads | An organization owner or editor | Docker exchanges short-lived tokens issued per workflow run |
@y
| Method | Who it covers | Who configures it | How authentication works |
| --- | --- | --- | --- |
| Two-factor authentication (2FA) | An individual Docker account | The account holder | Password plus a time-based one-time password (TOTP) from an authenticator app |
| Single sign-on (SSO) | An organization or company | An organization or company owner | Users sign in through the organization's identity provider (IdP) |
| OIDC connections | GitHub Actions and similar workloads | An organization owner or editor | Docker exchanges short-lived tokens issued per workflow run |
@z

@x
SSO requires a Docker Business subscription. OIDC connections require a
Docker Team or Business subscription.
@y
SSO requires a Docker Business subscription. OIDC connections require a
Docker Team or Business subscription.
@z

@x
To require Docker Desktop users to sign in as organization members, see
[Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
Enforce sign-in is configured in Enterprise, not in this section.
@y
To require Docker Desktop users to sign in as organization members, see
[Enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md).
Enforce sign-in is configured in Enterprise, not in this section.
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
