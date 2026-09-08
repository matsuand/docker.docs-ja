%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: View and export audit events
linkTitle: View and export
@y
title: View and export audit events
linkTitle: View and export
@z

@x
description: Search, filter, and export Docker AI Governance audit events from the hosted audit log UI.
keywords: docker sandboxes, audit events, audit logs, AI Governance, CSV export
@y
description: Search, filter, and export Docker AI Governance audit events from the hosted audit log UI.
keywords: docker sandboxes, audit events, audit logs, AI Governance, CSV export
@z

@x
Cloud delivery stores AI Governance audit records in Docker Cloud and makes
them available in the hosted audit log UI. Use the hosted view to investigate
policy decisions or export events to CSV.
@y
Cloud delivery stores AI Governance audit records in Docker Cloud and makes
them available in the hosted audit log UI. Use the hosted view to investigate
policy decisions or export events to CSV.
@z

@x
## View audit events
@y
## View audit events
@z

@x
To view audit events:
@y
To view audit events:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Open your organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Audit Events**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Open your organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Audit Events**.
@z

@x
The **Audit Events** view includes summary tiles for total events, allowed
events, denied events, and consent-required events. The event table includes:
@y
The **Audit Events** view includes summary tiles for total events, allowed
events, denied events, and consent-required events. The event table includes:
@z

@x
| Column    | Description                                                   |
| --------- | ------------------------------------------------------------- |
| Time      | When Docker recorded the event.                               |
| Event     | The event type or policy action.                              |
| Principal | The Docker user associated with the event.                    |
| Resource  | The target resource, such as a domain, file path, or tool.    |
| Decision  | The governance decision, such as allow, deny, or consent.     |
| Agent     | The AI agent associated with the event, when Docker knows it. |
@y
| Column    | Description                                                   |
| --------- | ------------------------------------------------------------- |
| Time      | When Docker recorded the event.                               |
| Event     | The event type or policy action.                              |
| Principal | The Docker user associated with the event.                    |
| Resource  | The target resource, such as a domain, file path, or tool.    |
| Decision  | The governance decision, such as allow, deny, or consent.     |
| Agent     | The AI agent associated with the event, when Docker knows it. |
@z

@x
## Filter and search events
@y
## Filter and search events
@z

@x
Use the audit log filters to narrow the event table by decision and time range.
Use search to find events by principal, resource, event type, or agent.
@y
Use the audit log filters to narrow the event table by decision and time range.
Use search to find events by principal, resource, event type, or agent.
@z

@x
The event table uses cursor pagination for large result sets.
@y
The event table uses cursor pagination for large result sets.
@z

@x
## Export events to CSV
@y
## Export events to CSV
@z

@x
Use CSV export when you need an offline copy of filtered audit events:
@y
Use CSV export when you need an offline copy of filtered audit events:
@z

@x
1. Open **Audit Events**.
1. Apply the filters and search terms for the events you want to export.
1. Select **Export**.
1. Download the generated CSV file from the link Docker provides.
@y
1. Open **Audit Events**.
1. Apply the filters and search terms for the events you want to export.
1. Select **Export**.
1. Download the generated CSV file from the link Docker provides.
@z

@x
CSV exports include up to 1 000 000 rows. Download links expire after 24 hours.
@y
CSV exports include up to 1 000 000 rows. Download links expire after 24 hours.
@z
