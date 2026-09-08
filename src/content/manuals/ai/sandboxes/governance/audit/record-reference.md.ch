%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Audit record reference
linkTitle: Record reference
@y
title: Audit record reference
linkTitle: Record reference
@z

@x
description: Reference fields, categories, decisions, and payload types for Docker AI Governance audit records.
keywords: docker sandboxes, audit record, audit schema, AI Governance, policy decision, action_type, jsonl
@y
description: Reference fields, categories, decisions, and payload types for Docker AI Governance audit records.
keywords: docker sandboxes, audit record, audit schema, AI Governance, policy decision, action_type, jsonl
@z

@x
Docker AI Governance audit records use one schema across delivery modes. Local
JSON Lines files and cloud-delivered records contain the same metadata fields.
@y
Docker AI Governance audit records use one schema across delivery modes. Local
JSON Lines files and cloud-delivered records contain the same metadata fields.
@z

@x
Records capture metadata only. They don't contain prompt content, agent output,
or parameter values. Parameter keys may appear when they help identify an
action.
@y
Records capture metadata only. They don't contain prompt content, agent output,
or parameter values. Parameter keys may appear when they help identify an
action.
@z

@x
## Common fields
@y
## Common fields
@z

@x
| Field              | Description                                                                                                      |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `audit_event_id`   | Unique ID for the audit event.                                                                                   |
| `timestamp`        | UTC time when Docker recorded the event.                                                                         |
| `schema_version`   | Version of the record schema. Pin SIEM field mappings to this value.                                             |
| `category`         | Event category, such as `AUDIT_CATEGORY_MANAGEMENT`, `AUDIT_CATEGORY_EVALUATION`, or `AUDIT_CATEGORY_EXECUTION`. |
| `decision`         | Governance decision for evaluation records.                                                                      |
| `username`         | The signed-in Docker user's Docker Hub username.                                                                 |
| `user_email`       | The signed-in Docker user's email address.                                                                       |
| `org_id`           | ID of the organization whose governance policy is in effect.                                                     |
| `org_name`         | Display name of the organization whose governance policy is in effect.                                           |
| `audit_session_id` | Identifies the daemon session that produced the record.                                                          |
| `resource_id`      | Target of the evaluation, such as a host and port, file path, or tool.                                           |
| `os`               | Operating system that produced the record.                                                                       |
| `app_version`      | Version of the Docker component that produced the record.                                                        |
| `client_name`      | Source component, such as `sbx` for Docker Sandboxes.                                                            |
| `hostname`         | Hostname of the machine that produced the record.                                                                |
| `deny_reason`      | Why a denied request was blocked. Present on deny decisions.                                                     |
| `action_type`      | Payload discriminator that identifies the action-specific object in the record.                                  |
| `agent`            | AI agent associated with the event, when Docker knows it.                                                        |
@y
| Field              | Description                                                                                                      |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `audit_event_id`   | Unique ID for the audit event.                                                                                   |
| `timestamp`        | UTC time when Docker recorded the event.                                                                         |
| `schema_version`   | Version of the record schema. Pin SIEM field mappings to this value.                                             |
| `category`         | Event category, such as `AUDIT_CATEGORY_MANAGEMENT`, `AUDIT_CATEGORY_EVALUATION`, or `AUDIT_CATEGORY_EXECUTION`. |
| `decision`         | Governance decision for evaluation records.                                                                      |
| `username`         | The signed-in Docker user's Docker Hub username.                                                                 |
| `user_email`       | The signed-in Docker user's email address.                                                                       |
| `org_id`           | ID of the organization whose governance policy is in effect.                                                     |
| `org_name`         | Display name of the organization whose governance policy is in effect.                                           |
| `audit_session_id` | Identifies the daemon session that produced the record.                                                          |
| `resource_id`      | Target of the evaluation, such as a host and port, file path, or tool.                                           |
| `os`               | Operating system that produced the record.                                                                       |
| `app_version`      | Version of the Docker component that produced the record.                                                        |
| `client_name`      | Source component, such as `sbx` for Docker Sandboxes.                                                            |
| `hostname`         | Hostname of the machine that produced the record.                                                                |
| `deny_reason`      | Why a denied request was blocked. Present on deny decisions.                                                     |
| `action_type`      | Payload discriminator that identifies the action-specific object in the record.                                  |
| `agent`            | AI agent associated with the event, when Docker knows it.                                                        |
@z

@x
## Categories
@y
## Categories
@z

@x
| Category                    | Description                                                   |
| --------------------------- | ------------------------------------------------------------- |
| `AUDIT_CATEGORY_MANAGEMENT` | Session lifecycle, policy sync, and configuration events.     |
| `AUDIT_CATEGORY_EVALUATION` | Governance policy decisions, such as allow, deny, or consent. |
| `AUDIT_CATEGORY_EXECUTION`  | Outcomes after an evaluated action runs.                      |
@y
| Category                    | Description                                                   |
| --------------------------- | ------------------------------------------------------------- |
| `AUDIT_CATEGORY_MANAGEMENT` | Session lifecycle, policy sync, and configuration events.     |
| `AUDIT_CATEGORY_EVALUATION` | Governance policy decisions, such as allow, deny, or consent. |
| `AUDIT_CATEGORY_EXECUTION`  | Outcomes after an evaluated action runs.                      |
@z

