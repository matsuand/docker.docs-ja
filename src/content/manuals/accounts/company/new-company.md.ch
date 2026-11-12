%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Set up a company
linkTitle: Setup
@y
title: Set up a company
linkTitle: Setup
@z

@x
description: >-
  Set up a Docker company in Docker Home. Create the company, add
  owners, invite members, add organizations, and manage seats.
keywords: company, hub, organization, company owner, Docker Home, company
  management, Docker Business, set up company, create company, invite
  members
@y
description: >-
  Set up a Docker company in Docker Home. Create the company, add
  owners, invite members, add organizations, and manage seats.
keywords: company, hub, organization, company owner, Docker Home, company
  management, Docker Business, set up company, create company, invite
  members
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
When you set up a company in Docker Home, you create the company, then add
owners, invite members, and add more organizations as needed. You must be the
owner of the organization you want to add to your company.
@y
When you set up a company in Docker Home, you create the company, then add
owners, invite members, and add more organizations as needed. You must be the
owner of the organization you want to add to your company.
@z

@x
## Create a company
@y
## Create a company
@z

@x
When you create the company, the organization you selected is automatically
migrated to the new company. The name for your company can't be the same as an existing user, organization, or company namespace.
@y
When you create the company, the organization you selected is automatically
migrated to the new company. The name for your company can't be the same as an existing user, organization, or company namespace.
@z

@x
To create a new company:
@y
To create a new company:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select the
   organization you want to add to your company.
1. Select **Organization settings**.
1. Select **Create a company**.
1. Enter a unique name for your company, then select **Continue**.
1. Review the migration details and then select **Create company**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select the
   organization you want to add to your company.
1. Select **Organization settings**.
1. Select **Create a company**.
1. Enter a unique name for your company, then select **Continue**.
1. Review the migration details and then select **Create company**.
@z

