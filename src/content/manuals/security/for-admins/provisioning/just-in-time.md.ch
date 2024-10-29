%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how Just-in-Time provisioning works with your SSO connection.
keywords: user provisioning, just-in-time provisioning, JIT, autoprovision, Docker Hub, Docker Admin, admin, security
title: Just-in-Time provisioning
linkTitle: Just-in-Time
@y
description: Learn how Just-in-Time provisioning works with your SSO connection.
keywords: user provisioning, just-in-time provisioning, JIT, autoprovision, Docker Hub, Docker Admin, admin, security
title: Just-in-Time provisioning
linkTitle: Just-in-Time
@z

@x
Just-in-Time (JIT) provisioning automatically creates and updates user accounts after every successful single sign-on (SSO) authentication. JIT verifies that the user signing in belongs to the organization and the teams assigned to them in your identity provider (IdP). When you [create your SSO connection](../single-sign-on/_index.md), JIT provisioning is turned on by default.
@y
Just-in-Time (JIT) provisioning automatically creates and updates user accounts after every successful single sign-on (SSO) authentication. JIT verifies that the user signing in belongs to the organization and the teams assigned to them in your identity provider (IdP). When you [create your SSO connection](../single-sign-on/_index.md), JIT provisioning is turned on by default.
@z

@x
## SSO authentication with JIT provisioning enabled
@y
## SSO authentication with JIT provisioning enabled
@z

@x
When a user signs in with SSO and your SSO configuration has JIT provisioning enabled, the following steps occur automatically:
@y
When a user signs in with SSO and your SSO configuration has JIT provisioning enabled, the following steps occur automatically:
@z

@x
1. The system checks if a Docker account exists for the user's email address.
@y
1. The system checks if a Docker account exists for the user's email address.
@z

@x
    - If an account exists: The system uses the existing account and updates the user's full name if necessary.
    - If no account exists: A new Docker account is created using basic user attributes (email, name, and surname). A unique username is generated based on the user's email, name, and random numbers to ensure all usernames are unique across the platform.
@y
    - If an account exists: The system uses the existing account and updates the user's full name if necessary.
    - If no account exists: A new Docker account is created using basic user attributes (email, name, and surname). A unique username is generated based on the user's email, name, and random numbers to ensure all usernames are unique across the platform.
@z

@x
2. The system checks for any pending invitations to the SSO organization.
@y
2. The system checks for any pending invitations to the SSO organization.
@z

@x
    - Invitation found: The invitation is automatically accepted.
    - Invitation includes a specific group: The user is added to that group within the SSO organization.
@y
    - Invitation found: The invitation is automatically accepted.
    - Invitation includes a specific group: The user is added to that group within the SSO organization.
@z

@x
3. The system verifies if the IdP has shared group mappings during authentication.
@y
3. The system verifies if the IdP has shared group mappings during authentication.
@z

@x
    - Group mappings provided: The user is assigned to the relevant organizations and teams.
    - No group mappings provided: The system checks if the user is already part of the organization. If not, the user is added to the default organization and team configured in the SSO connection.
@y
    - Group mappings provided: The user is assigned to the relevant organizations and teams.
    - No group mappings provided: The system checks if the user is already part of the organization. If not, the user is added to the default organization and team configured in the SSO connection.
@z

@x
The following graphic provides an overview of SSO authentication with JIT enabled:
@y
The following graphic provides an overview of SSO authentication with JIT enabled:
@z

@x
   ![JIT provisioning enabled](../../images/jit-enabled-flow.svg)
@y
   ![JIT provisioning enabled](../../images/jit-enabled-flow.svg)
@z

@x
## SSO authentication with JIT provisioning disabled
@y
## SSO authentication with JIT provisioning disabled
@z

@x
When JIT provisioning is disabled in your SSO connection, the following actions occur during authentication:
@y
When JIT provisioning is disabled in your SSO connection, the following actions occur during authentication:
@z

