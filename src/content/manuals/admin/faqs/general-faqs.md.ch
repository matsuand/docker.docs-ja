%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: General FAQs for Docker accounts
linkTitle: General
@y
title: General FAQs for Docker accounts
linkTitle: General
@z

@x
description: Frequently asked Docker account and administration questions
keywords: onboarding, docker, teams, orgs, user accounts, organization accounts
@y
description: Frequently asked Docker account and administration questions
keywords: onboarding, docker, teams, orgs, user accounts, organization accounts
@z

% skip redirect...
% skip aliases...

@x
### What is a Docker ID?
@y
### What is a Docker ID?
@z

@x
A Docker ID is a username for your Docker account that lets you access Docker products. To create a Docker ID, you need an email address or you can sign up with your social or GitHub accounts. Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. You can't use any special characters or spaces.
@y
A Docker ID is a username for your Docker account that lets you access Docker products. To create a Docker ID, you need an email address or you can sign up with your social or GitHub accounts. Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. You can't use any special characters or spaces.
@z

@x
For more information, see [Docker ID](/accounts/create-account/). If your administrator enforces [single sign-on (SSO)](../../security/for-admins/single-sign-on/_index.md), this provisions a Docker ID for new users.
@y
For more information, see [Docker ID](__SUBDIR__/accounts/create-account/). If your administrator enforces [single sign-on (SSO)](../../security/for-admins/single-sign-on/_index.md), this provisions a Docker ID for new users.
@z

@x
Developers may have multiple Docker IDs in order to separate their Docker IDs associated with an organization with a Docker Business or Team subscription, and their personal use Docker IDs.
@y
Developers may have multiple Docker IDs in order to separate their Docker IDs associated with an organization with a Docker Business or Team subscription, and their personal use Docker IDs.
@z

@x
### What if my Docker ID is taken?
@y
### What if my Docker ID is taken?
@z

