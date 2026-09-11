%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Access tokens
linkTitle: Access tokens
description: Create and manage personal and organization access tokens for Docker Hub authentication.
keywords: access tokens, personal access tokens, organization access tokens, PAT, OAT, Docker security
@y
title: Access tokens
linkTitle: Access tokens
description: Create and manage personal and organization access tokens for Docker Hub authentication.
keywords: access tokens, personal access tokens, organization access tokens, PAT, OAT, Docker security
@z

@x
  - title: Personal access tokens
    description: Authenticate the Docker CLI and tools with a token tied to your account.
    icon: lock-closed
    link: /security/access-tokens/personal-access-tokens/
@y
  - title: Personal access tokens
    description: Authenticate the Docker CLI and tools with a token tied to your account.
    icon: lock-closed
    link: __SUBDIR__/security/access-tokens/personal-access-tokens/
@z

@x
  - title: Organization access tokens
    description: Grant org-owned Hub access to CI/CD and other automation.
    icon: building-office-2
    link: /security/access-tokens/organization-access-tokens/
@y
  - title: Organization access tokens
    description: Grant org-owned Hub access to CI/CD and other automation.
    icon: building-office-2
    link: __SUBDIR__/security/access-tokens/organization-access-tokens/
@z

@x
Access tokens let you authenticate to Docker Hub without using your password.
Use a token for the Docker CLI, automation, and any account that has
two-factor authentication (2FA) or enforced single sign-on (SSO), because
password sign-in to the CLI is not supported in those cases.
@y
Access tokens let you authenticate to Docker Hub without using your password.
Use a token for the Docker CLI, automation, and any account that has
two-factor authentication (2FA) or enforced single sign-on (SSO), because
password sign-in to the CLI is not supported in those cases.
@z

@x
## Choose a token type
@y
## Choose a token type
@z

@x
| Token | Ownership | Use when | Limitations |
| --- | --- | --- | --- |
| Personal access token (PAT) | Tied to an individual Docker account | CLI access, local tools, and automation that should run as you. Required for CLI sign-in when 2FA is on or SSO is enforced | Access ends if the account leaves the organization or the token is revoked |
| Organization access token (OAT) | Owned by the organization. Any organization owner can manage it | CI/CD and other automation that must keep working when membership changes | Incompatible with Docker Desktop and Image Access Management |
@y
| Token | Ownership | Use when | Limitations |
| --- | --- | --- | --- |
| Personal access token (PAT) | Tied to an individual Docker account | CLI access, local tools, and automation that should run as you. Required for CLI sign-in when 2FA is on or SSO is enforced | Access ends if the account leaves the organization or the token is revoked |
| Organization access token (OAT) | Owned by the organization. Any organization owner can manage it | CI/CD and other automation that must keep working when membership changes | Incompatible with Docker Desktop and Image Access Management |
@z

@x
For GitHub Actions, [OIDC connections](/manuals/security/authentication/oidc-connections/_index.md)
are an alternative to storing a long-lived organization access token.
@y
For GitHub Actions, [OIDC connections](manuals/security/authentication/oidc-connections/_index.md)
are an alternative to storing a long-lived organization access token.
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
