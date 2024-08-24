%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Group mapping for administrators
keywords: Group Mapping, SCIM, Docker Hub, Docker Admin, admin, security
title: Group mapping
aliases:
- /admin/company/settings/group-mapping/
- /admin/organization/security-settings/group-mapping/
- /docker-hub/group-mapping/
- /security/for-admins/group-mapping/
---
@y
---
description: Group mapping for administrators
keywords: Group Mapping, SCIM, Docker Hub, Docker Admin, admin, security
title: Group mapping
aliases:
- /admin/company/settings/group-mapping/
- /admin/organization/security-settings/group-mapping/
- /docker-hub/group-mapping/
- /security/for-admins/group-mapping/
---
@z

@x
With directory group-to-team provisioning from your IdP, user updates will automatically sync with your Docker organizations and teams. You can use group mapping once you have configured [single sign-on (SSO)](../single-sign-on/_index.md).
@y
With directory group-to-team provisioning from your IdP, user updates will automatically sync with your Docker organizations and teams. You can use group mapping once you have configured [single sign-on (SSO)](../single-sign-on/_index.md).
@z

@x
> [!TIP]
>
> Group mapping is ideal for adding a user to multiple organizations or multiple teams within one organization. If you don't need to set up multi-organization or multi-team assignment, you can use [user-level attributes](scim.md#set-up-role-mapping).
@y
> [!TIP]
>
> Group mapping is ideal for adding a user to multiple organizations or multiple teams within one organization. If you don't need to set up multi-organization or multi-team assignment, you can use [user-level attributes](scim.md#set-up-role-mapping).
@z

@x
## How group mapping works
@y
## How group mapping works
@z

@x
IdPs share with Docker the main attributes of every authorized user through SSO, such as email address, name, surname, and groups. Just-in-Time (JIT) Provisioning uses these attributes to create or update the user’s Docker profile and their associations with organizations and teams on Docker Hub.
@y
IdPs share with Docker the main attributes of every authorized user through SSO, such as email address, name, surname, and groups. Just-in-Time (JIT) Provisioning uses these attributes to create or update the user’s Docker profile and their associations with organizations and teams on Docker Hub.
@z

@x
Docker uses the email address of the user to identify them on the platform. Every Docker account must have a unique email address at all times.
@y
Docker uses the email address of the user to identify them on the platform. Every Docker account must have a unique email address at all times.
@z

@x
## Use group mapping
@y
## Use group mapping
@z

@x
To correctly assign your users to Docker teams, you must create groups in your IdP following the naming pattern `organization:team`. For example, if you want to manage provisioning for the team "developers", and your organization name is "moby", you must create a group in your IdP with the name `moby:developers`.
@y
To correctly assign your users to Docker teams, you must create groups in your IdP following the naming pattern `organization:team`. For example, if you want to manage provisioning for the team "developers", and your organization name is "moby", you must create a group in your IdP with the name `moby:developers`.
@z

@x
Once you enable group mappings in your connection, users assigned to that group in your IdP will automatically be added to the team "developers" in Docker.
@y
Once you enable group mappings in your connection, users assigned to that group in your IdP will automatically be added to the team "developers" in Docker.
@z

@x
You can use this format to add a user to multiple organizations. For example, if you want to add a user to the "backend" team in the "moby" organization as well as the "desktop" team in the "whale" organization, the format would be: `moby:backend` and `whale:desktop`.
@y
You can use this format to add a user to multiple organizations. For example, if you want to add a user to the "backend" team in the "moby" organization as well as the "desktop" team in the "whale" organization, the format would be: `moby:backend` and `whale:desktop`.
@z

@x
>**Tip**
>
>Use the same names for the Docker teams as your group names in the IdP to prevent further configuration. When you sync groups, this creates a group if it doesn’t already exist.
@y
>**Tip**
>
>Use the same names for the Docker teams as your group names in the IdP to prevent further configuration. When you sync groups, this creates a group if it doesn’t already exist.
@z

@x
The following lists the supported group mapping attributes:
@y
The following lists the supported group mapping attributes:
@z

@x
| Attribute | Description |
|:--------- | :---------- |
| id | Unique ID of the group in UUID format. This attribute is read-only. |
| displayName | Name of the group following the group mapping format: `organization:team`. |
| members | A list of users that are members of this group. |
| members(x).value | Unique ID of the user that is a member of this group. Members are referenced by ID. |
@y
| Attribute | Description |
|:--------- | :---------- |
| id | Unique ID of the group in UUID format. This attribute is read-only. |
| displayName | Name of the group following the group mapping format: `organization:team`. |
| members | A list of users that are members of this group. |
| members(x).value | Unique ID of the user that is a member of this group. Members are referenced by ID. |
@z

