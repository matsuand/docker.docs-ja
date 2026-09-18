%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Discover how to manage access to repositories on Docker Hub.
keywords: Docker Hub, Hub, repository access, repository collaborators, repository privacy
title: Access management
LinkTItle: Access
@y
description: Discover how to manage access to repositories on Docker Hub.
keywords: Docker Hub, Hub, repository access, repository collaborators, repository privacy
title: Access management
LinkTItle: Access
@z

@x
In this topic learn about the features available to manage access to your
repositories. This includes visibility, collaborators, roles, teams, and
organization access tokens.
@y
In this topic learn about the features available to manage access to your
repositories. This includes visibility, collaborators, roles, teams, and
organization access tokens.
@z

@x
## Repository visibility
@y
## Repository visibility
@z

@x
The most basic repository access is controlled via the visibility. A
repository's visibility can be public or private.
@y
The most basic repository access is controlled via the visibility. A
repository's visibility can be public or private.
@z

@x
With public visibility, the repository appears in Docker Hub search results and
can be pulled by everyone. To manage push access to public personal
repositories, you can use collaborators. To manage push access to public
organization repositories, you can use roles, teams, or organization access
tokens.
@y
With public visibility, the repository appears in Docker Hub search results and
can be pulled by everyone. To manage push access to public personal
repositories, you can use collaborators. To manage push access to public
organization repositories, you can use roles, teams, or organization access
tokens.
@z

@x
With private visibility, the repository doesn't appear in Docker Hub search
results and is only accessible to those with granted permission. To manage push
and pull access to private personal repositories, you can use collaborators. To
manage push and pull access to private organization repositories, you can use
roles, teams, or organization access tokens.
@y
With private visibility, the repository doesn't appear in Docker Hub search
results and is only accessible to those with granted permission. To manage push
and pull access to private personal repositories, you can use collaborators. To
manage push and pull access to private organization repositories, you can use
roles, teams, or organization access tokens.
@z

@x
### Change repository visibility
@y
### Change repository visibility
@z

@x
When creating a repository in Docker Hub, you can set the repository visibility.
In addition, you can set the default repository visibility when a repository is
created in your personal repository settings. The following describes how to
change the visibility after the repository has been created.
@y
When creating a repository in Docker Hub, you can set the repository visibility.
In addition, you can set the default repository visibility when a repository is
created in your personal repository settings. The following describes how to
change the visibility after the repository has been created.
@z

@x
To change repository visibility:
@y
To change repository visibility:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Select a repository.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Settings** tab.
5. Under **Visibility settings**, select one of the following:
@y
4. Select the **Settings** tab.
5. Under **Visibility settings**, select one of the following:
@z

@x
   - **Make public**: The repository appears in Docker Hub search results and can be
     pulled by everyone.
   - **Make private**: The repository doesn't appear in Docker Hub search results
     and is only accessible to you and collaborators. In addition, if the
     repository is in an organization's namespace, then the repository
     is accessible to those with applicable roles or permissions.
@y
   - **Make public**: The repository appears in Docker Hub search results and can be
     pulled by everyone.
   - **Make private**: The repository doesn't appear in Docker Hub search results
     and is only accessible to you and collaborators. In addition, if the
     repository is in an organization's namespace, then the repository
     is accessible to those with applicable roles or permissions.
@z

@x
6. Type the repository's name to verify the change.
7. Select **Make public** or **Make private**.
@y
6. Type the repository's name to verify the change.
7. Select **Make public** or **Make private**.
@z

@x
## Collaborators
@y
## Collaborators
@z

@x
A collaborator is someone you want to give `push` and `pull` access to a
personal repository. Collaborators aren't able to perform any administrative
tasks such as deleting the repository or changing its visibility from private to
public. In addition, collaborators can't add other collaborators.
@y
A collaborator is someone you want to give `push` and `pull` access to a
personal repository. Collaborators aren't able to perform any administrative
tasks such as deleting the repository or changing its visibility from private to
public. In addition, collaborators can't add other collaborators.
@z

@x
Only personal repositories can use collaborators. You can add unlimited
collaborators to public repositories, and Docker Pro accounts can add up to 1
collaborator on private repositories.
@y
Only personal repositories can use collaborators. You can add unlimited
collaborators to public repositories, and Docker Pro accounts can add up to 1
collaborator on private repositories.
@z

@x
Organization repositories can't use collaborators, but can use member roles,
teams, or organization access tokens to manage access.
@y
Organization repositories can't use collaborators, but can use member roles,
teams, or organization access tokens to manage access.
@z

