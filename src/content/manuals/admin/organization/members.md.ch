%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Manage organization members
@y
title: Manage organization members
@z

@x
description: Learn how to manage organization members in Docker Hub and Docker Admin Console.
keywords: members, teams, organizations, invite members, manage team members
@y
description: Learn how to manage organization members in Docker Hub and Docker Admin Console.
keywords: members, teams, organizations, invite members, manage team members
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
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-users product="hub" %}}
@y
{{% admin-users product="hub" %}}
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-users product="admin" %}}
@y
{{% admin-users product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Accept invitation
@y
## Accept invitation
@z

@x
When an invitation is to a user's email address, they receive
a link to Docker Hub where they can accept or decline the invitation.
To accept an invitation:
@y
When an invitation is to a user's email address, they receive
a link to Docker Hub where they can accept or decline the invitation.
To accept an invitation:
@z

@x
1. Navigate to your email inbox and open the Docker email with an invitation to
join the Docker organization.
2. To open the link to Docker Hub, select the **click here** link.
3. The Docker create an account page will open. If you already have an account, select **Already have an account? Sign in**.
If you do not have an account yet, create an account using the same email
address you received the invitation through.
4. Optional. If you do not have an account and created one, you must navigate
back to your email inbox and verify your email address using the Docker verification
email.
5. Once you are signed in to Docker Hub, select **Organizations** from the top-level navigation menu.
6. The organizations page will display your invitation. Select **Accept**.
@y
1. Navigate to your email inbox and open the Docker email with an invitation to
join the Docker organization.
2. To open the link to Docker Hub, select the **click here** link.
3. The Docker create an account page will open. If you already have an account, select **Already have an account? Sign in**.
If you do not have an account yet, create an account using the same email
address you received the invitation through.
4. Optional. If you do not have an account and created one, you must navigate
back to your email inbox and verify your email address using the Docker verification
email.
5. Once you are signed in to Docker Hub, select **Organizations** from the top-level navigation menu.
6. The organizations page will display your invitation. Select **Accept**.
@z

@x
After accepting an invitation, you are now a member of the organization.
@y
After accepting an invitation, you are now a member of the organization.
@z

@x
## Manage invitations
@y
## Manage invitations
@z

@x
After inviting members, you can resend or remove invitations as needed.
@y
After inviting members, you can resend or remove invitations as needed.
@z

@x
### Resend an invitation
@y
### Resend an invitation
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
To resend an invitation from Docker Hub:
@y
To resend an invitation from Docker Hub:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com/).
2. Select **Organizations**, your organization, and then **Members**.
3. In the table, locate the invitee, select the **Actions** icon, and then select
**Resend invitation**.
4. Select **Invite** to confirm.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/).
2. Select **Organizations**, your organization, and then **Members**.
3. In the table, locate the invitee, select the **Actions** icon, and then select
**Resend invitation**.
4. Select **Invite** to confirm.
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
To resend an invitation from the Admin Console:
@y
To resend an invitation from the Admin Console:
@z

@x
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select **Members**.
3. Select the **action menu** next to the invitee and select **Resend invitation**.
4. Select **Invite** to confirm.
@y
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select **Members**.
3. Select the **action menu** next to the invitee and select **Resend invitation**.
4. Select **Invite** to confirm.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Remove an invitation
@y
### Remove an invitation
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
To remove a member's invitation from Docker Hub:
@y
To remove a member's invitation from Docker Hub:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com/).
2. Select **Organizations**, your organization, and then **Members**.
3. In the table, select the **Action** icon, and then select **Remove member** or **Remove invitee**.
4. Follow the on-screen instructions to remove the member or invitee.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/).
2. Select **Organizations**, your organization, and then **Members**.
3. In the table, select the **Action** icon, and then select **Remove member** or **Remove invitee**.
4. Follow the on-screen instructions to remove the member or invitee.
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
To remove an invitation from the Admin Console:
@y
To remove an invitation from the Admin Console:
@z

@x
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select **Members**.
3. Select the **action menu** next to the invitee and select **Remove invitee**.
4. Select **Remove** to confirm.
@y
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select **Members**.
3. Select the **action menu** next to the invitee and select **Remove invitee**.
4. Select **Remove** to confirm.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
To add a member to a team with Docker Hub:
@y
To add a member to a team with Docker Hub:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, and then **Members**.
3. Select the **Action** icon, and then select **Add to team**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, and then **Members**.
3. Select the **Action** icon, and then select **Add to team**.
@z

