%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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
@y
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, organizations, administration, Admin Console, members, organization management, manage orgs
title: FAQs on organizations
@z

@x
### How can I see how many active users are in my organization?
@y
### How can I see how many active users are in my organization?
@z

@x
If your organization uses a Software Asset Management tool, you can use it to
find out how many users have Docker Desktop installed. If your organization
doesn't use this software, you can run an internal survey
to find out who is using Docker Desktop.
@y
If your organization uses a Software Asset Management tool, you can use it to
find out how many users have Docker Desktop installed. If your organization
doesn't use this software, you can run an internal survey
to find out who is using Docker Desktop.
@z

@x
For more information, see [Identify your Docker users and their Docker accounts](../../admin/organization/onboard.md#step-1-identify-your-docker-users-and-their-docker-accounts).
@y
For more information, see [Identify your Docker users and their Docker accounts](../../admin/organization/onboard.md#step-1-identify-your-docker-users-and-their-docker-accounts).
@z

@x
### Do users need to authenticate with Docker before an owner can add them to an organization?
@y
### Do users need to authenticate with Docker before an owner can add them to an organization?
@z

@x
No. Organization owners can invite users with their email addresses, and also
assign them to a team during the invite process.
@y
No. Organization owners can invite users with their email addresses, and also
assign them to a team during the invite process.
@z

@x
### Can I force my organization's members to authenticate before using Docker Desktop and are there any benefits?
@y
### Can I force my organization's members to authenticate before using Docker Desktop and are there any benefits?
@z

@x
Yes. You can
[enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
@y
Yes. You can
[enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md).
@z

@x
Some benefits of enforcing sign-in are:
@y
Some benefits of enforcing sign-in are:
@z

@x
- Administrators can enforce features like [Image Access Management](/manuals/enterprise/security/hardened-desktop/image-access-management.md) and [Registry Access Management](/manuals/enterprise/security/hardened-desktop/registry-access-management.md).
 - Administrators can ensure compliance by blocking Docker Desktop usage for
 users who don't sign in as members of the organization.
@y
- Administrators can enforce features like [Image Access Management](manuals/enterprise/security/hardened-desktop/image-access-management.md) and [Registry Access Management](manuals/enterprise/security/hardened-desktop/registry-access-management.md).
 - Administrators can ensure compliance by blocking Docker Desktop usage for
 users who don't sign in as members of the organization.
@z

@x
### Can I convert my personal Docker ID to an organization account?
@y
### Can I convert my personal Docker ID to an organization account?
@z

@x
Yes. You can convert your user account to an organization account. Once you
convert a user account into an organization, it's not possible to
revert it to a personal user account.
@y
Yes. You can convert your user account to an organization account. Once you
convert a user account into an organization, it's not possible to
revert it to a personal user account.
@z

@x
For prerequisites and instructions, see
[Convert an account into an organization](convert-account.md).
@y
For prerequisites and instructions, see
[Convert an account into an organization](convert-account.md).
@z

@x
### Do organization invitees take up seats?
@y
### Do organization invitees take up seats?
@z

@x
Yes. A user invited to an organization will take up one of the provisioned
seats, even if that user hasn’t accepted their invitation yet.
@y
Yes. A user invited to an organization will take up one of the provisioned
seats, even if that user hasn’t accepted their invitation yet.
@z

@x
To manage invites, see [Manage organization members](/manuals/admin/organization/members.md).
@y
To manage invites, see [Manage organization members](manuals/admin/organization/members.md).
@z

@x
### Do organization owners take a seat?
@y
### Do organization owners take a seat?
@z

@x
Yes. Organization owners occupy a seat.
@y
Yes. Organization owners occupy a seat.
@z

@x
### What is the difference between user, invitee, seat, and member?
@y
### What is the difference between user, invitee, seat, and member?
@z

@x
- User: Docker user with a Docker ID.
- Invitee: A user that an administrator has invited to join an organization but
has not yet accepted their invitation.
- Seats: The number of purchased seats in an organization.
- Member: A user who has received and accepted an invitation to join an
organization. Member can also refer to a member of a team within an
organization.
@y
- User: Docker user with a Docker ID.
- Invitee: A user that an administrator has invited to join an organization but
has not yet accepted their invitation.
- Seats: The number of purchased seats in an organization.
- Member: A user who has received and accepted an invitation to join an
organization. Member can also refer to a member of a team within an
organization.
@z

@x
### If I have two organizations and a user belongs to both organizations, do they take up two seats?
@y
### If I have two organizations and a user belongs to both organizations, do they take up two seats?
@z

@x
Yes. In a scenario where a user belongs to two organizations, they take up one
seat in each organization.
@y
Yes. In a scenario where a user belongs to two organizations, they take up one
seat in each organization.
@z
