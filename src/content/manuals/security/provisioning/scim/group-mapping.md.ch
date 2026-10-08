%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Map identity provider groups to Docker teams
linkTitle: Group mapping
description: >-
  Automate Docker team membership by mapping groups from your identity
  provider with SSO or SCIM.
keywords: group mapping, SCIM, SSO, Docker teams, team management,
  user provisioning, identity provider, Okta, Microsoft Entra ID
@y
title: Map identity provider groups to Docker teams
linkTitle: Group mapping
description: >-
  Automate Docker team membership by mapping groups from your identity
  provider with SSO or SCIM.
keywords: group mapping, SCIM, SSO, Docker teams, team management,
  user provisioning, identity provider, Okta, Microsoft Entra ID
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Group mapping synchronizes groups from your identity provider (IdP) with teams
in your Docker organization. For example, when you add a developer to the
`moby:backend` group in your IdP, Docker adds them to the `backend` team in the
`moby` organization.
@y
Group mapping synchronizes groups from your identity provider (IdP) with teams
in your Docker organization. For example, when you add a developer to the
`moby:backend` group in your IdP, Docker adds them to the `backend` team in the
`moby` organization.
@z

@x
Use group mapping to manage team membership through SAML SSO, SCIM, or both.
@y
Use group mapping to manage team membership through SAML SSO, SCIM, or both.
@z

