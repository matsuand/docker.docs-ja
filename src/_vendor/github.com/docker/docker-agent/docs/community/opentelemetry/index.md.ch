%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "OpenTelemetry Tracing"
description: "Export Docker Agent traces to any OTLP backend, including Langfuse and LangSmith, for debugging agentic workflows."
keywords: docker agent, ai agents, community, opentelemetry tracing
@y
title: "OpenTelemetry Tracing"
description: "Export Docker Agent traces to any OTLP backend, including Langfuse and LangSmith, for debugging agentic workflows."
keywords: docker agent, ai agents, community, opentelemetry tracing
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/community/opentelemetry/
@y
canonical: __SUBDIR__/ai/docker-agent/community/opentelemetry/
@z

@x
_Docker Agent can export OpenTelemetry traces of an agent run to any OTLP/HTTP backend. This is separate from [product-analytics telemetry](../telemetry/index.md) and is opt-in via the `--otel` flag._
@y
_Docker Agent can export OpenTelemetry traces of an agent run to any OTLP/HTTP backend. This is separate from [product-analytics telemetry](../telemetry/index.md) and is opt-in via the `--otel` flag._
@z

@x
When enabled, Docker Agent emits OpenTelemetry GenAI (`gen_ai.*`) and MCP (`mcp.*`) spans following the [OpenTelemetry semantic conventions](https://opentelemetry.io/docs/specs/semconv/gen-ai/). Spans cover the agent turn, model calls (with token usage and cost attributes), tool calls, MCP client/server activity, sub-agent hand-offs, and provider fallbacks. W3C `traceparent` context is propagated so the whole run renders as a single connected trace tree.
@y
When enabled, Docker Agent emits OpenTelemetry GenAI (`gen_ai.*`) and MCP (`mcp.*`) spans following the [OpenTelemetry semantic conventions](https://opentelemetry.io/docs/specs/semconv/gen-ai/). Spans cover the agent turn, model calls (with token usage and cost attributes), tool calls, MCP client/server activity, sub-agent hand-offs, and provider fallbacks. W3C `traceparent` context is propagated so the whole run renders as a single connected trace tree.
@z

@x
## Enabling
@y
## Enabling
@z

@x
```bash
docker agent run agent.yaml --otel
```
@y
```bash
docker agent run agent.yaml --otel
```
@z

@x
Without an exporter endpoint configured, spans are recorded locally as no-ops. To ship them somewhere, set the standard OTLP environment variables described below.
@y
Without an exporter endpoint configured, spans are recorded locally as no-ops. To ship them somewhere, set the standard OTLP environment variables described below.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Docker Agent reads the standard OTLP environment variables:
@y
Docker Agent reads the standard OTLP environment variables:
@z

@x
| Variable | Purpose |
| --- | --- |
| `OTEL_EXPORTER_OTLP_ENDPOINT` | Base OTLP/HTTP endpoint. The signal subpath (`/v1/traces`, `/v1/metrics`, `/v1/logs`) is appended automatically. |
| `OTEL_EXPORTER_OTLP_HEADERS` | Comma-separated `key=value` headers sent with every export request (for example, an `Authorization` header). |
| `OTEL_RESOURCE_ATTRIBUTES` | Extra resource attributes merged into every span. |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | Set to `true` to capture prompt and response message content as span attributes. Off by default. |
@y
| Variable | Purpose |
| --- | --- |
| `OTEL_EXPORTER_OTLP_ENDPOINT` | Base OTLP/HTTP endpoint. The signal subpath (`/v1/traces`, `/v1/metrics`, `/v1/logs`) is appended automatically. |
| `OTEL_EXPORTER_OTLP_HEADERS` | Comma-separated `key=value` headers sent with every export request (for example, an `Authorization` header). |
| `OTEL_RESOURCE_ATTRIBUTES` | Extra resource attributes merged into every span. |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | Set to `true` to capture prompt and response message content as span attributes. Off by default. |
@z

@x
> [!NOTE]
> **Base endpoint, not the full signal URL**
>
> Set `OTEL_EXPORTER_OTLP_ENDPOINT` to the **base** endpoint (for example `https://cloud.langfuse.com/api/public/otel`). Docker Agent appends `/v1/traces` for you, matching the value documented by Langfuse and LangSmith. A bare `host:port` is also accepted and gets `https://` (or `http://` for localhost).
@y
> [!NOTE]
> **Base endpoint, not the full signal URL**
>
> Set `OTEL_EXPORTER_OTLP_ENDPOINT` to the **base** endpoint (for example `https://cloud.langfuse.com/api/public/otel`). Docker Agent appends `/v1/traces` for you, matching the value documented by Langfuse and LangSmith. A bare `host:port` is also accepted and gets `https://` (or `http://` for localhost).
@z

@x
> [!WARNING]
> **Message content can contain sensitive data**
>
> `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` is off by default because chat history routinely contains PII, secrets, and internal documents. Enable it only for backends and environments where exporting that content is acceptable.
@y
> [!WARNING]
> **Message content can contain sensitive data**
>
> `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` is off by default because chat history routinely contains PII, secrets, and internal documents. Enable it only for backends and environments where exporting that content is acceptable.
@z

@x
## Backends
@y
## Backends
@z

@x
Protocol support is OTLP over HTTP (`http/protobuf`). gRPC endpoints are not currently supported.
@y
Protocol support is OTLP over HTTP (`http/protobuf`). gRPC endpoints are not currently supported.
@z

@x
### Langfuse
@y
### Langfuse
@z

@x
[Langfuse](https://langfuse.com) exposes an OTLP endpoint and authenticates with HTTP Basic auth built from a project's public and secret keys.
@y
[Langfuse](https://langfuse.com) exposes an OTLP endpoint and authenticates with HTTP Basic auth built from a project's public and secret keys.
@z

@x
```bash
# Base64 of "public_key:secret_key"
LANGFUSE_AUTH=$(echo -n "pk-lf-...:sk-lf-..." | base64)
@y
```bash
# Base64 of "public_key:secret_key"
LANGFUSE_AUTH=$(echo -n "pk-lf-...:sk-lf-..." | base64)
@z

@x
export OTEL_EXPORTER_OTLP_ENDPOINT="https://cloud.langfuse.com/api/public/otel"
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Basic ${LANGFUSE_AUTH}"
@y
export OTEL_EXPORTER_OTLP_ENDPOINT="https://cloud.langfuse.com/api/public/otel"
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Basic ${LANGFUSE_AUTH}"
@z

@x
docker agent run agent.yaml --otel
```
@y
docker agent run agent.yaml --otel
```
@z

@x
Regional and self-hosted hosts use the same `/api/public/otel` base path:
@y
Regional and self-hosted hosts use the same `/api/public/otel` base path:
@z

@x
| Region | Endpoint |
| --- | --- |
| EU | `https://cloud.langfuse.com/api/public/otel` |
| US | `https://us.cloud.langfuse.com/api/public/otel` |
| Self-hosted (>= v3.22.0) | `http://localhost:3000/api/public/otel` |
@y
| Region | Endpoint |
| --- | --- |
| EU | `https://cloud.langfuse.com/api/public/otel` |
| US | `https://us.cloud.langfuse.com/api/public/otel` |
| Self-hosted (>= v3.22.0) | `http://localhost:3000/api/public/otel` |
@z

@x
### LangSmith
@y
### LangSmith
@z

@x
[LangSmith](https://docs.langchain.com/langsmith/trace-with-opentelemetry) authenticates with an `x-api-key` header (the raw API key, with no `Basic`/`Bearer` prefix). An optional `Langsmith-Project` header routes traces to a named project.
@y
[LangSmith](https://docs.langchain.com/langsmith/trace-with-opentelemetry) authenticates with an `x-api-key` header (the raw API key, with no `Basic`/`Bearer` prefix). An optional `Langsmith-Project` header routes traces to a named project.
@z

@x
```bash
export OTEL_EXPORTER_OTLP_ENDPOINT="https://api.smith.langchain.com/otel"
export OTEL_EXPORTER_OTLP_HEADERS="x-api-key=<your-api-key>,Langsmith-Project=<project>"
@y
```bash
export OTEL_EXPORTER_OTLP_ENDPOINT="https://api.smith.langchain.com/otel"
export OTEL_EXPORTER_OTLP_HEADERS="x-api-key=<your-api-key>,Langsmith-Project=<project>"
@z

@x
docker agent run agent.yaml --otel
```
@y
docker agent run agent.yaml --otel
```
@z

@x
### OpenTelemetry Collector
@y
### OpenTelemetry Collector
@z

@x
Any OTLP/HTTP collector (the OpenTelemetry Collector, Grafana Alloy, Jaeger, and so on) works by pointing at its base endpoint:
@y
Any OTLP/HTTP collector (the OpenTelemetry Collector, Grafana Alloy, Jaeger, and so on) works by pointing at its base endpoint:
@z

@x
```bash
export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318"
docker agent run agent.yaml --otel
```
@y
```bash
export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318"
docker agent run agent.yaml --otel
```
@z

@x
> [!NOTE]
> **Langfuse and LangSmith ingest traces only**
>
> Both backends accept the traces signal only. Docker Agent also wires metric and log exporters at the same endpoint, so their periodic exports return `404` against trace-only backends. This is harmless to traces but appears in the debug log. Point a full OTLP collector at the endpoint if you also want metrics and logs.
@y
> [!NOTE]
> **Langfuse and LangSmith ingest traces only**
>
> Both backends accept the traces signal only. Docker Agent also wires metric and log exporters at the same endpoint, so their periodic exports return `404` against trace-only backends. This is harmless to traces but appears in the debug log. Point a full OTLP collector at the endpoint if you also want metrics and logs.
@z

@x
## Inspecting traces locally
@y
## Inspecting traces locally
@z

@x
Use `--debug` to print telemetry activity to the debug log (`~/.cagent/cagent.debug.log` by default) without standing up a backend:
@y
Use `--debug` to print telemetry activity to the debug log (`~/.cagent/cagent.debug.log` by default) without standing up a backend:
@z

@x
```bash
docker agent run agent.yaml --otel --debug
```
@y
```bash
docker agent run agent.yaml --otel --debug
```
@z
