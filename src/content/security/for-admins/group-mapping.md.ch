%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Group mapping for administrators
keywords: Group Mapping, SCIM, Docker Hub, Docker Admin, admin, security
title: Group Mapping
aliases:
- /admin/company/settings/group-mapping/
- /admin/organization/security-settings/group-mapping/
- /docker-hub/group-mapping/
---
@y
---
description: Group mapping for administrators
keywords: Group Mapping, SCIM, Docker Hub, Docker Admin, admin, security
title: Group Mapping
aliases:
- /admin/company/settings/group-mapping/
- /admin/organization/security-settings/group-mapping/
- /docker-hub/group-mapping/
---
@z

@x
With directory group-to-team provisioning from your IdP, user updates will automatically sync with your Docker organizations and teams.
@y
With directory group-to-team provisioning from your IdP, user updates will automatically sync with your Docker organizations and teams.
@z

@x
> **Tip**
>
> Group mapping is ideal for adding a user to multiple organizations or multiple teams within one organization. If you don't need to set up multi-organization or multi-team assignment, you can use [user-level attributes](scim.md#set-up-role-mapping).
{ .tip }
@y
> **Tip**
>
> Group mapping is ideal for adding a user to multiple organizations or multiple teams within one organization. If you don't need to set up multi-organization or multi-team assignment, you can use [user-level attributes](scim.md#set-up-role-mapping).
{ .tip }
@z

@x
## How group mapping works
@y
## How group mapping works
@z

@x
IdPs share with Docker the main attributes of every authorized user through SSO, such as email address, name, surname, and groups. Just-In-Time (JIT) Provisioning uses these attributes to create or update the user’s Docker profile and their associations with organizations and teams on Docker Hub.
@y
IdPs share with Docker the main attributes of every authorized user through SSO, such as email address, name, surname, and groups. Just-In-Time (JIT) Provisioning uses these attributes to create or update the user’s Docker profile and their associations with organizations and teams on Docker Hub.
@z

@x
Docker uses the email address of the user to identify them on the platform. Every Docker account must have a unique email address at all times.
@y
Docker uses the email address of the user to identify them on the platform. Every Docker account must have a unique email address at all times.
@z

@x
### SSO authentication with JIT provisioning enabled
@y
### SSO authentication with JIT provisioning enabled
@z

@x
After every successful SSO sign-in authentication, the JIT provisioner performs the following actions:
@y
After every successful SSO sign-in authentication, the JIT provisioner performs the following actions:
@z

@x
1. Checks if there's an existing Docker account with the email address of the user that just authenticated.
@y
1. Checks if there's an existing Docker account with the email address of the user that just authenticated.
@z

@x
   a) If no account is found with the same email address, it creates a new Docker account using basic user attributes (email, name, and surname). The JIT provisioner generates a new username for this new account by using the email, name, and random numbers to make sure that all account usernames are unique in the platform.
@y
   a) If no account is found with the same email address, it creates a new Docker account using basic user attributes (email, name, and surname). The JIT provisioner generates a new username for this new account by using the email, name, and random numbers to make sure that all account usernames are unique in the platform.
@z

@x
   b) If an account exists for this email address, it uses this account and updates the full name of the user’s profile if needed.
@y
   b) If an account exists for this email address, it uses this account and updates the full name of the user’s profile if needed.
@z

@x
2. Checks for any pending invitations to the SSO organization to auto-accept the invitation. If the invitation is specific to a group, the user is added to the invited group along with group mappings in the following step.
@y
2. Checks for any pending invitations to the SSO organization to auto-accept the invitation. If the invitation is specific to a group, the user is added to the invited group along with group mappings in the following step.
@z

@x
3. Checks if the IdP shared group mappings while authenticating the user.
@y
3. Checks if the IdP shared group mappings while authenticating the user.
@z

@x
   a) If the IdP provided group mappings for the user, the user gets added to the organizations and teams indicated by the group mappings.
@y
   a) If the IdP provided group mappings for the user, the user gets added to the organizations and teams indicated by the group mappings.
@z

@x
   b) If the IdP didn't provide group mappings, it checks if the user is already a member of the organization, or if the SSO connection is for multiple organizations (only at company level) and if the user is a member of any of those organizations. If the user isn't a member, it adds the user to the default team and organization configured in the SSO connection.
@y
   b) If the IdP didn't provide group mappings, it checks if the user is already a member of the organization, or if the SSO connection is for multiple organizations (only at company level) and if the user is a member of any of those organizations. If the user isn't a member, it adds the user to the default team and organization configured in the SSO connection.
@z

@x
![JIT provisioning enabled](../images/jit-enabled-flow.svg)
@y
![JIT provisioning enabled](../images/jit-enabled-flow.svg)
@z

@x
### SSO authentication with JIT provisioning disabled
@y
### SSO authentication with JIT provisioning disabled
@z

@x
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning is available in Private Beta when you use the Admin Console. If you're participating in this program, you have the option to turn off this default provisioning and disable JIT. This configuration is recommended if you're using SCIM to auto-provision users.
{ .experimental }
@y
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning is available in Private Beta when you use the Admin Console. If you're participating in this program, you have the option to turn off this default provisioning and disable JIT. This configuration is recommended if you're using SCIM to auto-provision users.
{ .experimental }
@z

