%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Troubleshoot provisioning
linkTitle: Troubleshoot provisioning
description: Troubleshoot common user provisioning issues with SCIM and Just-in-Time provisioning
keywords: SCIM troubleshooting, user provisioning, JIT provisioning, group mapping, attribute conflicts
@y
title: Troubleshoot provisioning
linkTitle: Troubleshoot provisioning
description: Troubleshoot common user provisioning issues with SCIM and Just-in-Time provisioning
keywords: SCIM troubleshooting, user provisioning, JIT provisioning, group mapping, attribute conflicts
@z

@x
This page helps troubleshoot common user provisioning issues including user roles, attributes, and unexpected account behavior with SCIM and Just-in-Time (JIT) provisioning.
@y
This page helps troubleshoot common user provisioning issues including user roles, attributes, and unexpected account behavior with SCIM and Just-in-Time (JIT) provisioning.
@z

@x
## SCIM attribute values are overwritten or ignored
@y
## SCIM attribute values are overwritten or ignored
@z

@x
### Error message
@y
### Error message
@z

@x
Typically, this scenario does not produce an error message in Docker or your
IdP. This issue ususally surfaces as incorrect role or team assignment.
@y
Typically, this scenario does not produce an error message in Docker or your
IdP. This issue ususally surfaces as incorrect role or team assignment.
@z

@x
### Causes
@y
### Causes
@z

@x
- JIT provisioning is enabled, and Docker is using values from your IdP's
SSO login flow to provision the user, which overrides
SCIM-provided attributes.
- SCIM was enabled after the user was already provisioned via JIT, so SCIM
updates don't take effect.
@y
- JIT provisioning is enabled, and Docker is using values from your IdP's
SSO login flow to provision the user, which overrides
SCIM-provided attributes.
- SCIM was enabled after the user was already provisioned via JIT, so SCIM
updates don't take effect.
@z

@x
### Affected environments
@y
### Affected environments
@z

@x
- Docker organizations using SCIM with SSO
- Users provisioned via JIT prior to SCIM setup
@y
- Docker organizations using SCIM with SSO
- Users provisioned via JIT prior to SCIM setup
@z

@x
### Steps to replicate
@y
### Steps to replicate
@z

@x
1. Enable JIT and SSO for your Docker organization.
1. Sign in to Docker as a user via SSO.
1. Enable SCIM and set role/team attributes for that user.
1. SCIM attempts to update the user's attributes, but the role or team
assignment does not reflect changes.
@y
1. Enable JIT and SSO for your Docker organization.
1. Sign in to Docker as a user via SSO.
1. Enable SCIM and set role/team attributes for that user.
1. SCIM attempts to update the user's attributes, but the role or team
assignment does not reflect changes.
@z

@x
### Solutions
@y
### Solutions
@z

@x
#### Disable JIT provisioning (recommended)
@y
#### Disable JIT provisioning (recommended)
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select **Admin Console**, then **SSO and SCIM**.
1. Find the relevant SSO connection.
1. Select the **actions menu** and choose **Edit**.
1. Disable **Just-in-Time provisioning**.
1. Save your changes.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select **Admin Console**, then **SSO and SCIM**.
1. Find the relevant SSO connection.
1. Select the **actions menu** and choose **Edit**.
1. Disable **Just-in-Time provisioning**.
1. Save your changes.
@z

@x
With JIT disabled, Docker uses SCIM as the source of truth for user creation
and role assignment.
@y
With JIT disabled, Docker uses SCIM as the source of truth for user creation
and role assignment.
@z

@x
**Keep JIT enabled and match attributes**
@y
**Keep JIT enabled and match attributes**
@z

@x
If you prefer to keep JIT enabled:
@y
If you prefer to keep JIT enabled:
@z

@x
- Make sure your IdP's SSO attribute mappings match the values being sent
by SCIM.
- Avoid configuring SCIM to override attributes already set via JIT.
@y
- Make sure your IdP's SSO attribute mappings match the values being sent
by SCIM.
- Avoid configuring SCIM to override attributes already set via JIT.
@z

@x
This option requires strict coordination between SSO and SCIM attributes
in your IdP configuration.
@y
This option requires strict coordination between SSO and SCIM attributes
in your IdP configuration.
@z

@x
## SCIM updates don't apply to existing users
@y
## SCIM updates don't apply to existing users
@z

@x
### Causes
@y
### Causes
@z

@x
User accounts were originally created manually or via JIT, and SCIM is not
linked to manage them.
@y
User accounts were originally created manually or via JIT, and SCIM is not
linked to manage them.
@z

@x
### Solution
@y
### Solution
@z

@x
SCIM only manages users that it provisions. To allow SCIM to manage an
existing user:
@y
SCIM only manages users that it provisions. To allow SCIM to manage an
existing user:
@z

@x
1. Remove the user manually from the Docker [Admin Console](https://app.docker.com/admin).
1. Trigger provisioning from your IdP.
1. SCIM will re-create the user with correct attributes.
@y
1. Remove the user manually from the Docker [Admin Console](https://app.docker.com/admin).
1. Trigger provisioning from your IdP.
1. SCIM will re-create the user with correct attributes.
@z

@x
> [!WARNING]
>
> Deleting a user removes their resource ownership (e.g., repositories).
Transfer ownership before removing the user.
@y
> [!WARNING]
>
> Deleting a user removes their resource ownership (e.g., repositories).
Transfer ownership before removing the user.
@z