@x
For more information on how you can add more organizations to your company,
see [Add more organizations](#add-more-organizations).
@y
For more information on how you can add more organizations to your company,
see [Add more organizations](#add-more-organizations).
@z

@x
## Company owners
@y
## Company owners
@z

@x
A company can have multiple owners who manage the company and all of its
organizations. A company can have up to 10 owners. For details about the
company owner role and how it affects seats, see
[Company structure](/manuals/accounts/company/_index.md#company-structure).
@y
A company can have multiple owners who manage the company and all of its
organizations. A company can have up to 10 owners. For details about the
company owner role and how it affects seats, see
[Company structure](manuals/accounts/company/_index.md#company-structure).
@z

@x
### Add a company owner
@y
### Add a company owner
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**, then select **Add owner**.
1. Specify the member's Docker ID, then select **Add company owner**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**, then select **Add owner**.
1. Specify the member's Docker ID, then select **Add company owner**.
@z

@x
**Add owner** is
unavailable when the company already has 10 owners.
@y
**Add owner** is
unavailable when the company already has 10 owners.
@z

@x
### Remove a company owner
@y
### Remove a company owner
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**.
1. Find the company owner you want to remove and select the **Actions**
   menu, then select **Remove as company owner**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**.
1. Find the company owner you want to remove and select the **Actions**
   menu, then select **Remove as company owner**.
@z

@x
## Company invitations
@y
## Company invitations
@z

@x
You add a member to your company by inviting them to an organization within
the company. Company owners can invite members to any organization in the
company using a Docker ID, email address, or in bulk with a CSV file of
email addresses.
@y
You add a member to your company by inviting them to an organization within
the company. Company owners can invite members to any organization in the
company using a Docker ID, email address, or in bulk with a CSV file of
email addresses.
@z

@x
Members and invitations belong to individual organizations, not to the
company itself. A pending invitation occupies a seat until the invitee
accepts.
@y
Members and invitations belong to individual organizations, not to the
company itself. A pending invitation occupies a seat until the invitee
accepts.
@z

@x
### Invite members to an organization
@y
### Invite members to an organization
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**, then select **Invite**.
1. Add the invitees in one of these ways:
   - **Emails or usernames.** Select **Emails or usernames**. Enter the
     Docker IDs or email addresses of the invitees. Select an organization
     for each invitee.
   - **CSV upload.** Select **CSV upload**. Upload a CSV file of email
     addresses. Select an organization for the invitees.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**, then select **Invite**.
1. Add the invitees in one of these ways:
   - **Emails or usernames.** Select **Emails or usernames**. Enter the
     Docker IDs or email addresses of the invitees. Select an organization
     for each invitee.
   - **CSV upload.** Select **CSV upload**. Upload a CSV file of email
     addresses. Select an organization for the invitees.
@z

@x
Invitees receive an email with instructions to accept. After they accept,
new members appear on the **Users** page. The table shows how many
organizations each member belongs to.
@y
Invitees receive an email with instructions to accept. After they accept,
new members appear on the **Users** page. The table shows how many
organizations each member belongs to.
@z

@x
### Resend invitations
@y
### Resend invitations
@z

@x
Company owners can resend invitations from the company-level **Users**
page.
@y
Company owners can resend invitations from the company-level **Users**
page.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Resend one invitation, or resend several:
   - **One invitee.** Locate the invitee in the table. Select the
     **Actions** menu, then select **Resend**. Before resending, confirm
     you selected the correct invitee. The resend invitation modal displays
     the date you originally invited the invitee. Select **Invite** to
     confirm.
   - **Several invitees.** Select the checkboxes next to the invitees.
     Select **Resend invites**, then select **Resend** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Resend one invitation, or resend several:
   - **One invitee.** Locate the invitee in the table. Select the
     **Actions** menu, then select **Resend**. Before resending, confirm
     you selected the correct invitee. The resend invitation modal displays
     the date you originally invited the invitee. Select **Invite** to
     confirm.
   - **Several invitees.** Select the checkboxes next to the invitees.
     Select **Resend invites**, then select **Resend** to confirm.
@z

@x
### Cancel an invitation
@y
### Cancel an invitation
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find the invitee and select the **Actions** menu, then select **Remove**.
1. Complete the removal in one of these ways:
   - **One organization.** Select **Remove**.
   - **Several organizations.** Select the organizations, then select
     **Remove**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find the invitee and select the **Actions** menu, then select **Remove**.
1. Complete the removal in one of these ways:
   - **One organization.** Select **Remove**.
   - **Several organizations.** Select the organizations, then select
     **Remove**.
@z

@x
Removing an invitee cancels the pending invitation.
@y
Removing an invitee cancels the pending invitation.
@z

@x
## Add more organizations
@y
## Add more organizations
@z

@x
Company owners can add a Docker Business organization when they are also
an owner of that organization. There's no limit to the number of
organizations you add to a company.
@y
Company owners can add a Docker Business organization when they are also
an owner of that organization. There's no limit to the number of
organizations you add to a company.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
   your company.
1. Select **Managed organizations**.
1. Select **Add organization**, then select an organization from the
   drop-down list.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
   your company.
1. Select **Managed organizations**.
1. Select **Add organization**, then select an organization from the
   drop-down list.
@z

@x
A nested organization must keep its Docker Business subscription to stay
managed by the company. If an organization downgrades from Docker
Business, you can no longer manage it through the company, and its owner
must manage it separately.
@y
A nested organization must keep its Docker Business subscription to stay
managed by the company. If an organization downgrades from Docker
Business, you can no longer manage it through the company, and its owner
must manage it separately.
@z

@x
## Add seats to an organization
@y
## Add seats to an organization
@z

@x
If you have a self-serve subscription that has no pending subscription
changes, you can add seats using Docker Home. For more information about
adding seats, see
[Manage seats](/manuals/accounts/organization/manage/manage-seats.md#add-seats-to-your-subscription).
@y
If you have a self-serve subscription that has no pending subscription
changes, you can add seats using Docker Home. For more information about
adding seats, see
[Manage seats](manuals/accounts/organization/manage/manage-seats.md#add-seats-to-your-subscription).
@z

@x
If you have a sales-assisted subscription, you must contact Docker support
or sales to add seats.
@y
If you have a sales-assisted subscription, you must contact Docker support
or sales to add seats.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Manage company members](./manage.md) to change roles, remove users, or
  export a member CSV
- [Manage organization members](/manuals/accounts/organization/manage/members.md)
  for organization-level invites and teams
- [Company overview](/manuals/accounts/company/_index.md) for company
  structure and owner seats
- [Roles and permissions](/manuals/security/roles-and-permissions/_index.md)
  for what each role can do
@y
- [Manage company members](./manage.md) to change roles, remove users, or
  export a member CSV
- [Manage organization members](manuals/accounts/organization/manage/members.md)
  for organization-level invites and teams
- [Company overview](manuals/accounts/company/_index.md) for company
  structure and owner seats
- [Roles and permissions](manuals/security/roles-and-permissions/_index.md)
  for what each role can do
@z
