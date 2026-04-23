%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Migrate JIT to SCIM
linkTitle: Migrate
description: Learn how to migrate from just-in-time (JIT) to SCIM.
@y
title: Migrate JIT to SCIM
linkTitle: Migrate
description: Learn how to migrate from just-in-time (JIT) to SCIM.
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
## Why migrate
@y
## Why migrate
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
## Prerequisites
@y
## Prerequisites
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
## Prepare for migration
@y
## Prepare for migration
@z

@x
### Transfer ownership
@y
### Transfer ownership
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
### Verify identity provider configuration
@y
### Verify identity provider configuration
@z

@x
1. Confirm all JIT-provisioned users are assigned to the Docker application in
   your identity provider.
2. Verify identity provider group to Docker Team mappings are configured and
   tested.
@y
1. Confirm all JIT-provisioned users are assigned to the Docker application in
   your identity provider.
2. Verify identity provider group to Docker Team mappings are configured and
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
### Export user records
@y
### Export user records
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
## Complete the migration
@y
## Complete the migration
@z

@x
### Disable JIT provisioning
@y
### Disable JIT provisioning
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
### Remove JIT-origin users
@y
### Remove JIT-origin users
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
### Verify SCIM re-provisioning
@y
### Verify SCIM re-provisioning
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
### Validate user access
@y
### Validate user access
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
## Migration results
@y
## Migration results
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
## Troubleshoot migration issues
@y
## Troubleshoot migration issues
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
[Troubleshoot provisioning](/manuals/enterprise/security/provisioning/troubleshoot-provisioning.md).
@y
For more troubleshooting guidance, see
[Troubleshoot provisioning](manuals/enterprise/security/provisioning/troubleshoot-provisioning.md).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Set up [Group mapping](/manuals/enterprise/security/provisioning/scim/group-mapping.md).
- [Assign roles](/manuals/enterprise/security/roles-and-permissions/core-roles.md) to members of your org.
- [Enforce sign in](/manuals/enterprise/security/enforce-sign-in.md), if needed.
@y
- Set up [Group mapping](manuals/enterprise/security/provisioning/scim/group-mapping.md).
- [Assign roles](manuals/enterprise/security/roles-and-permissions/core-roles.md) to members of your org.
- [Enforce sign in](manuals/enterprise/security/enforce-sign-in.md), if needed.
@z