@x
   > [!NOTE]
   >
   > You can also navigate to **Organizations** > **Your Organization** > **Teams** > **Your Team Name** and select **Add Member**. Select a member from the drop-down list to add them to the team or search by Docker ID or email.
4. Select the team and then select **Add**.
@y
   > [!NOTE]
   >
   > You can also navigate to **Organizations** > **Your Organization** > **Teams** > **Your Team Name** and select **Add Member**. Select a member from the drop-down list to add them to the team or search by Docker ID or email.
4. Select the team and then select **Add**.
@z

@x
   > [!NOTE]
   >
   > An invitee must first accept the invitation to join the organization before being added to the team.
@y
   > [!NOTE]
   >
   > An invitee must first accept the invitation to join the organization before being added to the team.
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
To add a member to a team with the Admin Console:
@y
To add a member to a team with the Admin Console:
@z

@x
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select the team name.
3. Select **Add member**. You can add the member by searching for their email address or username.
@y
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select the team name.
3. Select **Add member**. You can add the member by searching for their email address or username.
@z

@x
   > [!NOTE]
   >
   > An invitee must first accept the invitation to join the organization before being added to the team.
@y
   > [!NOTE]
   >
   > An invitee must first accept the invitation to join the organization before being added to the team.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Remove a member from a team
@y
### Remove a member from a team
@z

@x
Organization owners can remove a member from a team in Docker Hub or Admin Console. Removing the member from the team will revoke their access to the permitted resources.
@y
Organization owners can remove a member from a team in Docker Hub or Admin Console. Removing the member from the team will revoke their access to the permitted resources.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
To remove a member from a specific team with Docker Hub:
@y
To remove a member from a specific team with Docker Hub:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, **Teams**, and then the team.
3. Select the **X** next to the user’s name to remove them from the team.
4. When prompted, select **Remove** to confirm.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, **Teams**, and then the team.
3. Select the **X** next to the user’s name to remove them from the team.
4. When prompted, select **Remove** to confirm.
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
To remove a member from a specific team with the Admin Console:
@y
To remove a member from a specific team with the Admin Console:
@z

@x
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select the team name.
3. Select the **X** next to the user's name to remove them from the team.
4. When prompted, select **Remove** to confirm.
@y
1. In the [Admin Console](https://app.docker.com/admin), select your organization.
2. Select the team name.
3. Select the **X** next to the user's name to remove them from the team.
4. When prompted, select **Remove** to confirm.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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
> [!NOTE]
>
> If you're the only owner of an organization,
> you need to assign a new owner before you can edit your role.
@y
> [!NOTE]
>
> If you're the only owner of an organization,
> you need to assign a new owner before you can edit your role.
@z

@x
To update a member role:
@y
To update a member role:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, and then **Members**.
3. Find the username of the member whose role you want to edit. In the table, select the **Actions** icon.
4. Select **Edit role**.
5. Select their organization, select the role you want to assign, and then select **Save**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, and then **Members**.
3. Find the username of the member whose role you want to edit. In the table, select the **Actions** icon.
4. Select **Edit role**.
5. Select their organization, select the role you want to assign, and then select **Save**.
@z

@x
## Export members CSV file
@y
## Export members CSV file
@z

@x
Owners can export a CSV file containing all members. The CSV file for a company contains the following fields:
- Name: The user's name
- Username: The user's Docker ID
- Email: The user's email address
- Member of Organizations: All organizations the user is a member of within a company
- Invited to Organizations: All organizations the user is an invitee of within a company
- Account Created: The time and date when the user account was created
@y
Owners can export a CSV file containing all members. The CSV file for a company contains the following fields:
- Name: The user's name
- Username: The user's Docker ID
- Email: The user's email address
- Member of Organizations: All organizations the user is a member of within a company
- Invited to Organizations: All organizations the user is an invitee of within a company
- Account Created: The time and date when the user account was created
@z

@x
To export a CSV file of the members:
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, and then **Members**.
3. Select the **Action** icon and then select **Export users as CSV**.
@y
To export a CSV file of the members:
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Organizations**, your organization, and then **Members**.
3. Select the **Action** icon and then select **Export users as CSV**.
@z
