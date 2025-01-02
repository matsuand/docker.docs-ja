%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Organization FAQs
linkTitle: Organization
@y
description: Organization FAQs
linkTitle: Organization
@z

@x
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, organizations, administration, Admin Console, members, organization management, manage orgs
title: FAQs on organizations
tags: [FAQ]
@y
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, organizations, administration, Admin Console, members, organization management, manage orgs
title: FAQs on organizations
tags: [FAQ]
@z

@x
### What if the Docker ID I want for my organization or company is taken?
@y
### What if the Docker ID I want for my organization or company is taken?
@z

@x
All Docker IDs are first-come, first-served except for companies that have a U.S. Trademark on a username. If you have a trademark for your namespace, [Docker Support](https://hub.docker.com/support/contact/) can retrieve the Docker ID for you.
@y
All Docker IDs are first-come, first-served except for companies that have a U.S. Trademark on a username. If you have a trademark for your namespace, [Docker Support](https://hub.docker.com/support/contact/) can retrieve the Docker ID for you.
@z

@x
### How do I add an organization owner?
@y
### How do I add an organization owner?
@z

@x
An existing owner can add additional team members as organization owners. You can [invite a member](../../admin/organization/members.md#invite-members) and assign them the owner role in Docker Hub or the Docker Admin Console.
@y
An existing owner can add additional team members as organization owners. You can [invite a member](../../admin/organization/members.md#invite-members) and assign them the owner role in Docker Hub or the Docker Admin Console.
@z

@x
### How do I know how many active users are part of my organization?
@y
### How do I know how many active users are part of my organization?
@z

@x
If your organization uses a Software Asset Management tool, you can use it to find out how many users have Docker Desktop installed. If your organization doesn't use this software, you can run an internal survey to find out who is using Docker Desktop. See [Identify your Docker users and their Docker accounts](../../admin/organization/onboard.md#step-1-identify-your-docker-users-and-their-docker-accounts). With a Docker Business subscription, you can manage members in your identity provider and automatically provision them to your Docker organization with [SSO](../../security/for-admins/single-sign-on/_index.md) or [SCIM](../../security/for-admins/provisioning/scim.md).
@y
If your organization uses a Software Asset Management tool, you can use it to find out how many users have Docker Desktop installed. If your organization doesn't use this software, you can run an internal survey to find out who is using Docker Desktop. See [Identify your Docker users and their Docker accounts](../../admin/organization/onboard.md#step-1-identify-your-docker-users-and-their-docker-accounts). With a Docker Business subscription, you can manage members in your identity provider and automatically provision them to your Docker organization with [SSO](../../security/for-admins/single-sign-on/_index.md) or [SCIM](../../security/for-admins/provisioning/scim.md).
@z

@x
### Do users first need to authenticate with Docker before an owner can add them to an organization?
@y
### Do users first need to authenticate with Docker before an owner can add them to an organization?
@z

@x
No. Organization owners can invite users with their email addresses, and also assign them to a team during the invite process.
@y
No. Organization owners can invite users with their email addresses, and also assign them to a team during the invite process.
@z

@x
### Can I force my organization's members to authenticate before using Docker Desktop and are there any benefits?
@y
### Can I force my organization's members to authenticate before using Docker Desktop and are there any benefits?
@z

@x
Yes. You can [enforce sign-in](../../security/for-admins/enforce-sign-in/_index.md). Some benefits of enforcing sign-in are:
@y
Yes. You can [enforce sign-in](../../security/for-admins/enforce-sign-in/_index.md). Some benefits of enforcing sign-in are:
@z

@x
- Administrators can enforce features like [Image Access Management](/manuals/security/for-admins/hardened-desktop/image-access-management.md) and [Registry Access Management](../../security/for-admins/hardened-desktop/registry-access-management.md).
 - Administrators can ensure compliance by blocking Docker Desktop usage for users who don't sign in as members of the organization.
@y
- Administrators can enforce features like [Image Access Management](manuals/security/for-admins/hardened-desktop/image-access-management.md) and [Registry Access Management](../../security/for-admins/hardened-desktop/registry-access-management.md).
 - Administrators can ensure compliance by blocking Docker Desktop usage for users who don't sign in as members of the organization.
@z

@x
### If a user has their personal email associated with a user account in Docker Hub, do they have to convert to using the organization's domain before they can be invited to join an organization?
@y
### If a user has their personal email associated with a user account in Docker Hub, do they have to convert to using the organization's domain before they can be invited to join an organization?
@z

@x
Yes. When SSO is enabled for your organization, each user must sign in with the company’s domain. However, the user can retain their personal credentials and create a new Docker ID associated with their organization's domain.
@y
Yes. When SSO is enabled for your organization, each user must sign in with the company’s domain. However, the user can retain their personal credentials and create a new Docker ID associated with their organization's domain.
@z

@x
### Can I convert my personal user account (Docker ID) to an organization account?
@y
### Can I convert my personal user account (Docker ID) to an organization account?
@z

@x
Yes. You can convert your user account to an organization account. Once you
convert a user account into an organization, it's not possible to
revert it to a personal user account. For prerequisites and instructions, see
[Convert an account into an organization](convert-account.md).
@y
Yes. You can convert your user account to an organization account. Once you
convert a user account into an organization, it's not possible to
revert it to a personal user account. For prerequisites and instructions, see
[Convert an account into an organization](convert-account.md).
@z

@x
### Our users create Docker Hub accounts through self-service. How do we know when the total number of users for the requested licenses has been met? Is it possible to add more members to the organization than the total number of licenses?
@y
### Our users create Docker Hub accounts through self-service. How do we know when the total number of users for the requested licenses has been met? Is it possible to add more members to the organization than the total number of licenses?
@z

@x
There isn't any automatic notification when the total number of users for the requested licenses has been met. However, if the number of team members exceed the number of licenses, you will receive an error informing you to contact the administrator due to lack of seats. You can [add seats](../../subscription/manage-seats.md) if needed.
@y
There isn't any automatic notification when the total number of users for the requested licenses has been met. However, if the number of team members exceed the number of licenses, you will receive an error informing you to contact the administrator due to lack of seats. You can [add seats](../../subscription/manage-seats.md) if needed.
@z

@x
### How can I merge organization accounts?
@y
### How can I merge organization accounts?
@z

@x
You can downgrade a secondary organization and transition your users and data to a primary organization. See [Merge organizations](../organization/orgs.md#merge-organizations).
@y
You can downgrade a secondary organization and transition your users and data to a primary organization. See [Merge organizations](../organization/orgs.md#merge-organizations).
@z

@x
### Do organization invitees take up seats?
@y
### Do organization invitees take up seats?
@z

@x
Yes. A user invited to an organization will take up one of the provisioned
seats, even if that user hasn’t accepted their invitation yet. Organization
owners can manage the list of invitees through the **Invitees** tab on the organization settings page in Docker Hub, or in the **Members** page in Admin Console.
@y
Yes. A user invited to an organization will take up one of the provisioned
seats, even if that user hasn’t accepted their invitation yet. Organization
owners can manage the list of invitees through the **Invitees** tab on the organization settings page in Docker Hub, or in the **Members** page in Admin Console.
@z

@x
### Do organization owners take a seat?
@y
### Do organization owners take a seat?
@z

@x
Yes. Organization owners will take up a seat.
@y
Yes. Organization owners will take up a seat.
@z

@x
### What is the difference between user, invitee, seat, and member?
@y
### What is the difference between user, invitee, seat, and member?
@z

@x
User refers to a Docker user with a Docker ID.
@y
User refers to a Docker user with a Docker ID.
@z

@x
An invitee is a user that an administrator has invited to join an organization but has not yet accepted their invitation.
@y
An invitee is a user that an administrator has invited to join an organization but has not yet accepted their invitation.
@z

@x
Seats are the number of planned members within an organization.
@y
Seats are the number of planned members within an organization.
@z

@x
Member may refer to a user who has received and accepted an invitation to join an organization. Member can also refer to a member of a team within an organization.
@y
Member may refer to a user who has received and accepted an invitation to join an organization. Member can also refer to a member of a team within an organization.
@z

@x
### If there are two organizations and a user belongs to both organizations, do they take up two seats?
@y
### If there are two organizations and a user belongs to both organizations, do they take up two seats?
@z

@x
Yes. In a scenario where a user belongs to two organizations, they take up one seat in each organization.
@y
Yes. In a scenario where a user belongs to two organizations, they take up one seat in each organization.
@z

@x
### Is it possible to set permissions for repositories within an organization?
@y
### Is it possible to set permissions for repositories within an organization?
@z

@x
Yes. You can configure repository access on a per-team basis. For example, you
can specify that all teams within an organization have **Read and Write** access
to repositories A and B, whereas only specific teams have **Admin** access. Org
owners have full administrative access to all repositories within the
organization. See [Configure repository permissions for a team](manage-a-team.md#configure-repository-permissions-for-a-team). Administrators can also assign members the editor role, which grants administrative permissions for repositories across the namespace of the organization. See [Roles and permissions](../../security/for-admins/roles-and-permissions.md).
@y
Yes. You can configure repository access on a per-team basis. For example, you
can specify that all teams within an organization have **Read and Write** access
to repositories A and B, whereas only specific teams have **Admin** access. Org
owners have full administrative access to all repositories within the
organization. See [Configure repository permissions for a team](manage-a-team.md#configure-repository-permissions-for-a-team). Administrators can also assign members the editor role, which grants administrative permissions for repositories across the namespace of the organization. See [Roles and permissions](../../security/for-admins/roles-and-permissions.md).
@z

@x
### Does my organization need to use Docker's registry?
@y
### Does my organization need to use Docker's registry?
@z

@x
A registry is a hosted service containing repositories of images that responds to the Registry API. Docker Hub is Docker's primary registry, but you can use Docker with other container image registries. You can access the default registry by browsing to [Docker Hub](https://hub.docker.com) or using the `docker search` command.
@y
A registry is a hosted service containing repositories of images that responds to the Registry API. Docker Hub is Docker's primary registry, but you can use Docker with other container image registries. You can access the default registry by browsing to [Docker Hub](https://hub.docker.com) or using the `docker search` command.
@z
