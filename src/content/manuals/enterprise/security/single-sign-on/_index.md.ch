%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Single sign-on overview
linkTitle: Single sign-on
description: Learn how single sign-on works, how to set it up, and the required SSO attributes.
keywords: Single Sign-On, SSO, sign-in, admin, docker hub, admin console, security, identity provider, SSO configuration, enterprise login, Docker Business, user authentication
@y
title: Single sign-on overview
linkTitle: Single sign-on
description: Learn how single sign-on works, how to set it up, and the required SSO attributes.
keywords: Single Sign-On, SSO, sign-in, admin, docker hub, admin console, security, identity provider, SSO configuration, enterprise login, Docker Business, user authentication
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Single sign-on (SSO) lets users access Docker by authenticating through their
identity providers (IdPs). SSO can be configured for an entire company,
including all associated organizations, or for a single organization that has a
Docker Business subscription.
@y
Single sign-on (SSO) lets users access Docker by authenticating through their
identity providers (IdPs). SSO can be configured for an entire company,
including all associated organizations, or for a single organization that has a
Docker Business subscription.
@z

@x
## How SSO works
@y
## How SSO works
@z

@x
When SSO is enabled, Docker supports a non-IdP-initiated flow for user sign-in.
Instead of signing in with a Docker username and password, users are redirected
to your IdP’s sign-in page. Users must initiate the SSO authentication process
by signing in to Docker Hub or Docker Desktop.
@y
When SSO is enabled, Docker supports a non-IdP-initiated flow for user sign-in.
Instead of signing in with a Docker username and password, users are redirected
to your IdP’s sign-in page. Users must initiate the SSO authentication process
by signing in to Docker Hub or Docker Desktop.
@z

@x
The following diagram illustrates how SSO operates and is managed between
Docker Hub, Docker Desktop, and your IdP.
@y
The following diagram illustrates how SSO operates and is managed between
Docker Hub, Docker Desktop, and your IdP.
@z

@x
![SSO architecture](images/SSO.png)
@y
![SSO architecture](images/SSO.png)
@z

@x
## Set up SSO
@y
## Set up SSO
@z

@x
To configure SSO in Docker, follow these steps:
@y
To configure SSO in Docker, follow these steps:
@z

@x
1. [Configure your domain](configure.md) by creating and verifying it.
1. [Create your SSO connection](connect.md) in Docker and your IdP.
1. Link Docker to your identity provider.
1. Test your SSO connection.
1. Provision users in Docker.
1. Optional. [Enforce sign-in](../enforce-sign-in/_index.md).
1. [Manage your SSO configuration](manage.md).
@y
1. [Configure your domain](configure.md) by creating and verifying it.
1. [Create your SSO connection](connect.md) in Docker and your IdP.
1. Link Docker to your identity provider.
1. Test your SSO connection.
1. Provision users in Docker.
1. Optional. [Enforce sign-in](../enforce-sign-in/_index.md).
1. [Manage your SSO configuration](manage.md).
@z

@x
Once configuration is complete, users can sign in to Docker services using
their company email address. After signing in, users are added to your company,
assigned to an organization, and added to a team.
@y
Once configuration is complete, users can sign in to Docker services using
their company email address. After signing in, users are added to your company,
assigned to an organization, and added to a team.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, make sure the following conditions are met:
@y
Before you begin, make sure the following conditions are met:
@z

@x
- Notify your company about the upcoming SSO sign-in process.
- Ensure all users have Docker Desktop version 4.42 or later installed.
- Confirm that each Docker user has a valid IdP account using the same
email address as their Unique Primary Identifier (UPN).
- If you plan to [enforce SSO](/manuals/enterprise/security/single-sign-on/connect.md#optional-enforce-sso),
users accessing Docker through the CLI must [create a personal access token (PAT)](/docker-hub/access-tokens/). The PAT replaces their username and password for authentication.
- Ensure CI/CD pipelines use PATs or OATs instead of passwords.
@y
- Notify your company about the upcoming SSO sign-in process.
- Ensure all users have Docker Desktop version 4.42 or later installed.
- Confirm that each Docker user has a valid IdP account using the same
email address as their Unique Primary Identifier (UPN).
- If you plan to [enforce SSO](manuals/enterprise/security/single-sign-on/connect.md#optional-enforce-sso),
users accessing Docker through the CLI must [create a personal access token (PAT)](__SUBDIR__/docker-hub/access-tokens/). The PAT replaces their username and password for authentication.
- Ensure CI/CD pipelines use PATs or OATs instead of passwords.
@z

@x
> [!IMPORTANT]
>
> Docker plans to deprecate CLI password-based sign-in in future releases.
Using a PAT ensures continued CLI access. For more information, see the
[security announcement](/manuals/security/security-announcements.md#deprecation-of-password-logins-on-cli-when-sso-enforced).
@y
> [!IMPORTANT]
>
> Docker plans to deprecate CLI password-based sign-in in future releases.
Using a PAT ensures continued CLI access. For more information, see the
[security announcement](manuals/security/security-announcements.md#deprecation-of-password-logins-on-cli-when-sso-enforced).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Start [configuring SSO](configure.md).
- Read the [FAQs](/manuals/enterprise/security/single-sign-on/faqs/general.md).
- [Troubleshoot](/manuals/enterprise/troubleshoot/troubleshoot-sso.md) SSO issues.
@y
- Start [configuring SSO](configure.md).
- Read the [FAQs](manuals/enterprise/security/single-sign-on/faqs/general.md).
- [Troubleshoot](manuals/enterprise/troubleshoot/troubleshoot-sso.md) SSO issues.
@z
