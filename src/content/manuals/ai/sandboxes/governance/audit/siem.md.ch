%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: SIEM forwarding
linkTitle: SIEM forwarding
@y
title: SIEM forwarding
linkTitle: SIEM forwarding
@z

@x
description: Forward Docker AI Governance audit events to Splunk, Dynatrace, Datadog, or Sumo Logic.
keywords: docker sandboxes, SIEM, audit logs, Splunk, Dynatrace, Datadog, Sumo Logic, AI Governance, forwarding, NDJSON
@y
description: Forward Docker AI Governance audit events to Splunk, Dynatrace, Datadog, or Sumo Logic.
keywords: docker sandboxes, SIEM, audit logs, Splunk, Dynatrace, Datadog, Sumo Logic, AI Governance, forwarding, NDJSON
@z

@x
{{< summary-bar feature_name="AI Governance Audit Logs" >}}
@y
{{< summary-bar feature_name="AI Governance Audit Logs" >}}
@z

@x
Docker can forward audit events to your security information and event
management (SIEM) system, letting you centralize Docker governance data
alongside other security signals. Docker verifies the endpoint is reachable
with the supplied credential before saving.
@y
Docker can forward audit events to your security information and event
management (SIEM) system, letting you centralize Docker governance data
alongside other security signals. Docker verifies the endpoint is reachable
with the supplied credential before saving.
@z

@x
## Supported destinations
@y
## Supported destinations
@z

@x
| Destination                      | Description                                                     |
| -------------------------------- | --------------------------------------------------------------- |
| Splunk Cloud (HEC)               | Hosted Splunk using the HTTP Event Collector                    |
| Dynatrace                        | Dynatrace Log Management using the Log Ingest API               |
| Datadog                          | Datadog Logs using the HTTP log intake API                      |
| Sumo Logic                       | Sumo Logic using an HTTP Source                                 |
@y
| Destination                      | Description                                                     |
| -------------------------------- | --------------------------------------------------------------- |
| Splunk Cloud (HEC)               | Hosted Splunk using the HTTP Event Collector                    |
| Dynatrace                        | Dynatrace Log Management using the Log Ingest API               |
| Datadog                          | Datadog Logs using the HTTP log intake API                      |
| Sumo Logic                       | Sumo Logic using an HTTP Source                                 |
@z

@x
## Before you begin
@y
## Before you begin
@z

@x
SIEM forwarding requires Docker Sandboxes
[0.39.0](/manuals/ai/sandboxes/release-notes.md) or later. Earlier versions
don't deliver audit records to a SIEM destination, even when forwarding is
configured. Update Docker Sandboxes before enabling a new destination.
@y
SIEM forwarding requires Docker Sandboxes
[0.39.0](manuals/ai/sandboxes/release-notes.md) or later. Earlier versions
don't deliver audit records to a SIEM destination, even when forwarding is
configured. Update Docker Sandboxes before enabling a new destination.
@z

@x
SIEM forwarding requires Docker Cloud delivery to be enabled for your
organization. If you haven't already, enable it under **AI Platform** >
**Audit logs** > **Audit delivery** before configuring a SIEM destination. See
[Configure audit delivery](configure.md).
@y
SIEM forwarding requires Docker Cloud delivery to be enabled for your
organization. If you haven't already, enable it under **AI Platform** >
**Audit logs** > **Audit delivery** before configuring a SIEM destination. See
[Configure audit delivery](configure.md).
@z

@x
Gather credentials from your SIEM before configuring forwarding:
@y
Gather credentials from your SIEM before configuring forwarding:
@z

@x
- **Splunk Cloud**: HEC ingest URL and an HEC token. Optionally, a Splunk index
  name. See [Splunk documentation](https://docs.splunk.com/).
- **Dynatrace**: Log Ingest API URL and an API token with the `logs.ingest`
  scope. See [Dynatrace documentation](https://docs.dynatrace.com/).
- **Datadog**: Logs intake URL for your Datadog site and an API key. See
  [Datadog documentation](https://docs.datadoghq.com/).
- **Sumo Logic**: HTTP Source URL and an auth token from an HTTP Logs &
  Metrics source. See [Sumo Logic documentation](https://www.sumologic.com/help/).
@y
- **Splunk Cloud**: HEC ingest URL and an HEC token. Optionally, a Splunk index
  name. See [Splunk documentation](https://docs.splunk.com/).
- **Dynatrace**: Log Ingest API URL and an API token with the `logs.ingest`
  scope. See [Dynatrace documentation](https://docs.dynatrace.com/).
- **Datadog**: Logs intake URL for your Datadog site and an API key. See
  [Datadog documentation](https://docs.datadoghq.com/).
- **Sumo Logic**: HTTP Source URL and an auth token from an HTTP Logs &
  Metrics source. See [Sumo Logic documentation](https://www.sumologic.com/help/).
@z

@x
## Add a SIEM destination
@y
## Add a SIEM destination
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Open your organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Export & Connectors**.
1. Select **Add destination**.
1. Select your destination and complete the form.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Open your organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Export & Connectors**.
1. Select **Add destination**.
1. Select your destination and complete the form.
1. Select **Save**.
@z

@x
If verification fails, check that the URL and credential are correct and that
the endpoint is accessible from the internet.
@y
If verification fails, check that the URL and credential are correct and that
the endpoint is accessible from the internet.
@z

@x
## Manage destinations
@y
## Manage destinations
@z

@x
From the **SIEM forwarding** list, select the menu next to a destination to
edit or delete it. The edit form lets you update credentials and toggle
forwarding on or off for that destination. Deleting a destination permanently
removes the endpoint and its stored credential and cannot be undone.
@y
From the **SIEM forwarding** list, select the menu next to a destination to
edit or delete it. The edit form lets you update credentials and toggle
forwarding on or off for that destination. Deleting a destination permanently
removes the endpoint and its stored credential and cannot be undone.
@z
