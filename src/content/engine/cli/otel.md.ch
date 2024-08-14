%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: OpenTelemetry for the Docker CLI
description: Learn about how to capture OpenTelemetry metrics for the Docker command line
keywords: otel, opentelemetry, telemetry, traces, tracing, metrics, logs
aliases:
  - /config/otel/
---
@y
---
title: OpenTelemetry for the Docker CLI
description: Learn about how to capture OpenTelemetry metrics for the Docker command line
keywords: otel, opentelemetry, telemetry, traces, tracing, metrics, logs
aliases:
  - /config/otel/
---
@z

@x
{{< introduced engine 26.1.0 >}}
@y
{{< introduced engine 26.1.0 >}}
@z

@x
The Docker CLI supports [OpenTelemetry](https://opentelemetry.io/docs/) instrumentation
for emitting metrics about command invocations. This is disabled by default.
You can configure the CLI to start emitting metrics to the endpoint that you
specify. This allows you to capture information about your `docker` command
invocations for more insight into your Docker usage.
@y
The Docker CLI supports [OpenTelemetry](https://opentelemetry.io/docs/) instrumentation
for emitting metrics about command invocations. This is disabled by default.
You can configure the CLI to start emitting metrics to the endpoint that you
specify. This allows you to capture information about your `docker` command
invocations for more insight into your Docker usage.
@z

@x
Exporting metrics is opt-in, and you control where data is being sent by
specifying the destination address of the metrics collector.
@y
Exporting metrics is opt-in, and you control where data is being sent by
specifying the destination address of the metrics collector.
@z

@x
## What is OpenTelemetry?
@y
## What is OpenTelemetry?
@z

@x
OpenTelemetry, or OTel for short, is an open observability framework for
creating and managing telemetry data, such as traces, metrics, and logs.
OpenTelemetry is vendor- and tool-agnostic, meaning that it can be used with a
broad variety of Observability backends.
@y
OpenTelemetry, or OTel for short, is an open observability framework for
creating and managing telemetry data, such as traces, metrics, and logs.
OpenTelemetry is vendor- and tool-agnostic, meaning that it can be used with a
broad variety of Observability backends.
@z

@x
Support for OpenTelemetry instrumentation in the Docker CLI means that the CLI can emit
information about events that take place, using the protocols and conventions
defined in the Open Telemetry specification.
@y
Support for OpenTelemetry instrumentation in the Docker CLI means that the CLI can emit
information about events that take place, using the protocols and conventions
defined in the Open Telemetry specification.
@z

@x
## How it works
@y
## How it works
@z

@x
The Docker CLI doesn't emit telemetry data by default. Only if you've set an
environment variable on your system will Docker CLI attempt to emit OpenTelemetry
metrics, to the endpoint that you specify.
@y
The Docker CLI doesn't emit telemetry data by default. Only if you've set an
environment variable on your system will Docker CLI attempt to emit OpenTelemetry
metrics, to the endpoint that you specify.
@z

@x
```bash
DOCKER_CLI_OTEL_EXPORTER_OTLP_ENDPOINT=<endpoint>
```
@y
```bash
DOCKER_CLI_OTEL_EXPORTER_OTLP_ENDPOINT=<endpoint>
```
@z

@x
The variable specifies the endpoint of an OpenTelemetry collector, where telemetry data
about `docker` CLI invocation should be sent. To capture the data, you'll need
an OpenTelemetry collector listening on that endpoint.
@y
The variable specifies the endpoint of an OpenTelemetry collector, where telemetry data
about `docker` CLI invocation should be sent. To capture the data, you'll need
an OpenTelemetry collector listening on that endpoint.
@z

@x
The purpose of a collector is to receive the telemetry data, process it, and
exports it to a backend. The backend is where the telemetry data gets stored.
You can choose from a number of different backends, such as Prometheus or
InfluxDB.
@y
The purpose of a collector is to receive the telemetry data, process it, and
exports it to a backend. The backend is where the telemetry data gets stored.
You can choose from a number of different backends, such as Prometheus or
InfluxDB.
@z

@x
Some backends provide tools for visualizing the metrics directly.
Alternatively, you can also run a dedicated frontend with support for
generating more useful graphs, such as Grafana.
@y
Some backends provide tools for visualizing the metrics directly.
Alternatively, you can also run a dedicated frontend with support for
generating more useful graphs, such as Grafana.
@z

@x
## Setup
@y
## Setup
@z

@x
To get started capturing telemetry data for the Docker CLI, you'll need to:
@y
To get started capturing telemetry data for the Docker CLI, you'll need to:
@z

@x
- Set the `DOCKER_CLI_OTEL_EXPORTER_OTLP_ENDPOINT` environment variable to point to an OpenTelemetry collector endpoint
- Run an OpenTelemetry collector that receives the signals from CLI command invocations
- Run a backend for storing the data received from the collector
@y
- Set the `DOCKER_CLI_OTEL_EXPORTER_OTLP_ENDPOINT` environment variable to point to an OpenTelemetry collector endpoint
- Run an OpenTelemetry collector that receives the signals from CLI command invocations
- Run a backend for storing the data received from the collector
@z

@x
The following Docker Compose file bootstraps a set of services to get started with OpenTelemetry.
It includes an OpenTelemetry collector that the CLI can send metrics to,
and a Prometheus backend that scrapes the metrics off the collector.
@y
The following Docker Compose file bootstraps a set of services to get started with OpenTelemetry.
It includes an OpenTelemetry collector that the CLI can send metrics to,
and a Prometheus backend that scrapes the metrics off the collector.
@z

@x
```yaml {collapse=true,title=compose.yml}
name: cli-otel
services:
  prometheus:
    image: prom/prometheus
    command:
      - "--config.file=/etc/prometheus/prom.yml"
    ports:
      # Publish the Prometheus frontend on localhost:9091
      - 9091:9090
    restart: always
    volumes:
      # Store Prometheus data in a volume:
      - prom_data:/prometheus
      # Mount the prom.yml config file
      - ./prom.yml:/etc/prometheus/prom.yml
  otelcol:
    image: otel/opentelemetry-collector
    restart: always
    depends_on:
      - prometheus
    ports:
      - 4317:4317
    volumes:
      # Mount the otelcol.yml config file
      - ./otelcol.yml:/etc/otelcol/config.yaml
@y
```yaml {collapse=true,title=compose.yml}
name: cli-otel
services:
  prometheus:
    image: prom/prometheus
    command:
      - "--config.file=/etc/prometheus/prom.yml"
    ports:
      # Publish the Prometheus frontend on localhost:9091
      - 9091:9090
    restart: always
    volumes:
      # Store Prometheus data in a volume:
      - prom_data:/prometheus
      # Mount the prom.yml config file
      - ./prom.yml:/etc/prometheus/prom.yml
  otelcol:
    image: otel/opentelemetry-collector
    restart: always
    depends_on:
      - prometheus
    ports:
      - 4317:4317
    volumes:
      # Mount the otelcol.yml config file
      - ./otelcol.yml:/etc/otelcol/config.yaml
@z

@x
volumes:
  prom_data:
```
@y
volumes:
  prom_data:
```
@z

@x
This service assumes that the following two configuration files exist alongside
`compose.yml`:
@y
This service assumes that the following two configuration files exist alongside
`compose.yml`:
@z

@x
- ```yaml {collapse=true,title=otelcol.yml}
  # Receive signals over gRPC and HTTP
  receivers:
    otlp:
      protocols:
        grpc:
        http:
@y
- ```yaml {collapse=true,title=otelcol.yml}
  # Receive signals over gRPC and HTTP
  receivers:
    otlp:
      protocols:
        grpc:
        http:
@z

@x
  # Establish an endpoint for Prometheus to scrape from
  exporters:
    prometheus:
      endpoint: "0.0.0.0:8889"
@y
  # Establish an endpoint for Prometheus to scrape from
  exporters:
    prometheus:
      endpoint: "0.0.0.0:8889"
@z

@x
  service:
    pipelines:
      metrics:
        receivers: [otlp]
        exporters: [prometheus]
  ```
@y
  service:
    pipelines:
      metrics:
        receivers: [otlp]
        exporters: [prometheus]
  ```
@z

@x
- ```yaml {collapse=true,title=prom.yml}
  # Configure Prometheus to scrape the OpenTelemetry collector endpoint
  scrape_configs:
    - job_name: "otel-collector"
      scrape_interval: 1s
      static_configs:
        - targets: ["otelcol:8889"]
  ```
@y
- ```yaml {collapse=true,title=prom.yml}
  # Configure Prometheus to scrape the OpenTelemetry collector endpoint
  scrape_configs:
    - job_name: "otel-collector"
      scrape_interval: 1s
      static_configs:
        - targets: ["otelcol:8889"]
  ```
@z

@x
With these files in place:
@y
With these files in place:
@z

@x
1. Start the Docker Compose services:
@y
1. Start the Docker Compose services:
@z

@x
   ```console
   $ docker compose up
   ```
@y
   ```console
   $ docker compose up
   ```
@z

@x
2. Configure Docker CLI to export telemetry to the OpenTelemetry collector.
@y
2. Configure Docker CLI to export telemetry to the OpenTelemetry collector.
@z

@x
   ```console
   $ export DOCKER_CLI_OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
   ```
@y
   ```console
   $ export DOCKER_CLI_OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
   ```
@z

@x
3. Run a `docker` command to trigger the CLI into sending a metric signal to
   the OpenTelemetry collector.
@y
3. Run a `docker` command to trigger the CLI into sending a metric signal to
   the OpenTelemetry collector.
@z

@x
   ```console
   $ docker version
   ```
@y
   ```console
   $ docker version
   ```
@z

@x
4. To view telemetry metrics created by the CLI, open the Prometheus expression
   browser by going to <http://localhost:9091/graph>.
@y
4. To view telemetry metrics created by the CLI, open the Prometheus expression
   browser by going to <http://localhost:9091/graph>.
@z

@x
5. In the **Query** field, enter `command_time_milliseconds_total`, and execute
   the query to see the telemetry data.
@y
5. In the **Query** field, enter `command_time_milliseconds_total`, and execute
   the query to see the telemetry data.
@z

@x
## Available metrics
@y
## Available metrics
@z

@x
Docker CLI currently exports a single metric, `command.time`, which measures
the execution duration of a command in milliseconds. This metric has the
following attributes:
@y
Docker CLI currently exports a single metric, `command.time`, which measures
the execution duration of a command in milliseconds. This metric has the
following attributes:
@z

@x
- `command.name`: the name of the command
- `command.status.code`: the exit code of the command
- `command.stderr.isatty`: true if stderr is attached to a TTY
- `command.stdin.isatty`: true if stdin is attached to a TTY
- `command.stdout.isatty`: true if stdout is attached to a TTY
@y
- `command.name`: the name of the command
- `command.status.code`: the exit code of the command
- `command.stderr.isatty`: true if stderr is attached to a TTY
- `command.stdin.isatty`: true if stdin is attached to a TTY
- `command.stdout.isatty`: true if stdout is attached to a TTY
@z
