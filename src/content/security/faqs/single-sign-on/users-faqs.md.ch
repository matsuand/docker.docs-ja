%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Single Sign-on user management FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on
title: Manage users
@y
description: Single Sign-on user management FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on
title: Manage users
@z

@x
### How do I manage users when using SSO?
@y
### How do I manage users when using SSO?
@z

@x
You can manage users through organizations in Docker Hub. When you configure SSO in Docker, you need to make sure an account exists for each user in your IdP account. When a user signs in to Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@y
You can manage users through organizations in Docker Hub. When you configure SSO in Docker, you need to make sure an account exists for each user in your IdP account. When a user signs in to Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@z

@x
### Do I need to manually add users to my organization?
@y
### Do I need to manually add users to my organization?
@z

@x
No, you don’t need to manually add users to your organization in Docker Hub. You just need to make sure an account for your users exists in your IdP. When users sign in to Docker Hub, they're automatically assigned to the organization using their domain email address.
@y
No, you don’t need to manually add users to your organization in Docker Hub. You just need to make sure an account for your users exists in your IdP. When users sign in to Docker Hub, they're automatically assigned to the organization using their domain email address.
@z

@x
When a user signs in to Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@y
When a user signs in to Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@z

@x
### Can users in my organization use different email addresses to authenticate through SSO?
@y
### Can users in my organization use different email addresses to authenticate through SSO?
@z

@x
During the SSO setup, you’ll have to specify the company email domains that are allowed to authenticate. All users in your organization must authenticate using the email domain specified during SSO setup. Some of your users may want to maintain a different account for their personal projects.
@y
During the SSO setup, you’ll have to specify the company email domains that are allowed to authenticate. All users in your organization must authenticate using the email domain specified during SSO setup. Some of your users may want to maintain a different account for their personal projects.
@z

@x
Users with a public domain email address will be added as guests.
@y
Users with a public domain email address will be added as guests.
@z

@x
### Can Docker org owners/admins/company owners approve users to an organization and use a seat, rather than having them automatically added when SSO is enabled?
@y
### Can Docker org owners/admins/company owners approve users to an organization and use a seat, rather than having them automatically added when SSO is enabled?
@z

@x
Admins, organization owners, and company owners can approve users by configuring their permissions through their IdP. If the user account is configured in the IdP, the user will be automatically added to the organization in Docker Hub as long as there’s an available seat.
@y
Admins, organization owners, and company owners can approve users by configuring their permissions through their IdP. If the user account is configured in the IdP, the user will be automatically added to the organization in Docker Hub as long as there’s an available seat.
@z

@x
### How will users be made aware that they're being made a part of a Docker organization?
@y
### How will users be made aware that they're being made a part of a Docker organization?
@z

@x
When SSO is enabled, users will be prompted to authenticate through SSO the next time they try to sign in to Docker Hub or Docker Desktop. The system will see the end-user has a domain email associated with the Docker ID they're trying to authenticate with, and prompts them to sign in with SSO email and credentials instead.
@y
When SSO is enabled, users will be prompted to authenticate through SSO the next time they try to sign in to Docker Hub or Docker Desktop. The system will see the end-user has a domain email associated with the Docker ID they're trying to authenticate with, and prompts them to sign in with SSO email and credentials instead.
@z

@x
If users attempt to sign in through the CLI, they must authenticate using a personal access token (PAT).
@y
If users attempt to sign in through the CLI, they must authenticate using a personal access token (PAT).
@z

@x
### Is it possible to force users of Docker Desktop to authenticate, and/or authenticate using their company’s domain?
@y
### Is it possible to force users of Docker Desktop to authenticate, and/or authenticate using their company’s domain?
@z

@x
Yes. Admins can force users to authenticate with Docker Desktop by provisioning a [`registry.json`](../../../security/for-admins/configure-sign-in.md) configuration file. The `registry.json` file will force users to authenticate as a user that's configured in the `allowedOrgs` list in the `registry.json` file.
@y
Yes. Admins can force users to authenticate with Docker Desktop by provisioning a [`registry.json`](../../../security/for-admins/configure-sign-in.md) configuration file. The `registry.json` file will force users to authenticate as a user that's configured in the `allowedOrgs` list in the `registry.json` file.
@z

@x
Once SSO enforcement is set up on their Docker Business organization or company on Hub, when the user is forced to authenticate with Docker Desktop, the SSO enforcement will also force users to authenticate through SSO with their IdP (instead of authenticating using their username and password).
@y
Once SSO enforcement is set up on their Docker Business organization or company on Hub, when the user is forced to authenticate with Docker Desktop, the SSO enforcement will also force users to authenticate through SSO with their IdP (instead of authenticating using their username and password).
@z

@x
Users may still be able to authenticate as a "guest" account using a non-domain email address. However, they can only authenticate as guests if that non-domain email was invited.
@y
Users may still be able to authenticate as a "guest" account using a non-domain email address. However, they can only authenticate as guests if that non-domain email was invited.
@z

@x
### Is it possible to convert existing users from non-SSO to SSO accounts?
@y
### Is it possible to convert existing users from non-SSO to SSO accounts?
@z

@x
Yes, you can convert existing users to an SSO account. To convert users from a non-SSO account:
@y
Yes, you can convert existing users to an SSO account. To convert users from a non-SSO account:
@z

@x
- Ensure your users have a company domain email address and they have an account in your IdP.
- Verify that all users have Docker Desktop version 4.4.2 or later installed on their machines.
- Each user has created a PAT to replace their passwords to allow them to sign in through Docker CLI.
- Confirm that all CI/CD pipelines automation systems have replaced their passwords with PATs.
@y
- Ensure your users have a company domain email address and they have an account in your IdP.
- Verify that all users have Docker Desktop version 4.4.2 or later installed on their machines.
- Each user has created a PAT to replace their passwords to allow them to sign in through Docker CLI.
- Confirm that all CI/CD pipelines automation systems have replaced their passwords with PATs.
@z

