%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Troubleshoot provisioning
linkTitle: Troubleshoot
description: Troubleshoot common user provisioning issues with SCIM and Just-in-Time provisioning
keywords: SCIM troubleshooting, user provisioning, JIT provisioning, group mapping, attribute conflicts
@y
title: Troubleshoot provisioning
linkTitle: Troubleshoot
description: Troubleshoot common user provisioning issues with SCIM and Just-in-Time provisioning
keywords: SCIM troubleshooting, user provisioning, JIT provisioning, group mapping, attribute conflicts
@z

@x
This page helps troubleshoot common user provisioning issues including user
roles, attributes, and unexpected account behavior with SCIM and Just-in-Time
(JIT) provisioning.
@y
This page helps troubleshoot common user provisioning issues including user
roles, attributes, and unexpected account behavior with SCIM and Just-in-Time
(JIT) provisioning.
@z

@x
## Full name or team membership changes after sign-in
@y
## Full name or team membership changes after sign-in
@z

@x
### Error message
@y
### Error message
@z

@x
This scenario doesn't usually produce an error message in Docker or your IdP.
A user's full name changes after they sign in, or a team membership
disappears after a SCIM sync and comes back the next time they sign in.
@y
This scenario doesn't usually produce an error message in Docker or your IdP.
A user's full name changes after they sign in, or a team membership
disappears after a SCIM sync and comes back the next time they sign in.
@z

@x
### Causes
@y
### Causes
@z

@x
JIT and SCIM are both enabled:
@y
JIT and SCIM are both enabled:
@z

@x
- Each SSO sign-in writes the full name from the SSO assertion to the Docker
  account, replacing a name that SCIM set. The next SCIM sync can set it
  back.
- At sign-in, JIT adds the user to the teams the SSO assertion lists. SCIM
  group sync makes each mapped group's membership match the IdP group
  exactly. If the IdP group doesn't include the user, the next sync removes
  the team JIT added, and the next sign-in adds it back.
@y
- Each SSO sign-in writes the full name from the SSO assertion to the Docker
  account, replacing a name that SCIM set. The next SCIM sync can set it
  back.
- At sign-in, JIT adds the user to the teams the SSO assertion lists. SCIM
  group sync makes each mapped group's membership match the IdP group
  exactly. If the IdP group doesn't include the user, the next sync removes
  the team JIT added, and the next sign-in adds it back.
@z

@x
Roles aren't affected. JIT sets the organization role only when it first adds
the user. A later SCIM update can change that role, and the next sign-in
leaves the SCIM role in place.
@y
Roles aren't affected. JIT sets the organization role only when it first adds
the user. A later SCIM update can change that role, and the next sign-in
leaves the SCIM role in place.
@z

@x
### Affected environments
@y
### Affected environments
@z

@x
Docker organizations that use SCIM while JIT is still enabled.
@y
Docker organizations that use SCIM while JIT is still enabled.
@z

@x
### Steps to replicate
@y
### Steps to replicate
@z

@x
1. Enable SSO for your Docker organization. JIT is turned on by default.
1. Sign in through SSO with a user whose assertion includes a team.
1. Enable SCIM and synchronize groups that don't include that team.
1. The team membership from sign-in is removed. Signing in again adds it
   back.
@y
1. Enable SSO for your Docker organization. JIT is turned on by default.
1. Sign in through SSO with a user whose assertion includes a team.
1. Enable SCIM and synchronize groups that don't include that team.
1. The team membership from sign-in is removed. Signing in again adds it
   back.
@z

@x
### Solutions
@y
### Solutions
@z

@x
#### Turn off JIT provisioning (recommended)
@y
#### Turn off JIT provisioning (recommended)
@z

