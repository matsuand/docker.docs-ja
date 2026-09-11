%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage your company
linkTitle: Manage
@y
title: Manage your company
linkTitle: Manage
@z

@x
description: Learn how to manage your company, including its organizations, owners, and members, using Docker Home.
keywords: company, manage company, multiple organizations, company owners, company members, Docker Home, add organization, resend invites
@y
description: Learn how to manage your company, including its organizations, owners, and members, using Docker Home.
keywords: company, manage company, multiple organizations, company owners, company members, Docker Home, add organization, resend invites
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
After creating a company, you can manage multiple organizations from Docker
Home. Company owners can use the company portal to invite users to specific
organizations, view seat availability across organizations, and add new
company owners.
@y
After creating a company, you can manage multiple organizations from Docker
Home. Company owners can use the company portal to invite users to specific
organizations, view seat availability across organizations, and add new
company owners.
@z

@x
## Add more organizations
@y
## Add more organizations
@z

@x
Company owners can add Docker organizations with a Docker Business plan to
their company, so long as they're also the organization owners for that
organization. There's no limit to the number of organizations you add to a
company.
@y
Company owners can add Docker organizations with a Docker Business plan to
their company, so long as they're also the organization owners for that
organization. There's no limit to the number of organizations you add to a
company.
@z

@x
> [!IMPORTANT]
>
> Once you add an organization to a company, you can't remove it from the
> company.
@y
> [!IMPORTANT]
>
> Once you add an organization to a company, you can't remove it from the
> company.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
   your company.
1. Select **Managed organizations**.
1. Select **Add organization**, then choose an organization from the dropdown.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
   your company.
1. Select **Managed organizations**.
1. Select **Add organization**, then choose an organization from the dropdown.
@z

@x
A nested organization must keep its Docker Business subscription to stay managed
by the company. If an organization downgrades from Docker Business, you can no
longer manage it through the company, and its owner must manage it separately.
@y
A nested organization must keep its Docker Business subscription to stay managed
by the company. If an organization downgrades from Docker Business, you can no
longer manage it through the company, and its owner must manage it separately.
@z

@x
## Company owners
@y
## Company owners
@z

@x
A company can have multiple owners who manage the company and all of its
organizations. For details about the company owner role and how it affects
seats, see [Company roles](/manuals/accounts/company/_index.md#company-roles).
@y
A company can have multiple owners who manage the company and all of its
organizations. For details about the company owner role and how it affects
seats, see [Company roles](manuals/accounts/company/_index.md#company-roles).
@z

@x
### Add a company owner
@y
### Add a company owner
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**, then choose **Add owner**.
1. Specify the user's Docker ID, then finish by selecting **Add company owner**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**, then choose **Add owner**.
1. Specify the user's Docker ID, then finish by selecting **Add company owner**.
@z

@x
### Remove a company owner
@y
### Remove a company owner
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**.
1. Find the company owner you want to remove and select the **Actions** menu,
   then choose **Remove as company owner**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**.
1. Find the company owner you want to remove and select the **Actions** menu,
   then choose **Remove as company owner**.
@z

@x
## Company invitations
@y
## Company invitations
@z

@x
You add a user to your company by inviting them to an organization within the
company. Company owners can invite members to any organization in the company
using a Docker ID, email address, or in bulk with a CSV file of email addresses.
@y
You add a user to your company by inviting them to an organization within the
company. Company owners can invite members to any organization in the company
using a Docker ID, email address, or in bulk with a CSV file of email addresses.
@z

@x
Members and invitations belong to individual organizations, not to the company
itself. A pending invitation occupies a seat in the organization the user is
invited to.
@y
Members and invitations belong to individual organizations, not to the company
itself. A pending invitation occupies a seat in the organization the user is
invited to.
@z

@x
### Invite members to an organization
@y
### Invite members to an organization
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**, then choose **Invite**.
1. Choose how you want to invite members:
   - To invite individual users, select **Emails or usernames**.
   - To invite groups of users, select **CSV upload**.
1. Add user(s) to an organization by choosing **Select an organization**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**, then choose **Invite**.
1. Choose how you want to invite members:
   - To invite individual users, select **Emails or usernames**.
   - To invite groups of users, select **CSV upload**.
1. Add user(s) to an organization by choosing **Select an organization**.
@z

@x
Users receive invitations in their email with instructions to accept the
invitation. After accepting the invitation, new members appear on the
**Users** page. The table specifies how many organizations they're members of.
@y
Users receive invitations in their email with instructions to accept the
invitation. After accepting the invitation, new members appear on the
**Users** page. The table specifies how many organizations they're members of.
@z

@x
### Resend invitations
@y
### Resend invitations
@z

@x
Company owners can resend invitations from the company-level **Users** page.
To resend individual invitations:
@y
Company owners can resend invitations from the company-level **Users** page.
To resend individual invitations:
@z

@x
1. Select your company from [Docker Home](https://app.docker.com/).
1. Select **Users**, then locate the invitee from the users table.
1. Select the **Actions** menu, then choose **Resend**.
   - Before resending, confirm you are resending the invitation to the correct
     invitee.
   - The resend invitation modal displays the date you originally invited the
     invitee.
1. Choose **Invite** to confirm.
@y
1. Select your company from [Docker Home](https://app.docker.com/).
1. Select **Users**, then locate the invitee from the users table.
1. Select the **Actions** menu, then choose **Resend**.
   - Before resending, confirm you are resending the invitation to the correct
     invitee.
   - The resend invitation modal displays the date you originally invited the
     invitee.
1. Choose **Invite** to confirm.
@z

@x
To bulk resend invitations:
@y
To bulk resend invitations:
@z

@x
1. From the users table, use the multi-select checkboxes next to the invitees
   you want to invite.
1. Select **Resend invites**, then choose **Resend** to confirm.
@y
1. From the users table, use the multi-select checkboxes next to the invitees
   you want to invite.
1. Select **Resend invites**, then choose **Resend** to confirm.
@z

@x
## Add seats to an organization
@y
## Add seats to an organization
@z

@x
If you have a self-serve subscription that has no pending subscription changes,
you can add seats using Docker Home. For more information about adding seats,
see [Manage seats](/manuals/accounts/organization/manage/manage-seats.md#add-seats-to-your-subscription).
@y
If you have a self-serve subscription that has no pending subscription changes,
you can add seats using Docker Home. For more information about adding seats,
see [Manage seats](manuals/accounts/organization/manage/manage-seats.md#add-seats-to-your-subscription).
@z

@x
If you have a sales-assisted subscription, you must contact Docker support or
sales to add seats.
@y
If you have a sales-assisted subscription, you must contact Docker support or
sales to add seats.
@z

@x
## Manage teams
@y
## Manage teams
@z

@x
Teams exist at the organization level, not the company level. After inviting
members to an organization, you can add them to teams within that organization.
For more details, see
[Manage members on a team](/manuals/accounts/organization/manage/members.md#manage-members-on-a-team).
@y
Teams exist at the organization level, not the company level. After inviting
members to an organization, you can add them to teams within that organization.
For more details, see
[Manage members on a team](manuals/accounts/organization/manage/members.md#manage-members-on-a-team).
@z