@x
1. The system checks if a Docker account exists for the user's email address.
@y
1. The system checks if a Docker account exists for the user's email address.
@z

@x
    - If an account exists: The system uses the existing account and updates the user's full name if necessary.
    - If no account exists: A new Docker account is created using basic user attributes (email, name, and surname). A unique username is generated based on the user's email, name, and random numbers to ensure all usernames are unique across the platform.
@y
    - If an account exists: The system uses the existing account and updates the user's full name if necessary.
    - If no account exists: A new Docker account is created using basic user attributes (email, name, and surname). A unique username is generated based on the user's email, name, and random numbers to ensure all usernames are unique across the platform.
@z

@x
2. The system checks for any pending invitations to the SSO organization.
@y
2. The system checks for any pending invitations to the SSO organization.
@z

@x
   - Invitation found: If the user is a member of the organization or has a pending invitation, sign-in is successful, and the invitation is automatically accepted.
   - No invitation found: If the user is not a member of the organization and has no pending invitation, the sign-in fails, and an `Access denied` error appears. The user must contact an administrator to be invited to the organization.
@y
   - Invitation found: If the user is a member of the organization or has a pending invitation, sign-in is successful, and the invitation is automatically accepted.
   - No invitation found: If the user is not a member of the organization and has no pending invitation, the sign-in fails, and an `Access denied` error appears. The user must contact an administrator to be invited to the organization.
@z

@x
With JIT disabled, group mapping is only available if you have [SCIM enabled](/security/for-admins/provisioning/scim/#enable-scim-in-docker). If SCIM is not enabled, users won't be auto-provisioned to groups.
@y
With JIT disabled, group mapping is only available if you have [SCIM enabled](__SUBDIR__/security/for-admins/provisioning/scim/#enable-scim-in-docker). If SCIM is not enabled, users won't be auto-provisioned to groups.
@z

@x
The following graphic provides an overview of SSO authentication with JIT disabled:
@y
The following graphic provides an overview of SSO authentication with JIT disabled:
@z

@x
![JIT provisioning disabled](../../images/jit-disabled-flow.svg)
@y
![JIT provisioning disabled](../../images/jit-disabled-flow.svg)
@z

@x
## Disable JIT provisioning
@y
## Disable JIT provisioning
@z

@x
> [!WARNING]
>
> Disabling JIT provisioning may disrupt your users' access and workflows. With JIT disabled, users will not be automatically added to your organization. Users must already be a member of the organization or have a pending invitation to successfully sign in through SSO. To auto-provision users with JIT disabled, [use SCIM](./scim.md).
@y
> [!WARNING]
>
> Disabling JIT provisioning may disrupt your users' access and workflows. With JIT disabled, users will not be automatically added to your organization. Users must already be a member of the organization or have a pending invitation to successfully sign in through SSO. To auto-provision users with JIT disabled, [use SCIM](./scim.md).
@z

@x
You may want to disable JIT provisioning for reasons such as the following:
@y
You may want to disable JIT provisioning for reasons such as the following:
@z

@x
- You have multiple organizations, have SCIM enabled, and want SCIM to be the source of truth for provisioning
- You want to control and restrict usage based on your organization's security configuration, and want to use SCIM to provision access
@y
- You have multiple organizations, have SCIM enabled, and want SCIM to be the source of truth for provisioning
- You want to control and restrict usage based on your organization's security configuration, and want to use SCIM to provision access
@z

@x
Users are provisioned with JIT by default. If you enable SCIM, you can disable JIT:
@y
Users are provisioned with JIT by default. If you enable SCIM, you can disable JIT:
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/).
2. Select your organization or company in the left-hand navigation drop-down, and then select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** icon and then **Disable JIT provisioning**.
4. Select **Disable** to confirm.
@y
1. Sign in to the [Admin Console](https://app.docker.com/).
2. Select your organization or company in the left-hand navigation drop-down, and then select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** icon and then **Disable JIT provisioning**.
4. Select **Disable** to confirm.
@z
