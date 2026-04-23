%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Auto-provisioning
linkTitle: Auto-provision
description: Auto-provision users by associating members to your organization when email addresses match a verified domain.
keywords: user provisioning, just-in-time provisioning, JIT, autoprovision, Docker Admin, admin, security
@y
title: Auto-provisioning
linkTitle: Auto-provision
description: Auto-provision users by associating members to your organization when email addresses match a verified domain.
keywords: user provisioning, just-in-time provisioning, JIT, autoprovision, Docker Admin, admin, security
@z

@x
Auto-provisioning automatically adds users to your organization when they sign in with email addresses that match your verified domains. You must verify a domain before enabling auto-provisioning.
@y
Auto-provisioning automatically adds users to your organization when they sign in with email addresses that match your verified domains. You must verify a domain before enabling auto-provisioning.
@z

@x
> [!IMPORTANT]
>
> For domains that are part of an SSO connection, Just-in-Time (JIT) provisioning takes precedence over auto-provisioning when adding users to an organization.
@y
> [!IMPORTANT]
>
> For domains that are part of an SSO connection, Just-in-Time (JIT) provisioning takes precedence over auto-provisioning when adding users to an organization.
@z

@x
### Overview
@y
### Overview
@z

@x
When auto-provisioning is enabled for a verified domain:
@y
When auto-provisioning is enabled for a verified domain:
@z

@x
- Users who sign in to Docker with matching email addresses are automatically added to your organization.
- Auto-provisioning only adds existing Docker users to your organization, it doesn't create new accounts.
- Users experience no changes to their sign-in process.
- Company and organization owners receive email notifications when new users are added.
- You may need to [manage seats](/manuals/subscription/manage-seats.md) to accommodate new users.
@y
- Users who sign in to Docker with matching email addresses are automatically added to your organization.
- Auto-provisioning only adds existing Docker users to your organization, it doesn't create new accounts.
- Users experience no changes to their sign-in process.
- Company and organization owners receive email notifications when new users are added.
- You may need to [manage seats](manuals/subscription/manage-seats.md) to accommodate new users.
@z

@x
### Enable auto-provisioning
@y
### Enable auto-provisioning
@z

@x
Auto-provisioning is configured per domain. To enable it:
@y
Auto-provisioning is configured per domain. To enable it:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your company or organization.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to the domain you want to enable
auto-provisioning for.
1. Select **Enable auto-provisioning**.
1. Optional. If enabling auto-provisioning at the company level, select an
organization.
1. Select **Enable** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your company or organization.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to the domain you want to enable
auto-provisioning for.
1. Select **Enable auto-provisioning**.
1. Optional. If enabling auto-provisioning at the company level, select an
organization.
1. Select **Enable** to confirm.
@z

@x
The **Auto-provisioning** column will update to **Enabled** for the domain.
@y
The **Auto-provisioning** column will update to **Enabled** for the domain.
@z

@x
### Disable auto-provisioning
@y
### Disable auto-provisioning
@z

@x
To disable auto-provisioning for a user:
@y
To disable auto-provisioning for a user:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to your domain.
1. Select **Disable auto-provisioning**.
1. Select **Disable** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to your domain.
1. Select **Disable auto-provisioning**.
1. Select **Disable** to confirm.
@z

@x
## Next steps
@y
## Next steps
@z

@x
To choose a different method to provision users, you can set up:
@y
To choose a different method to provision users, you can set up:
@z

@x
- [SCIM provisioning](/manuals/enterprise/security/provisioning/scim/_index.md) for advanced user management.
- [Group mapping](/manuals/enterprise/security/provisioning/scim/group-mapping.md) to assign users to teams automatically.
@y
- [SCIM provisioning](manuals/enterprise/security/provisioning/scim/_index.md) for advanced user management.
- [Group mapping](manuals/enterprise/security/provisioning/scim/group-mapping.md) to assign users to teams automatically.
@z
