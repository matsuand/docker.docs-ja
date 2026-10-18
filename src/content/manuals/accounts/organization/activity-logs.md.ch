%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Activity logs
@y
title: Activity logs
@z

@x
description: >-
  View, filter, and export organization and repository activity logs in Docker
  Home.
keywords: >-
  activity logs, audit logs, Docker Home, organization activity, repository
  activity, filter activity logs, export CSV, security audit trail
@y
description: >-
  View, filter, and export organization and repository activity logs in Docker
  Home.
keywords: >-
  activity logs, audit logs, Docker Home, organization activity, repository
  activity, filter activity logs, export CSV, security audit trail
@z

@x
{{< summary-bar feature_name="Activity logs" >}}
@y
{{< summary-bar feature_name="Activity logs" >}}
@z

@x
Activity logs show a chronological list of organization and repository
changes in Docker Home. Use them to see what changed, when it changed, and who
made the change.
@y
Activity logs show a chronological list of organization and repository
changes in Docker Home. Use them to see what changed, when it changed, and who
made the change.
@z

@x
Organization owners and members with a custom role that includes the
**View activity logs** permission can open the activity log.
@y
Organization owners and members with a custom role that includes the
**View activity logs** permission can open the activity log.
@z

@x
> [!TIP]
>
> Use activity logs for an admin audit trail of your organization and
> repositories, including AI Governance policy and settings changes. For
> enforcement events, such as policy decisions and sandbox sessions, see
> [AI Governance Audit Logs](/manuals/ai/sandboxes/governance/audit/_index.md).
@y
> [!TIP]
>
> Use activity logs for an admin audit trail of your organization and
> repositories, including AI Governance policy and settings changes. For
> enforcement events, such as policy decisions and sandbox sessions, see
> [AI Governance Audit Logs](manuals/ai/sandboxes/governance/audit/_index.md).
@z

@x
## Access activity logs
@y
## Access activity logs
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Select **Activity**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Select **Activity**.
@z