@x
You can turn off JIT only while SCIM is enabled. Follow
[Disable JIT provisioning](/manuals/security/provisioning/just-in-time.md#disable-jit-provisioning).
@y
You can turn off JIT only while SCIM is enabled. Follow
[Disable JIT provisioning](manuals/security/provisioning/just-in-time.md#disable-jit-provisioning).
@z

@x
With JIT turned off, SCIM is the source for user creation, profile updates,
and group membership.
@y
With JIT turned off, SCIM is the source for user creation, profile updates,
and group membership.
@z

@x
#### Keep JIT enabled
@y
#### Keep JIT enabled
@z

@x
If you keep JIT enabled:
@y
If you keep JIT enabled:
@z

@x
- Match each user's email address exactly between the SSO assertion and SCIM.
- Send the same team memberships in the SSO assertion that SCIM group mapping
  synchronizes.
- Expect each sign-in to update the full name from the SSO assertion.
@y
- Match each user's email address exactly between the SSO assertion and SCIM.
- Send the same team memberships in the SSO assertion that SCIM group mapping
  synchronizes.
- Expect each sign-in to update the full name from the SSO assertion.
@z

@x
While JIT is on, you still assign users to the Docker application and
maintain group mappings in your IdP. Review
[how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit)
before you keep both enabled.
@y
While JIT is on, you still assign users to the Docker application and
maintain group mappings in your IdP. Review
[how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit)
before you keep both enabled.
@z

@x
## User is deactivated after a SCIM sync
@y
## User is deactivated after a SCIM sync
@z

@x
### Cause
@y
### Cause
@z

@x
The user isn't assigned to the Docker application in the IdP. On the next
synchronization, Docker deactivates the Docker account. Removing the user
from a mapped group removes that user from the team only.
@y
The user isn't assigned to the Docker application in the IdP. On the next
synchronization, Docker deactivates the Docker account. Removing the user
from a mapped group removes that user from the team only.
@z

@x
### Solution
@y
### Solution
@z

@x
1. Assign the user to the Docker application in your IdP.
1. Match the user's email address exactly between the SSO assertion and SCIM.
1. Trigger a SCIM synchronization in your IdP.
1. Confirm that the account is active and that the user belongs to the
   expected teams.
@y
1. Assign the user to the Docker application in your IdP.
1. Match the user's email address exactly between the SSO assertion and SCIM.
1. Trigger a SCIM synchronization in your IdP.
1. Confirm that the account is active and that the user belongs to the
   expected teams.
@z

@x
To use one provisioning source, turn off JIT after SCIM is working. You can
turn off JIT only while SCIM is enabled. Review
[how SCIM works with JIT](/manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit)
before you change the configuration.
@y
To use one provisioning source, turn off JIT after SCIM is working. You can
turn off JIT only while SCIM is enabled. Review
[how SCIM works with JIT](manuals/security/provisioning/scim/_index.md#choose-how-scim-works-with-jit)
before you change the configuration.
@z

@x
## SCIM updates don't apply to existing users
@y
## SCIM updates don't apply to existing users
@z

@x
### Cause
@y
### Cause
@z

@x
SCIM can update any organization member whose email domain is verified on the
SSO connection, including users created through JIT or added manually. The
Docker account stays unchanged when that domain isn't verified on the
connection, or when the email address in the IdP differs from the account.
@y
SCIM can update any organization member whose email domain is verified on the
SSO connection, including users created through JIT or added manually. The
Docker account stays unchanged when that domain isn't verified on the
connection, or when the email address in the IdP differs from the account.
@z

@x
### Solution
@y
### Solution
@z

@x
1. Confirm that the user's email domain is verified on the SSO connection.
1. Match the email address in the IdP to the Docker account.
1. Assign the user to the Docker application and trigger provisioning.
1. In [Docker Home](https://app.docker.com), open **Members** and confirm the
   user.
@y
1. Confirm that the user's email domain is verified on the SSO connection.
1. Match the email address in the IdP to the Docker account.
1. Assign the user to the Docker application and trigger provisioning.
1. In [Docker Home](https://app.docker.com), open **Members** and confirm the
   user.
@z

@x
If the account is still unlinked, remove that user and provision them again.
@y
If the account is still unlinked, remove that user and provision them again.
@z

@x
> [!WARNING]
>
> Removing a user removes their resource ownership, such as repositories.
> Transfer ownership before you remove the user.
@y
> [!WARNING]
>
> Removing a user removes their resource ownership, such as repositories.
> Transfer ownership before you remove the user.
@z
