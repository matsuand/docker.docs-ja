%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Instrumenting a JavaScript App with OpenTelemetry
description: &desc Learn how to instrument a JavaScript application using OpenTelemetry in a Dockerized environment.
keywords: OpenTelemetry, observability, tracing
linktitle: Instrumenting JS Apps with OpenTelemetry
@y
title: Instrumenting a JavaScript App with OpenTelemetry
description: &desc Learn how to instrument a JavaScript application using OpenTelemetry in a Dockerized environment.
keywords: OpenTelemetry, observability, tracing
linktitle: Instrumenting JS Apps with OpenTelemetry
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
OpenTelemetry (OTel) is an open-source observability framework that provides a set of APIs, SDKs, and tools for collecting telemetry data, such as metrics, logs, and traces, from applications. With OpenTelemetry, developers can obtain valuable insights into how their services perform in production or during local development.
@y
OpenTelemetry (OTel) is an open-source observability framework that provides a set of APIs, SDKs, and tools for collecting telemetry data, such as metrics, logs, and traces, from applications. With OpenTelemetry, developers can obtain valuable insights into how their services perform in production or during local development.
@z

@x
A key component of OpenTelemetry is the OpenTelemetry Protocol (OTLP) a general-purpose, vendor-agnostic protocol designed to transmit telemetry data efficiently and reliably. OTLP supports multiple data types (traces, metrics, logs) over HTTP or gRPC, making it the default and recommended protocol for communication between instrumented applications, the OpenTelemetry Collector, and backends such as Jaeger or Prometheus.
@y
A key component of OpenTelemetry is the OpenTelemetry Protocol (OTLP) a general-purpose, vendor-agnostic protocol designed to transmit telemetry data efficiently and reliably. OTLP supports multiple data types (traces, metrics, logs) over HTTP or gRPC, making it the default and recommended protocol for communication between instrumented applications, the OpenTelemetry Collector, and backends such as Jaeger or Prometheus.
@z

@x
This guide walks you through how to instrument a simple Node.js application with OpenTelemetry and run both the app and a collector using Docker. This setup is ideal for local development and testing observability before integrating with external observability platforms like Prometheus, Jaeger, or Grafana.
@y
This guide walks you through how to instrument a simple Node.js application with OpenTelemetry and run both the app and a collector using Docker. This setup is ideal for local development and testing observability before integrating with external observability platforms like Prometheus, Jaeger, or Grafana.
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- How to set up OpenTelemetry in a Node.js app.
- How to run an OpenTelemetry Collector in Docker.
- How to visualize traces with Jaeger.
- How to use Docker Compose to manage the full observability stack.
@y
- How to set up OpenTelemetry in a Node.js app.
- How to run an OpenTelemetry Collector in Docker.
- How to visualize traces with Jaeger.
- How to use Docker Compose to manage the full observability stack.
@z

@x
## Using OpenTelemetry with Docker
@y
## Using OpenTelemetry with Docker
@z

