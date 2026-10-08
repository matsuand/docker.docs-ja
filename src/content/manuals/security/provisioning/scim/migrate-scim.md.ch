%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Migrate JIT to SCIM
linkTitle: Migrate
description: >-
  Move from Just-in-Time provisioning to SCIM so your identity provider
  manages Docker user lifecycle.
keywords: JIT to SCIM migration, SCIM provisioning, user deprovisioning,
  identity provider, Docker Home, user lifecycle management
@y
title: Migrate JIT to SCIM
linkTitle: Migrate
description: >-
  Move from Just-in-Time provisioning to SCIM so your identity provider
  manages Docker user lifecycle.
keywords: JIT to SCIM migration, SCIM provisioning, user deprovisioning,
  identity provider, Docker Home, user lifecycle management
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Move from Just-in-Time (JIT) provisioning to System for Cross-domain Identity
Management (SCIM) as the only source of user provisioning. After SCIM is
enabled, it can manage organization members whose email domain is verified on
the SSO connection, including users created through JIT. When your identity
provider (IdP) pushes a user with a matching email address, SCIM links the
existing Docker account.
@y
Move from Just-in-Time (JIT) provisioning to System for Cross-domain Identity
Management (SCIM) as the only source of user provisioning. After SCIM is
enabled, it can manage organization members whose email domain is verified on
the SSO connection, including users created through JIT. When your identity
provider (IdP) pushes a user with a matching email address, SCIM links the
existing Docker account.
@z

@x
## Why migrate
@y
## Why migrate
@z

@x
With JIT turned off, your identity provider stays authoritative for who has
access:
@y
With JIT turned off, your identity provider stays authoritative for who has
access:
@z

@x
- Users are deprovisioned when they leave your organization
- User attributes and group membership stay synchronized with the IdP
@y
- Users are deprovisioned when they leave your organization
- User attributes and group membership stay synchronized with the IdP
@z

@x
Docker recommends SCIM with JIT turned off. If your IdP supports Provision
on Demand, use it when a user needs access before the next scheduled
synchronization.
@y
Docker recommends SCIM with JIT turned off. If your IdP supports Provision
on Demand, use it when a user needs access before the next scheduled
synchronization.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you migrate:
@y
Before you migrate:
@z

@x
- [Set up and test SCIM](provision-scim.md) in Docker and your IdP.
- Confirm each user's email address matches exactly between the IdP and
  Docker.
- In the IdP, set the group memberships and any `dockerRole` values you want
  to keep.
@y
- [Set up and test SCIM](provision-scim.md) in Docker and your IdP.
- Confirm each user's email address matches exactly between the IdP and
  Docker.
- In the IdP, set the group memberships and any `dockerRole` values you want
  to keep.
@z

@x
## Assign users in your IdP
@y
## Assign users in your IdP
@z

@x
1. Assign every user who should belong to the Docker organization to the
   Docker application in your IdP.
1. Confirm that group-to-team mappings are configured and tested. See
   [Group mapping](group-mapping.md).
@y
1. Assign every user who should belong to the Docker organization to the
   Docker application in your IdP.
1. Confirm that group-to-team mappings are configured and tested. See
   [Group mapping](group-mapping.md).
@z

@x
When a user isn't assigned to the Docker application, the next
synchronization deactivates the Docker account.
@y
When a user isn't assigned to the Docker application, the next
synchronization deactivates the Docker account.
@z

@x
## Sync and verify
@y
## Sync and verify
@z

@x
Trigger a synchronization, or use Provision on Demand, so SCIM links the
existing accounts.
@y
Trigger a synchronization, or use Provision on Demand, so SCIM links the
existing accounts.
@z

@x
1. In your IdP's provisioning logs, confirm that provisioning succeeded for
   those users.