@x
All Docker IDs are first-come, first-served except for companies that have a US Trademark on a username. If you have a trademark for your namespace, [Docker Support](https://hub.docker.com/support/contact/) can retrieve the Docker ID for you.
@y
All Docker IDs are first-come, first-served except for companies that have a US Trademark on a username. If you have a trademark for your namespace, [Docker Support](https://hub.docker.com/support/contact/) can retrieve the Docker ID for you.
@z

@x
### What’s an organization?
@y
### What’s an organization?
@z

@x
An organization in Docker is a collection of teams and repositories that are managed together. Docker users become members of an organization once they're associated with that organization by an organization owner. An [organization owner](#who-is-an-organization-owner) is a user with administrative access to the organization. For more information on creating organizations, see [Create your organization](orgs.md).
@y
An organization in Docker is a collection of teams and repositories that are managed together. Docker users become members of an organization once they're associated with that organization by an organization owner. An [organization owner](#who-is-an-organization-owner) is a user with administrative access to the organization. For more information on creating organizations, see [Create your organization](orgs.md).
@z

@x
### What's an organization name or namespace?
@y
### What's an organization name or namespace?
@z

@x
The organization name, sometimes referred to as the organization namespace or the organization ID, is the unique identifier of a Docker organization. The organization name can't be the same as an existing Docker ID.
@y
The organization name, sometimes referred to as the organization namespace or the organization ID, is the unique identifier of a Docker organization. The organization name can't be the same as an existing Docker ID.
@z

@x
### What are roles?
@y
### What are roles?
@z

@x
A role is a collection of permissions granted to members. Roles define access to perform actions in Docker Hub like creating repositories, managing tags, or viewing teams. See [Roles and permissions](roles-and-permissions.md).
@y
A role is a collection of permissions granted to members. Roles define access to perform actions in Docker Hub like creating repositories, managing tags, or viewing teams. See [Roles and permissions](roles-and-permissions.md).
@z

@x
### What’s a team?
@y
### What’s a team?
@z

@x
A team is a group of Docker users that belong to an organization. An organization can have multiple teams. An organization owner can then create new teams and add members to an existing team using Docker IDs or email address and by selecting a team the user should be part of. See [Create and manage a team](manage-a-team.md).
@y
A team is a group of Docker users that belong to an organization. An organization can have multiple teams. An organization owner can then create new teams and add members to an existing team using Docker IDs or email address and by selecting a team the user should be part of. See [Create and manage a team](manage-a-team.md).
@z

@x
### What's a company?
@y
### What's a company?
@z

@x
A company is a management layer that centralizes administration of multiple organizations. Administrators can add organizations with a Docker Business subscription to a company and configure settings for all organizations under the company. See [Set up your company](/admin/company/).
@y
A company is a management layer that centralizes administration of multiple organizations. Administrators can add organizations with a Docker Business subscription to a company and configure settings for all organizations under the company. See [Set up your company](__SUBDIR__/admin/company/).
@z

@x
### Who is an organization owner?
@y
### Who is an organization owner?
@z

@x
An organization owner is an administrator who has permissions to manage
repositories, add members, and manage member roles. They have full access to
private repositories, all teams, billing information, and organization settings.
An organization owner can also specify [repository permissions](manage-a-team.md#configure-repository-permissions-for-a-team) for each team in the
organization. Only an organization owner can enable SSO for the organization.
When SSO is enabled for your organization, the organization owner can also
manage users.
@y
An organization owner is an administrator who has permissions to manage
repositories, add members, and manage member roles. They have full access to
private repositories, all teams, billing information, and organization settings.
An organization owner can also specify [repository permissions](manage-a-team.md#configure-repository-permissions-for-a-team) for each team in the
organization. Only an organization owner can enable SSO for the organization.
When SSO is enabled for your organization, the organization owner can also
manage users.
@z

@x
Docker can auto-provision Docker IDs for new end-users or users who'd like to
have a separate Docker ID for company use through SSO enforcement.
@y
Docker can auto-provision Docker IDs for new end-users or users who'd like to
have a separate Docker ID for company use through SSO enforcement.
@z

@x
The organization owner can also add additional owners to help them manage users, teams, and repositories in the organization.
@y
The organization owner can also add additional owners to help them manage users, teams, and repositories in the organization.
@z

@x
### Can I configure multiple SSO identity providers (IdPs) to authenticate users to a single org?
@y
### Can I configure multiple SSO identity providers (IdPs) to authenticate users to a single org?
@z

@x
Docker SSO allows only one IdP configuration per organization. For more
information, see [Configure SSO](../../security/for-admins/single-sign-on/configure/_index.md) and [SSO FAQs](../../security/faqs/single-sign-on/faqs.md).
@y
Docker SSO allows only one IdP configuration per organization. For more
information, see [Configure SSO](../../security/for-admins/single-sign-on/configure/_index.md) and [SSO FAQs](../../security/faqs/single-sign-on/faqs.md).
@z

@x
### What is a service account?
@y
### What is a service account?
@z

@x
> [!IMPORTANT]
>
> As of December 10, 2024, service accounts are no longer available. Existing Service Account agreements will be honored until their current term expires, but new purchases or renewals of service accounts no longer available and customers must renew under a new subscription plan. It is recommended to transition to Organization Access Tokens (OATs), which can provide similar functionality. For more information, see [Organization access tokens (Beta)](/manuals/security/for-admins/access-tokens.md).
@y
> [!IMPORTANT]
>
> As of December 10, 2024, service accounts are no longer available. Existing Service Account agreements will be honored until their current term expires, but new purchases or renewals of service accounts no longer available and customers must renew under a new subscription plan. It is recommended to transition to Organization Access Tokens (OATs), which can provide similar functionality. For more information, see [Organization access tokens (Beta)](manuals/security/for-admins/access-tokens.md).
@z

@x
A [service account](../../docker-hub/service-accounts.md) is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and don't share Docker IDs with the members in the Team or Business plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@y
A [service account](../../docker-hub/service-accounts.md) is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and don't share Docker IDs with the members in the Team or Business plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@z

@x
### Can I delete or deactivate a Docker account for another user?
@y
### Can I delete or deactivate a Docker account for another user?
@z

@x
Only someone with access to the Docker account can deactivate the account. For more details, see [Deactivating an account](../../admin/organization/deactivate-account.md).
@y
Only someone with access to the Docker account can deactivate the account. For more details, see [Deactivating an account](../../admin/organization/deactivate-account.md).
@z

@x
If the user is a member of your organization, you can remove the user from your organization. For more details, see [Remove a member or invitee](../../admin/organization/members.md#remove-a-member-from-a-team).
@y
If the user is a member of your organization, you can remove the user from your organization. For more details, see [Remove a member or invitee](../../admin/organization/members.md#remove-a-member-from-a-team).
@z

@x
### How do I manage settings for a user account?
@y
### How do I manage settings for a user account?
@z

@x
You can manage your account settings anytime when you sign in to your [Docker account](https://app.docker.com/login). In Docker Home, select your avatar in the top-right navigation, then select **My Account**. You can also access this menu from any Docker web applications when you're signed in to your account. See [Manage your Docker account](/accounts/manage-account). If your account is associated with an organization that uses SSO, you may have limited access to the settings that you can control.
@y
You can manage your account settings anytime when you sign in to your [Docker account](https://app.docker.com/login). In Docker Home, select your avatar in the top-right navigation, then select **My Account**. You can also access this menu from any Docker web applications when you're signed in to your account. See [Manage your Docker account](__SUBDIR__/accounts/manage-account). If your account is associated with an organization that uses SSO, you may have limited access to the settings that you can control.
@z
