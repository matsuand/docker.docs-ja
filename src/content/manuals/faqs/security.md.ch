%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Frequently asked questions about Docker single sign-on, identity providers, user management, SSO enforcement, and domain verification
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, identity providers, IdP, SAML, Entra ID, user management, SCIM, JIT, administration, security, SSO enforcement, SSO domains, domain verification, DNS, TXT records
title: Security FAQs
linkTitle: Security
@y
description: Frequently asked questions about Docker single sign-on, identity providers, user management, SSO enforcement, and domain verification
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, identity providers, IdP, SAML, Entra ID, user management, SCIM, JIT, administration, security, SSO enforcement, SSO domains, domain verification, DNS, TXT records
title: Security FAQs
linkTitle: Security
@z

@x
## SSO
@y
## SSO
@z

@x
### What SSO flows does Docker support?
@y
### What SSO flows does Docker support?
@z

@x
Docker supports Service Provider Initiated (SP-initiated) SSO flow. Users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@y
Docker supports Service Provider Initiated (SP-initiated) SSO flow. Users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@z

@x
### Does Docker SSO support multi-factor authentication?
@y
### Does Docker SSO support multi-factor authentication?
@z

@x
When an organization uses SSO, multi-factor authentication is controlled at the identity provider level, not on the Docker platform.
@y
When an organization uses SSO, multi-factor authentication is controlled at the identity provider level, not on the Docker platform.
@z

@x
### Can I retain my Docker ID when using SSO?
@y
### Can I retain my Docker ID when using SSO?
@z

@x
Users with personal Docker IDs retain ownership of their repositories, images, and assets. When SSO is enforced, existing accounts with company domain emails are connected to the organization. Users signing in without existing accounts automatically have new accounts and Docker IDs created.
@y
Users with personal Docker IDs retain ownership of their repositories, images, and assets. When SSO is enforced, existing accounts with company domain emails are connected to the organization. Users signing in without existing accounts automatically have new accounts and Docker IDs created.
@z

@x
### Are there any firewall rules required for SSO configuration?
@y
### Are there any firewall rules required for SSO configuration?
@z

@x
No specific firewall rules are required as long as `login.docker.com` is accessible. This domain is commonly accessible by default, but some organizations may need to allow it in their firewall settings if SSO setup encounters issues.
@y
No specific firewall rules are required as long as `login.docker.com` is accessible. This domain is commonly accessible by default, but some organizations may need to allow it in their firewall settings if SSO setup encounters issues.
@z

@x
### Does Docker use my IdP's default session timeout?
@y
### Does Docker use my IdP's default session timeout?
@z

@x
Yes, Docker supports your IdP's session timeout using a custom `dockerSessionMinutes` SAML attribute instead of the standard `SessionNotOnOrAfter` element. See [SSO attributes](/manuals/security/provisioning/_index.md#sso-attributes) for more information.
@y
Yes, Docker supports your IdP's session timeout using a custom `dockerSessionMinutes` SAML attribute instead of the standard `SessionNotOnOrAfter` element. See [SSO attributes](manuals/security/provisioning/_index.md#sso-attributes) for more information.
@z

@x
### Can I use multiple identity providers with Docker SSO?
@y
### Can I use multiple identity providers with Docker SSO?
@z

@x
Yes, Docker supports multiple IdP configurations. A domain can be associated with multiple IdPs. Docker supports Entra ID (formerly Azure AD) and identity providers that support SAML 2.0.
@y
Yes, Docker supports multiple IdP configurations. A domain can be associated with multiple IdPs. Docker supports Entra ID (formerly Azure AD) and identity providers that support SAML 2.0.
@z

@x
### Can I change my identity provider after configuring SSO?
@y
### Can I change my identity provider after configuring SSO?
@z

@x
Yes. Delete your existing IdP configuration in your Docker SSO connection, then [configure SSO using your new IdP](/manuals/security/authentication/single-sign-on/connect.md). If you had already turned on enforcement, turn off enforcement before updating the provider connection.
@y
Yes. Delete your existing IdP configuration in your Docker SSO connection, then [configure SSO using your new IdP](manuals/security/authentication/single-sign-on/connect.md). If you had already turned on enforcement, turn off enforcement before updating the provider connection.
@z

@x
### What information do I need from my identity provider to configure SSO?
@y
### What information do I need from my identity provider to configure SSO?
@z

