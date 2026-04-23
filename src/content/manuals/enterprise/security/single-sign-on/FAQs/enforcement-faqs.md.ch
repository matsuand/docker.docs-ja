%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: SSO enforcement FAQs
linkTitle: Enforcement
description: Frequently asked questions about Docker single sign-on enforcement and its effects on users
keywords: SSO enforcement, single sign-on, personal access tokens, CLI authentication, guest users
tags: [FAQ]
@y
title: SSO enforcement FAQs
linkTitle: Enforcement
description: Frequently asked questions about Docker single sign-on enforcement and its effects on users
keywords: SSO enforcement, single sign-on, personal access tokens, CLI authentication, guest users
tags: [FAQ]
@z

@x
## Does Docker SSO support authenticating through the command line?
@y
## Does Docker SSO support authenticating through the command line?
@z

@x
When SSO is enforced, [passwords are prevented from accessing the Docker CLI](/manuals/security/security-announcements.md#deprecation-of-password-logins-on-cli-when-sso-enforced). You must use a personal access token (PAT) for CLI authentication instead.
@y
When SSO is enforced, [passwords are prevented from accessing the Docker CLI](manuals/security/security-announcements.md#deprecation-of-password-logins-on-cli-when-sso-enforced). You must use a personal access token (PAT) for CLI authentication instead.
@z

@x
Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage personal access tokens](/manuals/security/access-tokens.md). Users who already used a PAT before SSO enforcement can continue using that PAT.
@y
Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage personal access tokens](manuals/security/access-tokens.md). Users who already used a PAT before SSO enforcement can continue using that PAT.
@z

@x
## How does SSO affect automation systems and CI/CD pipelines?
@y
## How does SSO affect automation systems and CI/CD pipelines?
@z

@x
Before enforcing SSO, you must [create personal access tokens](/manuals/security/access-tokens.md) to replace passwords in automation systems and CI/CD pipelines.
@y
Before enforcing SSO, you must [create personal access tokens](manuals/security/access-tokens.md) to replace passwords in automation systems and CI/CD pipelines.
@z

@x
## Can I turn on SSO without enforcing it immediately?
@y
## Can I turn on SSO without enforcing it immediately?
@z

@x
Yes, you can turn on SSO without enforcement. Users can choose between Docker ID (standard email and password) or domain-verified email address (SSO) at the sign-in screen.
@y
Yes, you can turn on SSO without enforcement. Users can choose between Docker ID (standard email and password) or domain-verified email address (SSO) at the sign-in screen.
@z

@x
## SSO is enforced, but a user can sign in using a username and password. Why is this happening?
@y
## SSO is enforced, but a user can sign in using a username and password. Why is this happening?
@z

@x
Guest users who aren't part of your registered domain but have been invited to your organization don't sign in through your SSO identity provider. SSO enforcement only applies to users who belong to your verified domain.
@y
Guest users who aren't part of your registered domain but have been invited to your organization don't sign in through your SSO identity provider. SSO enforcement only applies to users who belong to your verified domain.
@z

@x
## Can I test SSO functionality before going to production?
@y
## Can I test SSO functionality before going to production?
@z

@x
Yes, you can create a test organization with a 5-seat Business subscription. When testing, turn on SSO but don't enforce it, or all domain email users will be forced to sign in to the test environment.
@y
Yes, you can create a test organization with a 5-seat Business subscription. When testing, turn on SSO but don't enforce it, or all domain email users will be forced to sign in to the test environment.
@z

@x
## What is enforcing SSO versus enforcing sign-in?
@y
## What is enforcing SSO versus enforcing sign-in?
@z

@x
These are separate features you can use independently or together:
@y
These are separate features you can use independently or together:
@z

@x
- Enforcing SSO ensures users sign in using SSO credentials instead of their Docker ID, enabling better credential management.
- Enforcing sign-in to Docker Desktop ensures users always sign in to accounts that are members of your organization, so security settings and subscription benefits are always applied.
@y
- Enforcing SSO ensures users sign in using SSO credentials instead of their Docker ID, enabling better credential management.
- Enforcing sign-in to Docker Desktop ensures users always sign in to accounts that are members of your organization, so security settings and subscription benefits are always applied.
@z

@x
For more details, see [Enforce sign-in for Desktop](/manuals/enterprise/security/enforce-sign-in/_index.md#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@y
For more details, see [Enforce sign-in for Desktop](manuals/enterprise/security/enforce-sign-in/_index.md#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@z
