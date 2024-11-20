%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how single sign-on works, how to set it up, and the required SSO attributes.
keywords: Single Sign-On, SSO, sign-on, admin, docker hub, admin console, security
title: Single sign-on overview
linkTitle: Single sign-on
@y
description: Learn how single sign-on works, how to set it up, and the required SSO attributes.
keywords: Single Sign-On, SSO, sign-on, admin, docker hub, admin console, security
title: Single sign-on overview
linkTitle: Single sign-on
@z

@x
Single sign-on (SSO) lets users access Docker by authenticating using their identity providers (IdPs). SSO is available for a whole company, and all associated organizations within that company, or an individual organization that has a Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](/subscription/upgrade/).
@y
Single sign-on (SSO) lets users access Docker by authenticating using their identity providers (IdPs). SSO is available for a whole company, and all associated organizations within that company, or an individual organization that has a Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](__SUBDIR__/subscription/upgrade/).
@z

@x
## How SSO works
@y
## How SSO works
@z

@x
When you enable SSO, Docker supports a non-IdP-initiated SSO flow for user login. Instead of users authenticating using their Docker username and password, they are redirected to your identity provider's authentication page to sign in. Users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@y
When you enable SSO, Docker supports a non-IdP-initiated SSO flow for user login. Instead of users authenticating using their Docker username and password, they are redirected to your identity provider's authentication page to sign in. Users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@z

@x
The following diagram shows how SSO operates and is managed in Docker Hub and Docker Desktop. In addition, it provides information on how to authenticate between your IdP.
@y
The following diagram shows how SSO operates and is managed in Docker Hub and Docker Desktop. In addition, it provides information on how to authenticate between your IdP.
@z

@x
![SSO architecture](images/SSO.png)
@y
![SSO architecture](images/SSO.png)
@z

@x
## How to set it up
@y
## How to set it up
@z

@x
SSO is configured using the following steps:
1. [Configure SSO](../single-sign-on/configure.md) by creating and verifying a domain in Docker.
2. [Create your SSO connection](../single-sign-on/connect.md) in Docker and your IdP.
3. Cross-connect Docker and your IdP.
4. Test your connection.
5. Provision users.
6. Optional. [Enforce sign-in](../enforce-sign-in/_index.md).
7. [Manage your SSO configuration](../single-sign-on/manage.md).
@y
SSO is configured using the following steps:
1. [Configure SSO](../single-sign-on/configure.md) by creating and verifying a domain in Docker.
2. [Create your SSO connection](../single-sign-on/connect.md) in Docker and your IdP.
3. Cross-connect Docker and your IdP.
4. Test your connection.
5. Provision users.
6. Optional. [Enforce sign-in](../enforce-sign-in/_index.md).
7. [Manage your SSO configuration](../single-sign-on/manage.md).
@z

@x
Once your SSO configuration is complete, a first-time user can sign in to Docker Hub or Docker Desktop using their company's domain email address. Once they sign in, they are added to your company, assigned to an organization, and if necessary, assigned to a team.
@y
Once your SSO configuration is complete, a first-time user can sign in to Docker Hub or Docker Desktop using their company's domain email address. Once they sign in, they are added to your company, assigned to an organization, and if necessary, assigned to a team.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before configuring SSO, ensure you meet the following prerequisites:
* Notify your company about the new SSO sign in procedures.
* Verify that all users have Docker Desktop version 4.4.2 or later installed.
* If your organization is planning to [enforce SSO](/manuals/security/for-admins/single-sign-on/connect.md#optional-enforce-sso), members using the Docker CLI are required to [create a Personal Access Token (PAT)](/docker-hub/access-tokens/). The PAT will be used instead of their username and password. Docker plans to deprecate signing in to the CLI with a password in the future, so using a PAT will be required to prevent issues with authentication. For more details see the [security announcement](/security/security-announcements/#deprecation-of-password-logins-on-cli-when-sso-enforced).
* Ensure all your Docker users have a valid user on your IdP with the same email address as their Unique Primary Identifier (UPN).
* Confirm that all CI/CD pipelines have replaced their passwords with PATs.
* For your service accounts, add your additional domains or enable it in your IdP.
@y
Before configuring SSO, ensure you meet the following prerequisites:
* Notify your company about the new SSO sign in procedures.
* Verify that all users have Docker Desktop version 4.4.2 or later installed.
* If your organization is planning to [enforce SSO](manuals/security/for-admins/single-sign-on/connect.md#optional-enforce-sso), members using the Docker CLI are required to [create a Personal Access Token (PAT)](__SUBDIR__/docker-hub/access-tokens/). The PAT will be used instead of their username and password. Docker plans to deprecate signing in to the CLI with a password in the future, so using a PAT will be required to prevent issues with authentication. For more details see the [security announcement](__SUBDIR__/security/security-announcements/#deprecation-of-password-logins-on-cli-when-sso-enforced).
* Ensure all your Docker users have a valid user on your IdP with the same email address as their Unique Primary Identifier (UPN).
* Confirm that all CI/CD pipelines have replaced their passwords with PATs.
* For your service accounts, add your additional domains or enable it in your IdP.
@z

@x
## What's next?
@y
## What's next?
@z

@x
- Start [configuring SSO](../../for-admins/single-sign-on/configure.md) in Docker
- Explore the [FAQs](../../../security/faqs/single-sign-on/_index.md)
@y
- Start [configuring SSO](../../for-admins/single-sign-on/configure.md) in Docker
- Explore the [FAQs](../../../security/faqs/single-sign-on/_index.md)
@z
