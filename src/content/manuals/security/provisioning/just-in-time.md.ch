%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how Just-in-Time provisioning works with your SSO connection.
keywords: user provisioning, just-in-time provisioning, JIT, autoprovision, Docker Admin, admin, security
title: Just-in-Time provisioning
linkTitle: Just-in-Time
@y
description: Learn how Just-in-Time provisioning works with your SSO connection.
keywords: user provisioning, just-in-time provisioning, JIT, autoprovision, Docker Admin, admin, security
title: Just-in-Time provisioning
linkTitle: Just-in-Time
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Just-in-Time (JIT) provisioning creates and updates user accounts during SSO
authentication. JIT verifies that users belong to the organization and assigns
them to teams based on your identity provider (IdP) configuration. JIT doesn't
deprovision users.
@y
Just-in-Time (JIT) provisioning creates and updates user accounts during SSO
authentication. JIT verifies that users belong to the organization and assigns
them to teams based on your identity provider (IdP) configuration. JIT doesn't
deprovision users.
@z

@x
When you create an SSO connection, Docker turns on JIT provisioning by
default. Before adding SCIM, review
[how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
@y
When you create an SSO connection, Docker turns on JIT provisioning by
default. Before adding SCIM, review
[how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit).
@z

@x
This page explains the SSO authentication flows with JIT turned on and off.
@y
This page explains the SSO authentication flows with JIT turned on and off.
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
## SSO authentication with JIT provisioning enabled
@y
## SSO authentication with JIT provisioning enabled
@z

@x
When a user signs in with SSO and you have JIT provisioning enabled, the
following steps occur automatically:
@y
When a user signs in with SSO and you have JIT provisioning enabled, the
following steps occur automatically:
@z

@x
1. The system checks if a Docker account exists for the user's email address.
   - If an account exists: The system uses the existing account and updates
     the user's full name if necessary.
   - If no account exists: A new Docker account is created using basic user
     attributes (email, name, and surname). A unique username is generated
     based on the user's email, name, and random numbers to ensure all
     usernames are unique across the platform.
@y
1. The system checks if a Docker account exists for the user's email address.
   - If an account exists: The system uses the existing account and updates
     the user's full name if necessary.
   - If no account exists: A new Docker account is created using basic user
     attributes (email, name, and surname). A unique username is generated
     based on the user's email, name, and random numbers to ensure all
     usernames are unique across the platform.
@z

@x
1. The system checks for any pending invitations to the SSO organization.
   - Invitation found: The invitation is automatically accepted.
   - Invitation includes a specific group: The user is added to that group
     within the SSO organization.
@y
1. The system checks for any pending invitations to the SSO organization.
   - Invitation found: The invitation is automatically accepted.
   - Invitation includes a specific group: The user is added to that group
     within the SSO organization.
@z

@x
1. The system verifies if the IdP has shared group mappings during
   authentication.
   - Group mappings provided: The user is assigned to the relevant
     organizations and teams.
   - No group mappings provided: The system checks if the user is already
     part of the organization. If not, the user is added to the default
     organization and team configured in the SSO connection.
@y
1. The system verifies if the IdP has shared group mappings during
   authentication.
   - Group mappings provided: The user is assigned to the relevant
     organizations and teams.
   - No group mappings provided: The system checks if the user is already
     part of the organization. If not, the user is added to the default
     organization and team configured in the SSO connection.
@z

@x
The following graphic provides an overview of SSO authentication with JIT
enabled:
@y
The following graphic provides an overview of SSO authentication with JIT
enabled:
@z

@x
![JIT provisioning enabled workflow](../images/jit-enabled-flow.svg)
@y
![JIT provisioning enabled workflow](../images/jit-enabled-flow.svg)
@z

@x
## SSO authentication with JIT provisioning disabled
@y
## SSO authentication with JIT provisioning disabled
@z

@x
When JIT provisioning is disabled, the following actions occur during SSO
authentication:
@y
When JIT provisioning is disabled, the following actions occur during SSO
authentication:
@z

@x
1. The system checks if a Docker account exists for the user's email address.
   - If an account exists: The system uses the existing account and updates
     the user's full name if necessary.
   - If no account exists: A new Docker account is created using basic user
     attributes (email, name, and surname). A unique username is generated
     based on the user's email, name, and random numbers to ensure all
     usernames are unique across the platform.
@y
1. The system checks if a Docker account exists for the user's email address.
   - If an account exists: The system uses the existing account and updates
     the user's full name if necessary.
   - If no account exists: A new Docker account is created using basic user
     attributes (email, name, and surname). A unique username is generated
     based on the user's email, name, and random numbers to ensure all
     usernames are unique across the platform.
@z

@x
1. The system checks for any pending invitations to the SSO organization.
   - Invitation found: If the user is a member of the organization or has a
     pending invitation, sign-in is successful, and the invitation is
     automatically accepted.
   - No invitation found: If the user is not a member of the organization and
     has no pending invitation, the sign-in fails, and an `Access denied`
     error appears. The user must contact an administrator to be invited to
     the organization.
@y
1. The system checks for any pending invitations to the SSO organization.
   - Invitation found: If the user is a member of the organization or has a
     pending invitation, sign-in is successful, and the invitation is
     automatically accepted.
   - No invitation found: If the user is not a member of the organization and
     has no pending invitation, the sign-in fails, and an `Access denied`
     error appears. The user must contact an administrator to be invited to
     the organization.
@z

@x
With JIT disabled, group mapping is only available if you have
[SCIM enabled](/manuals/security/provisioning/scim/provision-scim.md#enable-scim-in-docker).
If SCIM is not enabled, users won't be auto-provisioned to groups.
@y
With JIT disabled, group mapping is only available if you have
[SCIM enabled](manuals/security/provisioning/scim/provision-scim.md#enable-scim-in-docker).
If SCIM is not enabled, users won't be auto-provisioned to groups.
@z

@x
The following graphic provides an overview of SSO authentication with JIT
disabled:
@y
The following graphic provides an overview of SSO authentication with JIT
disabled:
@z

@x
![JIT provisioning disabled workflow](../images/jit-disabled-flow.svg)
@y
![JIT provisioning disabled workflow](../images/jit-disabled-flow.svg)
@z

@x
## Disable JIT provisioning
@y
## Disable JIT provisioning
@z

@x
> [!WARNING]
>
> Disabling JIT provisioning may disrupt your users' access and workflows. With
> JIT disabled, users aren't automatically added to your organization during
> SSO sign-in. Users must be organization members, have pending invitations, or
> be provisioned through SCIM to sign in successfully.
@y
> [!WARNING]
>
> Disabling JIT provisioning may disrupt your users' access and workflows. With
> JIT disabled, users aren't automatically added to your organization during
> SSO sign-in. Users must be organization members, have pending invitations, or
> be provisioned through SCIM to sign in successfully.
@z

@x
You may want to disable JIT provisioning for reasons such as the following:
@y
You may want to disable JIT provisioning for reasons such as the following:
@z

@x
- You have multiple organizations, have SCIM enabled, and want SCIM to be the
  source of truth for provisioning
- You want to control and restrict usage based on your organization's
  security configuration, and want to use SCIM to provision access
@y
- You have multiple organizations, have SCIM enabled, and want SCIM to be the
  source of truth for provisioning
- You want to control and restrict usage based on your organization's
  security configuration, and want to use SCIM to provision access
@z

@x
Users are provisioned with JIT by default. If you enable SCIM, you can disable
JIT:
@y
Users are provisioned with JIT by default. If you enable SCIM, you can disable
JIT:
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
## Next steps
@y
## Next steps
@z

@x
- Review [how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit)
  before you configure SCIM.
- Set up [group mapping](/manuals/security/provisioning/scim/group-mapping.md)
  to automatically assign users to teams.
- Review [Troubleshoot provisioning](/manuals/security/provisioning/troubleshoot-provisioning.md).
@y
- Review [how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit)
  before you configure SCIM.
- Set up [group mapping](manuals/security/provisioning/scim/group-mapping.md)
  to automatically assign users to teams.
- Review [Troubleshoot provisioning](manuals/security/provisioning/troubleshoot-provisioning.md).
@z
