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
description: >-
  Change company member roles, remove users, leave a company or
  organization, and export a member CSV in Docker Home.
keywords: company members, change role, remove user, export members CSV,
  leave organization, leave company, Docker Home
@y
description: >-
  Change company member roles, remove users, leave a company or
  organization, and export a member CSV in Docker Home.
keywords: company members, change role, remove user, export members CSV,
  leave organization, leave company, Docker Home
@z

@x
{{< summary-bar feature_name="Company" >}}
@y
{{< summary-bar feature_name="Company" >}}
@z

@x
After creating a company, you manage member roles and membership from
Docker Home. To invite members, add organizations, or manage company
owners, see
[Set up a company](/manuals/accounts/company/new-company.md).
@y
After creating a company, you manage member roles and membership from
Docker Home. To invite members, add organizations, or manage company
owners, see
[Set up a company](manuals/accounts/company/new-company.md).
@z

@x
## Change a user's role
@y
## Change a user's role
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find the user and select the **Actions** menu, then select
   **Change role**. If the user belongs to more than one organization, the
   menu label is **Change roles**.
1. Complete the change in one of these ways:
   - **One organization.** Select a role, then select **Save**.
   - **Several organizations.** Select the **Organization**, select a
     role, then select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find the user and select the **Actions** menu, then select
   **Change role**. If the user belongs to more than one organization, the
   menu label is **Change roles**.
1. Complete the change in one of these ways:
   - **One organization.** Select a role, then select **Save**.
   - **Several organizations.** Select the **Organization**, select a
     role, then select **Save**.
@z

@x
If the user is the only owner of the organization, assign another owner
before you can change that role.
@y
If the user is the only owner of the organization, assign another owner
before you can change that role.
@z

@x
## Remove a user
@y
## Remove a user
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find the user and select the **Actions** menu, then select **Remove**.
1. Complete the removal in one of these ways:
   - **One organization.** Select **Remove**.
   - **Several organizations.** Select the organizations, then select
     **Remove**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find the user and select the **Actions** menu, then select **Remove**.
1. Complete the removal in one of these ways:
   - **One organization.** Select **Remove**.
   - **Several organizations.** Select the organizations, then select
     **Remove**.
@z

@x
If the user is the only owner of an organization, assign another owner
before you can remove them from that organization.
@y
If the user is the only owner of an organization, assign another owner
before you can remove them from that organization.
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
## Leave a company
@y
## Leave a company
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**.
1. Find your account and select the **Actions** menu, then select
   **Leave company**.
1. Select **Leave**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Company owners**.
1. Find your account and select the **Actions** menu, then select
   **Leave company**.
1. Select **Leave**.
@z

@x
If you are the only company owner, add another owner before you can leave.
@y
If you are the only company owner, add another owner before you can leave.
@z

@x
## Leave an organization in the company
@y
## Leave an organization in the company
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find your account and select the **Actions** menu, then select
   **Leave organization**. If you belong to more than one organization, the
   menu label is **Leave organizations**.
1. Select **Leave**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company.
1. Select **Users**.
1. Find your account and select the **Actions** menu, then select
   **Leave organization**. If you belong to more than one organization, the
   menu label is **Leave organizations**.
1. Select **Leave**.
@z

@x
If you are the only owner of an organization, assign another owner before
you can leave it.
@y
If you are the only owner of an organization, assign another owner before
you can leave it.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Set up a company](/manuals/accounts/company/new-company.md) to invite
  members, add owners, or add organizations
- [Manage members on a team](/manuals/accounts/organization/manage/members.md#manage-members-on-a-team)
  to add company members to organization teams
- [Manage seats](/manuals/accounts/organization/manage/manage-seats.md) to
  add or remove subscription seats
- [Roles and permissions](/manuals/security/roles-and-permissions/_index.md)
  for what each role can do
@y
- [Set up a company](manuals/accounts/company/new-company.md) to invite
  members, add owners, or add organizations
- [Manage members on a team](manuals/accounts/organization/manage/members.md#manage-members-on-a-team)
  to add company members to organization teams
- [Manage seats](manuals/accounts/organization/manage/manage-seats.md) to
  add or remove subscription seats
- [Roles and permissions](manuals/security/roles-and-permissions/_index.md)
  for what each role can do
@z
