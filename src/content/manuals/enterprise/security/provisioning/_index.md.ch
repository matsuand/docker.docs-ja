%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn about provisioning users for your SSO configuration.
keywords: provision users, provisioning, JIT, SCIM, group mapping, sso, docker admin, admin, security
title: Provision users
linkTitle: Provision
@y
description: Learn about provisioning users for your SSO configuration.
keywords: provision users, provisioning, JIT, SCIM, group mapping, sso, docker admin, admin, security
title: Provision users
linkTitle: Provision
@z

% grid:

@x
  - title: "Just-in-Time (JIT) provisioning"
    description: "Set up automatic user creation on first sign-in. Ideal for smaller teams with minimal setup requirements."
    icon: "schedule"
    link: "just-in-time/"
@y
  - title: "Just-in-Time (JIT) provisioning"
    description: "Set up automatic user creation on first sign-in. Ideal for smaller teams with minimal setup requirements."
    icon: "schedule"
    link: "just-in-time/"
@z

@x
  - title: "SCIM provisioning"
    description: "Enable continuous user data synchronization between your IdP and Docker. Best for larger organizations."
    icon: "sync"
    link: "scim/"
@y
  - title: "SCIM provisioning"
    description: "Enable continuous user data synchronization between your IdP and Docker. Best for larger organizations."
    icon: "sync"
    link: "scim/"
@z

@x
  - title: "Group mapping"
    description: "Configure role-based access control using IdP groups. Perfect for strict access control requirements."
    icon: "group"
    link: "group-mapping/"
@y
  - title: "Group mapping"
    description: "Configure role-based access control using IdP groups. Perfect for strict access control requirements."
    icon: "group"
    link: "group-mapping/"
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
After configuring your SSO connection, the next step is to provision users. This process ensures that users can access your organization through automated user management.
@y
After configuring your SSO connection, the next step is to provision users. This process ensures that users can access your organization through automated user management.
@z

@x
This page provides an overview of user provisioning and the supported provisioning methods.
@y
This page provides an overview of user provisioning and the supported provisioning methods.
@z

@x
## What is provisioning?
@y
## What is provisioning?
@z

@x
Provisioning helps manage users by automating tasks like account creation, updates, and deactivation based on data from your identity provider (IdP). There are three methods for user provisioning, each offering benefits for different organizational needs:
@y
Provisioning helps manage users by automating tasks like account creation, updates, and deactivation based on data from your identity provider (IdP). There are three methods for user provisioning, each offering benefits for different organizational needs:
@z

@x
| Provisioning method | Description | Default setting in Docker | Recommended for |
| :--- | :--- | :------------- | :--- |
| Just-in-Time (JIT) | Automatically creates and provisions user accounts when they first sign in via SSO | Enabled by default | Organizations needing minimal setup, smaller teams, or low-security environments |
| System for Cross-domain Identity Management (SCIM) | Continuously syncs user data between your IdP and Docker, ensuring user attributes remain updated without manual intervention | Disabled by default | Larger organizations or environments with frequent changes in user information or roles |
| Group mapping | Maps user groups from your IdP to specific roles and permissions within Docker, enabling fine-grained access control based on group membership | Disabled by default | Organizations requiring strict access control and role-based user management |
@y
| Provisioning method | Description | Default setting in Docker | Recommended for |
| :--- | :--- | :------------- | :--- |
| Just-in-Time (JIT) | Automatically creates and provisions user accounts when they first sign in via SSO | Enabled by default | Organizations needing minimal setup, smaller teams, or low-security environments |
| System for Cross-domain Identity Management (SCIM) | Continuously syncs user data between your IdP and Docker, ensuring user attributes remain updated without manual intervention | Disabled by default | Larger organizations or environments with frequent changes in user information or roles |
| Group mapping | Maps user groups from your IdP to specific roles and permissions within Docker, enabling fine-grained access control based on group membership | Disabled by default | Organizations requiring strict access control and role-based user management |
@z

@x
## Default provisioning setup
@y
## Default provisioning setup
@z