@x
To query activity logs programmatically, use the
[Audit logs endpoints](/reference/api/hub/latest/#tag-audit-logs) in the
Docker Hub API. The API returns events from the last 3 months, up to 31 days
per request.
@y
To query activity logs programmatically, use the
[Audit logs endpoints](__SUBDIR__/reference/api/hub/latest/#tag-audit-logs) in the
Docker Hub API. The API returns events from the last 3 months, up to 31 days
per request.
@z

@x
### Filter by date
@y
### Filter by date
@z

@x
By default, the **Activity** page shows events from the last 7 days. Docker
Home keeps activity logs for 90 days, and you can query up to 30 days at a
time.
@y
By default, the **Activity** page shows events from the last 7 days. Docker
Home keeps activity logs for 90 days, and you can query up to 30 days at a
time.
@z

@x
1. On the **Activity** page, select the **Date range** field.
1. Select a preset such as **Today**, **Yesterday**, **This week**, **This
   month**, **Last 7 days**, or **Last 30 days**, or type a start date and an
   end date.
@y
1. On the **Activity** page, select the **Date range** field.
1. Select a preset such as **Today**, **Yesterday**, **This week**, **This
   month**, **Last 7 days**, or **Last 30 days**, or type a start date and an
   end date.
@z

@x
On the calendar, you can select dates in the 30 days leading up to the end
date. To view an earlier period within the 90-day retention window, type the
start date and the end date in the field.
@y
On the calendar, you can select dates in the 30 days leading up to the end
date. To view an earlier period within the 90-day retention window, type the
start date and the end date in the field.
@z

@x
The log updates to show only the activities that occurred during that period.
@y
The log updates to show only the activities that occurred during that period.
@z

@x
### Filter by type
@y
### Filter by type
@z

@x
To show only one category of events:
@y
To show only one category of events:
@z

@x
1. On the **Activity** page, open the **All activities** drop-down and select
   a category:
   - **Organization**: Organization management events
   - **Repository**: Events from repositories for every repository that belongs
     to the organization
   - **Enterprise**: Configuration events for company settings
   - **Billing**: Subscription change events
   - **OIDC**: OIDC setup events
   - **Offload**: Docker Offload usage
   - **Governance**: Admin configuration events for AI Governance
1. Optional. From the **All Actions** drop-down, select a specific event type
   within that category.
@y
1. On the **Activity** page, open the **All activities** drop-down and select
   a category:
   - **Organization**: Organization management events
   - **Repository**: Events from repositories for every repository that belongs
     to the organization
   - **Enterprise**: Configuration events for company settings
   - **Billing**: Subscription change events
   - **OIDC**: OIDC setup events
   - **Offload**: Docker Offload usage
   - **Governance**: Admin configuration events for AI Governance
1. Optional. From the **All Actions** drop-down, select a specific event type
   within that category.
@z

@x
### Export
@y
### Export
@z

@x
To download activity logs as a CSV file from the **Activity** page:
@y
To download activity logs as a CSV file from the **Activity** page:
@z

@x
1. Optional. Apply a date range or activity type filter. The export includes
   only the events that match your current filters.
1. Select the export icon next to the date range.
@y
1. Optional. Apply a date range or activity type filter. The export includes
   only the events that match your current filters.
1. Select the export icon next to the date range.
@z

@x
## Activity log events reference
@y
## Activity log events reference
@z

@x
{{< accordion title="Organization" >}}
@y
{{< accordion title="Organization" >}}
@z

@x
The following table lists organization events that cover teams, members, SSO
domains, access tokens, and custom roles.
@y
The following table lists organization events that cover teams, members, SSO
domains, access tokens, and custom roles.
@z

@x
| Event | Description |
|:------|:------------|
| Team Created | Team was created |
| Team Updated | Team was modified |
| Team Deleted | Team was deleted |
| Team Member Added | Member was added to a team |
| Team Member Removed | Member was removed from a team |
| Org Member Invited | Member was invited to the organization |
| Organization Member Added | Member was added to the organization |
| Organization Member Removed | Member was removed from the organization |
| Member Role Changed | Member's role in the organization was changed |
| Organization Created | Organization was created |
| Organization Settings Updated | Organization setting was updated |
| Registry Access Management enabled | Registry Access Management was enabled |
| Registry Access Management disabled | Registry Access Management was disabled |
| Registry Access Management registry added | Registry was added |
| Registry Access Management registry removed | Registry was removed |
| Registry Access Management registry updated | Registry was updated |
| Single Sign-On domain added | SSO domain was added |
| Single Sign-On domain deleted | SSO domain was removed |
| Single Sign-On domain verified | SSO domain was verified |
| Organization Auto-Provisioning Toggled | Auto-provisioning was turned on or off for a domain |
| Access token created | Access token was created |
| Access token updated | Access token was updated |
| Access token revoked | Access token was revoked |
| Access token deleted | Access token was deleted |
| Custom role created | Custom role was created |
| Custom role updated | Custom role was updated |
| Custom role deleted | Custom role was deleted |
@y
| Event | Description |
|:------|:------------|
| Team Created | Team was created |
| Team Updated | Team was modified |
| Team Deleted | Team was deleted |
| Team Member Added | Member was added to a team |
| Team Member Removed | Member was removed from a team |
| Org Member Invited | Member was invited to the organization |
| Organization Member Added | Member was added to the organization |
| Organization Member Removed | Member was removed from the organization |
| Member Role Changed | Member's role in the organization was changed |
| Organization Created | Organization was created |
| Organization Settings Updated | Organization setting was updated |
| Registry Access Management enabled | Registry Access Management was enabled |
| Registry Access Management disabled | Registry Access Management was disabled |
| Registry Access Management registry added | Registry was added |
| Registry Access Management registry removed | Registry was removed |
| Registry Access Management registry updated | Registry was updated |
| Single Sign-On domain added | SSO domain was added |
| Single Sign-On domain deleted | SSO domain was removed |
| Single Sign-On domain verified | SSO domain was verified |
| Organization Auto-Provisioning Toggled | Auto-provisioning was turned on or off for a domain |
| Access token created | Access token was created |
| Access token updated | Access token was updated |
| Access token revoked | Access token was revoked |
| Access token deleted | Access token was deleted |
| Custom role created | Custom role was created |
| Custom role updated | Custom role was updated |
| Custom role deleted | Custom role was deleted |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Enterprise" >}}
@y
{{< accordion title="Enterprise" >}}
@z

@x
The following table lists enterprise events that cover settings policies and
company-level SSO and SCIM connections.
@y
The following table lists enterprise events that cover settings policies and
company-level SSO and SCIM connections.
@z

@x
| Event | Description |
|:------|:------------|
| Policy created | Settings policy was added |
| Policy updated | Settings policy was updated |
| Policy deleted | Settings policy was deleted |
| Policy transferred | Settings policy was transferred to another owner |
| Create SSO Connection | Organization or company SSO connection was created |
| Update SSO Connection | Organization or company SSO connection was updated |
| Delete SSO Connection | Organization or company SSO connection was deleted |
| Enforce SSO | SSO enforcement was toggled on a connection |
| Enforce SCIM | SCIM was toggled on a connection |
| Refresh SCIM Token | SCIM token was refreshed |
| Change SSO Connection Type | Connection type was changed |
| Toggle JIT provisioning | JIT provisioning was toggled on a connection |
@y
| Event | Description |
|:------|:------------|
| Policy created | Settings policy was added |
| Policy updated | Settings policy was updated |
| Policy deleted | Settings policy was deleted |
| Policy transferred | Settings policy was transferred to another owner |
| Create SSO Connection | Organization or company SSO connection was created |
| Update SSO Connection | Organization or company SSO connection was updated |
| Delete SSO Connection | Organization or company SSO connection was deleted |
| Enforce SSO | SSO enforcement was toggled on a connection |
| Enforce SCIM | SCIM was toggled on a connection |
| Refresh SCIM Token | SCIM token was refreshed |
| Change SSO Connection Type | Connection type was changed |
| Toggle JIT provisioning | JIT provisioning was toggled on a connection |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Repository" >}}
@y
{{< accordion title="Repository" >}}
@z

@x
The following table lists repository events that cover create, delete, privacy,
tags, and related repository changes.
@y
The following table lists repository events that cover create, delete, privacy,
tags, and related repository changes.
@z

@x
> [!NOTE]
>
> Event descriptions that include a user action can refer to a Docker username,
> personal access token (PAT), or organization access token (OAT). For example,
> if a user pushes a tag, the description may show:
> `<user-access-token>` pushed the tag to the repository.
@y
> [!NOTE]
>
> Event descriptions that include a user action can refer to a Docker username,
> personal access token (PAT), or organization access token (OAT). For example,
> if a user pushes a tag, the description may show:
> `<user-access-token>` pushed the tag to the repository.
@z

@x
| Event | Description |
|:------|:------------|
| Repository Created | Repository was created |
| Repository Deleted | Repository was deleted |
| Repository Updated | Repository description, full description, or status was updated |
| Privacy Changed | Repository privacy settings were updated |
| Tag Pushed | Tags were pushed |
| Tag Deleted | Tags were deleted |
| Categories updated | Repository categories were set or updated |
| Tag immutability updated | Tag immutability was updated |
@y
| Event | Description |
|:------|:------------|
| Repository Created | Repository was created |
| Repository Deleted | Repository was deleted |
| Repository Updated | Repository description, full description, or status was updated |
| Privacy Changed | Repository privacy settings were updated |
| Tag Pushed | Tags were pushed |
| Tag Deleted | Tags were deleted |
| Categories updated | Repository categories were set or updated |
| Tag immutability updated | Tag immutability was updated |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Billing" >}}
@y
{{< accordion title="Billing" >}}
@z

@x
The following table lists billing events that cover plan changes, seats, and
license assignment.
@y
The following table lists billing events that cover plan changes, seats, and
license assignment.
@z

@x
| Event | Description |
|:------|:------------|
| Plan Upgraded | Billing plan was upgraded |
| Plan Downgraded | Billing plan was downgraded |
| Seat Added | Seat was added to the billing plan |
| Seat Removed | Seat was removed from the billing plan |
| Billing Cycle Changed | Billing cycle interval was changed |
| Plan Downgrade Canceled | Scheduled plan downgrade was canceled |
| Seat Removal Canceled | Scheduled seat removal was canceled |
| Plan Upgrade Requested | User requested a plan upgrade |
| Plan Downgrade Requested | User requested a plan downgrade |
| Seat Addition Requested | User requested additional seats |
| Seat Removal Requested | User requested fewer seats |
| Billing Cycle Change Requested | User requested a billing cycle change |
| Plan Downgrade Cancellation Requested | User requested cancellation of a scheduled plan downgrade |
| Seat Removal Cancellation Requested | User requested cancellation of a scheduled seat removal |
| Billing Product Changed | Subscribed product was changed |
| License Assigned | Product license was assigned to a user |
| License Removed | Product license was removed from a user |
| Auto-assign rule created | Automatic license assignment rule was created |
| Auto-assign rule removed | Automatic license assignment rule was removed |
| Automatic License Assignment Enabled | Automatic license assignment was turned on for a product |
| Automatic License Assignment Disabled | Automatic license assignment was turned off for a product |
| Licenses Expired | Licenses expired |
@y
| Event | Description |
|:------|:------------|
| Plan Upgraded | Billing plan was upgraded |
| Plan Downgraded | Billing plan was downgraded |
| Seat Added | Seat was added to the billing plan |
| Seat Removed | Seat was removed from the billing plan |
| Billing Cycle Changed | Billing cycle interval was changed |
| Plan Downgrade Canceled | Scheduled plan downgrade was canceled |
| Seat Removal Canceled | Scheduled seat removal was canceled |
| Plan Upgrade Requested | User requested a plan upgrade |
| Plan Downgrade Requested | User requested a plan downgrade |
| Seat Addition Requested | User requested additional seats |
| Seat Removal Requested | User requested fewer seats |
| Billing Cycle Change Requested | User requested a billing cycle change |
| Plan Downgrade Cancellation Requested | User requested cancellation of a scheduled plan downgrade |
| Seat Removal Cancellation Requested | User requested cancellation of a scheduled seat removal |
| Billing Product Changed | Subscribed product was changed |
| License Assigned | Product license was assigned to a user |
| License Removed | Product license was removed from a user |
| Auto-assign rule created | Automatic license assignment rule was created |
| Auto-assign rule removed | Automatic license assignment rule was removed |
| Automatic License Assignment Enabled | Automatic license assignment was turned on for a product |
| Automatic License Assignment Disabled | Automatic license assignment was turned off for a product |
| Licenses Expired | Licenses expired |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="OIDC" >}}
@y
{{< accordion title="OIDC" >}}
@z

