%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Plan and maintain user access
linkTitle: User access workflow
@y
title: Plan and maintain user access
linkTitle: User access workflow
@z

@x
description: Identify Docker users, choose roles and provisioning methods, and review access and adoption across your organization.
keywords: admin, user management, roles, permissions, SSO, provisioning, access control
@y
description: Identify Docker users, choose roles and provisioning methods, and review access and adoption across your organization.
keywords: admin, user management, roles, permissions, SSO, provisioning, access control
@z

@x
Use this workflow to decide who needs access to your Docker organization,
assign appropriate permissions, and keep membership aligned with changing
responsibilities. It links to the procedures for onboarding, provisioning,
and monitoring so you can apply those decisions.
@y
Use this workflow to decide who needs access to your Docker organization,
assign appropriate permissions, and keep membership aligned with changing
responsibilities. It links to the procedures for onboarding, provisioning,
and monitoring so you can apply those decisions.
@z

@x
## Setting up roles and permissions in Docker
@y
## Setting up roles and permissions in Docker
@z

@x
### Identify your Docker users and accounts
@y
### Identify your Docker users and accounts
@z

@x
Inventory the people who need Docker access, the projects they work on, and
the resources they need. Use device management records or ask development
teams to identify existing Docker Desktop users. Ask users to use their
business email for their Docker accounts.
@y
Inventory the people who need Docker access, the projects they work on, and
the resources they need. Use device management records or ask development
teams to identify existing Docker Desktop users. Ask users to use their
business email for their Docker accounts.
@z

@x
Follow [organization onboarding](/manuals/accounts/organization/setup/onboard.md)
for the identification procedure and seat planning. Keep this inventory as
the starting point for access reviews.
@y
Follow [organization onboarding](manuals/accounts/organization/setup/onboard.md)
for the identification procedure and seat planning. Keep this inventory as
the starting point for access reviews.
@z

@x
### Assign roles strategically
@y
### Assign roles strategically
@z

@x
Choose the minimum permissions each person needs. Compare the built-in
Member, Editor, and Owner roles with
[Roles and permissions](/manuals/security/roles-and-permissions/_index.md).
If you need a combination of permissions that the built-in roles don't
provide, consider custom roles, which require Docker Business.
@y
Choose the minimum permissions each person needs. Compare the built-in
Member, Editor, and Owner roles with
[Roles and permissions](manuals/security/roles-and-permissions/_index.md).
If you need a combination of permissions that the built-in roles don't
provide, consider custom roles, which require Docker Business.
@z

@x
#### Enhance with teams
@y
#### Enhance with teams
@z

@x
Group members by project, department, or shared repository needs. A member's
role determines organization-wide access, while team permissions apply to
specific repositories. Avoid granting an administrative role solely because
a developer needs access to a project's repositories.
@y
Group members by project, department, or shared repository needs. A member's
role determines organization-wide access, while team permissions apply to
specific repositories. Avoid granting an administrative role solely because
a developer needs access to a project's repositories.
@z

@x
Use [Create and manage a team](/manuals/accounts/organization/manage/manage-a-team.md)
to apply repository permissions to groups of members. Review team membership
when projects or responsibilities change.
@y
Use [Create and manage a team](manuals/accounts/organization/manage/manage-a-team.md)
to apply repository permissions to groups of members. Review team membership
when projects or responsibilities change.
@z

@x
## Onboarding and managing roles and permissions in Docker
@y
## Onboarding and managing roles and permissions in Docker
@z

@x
### Invite owners
@y
### Invite owners
@z

@x
Decide who needs to administer membership, settings, and billing. Additional
owners can share these responsibilities and provide continuity when another
owner is unavailable. Review the permissions before assigning the role.
@y
Decide who needs to administer membership, settings, and billing. Additional
owners can share these responsibilities and provide continuity when another
owner is unavailable. Review the permissions before assigning the role.
@z

@x
### Invite members and assign roles
@y
### Invite members and assign roles
@z

@x
Use your access inventory to assign roles and teams. Follow
[Onboard a Docker organization](/manuals/accounts/organization/setup/onboard.md)
for initial setup and
[Manage organization members](/manuals/accounts/organization/manage/members.md)
for invitations and membership changes.
@y
Use your access inventory to assign roles and teams. Follow
[Onboard a Docker organization](manuals/accounts/organization/setup/onboard.md)
for initial setup and
[Manage organization members](manuals/accounts/organization/manage/members.md)
for invitations and membership changes.
@z

@x
### Choose a provisioning method {#future-proof-user-management}
@y
### Choose a provisioning method {#future-proof-user-management}
@z

@x
Decide who will maintain membership as people join, move between teams, or
leave. Manual invitations can suit a small organization. For Docker Business
organizations using an identity provider, compare the
[provisioning methods](/manuals/security/provisioning/_index.md) before
choosing how to automate membership.
@y
Decide who will maintain membership as people join, move between teams, or
leave. Manual invitations can suit a small organization. For Docker Business
organizations using an identity provider, compare the
[provisioning methods](manuals/security/provisioning/_index.md) before
choosing how to automate membership.
@z

