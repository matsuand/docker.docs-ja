%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Group mapping
description: Automate team membership by syncing identity provider groups with Docker teams
keywords: Group Mapping, SCIM, Docker Admin, admin, security, team management, user provisioning, identity provider
@y
title: Group mapping
description: Automate team membership by syncing identity provider groups with Docker teams
keywords: Group Mapping, SCIM, Docker Admin, admin, security, team management, user provisioning, identity provider
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Group mapping automatically synchronizes user groups from your identity provider (IdP) with teams in your Docker organization. For example, when you add a developer to the "backend-team" group in your IdP, they're automatically added to the corresponding team in Docker
@y
Group mapping automatically synchronizes user groups from your identity provider (IdP) with teams in your Docker organization. For example, when you add a developer to the "backend-team" group in your IdP, they're automatically added to the corresponding team in Docker
@z

@x
This page explains how group mapping works, and how to set up group mapping.
@y
This page explains how group mapping works, and how to set up group mapping.
@z

@x
> [!TIP]
>
> Group mapping is ideal for adding users to multiple organizations or multiple teams within one organization. If you don't need to set up multi-organization or multi-team assignment, SCIM [user-level attributes](scim.md#set-up-role-mapping) may be a better fit for your needs.
@y
> [!TIP]
>
> Group mapping is ideal for adding users to multiple organizations or multiple teams within one organization. If you don't need to set up multi-organization or multi-team assignment, SCIM [user-level attributes](scim.md#set-up-role-mapping) may be a better fit for your needs.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you being, you must have:
@y
Before you being, you must have:
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
Group mapping keeps your Docker teams synchronized with your IdP groups through these key components:
@y
Group mapping keeps your Docker teams synchronized with your IdP groups through these key components:
@z

@x
- Authentication flow: When users sign in through SSO, your IdP shares user attributes with Docker including email, name, and group memberships.
- Automatic updates: Docker uses these attributes to create or update user profiles and manage team assignments based on IdP group changes.
- Unique identification: Docker uses email addresses as unique identifiers, so each Docker account must have a unique email address.
- Team synchronization: Users' team memberships in Docker automatically reflect changes made in your IdP groups.
@y
- Authentication flow: When users sign in through SSO, your IdP shares user attributes with Docker including email, name, and group memberships.
- Automatic updates: Docker uses these attributes to create or update user profiles and manage team assignments based on IdP group changes.
- Unique identification: Docker uses email addresses as unique identifiers, so each Docker account must have a unique email address.
- Team synchronization: Users' team memberships in Docker automatically reflect changes made in your IdP groups.
@z

@x
## Set up group mapping
@y
## Set up group mapping
@z

@x
Group mapping setup involves configuring your identity provider to share group
information with Docker. This requires:
@y
Group mapping setup involves configuring your identity provider to share group
information with Docker. This requires:
@z

@x
- Creating groups in your IdP using Docker's naming format
- Configuring attributes so your IdP sends group data during authentication
- Adding users to the appropriate groups
- Testing the connection to ensure groups sync properly
@y
- Creating groups in your IdP using Docker's naming format
- Configuring attributes so your IdP sends group data during authentication
- Adding users to the appropriate groups
- Testing the connection to ensure groups sync properly
@z

