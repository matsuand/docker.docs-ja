%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage license assignment
linkTitle: License assignment
description: Manage product licenses for your organization, including invite-time assignment, revocation, and automatic assignment.
keywords: licenses, organization, members, invite, invitation, Docker Core, Docker Offload, AI Governance, license assignment, docker home
@y
title: Manage license assignment
linkTitle: License assignment
description: Manage product licenses for your organization, including invite-time assignment, revocation, and automatic assignment.
keywords: licenses, organization, members, invite, invitation, Docker Core, Docker Offload, AI Governance, license assignment, docker home
@z

@x
Licenses let you choose which organization members can access supported Docker
products. Organization owners can manage active licenses for their members, or
configure licenses to assign automatically when members access supported Docker
products.
@y
Licenses let you choose which organization members can access supported Docker
products. Organization owners can manage active licenses for their members, or
configure licenses to assign automatically when members access supported Docker
products.
@z

@x
> [!TIP]
> To learn more about product licenses, Docker Core seats, and other Docker
> add-ons, see [Docker plans](/manuals/subscription-billing/plans/_index.md),
> or
> <a href="https://www.docker.com/pricing/contact-sales/" id="dkr_docs_cs_admin_licenses" class="link" rel="noopener">contact sales</a>
> to purchase licenses.
@y
> [!TIP]
> To learn more about product licenses, Docker Core seats, and other Docker
> add-ons, see [Docker plans](manuals/subscription-billing/plans/_index.md),
> or
> <a href="https://www.docker.com/pricing/contact-sales/" id="dkr_docs_cs_admin_licenses" class="link" rel="noopener">contact sales</a>
> to purchase licenses.
@z

@x
## Licenses and invites
@y
## Licenses and invites
@z

@x
When you invite someone, you can select a product license to assign when they
accept. Docker doesn't reserve or deduct the license at invite time; assignment
happens on acceptance:
@y
When you invite someone, you can select a product license to assign when they
accept. Docker doesn't reserve or deduct the license at invite time; assignment
happens on acceptance:
@z

@x
- If a license is available when they accept, Docker assigns it to them and the
  number of available licenses decreases by one.
- If no licenses remain when they accept, they still join your organization,
  but without a license.
@y
- If a license is available when they accept, Docker assigns it to them and the
  number of available licenses decreases by one.
- If no licenses remain when they accept, they still join your organization,
  but without a license.
@z

@x
> [!NOTE]
> Docker doesn't notify you or the invitee when a selected license is
> unavailable at acceptance.
@y
> [!NOTE]
> Docker doesn't notify you or the invitee when a selected license is
> unavailable at acceptance.
@z

@x
Licenses aren't reserved for pending invitations, so they must still be
available when each invitee accepts. Monitor availability on the Members page
while invitations are pending.
@y
Licenses aren't reserved for pending invitations, so they must still be
available when each invitee accepts. Monitor availability on the Members page
while invitations are pending.
@z

@x
### Select licenses when inviting
@y
### Select licenses when inviting
@z

@x
Selecting licenses when you invite is an alternative to assigning one manually
after they join, or, where available, relying on automatic license assignment
the first time they use a supported product. To select licenses when you invite
a member:
@y
Selecting licenses when you invite is an alternative to assigning one manually
after they join, or, where available, relying on automatic license assignment
the first time they use a supported product. To select licenses when you invite
a member:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com), then choose your
   organization.
1. Select **Members** from the left navigation, then select **Invite**.
1. Select **Emails or usernames**.
1. Enter the email addresses or Docker IDs of the people you want to invite,
   then assign their
   [role](/manuals/security/roles-and-permissions/_index.md).
1. Under **Licenses (optional)**, select one or more licenses that are
   available to your organization.
