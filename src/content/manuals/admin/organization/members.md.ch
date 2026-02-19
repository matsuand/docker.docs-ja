%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Manage organization members
@y
title: Manage organization members
@z

@x
description: Learn how to manage organization members in Docker Hub and Docker Admin Console.
keywords: members, teams, organizations, invite members, manage team members, export member list, edit roles, organization teams, user management
@y
description: Learn how to manage organization members in Docker Hub and Docker Admin Console.
keywords: members, teams, organizations, invite members, manage team members, export member list, edit roles, organization teams, user management
@z

@x
Learn how to manage members for your organization in Docker Hub and the Docker Admin Console.
@y
Learn how to manage members for your organization in Docker Hub and the Docker Admin Console.
@z

@x
## Invite members
@y
## Invite members
@z

@x
Owners can invite new members to an organization via Docker ID, email address, or with a CSV file containing email addresses. If an invitee does not have a Docker account, they must create an account and verify their email address before they can accept an invitation to join the organization. When inviting members, their pending invitation occupies a seat.
@y
Owners can invite new members to an organization via Docker ID, email address, or with a CSV file containing email addresses. If an invitee does not have a Docker account, they must create an account and verify their email address before they can accept an invitation to join the organization. When inviting members, their pending invitation occupies a seat.
@z

@x
### Invite members via Docker ID or email address
@y
### Invite members via Docker ID or email address
@z

@x
Use the following steps to invite members to your organization via Docker ID or email address.
@y
Use the following steps to invite members to your organization via Docker ID or email address.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Select **Members**, then **Invite**.
1. Select **Emails or usernames**.
1. Follow the on-screen instructions to invite members. Invite a maximum of 1000 members and separate multiple entries by comma, semicolon, or space.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Select **Members**, then **Invite**.
1. Select **Emails or usernames**.
1. Follow the on-screen instructions to invite members. Invite a maximum of 1000 members and separate multiple entries by comma, semicolon, or space.
@z

@x
When you invite members, you assign them a role. See [Roles and permissions](/enterprise/security/roles-and-permissions) for
details about the access permissions for each role.
@y
When you invite members, you assign them a role. See [Roles and permissions](__SUBDIR__/enterprise/security/roles-and-permissions) for
details about the access permissions for each role.
@z

@x
Pending invitations appear in the table. Invitees receive an email with a link to Docker Hub where they can accept or decline the invitation.
@y
Pending invitations appear in the table. Invitees receive an email with a link to Docker Hub where they can accept or decline the invitation.
@z

@x
### Invite members via CSV file
@y
### Invite members via CSV file
@z

@x
To invite multiple members to an organization via a CSV file containing email addresses:
@y
To invite multiple members to an organization via a CSV file containing email addresses:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down. Select **Members** > **Invite** > **CSV upload**.
1. Optional. Select **Download the template CSV file** to download an example CSV file. The following is an example of the contents of a valid CSV file:
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down. Select **Members** > **Invite** > **CSV upload**.
1. Optional. Select **Download the template CSV file** to download an example CSV file. The following is an example of the contents of a valid CSV file:
@z

% snip text...

@x
    The example file demonstrates CSV file requirements:
@y
    The example file demonstrates CSV file requirements:
@z

@x
    - The file must contain a header row with at least one heading named email. Additional columns are allowed and are ignored in the import.
    - The file must contain a maximum of 1000 email addresses (rows). To invite more than 1000 users, create multiple CSV files and perform all steps in this task for each file.
1. Create a new CSV file or export a CSV file from another application.
   - To export a CSV file from another application, see the application’s documentation.
   - To create a new CSV file, open a new file in a text editor, type email on the first line, type the user email addresses one per line on the following lines, and then save the file with a .csv extension.
1. Select **Browse files** and then select your CSV file, or drag and drop the CSV file into the **Select a CSV file to upload** box. You can only select one CSV file at a time.
1. After the CSV file has been uploaded, select **Review** to identify any invalid email addresses, already invited users, invited users who are already members, or duplicated email addresses within the same CSV file. 
1. Follow the on-screen instructions to invite members.
@y
    - The file must contain a header row with at least one heading named email. Additional columns are allowed and are ignored in the import.
    - The file must contain a maximum of 1000 email addresses (rows). To invite more than 1000 users, create multiple CSV files and perform all steps in this task for each file.
1. Create a new CSV file or export a CSV file from another application.
   - To export a CSV file from another application, see the application’s documentation.
   - To create a new CSV file, open a new file in a text editor, type email on the first line, type the user email addresses one per line on the following lines, and then save the file with a .csv extension.