@x
The [Docker Official Image for OpenTelemetry](https://hub.docker.com/r/otel/opentelemetry-collector-contrib) provides a convenient way to deploy and manage Dex instances. OpenTelemetry is available for various CPU architectures, including amd64, armv7, and arm64, ensuring compatibility with different devices and platforms. Same for the [Jaeger docekr image](https://hub.docker.com/r/jaegertracing/jaeger).
@y
The [Docker Official Image for OpenTelemetry](https://hub.docker.com/r/otel/opentelemetry-collector-contrib) provides a convenient way to deploy and manage Dex instances. OpenTelemetry is available for various CPU architectures, including amd64, armv7, and arm64, ensuring compatibility with different devices and platforms. Same for the [Jaeger docekr image](https://hub.docker.com/r/jaegertracing/jaeger).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
[Docker Compose](/compose/): Recommended for managing multi-container Docker applications.
@y
[Docker Compose](__SUBDIR__/compose/): Recommended for managing multi-container Docker applications.
@z

@x
Basic knowledge of Node.js and Docker.
@y
Basic knowledge of Node.js and Docker.
@z

@x
## Project Structure
@y
## Project Structure
@z

@x
Create the project directory:
```bash
mkdir otel-js-app
cd otel-js-app
```
@y
Create the project directory:
```bash
mkdir otel-js-app
cd otel-js-app
```
@z

@x
```bash
otel-js-app/
├── docker-compose.yaml
├── collector-config.yaml
├── app/
│   ├── package.json
│   ├── app.js
│   └── tracer.js
```
@y
```bash
otel-js-app/
├── docker-compose.yaml
├── collector-config.yaml
├── app/
│   ├── package.json
│   ├── app.js
│   └── tracer.js
```
@z

@x
## Create a Simple Node.js App
@y
## Create a Simple Node.js App
@z

@x
Initialize a basic Node.js app:
@y
Initialize a basic Node.js app:
@z

@x
```bash
mkdir app && cd app
npm init -y
npm install express @opentelemetry/api @opentelemetry/sdk-node \
            @opentelemetry/auto-instrumentations-node \
            @opentelemetry/exporter-trace-otlp-http
```
@y
```bash
mkdir app && cd app
npm init -y
npm install express @opentelemetry/api @opentelemetry/sdk-node \
            @opentelemetry/auto-instrumentations-node \
            @opentelemetry/exporter-trace-otlp-http
```
@z

@x
Now, add the application logic:
@y
Now, add the application logic:
@z

@x
```js
// app/app.js
const express = require('express');
require('./tracer'); // Initialize OpenTelemetry
@y
```js
// app/app.js
const express = require('express');
require('./tracer'); // Initialize OpenTelemetry
@z

@x
const app = express();
@y
const app = express();
@z

@x
app.get('/', (req, res) => {
  res.send('Hello from OpenTelemetry demo app!');
});
@y
app.get('/', (req, res) => {
  res.send('Hello from OpenTelemetry demo app!');
});
@z

@x
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`App listening at http://localhost:${PORT}`);
});
```
@y
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`App listening at http://localhost:${PORT}`);
});
```
@z

@x
## Configure OpenTelemetry Tracing
@y
## Configure OpenTelemetry Tracing
@z

@x
Create the tracer configuration file:
@y
Create the tracer configuration file:
@z

@x
```js
// app/tracer.js
const { NodeSDK } = require('@opentelemetry/sdk-node');
const { getNodeAutoInstrumentations } = require('@opentelemetry/auto-instrumentations-node');
const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-http');
@y
```js
// app/tracer.js
const { NodeSDK } = require('@opentelemetry/sdk-node');
const { getNodeAutoInstrumentations } = require('@opentelemetry/auto-instrumentations-node');
const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-http');
@z

@x
const sdk = new NodeSDK({
  traceExporter: new OTLPTraceExporter({
    url: 'http://collector:4318/v1/traces',
  }),
  instrumentations: [getNodeAutoInstrumentations()],
});
@y
const sdk = new NodeSDK({
  traceExporter: new OTLPTraceExporter({
    url: 'http://collector:4318/v1/traces',
  }),
  instrumentations: [getNodeAutoInstrumentations()],
});
@z

@x
sdk.start();
```
@y
sdk.start();
```
@z

@x
## Configure the OpenTelemetry Collector
@y
## Configure the OpenTelemetry Collector
@z

@x
Create a collector-config.yaml file at the root:
@y
Create a collector-config.yaml file at the root:
@z

@x
```yaml
# collector-config.yaml
receivers:
  otlp:
    protocols:
      http:
@y
```yaml
# collector-config.yaml
receivers:
  otlp:
    protocols:
      http:
@z

@x
exporters:
  logging:
    loglevel: debug
  jaeger:
    endpoint: jaeger:14250
    tls:
      insecure: true
@y
exporters:
  logging:
    loglevel: debug
  jaeger:
    endpoint: jaeger:14250
    tls:
      insecure: true
@z

@x
service:
  pipelines:
    traces:
      receivers: [otlp]
      exporters: [logging, jaeger]
```
@y
service:
  pipelines:
    traces:
      receivers: [otlp]
      exporters: [logging, jaeger]
