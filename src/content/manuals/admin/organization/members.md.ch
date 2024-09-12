%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Manage organization members
weight: 30
description: Learn how to manage organization members in Docker Hub and Docker Admin Console.
keywords: members, teams, organizations, invite members, manage team members
aliases:
- /docker-hub/members/
---
@y
---
title: Manage organization members
weight: 30
description: Learn how to manage organization members in Docker Hub and Docker Admin Console.
keywords: members, teams, organizations, invite members, manage team members
aliases:
- /docker-hub/members/
---
@z

@x
Learn how to manage members for your organization in Docker Hub and the Docker Admin Console.
@y
Learn how to manage members for your organization in Docker Hub and the Docker Admin Console.
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
## Manage members on a team
@y
## Manage members on a team
@z

@x
Use Docker Hub to add a member to a team or remove a member from a team.
@y
Use Docker Hub to add a member to a team or remove a member from a team.
@z

@x
### Add a member to a team
@y
### Add a member to a team
@z

@x
Organization owners can add a member to one or more teams within an organization.
@y
Organization owners can add a member to one or more teams within an organization.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
To add a member to a team:
@y
To add a member to a team:
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
To add a member to a team:
@y
To add a member to a team:
@z

@x
1. In the Admin Console, select your organization.
2. Select the team name.
3. Select **Add member**. You can add the member by searching for their email address or username.
@y
1. In the Admin Console, select your organization.
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
To add a member to a team:
@y
To add a member to a team:
@z

@x
To remove a member from a specific team:
@y
To remove a member from a specific team:
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
To remove a member from a specific team:
@y
To remove a member from a specific team:
@z

@x
1. In the Admin Console, select your organization.
2. Select the team name.
3. Select the **X** next to the user's name to remove them from the team.
4. When prompted, select **Remove** to confirm.
@y
1. In the Admin Console, select your organization.
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