1. In [Docker Home](https://app.docker.com), select your organization, then
   **Members**.
1. Confirm that the users are still members and that their roles and teams
   match the IdP.
@y
1. In your IdP's provisioning logs, confirm that provisioning succeeded for
   those users.
1. In [Docker Home](https://app.docker.com), select your organization, then
   **Members**.
1. Confirm that the users are still members and that their roles and teams
   match the IdP.
@z

@x
To compare the Docker member list with the IdP, export it:
@y
To compare the Docker member list with the IdP, export it:
@z

@x
1. On the **Members** page, select **Export members**.
1. Docker emails you a link to download the CSV file.
@y
1. On the **Members** page, select **Export members**.
1. Docker emails you a link to download the CSV file.
@z

@x
## Disable JIT provisioning
@y
## Disable JIT provisioning
@z

@x
Turn off JIT after you have verified the linked accounts. You can turn off
JIT only while SCIM is enabled.
@y
Turn off JIT after you have verified the linked accounts. You can turn off
JIT only while SCIM is enabled.
@z

@x
1. Go to [Docker Home](https://app.docker.com/) and select your organization
   from the top-left account drop-down.
1. Select **Identity & auth**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Action** icon, then select
   **Disable JIT provisioning**.
1. Select **Disable** to confirm.
@y
1. Go to [Docker Home](https://app.docker.com/) and select your organization
   from the top-left account drop-down.
1. Select **Identity & auth**, then **SSO and SCIM**.
1. In the **SSO connections** table, select the **Action** icon, then select
   **Disable JIT provisioning**.
1. Select **Disable** to confirm.
@z

@x
With JIT turned off, users must already be members, have a pending
invitation, or be provisioned through SCIM.
@y
With JIT turned off, users must already be members, have a pending
invitation, or be provisioned through SCIM.
@z

@x
## Resolve an unlinked account
@y
## Resolve an unlinked account
@z

@x
Members whose email domain isn't verified on the SSO connection stay outside
SCIM. A different email address in the IdP also leaves the existing Docker
account unlinked.
@y
Members whose email domain isn't verified on the SSO connection stay outside
SCIM. A different email address in the IdP also leaves the existing Docker
account unlinked.
@z

@x
1. Compare the email address in the IdP with the Docker account.
1. Confirm that the user's email domain is verified on the SSO connection.
1. Assign the user to the Docker application and run provisioning again.
1. Confirm the user under **Members**.
@y
1. Compare the email address in the IdP with the Docker account.
1. Confirm that the user's email domain is verified on the SSO connection.
1. Assign the user to the Docker application and run provisioning again.
1. Confirm the user under **Members**.
@z

@x
If the account is still unlinked, remove that user so SCIM can provision
them again.
@y
If the account is still unlinked, remove that user so SCIM can provision
them again.
@z

@x
> [!WARNING]
>
> Removing a user removes their resource ownership, such as repositories.
> Transfer ownership before you remove the user. Don't remove the only
> organization owner. Assign the Owner role to another member first.
@y
> [!WARNING]
>
> Removing a user removes their resource ownership, such as repositories.
> Transfer ownership before you remove the user. Don't remove the only
> organization owner. Assign the Owner role to another member first.
@z

@x
1. In Docker Home, select **Members** and remove the user.
1. Trigger provisioning from your IdP.
1. Confirm that the user reappears with the expected role and teams.
@y
1. In Docker Home, select **Members** and remove the user.
1. Trigger provisioning from your IdP.
1. Confirm that the user reappears with the expected role and teams.
@z

@x
For more troubleshooting guidance, see
[Troubleshoot provisioning](/manuals/security/provisioning/troubleshoot-provisioning.md).
@y
For more troubleshooting guidance, see
[Troubleshoot provisioning](manuals/security/provisioning/troubleshoot-provisioning.md).
@z

@x
## Migration results
@y
## Migration results
@z

@x
After you turn off JIT:
@y
After you turn off JIT:
@z

@x
- SCIM manages linked users, including users originally created through JIT
- Your IdP deprovisions users by deactivating their Docker accounts
- Sign-in no longer adds users through JIT
@y
- SCIM manages linked users, including users originally created through JIT
- Your IdP deprovisions users by deactivating their Docker accounts
- Sign-in no longer adds users through JIT
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Set up [group mapping](/manuals/security/provisioning/scim/group-mapping.md).
- [Assign roles](/manuals/security/roles-and-permissions/core-roles.md) to
  organization members.
- [Enforce sign-in](/manuals/desktop/enterprise/enforce-sign-in/_index.md) for
  your organization.
@y
- Set up [group mapping](manuals/security/provisioning/scim/group-mapping.md).
- [Assign roles](manuals/security/roles-and-permissions/core-roles.md) to
  organization members.
- [Enforce sign-in](manuals/desktop/enterprise/enforce-sign-in/_index.md) for
  your organization.
@z