@x
#### Secure user authentication with single sign-on (SSO)
@y
#### Secure user authentication with single sign-on (SSO)
@z

@x
[SSO](/manuals/security/authentication/single-sign-on/_index.md) authenticates
users through your identity provider. Plan it together with provisioning,
which controls account creation, updates, and removal.
@y
[SSO](manuals/security/authentication/single-sign-on/_index.md) authenticates
users through your identity provider. Plan it together with provisioning,
which controls account creation, updates, and removal.
@z

@x
#### Automate onboarding with SCIM and JIT provisioning
@y
#### Automate onboarding with SCIM and JIT provisioning
@z

@x
Choose a method based on the user lifecycle you need to manage:
@y
Choose a method based on the user lifecycle you need to manage:
@z

@x
- [Just-in-Time (JIT) provisioning](/manuals/security/provisioning/just-in-time.md)
  creates and updates accounts during SSO sign-in. It doesn't deprovision users,
  so plan how to remove access when users leave.
- [SCIM](/manuals/security/provisioning/scim/_index.md) synchronizes users
  with your identity provider and supports deprovisioning. If you enable SCIM,
  choose how it will work with JIT so the intended source manages user attributes.
@y
- [Just-in-Time (JIT) provisioning](manuals/security/provisioning/just-in-time.md)
  creates and updates accounts during SSO sign-in. It doesn't deprovision users,
  so plan how to remove access when users leave.
- [SCIM](manuals/security/provisioning/scim/_index.md) synchronizes users
  with your identity provider and supports deprovisioning. If you enable SCIM,
  choose how it will work with JIT so the intended source manages user attributes.
@z

@x
Test adding a user, changing their team, and removing access before relying
on automated provisioning for the whole organization.
@y
Test adding a user, changing their team, and removing access before relying
on automated provisioning for the whole organization.
@z

@x
#### Simplify access with group mapping
@y
#### Simplify access with group mapping
@z

@x
Use [group mapping](/manuals/security/provisioning/scim/group-mapping.md)
to assign identity provider groups to Docker organizations and teams.
Group mapping works with SAML SSO or SCIM. For Microsoft Entra ID OIDC
connections, use SCIM to synchronize groups. Review the mappings when your
identity provider groups change.
@y
Use [group mapping](manuals/security/provisioning/scim/group-mapping.md)
to assign identity provider groups to Docker organizations and teams.
Group mapping works with SAML SSO or SCIM. For Microsoft Entra ID OIDC
connections, use SCIM to synchronize groups. Review the mappings when your
identity provider groups change.
@z

@x
## Monitoring and insights
@y
## Monitoring and insights
@z

@x
Schedule access reviews with organization owners and team leads. Compare
membership with your access inventory, remove users who no longer need
access, and adjust roles and teams when responsibilities change.
@y
Schedule access reviews with organization owners and team leads. Compare
membership with your access inventory, remove users who no longer need
access, and adjust roles and teams when responsibilities change.
@z

@x
### Activity logs
@y
### Activity logs
@z

@x
Use [activity logs](/manuals/accounts/organization/activity-logs.md) to review
organization and repository changes, including repository privacy changes
and subscription seat changes. Check who made an unexpected change and when
it happened. Docker Home retains logs for 90 days; plan exports if your audit
process needs a longer history.
@y
Use [activity logs](manuals/accounts/organization/activity-logs.md) to review
organization and repository changes, including repository privacy changes
and subscription seat changes. Check who made an unexpected change and when
it happened. Docker Home retains logs for 90 days; plan exports if your audit
process needs a longer history.
@z

@x
### Insights
@y
### Insights
@z

@x
If your organization meets the subscription and configuration requirements,
use [Insights](/manuals/accounts/organization/insights.md) to review Docker
Desktop adoption, versions, builds, and container usage. Active user counts
include only users who send analytics. Compare usage with your membership
inventory before deciding whether to change access or subscription seats.
@y
If your organization meets the subscription and configuration requirements,
use [Insights](manuals/accounts/organization/insights.md) to review Docker
Desktop adoption, versions, builds, and container usage. Active user counts
include only users who send analytics. Compare usage with your membership
inventory before deciding whether to change access or subscription seats.
@z

@x
### Next steps
@y
### Next steps
@z

@x
- Review [members](/manuals/accounts/organization/manage/members.md) and
  [teams](/manuals/accounts/organization/manage/manage-a-team.md) on a regular schedule.
- Use [rollout planning](/manuals/accounts/organization/setup/rollout.md)
  before deploying changes to Docker Desktop settings or sign-in requirements.
@y
- Review [members](manuals/accounts/organization/manage/members.md) and
  [teams](manuals/accounts/organization/manage/manage-a-team.md) on a regular schedule.
- Use [rollout planning](manuals/accounts/organization/setup/rollout.md)
  before deploying changes to Docker Desktop settings or sign-in requirements.
@z
