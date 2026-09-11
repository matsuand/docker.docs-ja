%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Account FAQs
linkTitle: Accounts
@y
title: Account FAQs
linkTitle: Accounts
@z

@x
description: FAQs about Docker IDs, account creation, organizations, companies, seats, and members
keywords:
  docker ID, docker account FAQ, change docker ID, username taken, trademark,
  organization name, organization namespace, create account, Google, GitHub,
  deactivate docker ID, organizations, members, seats, company, company owners
@y
description: FAQs about Docker IDs, account creation, organizations, companies, seats, and members
keywords:
  docker ID, docker account FAQ, change docker ID, username taken, trademark,
  organization name, organization namespace, create account, Google, GitHub,
  deactivate docker ID, organizations, members, seats, company, company owners
@z

@x
## Individual accounts
@y
## Individual accounts
@z

@x
### What is a Docker ID?
@y
### What is a Docker ID?
@z

@x
A Docker ID is a username for your Docker account that lets you access Docker
products. To create a Docker ID you need one of the following:
@y
A Docker ID is a username for your Docker account that lets you access Docker
products. To create a Docker ID you need one of the following:
@z

@x
- An email address
- A Google account
- A GitHub account
@y
- An email address
- A Google account
- A GitHub account
@z

@x
Your Docker ID must be between 4 and 30 characters long, and can only contain
numbers and lowercase letters. You can't use any special characters or spaces.
@y
Your Docker ID must be between 4 and 30 characters long, and can only contain
numbers and lowercase letters. You can't use any special characters or spaces.
@z

@x
For more information, see
[Create a Docker account](/manuals/accounts/individual/create-account.md).
@y
For more information, see
[Create a Docker account](manuals/accounts/individual/create-account.md).
@z

@x
### Can I change my Docker ID?
@y
### Can I change my Docker ID?
@z

@x
No. You can't change your Docker ID once it's created. If you need a different
Docker ID, you must create a new Docker account with a new Docker ID.
@y
No. You can't change your Docker ID once it's created. If you need a different
Docker ID, you must create a new Docker account with a new Docker ID.
@z

@x
Docker IDs can't be reused after deactivation.
@y
Docker IDs can't be reused after deactivation.
@z

@x
### What if my Docker ID is taken?
@y
### What if my Docker ID is taken?
@z

@x
All Docker IDs are first-come, first-served except for companies that have a
U.S. Trademark on a username.
@y
All Docker IDs are first-come, first-served except for companies that have a
U.S. Trademark on a username.
@z