@x
### Manage collaborators
@y
### Manage collaborators
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **My Hub** > **Repositories**.
@y
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Collaborators** tab.
@y
4. Select the **Collaborators** tab.
@z

@x
5. Add or remove collaborators based on their Docker username.
@y
5. Add or remove collaborators based on their Docker username.
@z

@x
You can choose collaborators and manage their access to a private
repository from that repository's **Settings** page.
@y
You can choose collaborators and manage their access to a private
repository from that repository's **Settings** page.
@z

@x
## Organization roles
@y
## Organization roles
@z

@x
Organizations can use roles for individuals, giving them different
permissions in the organization. For more details, see [Roles and
permissions](/manuals/security/roles-and-permissions.md).
@y
Organizations can use roles for individuals, giving them different
permissions in the organization. For more details, see [Roles and
permissions](manuals/security/roles-and-permissions.md).
@z

@x
## Organization teams
@y
## Organization teams
@z

@x
Organizations can use teams. A team can be assigned fine-grained repository
access.
@y
Organizations can use teams. A team can be assigned fine-grained repository
access.
@z

@x
### Configure team repository permissions
@y
### Configure team repository permissions
@z

@x
You must create a team before you are able to configure repository permissions.
For more details, see [Create and manage a
team](/manuals/accounts/organization/manage/manage-a-team.md).
@y
You must create a team before you are able to configure repository permissions.
For more details, see [Create and manage a
team](manuals/accounts/organization/manage/manage-a-team.md).
@z

@x
To configure team repository permissions:
@y
To configure team repository permissions:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **My Hub** > **Repositories**.
@y
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Permissions** tab.
@y
4. Select the **Permissions** tab.
@z

@x
5. Add, modify, or remove a team's repository permissions.
@y
5. Add, modify, or remove a team's repository permissions.
@z

@x
   - Add: Specify the **Team**, select the **Permission**, and then select **Add**.
   - Modify: Specify the new permission next to the team.
   - Remove: Select the **Remove permission** icon next to the team.
@y
   - Add: Specify the **Team**, select the **Permission**, and then select **Add**.
   - Modify: Specify the new permission next to the team.
   - Remove: Select the **Remove permission** icon next to the team.
@z

@x
## Organization access tokens (OATs)
@y
## Organization access tokens (OATs)
@z

@x
Organizations can use OATs. OATs let you assign fine-grained repository access
permissions to tokens. For more details, see [Organization access
tokens](/manuals/security/access-tokens/organization-access-tokens.md).
@y
Organizations can use OATs. OATs let you assign fine-grained repository access
permissions to tokens. For more details, see [Organization access
tokens](manuals/security/access-tokens/organization-access-tokens.md).
@z

@x
## Gated distribution
@y
## Gated distribution
@z

@x
{{< summary-bar feature_name="Gated distribution" >}}
@y
{{< summary-bar feature_name="Gated distribution" >}}
@z

@x
Gated distribution allows publishers to securely share private container images
with external customers or partners, without giving them full organization
access or visibility into your teams, collaborators, or other repositories.
Content stays in private repositories, and external users can pull from them
without being added to your internal organization.
@y
Gated distribution allows publishers to securely share private container images
with external customers or partners, without giving them full organization
access or visibility into your teams, collaborators, or other repositories.
Content stays in private repositories, and external users can pull from them
without being added to your internal organization.
@z

@x
This feature is ideal for commercial software publishers who want to control who
can pull specific images while preserving a clean separation between internal
users and external consumers.
@y
This feature is ideal for commercial software publishers who want to control who
can pull specific images while preserving a clean separation between internal
users and external consumers.
@z

@x
If you are interested in Gated Distribution contact the <a
href="https://www.docker.com/pricing/contact-sales/"
id="dkr_docs_cs_hub_gated_distribution" class="link" rel="noopener">Docker Sales
Team</a> for more information.
@y
If you are interested in Gated Distribution contact the <a
href="https://www.docker.com/pricing/contact-sales/"
id="dkr_docs_cs_hub_gated_distribution" class="link" rel="noopener">Docker Sales
Team</a> for more information.
@z

@x
### Distributor members
@y
### Distributor members
@z

@x
When you invite users to an organization entitled with gated distribution, you
assign them a role that determines their level of access. For gated
distribution, external users are invited as **distributor members** within a
specific team that you create. This role grants pull-only access to the
repositories assigned to that team, and nothing else in your organization. See
[Roles and permissions](/manuals/security/roles-and-permissions.md)
for details about the access permissions for other roles.
@y
When you invite users to an organization entitled with gated distribution, you
assign them a role that determines their level of access. For gated
distribution, external users are invited as **distributor members** within a
specific team that you create. This role grants pull-only access to the
repositories assigned to that team, and nothing else in your organization. See
[Roles and permissions](manuals/security/roles-and-permissions.md)
for details about the access permissions for other roles.
@z