@x
To turn on SSO in Docker, you need the following from your IdP:
@y
To turn on SSO in Docker, you need the following from your IdP:
@z

@x
- SAML: Entity ID, ACS URL, Single Logout URL, and the public X.509 certificate
- Entra ID (formerly Azure AD): Client ID, Client Secret, AD Domain
@y
- SAML: Entity ID, ACS URL, Single Logout URL, and the public X.509 certificate
- Entra ID (formerly Azure AD): Client ID, Client Secret, AD Domain
@z

@x
### What happens if my existing certificate expires?
@y
### What happens if my existing certificate expires?
@z

@x
Contact your identity provider to retrieve a new X.509 certificate. Update with the new certificate in [SSO configuration settings](/manuals/security/authentication/single-sign-on/manage.md#manage-sso-connections) from Docker Home.
@y
Contact your identity provider to retrieve a new X.509 certificate. Update with the new certificate in [SSO configuration settings](manuals/security/authentication/single-sign-on/manage.md#manage-sso-connections) from Docker Home.
@z

@x
- If your organization enforces SSO, username and password credentials won't work.
- If your organization doesn't enforce SSO, users can sign in with their username and password credentials.
@y
- If your organization enforces SSO, username and password credentials won't work.
- If your organization doesn't enforce SSO, users can sign in with their username and password credentials.
@z

@x
If you need additional help, contact [Docker support](https://app.docker.com/support/contact).
@y
If you need additional help, contact [Docker support](https://app.docker.com/support/contact).
@z

@x
### What happens if my IdP goes down when SSO is turned on?
@y
### What happens if my IdP goes down when SSO is turned on?
@z

@x
If SSO is enforced, users can't access Docker Hub when your IdP is down. Users can still access Docker Hub images from the CLI using personal access tokens.
@y
If SSO is enforced, users can't access Docker Hub when your IdP is down. Users can still access Docker Hub images from the CLI using personal access tokens.
@z

@x
If SSO is turned on but not enforced, users can fall back to username/password authentication.
@y
If SSO is turned on but not enforced, users can fall back to username/password authentication.
@z

@x
### Do bot accounts need seats to access organizations using SSO?
@y
### Do bot accounts need seats to access organizations using SSO?
@z

@x
Yes, bot accounts need seats like regular users, requiring a non-aliased domain email in the IdP and using a seat in Docker Hub. You can add bot accounts to your IdP and create access tokens to replace other credentials.
@y
Yes, bot accounts need seats like regular users, requiring a non-aliased domain email in the IdP and using a seat in Docker Hub. You can add bot accounts to your IdP and create access tokens to replace other credentials.
@z

@x
### How can I troubleshoot an Entra ID SSO connection error?
@y
### How can I troubleshoot an Entra ID SSO connection error?
@z

@x
Confirm that you've configured the necessary API permissions in Entra ID for your SSO connection. You need to grant administrator consent within your Entra ID tenant. See [Entra ID (formerly Azure AD) documentation](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent?pivots=portal#grant-admin-consent-in-app-registrations).
@y
Confirm that you've configured the necessary API permissions in Entra ID for your SSO connection. You need to grant administrator consent within your Entra ID tenant. See [Entra ID (formerly Azure AD) documentation](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent?pivots=portal#grant-admin-consent-in-app-registrations).
@z

@x
## Provisioning
@y
## Provisioning
@z

@x
### Does SAML SSO use Just-in-Time provisioning?
@y
### Does SAML SSO use Just-in-Time provisioning?
@z

@x
Yes. Docker turns on Just-in-Time (JIT) provisioning when you configure an SSO
connection. You can turn off JIT after you configure and test SCIM. See
[Just-in-Time provisioning](/manuals/security/provisioning/just-in-time.md).
@y
Yes. Docker turns on Just-in-Time (JIT) provisioning when you configure an SSO
connection. You can turn off JIT after you configure and test SCIM. See
[Just-in-Time provisioning](manuals/security/provisioning/just-in-time.md).
@z

@x
### Can I use JIT and SCIM together?
@y
### Can I use JIT and SCIM together?
@z

@x
Yes, but Docker recommends using one provisioning source. When both are
enabled, sign-in and SCIM sync can each change a user's full name and team
memberships, so those values can move back and forth. Before you enable both,
review
[how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
@y
Yes, but Docker recommends using one provisioning source. When both are
enabled, sign-in and SCIM sync can each change a user's full name and team
memberships, so those values can move back and forth. Before you enable both,
review
[how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
@z

@x
### How can I give a user immediate access with SCIM?
@y
### How can I give a user immediate access with SCIM?
@z

@x
If your IdP supports Provision on Demand, use it to synchronize the user
before the next scheduled SCIM synchronization. This provides immediate
provisioning without enabling JIT.
@y
If your IdP supports Provision on Demand, use it to synchronize the user
before the next scheduled SCIM synchronization. This provides immediate
provisioning without enabling JIT.
@z

@x
### Do I need to manually add users to my organization?
@y
### Do I need to manually add users to my organization?
@z

@x
Not when JIT, SCIM, or auto-provisioning covers the user. If none of those
methods applies, for example when JIT is turned off and the user isn't
assigned to the Docker application in your IdP, an organization owner must
invite the user.
@y
Not when JIT, SCIM, or auto-provisioning covers the user. If none of those
methods applies, for example when JIT is turned off and the user isn't
assigned to the Docker application in your IdP, an organization owner must
invite the user.
@z

@x
### Can users use different email addresses to authenticate through SSO?
@y
### Can users use different email addresses to authenticate through SSO?
@z

@x
All users must authenticate using the email domain specified during SSO setup.
Users with email addresses that don't match the verified domain can sign in as
guests with username and password if SSO isn't enforced, but only if they've
been invited.
@y
All users must authenticate using the email domain specified during SSO setup.
Users with email addresses that don't match the verified domain can sign in as
guests with username and password if SSO isn't enforced, but only if they've
been invited.
@z

@x
### How will users know they're being added to a Docker organization?
@y
### How will users know they're being added to a Docker organization?
@z

@x
When SSO is turned on, users are prompted to authenticate through SSO the next
time they sign in to Docker Hub or Docker Desktop. The system detects their
domain email and prompts them to sign in with SSO credentials instead.
@y
When SSO is turned on, users are prompted to authenticate through SSO the next
time they sign in to Docker Hub or Docker Desktop. The system detects their
domain email and prompts them to sign in with SSO credentials instead.
@z

@x
For CLI access, users must authenticate using personal access tokens.
@y
For CLI access, users must authenticate using personal access tokens.
@z

@x
### Can I convert existing users from non-SSO to SSO accounts?
@y
### Can I convert existing users from non-SSO to SSO accounts?
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
- CI/CD pipelines updated to use [PATs or OATs](/manuals/security/access-tokens/_index.md) instead of passwords, or an [OIDC connection](/manuals/security/authentication/oidc-connections/_index.md) for GitHub Actions
@y
- Company domain email addresses and accounts in your IdP
- Docker Desktop version 4.4.2 or later
- Personal access tokens created to replace passwords for CLI access
- CI/CD pipelines updated to use [PATs or OATs](manuals/security/access-tokens/_index.md) instead of passwords, or an [OIDC connection](manuals/security/authentication/oidc-connections/_index.md) for GitHub Actions
@z

@x
For detailed instructions, see [Configure single sign-on](/manuals/security/authentication/single-sign-on/connect.md).
@y
For detailed instructions, see [Configure single sign-on](manuals/security/authentication/single-sign-on/connect.md).
@z

@x
### Is Docker SSO fully synced with the IdP?
@y
### Is Docker SSO fully synced with the IdP?
@z

@x
Not with JIT alone. JIT provisions users when they authenticate, but it
doesn't deprovision users who leave your IdP. You must
[remove those users](/manuals/accounts/organization/manage/members.md#remove-a-member-from-the-organization)
manually.
@y
Not with JIT alone. JIT provisions users when they authenticate, but it
doesn't deprovision users who leave your IdP. You must
[remove those users](manuals/accounts/organization/manage/members.md#remove-a-member-from-the-organization)
manually.
@z

@x
[SCIM](/manuals/security/provisioning/scim/_index.md) provides continuous user
and group synchronization, including automatic deprovisioning.
@y
[SCIM](manuals/security/provisioning/scim/_index.md) provides continuous user
and group synchronization, including automatic deprovisioning.
@z

@x
### How does turning off Just-in-Time provisioning affect user sign-in?
@y
### How does turning off Just-in-Time provisioning affect user sign-in?
@z

@x
You can turn off JIT only while SCIM is enabled. With JIT turned off, users
must already be members, have a pending invitation, or be provisioned through
SCIM. Users who don't meet these criteria get an "Access denied" error and
need an administrator to invite them.
@y
You can turn off JIT only while SCIM is enabled. With JIT turned off, users
must already be members, have a pending invitation, or be provisioned through
SCIM. Users who don't meet these criteria get an "Access denied" error and
need an administrator to invite them.
@z

@x
See [SSO authentication with JIT provisioning disabled](/manuals/security/provisioning/just-in-time.md#sso-authentication-with-jit-provisioning-disabled).
@y
See [SSO authentication with JIT provisioning disabled](manuals/security/provisioning/just-in-time.md#sso-authentication-with-jit-provisioning-disabled).
@z

@x
### Can someone join an organization without an invitation?
@y
### Can someone join an organization without an invitation?
@z

@x
Yes. JIT can add users when they sign in through SSO, SCIM can provision users
assigned in the IdP, and auto-provisioning can add existing Docker users whose
email addresses match a verified domain. Without an automatic provisioning
method, an organization owner must invite the user.
@y
Yes. JIT can add users when they sign in through SSO, SCIM can provision users
assigned in the IdP, and auto-provisioning can add existing Docker users whose
email addresses match a verified domain. Without an automatic provisioning
method, an organization owner must invite the user.
@z

@x
### What happens to existing licensed users when SCIM is turned on?
@y
### What happens to existing licensed users when SCIM is turned on?
@z

@x
SCIM can manage and deprovision organization members whose email domain is
verified on the SSO connection, including users created through JIT or added
manually. When your IdP pushes a user with a matching email address, SCIM
links the existing Docker account. Members whose email domain isn't verified
on the connection stay outside SCIM. To use SCIM as the only provisioning
source, see
[Migrate JIT to SCIM](/manuals/security/provisioning/scim/migrate-scim.md).
@y
SCIM can manage and deprovision organization members whose email domain is
verified on the SSO connection, including users created through JIT or added
manually. When your IdP pushes a user with a matching email address, SCIM
links the existing Docker account. Members whose email domain isn't verified
on the connection stay outside SCIM. To use SCIM as the only provisioning
source, see
[Migrate JIT to SCIM](manuals/security/provisioning/scim/migrate-scim.md).
@z

@x
### Is user information visible in Docker Hub?
@y
### Is user information visible in Docker Hub?
@z

@x
All Docker accounts have public profiles associated with their namespace. If
you don't want user information (like full names) to be visible, remove those
attributes from your SSO and SCIM mappings, or use different identifiers to
replace users' full names.
@y
All Docker accounts have public profiles associated with their namespace. If
you don't want user information (like full names) to be visible, remove those
attributes from your SSO and SCIM mappings, or use different identifiers to
replace users' full names.
@z

@x
## Enforcement
@y
## Enforcement
@z

@x
### Does Docker SSO support authenticating through the command line?
@y
### Does Docker SSO support authenticating through the command line?
@z

@x
When SSO is enforced, [passwords are prevented from accessing the Docker CLI](/manuals/security/security-announcements.md#deprecation-of-password-logins-on-cli-when-sso-enforced). Each user must sign in with a [personal access token (PAT)](/manuals/security/access-tokens/personal-access-tokens.md). Users who already used a PAT before SSO enforcement can continue using that PAT.
@y
When SSO is enforced, [passwords are prevented from accessing the Docker CLI](manuals/security/security-announcements.md#deprecation-of-password-logins-on-cli-when-sso-enforced). Each user must sign in with a [personal access token (PAT)](manuals/security/access-tokens/personal-access-tokens.md). Users who already used a PAT before SSO enforcement can continue using that PAT.
@z

@x
For CI/CD and other automation, use an [organization access token (OAT)](/manuals/security/access-tokens/organization-access-tokens.md) or a PAT. For GitHub Actions, you can use an [OIDC connection](/manuals/security/authentication/oidc-connections/_index.md) instead of storing a long-lived token. See [Access tokens](/manuals/security/access-tokens/_index.md).
@y
For CI/CD and other automation, use an [organization access token (OAT)](manuals/security/access-tokens/organization-access-tokens.md) or a PAT. For GitHub Actions, you can use an [OIDC connection](manuals/security/authentication/oidc-connections/_index.md) instead of storing a long-lived token. See [Access tokens](manuals/security/access-tokens/_index.md).
@z

@x
### How does SSO affect automation systems and CI/CD pipelines?
@y
### How does SSO affect automation systems and CI/CD pipelines?
@z

@x
Before enforcing SSO, replace passwords in automation and CI/CD with an access token. Prefer an [organization access token (OAT)](/manuals/security/access-tokens/organization-access-tokens.md) for pipelines owned by the organization. Use a [personal access token (PAT)](/manuals/security/access-tokens/personal-access-tokens.md) when the job should run as a person. For GitHub Actions, you can use an [OIDC connection](/manuals/security/authentication/oidc-connections/_index.md) instead of storing a long-lived token.
@y
Before enforcing SSO, replace passwords in automation and CI/CD with an access token. Prefer an [organization access token (OAT)](manuals/security/access-tokens/organization-access-tokens.md) for pipelines owned by the organization. Use a [personal access token (PAT)](manuals/security/access-tokens/personal-access-tokens.md) when the job should run as a person. For GitHub Actions, you can use an [OIDC connection](manuals/security/authentication/oidc-connections/_index.md) instead of storing a long-lived token.
@z

@x
### Can I turn on SSO without enforcing it immediately?
@y
### Can I turn on SSO without enforcing it immediately?
@z

@x
Yes, you can turn on SSO without enforcement. Users can choose between Docker ID (standard email and password) or domain-verified email address (SSO) at the sign-in screen.
@y
Yes, you can turn on SSO without enforcement. Users can choose between Docker ID (standard email and password) or domain-verified email address (SSO) at the sign-in screen.
@z

@x
### Why can a user sign in with a username and password when SSO is enforced?
@y
### Why can a user sign in with a username and password when SSO is enforced?
@z

@x
Guest users who aren't part of your registered domain but have been invited to your organization don't sign in through your SSO identity provider. SSO enforcement only applies to users who belong to your verified domain.
@y
Guest users who aren't part of your registered domain but have been invited to your organization don't sign in through your SSO identity provider. SSO enforcement only applies to users who belong to your verified domain.
@z

@x
### Can I test SSO functionality before going to production?
@y
### Can I test SSO functionality before going to production?
@z

@x
Yes, you can create a test organization with a 5-seat Business subscription. When testing, turn on SSO but don't enforce it, or all domain email users will be forced to sign in to the test environment.
@y
Yes, you can create a test organization with a 5-seat Business subscription. When testing, turn on SSO but don't enforce it, or all domain email users will be forced to sign in to the test environment.
@z

@x
### What is enforcing SSO versus enforcing sign-in?
@y
### What is enforcing SSO versus enforcing sign-in?
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
For more details, see [Enforce sign-in for Desktop](/manuals/desktop/enterprise/enforce-sign-in/_index.md#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@y
For more details, see [Enforce sign-in for Desktop](manuals/desktop/enterprise/enforce-sign-in/_index.md#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@z

@x
## Domain
@y
## Domain
@z

@x
### Can I add sub-domains?
@y
### Can I add sub-domains?
@z

@x
Yes, you can add sub-domains to your SSO connection. All email addresses must use domains you've added to the connection. Verify that your DNS provider supports multiple TXT records for the same domain.
@y
Yes, you can add sub-domains to your SSO connection. All email addresses must use domains you've added to the connection. Verify that your DNS provider supports multiple TXT records for the same domain.
@z

@x
### Do I need to keep the DNS TXT record permanently?
@y
### Do I need to keep the DNS TXT record permanently?
@z

@x
You can remove the TXT record after one-time verification to add the domain. However, if your organization changes identity providers and needs to set up SSO again, you'll need to verify the domain again.
@y
You can remove the TXT record after one-time verification to add the domain. However, if your organization changes identity providers and needs to set up SSO again, you'll need to verify the domain again.
@z

@x
### Can I verify the same domain for multiple organizations?
@y
### Can I verify the same domain for multiple organizations?
@z

@x
You can't verify the same domain for multiple organizations at the organization level. To verify one domain for multiple organizations, you must have a Docker Business subscription and create a company. Companies allow centralized management of organizations and domain verification at the company level.
@y
You can't verify the same domain for multiple organizations at the organization level. To verify one domain for multiple organizations, you must have a Docker Business subscription and create a company. Companies allow centralized management of organizations and domain verification at the company level.
@z