@x
You can use group mapping with SSO only, or with both SSO and SCIM for enhanced
user lifecycle management.
@y
You can use group mapping with SSO only, or with both SSO and SCIM for enhanced
user lifecycle management.
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
- For the "developers" team in the "moby" organization: `mobdy:developers`
- For multi-organization access: `moby:backend` and `whale:desktop`
@y
- For the "developers" team in the "moby" organization: `mobdy:developers`
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
|:--------- | :---------- |
| `id` | Unique ID of the group in UUID format. This attribute is read-only. |
| `displayName` | Name of the group following the group mapping format: `organization:team`. |
| `members` | A list of users that are members of this group. |
| `members(x).value` | Unique ID of the user that is a member of this group. Members are referenced by ID. |
@y
| Attribute | Description |
|:--------- | :---------- |
| `id` | Unique ID of the group in UUID format. This attribute is read-only. |
| `displayName` | Name of the group following the group mapping format: `organization:team`. |
| `members` | A list of users that are members of this group. |
| `members(x).value` | Unique ID of the user that is a member of this group. Members are referenced by ID. |
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
> Group mapping with SSO isn't supported with the Azure AD (OIDC) authentication method. SCIM isn't required for these configurations.
@y
> [!NOTE]
>
> Group mapping with SSO isn't supported with the Azure AD (OIDC) authentication method. SCIM isn't required for these configurations.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
The user interface for your IdP may differ slightly from the following steps. Refer to the [Okta documentation](https://help.okta.com/oie/en-us/content/topics/apps/define-group-attribute-statements.htm) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. Refer to the [Okta documentation](https://help.okta.com/oie/en-us/content/topics/apps/define-group-attribute-statements.htm) to verify.
@z

@x
To set up group mapping:
@y
To set up group mapping:
@z

@x
1. Sign in to Okta and open your application.
1. Navigate to the **SAML Settings** page for your application.
1. In the **Group Attribute Statements (optional)** section, configure like the following:
   - **Name**: `groups`
   - **Name format**: `Unspecified`
   - **Filter**: `Starts with` + `organization:` where `organization` is the name of your organization
   The filter option will filter out the groups that aren't affiliated with your Docker organization.
1. Create your groups by selecting **Directory**, then **Groups**.
1. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
1. Assign users to the group(s) that you create.
@y
1. Sign in to Okta and open your application.
1. Navigate to the **SAML Settings** page for your application.
1. In the **Group Attribute Statements (optional)** section, configure like the following:
   - **Name**: `groups`
   - **Name format**: `Unspecified`
   - **Filter**: `Starts with` + `organization:` where `organization` is the name of your organization
   The filter option will filter out the groups that aren't affiliated with your Docker organization.
1. Create your groups by selecting **Directory**, then **Groups**.
1. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
1. Assign users to the group(s) that you create.
@z

@x
The next time you sync your groups with Docker, your users will map to the Docker groups you defined.
@y
The next time you sync your groups with Docker, your users will map to the Docker groups you defined.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID" >}}
@z

@x
The user interface for your IdP may differ slightly from the following steps. Refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. Refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
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
1. In the Group Claims section, select **Groups assigned to the application** with the source attribute **Cloud-only group display names (Preview)**.
1. Select **Advanced options**, then the **Filter groups** option.
1. Configure the attribute like the following:
   - **Attribute to match**: `Display name`
   - **Match with**: `Contains`
   - **String**: `:`
1. Select **Save**.
1. Select **Groups**, **All groups**, then **New group** to create your group(s).
1. Assign users to the group(s) that you create.
@y
1. Sign in to Entra ID and open your application.
1. Select **Manage**, then **Single sign-on**.
1. Select **Add a group claim**.
1. In the Group Claims section, select **Groups assigned to the application** with the source attribute **Cloud-only group display names (Preview)**.
1. Select **Advanced options**, then the **Filter groups** option.
1. Configure the attribute like the following:
   - **Attribute to match**: `Display name`
   - **Match with**: `Contains`
   - **String**: `:`
1. Select **Save**.
1. Select **Groups**, **All groups**, then **New group** to create your group(s).
1. Assign users to the group(s) that you create.
@z

@x
The next time you sync your groups with Docker, your users will map to the Docker groups you defined.
@y
The next time you sync your groups with Docker, your users will map to the Docker groups you defined.
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
Use group mapping with SCIM for more advanced user lifecycle management. Before you begin, make sure you [set up SCIM](./scim.md#enable-scim) first.
@y
Use group mapping with SCIM for more advanced user lifecycle management. Before you begin, make sure you [set up SCIM](./scim.md#enable-scim) first.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
The user interface for your IdP may differ slightly from the following steps. Refer to the [Okta documentation](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. Refer to the [Okta documentation](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm) to verify.
@z

@x
To set up your groups:
@y
To set up your groups:
@z

@x
1. Sign in to Okta and open your application.
1. Select **Applications**, then **Provisioning**, and **Integration**.
1. Select **Edit** to enable groups on your connection, then select **Push groups**.
1. Select **Save**. Saving this configuration will add the **Push Groups** tab to your application.
1. Create your groups by navigating to **Directory** and selecting **Groups**.
1. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
1. Assign users to the group(s) that you create.
1. Return to the **Integration** page, then select the **Push Groups** tab to open the view where you can control and manage how groups are provisioned.
1. Select **Push Groups**, then **Find groups by rule**.
1. Configure the groups by rule like the following:
    - Enter a rule name, for example `Sync groups with Docker Hub`
    - Match group by name, for example starts with `docker:` or contains `:` for multi-organization
    - If you enable **Immediately push groups by rule**, sync will happen as soon as there's a change to the group or group assignments. Enable this if you don't want to manually push groups.
@y
1. Sign in to Okta and open your application.
1. Select **Applications**, then **Provisioning**, and **Integration**.
1. Select **Edit** to enable groups on your connection, then select **Push groups**.
1. Select **Save**. Saving this configuration will add the **Push Groups** tab to your application.
1. Create your groups by navigating to **Directory** and selecting **Groups**.
1. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
1. Assign users to the group(s) that you create.
1. Return to the **Integration** page, then select the **Push Groups** tab to open the view where you can control and manage how groups are provisioned.
1. Select **Push Groups**, then **Find groups by rule**.
1. Configure the groups by rule like the following:
    - Enter a rule name, for example `Sync groups with Docker Hub`
    - Match group by name, for example starts with `docker:` or contains `:` for multi-organization
    - If you enable **Immediately push groups by rule**, sync will happen as soon as there's a change to the group or group assignments. Enable this if you don't want to manually push groups.
@z

@x
Find your new rule under **By rule** in the **Pushed Groups** column. The groups that match that rule are listed in the groups table on the right-hand side.
@y
Find your new rule under **By rule** in the **Pushed Groups** column. The groups that match that rule are listed in the groups table on the right-hand side.
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
The user interface for your IdP may differ slightly from the following steps. Refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. Refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@z

@x
Complete the following before configuring group mapping:
@y
Complete the following before configuring group mapping:
@z

@x
1. Sign in to Entra ID and go to your application.
1. In your application, select **Provisioning**, then **Mappings**.
1. Select **Provision Microsoft Entra ID Groups**.
1. Select **Show advanced options**, then **Edit attribute list**.
1. Update the `externalId` type to `reference`, then select the **Multi-Value** checkbox and choose the referenced object attribute `urn:ietf:params:scim:schemas:core:2.0:Group`.
1. Select **Save**, then **Yes** to confirm.
1. Go to **Provisioning**.
1. Toggle **Provision Status** to **On**, then select **Save**.
@y
1. Sign in to Entra ID and go to your application.
1. In your application, select **Provisioning**, then **Mappings**.
1. Select **Provision Microsoft Entra ID Groups**.
1. Select **Show advanced options**, then **Edit attribute list**.
1. Update the `externalId` type to `reference`, then select the **Multi-Value** checkbox and choose the referenced object attribute `urn:ietf:params:scim:schemas:core:2.0:Group`.
1. Select **Save**, then **Yes** to confirm.
1. Go to **Provisioning**.
1. Toggle **Provision Status** to **On**, then select **Save**.
@z

@x
Next, set up group mapping:
@y
Next, set up group mapping:
@z

@x
1. Go to the application overview page.
1. Under **Provision user accounts**, select **Get started**.
1. Select **Add user/group**.
1. Create your group(s) using the `organization:team` format.
1. Assign the group to the provisioning group.
1. Select **Start provisioning** to start the sync.
@y
1. Go to the application overview page.
1. Under **Provision user accounts**, select **Get started**.
1. Select **Add user/group**.
1. Create your group(s) using the `organization:team` format.
1. Assign the group to the provisioning group.
1. Select **Start provisioning** to start the sync.
@z

@x
To verify, select **Monitor**, then **Provisioning logs** to see that your groups were provisioned successfully. In your Docker organization, you can check that the groups were correctly provisioned and the members were added to the appropriate teams.
@y
To verify, select **Monitor**, then **Provisioning logs** to see that your groups were provisioned successfully. In your Docker organization, you can check that the groups were correctly provisioned and the members were added to the appropriate teams.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Once complete, a user who signs in to Docker through SSO is automatically added to the organizations and teams mapped in the IdP.
@y
Once complete, a user who signs in to Docker through SSO is automatically added to the organizations and teams mapped in the IdP.
@z

@x
> [!TIP]
>
> [Enable SCIM](scim.md) to take advantage of automatic user provisioning and de-provisioning. If you don't enable SCIM users are only automatically provisioned. You have to de-provision them manually.
@y
> [!TIP]
>
> [Enable SCIM](scim.md) to take advantage of automatic user provisioning and de-provisioning. If you don't enable SCIM users are only automatically provisioned. You have to de-provision them manually.
@z
