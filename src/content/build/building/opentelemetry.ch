%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: OpenTelemetry support
description: Analyze telemetry data for builds
keywords: build, buildx buildkit, opentelemetry
---
@y
---
title: OpenTelemetry support
description: Analyze telemetry data for builds
keywords: build, buildx buildkit, opentelemetry
---
@z

@x
Both Buildx and BuildKit support [OpenTelemetry](https://opentelemetry.io/).
@y
Both Buildx and BuildKit support [OpenTelemetry](https://opentelemetry.io/).
@z

@x
To capture the trace to [Jaeger](https://github.com/jaegertracing/jaeger),
set `JAEGER_TRACE` environment variable to the collection address using a
`driver-opt`.
@y
To capture the trace to [Jaeger](https://github.com/jaegertracing/jaeger),
set `JAEGER_TRACE` environment variable to the collection address using a
`driver-opt`.
@z

@x
First create a Jaeger container:
@y
First create a Jaeger container:
@z

@x
```console
$ docker run -d --name jaeger -p "6831:6831/udp" -p "16686:16686" --restart unless-stopped jaegertracing/all-in-one
```
@y
```console
$ docker run -d --name jaeger -p "6831:6831/udp" -p "16686:16686" --restart unless-stopped jaegertracing/all-in-one
```
@z

@x
Then [create a `docker-container` builder](../drivers/docker-container.md)
that will use the Jaeger instance via the `JAEGER_TRACE` env var:
@y
Then [create a `docker-container` builder](../drivers/docker-container.md)
that will use the Jaeger instance via the `JAEGER_TRACE` env var:
@z

@x
```console
$ docker buildx create --use \
  --name mybuilder \
  --driver docker-container \
  --driver-opt "network=host" \
  --driver-opt "env.JAEGER_TRACE=localhost:6831"
```
@y
```console
$ docker buildx create --use \
  --name mybuilder \
  --driver docker-container \
  --driver-opt "network=host" \
  --driver-opt "env.JAEGER_TRACE=localhost:6831"
```
@z

@x
Boot and [inspect `mybuilder`](../../engine/reference/commandline/buildx_inspect.md):
@y
Boot and [inspect `mybuilder`](../../engine/reference/commandline/buildx_inspect.md):
@z

@x
```console
$ docker buildx inspect --bootstrap
```
@y
```console
$ docker buildx inspect --bootstrap
```
@z

@x
Buildx commands should be traced at `http://127.0.0.1:16686/`:
@y
Buildx commands should be traced at `http://127.0.0.1:16686/`:
@z

@x
![OpenTelemetry Buildx Bake](../images/opentelemetry.png)
@y
![OpenTelemetry Buildx Bake](../images/opentelemetry.png)
@z