@x
The general steps to use group mapping are:
@y
The general steps to use group mapping are:
@z

@x
1. In your IdP, create groups with the `organization:team` format.
2. Add users to the group.
3. Add the Docker application that you created in your IdP to the group.
4. Add attributes in the IdP.
5. Push groups to Docker.
@y
1. In your IdP, create groups with the `organization:team` format.
2. Add users to the group.
3. Add the Docker application that you created in your IdP to the group.
4. Add attributes in the IdP.
5. Push groups to Docker.
@z

@x
The exact configuration may vary depending on your IdP. You can use [group mapping with SSO](#use-group-mapping-with-sso), or with SSO and [SCIM enabled](#use-group-mapping-with-scim).
@y
The exact configuration may vary depending on your IdP. You can use [group mapping with SSO](#use-group-mapping-with-sso), or with SSO and [SCIM enabled](#use-group-mapping-with-scim).
@z

@x
### Use group mapping with SSO
@y
### Use group mapping with SSO
@z

@x
The following steps describe how to set up and use group mapping with your SSO connection only. For these configurations, enabling SCIM isn't required.
@y
The following steps describe how to set up and use group mapping with your SSO connection only. For these configurations, enabling SCIM isn't required.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Okta documentation](https://help.okta.com/oie/en-us/content/topics/apps/define-group-attribute-statements.htm) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Okta documentation](https://help.okta.com/oie/en-us/content/topics/apps/define-group-attribute-statements.htm) to verify.
@z

@x
To set up group mapping:
@y
To set up group mapping:
@z

@x
1. Sign in to the Okta Console to go to your application.
2. Go to the **SAML Settings** for your application.
3. In the **Group Attribute Statements (optional)** section, configure like the following:
   - **Name**: `groups`
   - **Name format**: `Unspecified`
   - **Filter**: `Starts with` + `organization:` where `organization` is the name of your organization
   The filter option will filter out the groups that aren't affiliated with your Docker organization.
4. Create your groups by navigating to **Directory > Groups**.
5. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
6. Assign users to the group(s) that you create.
@y
1. Sign in to the Okta Console to go to your application.
2. Go to the **SAML Settings** for your application.
3. In the **Group Attribute Statements (optional)** section, configure like the following:
   - **Name**: `groups`
   - **Name format**: `Unspecified`
   - **Filter**: `Starts with` + `organization:` where `organization` is the name of your organization
   The filter option will filter out the groups that aren't affiliated with your Docker organization.
4. Create your groups by navigating to **Directory > Groups**.
5. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
6. Assign users to the group(s) that you create.
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
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@z

@x
To set up group mapping:
@y
To set up group mapping:
@z

@x
1. Sign in to Entra ID and go to your application.
2. Go to **Manage > Single sign-on**.
3. Select **Add a group claim**.
4. In **Group Claims**, select **Groups assigned to the application** with the source attribute **Cloud-only group display names (Preview)**.
5. Select **Advanced options**, then the **Filter groups** option.
6. Configure the attribute like the following:
   - **Attribute to match**: `Display name`
   - **Match with**: `Contains`
   - **String**: `:`
7. Select **Save**.
8. Go to **Groups > All groups** then select **New group** to create your group(s).
9. Assign users to the group(s) that you create.
@y
1. Sign in to Entra ID and go to your application.
2. Go to **Manage > Single sign-on**.
3. Select **Add a group claim**.
4. In **Group Claims**, select **Groups assigned to the application** with the source attribute **Cloud-only group display names (Preview)**.
5. Select **Advanced options**, then the **Filter groups** option.
6. Configure the attribute like the following:
   - **Attribute to match**: `Display name`
   - **Match with**: `Contains`
   - **String**: `:`
7. Select **Save**.
8. Go to **Groups > All groups** then select **New group** to create your group(s).
9. Assign users to the group(s) that you create.
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
### Use group mapping with SCIM
@y
### Use group mapping with SCIM
@z

@x
The following steps describe how to set up and use group mapping with SCIM. Before you begin, make sure you [set up SCIM](./scim.md#enable-scim) first.
@y
The following steps describe how to set up and use group mapping with SCIM. Before you begin, make sure you [set up SCIM](./scim.md#enable-scim) first.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Okta documentation](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Okta documentation](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm) to verify.
@z

@x
To set up your groups:
@y
To set up your groups:
@z

@x
1. Sign in to the Okta Console to go to your application.
2. Select **Applications > Provisioning > Integration**.
3. Select **Edit** to enable groups on your connection, then select **Push groups**.
4. Select **Save**. Saving this configuration will add the **Push Groups** tab to your application.
5. Create your groups by navigating to **Directory > Groups**.
6. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
7. Assign users to the group(s) that you create.
8. Return to **Applications > Provisioning > Integration**, then select the **Push Groups** tab to open the view where you can control and manage how groups are provisioned.
9. Select **Push Groups > Find groups by rule**.
10. Configure the groups by rule like the following:
    - Enter a rule name, for example `Sync groups with Docker Hub`
    - Match group by name, for example starts with `docker:` or contains `:` for multi-organization
    - If you enable **Immediately push groups by rule**, sync will happen as soon as there's a change to the group or group assignments. Enable this if you don't want to manually push groups.
@y
1. Sign in to the Okta Console to go to your application.
2. Select **Applications > Provisioning > Integration**.
3. Select **Edit** to enable groups on your connection, then select **Push groups**.
4. Select **Save**. Saving this configuration will add the **Push Groups** tab to your application.
5. Create your groups by navigating to **Directory > Groups**.
6. Add your groups using the format `organization:team` that matches the names of your organization(s) and team(s) in Docker.
7. Assign users to the group(s) that you create.
8. Return to **Applications > Provisioning > Integration**, then select the **Push Groups** tab to open the view where you can control and manage how groups are provisioned.
9. Select **Push Groups > Find groups by rule**.
10. Configure the groups by rule like the following:
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
2. Select the **Push Status** drop-down.
3. Select **Push Now**.
@y
1. Select **Group in Okta**.
2. Select the **Push Status** drop-down.
3. Select **Push Now**.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID" >}}
@z

@x
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@y
The user interface for your IdP may differ slightly from the following steps. You can refer to the [Entra ID documentation](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes) to verify.
@z

@x
Complete the following before configuring group mapping:
@y
Complete the following before configuring group mapping:
@z

@x
1. Sign in to Entra ID and go to your application.
2. In your application, go to **Provisioning > Mappings**.
3. Select **Provision Microsoft Entra ID Groups**.
4. Select **Show advanced options**, then **Edit attribute list**.
5. Update the `externalId` type to `reference`, then select the **Multi-Value** checkbox and choose the referenced object attribute `urn:ietf:params:scim:schemas:core:2.0:Group`.
6. Select **Save**, then **Yes** to confirm.
7. Go to **Provisioning**.
8. Toggle **Provision Status** to **On**, then select **Save**.
@y
1. Sign in to Entra ID and go to your application.
2. In your application, go to **Provisioning > Mappings**.
3. Select **Provision Microsoft Entra ID Groups**.
4. Select **Show advanced options**, then **Edit attribute list**.
5. Update the `externalId` type to `reference`, then select the **Multi-Value** checkbox and choose the referenced object attribute `urn:ietf:params:scim:schemas:core:2.0:Group`.
6. Select **Save**, then **Yes** to confirm.
7. Go to **Provisioning**.
8. Toggle **Provision Status** to **On**, then select **Save**.
@z

@x
Next, set up group mapping:
@y
Next, set up group mapping:
@z

@x
1. Go to the application overview page.
2. Under **Provision user accounts**, select **Get started**.
3. Select **Add user/group**.
4. Create your group(s) using the `organization:team` format.
5. Assign the group to the provisioning group.
6. Select **Start provisioning** to start the sync.
@y
1. Go to the application overview page.
2. Under **Provision user accounts**, select **Get started**.
3. Select **Add user/group**.
4. Create your group(s) using the `organization:team` format.
5. Assign the group to the provisioning group.
6. Select **Start provisioning** to start the sync.
@z

@x
To verify, go to **Monitor > Provisioning logs** to see that your groups were provisioned successfully. In your Docker organization, you can check that the groups were correctly provisioned and the members were added to the appropriate teams.
@y
To verify, go to **Monitor > Provisioning logs** to see that your groups were provisioned successfully. In your Docker organization, you can check that the groups were correctly provisioned and the members were added to the appropriate teams.
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

@x
## More resources
@y
## More resources
@z

@x
The following videos demonstrate how to use group mapping with your IdP with SCIM enabled.
@y
The following videos demonstrate how to use group mapping with your IdP with SCIM enabled.
@z

@x
- [Video: Group mapping with Okta](https://youtu.be/c56YECO4YP4?feature=shared&t=3023)
- [Video: Attribute and group mapping with Entra ID (Azure)](https://youtu.be/bGquA8qR9jU?feature=shared&t=2039)
@y
- [Video: Group mapping with Okta](https://youtu.be/c56YECO4YP4?feature=shared&t=3023)
- [Video: Attribute and group mapping with Entra ID (Azure)](https://youtu.be/bGquA8qR9jU?feature=shared&t=2039)
@z
