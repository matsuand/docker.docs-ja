%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Python
description: Migrate a Python application to Docker Hardened Images
@y
title: Python
description: Migrate a Python application to Docker Hardened Images
@z

@x
keywords: python, migration, dhi
@y
keywords: python, migration, dhi
@z

@x
This example shows how to migrate a Python application to Docker Hardened Images.
@y
This example shows how to migrate a Python application to Docker Hardened Images.
@z

@x
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@y
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@z

@x
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@y
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@z

@x
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Run `docker login dhi.io` to authenticate.
@y
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Run `docker login dhi.io` to authenticate.
@z

@x
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@y
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM cgr.dev/chainguard/python:latest-dev AS builder
@y
FROM cgr.dev/chainguard/python:latest-dev AS builder
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache gcc musl-dev
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache gcc musl-dev
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
FROM cgr.dev/chainguard/python:latest
@y
FROM cgr.dev/chainguard/python:latest
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
COPY app.py ./
COPY --from=builder /app/venv /app/venv
@y
COPY app.py ./
COPY --from=builder /app/venv /app/venv
@z

@x
ENTRYPOINT [ "python", "/app/app.py" ]
```
@y
ENTRYPOINT [ "python", "/app/app.py" ]
```
@z

@x
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@y
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM python:latest AS builder
@y
FROM python:latest AS builder
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*
@y
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
FROM python:latest
@y
FROM python:latest
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
COPY app.py ./
COPY --from=builder /app/venv /app/venv
@y
COPY app.py ./
COPY --from=builder /app/venv /app/venv
@z

@x
ENTRYPOINT [ "python", "/app/app.py" ]
```
@y
ENTRYPOINT [ "python", "/app/app.py" ]
```
@z

@x
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@y
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
# === Build stage: Install dependencies and create virtual environment ===
FROM dhi.io/python:3.13-alpine3.21-dev AS builder
@y
# === Build stage: Install dependencies and create virtual environment ===
FROM dhi.io/python:3.13-alpine3.21-dev AS builder
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache gcc musl-dev
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache gcc musl-dev
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
# === Final stage: Create minimal runtime image ===
FROM dhi.io/python:3.13-alpine3.21
@y
# === Final stage: Create minimal runtime image ===
FROM dhi.io/python:3.13-alpine3.21
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
COPY app.py ./
COPY --from=builder /app/venv /app/venv
@y
COPY app.py ./
COPY --from=builder /app/venv /app/venv
@z

@x
ENTRYPOINT [ "python", "/app/app.py" ]
```
@y
ENTRYPOINT [ "python", "/app/app.py" ]
```
@z

@x
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@y
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM dhi.io/python:3.13-alpine3.21-dev
@y
FROM dhi.io/python:3.13-alpine3.21-dev
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache gcc musl-dev
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache gcc musl-dev
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
COPY app.py ./
@y
COPY app.py ./
@z

@x
ENTRYPOINT [ "python", "/app/app.py" ]
```
@y
ENTRYPOINT [ "python", "/app/app.py" ]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
