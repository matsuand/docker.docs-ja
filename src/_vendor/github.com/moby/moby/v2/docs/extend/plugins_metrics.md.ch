%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker metrics collector plugins
description: "Metrics plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide, metrics"
---
@y
---
title: Docker metrics collector plugins
description: "Metrics plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide, metrics"
---
@z

@x
Docker exposes internal metrics based on the Prometheus format. Metrics plugins
enable accessing these metrics in a consistent way by providing a Unix
socket at a predefined path where the plugin can scrape the metrics.
@y
Docker exposes internal metrics based on the Prometheus format. Metrics plugins
enable accessing these metrics in a consistent way by providing a Unix
socket at a predefined path where the plugin can scrape the metrics.
@z

@x
> [!NOTE]
> While the plugin interface for metrics is non-experimental, the naming of the
> metrics and metric labels is still considered experimental and may change in a
> future version.
@y
> [!NOTE]
> While the plugin interface for metrics is non-experimental, the naming of the
> metrics and metric labels is still considered experimental and may change in a
> future version.
@z

@x
## Creating a metrics plugin
@y
## Creating a metrics plugin
@z

@x
You must currently set `PropagatedMount` in the plugin `config.json` to
`/run/docker`. This allows the plugin to receive updated mounts
(the bind-mounted socket) from Docker after the plugin is already configured.
@y
You must currently set `PropagatedMount` in the plugin `config.json` to
`/run/docker`. This allows the plugin to receive updated mounts
(the bind-mounted socket) from Docker after the plugin is already configured.
@z

@x
## MetricsCollector protocol
@y
## MetricsCollector protocol
@z

@x
Metrics plugins must register as implementing the`MetricsCollector` interface
in `config.json`.
@y
Metrics plugins must register as implementing the`MetricsCollector` interface
in `config.json`.
@z

@x
On Unix platforms, the socket is located at `/run/docker/metrics.sock` in the
plugin's rootfs.
@y
On Unix platforms, the socket is located at `/run/docker/metrics.sock` in the
plugin's rootfs.
@z

@x
`MetricsCollector` must implement two endpoints:
@y
`MetricsCollector` must implement two endpoints:
@z

@x
### `MetricsCollector.StartMetrics`
@y
### `MetricsCollector.StartMetrics`
@z

@x
Signals to the plugin that the metrics socket is now available for scraping
@y
Signals to the plugin that the metrics socket is now available for scraping
@z

@x
Request:
@y
Request:
@z

@x
```json
{}
```
@y
```json
{}
```
@z

@x
The request has no payload.
@y
The request has no payload.
@z

@x
Response:
@y
Response:
@z

@x
```json
{
  "Err": ""
}
```
@y
```json
{
  "Err": ""
}
```
@z

@x
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@y
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@z

@x
### `MetricsCollector.StopMetrics`
@y
### `MetricsCollector.StopMetrics`
@z

@x
Signals to the plugin that the metrics socket is no longer available.
This may happen when the daemon is shutting down.
@y
Signals to the plugin that the metrics socket is no longer available.
This may happen when the daemon is shutting down.
@z

@x
Request:
@y
Request:
@z

@x
```json
{}
```
@y
```json
{}
```
@z

@x
The request has no payload.
@y
The request has no payload.
@z

@x
Response:
@y
Response:
@z

@x
```json
{
  "Err": ""
}
```
@y
```json
{
  "Err": ""
}
```
@z

@x
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@y
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@z