@x
The following table lists OIDC events that cover creating, updating, and
deleting OIDC connections.
@y
The following table lists OIDC events that cover creating, updating, and
deleting OIDC connections.
@z

@x
| Event | Description |
|:------|:------------|
| OIDC connection created | OIDC connection was created |
| OIDC connection updated | OIDC connection was updated |
| OIDC connection deleted | OIDC connection was deleted |
@y
| Event | Description |
|:------|:------------|
| OIDC connection created | OIDC connection was created |
| OIDC connection updated | OIDC connection was updated |
| OIDC connection deleted | OIDC connection was deleted |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Offload" >}}
@y
{{< accordion title="Offload" >}}
@z

@x
The following table lists Offload events that cover lease start and end.
@y
The following table lists Offload events that cover lease start and end.
@z

@x
> [!NOTE]
>
> Event descriptions show the Docker username of the actor and details about
> the lease.
@y
> [!NOTE]
>
> Event descriptions show the Docker username of the actor and details about
> the lease.
@z

@x
| Event | Description |
|:------|:------------|
| Offload lease start | Offload lease started |
| Offload lease end | Offload lease ended |
@y
| Event | Description |
|:------|:------------|
| Offload lease start | Offload lease started |
| Offload lease end | Offload lease ended |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Governance" >}}
@y
{{< accordion title="Governance" >}}
@z

