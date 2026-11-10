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
description: Configure local and cloud delivery for Docker AI Governance audit logs, and review who changed the delivery settings.
keywords: docker sandboxes, audit delivery, AI Governance, audit logs, retention, cloud delivery, AI Platform
@y
description: Configure local and cloud delivery for Docker AI Governance audit logs, and review who changed the delivery settings.
keywords: docker sandboxes, audit delivery, AI Governance, audit logs, retention, cloud delivery, AI Platform
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Configure where Docker delivers your organization's audit records, and review
who changed those settings. You can deliver records to local disk on each host,
to Docker Cloud, or to both. For how the two delivery modes differ, see
[Delivery modes](_index.md#delivery-modes).
@y
Configure where Docker delivers your organization's audit records, and review
who changed those settings. You can deliver records to local disk on each host,
to Docker Cloud, or to both. For how the two delivery modes differ, see
[Delivery modes](_index.md#delivery-modes).
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
- A Docker [AI Governance plan](/manuals/subscription-billing/plans/ai-governance.md)
- Organization owner access, or a
  [custom role](/manuals/security/roles-and-permissions/custom-roles/_index.md)
  with AI Governance audit permissions
@y
- A Docker [AI Governance plan](manuals/subscription-billing/plans/ai-governance.md)
- Organization owner access, or a
  [custom role](manuals/security/roles-and-permissions/custom-roles/_index.md)
  with AI Governance audit permissions
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
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Audit delivery**.
1. Choose one or both delivery modes:
   - **Local disk** writes audit records to JSON Lines files on each host.
   - **Docker Cloud** stores audit records in Docker Cloud for hosted search,
     CSV export, and SIEM forwarding.
1. Save your changes.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Audit delivery**.
1. Choose one or both delivery modes:
   - **Local disk** writes audit records to JSON Lines files on each host.
   - **Docker Cloud** stores audit records in Docker Cloud for hosted search,
     CSV export, and SIEM forwarding.
1. Save your changes.
@z

@x
Cloud delivery is on by default, except for organizations that used local
audit logging before hosted audit logs were available. Those organizations start with cloud delivery off until an owner
turns it on. To keep records local to your hosts, turn off **Docker Cloud** and
keep **Local disk** on.
@y
Cloud delivery is on by default, except for organizations that used local
audit logging before hosted audit logs were available. Those organizations start with cloud delivery off until an owner
turns it on. To keep records local to your hosts, turn off **Docker Cloud** and
keep **Local disk** on.
@z

@x
The **Audit delivery** page shows how long Docker Cloud retains audit records.
@y
The **Audit delivery** page shows how long Docker Cloud retains audit records.
@z

@x
## Review delivery change history
@y
## Review delivery change history
@z

@x
Docker keeps a record of every change made to your organization's audit delivery
settings. Each entry shows who made the change, when it happened, and the before
and after values. Use this history to audit configuration changes and verify
when delivery modes were modified.
@y
Docker keeps a record of every change made to your organization's audit delivery
settings. Each entry shows who made the change, when it happened, and the before
and after values. Use this history to audit configuration changes and verify
when delivery modes were modified.
@z

@x
To review the history:
@y
To review the history:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **History**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **History**.
@z
