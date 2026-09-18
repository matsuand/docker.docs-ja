%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Invite and manage organization members
linkTitle: Members
@y
title: Invite and manage organization members
linkTitle: Members
@z

@x
description: Invite and manage organization members in Docker Home. Assign
  roles, resend or remove invitations, add members to teams, and export a CSV
  member list.
keywords: members, invite members, organization members, Docker Home, Docker
  Hub, export member list, edit roles, manage invitations, CSV invite, bulk
  invite, resend invitation, remove member, accept invitation, teams, pending
  invitations, organization owner, licenses
@y
description: Invite and manage organization members in Docker Home. Assign
  roles, resend or remove invitations, add members to teams, and export a CSV
  member list.
keywords: members, invite members, organization members, Docker Home, Docker
  Hub, export member list, edit roles, manage invitations, CSV invite, bulk
  invite, resend invitation, remove member, accept invitation, teams, pending
  invitations, organization owner, licenses
@z

@x
Learn how to invite and manage members for your organization in Docker Home.
@y
Learn how to invite and manage members for your organization in Docker Home.
@z

@x
## Invite members
@y
## Invite members
@z

@x
Owners can invite new members using a Docker ID, email address, or a CSV file
of email addresses. If an invitee doesn't have a Docker account, they must
create one and verify their email address before they can accept. Pending
invitations occupy a seat.
@y
Owners can invite new members using a Docker ID, email address, or a CSV file
of email addresses. If an invitee doesn't have a Docker account, they must
create one and verify their email address before they can accept. Pending
invitations occupy a seat.
@z

@x
When you invite members, you assign them a role. See
[Roles and permissions][roles-permissions] for details about the access
permissions for each role.
@y
When you invite members, you assign them a role. See
[Roles and permissions][roles-permissions] for details about the access
permissions for each role.
@z

@x
You can also select one or more product licenses for an invitee. Docker
assigns available licenses when they accept. Unlike a seat, licenses aren't
deducted from your organization's available licenses until the invitee
accepts. See [Licenses and invites][licenses-and-invites].
@y
You can also select one or more product licenses for an invitee. Docker
assigns available licenses when they accept. Unlike a seat, licenses aren't
deducted from your organization's available licenses until the invitee
accepts. See [Licenses and invites][licenses-and-invites].
@z

