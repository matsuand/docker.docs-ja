%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Forward audit events to a SIEM
linkTitle: Forward to a SIEM
@y
title: Forward audit events to a SIEM
linkTitle: Forward to a SIEM
@z

@x
description: Forward Docker AI Governance audit events to Splunk, Dynatrace, Datadog, Sumo Logic, or CrowdStrike Falcon Next-Gen SIEM.
keywords: docker sandboxes, SIEM, audit logs, Splunk, Dynatrace, Datadog, Sumo Logic, CrowdStrike, Falcon Next-Gen SIEM, AI Governance, forwarding, NDJSON
@y
description: Forward Docker AI Governance audit events to Splunk, Dynatrace, Datadog, Sumo Logic, or CrowdStrike Falcon Next-Gen SIEM.
keywords: docker sandboxes, SIEM, audit logs, Splunk, Dynatrace, Datadog, Sumo Logic, CrowdStrike, Falcon Next-Gen SIEM, AI Governance, forwarding, NDJSON
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Send your Docker AI Governance audit events to your security information and
event management (SIEM) system to centralize Docker governance data alongside
other security signals. How you do it depends on where your audit records are
delivered:
@y
Send your Docker AI Governance audit events to your security information and
event management (SIEM) system to centralize Docker governance data alongside
other security signals. How you do it depends on where your audit records are
delivered:
@z

@x
- With cloud delivery, Docker forwards events directly to a supported
  SIEM destination.
- With local delivery, your own log shipper collects the audit files from
  each machine.
@y
- With cloud delivery, Docker forwards events directly to a supported
  SIEM destination.
- With local delivery, your own log shipper collects the audit files from
  each machine.
@z

@x
## Forward events from Docker Cloud
@y
## Forward events from Docker Cloud
@z

@x
Docker forwards audit events from Docker Cloud to the SIEM destinations you
add in Docker Home.
@y
Docker forwards audit events from Docker Cloud to the SIEM destinations you
add in Docker Home.
@z

@x
### Supported destinations
@y
### Supported destinations
@z

@x
| Destination                                                                                          | Connects through           | What you need                                                                            |
| ---------------------------------------------------------------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------- |
| [Splunk Cloud](https://docs.splunk.com/)                                                             | HTTP Event Collector (HEC) | HEC ingest URL and an HEC token. Optionally, a Splunk index name.                        |
| [Dynatrace](https://docs.dynatrace.com/)                                                             | Log Ingest API             | Log Ingest API URL and an API token with the `logs.ingest` scope.                        |
| [Datadog](https://docs.datadoghq.com/)                                                               | HTTP log intake API        | Logs intake URL for your Datadog site and an API key.                                    |
| [Sumo Logic](https://www.sumologic.com/help/)                                                        | HTTP Source                | HTTP Source URL and an auth token from an HTTP Logs & Metrics source.                    |
| [CrowdStrike Falcon Next-Gen SIEM](https://library.humio.com/logscale-api/log-shippers-hec-raw.html) | HEC / HTTP Event Connector | API URL and an API key from the connector. Append `/raw` to the API URL when you add it. |
@y
| Destination                                                                                          | Connects through           | What you need                                                                            |
| ---------------------------------------------------------------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------- |
| [Splunk Cloud](https://docs.splunk.com/)                                                             | HTTP Event Collector (HEC) | HEC ingest URL and an HEC token. Optionally, a Splunk index name.                        |
| [Dynatrace](https://docs.dynatrace.com/)                                                             | Log Ingest API             | Log Ingest API URL and an API token with the `logs.ingest` scope.                        |
| [Datadog](https://docs.datadoghq.com/)                                                               | HTTP log intake API        | Logs intake URL for your Datadog site and an API key.                                    |
| [Sumo Logic](https://www.sumologic.com/help/)                                                        | HTTP Source                | HTTP Source URL and an auth token from an HTTP Logs & Metrics source.                    |
| [CrowdStrike Falcon Next-Gen SIEM](https://library.humio.com/logscale-api/log-shippers-hec-raw.html) | HEC / HTTP Event Connector | API URL and an API key from the connector. Append `/raw` to the API URL when you add it. |
@z

@x
### Before you begin
@y
### Before you begin
@z

@x
You need organization owner access, or a
[custom role](/manuals/security/roles-and-permissions/custom-roles/_index.md)
with AI Governance audit permissions.
@y
You need organization owner access, or a
[custom role](manuals/security/roles-and-permissions/custom-roles/_index.md)
with AI Governance audit permissions.
@z

@x
SIEM forwarding requires cloud delivery to be enabled for your
organization. If you haven't already, enable it under **AI Platform** > **Audit
logs** > **Audit delivery** before configuring a SIEM destination. For more
details, see [Configure audit delivery](configure.md).
@y
SIEM forwarding requires cloud delivery to be enabled for your
organization. If you haven't already, enable it under **AI Platform** > **Audit
logs** > **Audit delivery** before configuring a SIEM destination. For more
details, see [Configure audit delivery](configure.md).
@z

@x
Gather the endpoint URL and credential your destination needs, listed in
Supported destinations. Some destinations require you
to create a connector or source first.
@y
Gather the endpoint URL and credential your destination needs, listed in
Supported destinations. Some destinations require you
to create a connector or source first.
@z

@x
### Add a SIEM destination
@y
### Add a SIEM destination
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Export & Connectors**.
1. Select **Add destination**.
1. Select your destination and complete the form.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
   organization.
1. Go to **AI Platform** > **Audit logs**.
1. Open **Export & Connectors**.
1. Select **Add destination**.
1. Select your destination and complete the form.
1. Select **Save**.
@z

@x
Docker verifies the endpoint is reachable with the supplied credential before
saving. If verification fails, check that the URL and credential are correct
and that the endpoint is accessible from the internet.
@y
Docker verifies the endpoint is reachable with the supplied credential before
saving. If verification fails, check that the URL and credential are correct
and that the endpoint is accessible from the internet.
@z

@x
### Edit or delete a destination
@y
### Edit or delete a destination
@z

@x
From the **SIEM forwarding** list, select the menu next to a destination to
edit or delete it. The edit form lets you update credentials and toggle
forwarding on or off for that destination. Deleting a destination permanently
removes the endpoint and its stored credential and can't be undone.
@y
From the **SIEM forwarding** list, select the menu next to a destination to
edit or delete it. The edit form lets you update credentials and toggle
forwarding on or off for that destination. Deleting a destination permanently
removes the endpoint and its stored credential and can't be undone.
@z

@x
## Collect local audit files with a log shipper
@y
## Collect local audit files with a log shipper
@z

@x
With local delivery, each machine writes its audit records to `.jsonl`
files in its own audit directory. For the directory on each operating system
and how files are named, see
[Where records are stored](_index.md#where-records-are-stored).
@y
With local delivery, each machine writes its audit records to `.jsonl`
files in its own audit directory. For the directory on each operating system
and how files are named, see
[Where records are stored](_index.md#where-records-are-stored).
@z

@x
Point your log shipper at the audit directory and configure it to collect
`.jsonl` files only. Tools such as the Splunk Universal Forwarder,
Filebeat, and CrowdStrike Falcon LogScale read the directory and forward each
line as an event. Because in-progress records live in `.tmp` files until they
are finalized, collectors never see partial records.
@y
Point your log shipper at the audit directory and configure it to collect
`.jsonl` files only. Tools such as the Splunk Universal Forwarder,
Filebeat, and CrowdStrike Falcon LogScale read the directory and forward each
line as an event. Because in-progress records live in `.tmp` files until they
are finalized, collectors never see partial records.
@z