@x
For detailed prerequisites and instructions on how to enable SSO, see [Configure Single Sign-on](../../../security/for-admins/configure-sign-in.md).
@y
For detailed prerequisites and instructions on how to enable SSO, see [Configure Single Sign-on](../../../security/for-admins/configure-sign-in.md).
@z

@x
### What impact can users expect once we start onboarding them to SSO accounts?
@y
### What impact can users expect once we start onboarding them to SSO accounts?
@z

@x
When SSO is enabled and enforced, your users just have to sign in using the email address and password.
@y
When SSO is enabled and enforced, your users just have to sign in using the email address and password.
@z

@x
### Is Docker SSO fully synced with the IdP?
@y
### Is Docker SSO fully synced with the IdP?
@z

@x
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning configuration is available in [beta](/release-lifecycle/#beta) when you use the Admin Console. Otherwise, JIT is enabled by default.
{ .experimental }
@y
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning configuration is available in [beta](/release-lifecycle/#beta) when you use the Admin Console. Otherwise, JIT is enabled by default.
{ .experimental }
@z

@x
Docker SSO provides Just-in-Time (JIT) provisioning by default, with an option to disable JIT. Users are provisioned when a user authenticates with SSO. If a user leaves the organization, administrators must sign in to Docker Hub and manually [remove the user](../../../admin/organization/members.md#remove-a-member-or-invitee) from the organization.
@y
Docker SSO provides Just-in-Time (JIT) provisioning by default, with an option to disable JIT. Users are provisioned when a user authenticates with SSO. If a user leaves the organization, administrators must sign in to Docker Hub and manually [remove the user](../../../admin/organization/members.md#remove-a-member-or-invitee) from the organization.
@z

@x
Additionally, you can use the [Docker Hub API](/docker-hub/api/latest/) to complete this process.
@y
Additionally, you can use the [Docker Hub API](__SUBDIR__/docker-hub/api/latest/) to complete this process.
@z

@x
### What's the best way to provision the Docker subscription without SSO?
@y
### What's the best way to provision the Docker subscription without SSO?
@z

@x
Company or organization owners can invite users through Docker Hub UI, by email address (for any user) or by Docker ID (assuming the user has created a user account on Hub already).
@y
Company or organization owners can invite users through Docker Hub UI, by email address (for any user) or by Docker ID (assuming the user has created a user account on Hub already).
@z

@x
### If we add a user manually for the first time, can I register in the dashboard and will the user get an invitation link through email?
@y
### If we add a user manually for the first time, can I register in the dashboard and will the user get an invitation link through email?
@z

@x
Yes, if you add the user via email address to an org, they will receive an email invite. If invited through Docker ID as an existing user instead, they'll be added to the organization automatically. A new invite flow will occur in the near future that will require an email invite (so the user can choose to opt out). If the org later sets up SSO for their domain, the user will automatically be added to the domain SSO org the next time they sign and SSO authentication is required.
@y
Yes, if you add the user via email address to an org, they will receive an email invite. If invited through Docker ID as an existing user instead, they'll be added to the organization automatically. A new invite flow will occur in the near future that will require an email invite (so the user can choose to opt out). If the org later sets up SSO for their domain, the user will automatically be added to the domain SSO org the next time they sign and SSO authentication is required.
@z

@x
### Can someone join an organization without an invitation? Is it possible to add specific users to an organization with existing email accounts?
@y
### Can someone join an organization without an invitation? Is it possible to add specific users to an organization with existing email accounts?
@z

@x
Not without SSO. Joining requires an invite from an organization owner. When SSO is enforced, then the domains verified through SSO will let users automatically join the organization the next time they sign in as a user that has a domain email assigned.
@y
Not without SSO. Joining requires an invite from an organization owner. When SSO is enforced, then the domains verified through SSO will let users automatically join the organization the next time they sign in as a user that has a domain email assigned.
@z

@x
### When we send an invitation to the user, will the existing account be consolidated and retained?
@y
### When we send an invitation to the user, will the existing account be consolidated and retained?
@z

@x
Yes, the existing user account will join the organization with all assets retained.
@y
Yes, the existing user account will join the organization with all assets retained.
@z

@x
### How can I view, update, and remove multiple email addresses for my users?
@y
### How can I view, update, and remove multiple email addresses for my users?
@z

@x
We only support one email per user on the Docker platform.
@y
We only support one email per user on the Docker platform.
@z

@x
### How can I remove invitees to the org who haven't signed in?
@y
### How can I remove invitees to the org who haven't signed in?
@z

@x
You can go to the invitee list in the org view and remove them.
@y
You can go to the invitee list in the org view and remove them.
@z

@x
### Is the flow for service account authentication different from a UI user account?
@y
### Is the flow for service account authentication different from a UI user account?
@z

@x
No, we don't differentiate the two in product.
@y
No, we don't differentiate the two in product.
@z

@x
### Is user information visible in Docker Hub?
@y
### Is user information visible in Docker Hub?
@z

@x
All Docker accounts have a public profile associated with their namespace. If you don't want user information (for example, full name) to be visible, you can remove those attributes from your SSO and SCIM mappings. Alternatively, you can use a different identifier to replace a user's full name.
@y
All Docker accounts have a public profile associated with their namespace. If you don't want user information (for example, full name) to be visible, you can remove those attributes from your SSO and SCIM mappings. Alternatively, you can use a different identifier to replace a user's full name.
@z
