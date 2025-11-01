%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: SCIM provisioning
linkTitle: SCIM
description: Learn how System for Cross-domain Identity Management works and how to set it up.
keywords: SCIM, SSO, user provisioning, de-provisioning, role mapping, assign users
@y
title: SCIM provisioning
linkTitle: SCIM
description: Learn how System for Cross-domain Identity Management works and how to set it up.
keywords: SCIM, SSO, user provisioning, de-provisioning, role mapping, assign users
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Automate user management for your Docker organization using System for
Cross-domain Identity Management (SCIM). SCIM automatically provisions and
de-provisions users, synchronizes team memberships, and keeps your Docker
organization in sync with your identity provider.
@y
Automate user management for your Docker organization using System for
Cross-domain Identity Management (SCIM). SCIM automatically provisions and
de-provisions users, synchronizes team memberships, and keeps your Docker
organization in sync with your identity provider.
@z

@x
This page shows you how to automate user provisioning and de-provisioning for
Docker using SCIM.
@y
This page shows you how to automate user provisioning and de-provisioning for
Docker using SCIM.
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
## How SCIM works
@y
## How SCIM works
@z

@x
SCIM automates user provisioning and de-provisioning for Docker through your
identity provider. After you enable SCIM, any user assigned to your
Docker application in your identity provider is automatically provisioned and
added to your Docker organization. When a user is removed from the Docker
application in your identity provider, SCIM deactivates and removes them from
your Docker organization.
@y
SCIM automates user provisioning and de-provisioning for Docker through your
identity provider. After you enable SCIM, any user assigned to your
Docker application in your identity provider is automatically provisioned and
added to your Docker organization. When a user is removed from the Docker
application in your identity provider, SCIM deactivates and removes them from
your Docker organization.
@z

@x
In addition to provisioning and removal, SCIM also syncs profile updates like
name changes made in your identity provider. You can use SCIM alongside Docker's
default Just-in-Time (JIT) provisioning or on its own with JIT disabled.
@y
In addition to provisioning and removal, SCIM also syncs profile updates like
name changes made in your identity provider. You can use SCIM alongside Docker's
default Just-in-Time (JIT) provisioning or on its own with JIT disabled.
@z

@x
SCIM automates:
@y
SCIM automates:
@z

@x
- Creating users
- Updating user profiles
- Removing and deactivating users
- Re-activating users
- Group mapping
@y
- Creating users
- Updating user profiles
- Removing and deactivating users
- Re-activating users
- Group mapping
@z

@x
> [!NOTE]
>
> SCIM only manages users provisioned through your identity provider after
> SCIM is enabled. It cannot remove users who were manually added to your Docker
> organization before SCIM was set up.
>
> To remove those users, delete them manually from your Docker organization.
> For more information, see
> [Manage organization members](/manuals/admin/organization/members.md).
@y
> [!NOTE]
>
> SCIM only manages users provisioned through your identity provider after
> SCIM is enabled. It cannot remove users who were manually added to your Docker
> organization before SCIM was set up.
>
> To remove those users, delete them manually from your Docker organization.
> For more information, see
> [Manage organization members](manuals/admin/organization/members.md).
@z

@x
## Supported attributes
@y
## Supported attributes
@z

@x
SCIM uses attributes (name, email, etc.) to sync user information between your
identity provider and Docker. Properly mapping these attributes in your identity
provider ensures that user provisioning works smoothly and prevents issues like
duplicate user accounts
when using single sign-on.
@y
SCIM uses attributes (name, email, etc.) to sync user information between your
identity provider and Docker. Properly mapping these attributes in your identity
provider ensures that user provisioning works smoothly and prevents issues like
duplicate user accounts
when using single sign-on.
@z

@x
Docker supports the following SCIM attributes:
@y
Docker supports the following SCIM attributes:
@z

@x
| Attribute         | Description                                                                       |
| :---------------- | :-------------------------------------------------------------------------------- |
| `userName`        | User's primary email address, used as the unique identifier                       |
| `name.givenName`  | User's first name                                                                 |
| `name.familyName` | User's surname                                                                    |
| `active`          | Indicates if a user is enabled or disabled, set to "false" to de-provision a user |
@y
| Attribute         | Description                                                                       |
| :---------------- | :-------------------------------------------------------------------------------- |
| `userName`        | User's primary email address, used as the unique identifier                       |
| `name.givenName`  | User's first name                                                                 |
| `name.familyName` | User's surname                                                                    |
| `active`          | Indicates if a user is enabled or disabled, set to "false" to de-provision a user |
@z

