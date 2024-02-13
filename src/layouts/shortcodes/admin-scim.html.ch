%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization or company.
   - Organization: Select **Organizations**, your organization, **Settings**, and then **Security**.
   - Company: Select **Organizations**, your company, and then **Settings**.` }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization or company.
   - Organization: Select **Organizations**, your organization, **Settings**, and then **Security**.
   - Company: Select **Organizations**, your company, and then **Settings**.` }}
@z

@x
{{ if eq (.Get "product") "admin" }}
{{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
{{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM.**" }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
{{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
{{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM.**" }}
{{ end }}
@z

@x
### Step one: Enable SCIM in Docker
@y
### Step one: Enable SCIM in Docker
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Actions** icon and **Setup SCIM**.
4. Copy the **SCIM Base URL** and **API Token** and paste the values into your IdP.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Actions** icon and **Setup SCIM**.
4. Copy the **SCIM Base URL** and **API Token** and paste the values into your IdP.
@z

@x
### Step two: Enable SCIM in your IdP
@y
### Step two: Enable SCIM in your IdP
@z

@x
Follow the instructions provided by your IdP:
@y
Follow the instructions provided by your IdP:
@z

@x
- [Okta](https://help.okta.com/en-us/Content/Topics/Apps/Apps_App_Integration_Wizard_SCIM.htm)
- [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/user-provisioning)
- [OneLogin](https://developers.onelogin.com/scim/create-app)
@y
- [Okta](https://help.okta.com/en-us/Content/Topics/Apps/Apps_App_Integration_Wizard_SCIM.htm)
- [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/user-provisioning)
- [OneLogin](https://developers.onelogin.com/scim/create-app)
@z

@x
## Set up role mapping
@y
## Set up role mapping
@z

@x
You can assign [roles](/security/for-admins/roles-and-permissions/) to members in your organization in the IdP. To set up a role, you can use optional user-level attributes for the person you want to assign a role. In addition to roles, you can set an organization and team to override the default provisioning values set by the SSO connection.
@y
You can assign [roles](__SUBDIR__/security/for-admins/roles-and-permissions/) to members in your organization in the IdP. To set up a role, you can use optional user-level attributes for the person you want to assign a role. In addition to roles, you can set an organization and team to override the default provisioning values set by the SSO connection.
@z

@x
> **Note**
>
> These mappings are supported for both SCIM and JIT provisioning. With JIT provisioning, role mapping only applies when a user is initially provisioned to the organization.
@y
> **Note**
>
> These mappings are supported for both SCIM and JIT provisioning. With JIT provisioning, role mapping only applies when a user is initially provisioned to the organization.
@z

@x
The following table lists the supported optional user-level attributes.
@y
The following table lists the supported optional user-level attributes.
@z

@x
| Attribute | Possible values    | Considerations |
| --------- | ------------------ | -------------- |
| `dockerRole` | `member`, `editor`, or `owner`. For a list of permissions for each role, see [Roles and permissions](/security/for-admins/roles-and-permissions/). | If you don't assign a role in the IdP, the value of the `dockerRole` attribute defaults to `member`. When you set the attribute, this overrides the default value. |
| `dockerOrg` | `organizationName`. For example, an organization named "moby" would be `moby`. | Setting this attribute overrides the default organization configured by the SSO connection. Also, this won't add the user to the default team. If this attribute isn't set, the user is provisioned to the default organization and the default team. If set and `dockerTeam` is also set, this provisions the user to the team within that org. |
| `dockerTeam` | `teamName`. For example, a team named "developers" would be `developers`. | Setting this attribute provisions the user to the default org and to the specified team, instead of the SSO connection's default team. This also creates the team if it doesn't exist. You can still use group mapping to provision users to teams in multiple orgs. See [Group mapping](/security/for-admins/group-mapping/). |
@y
| Attribute | Possible values    | Considerations |
| --------- | ------------------ | -------------- |
| `dockerRole` | `member`, `editor`, or `owner`. For a list of permissions for each role, see [Roles and permissions](__SUBDIR__/security/for-admins/roles-and-permissions/). | If you don't assign a role in the IdP, the value of the `dockerRole` attribute defaults to `member`. When you set the attribute, this overrides the default value. |
| `dockerOrg` | `organizationName`. For example, an organization named "moby" would be `moby`. | Setting this attribute overrides the default organization configured by the SSO connection. Also, this won't add the user to the default team. If this attribute isn't set, the user is provisioned to the default organization and the default team. If set and `dockerTeam` is also set, this provisions the user to the team within that org. |
| `dockerTeam` | `teamName`. For example, a team named "developers" would be `developers`. | Setting this attribute provisions the user to the default org and to the specified team, instead of the SSO connection's default team. This also creates the team if it doesn't exist. You can still use group mapping to provision users to teams in multiple orgs. See [Group mapping](__SUBDIR__/security/for-admins/group-mapping/). |
@z

@x
After you set the role in the IdP, you need to sync to push the changes to Docker.
@y
After you set the role in the IdP, you need to sync to push the changes to Docker.
@z

@x
The external namespace to use to set up these attributes is `urn:ietf:params:scim:schemas:extension:docker:2.0:User`.
@y
The external namespace to use to set up these attributes is `urn:ietf:params:scim:schemas:extension:docker:2.0:User`.
@z

@x
For how to add these attributes, see the documentation for your IdP:
@y
For how to add these attributes, see the documentation for your IdP:
@z

@x
- [Okta](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-add-custom-user-attributes.htm)
- [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes#provisioning-a-custom-extension-attribute-to-a-scim-compliant-application)
- [OneLogin](https://onelogin.service-now.com/support?id=kb_article&sys_id=742a000d4740f1909d8dfd1f536d435f&kb_category=566ffd6887332910695f0f66cebb3556#config-info-custom)
@y
- [Okta](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-add-custom-user-attributes.htm)
- [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes#provisioning-a-custom-extension-attribute-to-a-scim-compliant-application)
- [OneLogin](https://onelogin.service-now.com/support?id=kb_article&sys_id=742a000d4740f1909d8dfd1f536d435f&kb_category=566ffd6887332910695f0f66cebb3556#config-info-custom)
@z

@x
## Disable SCIM
@y
## Disable SCIM
@z

@x
If SCIM is disabled, any user provisioned through SCIM will remain in the organization. Future changes for your users will not sync from your IdP. User de-provisioning is only possible when manually removing the user from the organization.
@y
If SCIM is disabled, any user provisioned through SCIM will remain in the organization. Future changes for your users will not sync from your IdP. User de-provisioning is only possible when manually removing the user from the organization.
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Actions** icon.
4. Select **Disable SCIM**.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Actions** icon.
4. Select **Disable SCIM**.
@z
