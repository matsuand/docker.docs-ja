%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure audit delivery
linkTitle: Configure delivery
@y
title: Configure audit delivery
linkTitle: Configure delivery
@z

@x
description: Configure local and cloud delivery, retention, and history for Docker AI Governance Audit Logs.
keywords: docker sandboxes, audit delivery, AI Governance, audit logs, retention, cloud delivery, AI Platform
@y
description: Configure local and cloud delivery, retention, and history for Docker AI Governance Audit Logs.
keywords: docker sandboxes, audit delivery, AI Governance, audit logs, retention, cloud delivery, AI Platform
@z

@x
Organization owners and users with a [custom role](/manuals/enterprise/security/roles-and-permissions/custom-roles/_index.md) that includes AI Governance audit permissions can configure where Docker writes audit events.
Two delivery destinations are available and can be used independently or
together:
@y
Organization owners and users with a [custom role](manuals/enterprise/security/roles-and-permissions/custom-roles/_index.md) that includes AI Governance audit permissions can configure where Docker writes audit events.
Two delivery destinations are available and can be used independently or
together:
@z

@x
- **Local disk**: The sandbox daemon writes audit events to the local disk
  on each host.
- **Docker Cloud**: Audit events are sent to Docker's cloud platform, enabling
  the hosted log view, CSV export, and SIEM forwarding.
@y
- **Local disk**: The sandbox daemon writes audit events to the local disk
  on each host.
- **Docker Cloud**: Audit events are sent to Docker's cloud platform, enabling
  the hosted log view, CSV export, and SIEM forwarding.
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
Your organization needs:
@y
Your organization needs:
@z

@x
- A Docker [AI Governance plan](/manuals/subscription/plans/ai-governance.md)
- An enforced organization governance policy
- Organization owner access, or a [custom role](/manuals/enterprise/security/roles-and-permissions/custom-roles/_index.md) with AI Governance audit permissions
@y
- A Docker [AI Governance plan](manuals/subscription/plans/ai-governance.md)
- An enforced organization governance policy
- Organization owner access, or a [custom role](manuals/enterprise/security/roles-and-permissions/custom-roles/_index.md) with AI Governance audit permissions
@z

@x
Only users who have an AI Governance license and are governed by the enforced
organization policy send Docker Sandboxes audit data.
@y
Only users who have an AI Governance license and are governed by the enforced
organization policy send Docker Sandboxes audit data.
@z

@x
## Configure delivery
@y
## Configure delivery
@z

@x
To configure audit delivery:
@y
To configure audit delivery:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
2. Open your organization.
3. Go to **AI Platform** > **Audit logs**.
4. Open **Audit Delivery**.
5. Choose one or both delivery modes:
   - **Local disk** writes audit records to JSON Lines files on each host.
   - **Docker Cloud** stores audit records in Docker Cloud for hosted search,
     CSV export, and SIEM forwarding.
6. Save your changes.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
2. Open your organization.
3. Go to **AI Platform** > **Audit logs**.
4. Open **Audit Delivery**.
5. Choose one or both delivery modes:
   - **Local disk** writes audit records to JSON Lines files on each host.
   - **Docker Cloud** stores audit records in Docker Cloud for hosted search,
     CSV export, and SIEM forwarding.
6. Save your changes.
@z

@x
Cloud delivery is on by default when AI Governance is enabled. To keep records
local to your hosts, turn off **Docker Cloud** and keep **Local disk** on.
@y
Cloud delivery is on by default when AI Governance is enabled. To keep records
local to your hosts, turn off **Docker Cloud** and keep **Local disk** on.
@z

@x
Organizations that used local audit logging before hosted audit logs were
available start with cloud delivery off until an owner opts in.
@y
Organizations that used local audit logging before hosted audit logs were
available start with cloud delivery off until an owner opts in.
@z

@x
## Configure retention
@y
## Configure retention
@z

@x
When **Docker Cloud** is selected, you can also configure how long cloud-stored
events are retained:
@y
When **Docker Cloud** is selected, you can also configure how long cloud-stored
events are retained:
@z

@x
| Field                          | Description                                                        | Default |
| ------------------------------ | ------------------------------------------------------------------ | ------- |
| Searchable retention (days)    | How long events stay searchable in the hosted audit log view.      | 90 days |
| Archive retention (days)       | How long events are kept in long-term archive storage.             | 90 days |
@y
| Field                          | Description                                                        | Default |
| ------------------------------ | ------------------------------------------------------------------ | ------- |
| Searchable retention (days)    | How long events stay searchable in the hosted audit log view.      | 90 days |
| Archive retention (days)       | How long events are kept in long-term archive storage.             | 90 days |
@z

@x
Archive retention must be greater than or equal to searchable retention.
@y
Archive retention must be greater than or equal to searchable retention.
@z

@x
Retention reductions apply going forward. They don't delete records that were
already retained under a longer retention window.
@y
Retention reductions apply going forward. They don't delete records that were
already retained under a longer retention window.
@z

@x
## Audit delivery change history
@y
## Audit delivery change history
@z

@x
Docker keeps a record of every change made to your organization's audit delivery
settings. Each entry captures the timestamp, the user who made the change, and
the delivery configuration that was set. Use this history to audit configuration
changes and verify when delivery modes or retention windows were modified.
@y
Docker keeps a record of every change made to your organization's audit delivery
settings. Each entry captures the timestamp, the user who made the change, and
the delivery configuration that was set. Use this history to audit configuration
changes and verify when delivery modes or retention windows were modified.
@z

@x
Open **History** to review delivery and retention changes for your organization.
History entries show who made the change, when it happened, and the before and
after values.
@y
Open **History** to review delivery and retention changes for your organization.
History entries show who made the change, when it happened, and the before and
after values.
@z