@x
If you have a trademark for your Docker ID,
[Docker Support](https://hub.docker.com/support/contact/) can retrieve the
Docker ID for you.
@y
If you have a trademark for your Docker ID,
[Docker Support](https://hub.docker.com/support/contact/) can retrieve the
Docker ID for you.
@z

@x
## Organizations
@y
## Organizations
@z

@x
### What's an organization name or namespace?
@y
### What's an organization name or namespace?
@z

@x
The organization name, sometimes referred to as the organization namespace or
the organization ID, is the unique identifier of a Docker organization. The
organization name can't be the same as an existing Docker ID.
@y
The organization name, sometimes referred to as the organization namespace or
the organization ID, is the unique identifier of a Docker organization. The
organization name can't be the same as an existing Docker ID.
@z

@x
For more information, see
[Organization accounts](/manuals/accounts/organization/_index.md).
@y
For more information, see
[Organization accounts](manuals/accounts/organization/_index.md).
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
For more information, see [Identify your Docker users and their Docker accounts](/manuals/accounts/organization/setup/onboard.md#step-one-identify-your-docker-users).
@y
For more information, see [Identify your Docker users and their Docker accounts](manuals/accounts/organization/setup/onboard.md#step-one-identify-your-docker-users).
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
- Ensures users receive the benefits of your subscription.
- Ensures security features like [Image Access Management](/manuals/enterprise/security/hardened-desktop/image-access-management.md) and [Registry Access Management](/manuals/enterprise/security/hardened-desktop/registry-access-management.md) are applied.
- Ensures you gain insights into users' activity.
@y
- Ensures users receive the benefits of your subscription.
- Ensures security features like [Image Access Management](manuals/enterprise/security/hardened-desktop/image-access-management.md) and [Registry Access Management](manuals/enterprise/security/hardened-desktop/registry-access-management.md) are applied.
- Ensures you gain insights into users' activity.
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
[Convert an account into an organization](/manuals/accounts/organization/setup/convert-account.md).
@y
For prerequisites and instructions, see
[Convert an account into an organization](manuals/accounts/organization/setup/convert-account.md).
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
To manage invites, see [Manage organization members](/manuals/accounts/organization/manage/members.md).
@y
To manage invites, see [Manage organization members](manuals/accounts/organization/manage/members.md).
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

@x
### Companies
@y
### Companies
@z

@x
#### Can I use a parent company if some of my organizations don’t have a Docker Business subscription?
@y
#### Can I use a parent company if some of my organizations don’t have a Docker Business subscription?
@z

@x
Yes, but you can only add organizations with a Docker Business subscription
to a company. For more details, see [Add more organizations](/manuals/accounts/company/manage.md#add-more-organizations).
@y
Yes, but you can only add organizations with a Docker Business subscription
to a company. For more details, see [Add more organizations](manuals/accounts/company/manage.md#add-more-organizations).
@z

@x
#### What happens if one of my organizations downgrades from Docker Business, but I still need access as a company owner?
@y
#### What happens if one of my organizations downgrades from Docker Business, but I still need access as a company owner?
@z

@x
To access and manage a nested organization, it must have a Docker Business
subscription. If an organization downgrades from Docker Business, its owner must
manage it outside of the company. For more details, see
[Add more organizations](/manuals/accounts/company/manage.md#add-more-organizations).
@y
To access and manage a nested organization, it must have a Docker Business
subscription. If an organization downgrades from Docker Business, its owner must
manage it outside of the company. For more details, see
[Add more organizations](manuals/accounts/company/manage.md#add-more-organizations).
@z

@x
#### Do company owners occupy a subscription seat?
@y
#### Do company owners occupy a subscription seat?
@z

@x
Company owners don't occupy a seat unless one of the following is true:
@y
Company owners don't occupy a seat unless one of the following is true:
@z

@x
- They are added as a member of an organization under your company
- SSO is enabled and the company owner signs in through SSO, which
  automatically adds them as an organization member
@y
- They are added as a member of an organization under your company
- SSO is enabled and the company owner signs in through SSO, which
  automatically adds them as an organization member
@z

@x
When you first create a company, your account is both a company owner and an
organization owner, so it occupies a seat as long as you remain an organization
owner. To free up that seat,
[assign another user as the organization owner](/manuals/accounts/organization/manage/members.md#update-a-member-role)
and remove yourself from the organization. You keep full administrative access
as a company owner without using a subscription seat.
@y
When you first create a company, your account is both a company owner and an
organization owner, so it occupies a seat as long as you remain an organization
owner. To free up that seat,
[assign another user as the organization owner](manuals/accounts/organization/manage/members.md#update-a-member-role)
and remove yourself from the organization. You keep full administrative access
as a company owner without using a subscription seat.
@z

@x
#### What permissions does the company owner have in the associated/nested organizations?
@y
#### What permissions does the company owner have in the associated/nested organizations?
@z

@x
Company owners can navigate to the **Organizations** page to view all their
nested organizations in a single location. They can also view or edit
organization members and change single sign-on (SSO) and System for
Cross-domain Identity Management (SCIM) settings. Changes to company settings
impact all users in each organization under the company.
@y
Company owners can navigate to the **Organizations** page to view all their
nested organizations in a single location. They can also view or edit
organization members and change single sign-on (SSO) and System for
Cross-domain Identity Management (SCIM) settings. Changes to company settings
impact all users in each organization under the company.
@z

@x
For more information, see [Roles and permissions](/manuals/security/roles-and-permissions.md).
@y
For more information, see [Roles and permissions](manuals/security/roles-and-permissions.md).
@z