@x
{{< tabs >}}
{{< tab name="Email or username" >}}
@y
{{< tabs >}}
{{< tab name="Email or username" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization from the top-left account drop-down.
1. Select **Members**, then **Invite**.
1. Select **Emails or usernames**.
1. Follow the on-screen instructions to invite members. Invite a maximum of
   1000 members and separate multiple entries by comma, semicolon, or space.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization from the top-left account drop-down.
1. Select **Members**, then **Invite**.
1. Select **Emails or usernames**.
1. Follow the on-screen instructions to invite members. Invite a maximum of
   1000 members and separate multiple entries by comma, semicolon, or space.
@z

@x
{{< /tab >}}
{{< tab name="CSV upload" >}}
@y
{{< /tab >}}
{{< tab name="CSV upload" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization from the top-left account drop-down. Select **Members** >
   **Invite** > **CSV upload**.
1. Optional. Select **Download the template CSV file** to download an example
   CSV file. The following is an example of the contents of a valid CSV file:
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization from the top-left account drop-down. Select **Members** >
   **Invite** > **CSV upload**.
1. Optional. Select **Download the template CSV file** to download an example
   CSV file. The following is an example of the contents of a valid CSV file:
@z

% snip text...

@x
   CSV file requirements:
   - The file must contain a header row with at least one heading named
     `email`. Additional columns are allowed and are ignored in the import.
   - The file must contain a maximum of 1000 email addresses (rows). To invite
     more than 1000 members, create multiple CSV files and complete this
     procedure for each file.
@y
   CSV file requirements:
   - The file must contain a header row with at least one heading named
     `email`. Additional columns are allowed and are ignored in the import.
   - The file must contain a maximum of 1000 email addresses (rows). To invite
     more than 1000 members, create multiple CSV files and complete this
     procedure for each file.
@z

@x
1. Create a new CSV file or export a CSV file from another application.
   - To export a CSV file from another application, see that application's
     documentation.
   - To create a new CSV file, open a new file in a text editor, type `email`
     on the first line, type one email address per line on the following
     lines, then save the file with a `.csv` extension.
@y
1. Create a new CSV file or export a CSV file from another application.
   - To export a CSV file from another application, see that application's
     documentation.
   - To create a new CSV file, open a new file in a text editor, type `email`
     on the first line, type one email address per line on the following
     lines, then save the file with a `.csv` extension.
@z

@x
1. Select **Browse files** and select your CSV file, or drag and drop the CSV
   file into the **Select a CSV file to upload** box. You can select only one
   CSV file at a time.
1. After the CSV file uploads, select **Review** to identify invalid email
   addresses, invitees with a pending invitation, members already in the
   organization, or duplicate email addresses in the same CSV file.
1. Follow the on-screen instructions to invite members.
@y
1. Select **Browse files** and select your CSV file, or drag and drop the CSV
   file into the **Select a CSV file to upload** box. You can select only one
   CSV file at a time.
1. After the CSV file uploads, select **Review** to identify invalid email
   addresses, invitees with a pending invitation, members already in the
   organization, or duplicate email addresses in the same CSV file.
1. Follow the on-screen instructions to invite members.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
You can also bulk invite members with the Docker Hub API. For more
information, see the [Bulk create invites][bulk-invites] API endpoint.
@y
You can also bulk invite members with the Docker Hub API. For more
information, see the [Bulk create invites][bulk-invites] API endpoint.
@z

@x
Pending invitations appear in the Members table. Invitees can accept or
decline from the invitation email or the **Notifications Center**.
@y
Pending invitations appear in the Members table. Invitees can accept or
decline from the invitation email or the **Notifications Center**.
@z

@x
## Accept an invitation
@y
## Accept an invitation
@z

@x
To accept from the invitation email:
@y
To accept from the invitation email:
@z

@x
1. Open the Docker invitation email and select the link to Docker Hub.
1. The Docker account creation page opens. If you already have an account,
   select **Already have an account? Sign in**. If you don't have an account,
   create one using the same email address that received the invitation.
1. Optional. If you created a new account, open your email inbox and verify
   your email address using the Docker verification email.
1. After you sign in to Docker Hub, select **My Hub** from the top-level
   navigation menu.
1. Select **Accept** on your invitation.
@y
1. Open the Docker invitation email and select the link to Docker Hub.
1. The Docker account creation page opens. If you already have an account,
   select **Already have an account? Sign in**. If you don't have an account,
   create one using the same email address that received the invitation.
1. Optional. If you created a new account, open your email inbox and verify
   your email address using the Docker verification email.
1. After you sign in to Docker Hub, select **My Hub** from the top-level
   navigation menu.
1. Select **Accept** on your invitation.
@z

@x
To accept from the **Notifications Center**:
@y
To accept from the **Notifications Center**:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com/) or
   [Docker Home](https://app.docker.com/).
1. Open the **Notifications Center** in the header.
1. Select **Accept** on the invitation.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/) or
   [Docker Home](https://app.docker.com/).
1. Open the **Notifications Center** in the header.
1. Select **Accept** on the invitation.
@z

@x
After you accept the invitation, you are a member of the organization.
@y
After you accept the invitation, you are a member of the organization.
@z

@x
Invitation email links expire after 14 days. If your link has expired, you
can still accept from the **Notifications Center**.
@y
Invitation email links expire after 14 days. If your link has expired, you
can still accept from the **Notifications Center**.
@z

@x
## Manage invitations
@y
## Manage invitations
@z

@x
After inviting members, you can resend or remove invitations. Each invitee
occupies one seat. If the number of email addresses in your CSV file exceeds
the number of available seats, you can't invite more members.
@y
After inviting members, you can resend or remove invitations. Each invitee
occupies one seat. If the number of email addresses in your CSV file exceeds
the number of available seats, you can't invite more members.
@z

@x
> [!TIP]
>
> Need more seats for your organization?
> [Add seats](/manuals/accounts/organization/manage/manage-seats.md) to your
> subscription, or see [Docker pricing][docker-pricing] for plan options.
@y
> [!TIP]
>
> Need more seats for your organization?
> [Add seats](manuals/accounts/organization/manage/manage-seats.md) to your
> subscription, or see [Docker pricing][docker-pricing] for plan options.
@z

@x
### Resend an invitation
@y
### Resend an invitation
@z

@x
You can resend individual or bulk invitations from Docker Home.
@y
You can resend individual or bulk invitations from Docker Home.
@z

@x
To resend an individual invitation:
@y
To resend an individual invitation:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Select the **Actions** menu next to the invitee, then **Resend**.
1. Select **Invite** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Select the **Actions** menu next to the invitee, then **Resend**.
1. Select **Invite** to confirm.
@z

@x
To bulk resend invitations:
@y
To bulk resend invitations:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Use the checkboxes next to **Usernames** to select invitees.
1. Select **Resend invites**.
1. Select **Resend** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Use the checkboxes next to **Usernames** to select invitees.
1. Select **Resend invites**.
1. Select **Resend** to confirm.
@z

@x
### Remove an invitation
@y
### Remove an invitation
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Select the **Actions** menu next to the invitee, then **Remove invitee**.
1. Select **Remove** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Select the **Actions** menu next to the invitee, then **Remove invitee**.
1. Select **Remove** to confirm.
@z

@x
## Manage members on a team
@y
## Manage members on a team
@z

@x
Use Docker Hub or Docker Home to add or remove team members. Organization
owners can add a member to one or more teams within an organization.
@y
Use Docker Hub or Docker Home to add or remove team members. Organization
owners can add a member to one or more teams within an organization.
@z

@x
### Add a member to a team
@y
### Add a member to a team
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Teams**.
1. Select the team name.
1. Select **Add member**. Search for the member by email address or username.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Teams**.
1. Select the team name.
1. Select **Add member**. Search for the member by email address or username.
@z

@x
An invitee must accept the invitation before you can add them to a team.
@y
An invitee must accept the invitation before you can add them to a team.
@z

@x
### Remove members from teams
@y
### Remove members from teams
@z

@x
If your organization uses single sign-on (SSO) with
[SCIM](/manuals/security/provisioning/scim/_index.md) enabled,
remove members from your identity provider (IdP). That removes them from
Docker automatically. If SCIM is disabled, remove members manually in Docker
using the following steps.
@y
If your organization uses single sign-on (SSO) with
[SCIM](manuals/security/provisioning/scim/_index.md) enabled,
remove members from your identity provider (IdP). That removes them from
Docker automatically. If SCIM is disabled, remove members manually in Docker
using the following steps.
@z

@x
Removing a member from a team revokes their access to that team's permitted
resources.
@y
Removing a member from a team revokes their access to that team's permitted
resources.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Teams**, then select the team.
1. Select the **X** next to the member's name to remove them from the team.
1. When prompted, select **Remove** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Teams**, then select the team.
1. Select the **X** next to the member's name to remove them from the team.
1. When prompted, select **Remove** to confirm.
@z

@x
### Update a member role
@y
### Update a member role
@z

@x
Organization owners can manage
[roles](/manuals/security/roles-and-permissions/_index.md) within
an organization. If an organization is part of a company, the company owner
can also manage that organization's roles. If SSO is enabled, you can use
[SCIM for role mapping][scim-role-mapping].
@y
Organization owners can manage
[roles](manuals/security/roles-and-permissions/_index.md) within
an organization. If an organization is part of a company, the company owner
can also manage that organization's roles. If SSO is enabled, you can use
[SCIM for role mapping][scim-role-mapping].
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Find the username of the member whose role you want to edit. Select the
   **Actions** menu, then **Edit role**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Find the username of the member whose role you want to edit. Select the
   **Actions** menu, then **Edit role**.
@z

@x
If you're the only owner of an organization and you want to edit your role,
assign a new owner first so you can change your own role.
@y
If you're the only owner of an organization and you want to edit your role,
assign a new owner first so you can change your own role.
@z

@x
### Remove a member from the organization
@y
### Remove a member from the organization
@z

@x
Organization owners can remove members from the organization. Removing a
member revokes their access to the organization's resources and teams.
@y
Organization owners can remove members from the organization. Removing a
member revokes their access to the organization's resources and teams.
@z

@x
If your organization uses SSO with
[SCIM](/manuals/security/provisioning/scim/_index.md) enabled,
remove members from your IdP instead.
@y
If your organization uses SSO with
[SCIM](manuals/security/provisioning/scim/_index.md) enabled,
remove members from your IdP instead.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Find the username of the member you want to remove. Select the
   **Actions** menu, then **Remove member**.
1. Select **Remove** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Find the username of the member you want to remove. Select the
   **Actions** menu, then **Remove member**.
1. Select **Remove** to confirm.
@z

@x
## Export a member list CSV
@y
## Export a member list CSV
@z

@x
Organization owners can export a CSV file of all members. Docker generates
the file asynchronously and emails it to the owner when it's ready.
@y
Organization owners can export a CSV file of all members. Docker generates
the file asynchronously and emails it to the owner when it's ready.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Select the **Download** icon to start the export.
1. Open the email from Docker and select the link to download the CSV file.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Members**.
1. Select the **Download** icon to start the export.
1. Open the email from Docker and select the link to download the CSV file.
@z

@x
   {{< accordion title="CSV fields" >}}
   - Name: The member's name
   - Username: The member's Docker ID
   - Email: The member's email address
   - Type: Whether the entry is a member or an invitee
   - Role: The member's role in the organization
   - Teams: Teams the member belongs to
   - Date Joined: When the member joined the organization
@y
   {{< accordion title="CSV fields" >}}
   - Name: The member's name
   - Username: The member's Docker ID
   - Email: The member's email address
   - Type: Whether the entry is a member or an invitee
   - Role: The member's role in the organization
   - Teams: Teams the member belongs to
   - Date Joined: When the member joined the organization
@z

@x
   {{< /accordion >}}
@y
   {{< /accordion >}}
@z

@x
## Next steps
@y
## Next steps
@z

@x
After you invite and manage members, explore these related topics:
@y
After you invite and manage members, explore these related topics:
@z

@x
- [Manage subscription seats](./manage-seats.md) to add seats for pending
  invitations
- [Manage license assignment](./manage-licenses.md) to control product access
- [Create and manage a team](./manage-a-team.md) to group members and set
  repository permissions
- [Roles and permissions][roles-permissions] for role definitions
- [SCIM provisioning][scim-provisioning] to automate member and role
  management
@y
- [Manage subscription seats](./manage-seats.md) to add seats for pending
  invitations
- [Manage license assignment](./manage-licenses.md) to control product access
- [Create and manage a team](./manage-a-team.md) to group members and set
  repository permissions
- [Roles and permissions][roles-permissions] for role definitions
- [SCIM provisioning][scim-provisioning] to automate member and role
  management
@z

@x
[roles-permissions]: /manuals/security/roles-and-permissions/_index.md
[licenses-and-invites]: /manuals/accounts/organization/manage/manage-licenses.md#licenses-and-invites
[bulk-invites]: /reference/api/hub/latest/operations/postV2InvitesBulk/
[docker-pricing]: https://www.docker.com/pricing?ref=Docs&refAction=DocsAdminMembers
[scim-role-mapping]: /manuals/security/provisioning/scim/_index.md
[scim-provisioning]: /manuals/security/provisioning/scim/_index.md
@y
[roles-permissions]: manuals/security/roles-and-permissions/_index.md
[licenses-and-invites]: manuals/accounts/organization/manage/manage-licenses.md#licenses-and-invites
[bulk-invites]: __SUBDIR__/reference/api/hub/latest/operations/postV2InvitesBulk/
[docker-pricing]: https://www.docker.com/pricing?ref=Docs&refAction=DocsAdminMembers
[scim-role-mapping]: manuals/security/provisioning/scim/_index.md
[scim-provisioning]: manuals/security/provisioning/scim/_index.md
@z