@x
When you opt to disable JIT provisioning in your SSO connection, the following actions occur:
@y
When you opt to disable JIT provisioning in your SSO connection, the following actions occur:
@z

@x
1. Checks if there's an existing Docker account with the email address of the user that just authenticated.
@y
1. Checks if there's an existing Docker account with the email address of the user that just authenticated.
@z

@x
   a) If no account is found with the same email address, it creates a new Docker account using basic user attributes (email, name, and surname). Authentication with SSO generates a new username for this new account by using the email, name, and random numbers to make sure that all account usernames are unique in the platform.
@y
   a) If no account is found with the same email address, it creates a new Docker account using basic user attributes (email, name, and surname). Authentication with SSO generates a new username for this new account by using the email, name, and random numbers to make sure that all account usernames are unique in the platform.
@z

@x
   b) If an account exists for this email address, it uses this account and updates the full name of the user’s profile if needed.
@y
   b) If an account exists for this email address, it uses this account and updates the full name of the user’s profile if needed.
@z

@x
2. Checks if there are any pending invitations to the SSO organization (or, SSO organizations if the SSO connection is managed at the company level) in order to auto-accept the invitation.
@y
2. Checks if there are any pending invitations to the SSO organization (or, SSO organizations if the SSO connection is managed at the company level) in order to auto-accept the invitation.
@z

@x
   a) If the user isn't already a member of the organization, or doesn't have a pending invitation to join, sign in fails and the user encounters an `Access denied` error. This blocks the user from joining the organization. They need to contact an administrator to invite them to join.
@y
   a) If the user isn't already a member of the organization, or doesn't have a pending invitation to join, sign in fails and the user encounters an `Access denied` error. This blocks the user from joining the organization. They need to contact an administrator to invite them to join.
@z

@x
   b) If the user is a member of the organization, or has a pending invitation to join, then sign in is successful.
@y
   b) If the user is a member of the organization, or has a pending invitation to join, then sign in is successful.
@z

@x
If you disable JIT provisioning when you create or edit your SSO connection, you can still use group mapping as long as you have also [enabled SCIM](/security/for-admins/scim/#enable-scim-in-docker). When JIT provisioning is disabled and SCIM isn't enabled, users won't be auto-provisioned to groups. For instructions on disabling JIT provisioning, see [Manage how users are provisioned](/security/for-admins/single-sign-on/manage/#manage-how-users-are-provisioned).
@y
If you disable JIT provisioning when you create or edit your SSO connection, you can still use group mapping as long as you have also [enabled SCIM](/security/for-admins/scim/#enable-scim-in-docker). When JIT provisioning is disabled and SCIM isn't enabled, users won't be auto-provisioned to groups. For instructions on disabling JIT provisioning, see [Manage how users are provisioned](/security/for-admins/single-sign-on/manage/#manage-how-users-are-provisioned).
@z

@x
![JIT provisioning disabled](../images/jit-disabled-flow.svg)
@y
![JIT provisioning disabled](../images/jit-disabled-flow.svg)
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
You can use this format to add a user to multiple organizations. For example, if you want to add a user to the "backend" team in the "moby" organization as well as the "desktop" team in the "docker" organization, the format would be: `moby:backend` and `docker:desktop`.
@y
You can use this format to add a user to multiple organizations. For example, if you want to add a user to the "backend" team in the "moby" organization as well as the "desktop" team in the "docker" organization, the format would be: `moby:backend` and `docker:desktop`.
@z

@x
>**Tip**
>
>Use the same names for the Docker teams as your group names in the IdP to prevent further configuration. When you sync groups, this creates a group if it doesn’t already exist.
{ .tip}
@y
>**Tip**
>
>Use the same names for the Docker teams as your group names in the IdP to prevent further configuration. When you sync groups, this creates a group if it doesn’t already exist.
{ .tip}
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
To take advantage of group mapping, follow the instructions provided by your IdP:
@y
To take advantage of group mapping, follow the instructions provided by your IdP:
@z

@x
- [Okta](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm)
- [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes)
- [OneLogin](https://developers.onelogin.com/scim/create-app)
@y
- [Okta](https://help.okta.com/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm)
- [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/customize-application-attributes)
- [OneLogin](https://developers.onelogin.com/scim/create-app)
@z

@x
Once complete, a user who signs in to Docker through SSO is automatically added to the organizations and teams mapped in the IdP.
@y
Once complete, a user who signs in to Docker through SSO is automatically added to the organizations and teams mapped in the IdP.
@z

@x
> **Tip**
>
> [Enable SCIM](scim.md) to take advantage of automatic user provisioning and de-provisioning. If you don't enable SCIM users are only automatically provisioned. You have to de-provision them manually.
{ .tip }
@y
> **Tip**
>
> [Enable SCIM](scim.md) to take advantage of automatic user provisioning and de-provisioning. If you don't enable SCIM users are only automatically provisioned. You have to de-provision them manually.
{ .tip }
@z