@x
Distributor members can't see other members in their team or organization, and
they can't see any repositories other than the ones their team has been granted
access to. This isolation is what makes the role suitable for distributing gated
images to external users, partners, or customers without exposing internal
collaborators, teams, or repositories.
@y
Distributor members can't see other members in their team or organization, and
they can't see any repositories other than the ones their team has been granted
access to. This isolation is what makes the role suitable for distributing gated
images to external users, partners, or customers without exposing internal
collaborators, teams, or repositories.
@z

@x
Because distributor members consume licenses allocated for that role, consider
provisioning a separate organization for gated distribution rather than adding
distributor members to your main organization. This keeps regular members from
inadvertently consuming the licenses set aside for external distribution.
@y
Because distributor members consume licenses allocated for that role, consider
provisioning a separate organization for gated distribution rather than adding
distributor members to your main organization. This keeps regular members from
inadvertently consuming the licenses set aside for external distribution.
@z

@x
### Invite distributor members via API
@y
### Invite distributor members via API
@z

@x
Distributor members can only be invited using the Docker Hub API. UI-based
invitations are not supported for this role.
@y
Distributor members can only be invited using the Docker Hub API. UI-based
invitations are not supported for this role.
@z

@x
To invite distributor members:
@y
To invite distributor members:
@z

@x
1. Use the [authentication
   API](/reference/api/hub/latest/operations/AuthCreateAccessToken/)
   to generate a bearer token for your Docker Hub account. This token authorizes
   the API requests you use to send invites. Replace `myusername` and
   `dckr_pat_...` with your Docker ID and a [personal access
   token](/manuals/security/access-tokens.md):
@y
1. Use the [authentication
   API](__SUBDIR__/reference/api/hub/latest/operations/AuthCreateAccessToken/)
   to generate a bearer token for your Docker Hub account. This token authorizes
   the API requests you use to send invites. Replace `myusername` and
   `dckr_pat_...` with your Docker ID and a [personal access
   token](manuals/security/access-tokens.md):
@z

@x
   ```console
   $ TOKEN=$(curl -s -X POST "https://hub.docker.com/v2/auth/token" \
       -H "Content-Type: application/json" \
       -d '{"identifier": "myusername", "secret": "dckr_pat_..."}' \
       | jq -r .access_token)
   ```
@y
   ```console
   $ TOKEN=$(curl -s -X POST "https://hub.docker.com/v2/auth/token" \
       -H "Content-Type: application/json" \
       -d '{"identifier": "myusername", "secret": "dckr_pat_..."}' \
       | jq -r .access_token)
   ```
@z

@x
2. Create a team to group the distributor members and assign them a shared set
   of repository permissions.
@y
2. Create a team to group the distributor members and assign them a shared set
   of repository permissions.
@z

@x
   {{< tabs >}}
   {{< tab name="Hub" >}}
@y
   {{< tabs >}}
   {{< tab name="Hub" >}}
@z

