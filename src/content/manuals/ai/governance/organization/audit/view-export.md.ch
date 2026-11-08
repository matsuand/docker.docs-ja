%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: View and export audit events
linkTitle: View and export
@y
title: View and export audit events
linkTitle: View and export
@z

@x
description: Search, filter, and export Docker AI Governance audit events from the hosted audit log view.
keywords: docker sandboxes, audit events, audit logs, AI Governance, CSV export
@y
description: Search, filter, and export Docker AI Governance audit events from the hosted audit log view.
keywords: docker sandboxes, audit events, audit logs, AI Governance, CSV export
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Cloud delivery stores AI Governance audit records in Docker Cloud and makes
them available in the hosted audit log view. Use it to investigate
policy decisions, such as why a developer's request was blocked or what
sandboxes reached over the past week. Open the view to see recent events,
narrow it to the ones you care about, then export them to CSV if you need an
offline copy.
@y
Cloud delivery stores AI Governance audit records in Docker Cloud and makes
them available in the hosted audit log view. Use it to investigate
policy decisions, such as why a developer's request was blocked or what
sandboxes reached over the past week. Open the view to see recent events,
narrow it to the ones you care about, then export them to CSV if you need an
offline copy.
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
- [Cloud delivery](configure.md) must be turned on for your
  organization. The hosted view shows only records delivered to Docker Cloud,
  not records written to local disk.
- You need organization owner access, or a
  [custom role](/manuals/security/roles-and-permissions/custom-roles/_index.md)
  with AI Governance audit permissions.
@y
- [Cloud delivery](configure.md) must be turned on for your
  organization. The hosted view shows only records delivered to Docker Cloud,
  not records written to local disk.
- You need organization owner access, or a
  [custom role](manuals/security/roles-and-permissions/custom-roles/_index.md)
  with AI Governance audit permissions.
@z

@x
## View audit events
@y
## View audit events
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Audit events**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Audit events**.
@z

@x
The **Audit events** view includes summary tiles for **Events**, **Allowed**,
**Denied**, and **Consent required**. **Consent required** counts the events
with an Approval required decision. The event table includes:
@y
The **Audit events** view includes summary tiles for **Events**, **Allowed**,
**Denied**, and **Consent required**. **Consent required** counts the events
with an Approval required decision. The event table includes:
@z

@x
| Column    | Description                                                         |
| --------- | ------------------------------------------------------------------- |
| Time      | When Docker recorded the event.                                     |
| Event     | The event type or policy action.                                    |
| Principal | The Docker user associated with the event.                          |
| Resource  | The target resource, such as a domain, file path, or tool.          |
| Decision  | The governance decision, such as Allow, Deny, or Approval required. |
| Agent     | The AI agent associated with the event, when Docker knows it.       |
@y
| Column    | Description                                                         |
| --------- | ------------------------------------------------------------------- |
| Time      | When Docker recorded the event.                                     |
| Event     | The event type or policy action.                                    |
| Principal | The Docker user associated with the event.                          |
| Resource  | The target resource, such as a domain, file path, or tool.          |
| Decision  | The governance decision, such as Allow, Deny, or Approval required. |
| Agent     | The AI agent associated with the event, when Docker knows it.       |
@z

@x
For every field in a record and what its values mean, see
[Audit record reference](../../reference/audit-records.md).
@y
For every field in a record and what its values mean, see
[Audit record reference](../../reference/audit-records.md).
@z

@x
## Filter and search events
@y
## Filter and search events
@z

@x
The event table can hold a large number of events, so narrow it to the ones
you're investigating. Use the filters above the table:
@y
The event table can hold a large number of events, so narrow it to the ones
you're investigating. Use the filters above the table:
@z

@x
- **Date range**: Today, Last 7 days, Last 14 days, Last 30 days, or a custom
  range. The table shows the last 7 days by default.
- **Decision**: Allow, Deny, Approval required, or Approval unavailable.
- **Event type**: the kind of action, such as a network or filesystem
  evaluation. For the full list, see
  [Action types](../../reference/audit-records.md#action-types).
- **Agent**: the AI agent associated with the event.
- **Principal**: a Docker username.
- **Session ID**: an audit session ID. This filter shows the whole session,
  whatever the date range.
@y
- **Date range**: Today, Last 7 days, Last 14 days, Last 30 days, or a custom
  range. The table shows the last 7 days by default.
- **Decision**: Allow, Deny, Approval required, or Approval unavailable.
- **Event type**: the kind of action, such as a network or filesystem
  evaluation. For the full list, see
  [Action types](../../reference/audit-records.md#action-types).
- **Agent**: the AI agent associated with the event.
- **Principal**: a Docker username.
- **Session ID**: an audit session ID. This filter shows the whole session,
  whatever the date range.
@z

@x
To search across events, principals, resources, and decisions, enter at least
three characters in the search box, then press Enter.
@y
To search across events, principals, resources, and decisions, enter at least
three characters in the search box, then press Enter.
@z

@x
For example, set **Decision** to Deny and **Principal** to a developer's
username to see what their sandboxes were blocked from.
@y
For example, set **Decision** to Deny and **Principal** to a developer's
username to see what their sandboxes were blocked from.
@z

@x
The table shows 25 events per page by default. You can show 100 per page
instead.
@y
The table shows 25 events per page by default. You can show 100 per page
instead.
@z

@x
## Export events to CSV
@y
## Export events to CSV
@z

@x
When you need an offline copy of the events you found, export them. The export
uses your current filters and search terms:
@y
When you need an offline copy of the events you found, export them. The export
uses your current filters and search terms:
@z

@x
1. Open **Audit events**.
1. Apply the filters and search terms for the events you want to export.
1. Select **Export**.
1. Download the generated CSV file from the link Docker provides.
@y
1. Open **Audit events**.
1. Apply the filters and search terms for the events you want to export.
1. Select **Export**.
1. Download the generated CSV file from the link Docker provides.
@z

@x
CSV exports include up to 1,000,000 rows. An export stays available to download
for 24 hours after Docker generates it.
@y
CSV exports include up to 1,000,000 rows. An export stays available to download
for 24 hours after Docker generates it.
@z

@x
To monitor audit events continuously instead of searching them by hand,
[forward them to your SIEM](siem.md).
@y
To monitor audit events continuously instead of searching them by hand,
[forward them to your SIEM](siem.md).
@z