@x
By default, Docker enables JIT provisioning when you configure an SSO connection. With JIT enabled, user accounts are automatically created the first time a user signs in using your SSO flow.
@y
By default, Docker enables JIT provisioning when you configure an SSO connection. With JIT enabled, user accounts are automatically created the first time a user signs in using your SSO flow.
@z

@x
JIT provisioning may not provide sufficient control or security for some organizations. In such cases, SCIM or group mapping can be configured to give administrators more control over user access and attributes.
@y
JIT provisioning may not provide sufficient control or security for some organizations. In such cases, SCIM or group mapping can be configured to give administrators more control over user access and attributes.
@z

@x
## SSO attributes
@y
## SSO attributes
@z

@x
When a user signs in through SSO, Docker obtains several attributes from your IdP to manage the user's identity and permissions. These attributes include:
@y
When a user signs in through SSO, Docker obtains several attributes from your IdP to manage the user's identity and permissions. These attributes include:
@z

@x
- Email address: The unique identifier for the user
- Full name: The user's complete name
- Groups: Optional. Used for group-based access control
- Docker Org: Optional. Specifies the organization the user belongs to
- Docker Team: Optional. Defines the team the user belongs to within the organization
- Docker Role: Optional. Determines the user's permissions within Docker
- Docker session minutes: Optional. Sets the session duration before users must re-authenticate with their IdP. Must be a positive integer greater than 0. If not provided, default session timeouts apply
@y
- Email address: The unique identifier for the user
- Full name: The user's complete name
- Groups: Optional. Used for group-based access control
- Docker Org: Optional. Specifies the organization the user belongs to
- Docker Team: Optional. Defines the team the user belongs to within the organization
- Docker Role: Optional. Determines the user's permissions within Docker
- Docker session minutes: Optional. Sets the session duration before users must re-authenticate with their IdP. Must be a positive integer greater than 0. If not provided, default session timeouts apply
@z

@x
> [!NOTE]
>
> Default session timeouts apply when Docker session minutes is not specified. Docker Desktop sessions expire after 90 days or 30 days of inactivity. Docker Hub and Docker Home sessions expire after 24 hours.
@y
> [!NOTE]
>
> Default session timeouts apply when Docker session minutes is not specified. Docker Desktop sessions expire after 90 days or 30 days of inactivity. Docker Hub and Docker Home sessions expire after 24 hours.
@z

@x
## SAML attribute mapping
@y
## SAML attribute mapping
@z

@x
If your organization uses SAML for SSO, Docker retrieves these attributes from the SAML assertion message. Different IdPs may use different names for these attributes.
@y
If your organization uses SAML for SSO, Docker retrieves these attributes from the SAML assertion message. Different IdPs may use different names for these attributes.
@z

@x
| SSO Attribute	| SAML Assertion Message Attributes |
| :--- | :--- |
| Email address |	`"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"`, `email` |
| Full name	| `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"`, `name`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname"` |
| Groups (optional) |	`"http://schemas.xmlsoap.org/claims/Group"`, `"http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"`, `Groups`, `groups` |
| Docker Org (optional)	| `dockerOrg` |
| Docker Team (optional) |	`dockerTeam` |
| Docker Role (optional) |	`dockerRole` |
| Docker session minutes (optional) | `dockerSessionMinutes`, must be a positive integer > 0 |
@y
| SSO Attribute	| SAML Assertion Message Attributes |
| :--- | :--- |
| Email address |	`"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"`, `email` |
| Full name	| `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"`, `name`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname"`, `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname"` |
| Groups (optional) |	`"http://schemas.xmlsoap.org/claims/Group"`, `"http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"`, `Groups`, `groups` |
| Docker Org (optional)	| `dockerOrg` |
| Docker Team (optional) |	`dockerTeam` |
| Docker Role (optional) |	`dockerRole` |
| Docker session minutes (optional) | `dockerSessionMinutes`, must be a positive integer > 0 |
@z

@x
## Next steps
@y
## Next steps
@z

@x
Choose the provisioning method that best fits your organization's needs:
@y
Choose the provisioning method that best fits your organization's needs:
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
