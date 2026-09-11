%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Security
linkTitle: Security
description: >
  Secure Docker accounts, manage access, and control membership for
  individuals and organizations in Docker Home.
keywords: docker, docker hub, security, 2FA, access tokens, SSO, OIDC,
  provisioning, roles, Docker Home
@y
title: Security
linkTitle: Security
description: >
  Secure Docker accounts, manage access, and control membership for
  individuals and organizations in Docker Home.
keywords: docker, docker hub, security, 2FA, access tokens, SSO, OIDC,
  provisioning, roles, Docker Home
@z

@x
  - title: Authentication
    description: Two-factor authentication, single sign-on, and OIDC connections.
    icon: key
    link: /security/authentication/
@y
  - title: Authentication
    description: Two-factor authentication, single sign-on, and OIDC connections.
    icon: key
    link: __SUBDIR__/security/authentication/
@z

@x
  - title: Access tokens
    description: Personal and organization access tokens for the Docker CLI and automation.
    icon: lock-closed
    link: /security/access-tokens/
@y
  - title: Access tokens
    description: Personal and organization access tokens for the Docker CLI and automation.
    icon: lock-closed
    link: __SUBDIR__/security/access-tokens/
@z

@x
  - title: Provisioning
    description: Add users with SCIM, JIT, auto-provisioning, and domain management.
    icon: arrow-path
    link: /security/provisioning/
@y
  - title: Provisioning
    description: Add users with SCIM, JIT, auto-provisioning, and domain management.
    icon: arrow-path
    link: __SUBDIR__/security/provisioning/
@z

@x
  - title: Roles and permissions
    description: Assign core or custom roles to control access in your organization.
    icon: shield-check
    link: /security/roles-and-permissions/
@y
  - title: Roles and permissions
    description: Assign core or custom roles to control access in your organization.
    icon: shield-check
    link: __SUBDIR__/security/roles-and-permissions/
@z

@x
Security helps individual users and organization owners secure their
accounts, manage access, and control membership. You configure these
settings in [Docker Home](https://app.docker.com/).
@y
Security helps individual users and organization owners secure their
accounts, manage access, and control membership. You configure these
settings in [Docker Home](https://app.docker.com/).
@z

@x
## Individual accounts
@y
## Individual accounts
@z

@x
You sign in with your individual account.
@y
You sign in with your individual account.
@z

@x
- [Two-factor authentication](/manuals/security/authentication/2fa/_index.md)
(2FA) adds a time-based one-time password (TOTP) from an authenticator
app to your password.
- A [personal access token](/manuals/security/access-tokens/personal-access-tokens.md)
(PAT) authenticates the Docker CLI and tools without your password, and
is required for CLI sign-in when 2FA is on or single sign-on (SSO) is
enforced.
@y
- [Two-factor authentication](manuals/security/authentication/2fa/_index.md)
(2FA) adds a time-based one-time password (TOTP) from an authenticator
app to your password.
- A [personal access token](manuals/security/access-tokens/personal-access-tokens.md)
(PAT) authenticates the Docker CLI and tools without your password, and
is required for CLI sign-in when 2FA is on or single sign-on (SSO) is
enforced.
@z

@x
## Organization accounts
@y
## Organization accounts
@z

@x
Organization and company owners set up how members sign in, add them to
the organization, configure automation, and control what members can do.
@y
Organization and company owners set up how members sign in, add them to
the organization, configure automation, and control what members can do.
@z

@x
- [Single sign-on](/manuals/security/authentication/single-sign-on/_index.md)
(SSO) federates sign-in through your identity provider, which can cover
one organization or every organization in a company.
- [Provisioning](/manuals/security/provisioning/_index.md) adds users with
System for Cross-domain Identity Management (SCIM), Just-in-Time (JIT)
provisioning, auto-provisioning, or domain matching.
- An [organization access token](/manuals/security/access-tokens/organization-access-tokens.md)
(OAT) stays with the organization when membership changes.
- [OIDC connections](/manuals/security/authentication/oidc-connections/_index.md)
use OpenID Connect to authenticate GitHub Actions with short-lived
tokens, as an alternative to a long-lived OAT.
- [Roles and permissions](/manuals/security/roles-and-permissions/_index.md)
control what members can do after they join.
@y
- [Single sign-on](manuals/security/authentication/single-sign-on/_index.md)
(SSO) federates sign-in through your identity provider, which can cover
one organization or every organization in a company.
- [Provisioning](manuals/security/provisioning/_index.md) adds users with
System for Cross-domain Identity Management (SCIM), Just-in-Time (JIT)
provisioning, auto-provisioning, or domain matching.
- An [organization access token](manuals/security/access-tokens/organization-access-tokens.md)
(OAT) stays with the organization when membership changes.
- [OIDC connections](manuals/security/authentication/oidc-connections/_index.md)
use OpenID Connect to authenticate GitHub Actions with short-lived
tokens, as an alternative to a long-lived OAT.
- [Roles and permissions](manuals/security/roles-and-permissions/_index.md)
control what members can do after they join.
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
