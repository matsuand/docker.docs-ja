%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: System for Cross-domain Identity Management
keywords: SCIM, SSO
title: SCIM
direct_from:
- /docker-hub/company-scim/
- /docker-hub/scim/
- /admin/company/settings/scim/
- /admin/organization/security-settings/scim/
---
@y
---
description: System for Cross-domain Identity Management
keywords: SCIM, SSO
title: SCIM
direct_from:
- /docker-hub/company-scim/
- /docker-hub/scim/
- /admin/company/settings/scim/
- /admin/organization/security-settings/scim/
---
@z

@x
This section is for administrators who want to enable System for Cross-domain Identity Management (SCIM) 2.0 for their business. It is available for Docker Business customers.
@y
This section is for administrators who want to enable System for Cross-domain Identity Management (SCIM) 2.0 for their business. It is available for Docker Business customers.
@z

@x
SCIM provides automated user provisioning and de-provisioning for your Docker organization or company through your identity provider (IdP).  Once you enable SCIM in Docker and your IdP, any user assigned to the Docker application in the IdP is automatically provisioned in Docker and added to the organization or company.
@y
SCIM provides automated user provisioning and de-provisioning for your Docker organization or company through your identity provider (IdP).  Once you enable SCIM in Docker and your IdP, any user assigned to the Docker application in the IdP is automatically provisioned in Docker and added to the organization or company.
@z

@x
Similarly, if a user gets unassigned from the Docker application in the IdP, this removes the user from the organization or company in Docker. SCIM also synchronizes changes made to a user's attributes in the IdP, for example the user’s first name and last name.
@y
Similarly, if a user gets unassigned from the Docker application in the IdP, this removes the user from the organization or company in Docker. SCIM also synchronizes changes made to a user's attributes in the IdP, for example the user’s first name and last name.
@z

@x
The following lists the supported provisioning features:
 - Creating new users
 - Push user profile updates
 - Remove users
 - Deactivate users
 - Re-activate users
 - Group mapping
@y
The following lists the supported provisioning features:
 - Creating new users
 - Push user profile updates
 - Remove users
 - Deactivate users
 - Re-activate users
 - Group mapping
@z

@x
The following table lists the supported attributes. Note that your attribute mappings must match for SSO to prevent duplicating your members.
@y
The following table lists the supported attributes. Note that your attribute mappings must match for SSO to prevent duplicating your members.
@z

@x
| Attribute    | Description
|:---------------------------------------------------------------|:-------------------------------------------------------------------------------------------|
| userName             | User's primary email address. This is the unique identifier of the user. |
| name.givenName | User’s first name |
| name.familyName | User’s surname |
| active | Indicates if a user is enabled or disabled. Can be set to false to de-provision the user. |
@y
| Attribute    | Description
|:---------------------------------------------------------------|:-------------------------------------------------------------------------------------------|
| userName             | User's primary email address. This is the unique identifier of the user. |
| name.givenName | User’s first name |
| name.familyName | User’s surname |
| active | Indicates if a user is enabled or disabled. Can be set to false to de-provision the user. |
@z

@x
For additional details about supported attributes and SCIM, see [Docker Hub API SCIM reference](/docker-hub/api/latest/#tag/scim).
@y
For additional details about supported attributes and SCIM, see [Docker Hub API SCIM reference](/docker-hub/api/latest/#tag/scim).
@z

@x
## Set up SCIM
@y
## Set up SCIM
@z

@x
You must make sure you have [configured SSO](single-sign-on/configure/_index.md) before you enable SCIM. Enforcing SSO isn't required.
@y
You must make sure you have [configured SSO](single-sign-on/configure/_index.md) before you enable SCIM. Enforcing SSO isn't required.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-scim %}}
@y
{{% admin-scim %}}
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
{{% admin-scim product="admin" %}}
@y
{{% admin-scim product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
