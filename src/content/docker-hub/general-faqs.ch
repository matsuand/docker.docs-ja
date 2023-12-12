%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: General FAQs for Docker Hub
description: Frequently asked administration questions
keywords: onboarding, docker, teams, orgs
redirect:
- /docker-hub/onboarding-faqs/
---
@y
---
title: General FAQs for Docker Hub
description: Frequently asked administration questions
keywords: onboarding, docker, teams, orgs
redirect:
- /docker-hub/onboarding-faqs/
---
@z

@x
### What is a Docker ID?
@y
### What is a Docker ID?
@z

@x
A Docker ID is a username for your Docker account that lets you access Docker products. All you need is an email address to create a Docker ID, or you can sign up with your Google or GitHub account. Your Docker ID must be between 4 and 30 characters long, and can only contain
numbers and lowercase letters. You cannot use any special characters or spaces.
@y
A Docker ID is a username for your Docker account that lets you access Docker products. All you need is an email address to create a Docker ID, or you can sign up with your Google or GitHub account. Your Docker ID must be between 4 and 30 characters long, and can only contain
numbers and lowercase letters. You cannot use any special characters or spaces.
@z

@x
For more information, see [Docker ID](../docker-id/index.md). If your admin enforces [Single sign-on (SSO)](../security/for-admins/single-sign-on/index.md), a Docker ID is provisioned for new users.
@y
For more information, see [Docker ID](../docker-id/index.md). If your admin enforces [Single sign-on (SSO)](../security/for-admins/single-sign-on/index.md), a Docker ID is provisioned for new users.
@z

@x
Developers may have multiple Docker IDs in order to separate their Docker IDs that are associated with an organization in Docker Business or Team, and their personal use Docker IDs.
@y
Developers may have multiple Docker IDs in order to separate their Docker IDs that are associated with an organization in Docker Business or Team, and their personal use Docker IDs.
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
Docker users become members of an organization when they're associated with the organization by an organization owner. An organization owner is someone assigned the owner role. They
can create new teams and add members to an existing team using their Docker ID
or email address and by selecting a team the user should be part of. An
organization owner can also add additional organization owners to help them
manage users, teams, and repositories in the organization. See [Create your organization](orgs.md).
@y
Docker users become members of an organization when they're associated with the organization by an organization owner. An organization owner is someone assigned the owner role. They
can create new teams and add members to an existing team using their Docker ID
or email address and by selecting a team the user should be part of. An
organization owner can also add additional organization owners to help them
manage users, teams, and repositories in the organization. See [Create your organization](orgs.md).
@z

@x
### What's an organization name or namespace?
@y
### What's an organization name or namespace?
@z

@x
The organization name, sometimes referred to as the organization namespace or the org ID, is the unique identifier of a Docker organization. The organization name cannot be the same as an existing Docker ID.
@y
The organization name, sometimes referred to as the organization namespace or the org ID, is the unique identifier of a Docker organization. The organization name cannot be the same as an existing Docker ID.
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
A **Team** is a group of Docker users that belong to an organization. An organization can have multiple teams. An organization owner can then create new teams and add members to an existing team using Docker IDs or email address and by selecting a team the user should be part of. See [Create and manage a team](manage-a-team.md).
@y
A **Team** is a group of Docker users that belong to an organization. An organization can have multiple teams. An organization owner can then create new teams and add members to an existing team using Docker IDs or email address and by selecting a team the user should be part of. See [Create and manage a team](manage-a-team.md).
@z

@x
### What's a company?
@y
### What's a company?
@z

@x
A **Company** is a management layer that centralizes administration of multiple organizations. Administrators can add organizations with a Docker Business subscription to a company and configure settings for all organizations under the company. See [Set up your company](creating-companies.md).
@y
A **Company** is a management layer that centralizes administration of multiple organizations. Administrators can add organizations with a Docker Business subscription to a company and configure settings for all organizations under the company. See [Set up your company](creating-companies.md).
@z

@x
### Who is an organization owner?
@y
### Who is an organization owner?
@z

@x
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and organization settings.
An organization owner can also specify [permissions](manage-a-team.md#configure-repository-permissions-for-a-team) for each team in the
organization. Only an organization owner can enable SSO for the organization.
When SSO is enabled for your organization, the organization owner can also
manage users.
@y
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and organization settings.
An organization owner can also specify [permissions](manage-a-team.md#configure-repository-permissions-for-a-team) for each team in the
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
information, see [Configure SSO](../security/for-admins/single-sign-on/configure/_index.md) and [SSO FAQs](../faq/security/single-sign-on/faqs.md).
@y
Docker SSO allows only one IdP configuration per organization. For more
information, see [Configure SSO](../security/for-admins/single-sign-on/configure/_index.md) and [SSO FAQs](../faq/security/single-sign-on/faqs.md).
@z

@x
### What is a service account?
@y
### What is a service account?
@z

@x
A [service account](../docker-hub/service-accounts.md) is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in the Team or Business plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@y
A [service account](../docker-hub/service-accounts.md) is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in the Team or Business plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@z

@x
### Can I delete or deactivate a Docker account for another user?
@y
### Can I delete or deactivate a Docker account for another user?
@z

@x
Only someone with access to the Docker account can deactivate the account. For more details, see [Deactivating an account](../docker-hub/deactivate-account.md/).
@y
Only someone with access to the Docker account can deactivate the account. For more details, see [Deactivating an account](../docker-hub/deactivate-account.md/).
@z

@x
If the user is a member of your organization, you can remove the user from your organization. For more details, see [Remove a member or invitee](/docker-hub/members/#remove-a-member-or-invitee).
@y
If the user is a member of your organization, you can remove the user from your organization. For more details, see [Remove a member or invitee](/docker-hub/members/#remove-a-member-or-invitee).
@z