1. Select **Invite** to send the invite.
@y
1. Sign in to [Docker Home](https://app.docker.com), then choose your
   organization.
1. Select **Members** from the left navigation, then select **Invite**.
1. Select **Emails or usernames**.
1. Enter the email addresses or Docker IDs of the people you want to invite,
   then assign their
   [role](manuals/security/roles-and-permissions/_index.md).
1. Under **Licenses (optional)**, select one or more licenses that are
   available to your organization.
1. Select **Invite** to send the invite.
@z

@x
For more about sending, resending, and removing invitations, including CSV
file limits, see
[Manage organization members](/manuals/accounts/organization/manage/members.md).
@y
For more about sending, resending, and removing invitations, including CSV
file limits, see
[Manage organization members](manuals/accounts/organization/manage/members.md).
@z

@x
### Accept invites
@y
### Accept invites
@z

@x
A user can accept from the link in their invitation email or from their
**Notifications Center**. If the selected license is available, Docker assigns
it automatically upon acceptance.
@y
A user can accept from the link in their invitation email or from their
**Notifications Center**. If the selected license is available, Docker assigns
it automatically upon acceptance.
@z

@x
## Automatic license assignment
@y
## Automatic license assignment
@z

@x
Automatic license assignment gives members a product license when they use a
supported product for the first time. Automatic license assignment is available
for AI Governance licenses. Only organizations that purchase AI Governance can
set up auto-assignment for Docker Core as well.
@y
Automatic license assignment gives members a product license when they use a
supported product for the first time. Automatic license assignment is available
for AI Governance licenses. Only organizations that purchase AI Governance can
set up auto-assignment for Docker Core as well.
@z

@x
- When you purchase AI Governance, signing in to
  [Docker Sandboxes](/manuals/ai/sandboxes/_index.md) with the `sbx login`
  command automatically provisions AI Governance licenses on a first-come,
  first-served basis.
- Similarly, signing in to Docker Desktop automatically provisions Docker Core
  for AI Governance license-holding organizations that have available Docker
  Core seats.
- Licenses are assigned until exhausted.
  - Once the available licenses are exhausted, automatic license assignment
    stops until you purchase more licenses or revoke assigned licenses.
  - Members can still use Docker Sandboxes or Docker Desktop, but organization
    policies for those products won't affect their usage.
@y
- When you purchase AI Governance, signing in to
  [Docker Sandboxes](manuals/ai/sandboxes/_index.md) with the `sbx login`
  command automatically provisions AI Governance licenses on a first-come,
  first-served basis.
- Similarly, signing in to Docker Desktop automatically provisions Docker Core
  for AI Governance license-holding organizations that have available Docker
  Core seats.
- Licenses are assigned until exhausted.
  - Once the available licenses are exhausted, automatic license assignment
    stops until you purchase more licenses or revoke assigned licenses.
  - Members can still use Docker Sandboxes or Docker Desktop, but organization
    policies for those products won't affect their usage.
@z

@x
AI Governance licenses include single sign-on (SSO) and provisioning features
regardless of your Docker Core subscription. Automatic license assignment
requires
[setting up SSO](/manuals/security/authentication/single-sign-on/connect.md), then
[provisioning](/manuals/security/provisioning/_index.md) with System
for Cross-domain Identity Management (SCIM) or Just-in-Time (JIT).
@y
AI Governance licenses include single sign-on (SSO) and provisioning features
regardless of your Docker Core subscription. Automatic license assignment
requires
[setting up SSO](manuals/security/authentication/single-sign-on/connect.md), then
[provisioning](manuals/security/provisioning/_index.md) with System
for Cross-domain Identity Management (SCIM) or Just-in-Time (JIT).
@z

@x
## Manage licenses
@y
## Manage licenses
@z

@x
The **Members** page lets you track the number of available licenses for your
organization and who holds a license. You can also assign or revoke licenses
from this page.
@y
The **Members** page lets you track the number of available licenses for your
organization and who holds a license. You can also assign or revoke licenses
from this page.
@z

@x
To manage licenses for your organization:
@y
To manage licenses for your organization:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com), then choose your
   organization.
1. Select **Members** from the left navigation.
1. Select the action menu at the end of the row to assign or revoke an active
   license.
1. Optional. To bulk assign or revoke licenses, choose the members you want to
   bulk manage, then select the **Bulk actions** menu.
1. Optional. To manage automatic license assignment, turn off or turn on with
   the **Automatically assign licenses** toggle.
@y
1. Sign in to [Docker Home](https://app.docker.com), then choose your
   organization.
1. Select **Members** from the left navigation.
1. Select the action menu at the end of the row to assign or revoke an active
   license.
1. Optional. To bulk assign or revoke licenses, choose the members you want to
   bulk manage, then select the **Bulk actions** menu.
1. Optional. To manage automatic license assignment, turn off or turn on with
   the **Automatically assign licenses** toggle.
@z

@x
## Next steps
@y
## Next steps
@z

@x
Explore Docker Core add-ons and products that need licenses:
@y
Explore Docker Core add-ons and products that need licenses:
@z

@x
- [Docker plans](/manuals/subscription-billing/plans/_index.md) to learn about different
  add-ons
- [Manage seats](/manuals/accounts/organization/manage/manage-seats.md) to add more
  seats to your Docker Core subscription
- [AI Governance plan](/manuals/subscription-billing/plans/ai-governance.md) to learn
  about AI Governance license usage and billing
- [Docker Offload](/manuals/offload/about.md) to let your developers offload
  building and running containers to the cloud
@y
- [Docker plans](manuals/subscription-billing/plans/_index.md) to learn about different
  add-ons
- [Manage seats](manuals/accounts/organization/manage/manage-seats.md) to add more
  seats to your Docker Core subscription
- [AI Governance plan](manuals/subscription-billing/plans/ai-governance.md) to learn
  about AI Governance license usage and billing
- [Docker Offload](manuals/offload/about.md) to let your developers offload
  building and running containers to the cloud
@z
