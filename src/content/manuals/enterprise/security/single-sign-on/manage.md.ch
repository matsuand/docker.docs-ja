%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage single sign-on
linkTitle: Manage
description: Learn how to manage Single Sign-On for your organization or company.
keywords: manage, single sign-on, SSO, sign-on, admin console, admin, security, domains, connections, users, provisioning
@y
title: Manage single sign-on
linkTitle: Manage
description: Learn how to manage Single Sign-On for your organization or company.
keywords: manage, single sign-on, SSO, sign-on, admin console, admin, security, domains, connections, users, provisioning
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
This page covers how to manage single sign-on (SSO) after initial setup,
including managing domains, connections, users, and provisioning
settings.
@y
This page covers how to manage single sign-on (SSO) after initial setup,
including managing domains, connections, users, and provisioning
settings.
@z

@x
## Manage domains
@y
## Manage domains
@z

@x
### Add a domain
@y
### Add a domain
@z

@x
To add a domain to an existing SSO connection:
@y
To add a domain to an existing SSO connection:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company or
organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the SSO connections table, select the **Actions** menu for your
connection, then select **Edit connection**.
1. Select **Next** to navigate to the domains section.
1. In the **Domains** section, select **Add domain**.
1. Enter the domain you want to add to the connection.
1. Select **Next** to confirm or change the connected organizations.
1. Select **Next** to confirm or change the default organization and
team provisioning selections.
1. Review the connection details and select **Update connection**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company or
organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the SSO connections table, select the **Actions** menu for your
connection, then select **Edit connection**.
1. Select **Next** to navigate to the domains section.
1. In the **Domains** section, select **Add domain**.
1. Enter the domain you want to add to the connection.
1. Select **Next** to confirm or change the connected organizations.
1. Select **Next** to confirm or change the default organization and
team provisioning selections.
1. Review the connection details and select **Update connection**.
@z

@x
### Remove a domain from an SSO connection
@y
### Remove a domain from an SSO connection
@z

@x
> [!IMPORTANT]
>
> If you use multiple identity providers with the same domain, you must remove the domain from each SSO connection individually.
@y
> [!IMPORTANT]
>
> If you use multiple identity providers with the same domain, you must remove the domain from each SSO connection individually.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** menu for your connection, then
**Edit connection**.
1. Select **Next** to navigate to the domains section.
1. In the **Domain** section, select the **X** icon next to the domain
you want to remove.
1. Select **Next** to confirm or change the connected organizations.
1. Select **Next** to confirm or change the default organization and
team provisioning selections.
1. Review the connection details and select **Update connection**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** menu for your connection, then
**Edit connection**.
1. Select **Next** to navigate to the domains section.
1. In the **Domain** section, select the **X** icon next to the domain
you want to remove.
1. Select **Next** to confirm or change the connected organizations.
1. Select **Next** to confirm or change the default organization and
team provisioning selections.
1. Review the connection details and select **Update connection**.
@z

@x
> [!NOTE]
>
> When you re-add a domain, Docker assigns a new TXT record value. You must complete domain verification again with the new TXT record.
@y
> [!NOTE]
>
> When you re-add a domain, Docker assigns a new TXT record value. You must complete domain verification again with the new TXT record.
@z

@x
## Manage SSO connections
@y
## Manage SSO connections
@z

@x
### View connections
@y
### View connections
@z

@x
To view all configured SSO connections:
@y
To view all configured SSO connections:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. View all configured connections in the **SSO connections** table.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. View all configured connections in the **SSO connections** table.
@z

@x
### Edit a connection
@y
### Edit a connection
@z

@x
To modify an existing SSO connection:
@y
To modify an existing SSO connection:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** menu for your connection, then
**Edit connection**.
1. Follow the on-screen instructions to modify your connection settings.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** menu for your connection, then
**Edit connection**.
1. Follow the on-screen instructions to modify your connection settings.
@z

@x
### Delete a connection
@y
### Delete a connection
@z

@x
To remove an SSO connection:
@y
To remove an SSO connection:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** menu for your connection, then
**Delete connection**.
1. Follow the on-screen instructions to confirm the deletion.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your company or organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Actions** menu for your connection, then
**Delete connection**.
1. Follow the on-screen instructions to confirm the deletion.
@z

@x
> [!WARNING]
>
> Deleting an SSO connection removes access for all users who authenticate through
that connection.
@y
> [!WARNING]
>
> Deleting an SSO connection removes access for all users who authenticate through
that connection.
@z

@x
## Manage users and provisioning
@y
## Manage users and provisioning
@z

@x
Docker automatically provisions users through Just-in-Time (JIT) provisioning when they sign in via SSO. You can also manually manage users and configure different provisioning methods.
@y
Docker automatically provisions users through Just-in-Time (JIT) provisioning when they sign in via SSO. You can also manually manage users and configure different provisioning methods.
@z

@x
### How provisioning works
@y
### How provisioning works
@z

@x
Docker supports the following provisioning methods:
@y
Docker supports the following provisioning methods:
@z

@x
- JIT provisioning (default): Users are automatically added to your organization
when they sign in via SSO
- SCIM provisioning: Sync users and groups from your identity provider to Docker
- Group mapping: Sync user groups from your identity provider with teams in your Docker organization
- Manual provisioning: Turn off automatic provisioning and manually invite users
@y
- JIT provisioning (default): Users are automatically added to your organization
when they sign in via SSO
- SCIM provisioning: Sync users and groups from your identity provider to Docker
- Group mapping: Sync user groups from your identity provider with teams in your Docker organization
- Manual provisioning: Turn off automatic provisioning and manually invite users
@z

@x
For more information on provisioning methods, see [Provision users](/manuals/enterprise/security/provisioning/_index.md).
@y
For more information on provisioning methods, see [Provision users](manuals/enterprise/security/provisioning/_index.md).
@z

@x
### Add guest users
@y
### Add guest users
@z

@x
To invite users who don't authenticate through your identity provider:
@y
To invite users who don't authenticate through your identity provider:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization.
1. Select **Members**.
1. Select **Invite**.
1. Follow the on-screen instructions to invite the user.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization.
1. Select **Members**.
1. Select **Invite**.
1. Follow the on-screen instructions to invite the user.
@z

@x
The user receives an email invitation and can create a Docker account or sign
in with their existing account.
@y
The user receives an email invitation and can create a Docker account or sign
in with their existing account.
@z

@x
### Remove users
@y
### Remove users
@z

@x
To remove a user from your organization:
@y
To remove a user from your organization:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization.
1. Select **Members**.
1. Find the user you want to remove and select the **Actions** menu next to their name.
1. Select **Remove** and confirm the removal.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization.
1. Select **Members**.
1. Find the user you want to remove and select the **Actions** menu next to their name.
1. Select **Remove** and confirm the removal.
@z

@x
The user loses access to your organization immediately upon removal.
@y
The user loses access to your organization immediately upon removal.
@z
