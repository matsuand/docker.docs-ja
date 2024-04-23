%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single Sign-on enforcement FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, enforce SSO, SSO enforcement
title: Enforcement
tags: [FAQ]
aliases:
- /single-sign-on/enforcement-faqs/
- /faq/security/single-sign-on/enforcement-faqs/
---
@y
---
description: Single Sign-on enforcement FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, enforce SSO, SSO enforcement
title: Enforcement
tags: [FAQ]
aliases:
- /single-sign-on/enforcement-faqs/
- /faq/security/single-sign-on/enforcement-faqs/
---
@z

@x
### We currently have a Docker Team subscription. How do we enable SSO?
@y
### We currently have a Docker Team subscription. How do we enable SSO?
@z

@x
SSO is available with a Docker Business subscription. To enable SSO, you must first upgrade your subscription to a Docker Business subscription. To learn how to upgrade your existing account, see [Upgrade your subscription](../../../subscription/core-subscription/upgrade.md).
@y
SSO is available with a Docker Business subscription. To enable SSO, you must first upgrade your subscription to a Docker Business subscription. To learn how to upgrade your existing account, see [Upgrade your subscription](../../../subscription/core-subscription/upgrade.md).
@z

@x
### How do service accounts work with SSO?
@y
### How do service accounts work with SSO?
@z

@x
Service accounts work like any other user when SSO is turned on. If the service account is using an email for a domain with SSO turned on, it needs a PAT for CLI and API usage.
@y
Service accounts work like any other user when SSO is turned on. If the service account is using an email for a domain with SSO turned on, it needs a PAT for CLI and API usage.
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
Yes. When SSO is enforced, you can access the Docker CLI through Personal Access Tokens (PATs).  Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage access tokens](../../../security/for-developers/access-tokens.md).
@y
Yes. When SSO is enforced, you can access the Docker CLI through Personal Access Tokens (PATs).  Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage access tokens](../../../security/for-developers/access-tokens.md).
@z

@x
### How does SSO affect our automation systems and CI/CD pipelines?
@y
### How does SSO affect our automation systems and CI/CD pipelines?
@z

@x
Before enforcing SSO, you must create PATs for automation systems and CI/CD pipelines and use the tokens instead of a password.
@y
Before enforcing SSO, you must create PATs for automation systems and CI/CD pipelines and use the tokens instead of a password.
@z

@x
### I have a user working on projects within Docker Desktop but authenticated with personal or no email. After they buy Docker Business licenses, they will implement and enforce SSO through Okta to manage their users. When this user signs on SSO, is their work on DD compromised/impacted with the migration to the new account?
@y
### I have a user working on projects within Docker Desktop but authenticated with personal or no email. After they buy Docker Business licenses, they will implement and enforce SSO through Okta to manage their users. When this user signs on SSO, is their work on DD compromised/impacted with the migration to the new account?
@z

@x
If they already have their organization email on their account, then it will be migrated to SSO.
@y
If they already have their organization email on their account, then it will be migrated to SSO.
@z

@x
### If an organization enables SSO, the owners can control Docker IDs associated with their work email domain. Some of these Docker IDs won't be users of Docker Desktop and therefore don't require a Business subscription. Can the owners choose which Docker IDs they add to their Docker org and get access to Business features? Is there a way to flag which of these Docker IDs are Docker Desktop users?
@y
### If an organization enables SSO, the owners can control Docker IDs associated with their work email domain. Some of these Docker IDs won't be users of Docker Desktop and therefore don't require a Business subscription. Can the owners choose which Docker IDs they add to their Docker org and get access to Business features? Is there a way to flag which of these Docker IDs are Docker Desktop users?
@z

@x
SSO enforcement will apply to any domain email user, and automatically add that user to the Docker Hub org that enables enforcement. The admin could remove users from the org manually, but those users wouldn't be able to authenticate if SSO is enforced.
@y
SSO enforcement will apply to any domain email user, and automatically add that user to the Docker Hub org that enables enforcement. The admin could remove users from the org manually, but those users wouldn't be able to authenticate if SSO is enforced.
@z