@x
   1. Sign in to [Docker Home](https://app.docker.com) and select your
      organization.
   2. Select **Teams**.
   3. Select **Create team**.
   4. Provide the team's information, then select **Create**.
@y
   1. Sign in to [Docker Home](https://app.docker.com) and select your
      organization.
   2. Select **Teams**.
   3. Select **Create team**.
   4. Provide the team's information, then select **Create**.
@z

@x
   For more details, see [Create and manage a
   team](/manuals/accounts/organization/manage/manage-a-team.md).
@y
   For more details, see [Create and manage a
   team](manuals/accounts/organization/manage/manage-a-team.md).
@z

@x
   {{< /tab >}}
   {{< tab name="API" >}}
@y
   {{< /tab >}}
   {{< tab name="API" >}}
@z

@x
   Use the [teams
   API](/reference/api/hub/latest/operations/postV2OrgsByOrgNameGroups/):
@y
   Use the [teams
   API](__SUBDIR__/reference/api/hub/latest/operations/postV2OrgsByOrgNameGroups/):
@z

@x
   ```console
   $ curl -s -X POST "https://hub.docker.com/v2/orgs/example-org/groups" \
       -H "Authorization: Bearer $TOKEN" \
       -H "Content-Type: application/json" \
       -d '{"name": "customer-team", "description": "External distributor members"}'
   ```
@y
   ```console
   $ curl -s -X POST "https://hub.docker.com/v2/orgs/example-org/groups" \
       -H "Authorization: Bearer $TOKEN" \
       -H "Content-Type: application/json" \
       -d '{"name": "customer-team", "description": "External distributor members"}'
   ```
@z

@x
   The response includes the new team's `id`. Save it for the next step, for
   example `GROUP_ID=12345`.
@y
   The response includes the new team's `id`. Save it for the next step, for
   example `GROUP_ID=12345`.
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
3. Grant the team read-only access to the repositories you want distributor
   members to access.
@y
3. Grant the team read-only access to the repositories you want distributor
   members to access.
@z

@x
   {{< tabs >}}
   {{< tab name="Hub" >}}
@y
   {{< tabs >}}
   {{< tab name="Hub" >}}
@z

@x
   1. Sign in to [Docker Hub](https://hub.docker.com).
   2. Select **My Hub** > **Repositories**.
   3. Select the repository.
   4. Select the **Permissions** tab.
   5. Specify the **Team**, select **Read-only** as the **Permission**, and
      then select **Add**.
@y
   1. Sign in to [Docker Hub](https://hub.docker.com).
   2. Select **My Hub** > **Repositories**.
   3. Select the repository.
   4. Select the **Permissions** tab.
   5. Specify the **Team**, select **Read-only** as the **Permission**, and
      then select **Add**.
@z

@x
   {{< /tab >}}
   {{< tab name="API" >}}
@y
   {{< /tab >}}
   {{< tab name="API" >}}
@z

@x
   Use the [repository teams
   API](/reference/api/hub/latest/operations/CreateRepositoryGroup/),
   passing the team's `id` from the previous step as `group_id`:
@y
   Use the [repository teams
   API](__SUBDIR__/reference/api/hub/latest/operations/CreateRepositoryGroup/),
   passing the team's `id` from the previous step as `group_id`:
@z

@x
   ```console
   $ curl -s -X POST "https://hub.docker.com/v2/repositories/example-org/example-repo/groups" \
       -H "Authorization: Bearer $TOKEN" \
       -H "Content-Type: application/json" \
       -d "{\"group_id\": $GROUP_ID, \"permission\": \"read\"}"
   ```
@y
   ```console
   $ curl -s -X POST "https://hub.docker.com/v2/repositories/example-org/example-repo/groups" \
       -H "Authorization: Bearer $TOKEN" \
       -H "Content-Type: application/json" \
       -d "{\"group_id\": $GROUP_ID, \"permission\": \"read\"}"
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
4. Use the [bulk create invites
   endpoint](/reference/api/hub/latest/operations/postV2InvitesBulk/)
   to send email invites. In the request body, set `role` to
   `distributor_member`, specify the `team`, and list the invitees' email
   addresses:
@y
4. Use the [bulk create invites
   endpoint](__SUBDIR__/reference/api/hub/latest/operations/postV2InvitesBulk/)
   to send email invites. In the request body, set `role` to
   `distributor_member`, specify the `team`, and list the invitees' email
   addresses:
@z

@x
   ```console
   $ curl -s -X POST "https://hub.docker.com/v2/invites/bulk" \
       -H "Authorization: Bearer $TOKEN" \
       -H "Content-Type: application/json" \
       -d '{
             "org": "example-org",
             "team": "customer-team",
             "role": "distributor_member",
             "invitees": ["user@example.com"]
           }'
   ```
@y
   ```console
   $ curl -s -X POST "https://hub.docker.com/v2/invites/bulk" \
       -H "Authorization: Bearer $TOKEN" \
       -H "Content-Type: application/json" \
       -d '{
             "org": "example-org",
             "team": "customer-team",
             "role": "distributor_member",
             "invitees": ["user@example.com"]
           }'
   ```
@z

@x
   This sends email invitations to the specified users and automatically assigns
   them to the team.
@y
   This sends email invitations to the specified users and automatically assigns
   them to the team.
@z

@x
5. The invited user receives an email invitation from Docker Hub. When they
   select the link in the email, they sign in with their Docker ID (or create
   one if needed) to accept the invite. Once accepted, they're added to the
   organization as a distributor member with pull-only access to the
   repositories assigned to their team.
@y
5. The invited user receives an email invitation from Docker Hub. When they
   select the link in the email, they sign in with their Docker ID (or create
   one if needed) to accept the invite. Once accepted, they're added to the
   organization as a distributor member with pull-only access to the
   repositories assigned to their team.
@z