@x
The following table lists governance events that cover the AI Governance
admin audit trail, such as policy and settings changes. For enforcement
events, such as policy decisions and sandbox sessions, see
[AI Governance Audit Logs](/manuals/ai/sandboxes/governance/audit/_index.md).
@y
The following table lists governance events that cover the AI Governance
admin audit trail, such as policy and settings changes. For enforcement
events, such as policy decisions and sandbox sessions, see
[AI Governance Audit Logs](manuals/ai/sandboxes/governance/audit/_index.md).
@z

@x
| Event | Description |
|:------|:------------|
| AI Governance Policy created | AI governance policy was created |
| AI Governance Policy updated | AI governance policy was updated |
| AI Governance Policy deleted | AI governance policy was deleted |
| AI Governance Settings updated | AI governance settings were updated |
@y
| Event | Description |
|:------|:------------|
| AI Governance Policy created | AI governance policy was created |
| AI Governance Policy updated | AI governance policy was updated |
| AI Governance Policy deleted | AI governance policy was deleted |
| AI Governance Settings updated | AI governance settings were updated |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Roles and permissions](/manuals/security/roles-and-permissions/_index.md) for
  the **View activity logs** permission and custom roles
- [AI Governance Audit Logs](/manuals/ai/sandboxes/governance/audit/_index.md) for
  enforcement events such as policy decisions and sandbox sessions
- [Audit logs API](/reference/api/hub/latest/#tag-audit-logs) to query events
  programmatically
@y
- [Roles and permissions](manuals/security/roles-and-permissions/_index.md) for
  the **View activity logs** permission and custom roles
- [AI Governance Audit Logs](manuals/ai/sandboxes/governance/audit/_index.md) for
  enforcement events such as policy decisions and sandbox sessions
- [Audit logs API](__SUBDIR__/reference/api/hub/latest/#tag-audit-logs) to query events
  programmatically
@z