@x
### Can I enable SSO and hold off on the enforcement option?
@y
### Can I enable SSO and hold off on the enforcement option?
@z

@x
Yes, you can choose to not enforce, and users have the option to use either Docker ID (standard email/password) or email address (SSO) at the sign-in screen.
@y
Yes, you can choose to not enforce, and users have the option to use either Docker ID (standard email/password) or email address (SSO) at the sign-in screen.
@z

@x
### SSO is enforced, but one of our users is connected to several organizations (and several email addresses) and is able to bypass SSO and sign in through username and password. Why is this happening?
@y
### SSO is enforced, but one of our users is connected to several organizations (and several email addresses) and is able to bypass SSO and sign in through username and password. Why is this happening?
@z

@x
Users can bypass SSO if the email they're using to sign in doesn't match the organization email that's used for SSO enforcement.
@y
Users can bypass SSO if the email they're using to sign in doesn't match the organization email that's used for SSO enforcement.
@z

@x
### Is there a way to test this functionality in a test tenant with Okta before going to production?
@y
### Is there a way to test this functionality in a test tenant with Okta before going to production?
@z

@x
Yes, you can create a test organization. Companies can set up a new 5 seat Business plan on a new organization to test with (making sure to only enable SSO, not enforce it or all domain email users will be forced to sign in to that test tenant).
@y
Yes, you can create a test organization. Companies can set up a new 5 seat Business plan on a new organization to test with (making sure to only enable SSO, not enforce it or all domain email users will be forced to sign in to that test tenant).
@z

@x
### Once we enable SSO for Docker Desktop, what's the impact to the flow for Build systems that use service accounts?
@y
### Once we enable SSO for Docker Desktop, what's the impact to the flow for Build systems that use service accounts?
@z

@x
If you enable SSO, there is no impact for now. We'll continue to support either username/password or personal access token sign-in.
However, if you enforce SSO:
@y
If you enable SSO, there is no impact for now. We'll continue to support either username/password or personal access token sign-in.
However, if you enforce SSO:
@z

@x
* Service Account domain email addresses must be unaliased and enabled in their IdP
* Username/password and personal access token will still work (but only if they exist, which they won't for new accounts)
* Those who know the IdP credentials can sign in as that Service Account through SSO on Hub and create or change the personal access token for that service account.
@y
* Service Account domain email addresses must be unaliased and enabled in their IdP
* Username/password and personal access token will still work (but only if they exist, which they won't for new accounts)
* Those who know the IdP credentials can sign in as that Service Account through SSO on Hub and create or change the personal access token for that service account.
@z

@x
### Is enforcing Single Sign-On the same as enforcing sign-in to Docker Desktop?
@y
### Is enforcing Single Sign-On the same as enforcing sign-in to Docker Desktop?
@z

@x
No. They are different features that you can use separately or together.
@y
No. They are different features that you can use separately or together.
@z

@x
Enforcing SSO ensures that users sign in using their SSO credentials instead of their Docker ID. One of the benefits is that SSO enables you to better manage user credentials.
@y
Enforcing SSO ensures that users sign in using their SSO credentials instead of their Docker ID. One of the benefits is that SSO enables you to better manage user credentials.
@z

@x
Enforcing sign-in to Docker Desktop ensures that users always sign in to an
account that's a member of your organization. The benefits are that your organization's security settings are always applied to the user's session and your users always receive the benefits of your subscription. For more details, see [Enforce sign-in for Desktop](../../../security/for-admins/configure-sign-in.md).
@y
Enforcing sign-in to Docker Desktop ensures that users always sign in to an
account that's a member of your organization. The benefits are that your organization's security settings are always applied to the user's session and your users always receive the benefits of your subscription. For more details, see [Enforce sign-in for Desktop](../../../security/for-admins/configure-sign-in.md).
@z
