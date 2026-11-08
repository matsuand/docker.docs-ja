%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Secure Docker accounts and organizations
linkTitle: Security
description: >-
  Secure Docker accounts, manage access, and control membership for
  individuals and organizations in Docker Home.
keywords: docker, docker hub, security, account security, 2FA, access tokens,
  SSO, OIDC, provisioning, roles, Docker Home
@y
title: Secure Docker accounts and organizations
linkTitle: Security
description: >-
  Secure Docker accounts, manage access, and control membership for
  individuals and organizations in Docker Home.
keywords: docker, docker hub, security, account security, 2FA, access tokens,
  SSO, OIDC, provisioning, roles, Docker Home
@z

@x
Use these settings to protect your own sign-in, and to control who can join
an organization and what they can do. You configure them in
[Docker Home](https://app.docker.com/).
@y
Use these settings to protect your own sign-in, and to control who can join
an organization and what they can do. You configure them in
[Docker Home](https://app.docker.com/).
@z

@x
## Secure your account
@y
## Secure your account
@z

@x
Docker offers several methods to secure your account. You can choose how you sign in and what the CLI uses instead of your password.
@y
Docker offers several methods to secure your account. You can choose how you sign in and what the CLI uses instead of your password.
@z

@x
- [Two-factor authentication](/manuals/security/authentication/2fa/_index.md)
  (2FA) requires a time-based one-time password (TOTP) from an authenticator
  app after you enter your password.
- A [personal access token](/manuals/security/access-tokens/personal-access-tokens.md)
  (PAT) signs you in to the Docker CLI and other tools in place of your
  password. The CLI requires a PAT when two-factor authentication (2FA) is
  on or single sign-on (SSO) is enforced.
- [Connected accounts](/manuals/accounts/individual/manage-account.md#manage-connected-accounts)
  let you sign in with Google or GitHub when the provider account uses the
  same email address as your Docker account.
@y
- [Two-factor authentication](manuals/security/authentication/2fa/_index.md)
  (2FA) requires a time-based one-time password (TOTP) from an authenticator
  app after you enter your password.
- A [personal access token](manuals/security/access-tokens/personal-access-tokens.md)
  (PAT) signs you in to the Docker CLI and other tools in place of your
  password. The CLI requires a PAT when two-factor authentication (2FA) is
  on or single sign-on (SSO) is enforced.
- [Connected accounts](manuals/accounts/individual/manage-account.md#manage-connected-accounts)
  let you sign in with Google or GitHub when the provider account uses the
  same email address as your Docker account.
@z

@x
## Secure your organization
@y
## Secure your organization
@z

@x
Owners can choose how members sign in, how Docker adds them, and what they can do.
@y
Owners can choose how members sign in, how Docker adds them, and what they can do.
@z

@x
- [Single sign-on](/manuals/security/authentication/single-sign-on/_index.md)
  (SSO) allows members to sign-in through your identity provider.
- [Provisioning](/manuals/security/provisioning/_index.md) adds users with
  SCIM, Just-in-Time (JIT) provisioning, or auto-provisioning. Once an SSO connection exists, Docker enables JIT by default, or you can configure SCIM.
- An [organization access token](/manuals/security/access-tokens/organization-access-tokens.md)
  (OAT) gives automation access on Docker Hub to selected repositories,
  organization settings, Docker Build Cloud, and Docker Governance. It
  belongs to the organization, so that access keeps working when people
  join or leave.
- [OIDC connections](/manuals/security/authentication/oidc-connections/_index.md)
  let GitHub Actions sign in with a short-lived token instead of a
  long-lived OAT. Organization owners and editors can create, update, and
  delete these connections.
- [Roles and permissions](/manuals/security/roles-and-permissions/_index.md)
  control what members can do after they join.
@y
- [Single sign-on](manuals/security/authentication/single-sign-on/_index.md)
  (SSO) allows members to sign-in through your identity provider.
- [Provisioning](manuals/security/provisioning/_index.md) adds users with
  SCIM, Just-in-Time (JIT) provisioning, or auto-provisioning. Once an SSO connection exists, Docker enables JIT by default, or you can configure SCIM.
- An [organization access token](manuals/security/access-tokens/organization-access-tokens.md)
  (OAT) gives automation access on Docker Hub to selected repositories,
  organization settings, Docker Build Cloud, and Docker Governance. It
  belongs to the organization, so that access keeps working when people
  join or leave.
- [OIDC connections](manuals/security/authentication/oidc-connections/_index.md)
  let GitHub Actions sign in with a short-lived token instead of a
  long-lived OAT. Organization owners and editors can create, update, and
  delete these connections.
- [Roles and permissions](manuals/security/roles-and-permissions/_index.md)
  control what members can do after they join.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Choose a personal or organization access token](/manuals/security/access-tokens/_index.md).
- [Choose how to add users](/manuals/security/provisioning/_index.md).
- Compare what members can do in
  [Roles and permissions](/manuals/security/roles-and-permissions/core-roles.md).
@y
- [Choose a personal or organization access token](manuals/security/access-tokens/_index.md).
- [Choose how to add users](manuals/security/provisioning/_index.md).
- Compare what members can do in
  [Roles and permissions](manuals/security/roles-and-permissions/core-roles.md).
@z