```
@z

@x
## Add Docker Compose Configuration
@y
## Add Docker Compose Configuration
@z

@x
Create the `docker-compose.yaml` file:
@y
Create the `docker-compose.yaml` file:
@z

@x
```yaml
version: '3.9'
@y
```yaml
version: '3.9'
@z

@x
services:
  app:
    build: ./app
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
    depends_on:
      - collector
@y
services:
  app:
    build: ./app
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
    depends_on:
      - collector
@z

@x
  collector:
    image: otel/opentelemetry-collector:latest
    volumes:
      - ./collector-config.yaml:/etc/otelcol/config.yaml
    command: ["--config=/etc/otelcol/config.yaml"]
    ports:
      - "4318:4318" # OTLP
@y
  collector:
    image: otel/opentelemetry-collector:latest
    volumes:
      - ./collector-config.yaml:/etc/otelcol/config.yaml
    command: ["--config=/etc/otelcol/config.yaml"]
    ports:
      - "4318:4318" # OTLP
@z

@x
  jaeger:
    image: jaegertracing/all-in-one:latest
    ports:
      - "16686:16686" # UI
      - "14250:14250" # Collector gRPC
```
@y
  jaeger:
    image: jaegertracing/all-in-one:latest
    ports:
      - "16686:16686" # UI
      - "14250:14250" # Collector gRPC
```
@z

@x
Now, add the `Dockerfile` inside the `app/` folder:
@y
Now, add the `Dockerfile` inside the `app/` folder:
@z

@x
```dockerfile
# app/Dockerfile
FROM node:18
@y
```dockerfile
# app/Dockerfile
FROM node:18
@z

@x
WORKDIR /usr/src/app
COPY . .
RUN npm install
@y
WORKDIR /usr/src/app
COPY . .
RUN npm install
@z

@x
CMD ["node", "app.js"]
```
@y
CMD ["node", "app.js"]
```
@z

@x
## Start the Stack
@y
## Start the Stack
@z

@x
Start all services with Docker Compose:
@y
Start all services with Docker Compose:
@z

@x
```bash
docker compose up --build
```
@y
```bash
docker compose up --build
```
@z

@x
Once the services are running:
@y
Once the services are running:
@z

@x
Visit your app at [http://localhost:3000](http://localhost:3000)
@y
Visit your app at [http://localhost:3000](http://localhost:3000)
@z

@x
View traces at [http://localhost:16686](http://localhost:16686) in the Jaeger UI
@y
View traces at [http://localhost:16686](http://localhost:16686) in the Jaeger UI
@z

@x
## Verify Traces in Jaeger
@y
## Verify Traces in Jaeger
@z

@x
After visiting your app's root endpoint, open Jaeger’s UI, search for the service (default is usually `unknown_service` unless explicitly named), and check the traces.
@y
After visiting your app's root endpoint, open Jaeger’s UI, search for the service (default is usually `unknown_service` unless explicitly named), and check the traces.
@z

@x
You should see spans for the HTTP request, middleware, and auto-instrumented libraries.
@y
You should see spans for the HTTP request, middleware, and auto-instrumented libraries.
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
You now have a fully functional OpenTelemetry setup using Docker Compose. You've instrumented a basic JavaScript app to export traces and visualized them using Jaeger. This architecture is extendable for more complex applications and observability pipelines using Prometheus, Grafana, or cloud-native exporters.
@y
You now have a fully functional OpenTelemetry setup using Docker Compose. You've instrumented a basic JavaScript app to export traces and visualized them using Jaeger. This architecture is extendable for more complex applications and observability pipelines using Prometheus, Grafana, or cloud-native exporters.
@z

@x
For advanced topics such as custom span creation, metrics, and logs, consult the OpenTelemetry JavaScript docs.
@y
For advanced topics such as custom span creation, metrics, and logs, consult the OpenTelemetry JavaScript docs.
@z
