%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Single sign-on enforcement FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, enforce SSO, SSO enforcement
title: FAQs on SSO and enforcement
tags: [FAQ]
@y
description: Single sign-on enforcement FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, enforce SSO, SSO enforcement
title: FAQs on SSO and enforcement
tags: [FAQ]
@z

@x
### I currently have a Docker Team subscription. How do I enable SSO?
@y
### I currently have a Docker Team subscription. How do I enable SSO?
@z

@x
SSO is available with a Docker Business subscription. To enable SSO, you must first upgrade your subscription to a Docker Business subscription. To learn how to upgrade your existing account, see [Upgrade your subscription](../../../subscription/change.md).
@y
SSO is available with a Docker Business subscription. To enable SSO, you must first upgrade your subscription to a Docker Business subscription. To learn how to upgrade your existing account, see [Upgrade your subscription](../../../subscription/change.md).
@z

@x
### Is DNS verification required to enable SSO?
@y
### Is DNS verification required to enable SSO?
@z

@x
Yes. You must verify a domain before using it with an SSO connection.
@y
Yes. You must verify a domain before using it with an SSO connection.
@z

@x
### Does Docker SSO support authenticating through the command line?
@y
### Does Docker SSO support authenticating through the command line?
@z

@x
When SSO is enforced, [passwords are prevented from accessing the Docker CLI](/security/security-announcements/#deprecation-of-password-logins-on-cli-when-sso-enforced). You can still access the Docker CLI using a personal access token (PAT) for authentication.
@y
When SSO is enforced, [passwords are prevented from accessing the Docker CLI](__SUBDIR__/security/security-announcements/#deprecation-of-password-logins-on-cli-when-sso-enforced). You can still access the Docker CLI using a personal access token (PAT) for authentication.
@z

@x
Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage access tokens](/security/for-developers/access-tokens/). Users who already used a PAT to sign in before SSO enforcement will still be able to use that PAT to authenticate.
@y
Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage access tokens](__SUBDIR__/security/for-developers/access-tokens/). Users who already used a PAT to sign in before SSO enforcement will still be able to use that PAT to authenticate.
@z

@x
### How does SSO affect automation systems and CI/CD pipelines?
@y
### How does SSO affect automation systems and CI/CD pipelines?
@z

@x
Before enforcing SSO, you must [create PATs](/security/for-developers/access-tokens/). These PATs are used instead of passwords for signing into automation systems and CI/CD pipelines.
@y
Before enforcing SSO, you must [create PATs](__SUBDIR__/security/for-developers/access-tokens/). These PATs are used instead of passwords for signing into automation systems and CI/CD pipelines.
@z

@x
### What can organization users who authenticated with personal emails prior to enforcement expect?
@y
### What can organization users who authenticated with personal emails prior to enforcement expect?
@z

@x
Ensure your users have their organization email on their account, so that the accounts will be migrated to SSO for authentication.
@y
Ensure your users have their organization email on their account, so that the accounts will be migrated to SSO for authentication.
@z

@x
### Can I enable SSO and hold off on the enforcement option?
@y
### Can I enable SSO and hold off on the enforcement option?
@z

@x
Yes, you can choose to not enforce, and users have the option to use either Docker ID (standard email and password) or domain-verified email address (SSO) at the sign-in screen.
@y
Yes, you can choose to not enforce, and users have the option to use either Docker ID (standard email and password) or domain-verified email address (SSO) at the sign-in screen.
@z

@x
### SSO is enforced, but a user can sign in using a username and password. Why is this happening?
@y
### SSO is enforced, but a user can sign in using a username and password. Why is this happening?
@z

@x
Guest users who are not part of your registered domain but have been invited to your organization do not sign in through your SSO Identity Provider. SSO enforcement only requires that users which do belong to your domain, must go through the SSO IdP.
@y
Guest users who are not part of your registered domain but have been invited to your organization do not sign in through your SSO Identity Provider. SSO enforcement only requires that users which do belong to your domain, must go through the SSO IdP.
@z

@x
### Is there a way to test this functionality in a test tenant with Okta before going to production?
@y
### Is there a way to test this functionality in a test tenant with Okta before going to production?
@z

@x
Yes, you can create a test organization. Companies can set up a new 5 seat Business plan on a new organization to test with. To do this, make sure to only enable SSO, not enforce it, or all domain email users will be forced to sign in to that test tenant.
@y
Yes, you can create a test organization. Companies can set up a new 5 seat Business plan on a new organization to test with. To do this, make sure to only enable SSO, not enforce it, or all domain email users will be forced to sign in to that test tenant.
@z

@x
### Is the sign in required tracking at runtime or install time?
@y
### Is the sign in required tracking at runtime or install time?
@z

@x
For Docker Desktop, if it's configured to require authentication to the organization, it tracks at runtime.
@y
For Docker Desktop, if it's configured to require authentication to the organization, it tracks at runtime.
@z

@x
### What is enforcing SSO versus enforcing sign-in?
@y
### What is enforcing SSO versus enforcing sign-in?
@z

@x
Enforcing SSO and enforcing sign-in to Docker Desktop are different features that you can use separately or together.
@y
Enforcing SSO and enforcing sign-in to Docker Desktop are different features that you can use separately or together.
@z

@x
Enforcing SSO ensures that users sign in using their SSO credentials instead of their Docker ID. One of the benefits is that SSO enables you to better manage user credentials.
@y
Enforcing SSO ensures that users sign in using their SSO credentials instead of their Docker ID. One of the benefits is that SSO enables you to better manage user credentials.
@z

@x
Enforcing sign-in to Docker Desktop ensures that users always sign in to an account that's a member of your organization. The benefits are that your organization's security settings are always applied to the user's session and your users always receive the benefits of your subscription. For more details, see [Enforce sign-in for Desktop](../../../security/for-admins/enforce-sign-in/_index.md#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@y
Enforcing sign-in to Docker Desktop ensures that users always sign in to an account that's a member of your organization. The benefits are that your organization's security settings are always applied to the user's session and your users always receive the benefits of your subscription. For more details, see [Enforce sign-in for Desktop](../../../security/for-admins/enforce-sign-in/_index.md#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@z