@x
> [!TIP]
>
> Use group mapping to add users to multiple organizations or teams. To assign
> each user to one organization or team, you can use SCIM
> [user-level attributes](provision-scim.md#set-up-role-mapping).
@y
> [!TIP]
>
> Use group mapping to add users to multiple organizations or teams. To assign
> each user to one organization or team, you can use SCIM
> [user-level attributes](provision-scim.md#set-up-role-mapping).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, you must have:
@y
Before you begin, you must have:
@z

@x
- SSO configured for your organization
- Administrator access to Docker Home and your identity provider
@y
- SSO configured for your organization
- Administrator access to Docker Home and your identity provider
@z

@x
## How group mapping works
@y
## How group mapping works
@z

@x
Group mapping uses IdP attributes to keep Docker Team membership synchronized:
@y
Group mapping uses IdP attributes to keep Docker Team membership synchronized:
@z

@x
- With SAML SSO, the IdP sends group membership when a user signs in.
- With SCIM, the IdP synchronizes group membership on its provisioning
  schedule.
- Docker identifies users by email address. Each Docker account must have a
  unique email address.
- Docker creates teams when a mapped group references a team that doesn't
  exist.
@y
- With SAML SSO, the IdP sends group membership when a user signs in.
- With SCIM, the IdP synchronizes group membership on its provisioning
  schedule.
- Docker identifies users by email address. Each Docker account must have a
  unique email address.
- Docker creates teams when a mapped group references a team that doesn't
  exist.
@z

@x
## Set up group mapping
@y
## Set up group mapping
@z

@x
To configure group mapping:
@y
To configure group mapping:
@z

@x
- Create groups in your IdP using Docker's naming format
- Configure your IdP to send group data
- Add users to the groups
- Test that membership synchronizes
@y
- Create groups in your IdP using Docker's naming format
- Configure your IdP to send group data
- Add users to the groups
- Test that membership synchronizes
@z

@x
You can use group mapping with SAML SSO alone or with SCIM for user lifecycle
management.
@y
You can use group mapping with SAML SSO alone or with SCIM for user lifecycle
management.
@z

@x
### Group naming format
@y
### Group naming format
@z

@x
Create groups in your IdP using the format: `organization:team`.
@y
Create groups in your IdP using the format: `organization:team`.
@z

@x
For example:
@y
For example:
@z

@x
- For the "developers" team in the "moby" organization: `moby:developers`
- For multi-organization access: `moby:backend` and `whale:desktop`
@y
- For the "developers" team in the "moby" organization: `moby:developers`
- For multi-organization access: `moby:backend` and `whale:desktop`
@z

@x
Docker creates teams automatically if they don't already exist when groups sync.
@y
Docker creates teams automatically if they don't already exist when groups sync.
@z

@x
### Supported attributes
@y
### Supported attributes
@z

@x
| Attribute | Description |
| :--- | :--- |
| `id` | Unique ID of the group in UUID format. This attribute is read-only. |
| `displayName` | Group name in the `organization:team` format. |
| `members` | A list of users that are members of this group. |
| `members(x).value` | Unique ID of a user in the group. |
@y
| Attribute | Description |
| :--- | :--- |
| `id` | Unique ID of the group in UUID format. This attribute is read-only. |
| `displayName` | Group name in the `organization:team` format. |
| `members` | A list of users that are members of this group. |
| `members(x).value` | Unique ID of a user in the group. |
@z

@x
## Configure group mapping with SSO
@y
## Configure group mapping with SSO
@z

@x
Use group mapping with SSO connections that use the SAML authentication method.
@y
Use group mapping with SSO connections that use the SAML authentication method.
@z

@x
> [!NOTE]
>
> Group mapping through SSO isn't supported with the Microsoft Entra ID OIDC
> authentication method. Use SCIM to synchronize groups for OIDC connections.
@y
> [!NOTE]
>
> Group mapping through SSO isn't supported with the Microsoft Entra ID OIDC
> authentication method. Use SCIM to synchronize groups for OIDC connections.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
The IdP interface may differ from these steps. For more information, see the
[Okta documentation](https://help.okta.com/oie/en-us/content/topics/apps/define-group-attribute-statements.htm).
@y
The IdP interface may differ from these steps. For more information, see the
[Okta documentation](https://help.okta.com/oie/en-us/content/topics/apps/define-group-attribute-statements.htm).
@z

@x
To set up group mapping:
@y
To set up group mapping:
@z

@x
1. Sign in to Okta and open your application.
1. Navigate to the **SAML Settings** page for your application.
1. In **Group Attribute Statements (optional)**, configure these values:
   - **Name**: `groups`
   - **Name format**: `Unspecified`
   - **Filter**: **Starts with** and `organization:`, where `organization` is
     your Docker organization name
1. Create your groups by selecting **Directory**, then **Groups**.
1. Add groups in the `organization:team` format that match your Docker
   organization and team names.
1. Assign users to the groups.
@y
1. Sign in to Okta and open your application.
1. Navigate to the **SAML Settings** page for your application.
1. In **Group Attribute Statements (optional)**, configure these values:
   - **Name**: `groups`
   - **Name format**: `Unspecified`
   - **Filter**: **Starts with** and `organization:`, where `organization` is
     your Docker organization name
1. Create your groups by selecting **Directory**, then **Groups**.
1. Add groups in the `organization:team` format that match your Docker
   organization and team names.
1. Assign users to the groups.
@z

@x
The next time users sign in, Docker maps them to the teams you defined.
@y
The next time users sign in, Docker maps them to the teams you defined.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID" >}}
@z

@x
The IdP interface may differ from these steps. For more information, see the
[Microsoft Entra ID documentation](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-fed-group-claims).
@y
The IdP interface may differ from these steps. For more information, see the
[Microsoft Entra ID documentation](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-fed-group-claims).
@z

@x
To set up group mapping:
@y
To set up group mapping:
@z

@x
1. Sign in to Entra ID and open your application.
1. Select **Manage**, then **Single sign-on**.
1. Select **Add a group claim**.
1. In **Group Claims**, select **Groups assigned to the application** with the
   source attribute **Cloud-only group display names**.
1. Select **Advanced options**, then the **Filter groups** option.
1. Configure the attribute like the following:
   - **Attribute to match**: `Display name`
   - **Match with**: `Contains`
   - **String**: `:`
1. Select **Save**.
1. Select **Groups** > **All groups** > **New group** to create your groups.
1. Assign users to the groups.
@y
1. Sign in to Entra ID and open your application.
1. Select **Manage**, then **Single sign-on**.
1. Select **Add a group claim**.
1. In **Group Claims**, select **Groups assigned to the application** with the
   source attribute **Cloud-only group display names**.
1. Select **Advanced options**, then the **Filter groups** option.
1. Configure the attribute like the following:
   - **Attribute to match**: `Display name`
   - **Match with**: `Contains`
   - **String**: `:`
1. Select **Save**.
1. Select **Groups** > **All groups** > **New group** to create your groups.
1. Assign users to the groups.
@z

@x
The next time users sign in, Docker maps them to the teams you defined.
@y
The next time users sign in, Docker maps them to the teams you defined.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Configure group mapping with SCIM
@y
## Configure group mapping with SCIM
@z

@x
Use group mapping with SCIM to synchronize membership on your IdP's
provisioning schedule. Before you begin,
[set up SCIM](./provision-scim.md#enable-scim-in-docker).
@y
Use group mapping with SCIM to synchronize membership on your IdP's
provisioning schedule. Before you begin,
[set up SCIM](./provision-scim.md#enable-scim-in-docker).
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
The IdP interface may differ from these steps. For more information, see the
[Okta documentation](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm).
@y
The IdP interface may differ from these steps. For more information, see the
[Okta documentation](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm).
@z

@x
To set up your groups:
@y
To set up your groups:
@z

@x
1. Sign in to Okta and open your application.
1. Select **Applications**, then **Provisioning**, and **Integration**.
1. Select **Edit**, enable **Push Groups**, then select **Save**. The
   **Push Groups** tab appears in your application.
1. Create your groups by navigating to **Directory** and selecting **Groups**.
1. Add groups in the `organization:team` format that match your Docker
   organization and team names.
1. Assign users to the groups.
1. Return to **Integration**, then select **Push Groups**.
1. Select **Push Groups**, then **Find groups by rule**.
1. Configure the groups by rule like the following:
   - Enter a rule name, such as `Sync groups with Docker`.
   - Match groups by name. For example, use **Starts with** and `moby:`, or
     **Contains** and `:` for multiple organizations.
   - To sync after changes to groups or assignments, enable
     **Immediately push groups by rule**.
@y
1. Sign in to Okta and open your application.
1. Select **Applications**, then **Provisioning**, and **Integration**.
1. Select **Edit**, enable **Push Groups**, then select **Save**. The
   **Push Groups** tab appears in your application.
1. Create your groups by navigating to **Directory** and selecting **Groups**.
1. Add groups in the `organization:team` format that match your Docker
   organization and team names.
1. Assign users to the groups.
1. Return to **Integration**, then select **Push Groups**.
1. Select **Push Groups**, then **Find groups by rule**.
1. Configure the groups by rule like the following:
   - Enter a rule name, such as `Sync groups with Docker`.
   - Match groups by name. For example, use **Starts with** and `moby:`, or
     **Contains** and `:` for multiple organizations.
   - To sync after changes to groups or assignments, enable
     **Immediately push groups by rule**.
@z

@x
Find the rule under **By rule** in the **Pushed Groups** column. Matching groups
appear in the groups table.
@y
Find the rule under **By rule** in the **Pushed Groups** column. Matching groups
appear in the groups table.
@z

@x
To push the groups from this table:
@y
To push the groups from this table:
@z

@x
1. Select **Group in Okta**.
1. Select the **Push Status** drop-down.
1. Select **Push Now**.
@y
1. Select **Group in Okta**.
1. Select the **Push Status** drop-down.
1. Select **Push Now**.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID" >}}
@z

@x
The IdP interface may differ from these steps. For more information, see the
[Microsoft Entra ID documentation](https://learn.microsoft.com/en-us/entra/identity/app-provisioning/use-scim-to-provision-users-and-groups).
@y
The IdP interface may differ from these steps. For more information, see the
[Microsoft Entra ID documentation](https://learn.microsoft.com/en-us/entra/identity/app-provisioning/use-scim-to-provision-users-and-groups).
@z

@x
1. Sign in to Entra ID and go to your application.
1. In your application, select **Provisioning**, then **Mappings**.
1. Select **Provision Microsoft Entra ID Groups**.
1. Set **Enabled** to **Yes**.
1. Confirm these attribute mappings:
   - `displayName` to `displayName`
   - `objectId` to `externalId`
   - `members` to `members`
1. Select **Save**.
@y
1. Sign in to Entra ID and go to your application.
1. In your application, select **Provisioning**, then **Mappings**.
1. Select **Provision Microsoft Entra ID Groups**.
1. Set **Enabled** to **Yes**.
1. Confirm these attribute mappings:
   - `displayName` to `displayName`
   - `objectId` to `externalId`
   - `members` to `members`
1. Select **Save**.
@z

@x
Next, set up group mapping:
@y
Next, set up group mapping:
@z

@x
1. Go to **Users and groups**.
1. Select **Add user/group**.
1. Select groups that use the `organization:team` format.
1. Select **Assign**.
1. Go to **Provisioning** and select **Start provisioning**.
@y
1. Go to **Users and groups**.
1. Select **Add user/group**.
1. Select groups that use the `organization:team` format.
1. Select **Assign**.
1. Go to **Provisioning** and select **Start provisioning**.
@z

@x
To verify the sync, select **Monitor**, then **Provisioning logs**. In Docker
Home, confirm that members appear in the mapped teams.
@y
To verify the sync, select **Monitor**, then **Provisioning logs**. In Docker
Home, confirm that members appear in the mapped teams.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
After synchronization, Docker adds users to the organizations and teams mapped
in the IdP.
@y
After synchronization, Docker adds users to the organizations and teams mapped
in the IdP.
@z

@x
> [!TIP]
>
> [Enable SCIM](provision-scim.md) to provision and deprovision users
> automatically. Group mapping through SSO manages team membership but doesn't
> deprovision users.
@y
> [!TIP]
>
> [Enable SCIM](provision-scim.md) to provision and deprovision users
> automatically. Group mapping through SSO manages team membership but doesn't
> deprovision users.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Assign roles](/manuals/security/roles-and-permissions/core-roles.md) to
  organization members.
- [Enforce sign-in](/manuals/desktop/enterprise/enforce-sign-in/_index.md) for
  your organization.
@y
- [Assign roles](manuals/security/roles-and-permissions/core-roles.md) to
  organization members.
- [Enforce sign-in](manuals/desktop/enterprise/enforce-sign-in/_index.md) for
  your organization.
@z
