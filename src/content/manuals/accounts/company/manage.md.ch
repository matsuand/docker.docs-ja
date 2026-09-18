%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Manage company organizations, owners, and members
linkTitle: Manage
@y
title: Manage company organizations, owners, and members
linkTitle: Manage
@z

@x
description: Manage your Docker company in Docker Home. Add organizations, invite members, manage owners, resend invitations, export a member CSV, and add subscription seats.
keywords: company, manage company, Docker Home, company owners, add organization, invite members, resend invitations, export members CSV, company members, manage seats
@y
description: Manage your Docker company in Docker Home. Add organizations, invite members, manage owners, resend invitations, export a member CSV, and add subscription seats.
keywords: company, manage company, Docker Home, company owners, add organization, invite members, resend invitations, export members CSV, company members, manage seats
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
After creating a company, you can manage multiple organizations from
Docker Home. Company owners can use the company portal to invite members to
specific organizations, view seat availability across organizations, and
add new company owners.
@y
After creating a company, you can manage multiple organizations from
Docker Home. Company owners can use the company portal to invite members to
specific organizations, view seat availability across organizations, and
add new company owners.
@z

@x
## Add more organizations
@y
## Add more organizations
@z

@x
Company owners can add Docker organizations with a Docker Business plan
to their company, so long as they're also the organization owners for
that organization. There's no limit to the number of organizations you
add to a company.
@y
Company owners can add Docker organizations with a Docker Business plan
to their company, so long as they're also the organization owners for
that organization. There's no limit to the number of organizations you
add to a company.
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
1. Select **Company owners**, then select **Add owner**.
1. Specify the member's Docker ID, then select **Add company owner**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**, then select **Add owner**.
1. Specify the member's Docker ID, then select **Add company owner**.
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
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**, then select **Invite**.
@z

@x
{{< tabs >}}
{{< tab name="Email or username" >}}
@y
{{< tabs >}}
{{< tab name="Email or username" >}}
@z

@x
1. Select **Emails or usernames**.
1. Enter the Docker IDs or email addresses of the invitees.
1. Select an organization for each invitee.
@y
1. Select **Emails or usernames**.
1. Enter the Docker IDs or email addresses of the invitees.
1. Select an organization for each invitee.
@z

@x
{{< /tab >}}
{{< tab name="CSV upload" >}}
@y
{{< /tab >}}
{{< tab name="CSV upload" >}}
@z

@x
1. Select **CSV upload**.
1. Upload a CSV file of email addresses.
1. Select an organization for the invitees.
@y
1. Select **CSV upload**.
1. Upload a CSV file of email addresses.
1. Select an organization for the invitees.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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
{{< tabs >}}
{{< tab name="Individual" >}}
@y
{{< tabs >}}
{{< tab name="Individual" >}}
@z

@x
1. Select your company from [Docker Home](https://app.docker.com/).
1. Select **Users**, then locate the invitee from the table.
1. Select the **Actions** menu, then select **Resend**.
   - Before resending, confirm you selected the correct invitee.
   - The resend invitation modal displays the date you originally invited
     the invitee.
1. Select **Invite** to confirm.
@y
1. Select your company from [Docker Home](https://app.docker.com/).
1. Select **Users**, then locate the invitee from the table.
1. Select the **Actions** menu, then select **Resend**.
   - Before resending, confirm you selected the correct invitee.
   - The resend invitation modal displays the date you originally invited
     the invitee.
1. Select **Invite** to confirm.
@z

@x
{{< /tab >}}
{{< tab name="Bulk" >}}
@y
{{< /tab >}}
{{< tab name="Bulk" >}}
@z

@x
1. Select your company from [Docker Home](https://app.docker.com/).
1. Select **Users**.
1. From the table, use the multi-select checkboxes next to the invitees
   you want to resend to.
1. Select **Resend invites**, then select **Resend** to confirm.
@y
1. Select your company from [Docker Home](https://app.docker.com/).
1. Select **Users**.
1. From the table, use the multi-select checkboxes next to the invitees
   you want to resend to.
1. Select **Resend invites**, then select **Resend** to confirm.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Export a member list CSV
@y
## Export a member list CSV
@z

@x
Company owners can export a CSV file of members across organizations in the
company.
@y
Company owners can export a CSV file of members across organizations in the
company.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your company.
1. Select **Users**.
1. Select the **Download** icon. The CSV file downloads in your browser.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your company.
1. Select **Users**.
1. Select the **Download** icon. The CSV file downloads in your browser.
@z

@x
   {{< accordion title="CSV fields" >}}
   - Name: The member's name
   - Username: The member's Docker ID
   - Email: The member's email address
   - Member of Organizations: Organizations the member belongs to within the
     company
   - Invited to Organizations: Organizations where the invitee has a
     pending invitation
   - Account created: The time and date when the account was created
@y
   {{< accordion title="CSV fields" >}}
   - Name: The member's name
   - Username: The member's Docker ID
   - Email: The member's email address
   - Member of Organizations: Organizations the member belongs to within the
     company
   - Invited to Organizations: Organizations where the invitee has a
     pending invitation
   - Account created: The time and date when the account was created
@z

@x
   {{< /accordion >}}
@y
   {{< /accordion >}}
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
## Manage teams
@y
## Manage teams
@z

@x
Teams exist at the organization level, not the company level. After inviting
members to an organization, you can add them to teams within that
organization. For more details, see
[Manage members on a team](/manuals/accounts/organization/manage/members.md#manage-members-on-a-team).
@y
Teams exist at the organization level, not the company level. After inviting
members to an organization, you can add them to teams within that
organization. For more details, see
[Manage members on a team](manuals/accounts/organization/manage/members.md#manage-members-on-a-team).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Company overview](/manuals/accounts/company/_index.md)
- [Manage organization members](/manuals/accounts/organization/manage/members.md)
- [Manage seats](/manuals/accounts/organization/manage/manage-seats.md)
- [Roles and permissions](/manuals/security/roles-and-permissions/_index.md)
@y
- [Company overview](manuals/accounts/company/_index.md)
- [Manage organization members](manuals/accounts/organization/manage/members.md)
- [Manage seats](manuals/accounts/organization/manage/manage-seats.md)
- [Roles and permissions](manuals/security/roles-and-permissions/_index.md)
@z
