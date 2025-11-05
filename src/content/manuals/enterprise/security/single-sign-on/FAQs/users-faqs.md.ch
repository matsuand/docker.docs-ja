%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: SSO user management FAQs
linkTitle: User management
description: Frequently asked questions about managing users with Docker single sign-ons
keywords: SSO user management, user provisioning, SCIM, just-in-time provisioning, organization members
@y
title: SSO user management FAQs
linkTitle: User management
description: Frequently asked questions about managing users with Docker single sign-ons
keywords: SSO user management, user provisioning, SCIM, just-in-time provisioning, organization members
@z

@x
## Do I need to manually add users to my organization?
@y
## Do I need to manually add users to my organization?
@z

@x
No, you don't need to manually add users to your organization. Just ensure user accounts exist in your IdP. When users sign in to Docker with their domain email address, they're automatically added to the organization after successful authentication.
@y
No, you don't need to manually add users to your organization. Just ensure user accounts exist in your IdP. When users sign in to Docker with their domain email address, they're automatically added to the organization after successful authentication.
@z

@x
## Can users use different email addresses to authenticate through SSO?
@y
## Can users use different email addresses to authenticate through SSO?
@z

@x
All users must authenticate using the email domain specified during SSO setup. Users with email addresses that don't match the verified domain can sign in as guests with username and password if SSO isn't enforced, but only if they've been invited.
@y
All users must authenticate using the email domain specified during SSO setup. Users with email addresses that don't match the verified domain can sign in as guests with username and password if SSO isn't enforced, but only if they've been invited.
@z

@x
## How will users know they're being added to a Docker organization?
@y
## How will users know they're being added to a Docker organization?
@z

@x
When SSO is turned on, users are prompted to authenticate through SSO the next time they sign in to Docker Hub or Docker Desktop. The system detects their domain email and prompts them to sign in with SSO credentials instead.
@y
When SSO is turned on, users are prompted to authenticate through SSO the next time they sign in to Docker Hub or Docker Desktop. The system detects their domain email and prompts them to sign in with SSO credentials instead.
@z

@x
For CLI access, users must authenticate using personal access tokens.
@y
For CLI access, users must authenticate using personal access tokens.
@z

@x
## Can I convert existing users from non-SSO to SSO accounts?
@y
## Can I convert existing users from non-SSO to SSO accounts?
@z

@x
Yes, you can convert existing users to SSO accounts. Ensure users have:
@y
Yes, you can convert existing users to SSO accounts. Ensure users have:
@z

@x
- Company domain email addresses and accounts in your IdP
- Docker Desktop version 4.4.2 or later
- Personal access tokens created to replace passwords for CLI access
- CI/CD pipelines updated to use PATs instead of passwords
@y
- Company domain email addresses and accounts in your IdP
- Docker Desktop version 4.4.2 or later
- Personal access tokens created to replace passwords for CLI access
- CI/CD pipelines updated to use PATs instead of passwords
@z

@x
For detailed instructions, see [Configure single sign-on](/manuals/enterprise/security/single-sign-on/configure.md).
@y
For detailed instructions, see [Configure single sign-on](manuals/enterprise/security/single-sign-on/configure.md).
@z

@x
## Is Docker SSO fully synced with the IdP?
@y
## Is Docker SSO fully synced with the IdP?
@z

@x
Docker SSO provides Just-in-Time (JIT) provisioning by default. Users are provisioned when they authenticate with SSO. If users leave the organization, administrators must manually [remove the user](/manuals/admin/organization/members.md#remove-a-member-or-invitee) from the organization.
@y
Docker SSO provides Just-in-Time (JIT) provisioning by default. Users are provisioned when they authenticate with SSO. If users leave the organization, administrators must manually [remove the user](manuals/admin/organization/members.md#remove-a-member-or-invitee) from the organization.
@z

@x
[SCIM](/manuals/enterprise/security/provisioning/scim.md) provides full synchronization with users and groups. When using SCIM, the recommended configuration is to turn off JIT so all auto-provisioning is handled by SCIM.
@y
[SCIM](manuals/enterprise/security/provisioning/scim.md) provides full synchronization with users and groups. When using SCIM, the recommended configuration is to turn off JIT so all auto-provisioning is handled by SCIM.
@z

@x
Additionally, you can use the [Docker Hub API](/reference/api/hub/latest/) to complete this process.
@y
Additionally, you can use the [Docker Hub API](__SUBDIR__/reference/api/hub/latest/) to complete this process.
@z

@x
## How does turning off Just-in-Time provisioning affect user sign-in?
@y
## How does turning off Just-in-Time provisioning affect user sign-in?
@z

@x
When JIT is turned off (available with SCIM in the Admin Console), users must be organization members or have pending invitations to access Docker. Users who don't meet these criteria get an "Access denied" error and need administrator invitations.
@y
When JIT is turned off (available with SCIM in the Admin Console), users must be organization members or have pending invitations to access Docker. Users who don't meet these criteria get an "Access denied" error and need administrator invitations.
@z

@x
See [SSO authentication with JIT provisioning disabled](/manuals/enterprise/security/provisioning/just-in-time.md#sso-authentication-with-jit-provisioning-disabled).
@y
See [SSO authentication with JIT provisioning disabled](manuals/enterprise/security/provisioning/just-in-time.md#sso-authentication-with-jit-provisioning-disabled).
@z

@x
## Can someone join an organization without an invitation?
@y
## Can someone join an organization without an invitation?
@z

@x
Not without SSO. Joining requires an invite from an organization owner. When SSO is enforced, users with verified domain emails can automatically join the organization when they sign in.
@y
Not without SSO. Joining requires an invite from an organization owner. When SSO is enforced, users with verified domain emails can automatically join the organization when they sign in.
@z

@x
## What happens to existing licensed users when SCIM is turned on?
@y
## What happens to existing licensed users when SCIM is turned on?
@z

@x
Turning on SCIM doesn't immediately remove or modify existing licensed users. They retain current access and roles, but you'll manage them through your IdP after SCIM is active. If SCIM is later turned off, previously SCIM-managed users remain in Docker but are no longer automatically updated based on your IdP.
@y
Turning on SCIM doesn't immediately remove or modify existing licensed users. They retain current access and roles, but you'll manage them through your IdP after SCIM is active. If SCIM is later turned off, previously SCIM-managed users remain in Docker but are no longer automatically updated based on your IdP.
@z

@x
## Is user information visible in Docker Hub?
@y
## Is user information visible in Docker Hub?
@z

@x
All Docker accounts have public profiles associated with their namespace. If you don't want user information (like full names) to be visible, remove those attributes from your SSO and SCIM mappings, or use different identifiers to replace users' full names.
@y
All Docker accounts have public profiles associated with their namespace. If you don't want user information (like full names) to be visible, remove those attributes from your SSO and SCIM mappings, or use different identifiers to replace users' full names.
@z