@x
For additional details about supported attributes and SCIM, see
[Docker Hub API SCIM reference](/reference/api/hub/latest/#tag/scim).
@y
For additional details about supported attributes and SCIM, see
[Docker Hub API SCIM reference](__SUBDIR__/reference/api/hub/latest/#tag/scim).
@z

@x
> [!IMPORTANT]
>
> By default, Docker uses Just-in-Time (JIT) provisioning for SSO. If SCIM is
> enabled, JIT values still take precedence and will overwrite attribute values
> set by SCIM. To avoid conflicts, make sure your JIT attribute values match
> your SCIM values.
>
> Alternatively, you can disable JIT provisioning to rely solely on SCIM.
> For details, see [Just-in-Time](just-in-time.md).
@y
> [!IMPORTANT]
>
> By default, Docker uses Just-in-Time (JIT) provisioning for SSO. If SCIM is
> enabled, JIT values still take precedence and will overwrite attribute values
> set by SCIM. To avoid conflicts, make sure your JIT attribute values match
> your SCIM values.
>
> Alternatively, you can disable JIT provisioning to rely solely on SCIM.
> For details, see [Just-in-Time](just-in-time.md).
@z

@x
## Enable SCIM in Docker
@y
## Enable SCIM in Docker
@z

@x
To enable SCIM:
@y
To enable SCIM:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon for your
   connection, then select **Setup SCIM**.
1. Copy the **SCIM Base URL** and **API Token** and paste the values into your
   IdP.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon for your
   connection, then select **Setup SCIM**.
1. Copy the **SCIM Base URL** and **API Token** and paste the values into your
   IdP.
@z

@x
## Enable SCIM in your IdP
@y
## Enable SCIM in your IdP
@z

@x
The user interface for your identity provider may differ slightly from the
following steps. You can refer to the documentation for your identity provider
to verify. For additional details, see the documentation for your identity
provider:
@y
The user interface for your identity provider may differ slightly from the
following steps. You can refer to the documentation for your identity provider
to verify. For additional details, see the documentation for your identity
provider:
@z

@x
- [Okta](https://help.okta.com/en-us/Content/Topics/Apps/Apps_App_Integration_Wizard_SCIM.htm)
- [Entra ID/Azure AD SAML 2.0](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/user-provisioning)
@y
- [Okta](https://help.okta.com/en-us/Content/Topics/Apps/Apps_App_Integration_Wizard_SCIM.htm)
- [Entra ID/Azure AD SAML 2.0](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/user-provisioning)
@z

@x
> [!NOTE]
>
> Microsoft does not currently support SCIM and OIDC in the same non-gallery
> application in Entra ID. This page provides a verified workaround using a
> separate non-gallery app for SCIM provisioning. While Microsoft does not
> officially document this setup, it is widely used and supported in practice.
@y
> [!NOTE]
>
> Microsoft does not currently support SCIM and OIDC in the same non-gallery
> application in Entra ID. This page provides a verified workaround using a
> separate non-gallery app for SCIM provisioning. While Microsoft does not
> officially document this setup, it is widely used and supported in practice.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
### Step one: Enable SCIM
@y
### Step one: Enable SCIM
@z

@x
1. Sign in to Okta and select **Admin** to open the admin portal.
1. Open the application you created when you configured your SSO connection.
1. On the application page, select the **General** tab, then
   **Edit App Settings**.
1. Enable SCIM provisioning, then select **Save**.
1. Navigate to the **Provisioning**, then select **Edit SCIM Connection**.
1. To configure SCIM in Okta, set up your connection using the following
   values and settings:
   - SCIM Base URL: SCIM connector base URL (copied from Docker Home)
   - Unique identifier field for users: `email`
   - Supported provisioning actions: **Push New Users** and
     **Push Profile Updates**
   - Authentication Mode: HTTP Header
   - SCIM Bearer Token: HTTP Header Authorization Bearer Token
     (copied from Docker Home)
1. Select **Test Connector Configuration**.
1. Review the test results and select **Save**.
@y
1. Sign in to Okta and select **Admin** to open the admin portal.
1. Open the application you created when you configured your SSO connection.
1. On the application page, select the **General** tab, then
   **Edit App Settings**.
1. Enable SCIM provisioning, then select **Save**.
1. Navigate to the **Provisioning**, then select **Edit SCIM Connection**.
1. To configure SCIM in Okta, set up your connection using the following
   values and settings:
   - SCIM Base URL: SCIM connector base URL (copied from Docker Home)
   - Unique identifier field for users: `email`
   - Supported provisioning actions: **Push New Users** and
     **Push Profile Updates**
   - Authentication Mode: HTTP Header
   - SCIM Bearer Token: HTTP Header Authorization Bearer Token
     (copied from Docker Home)
1. Select **Test Connector Configuration**.
1. Review the test results and select **Save**.
@z

@x
### Step two: Enable synchronization
@y
### Step two: Enable synchronization
@z

@x
1. In Okta, select **Provisioning**.
1. Select **To App**, then **Edit**.
1. Enable **Create Users**, **Update User Attributes**, and **Deactivate Users**.
1. Select **Save**.
1. Remove unnecessary mappings. The necessary mappings are:
   - Username
   - Given name
   - Family name
   - Email
@y
1. In Okta, select **Provisioning**.
1. Select **To App**, then **Edit**.
1. Enable **Create Users**, **Update User Attributes**, and **Deactivate Users**.
1. Select **Save**.
1. Remove unnecessary mappings. The necessary mappings are:
   - Username
   - Given name
   - Family name
   - Email
@z

@x
Next, [set up role mapping](#set-up-role-mapping).
@y
Next, [set up role mapping](#set-up-role-mapping).
@z

@x
{{< /tab >}}
{{< tab name="Entra ID (OIDC)" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID (OIDC)" >}}
@z

@x
Microsoft does not support SCIM and OIDC in the same non-gallery application.
You must create a second non-gallery application in Entra ID for SCIM
provisioning.
@y
Microsoft does not support SCIM and OIDC in the same non-gallery application.
You must create a second non-gallery application in Entra ID for SCIM
provisioning.
@z

@x
### Step one: Create a separate SCIM app
@y
### Step one: Create a separate SCIM app
@z

@x
1. In the Azure Portal, go to **Microsoft Entra ID** >
   **Enterprise Applications** > **New application**.
1. Select **Create your own application**.
1. Name your application and choose
   **Integrate any other application you don't find in the gallery**.
1. Select **Create**.
@y
1. In the Azure Portal, go to **Microsoft Entra ID** >
   **Enterprise Applications** > **New application**.
1. Select **Create your own application**.
1. Name your application and choose
   **Integrate any other application you don't find in the gallery**.
1. Select **Create**.
@z

@x
### Step two: Configure SCIM provisioning
@y
### Step two: Configure SCIM provisioning
@z

@x
1. In your new SCIM application, go to **Provisioning** > **Get started**.
1. Set **Provisioning Mode** to **Automatic**.
1. Under **Admin Credentials**:
   - **Tenant URL**: Paste the **SCIM Base URL** from Docker Home.
   - **Secret Token**: Paste the **SCIM API token** from Docker Home.
1. Select **Test Connection** to verify.
1. Select **Save** to store credentials.
@y
1. In your new SCIM application, go to **Provisioning** > **Get started**.
1. Set **Provisioning Mode** to **Automatic**.
1. Under **Admin Credentials**:
   - **Tenant URL**: Paste the **SCIM Base URL** from Docker Home.
   - **Secret Token**: Paste the **SCIM API token** from Docker Home.
1. Select **Test Connection** to verify.
1. Select **Save** to store credentials.
@z

@x
Next, [set up role mapping](#set-up-role-mapping).
@y
Next, [set up role mapping](#set-up-role-mapping).
@z

@x
{{< /tab >}}
{{< tab name="Entra ID (SAML 2.0)" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID (SAML 2.0)" >}}
@z

@x
1. In the Azure Portal, go to **Microsoft Entra ID** >
   **Enterprise Applications**, and select your Docker SAML app.
1. Select **Provisioning** > **Get started**.
1. Set **Provisioning Mode** to **Automatic**.
1. Under **Admin Credentials**:
   - **Tenant URL**: Paste the **SCIM Base URL** from Docker Home.
   - **Secret Token**: Paste the **SCIM API token** from Docker Home.
1. Select **Test Connection** to verify.
1. Select **Save** to store credentials.
@y
1. In the Azure Portal, go to **Microsoft Entra ID** >
   **Enterprise Applications**, and select your Docker SAML app.
1. Select **Provisioning** > **Get started**.
1. Set **Provisioning Mode** to **Automatic**.
1. Under **Admin Credentials**:
   - **Tenant URL**: Paste the **SCIM Base URL** from Docker Home.
   - **Secret Token**: Paste the **SCIM API token** from Docker Home.
1. Select **Test Connection** to verify.
1. Select **Save** to store credentials.
@z

@x
Next, [set up role mapping](#set-up-role-mapping).
@y
Next, [set up role mapping](#set-up-role-mapping).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Set up role mapping
@y
## Set up role mapping
@z

@x
You can assign [Docker roles](../roles-and-permissions.md) to
users by adding optional SCIM attributes in your IdP. These attributes override
default role and team values set in your SSO configuration.
@y
You can assign [Docker roles](../roles-and-permissions.md) to
users by adding optional SCIM attributes in your IdP. These attributes override
default role and team values set in your SSO configuration.
@z

@x
> [!NOTE]
>
> Role mappings are supported for both SCIM and Just-in-Time (JIT)
> provisioning. For JIT, role mapping applies only when the user is first
> provisioned.
@y
> [!NOTE]
>
> Role mappings are supported for both SCIM and Just-in-Time (JIT)
> provisioning. For JIT, role mapping applies only when the user is first
> provisioned.
@z

@x
The following table lists the supported optional user-level attributes:
@y
The following table lists the supported optional user-level attributes:
@z

@x
| Attribute    | Possible values                          | Notes                                                                                                                                                                                                                                                            |
| ------------ | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `dockerRole` | `member`, `editor`, or `owner`           | If not set, the user defaults to the `member` role. Setting this attribute overrides the default.<br><br>For role definitions, see [Roles and permissions](../roles-and-permissions.md).                                                                         |
| `dockerOrg`  | Docker `organizationName` (e.g., `moby`) | Overrides the default organization configured in your SSO connection.<br><br>If unset, the user is provisioned to the default organization. If `dockerOrg` and `dockerTeam` are both set, the user is provisioned to the team within the specified organization. |
| `dockerTeam` | Docker `teamName` (e.g., `developers`)   | Provisions the user to the specified team in the default or specified organization. If the team doesn't exist, it is automatically created.<br><br>You can still use [group mapping](group-mapping.md) to assign users to multiple teams across organizations.   |
@y
| Attribute    | Possible values                          | Notes                                                                                                                                                                                                                                                            |
| ------------ | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `dockerRole` | `member`, `editor`, or `owner`           | If not set, the user defaults to the `member` role. Setting this attribute overrides the default.<br><br>For role definitions, see [Roles and permissions](../roles-and-permissions.md).                                                                         |
| `dockerOrg`  | Docker `organizationName` (e.g., `moby`) | Overrides the default organization configured in your SSO connection.<br><br>If unset, the user is provisioned to the default organization. If `dockerOrg` and `dockerTeam` are both set, the user is provisioned to the team within the specified organization. |
| `dockerTeam` | Docker `teamName` (e.g., `developers`)   | Provisions the user to the specified team in the default or specified organization. If the team doesn't exist, it is automatically created.<br><br>You can still use [group mapping](group-mapping.md) to assign users to multiple teams across organizations.   |
@z

@x
The external namespace used for these attributes is: `urn:ietf:params:scim:schemas:extension:docker:2.0:User`.
This value is required in your identity provider when creating custom SCIM attributes for Docker.
@y
The external namespace used for these attributes is: `urn:ietf:params:scim:schemas:extension:docker:2.0:User`.
This value is required in your identity provider when creating custom SCIM attributes for Docker.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
### Step one: Set up role mapping in Okta
@y
### Step one: Set up role mapping in Okta
@z

@x
1. Setup [SSO](../single-sign-on/configure/_index.md) and SCIM first.
1. In the Okta admin portal, go to **Directory**, select **Profile Editor**,
   and then **User (Default)**.
1. Select **Add Attribute** and configure the values for the role, organization,
   or team you want to add. Exact naming isn't required.
1. Return to the **Profile Editor** and select your application.
1. Select **Add Attribute** and enter the required values. The **External Name**
   and **External Namespace** must be exact.
   - The external name values for organization/team/role mapping are
     `dockerOrg`, `dockerTeam`, and `dockerRole` respectively, as listed in the previous table.
   - The external namespace is the same for all of them:
     `urn:ietf:params:scim:schemas:extension:docker:2.0:User`.
1. After creating the attributes, navigate to the top of the page and select
   **Mappings**, then **Okta User to YOUR APP**.
1. Go to the newly created attributes and map the variable names to the external
   names, then select **Save Mappings**. If you're using JIT provisioning, continue
   to the following steps.
1. Navigate to **Applications** and select **YOUR APP**.
1. Select **General**, then **SAML Settings**, and **Edit**.
1. Select **Step 2** and configure the mapping from the user attribute to the
   Docker variables.
@y
1. Setup [SSO](../single-sign-on/configure/_index.md) and SCIM first.
1. In the Okta admin portal, go to **Directory**, select **Profile Editor**,
   and then **User (Default)**.
1. Select **Add Attribute** and configure the values for the role, organization,
   or team you want to add. Exact naming isn't required.
1. Return to the **Profile Editor** and select your application.
1. Select **Add Attribute** and enter the required values. The **External Name**
   and **External Namespace** must be exact.
   - The external name values for organization/team/role mapping are
     `dockerOrg`, `dockerTeam`, and `dockerRole` respectively, as listed in the previous table.
   - The external namespace is the same for all of them:
     `urn:ietf:params:scim:schemas:extension:docker:2.0:User`.
1. After creating the attributes, navigate to the top of the page and select
   **Mappings**, then **Okta User to YOUR APP**.
1. Go to the newly created attributes and map the variable names to the external
   names, then select **Save Mappings**. If you're using JIT provisioning, continue
   to the following steps.
1. Navigate to **Applications** and select **YOUR APP**.
1. Select **General**, then **SAML Settings**, and **Edit**.
1. Select **Step 2** and configure the mapping from the user attribute to the
   Docker variables.
@z

@x
### Step two: Assign roles by user
@y
### Step two: Assign roles by user
@z

@x
1. In the Okta Admin portal, select **Directory**, then **People**.
1. Select **Profile**, then **Edit**.
1. Select **Attributes** and update the attributes to the desired values.
@y
1. In the Okta Admin portal, select **Directory**, then **People**.
1. Select **Profile**, then **Edit**.
1. Select **Attributes** and update the attributes to the desired values.
@z

@x
### Step three: Assign roles by group
@y
### Step three: Assign roles by group
@z

@x
1. In the Okta Admin portal, select **Directory**, then **People**.
1. Select **YOUR GROUP**, then **Applications**.
1. Open **YOUR APPLICATION** and select the **Edit** icon.
1. Update the attributes to the desired values.
@y
1. In the Okta Admin portal, select **Directory**, then **People**.
1. Select **YOUR GROUP**, then **Applications**.
1. Open **YOUR APPLICATION** and select the **Edit** icon.
1. Update the attributes to the desired values.
@z

@x
If a user doesn't already have attributes set up, users who are added to the
group will inherit these attributes upon provisioning.
@y
If a user doesn't already have attributes set up, users who are added to the
group will inherit these attributes upon provisioning.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID/Azure AD (SAML 2.0 and OIDC)" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID/Azure AD (SAML 2.0 and OIDC)" >}}
@z

@x
### Step one: Configure attribute mappings
@y
### Step one: Configure attribute mappings
@z

@x
1. Complete the [SCIM provisioning setup](#enable-scim-in-docker).
1. In the Azure Portal, open **Microsoft Entra ID** >
   **Enterprise Applications**, and select your SCIM application.
1. Go to **Provisioning** > **Mappings** >
   **Provision Azure Active Directory Users**.
1. Add or update the following mappings:
   - `userPrincipalName` -> `userName`
   - `mail` -> `emails.value`
   - Optional. Map `dockerRole`, `dockerOrg`, or `dockerTeam` using one of the
     [mapping methods](#step-two-choose-a-role-mapping-method).
1. Remove any unsupported attributes to prevent sync errors.
1. Optional. Go to **Mappings** > **Provision Azure Active Directory Groups**:
   - If group provisioning causes errors, set **Enabled** to **No**.
   - If enabling, test group mappings carefully.
1. Select **Save** to apply mappings.
@y
1. Complete the [SCIM provisioning setup](#enable-scim-in-docker).
1. In the Azure Portal, open **Microsoft Entra ID** >
   **Enterprise Applications**, and select your SCIM application.
1. Go to **Provisioning** > **Mappings** >
   **Provision Azure Active Directory Users**.
1. Add or update the following mappings:
   - `userPrincipalName` -> `userName`
   - `mail` -> `emails.value`
   - Optional. Map `dockerRole`, `dockerOrg`, or `dockerTeam` using one of the
     [mapping methods](#step-two-choose-a-role-mapping-method).
1. Remove any unsupported attributes to prevent sync errors.
1. Optional. Go to **Mappings** > **Provision Azure Active Directory Groups**:
   - If group provisioning causes errors, set **Enabled** to **No**.
   - If enabling, test group mappings carefully.
1. Select **Save** to apply mappings.
@z

@x
### Step two: Choose a role mapping method
@y
### Step two: Choose a role mapping method
@z

@x
You can map `dockerRole`, `dockerOrg`, or `dockerTeam` using one of the
following methods:
@y
You can map `dockerRole`, `dockerOrg`, or `dockerTeam` using one of the
following methods:
@z

@x
#### Expression mapping
@y
#### Expression mapping
@z

@x
Use this method if you only need to assign Docker roles like `member`, `editor`,
or `owner`.
@y
Use this method if you only need to assign Docker roles like `member`, `editor`,
or `owner`.
@z

@x
1. In the **Edit Attribute** view, set the mapping type to **Expression**.
1. In the **Expression** field:
   1. If your App Roles match Docker roles exactly, use:
      SingleAppRoleAssignment([appRoleAssignments])
   1. If they don't match, use a switch expression: `Switch(SingleAppRoleAssignment([appRoleAssignments]), "My Corp Admins", "owner", "My Corp Editors", "editor", "My Corp Users", "member")`
1. Set:
   - **Target attribute**: `urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerRole`
   - **Match objects using this attribute**: No
   - **Apply this mapping**: Always
1. Save your changes.
@y
1. In the **Edit Attribute** view, set the mapping type to **Expression**.
1. In the **Expression** field:
   1. If your App Roles match Docker roles exactly, use:
      SingleAppRoleAssignment([appRoleAssignments])
   1. If they don't match, use a switch expression: `Switch(SingleAppRoleAssignment([appRoleAssignments]), "My Corp Admins", "owner", "My Corp Editors", "editor", "My Corp Users", "member")`
1. Set:
   - **Target attribute**: `urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerRole`
   - **Match objects using this attribute**: No
   - **Apply this mapping**: Always
1. Save your changes.
@z

@x
> [!WARNING]
>
> You can't use `dockerOrg` or `dockerTeam` with this method. Expression mapping
> is only compatible with one attribute.
@y
> [!WARNING]
>
> You can't use `dockerOrg` or `dockerTeam` with this method. Expression mapping
> is only compatible with one attribute.
@z

@x
#### Direct mapping
@y
#### Direct mapping
@z

@x
Use this method if you need to map multiple attributes (`dockerRole` +
`dockerTeam`).
@y
Use this method if you need to map multiple attributes (`dockerRole` +
`dockerTeam`).
@z

@x
1. For each Docker attribute, choose a unique Entra extension attribute
   (`extensionAttribute1`, `extensionAttribute2`, etc.).
1. In the **Edit Attribute** view:
   - Set mapping type to **Direct**.
   - Set **Source attribute** to your selected extension attribute.
   - Set **Target attribute** to one of:
     - `dockerRole: urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerRole`
     - `dockerOrg: urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerOrg`
     - `dockerTeam: urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerTeam`
   - Set **Apply this mapping** to **Always**.
1. Save your changes.
@y
1. For each Docker attribute, choose a unique Entra extension attribute
   (`extensionAttribute1`, `extensionAttribute2`, etc.).
1. In the **Edit Attribute** view:
   - Set mapping type to **Direct**.
   - Set **Source attribute** to your selected extension attribute.
   - Set **Target attribute** to one of:
     - `dockerRole: urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerRole`
     - `dockerOrg: urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerOrg`
     - `dockerTeam: urn:ietf:params:scim:schemas:extension:docker:2.0:User:dockerTeam`
   - Set **Apply this mapping** to **Always**.
1. Save your changes.
@z

@x
To assign values, you'll need to use the Microsoft Graph API.
@y
To assign values, you'll need to use the Microsoft Graph API.
@z

@x
### Step three: Assign users and groups
@y
### Step three: Assign users and groups
@z

@x
For either mapping method:
@y
For either mapping method:
@z

@x
1. In the SCIM app, go to **Users and Groups** > **Add user/group**.
1. Select the users or groups to provision to Docker.
1. Select **Assign**.
@y
1. In the SCIM app, go to **Users and Groups** > **Add user/group**.
1. Select the users or groups to provision to Docker.
1. Select **Assign**.
@z

@x
If you're using expression mapping:
@y
If you're using expression mapping:
@z

@x
1. Go to **App registrations** > your SCIM app > **App Roles**.
1. Create App Roles that match Docker roles.
1. Assign users or groups to App Roles under **Users and Groups**.
@y
1. Go to **App registrations** > your SCIM app > **App Roles**.
1. Create App Roles that match Docker roles.
1. Assign users or groups to App Roles under **Users and Groups**.
@z

@x
If you're using direct mapping:
@y
If you're using direct mapping:
@z

@x
1. Go to [Microsoft Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer)
   and sign in as a tenant admin.
1. Use Microsoft Graph API to assign attribute values. Example PATCH request:
@y
1. Go to [Microsoft Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer)
   and sign in as a tenant admin.
1. Use Microsoft Graph API to assign attribute values. Example PATCH request:
@z

% snip code...

@x
> [!NOTE]
>
> You must use a different extension attribute for each SCIM field.
@y
> [!NOTE]
>
> You must use a different extension attribute for each SCIM field.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
See the documentation for your IdP for additional details:
@y
See the documentation for your IdP for additional details:
@z

@x
- [Okta](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-add-custom-user-attributes.htm)
- [Entra ID/Azure AD](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes#provisioning-a-custom-extension-attribute-to-a-scim-compliant-application)
@y
- [Okta](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-add-custom-user-attributes.htm)
- [Entra ID/Azure AD](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes#provisioning-a-custom-extension-attribute-to-a-scim-compliant-application)
@z

@x
## Test SCIM provisioning
@y
## Test SCIM provisioning
@z

@x
After completing role mapping, you can test the configuration manually.
@y
After completing role mapping, you can test the configuration manually.
@z

@x
{{< tabs >}}
{{< tab name="Okta" >}}
@y
{{< tabs >}}
{{< tab name="Okta" >}}
@z

@x
1. In the Okta admin portal, go to **Directory > People**.
1. Select a user you've assigned to your SCIM application.
1. Select **Provision User**.
1. Wait a few seconds, then check the Docker
   [Admin Console](https://app.docker.com/admin) under **Members**.
1. If the user doesn't appear, review logs in **Reports > System Log** and
   confirm SCIM settings in the app.
@y
1. In the Okta admin portal, go to **Directory > People**.
1. Select a user you've assigned to your SCIM application.
1. Select **Provision User**.
1. Wait a few seconds, then check the Docker
   [Admin Console](https://app.docker.com/admin) under **Members**.
1. If the user doesn't appear, review logs in **Reports > System Log** and
   confirm SCIM settings in the app.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID/Azure AD (OIDC and SAML 2.0)" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID/Azure AD (OIDC and SAML 2.0)" >}}
@z

@x
1. In the Azure Portal, go to **Microsoft Entra ID** > **Enterprise Applications**,
   and select your SCIM app.
1. Go to **Provisioning** > **Provision on demand**.
1. Select a user or group and choose **Provision**.
1. Confirm that the user appears in the Docker
   [Admin Console](https://app.docker.com/admin) under **Members**.
1. If needed, check **Provisioning logs** for errors.
@y
1. In the Azure Portal, go to **Microsoft Entra ID** > **Enterprise Applications**,
   and select your SCIM app.
1. Go to **Provisioning** > **Provision on demand**.
1. Select a user or group and choose **Provision**.
1. Confirm that the user appears in the Docker
   [Admin Console](https://app.docker.com/admin) under **Members**.
1. If needed, check **Provisioning logs** for errors.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Migrate existing JIT users to SCIM
@y
## Migrate existing JIT users to SCIM
@z

@x
If you already have users provisioned through Just-in-Time (JIT) and want to
enable full SCIM lifecycle management, you need to migrate them. Users
originally created by JIT cannot be automatically de-provisioned through SCIM,
even after SCIM is enabled.
@y
If you already have users provisioned through Just-in-Time (JIT) and want to
enable full SCIM lifecycle management, you need to migrate them. Users
originally created by JIT cannot be automatically de-provisioned through SCIM,
even after SCIM is enabled.
@z

@x
### Why migrate
@y
### Why migrate
@z

@x
Organizations using JIT provisioning may encounter limitations with user
lifecycle management, particularly around de-provisioning. Migrating to SCIM
provides:
@y
Organizations using JIT provisioning may encounter limitations with user
lifecycle management, particularly around de-provisioning. Migrating to SCIM
provides:
@z

@x
- Automatic user de-provisioning when users leave your organization. This is
  the primary benefit for large organizations that need full automation.
- Continuous synchronization of user attributes
- Centralized user management through your identity provider
- Enhanced security through automated access control
@y
- Automatic user de-provisioning when users leave your organization. This is
  the primary benefit for large organizations that need full automation.
- Continuous synchronization of user attributes
- Centralized user management through your identity provider
- Enhanced security through automated access control
@z

@x
> [!IMPORTANT]
>
> Users originally created through JIT provisioning cannot be automatically
> de-provisioned by SCIM, even after SCIM is enabled. To enable full lifecycle
> management including automatic de-provisioning through your identity provider,
> you must manually remove these users so SCIM can re-create them with proper
> lifecycle management capabilities.
@y
> [!IMPORTANT]
>
> Users originally created through JIT provisioning cannot be automatically
> de-provisioned by SCIM, even after SCIM is enabled. To enable full lifecycle
> management including automatic de-provisioning through your identity provider,
> you must manually remove these users so SCIM can re-create them with proper
> lifecycle management capabilities.
@z

@x
This migration is most critical for larger organizations that require fully
automated user de-provisioning when employees leave the company.
@y
This migration is most critical for larger organizations that require fully
automated user de-provisioning when employees leave the company.
@z

@x
### Prerequisites for migration
@y
### Prerequisites for migration
@z

@x
Before migrating, ensure you have:
@y
Before migrating, ensure you have:
@z

@x
- SCIM configured and tested in your organization
- A maintenance window for the migration
@y
- SCIM configured and tested in your organization
- A maintenance window for the migration
@z

@x
> [!WARNING]
>
> This migration temporarily disrupts user access. Plan to perform this
> migration during a low-usage window and communicate the timeline to affected
> users.
@y
> [!WARNING]
>
> This migration temporarily disrupts user access. Plan to perform this
> migration during a low-usage window and communicate the timeline to affected
> users.
@z

@x
### Prepare for migration
@y
### Prepare for migration
@z

@x
#### Transfer ownership
@y
#### Transfer ownership
@z

@x
Before removing users, ensure that any repositories, teams, or organization
resources they own are transferred to another administrator or service account.
When a user is removed from the organization, any resources they own may
become inaccessible.
@y
Before removing users, ensure that any repositories, teams, or organization
resources they own are transferred to another administrator or service account.
When a user is removed from the organization, any resources they own may
become inaccessible.
@z

@x
1. Review repositories, organization resources, and team ownership for affected
   users.
2. Transfer ownership to another administrator.
@y
1. Review repositories, organization resources, and team ownership for affected
   users.
2. Transfer ownership to another administrator.
@z

@x
> [!WARNING]
>
> If ownership is not transferred, repositories owned by removed users may
> become inaccessible when the user is removed. Ensure all critical resources
> are transferred before proceeding.
@y
> [!WARNING]
>
> If ownership is not transferred, repositories owned by removed users may
> become inaccessible when the user is removed. Ensure all critical resources
> are transferred before proceeding.
@z

@x
#### Verify identity provider configuration
@y
#### Verify identity provider configuration
@z

@x
1. Confirm all JIT-provisioned users are assigned to the Docker application in
   your identity provider.
2. Verify identity provider group to Docker team mappings are configured and
   tested.
@y
1. Confirm all JIT-provisioned users are assigned to the Docker application in
   your identity provider.
2. Verify identity provider group to Docker team mappings are configured and
   tested.
@z

@x
Users not assigned to the Docker application in your identity provider are not
re-created by SCIM after removal.
@y
Users not assigned to the Docker application in your identity provider are not
re-created by SCIM after removal.
@z

@x
#### Export user records
@y
#### Export user records
@z

@x
Export a list of JIT-provisioned users from Docker Admin Console:
@y
Export a list of JIT-provisioned users from Docker Admin Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
2. Select **Admin Console**, then **Members**.
3. Select **Export members** to download the member list as CSV for backup and
   reference.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
2. Select **Admin Console**, then **Members**.
3. Select **Export members** to download the member list as CSV for backup and
   reference.
@z

@x
Keep this CSV list of JIT-provisioned users as a rollback reference if needed.
@y
Keep this CSV list of JIT-provisioned users as a rollback reference if needed.
@z

@x
### Complete the migration
@y
### Complete the migration
@z

@x
#### Disable JIT provisioning
@y
#### Disable JIT provisioning
@z

@x
> [!IMPORTANT]
>
> Before disabling JIT, ensure SCIM is fully configured and tested in your
> organization. Do not disable JIT until you have verified SCIM is working
> correctly.
@y
> [!IMPORTANT]
>
> Before disabling JIT, ensure SCIM is fully configured and tested in your
> organization. Do not disable JIT until you have verified SCIM is working
> correctly.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
2. Select **Admin Console**, then **SSO and SCIM**.
3. In the SSO connections table, select the **Actions** menu for your connection.
4. Select **Disable JIT provisioning**.
5. Select **Disable** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
2. Select **Admin Console**, then **SSO and SCIM**.
3. In the SSO connections table, select the **Actions** menu for your connection.
4. Select **Disable JIT provisioning**.
5. Select **Disable** to confirm.
@z

@x
Disabling JIT prevents new users from being automatically added through SSO
during the migration.
@y
Disabling JIT prevents new users from being automatically added through SSO
during the migration.
@z

@x
#### Remove JIT-origin users
@y
#### Remove JIT-origin users
@z

@x
> [!IMPORTANT]
>
> Users originally created through JIT provisioning cannot be automatically
> de-provisioned by SCIM, even after SCIM is enabled. To enable full lifecycle
> management including automatic de-provisioning through your identity provider,
> you must manually remove these users so SCIM can re-create them with proper
> lifecycle management capabilities.
@y
> [!IMPORTANT]
>
> Users originally created through JIT provisioning cannot be automatically
> de-provisioned by SCIM, even after SCIM is enabled. To enable full lifecycle
> management including automatic de-provisioning through your identity provider,
> you must manually remove these users so SCIM can re-create them with proper
> lifecycle management capabilities.
@z

@x
This step is most critical for large organizations that require fully automated
user de-provisioning when employees leave the company.
@y
This step is most critical for large organizations that require fully automated
user de-provisioning when employees leave the company.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
2. Select **Admin Console**, then **Members**.
3. Identify and remove JIT-provisioned users in manageable batches.
4. Monitor for any errors during removal.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
2. Select **Admin Console**, then **Members**.
3. Identify and remove JIT-provisioned users in manageable batches.
4. Monitor for any errors during removal.
@z

@x
> [!TIP]
>
> To efficiently identify JIT users, compare the member list exported before
> SCIM was enabled with the current member list. Users who existed before SCIM
> was enabled were likely provisioned via JIT.
@y
> [!TIP]
>
> To efficiently identify JIT users, compare the member list exported before
> SCIM was enabled with the current member list. Users who existed before SCIM
> was enabled were likely provisioned via JIT.
@z

@x
#### Verify SCIM re-provisioning
@y
#### Verify SCIM re-provisioning
@z

@x
After removing JIT users, SCIM automatically re-creates user accounts:
@y
After removing JIT users, SCIM automatically re-creates user accounts:
@z

@x
1. In your identity provider system log, confirm "create app user" events for
   Docker.
2. In Docker Admin Console, confirm users reappear with SCIM provisioning.
3. Verify users are added to the correct teams via group mapping.
@y
1. In your identity provider system log, confirm "create app user" events for
   Docker.
2. In Docker Admin Console, confirm users reappear with SCIM provisioning.
3. Verify users are added to the correct teams via group mapping.
@z

@x
#### Validate user access
@y
#### Validate user access
@z

@x
Perform post-migration validation:
@y
Perform post-migration validation:
@z

@x
1. Select a subset of migrated users to test sign-in and access.
2. Verify team membership matches identity provider group assignments.
3. Confirm repository access is restored.
4. Test that de-provisioning works correctly by removing a test user from your
   identity provider.
@y
1. Select a subset of migrated users to test sign-in and access.
2. Verify team membership matches identity provider group assignments.
3. Confirm repository access is restored.
4. Test that de-provisioning works correctly by removing a test user from your
   identity provider.
@z

@x
Keep audit exports and logs for compliance purposes.
@y
Keep audit exports and logs for compliance purposes.
@z

@x
### Migration results
@y
### Migration results
@z

@x
After completing the migration:
@y
After completing the migration:
@z

@x
- All users in your organization are SCIM-provisioned
- User de-provisioning works reliably through your identity provider
- No new JIT users are created
- Consistent identity lifecycle management is maintained
@y
- All users in your organization are SCIM-provisioned
- User de-provisioning works reliably through your identity provider
- No new JIT users are created
- Consistent identity lifecycle management is maintained
@z

@x
### Troubleshoot migration issues
@y
### Troubleshoot migration issues
@z

@x
If a user fails to reappear after removal:
@y
If a user fails to reappear after removal:
@z

@x
1. Check that the user is assigned to the Docker application in your identity
   provider.
2. Verify SCIM is enabled in both Docker and your identity provider.
3. Trigger a manual SCIM sync in your identity provider.
4. Check provisioning logs in your identity provider for errors.
@y
1. Check that the user is assigned to the Docker application in your identity
   provider.
2. Verify SCIM is enabled in both Docker and your identity provider.
3. Trigger a manual SCIM sync in your identity provider.
4. Check provisioning logs in your identity provider for errors.
@z

@x
For more troubleshooting guidance, see
[Troubleshoot provisioning](/manuals/enterprise/troubleshoot/troubleshoot-provisioning.md).
@y
For more troubleshooting guidance, see
[Troubleshoot provisioning](manuals/enterprise/troubleshoot/troubleshoot-provisioning.md).
@z

@x
## Disable SCIM
@y
## Disable SCIM
@z

@x
If SCIM is disabled, any user provisioned through SCIM will remain in the
organization. Future changes for your users will not sync from your IdP.
User de-provisioning is only possible when manually removing the user from the
organization.
@y
If SCIM is disabled, any user provisioned through SCIM will remain in the
organization. Future changes for your users will not sync from your IdP.
User de-provisioning is only possible when manually removing the user from the
organization.
@z

@x
To disable SCIM:
@y
To disable SCIM:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon.
1. Select **Disable SCIM**.
@y
1. Sign in to [Docker Home](https://app.docker.com).
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** icon.
1. Select **Disable SCIM**.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Set up [Group mapping](/manuals/enterprise/security/provisioning/group-mapping.md).
- [Troubleshoot provisioning](/manuals/enterprise/troubleshoot/troubleshoot-provisioning.md).
@y
- Set up [Group mapping](manuals/enterprise/security/provisioning/group-mapping.md).
- [Troubleshoot provisioning](manuals/enterprise/troubleshoot/troubleshoot-provisioning.md).
@z