@x
## Decisions
@y
## Decisions
@z

@x
| Decision                           | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| `AUDIT_DECISION_ALLOW`             | Docker allowed the action.                     |
| `AUDIT_DECISION_DENY`              | Docker denied the action.                      |
| `AUDIT_DECISION_APPROVAL_REQUIRED` | Docker required consent before the action ran. |
| `AUDIT_DECISION_APPROVED`          | A consent request was approved.                |
| `AUDIT_DECISION_REJECTED`          | A consent request was rejected.                |
@y
| Decision                           | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| `AUDIT_DECISION_ALLOW`             | Docker allowed the action.                     |
| `AUDIT_DECISION_DENY`              | Docker denied the action.                      |
| `AUDIT_DECISION_APPROVAL_REQUIRED` | Docker required consent before the action ran. |
| `AUDIT_DECISION_APPROVED`          | A consent request was approved.                |
| `AUDIT_DECISION_REJECTED`          | A consent request was rejected.                |
@z

@x
## Action types
@y
## Action types
@z

@x
The `action_type` field identifies the action-specific payload in the record.
@y
The `action_type` field identifies the action-specific payload in the record.
@z

@x
| Action type            | Description                                  |
| ---------------------- | -------------------------------------------- |
| `session`              | Sandbox daemon session lifecycle event.      |
| `network_egress`       | Network access evaluation.                   |
| `filesystem_mount`     | Filesystem mount or path access evaluation.  |
| `tool_invocation`      | Tool invocation evaluation.                  |
| `resource_read`        | Resource read evaluation.                    |
| `server_registration`  | Server registration event.                   |
| `prompt`               | Prompt-related metadata event.               |
| `network_execution`    | Outcome of a network action.                 |
| `filesystem_execution` | Outcome of a filesystem action.              |
| `tool_execution`       | Outcome of a tool invocation.                |
| `resource_execution`   | Outcome of a resource read.                  |
| `policy_sync`          | Policy synchronization event.                |
| `pii_detection`        | Metadata event for a data detection result.  |
| `c_score_report`       | Metadata event for a C-score report.         |
| `policy_action`        | Policy configuration or policy action event. |
@y
| Action type            | Description                                  |
| ---------------------- | -------------------------------------------- |
| `session`              | Sandbox daemon session lifecycle event.      |
| `network_egress`       | Network access evaluation.                   |
| `filesystem_mount`     | Filesystem mount or path access evaluation.  |
| `tool_invocation`      | Tool invocation evaluation.                  |
| `resource_read`        | Resource read evaluation.                    |
| `server_registration`  | Server registration event.                   |
| `prompt`               | Prompt-related metadata event.               |
| `network_execution`    | Outcome of a network action.                 |
| `filesystem_execution` | Outcome of a filesystem action.              |
| `tool_execution`       | Outcome of a tool invocation.                |
| `resource_execution`   | Outcome of a resource read.                  |
| `policy_sync`          | Policy synchronization event.                |
| `pii_detection`        | Metadata event for a data detection result.  |
| `c_score_report`       | Metadata event for a C-score report.         |
| `policy_action`        | Policy configuration or policy action event. |
@z

@x
## Sample record
@y
## Sample record
@z

@x
```json
{
  "audit_event_id": "95e7257f-93c9-4f29-bde7-88830e2dae80",
  "timestamp": "2026-05-28T19:15:00.728933Z",
  "schema_version": "1.82.0",
  "category": "AUDIT_CATEGORY_EVALUATION",
  "decision": "AUDIT_DECISION_DENY",
  "username": "jordandoe",
  "user_email": "jordandoe@example.com",
  "org_id": "9f8e7d6c-5b4a-3210-fedc-ba9876543210",
  "org_name": "Acme Inc",
  "audit_session_id": "8a3bc076-79d0-4502-baf3-cc6ad35fb578",
  "resource_id": "example.com:443",
  "os": "macos",
  "app_version": "v0.31.0",
  "client_name": "sbx",
  "hostname": "host-machine",
  "deny_reason": [
    "no applicable policies for op(action=net:connect:tcp, resource=net:domain:example.com:443)"
  ],
  "action_type": "network_egress",
  "network_egress": { "protocol": "tcp" },
  "agent": "claude"
}
```
@y
```json
{
  "audit_event_id": "95e7257f-93c9-4f29-bde7-88830e2dae80",
  "timestamp": "2026-05-28T19:15:00.728933Z",
  "schema_version": "1.82.0",
  "category": "AUDIT_CATEGORY_EVALUATION",
  "decision": "AUDIT_DECISION_DENY",
  "username": "jordandoe",
  "user_email": "jordandoe@example.com",
  "org_id": "9f8e7d6c-5b4a-3210-fedc-ba9876543210",
  "org_name": "Acme Inc",
  "audit_session_id": "8a3bc076-79d0-4502-baf3-cc6ad35fb578",
  "resource_id": "example.com:443",
  "os": "macos",
  "app_version": "v0.31.0",
  "client_name": "sbx",
  "hostname": "host-machine",
  "deny_reason": [
    "no applicable policies for op(action=net:connect:tcp, resource=net:domain:example.com:443)"
  ],
  "action_type": "network_egress",
  "network_egress": { "protocol": "tcp" },
  "agent": "claude"
}
```
@z