1. Select **Browse files** and then select your CSV file, or drag and drop the CSV file into the **Select a CSV file to upload** box. You can only select one CSV file at a time.
1. After the CSV file has been uploaded, select **Review** to identify any invalid email addresses, already invited users, invited users who are already members, or duplicated email addresses within the same CSV file. 
1. Follow the on-screen instructions to invite members.
@z

@x
Pending invitations appear in the table. The invitees receive an email with a link to Docker Hub where they can accept or decline the invitation.
@y
Pending invitations appear in the table. The invitees receive an email with a link to Docker Hub where they can accept or decline the invitation.
@z

@x
### Invite members via API
@y
### Invite members via API
@z

@x
You can bulk invite members using the Docker Hub API. For more information, see the [Bulk create invites](https://docs.docker.com/reference/api/hub/latest/#tag/invites/paths/~1v2~1invites~1bulk/post) API endpoint.
@y
You can bulk invite members using the Docker Hub API. For more information, see the [Bulk create invites](https://docs.docker.com/reference/api/hub/latest/#tag/invites/paths/~1v2~1invites~1bulk/post) API endpoint.
@z

@x
## Accept invitation
@y
## Accept invitation
@z

@x
After receiving an email invitation, users can access
a link to Docker Hub where they can accept or decline the invitation. 
@y
After receiving an email invitation, users can access
a link to Docker Hub where they can accept or decline the invitation. 
@z

@x
To accept an invitation:
@y
To accept an invitation:
@z

@x
1. Check your email inbox and open the Docker email with an invitation to
join the Docker organization.
1. To open the link to Docker Hub, select the **click here** link.
1. The Docker create an account page will open. If you already have an account, select **Already have an account? Sign in**.
If you do not have an account yet, create an account using the same email
address you received the invitation through.
1. Optional. If you do not have an account and created one, you must navigate
back to your email inbox and verify your email address using the Docker verification
email.
1. Once you are signed in to Docker Hub, select **My Hub** from the top-level navigation menu.
1. Select **Accept** on your invitation.
@y
1. Check your email inbox and open the Docker email with an invitation to
join the Docker organization.
1. To open the link to Docker Hub, select the **click here** link.
1. The Docker create an account page will open. If you already have an account, select **Already have an account? Sign in**.
If you do not have an account yet, create an account using the same email
address you received the invitation through.
1. Optional. If you do not have an account and created one, you must navigate
back to your email inbox and verify your email address using the Docker verification
email.
1. Once you are signed in to Docker Hub, select **My Hub** from the top-level navigation menu.
1. Select **Accept** on your invitation.
@z

@x
After accepting an invitation, you are now a member of the organization.
@y
After accepting an invitation, you are now a member of the organization.
@z

@x
Invitation email links expire after 14 days. If your email link has expired, you can sign in to [Docker Hub](https://hub.docker.com/) with the email address the link was sent to and accept the invitation from the **Notifications** panel.
@y
Invitation email links expire after 14 days. If your email link has expired, you can sign in to [Docker Hub](https://hub.docker.com/) with the email address the link was sent to and accept the invitation from the **Notifications** panel.
@z

@x
## Manage invitations
@y
## Manage invitations
@z

@x
After inviting members, you can resend or remove invitations as needed. Each invitee occupies one seat, so if the amount of email addresses in your CSV file exceeds the number of available seats in your organization, you won't be able to invite more members. 
@y
After inviting members, you can resend or remove invitations as needed. Each invitee occupies one seat, so if the amount of email addresses in your CSV file exceeds the number of available seats in your organization, you won't be able to invite more members. 
@z

@x
> [!TIP]
> Need to manage more than 1,000 team members? [Upgrade to Docker Business for unlimited user invites](https://www.docker.com/pricing/) and advanced role management. You can also [add seats](/subscription/manage-seats) to your subscription.  
@y
> [!TIP]
> Need to manage more than 1,000 team members? [Upgrade to Docker Business for unlimited user invites](https://www.docker.com/pricing/) and advanced role management. You can also [add seats](__SUBDIR__/subscription/manage-seats) to your subscription.  
@z

@x
### Resend an invitation
@y
### Resend an invitation
@z

@x
You can send individual invitations, or bulk invitations from the Admin Console.
@y
You can send individual invitations, or bulk invitations from the Admin Console.
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
1. Select the **action menu** next to the invitee and select **Resend**.
1. Select **Invite** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Members**.
1. Select the **action menu** next to the invitee and select **Resend**.
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
1. Use the **checkboxes** next to **Usernames** to bulk select users.
1. Select **Resend invites**.
1. Select **Resend** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Members**.
1. Use the **checkboxes** next to **Usernames** to bulk select users.
1. Select **Resend invites**.
1. Select **Resend** to confirm.
@z

@x
### Remove an invitation
@y
### Remove an invitation
@z

@x
To remove an invitation from the Admin Console:
@y
To remove an invitation from the Admin Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Members**.
1. Select the **action menu** next to the invitee and select **Remove invitee**.
1. Select **Remove** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Members**.
1. Select the **action menu** next to the invitee and select **Remove invitee**.
1. Select **Remove** to confirm.
@z

@x
## Manage members on a team
@y
## Manage members on a team
@z

@x
Use Docker Hub or the Admin Console to add or remove team members. Organization owners can add a member to one or more teams within an organization.
@y
Use Docker Hub or the Admin Console to add or remove team members. Organization owners can add a member to one or more teams within an organization.
@z

@x
### Add a member to a team
@y
### Add a member to a team
@z

@x
To add a member to a team with the Admin Console:
@y
To add a member to a team with the Admin Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Teams**.
1. Select the team name.
1. Select **Add member**. You can add the member by searching for their email address or username.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Teams**.
1. Select the team name.
1. Select **Add member**. You can add the member by searching for their email address or username.
@z

@x
An invitee must first accept the invitation to join the organization before being added to the team.
@y
An invitee must first accept the invitation to join the organization before being added to the team.
@z

@x
### Remove members from teams
@y
### Remove members from teams
@z

@x
If your organization uses single sign-on (SSO) with [SCIM](/enterprise/security/provisioning/scim) enabled, you should remove members from your identity provider (IdP). This automatically removes members from Docker. If SCIM is disabled, follow procedures in this doc to remove members manually in Docker.
@y
If your organization uses single sign-on (SSO) with [SCIM](__SUBDIR__/enterprise/security/provisioning/scim) enabled, you should remove members from your identity provider (IdP). This automatically removes members from Docker. If SCIM is disabled, follow procedures in this doc to remove members manually in Docker.
@z

@x
Organization owners can remove a member from a team in Docker Hub or Admin Console. Removing the member from the team will revoke their access to the permitted resources. To remove a member from a specific team with the Admin Console:
@y
Organization owners can remove a member from a team in Docker Hub or Admin Console. Removing the member from the team will revoke their access to the permitted resources. To remove a member from a specific team with the Admin Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Teams**, then choose the name of the team member you want to remove.
1. Select the **X** next to the user's name to remove them from the team.
1. When prompted, select **Remove** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Teams**, then choose the name of the team member you want to remove.
1. Select the **X** next to the user's name to remove them from the team.
1. When prompted, select **Remove** to confirm.
@z

@x
### Update a member role
@y
### Update a member role
@z

@x
Organization owners can manage [roles](/security/for-admins/roles-and-permissions/)
within an organization. If an organization is part of a company,
the company owner can also manage that organization's roles. If you have SSO enabled, you can use [SCIM for role mapping](/security/for-admins/provisioning/scim/).
@y
Organization owners can manage [roles](__SUBDIR__/security/for-admins/roles-and-permissions/)
within an organization. If an organization is part of a company,
the company owner can also manage that organization's roles. If you have SSO enabled, you can use [SCIM for role mapping](__SUBDIR__/security/for-admins/provisioning/scim/).
@z

@x
To update a member role in the Admin Console:
@y
To update a member role in the Admin Console:
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
If you're the only owner of an organization and you want to edit your role, assign a new owner
for your organization so you can edit your role.
@y
If you're the only owner of an organization and you want to edit your role, assign a new owner
for your organization so you can edit your role.
@z

@x
## Export members CSV file
@y
## Export members CSV file
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
Owners can export a CSV file containing all members. The CSV file for a company contains the following fields:
@y
Owners can export a CSV file containing all members. The CSV file for a company contains the following fields:
@z

@x
- Name: The user's name
- Username: The user's Docker ID
- Email: The user's email address
- Member of Organizations: All organizations the user is a member of within a company
- Invited to Organizations: All organizations the user is an invitee of within a company
- Account Created: The time and date when the user account was created
@y
- Name: The user's name
- Username: The user's Docker ID
- Email: The user's email address
- Member of Organizations: All organizations the user is a member of within a company
- Invited to Organizations: All organizations the user is an invitee of within a company
- Account Created: The time and date when the user account was created
@z

@x
To export a CSV file of your members:
@y
To export a CSV file of your members:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Members**.
1. Select the **download** icon to export a CSV file of all members.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Members**.
1. Select the **download** icon to export a CSV file of all members.
@z
