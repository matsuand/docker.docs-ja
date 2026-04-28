%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize a Django application
linkTitle: Django
description: Learn how to containerize a Django application using Docker.
keywords: python, django, containerize, initialize, gunicorn, compose watch, uv
summary: |
  This guide shows how to containerize a Django application using Docker.
  You'll scaffold the project with uv, create a production-ready Dockerfile
  using a Docker Hardened Image, then add a development stage and Compose Watch
  for fast iteration.
languages: [python]
@y
title: Containerize a Django application
linkTitle: Django
description: Learn how to containerize a Django application using Docker.
keywords: python, django, containerize, initialize, gunicorn, compose watch, uv
summary: |
  This guide shows how to containerize a Django application using Docker.
  You'll scaffold the project with uv, create a production-ready Dockerfile
  using a Docker Hardened Image, then add a development stage and Compose Watch
  for fast iteration.
languages: [python]
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have installed the latest version of [Docker
  Desktop](/get-started/get-docker.md).
- You have [uv](https://docs.astral.sh/uv/) installed, or you can use Docker to
  scaffold the project without a local Python or uv installation.
@y
- You have installed the latest version of [Docker
  Desktop](get-started/get-docker.md).
- You have [uv](https://docs.astral.sh/uv/) installed, or you can use Docker to
  scaffold the project without a local Python or uv installation.
@z

@x
> [!TIP]
>
> If you're new to Docker, start with the [Docker
> basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide
> to get familiar with key concepts like images, containers, and Dockerfiles.
@y
> [!TIP]
>
> If you're new to Docker, start with the [Docker
> basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide
> to get familiar with key concepts like images, containers, and Dockerfiles.
@z

@x
---
@y
---
@z

@x
## Overview
@y
## Overview
@z

@x
This guide walks you through containerizing a Django application with Docker. By
the end, you will:
@y
This guide walks you through containerizing a Django application with Docker. By
the end, you will:
@z

@x
- Initialize a Django project using uv, either locally or inside a Docker
  Hardened Image container.
- Create a production-ready Dockerfile using [Docker Hardened Images
  (DHI)](/dhi/).
- Add a `development` stage to your Dockerfile and configure Compose Watch for
  automatic code syncing.
@y
- Initialize a Django project using uv, either locally or inside a Docker
  Hardened Image container.
- Create a production-ready Dockerfile using [Docker Hardened Images
  (DHI)](__SUBDIR__/dhi/).
- Add a `development` stage to your Dockerfile and configure Compose Watch for
  automatic code syncing.
@z

@x
---
@y
---
@z

@x
## Create the Django project
@y
## Create the Django project
@z

@x
You can bootstrap the project with a local uv installation, or entirely inside a
container using the same DHI image the Dockerfile uses, with no local Python
required.
@y
You can bootstrap the project with a local uv installation, or entirely inside a
container using the same DHI image the Dockerfile uses, with no local Python
required.
@z

@x
{{< tabs >}} {{< tab name="Local (uv)" >}}
@y
{{< tabs >}} {{< tab name="Local (uv)" >}}
@z

@x
1. Initialize the project pinned to Python 3.14, then navigate into it:
@y
1. Initialize the project pinned to Python 3.14, then navigate into it:
@z

@x
   ```console
   $ uv init --python 3.14 django-docker
   $ cd django-docker
   ```
@y
   ```console
   $ uv init --python 3.14 django-docker
   $ cd django-docker
   ```
@z

@x
2. Add Django and Gunicorn, then scaffold the Django project:
@y
2. Add Django and Gunicorn, then scaffold the Django project:
@z

@x
   ```console
   $ uv add django gunicorn
   $ uv run django-admin startproject myapp .
   ```
@y
   ```console
   $ uv add django gunicorn
   $ uv run django-admin startproject myapp .
   ```
@z

@x
{{< /tab >}} {{< tab name="Container (DHI)" >}}
@y
{{< /tab >}} {{< tab name="Container (DHI)" >}}
@z

@x
The DHI dev image already has Python 3.14, so the bootstrapped project will
match the Dockerfile exactly.
@y
The DHI dev image already has Python 3.14, so the bootstrapped project will
match the Dockerfile exactly.
@z

@x
1. Create the project directory and navigate into it:
@y
1. Create the project directory and navigate into it:
@z

@x
   ```console
   $ mkdir django-docker && cd django-docker
   ```
@y
   ```console
   $ mkdir django-docker && cd django-docker
   ```
@z

@x
2. Initialize the project, add dependencies, and scaffold. All in one container
   run:
@y
2. Initialize the project, add dependencies, and scaffold. All in one container
   run:
@z

@x
   ```console
   $ docker run --rm -v $PWD:$PWD -w $PWD \
     -e UV_LINK_MODE=copy \
     dhi.io/python:3.14-alpine3.23-dev \
     sh -c "pip install --quiet --root-user-action=ignore uv && uv init --name django-docker --python 3.14 . && uv add django gunicorn && uv run django-admin startproject myapp ."
   ```
@y
   ```console
   $ docker run --rm -v $PWD:$PWD -w $PWD \
     -e UV_LINK_MODE=copy \
     dhi.io/python:3.14-alpine3.23-dev \
     sh -c "pip install --quiet --root-user-action=ignore uv && uv init --name django-docker --python 3.14 . && uv add django gunicorn && uv run django-admin startproject myapp ."
   ```
@z

@x
   > [!NOTE]
   >
   > The previous command uses Mac/Linux shell syntax. On Windows, adjust
   > the path: PowerShell uses `${PWD}`, Command Prompt uses `%cd%`, Git Bash
   > requires `MSYS_NO_PATHCONV=1` with `$(pwd -W)`.
@y
   > [!NOTE]
   >
   > The previous command uses Mac/Linux shell syntax. On Windows, adjust
   > the path: PowerShell uses `${PWD}`, Command Prompt uses `%cd%`, Git Bash
   > requires `MSYS_NO_PATHCONV=1` with `$(pwd -W)`.
@z

@x
{{< /tab >}} {{< /tabs >}}
@y
{{< /tab >}} {{< /tabs >}}
@z

@x
Your directory should now contain the following files:
@y
Your directory should now contain the following files:
@z

@x
```text
├── .python-version
├── main.py
├── manage.py
├── myapp/
│ ├── __init__.py
│ ├── asgi.py
│ ├── settings.py
│ ├── urls.py
│ └── wsgi.py
├── pyproject.toml
├── uv.lock
└── README.md
```
@y
```text
├── .python-version
├── main.py
├── manage.py
├── myapp/
│ ├── __init__.py
│ ├── asgi.py
│ ├── settings.py
│ ├── urls.py
│ └── wsgi.py
├── pyproject.toml
├── uv.lock
└── README.md
```
@z

@x
---
@y
---
@z

@x
## Create a production Dockerfile
@y
## Create a production Dockerfile
@z

@x
Docker Hardened Images are production-ready base images maintained by Docker
that minimize attack surface. For more details, see [Docker Hardened
Images](/dhi/).
@y
Docker Hardened Images are production-ready base images maintained by Docker
that minimize attack surface. For more details, see [Docker Hardened
Images](__SUBDIR__/dhi/).
@z

@x
1. Sign in to the DHI registry:
@y
1. Sign in to the DHI registry:
@z

@x
   ```console
   $ docker login dhi.io
   ```
@y
   ```console
   $ docker login dhi.io
   ```
@z

@x
2. Create a `.dockerignore` file to exclude local artifacts from the build
   context:
@y
2. Create a `.dockerignore` file to exclude local artifacts from the build
   context:
@z

@x
   ```text {title=".dockerignore"}
   .venv/
   __pycache__/
   *.pyc
   .git/
   ```
@y
   ```text {title=".dockerignore"}
   .venv/
   __pycache__/
   *.pyc
   .git/
   ```
@z

@x
3. Create a `Dockerfile` with the following contents:
@y
3. Create a `Dockerfile` with the following contents:
@z

@x
   ```dockerfile {title="Dockerfile"}
   # syntax=docker/dockerfile:1
@y
   ```dockerfile {title="Dockerfile"}
   # syntax=docker/dockerfile:1
@z

@x
   # Build stage: the -dev image includes tools needed to install packages.
   FROM dhi.io/python:3.14-alpine3.23-dev AS builder
@y
   # Build stage: the -dev image includes tools needed to install packages.
   FROM dhi.io/python:3.14-alpine3.23-dev AS builder
@z

@x
   # Prevent Python from writing .pyc files to disk.
   ENV PYTHONDONTWRITEBYTECODE=1
   # Prevent Python from buffering stdout/stderr so logs appear immediately.
   ENV PYTHONUNBUFFERED=1
@y
   # Prevent Python from writing .pyc files to disk.
   ENV PYTHONDONTWRITEBYTECODE=1
   # Prevent Python from buffering stdout/stderr so logs appear immediately.
   ENV PYTHONUNBUFFERED=1
@z

@x
   RUN pip install --quiet --root-user-action=ignore uv
   # Use copy mode since the cache and build filesystem are on different volumes.
   ENV UV_LINK_MODE=copy
@y
   RUN pip install --quiet --root-user-action=ignore uv
   # Use copy mode since the cache and build filesystem are on different volumes.
   ENV UV_LINK_MODE=copy
@z

@x
   WORKDIR /app
@y
   WORKDIR /app
@z

@x
   # Install dependencies into a virtual environment using cache and bind mounts
   # so neither uv nor the lock files need to be copied into the image.
   RUN --mount=type=cache,target=/root/.cache/uv \
       --mount=type=bind,source=uv.lock,target=uv.lock \
       --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
       uv sync --frozen --no-install-project
@y
   # Install dependencies into a virtual environment using cache and bind mounts
   # so neither uv nor the lock files need to be copied into the image.
   RUN --mount=type=cache,target=/root/.cache/uv \
       --mount=type=bind,source=uv.lock,target=uv.lock \
       --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
       uv sync --frozen --no-install-project
@z

@x
   # Runtime stage: minimal DHI image with no shell or package manager,
   # already runs as the nonroot user.
   FROM dhi.io/python:3.14-alpine3.23
@y
   # Runtime stage: minimal DHI image with no shell or package manager,
   # already runs as the nonroot user.
   FROM dhi.io/python:3.14-alpine3.23
@z

@x
   # Prevent Python from buffering stdout/stderr so logs appear immediately.
   ENV PYTHONUNBUFFERED=1
   # Activate the virtual environment copied from the build stage.
   ENV PATH="/app/.venv/bin:$PATH"
@y
   # Prevent Python from buffering stdout/stderr so logs appear immediately.
   ENV PYTHONUNBUFFERED=1
   # Activate the virtual environment copied from the build stage.
   ENV PATH="/app/.venv/bin:$PATH"
@z

@x
   WORKDIR /app
@y
   WORKDIR /app
@z

@x
   # Copy the pre-built virtual environment and application source code.
   COPY --from=builder /app/.venv /app/.venv
   COPY . .
@y
   # Copy the pre-built virtual environment and application source code.
   COPY --from=builder /app/.venv /app/.venv
   COPY . .
@z

@x
   EXPOSE 8000
@y
   EXPOSE 8000
@z

@x
   # Run Gunicorn as the production WSGI server.
   CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8000"]
   ```
@y
   # Run Gunicorn as the production WSGI server.
   CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8000"]
   ```
@z

@x
4. Create a `compose.yaml` file:
@y
4. Create a `compose.yaml` file:
@z

@x
   ```yaml {title="compose.yaml"}
   services:
     web:
       build: .
       ports:
         - "8000:8000"
   ```
@y
   ```yaml {title="compose.yaml"}
   services:
     web:
       build: .
       ports:
         - "8000:8000"
   ```
@z

@x
### Run the application
@y
### Run the application
@z

@x
From the `django-docker` directory, run:
@y
From the `django-docker` directory, run:
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and navigate to [http://localhost:8000](http://localhost:8000).
You should see the Django welcome page.
@y
Open a browser and navigate to [http://localhost:8000](http://localhost:8000).
You should see the Django welcome page.
@z

@x
Press `ctrl`+`c` to stop the application.
@y
Press `ctrl`+`c` to stop the application.
@z

@x
---
@y
---
@z

@x
## Set up a development environment
@y
## Set up a development environment
@z

@x
The production setup uses Gunicorn and requires a full image rebuild to pick up
code changes. For development, you can add a `development` stage to your
Dockerfile that uses Django's built-in server, and configure Compose Watch to
automatically sync code changes into the running container without a rebuild.
@y
The production setup uses Gunicorn and requires a full image rebuild to pick up
code changes. For development, you can add a `development` stage to your
Dockerfile that uses Django's built-in server, and configure Compose Watch to
automatically sync code changes into the running container without a rebuild.
@z

@x
### Update the Dockerfile
@y
### Update the Dockerfile
@z

@x
Replace your `Dockerfile` with a multi-stage version that adds a `development`
stage alongside `production`:
@y
Replace your `Dockerfile` with a multi-stage version that adds a `development`
stage alongside `production`:
@z

@x
```dockerfile {title="Dockerfile"}
# syntax=docker/dockerfile:1
@y
```dockerfile {title="Dockerfile"}
# syntax=docker/dockerfile:1
@z

@x
# Build stage: the -dev image includes tools needed to install packages.
FROM dhi.io/python:3.14-alpine3.23-dev AS builder
@y
# Build stage: the -dev image includes tools needed to install packages.
FROM dhi.io/python:3.14-alpine3.23-dev AS builder
@z

@x
# Prevent Python from writing .pyc files to disk.
ENV PYTHONDONTWRITEBYTECODE=1
# Prevent Python from buffering stdout/stderr so logs appear immediately.
ENV PYTHONUNBUFFERED=1
@y
# Prevent Python from writing .pyc files to disk.
ENV PYTHONDONTWRITEBYTECODE=1
# Prevent Python from buffering stdout/stderr so logs appear immediately.
ENV PYTHONUNBUFFERED=1
@z

@x
RUN pip install --quiet --root-user-action=ignore uv
# Use copy mode since the cache and build filesystem are on different volumes.
ENV UV_LINK_MODE=copy
@y
RUN pip install --quiet --root-user-action=ignore uv
# Use copy mode since the cache and build filesystem are on different volumes.
ENV UV_LINK_MODE=copy
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
# Install dependencies into a virtual environment using cache and bind mounts
# so neither uv nor the lock files need to be copied into the image.
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project
@y
# Install dependencies into a virtual environment using cache and bind mounts
# so neither uv nor the lock files need to be copied into the image.
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project
@z

@x
# The development stage inherits the -dev image and virtual environment from
# the builder. Django's built-in server reloads when Compose Watch syncs files.
FROM builder AS development
@y
# The development stage inherits the -dev image and virtual environment from
# the builder. Django's built-in server reloads when Compose Watch syncs files.
FROM builder AS development
@z

@x
ENV PATH="/app/.venv/bin:$PATH"
@y
ENV PATH="/app/.venv/bin:$PATH"
@z

@x
COPY . .
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
@y
COPY . .
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
@z

@x
# The production stage uses the minimal runtime image, which has no shell,
# no package manager, and already runs as the nonroot user.
FROM dhi.io/python:3.14-alpine3.23 AS production
@y
# The production stage uses the minimal runtime image, which has no shell,
# no package manager, and already runs as the nonroot user.
FROM dhi.io/python:3.14-alpine3.23 AS production
@z

@x
# Prevent Python from buffering stdout/stderr so logs appear immediately.
ENV PYTHONUNBUFFERED=1
# Activate the virtual environment copied from the build stage.
ENV PATH="/app/.venv/bin:$PATH"
@y
# Prevent Python from buffering stdout/stderr so logs appear immediately.
ENV PYTHONUNBUFFERED=1
# Activate the virtual environment copied from the build stage.
ENV PATH="/app/.venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
# Copy only the pre-built virtual environment and application source code.
COPY --from=builder /app/.venv /app/.venv
COPY . .
@y
# Copy only the pre-built virtual environment and application source code.
COPY --from=builder /app/.venv /app/.venv
COPY . .
@z

@x
EXPOSE 8000
@y
EXPOSE 8000
@z

@x
# Run Gunicorn as the production WSGI server.
CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8000"]
```
@y
# Run Gunicorn as the production WSGI server.
CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8000"]
```
@z

@x
### Update the Compose file
@y
### Update the Compose file
@z

@x
Replace your `compose.yaml` with the following. It targets the `development`
stage, adds a PostgreSQL database, and configures Compose Watch:
@y
Replace your `compose.yaml` with the following. It targets the `development`
stage, adds a PostgreSQL database, and configures Compose Watch:
@z

@x
```yaml {title="compose.yaml"}
services:
  web:
    build:
      context: .
      # Build the development stage from the multi-stage Dockerfile.
      target: development
    ports:
      - "8000:8000"
    environment:
      # Enable Django's verbose debug error pages (the dev server always auto-reloads).
      - DEBUG=1
      # Database connection settings passed to Django via environment variables.
      - POSTGRES_DB=myapp
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
      - POSTGRES_HOST=db
      - POSTGRES_PORT=5432
    # Wait for the database to pass its healthcheck before starting the web service.
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        # Sync source file changes directly into the container so Django's
        # dev server can reload them without a full image rebuild.
        - action: sync
          path: .
          target: /app
          ignore:
            - __pycache__/
            - "*.pyc"
            - .git/
            - .venv/
        # Rebuild the image when dependencies change.
        - action: rebuild
          path: pyproject.toml
        - action: rebuild
          path: uv.lock
  db:
    image: dhi.io/postgres:18
    restart: always
    volumes:
      # Persist database data across container restarts.
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=myapp
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
    # Expose the port only to other services on the Compose network,
    # not to the host machine.
    expose:
      - 5432
    # Only report healthy once PostgreSQL is ready to accept connections,
    # so the web service doesn't start before the database is available.
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
```
@y
```yaml {title="compose.yaml"}
services:
  web:
    build:
      context: .
      # Build the development stage from the multi-stage Dockerfile.
      target: development
    ports:
      - "8000:8000"
    environment:
      # Enable Django's verbose debug error pages (the dev server always auto-reloads).
      - DEBUG=1
      # Database connection settings passed to Django via environment variables.
      - POSTGRES_DB=myapp
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
      - POSTGRES_HOST=db
      - POSTGRES_PORT=5432
    # Wait for the database to pass its healthcheck before starting the web service.
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        # Sync source file changes directly into the container so Django's
        # dev server can reload them without a full image rebuild.
        - action: sync
          path: .
          target: /app
          ignore:
            - __pycache__/
            - "*.pyc"
            - .git/
            - .venv/
        # Rebuild the image when dependencies change.
        - action: rebuild
          path: pyproject.toml
        - action: rebuild
          path: uv.lock
  db:
    image: dhi.io/postgres:18
    restart: always
    volumes:
      # Persist database data across container restarts.
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=myapp
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
    # Expose the port only to other services on the Compose network,
    # not to the host machine.
    expose:
      - 5432
    # Only report healthy once PostgreSQL is ready to accept connections,
    # so the web service doesn't start before the database is available.
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
```
@z

@x
The `sync` action pushes file changes directly into the running container so
Django's dev server reloads them automatically. A change to `pyproject.toml` or
`uv.lock` triggers a full image rebuild instead.
@y
The `sync` action pushes file changes directly into the running container so
Django's dev server reloads them automatically. A change to `pyproject.toml` or
`uv.lock` triggers a full image rebuild instead.
@z

@x
> [!NOTE]
>
> To learn more about Compose Watch, see [Use Compose
> Watch](/manuals/compose/how-tos/file-watch.md).
@y
> [!NOTE]
>
> To learn more about Compose Watch, see [Use Compose
> Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
### Add the PostgreSQL driver
@y
### Add the PostgreSQL driver
@z

@x
Add the `psycopg` adapter to your project:
@y
Add the `psycopg` adapter to your project:
@z

@x
{{< tabs >}} {{< tab name="Local (uv)" >}}
@y
{{< tabs >}} {{< tab name="Local (uv)" >}}
@z

@x
```console
$ uv add 'psycopg[binary]'
```
@y
```console
$ uv add 'psycopg[binary]'
```
@z

@x
{{< /tab >}} {{< tab name="Container (DHI)" >}}
@y
{{< /tab >}} {{< tab name="Container (DHI)" >}}
@z

@x
```console
$ docker run --rm -v $PWD:$PWD -w $PWD \
  -e UV_LINK_MODE=copy \
  dhi.io/python:3.14-alpine3.23-dev \
  sh -c "pip install --quiet --root-user-action=ignore uv && uv add 'psycopg[binary]'"
```
@y
```console
$ docker run --rm -v $PWD:$PWD -w $PWD \
  -e UV_LINK_MODE=copy \
  dhi.io/python:3.14-alpine3.23-dev \
  sh -c "pip install --quiet --root-user-action=ignore uv && uv add 'psycopg[binary]'"
```
@z

@x
{{< /tab >}} {{< /tabs >}}
@y
{{< /tab >}} {{< /tabs >}}
@z

@x
Then update `myapp/settings.py` to read `DEBUG` and `DATABASES` from environment
variables:
@y
Then update `myapp/settings.py` to read `DEBUG` and `DATABASES` from environment
variables:
@z

@x
```python {title="myapp/settings.py"}
import os
@y
```python {title="myapp/settings.py"}
import os
@z

@x
DEBUG = os.environ.get('DEBUG', '0') == '1'
@y
DEBUG = os.environ.get('DEBUG', '0') == '1'
@z

@x
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ.get("POSTGRES_DB", "myapp"),
        "USER": os.environ.get("POSTGRES_USER", "postgres"),
        "PASSWORD": os.environ.get("POSTGRES_PASSWORD", "password"),
        "HOST": os.environ.get("POSTGRES_HOST", "localhost"),
        "PORT": os.environ.get("POSTGRES_PORT", "5432"),
    }
}
```
@y
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ.get("POSTGRES_DB", "myapp"),
        "USER": os.environ.get("POSTGRES_USER", "postgres"),
        "PASSWORD": os.environ.get("POSTGRES_PASSWORD", "password"),
        "HOST": os.environ.get("POSTGRES_HOST", "localhost"),
        "PORT": os.environ.get("POSTGRES_PORT", "5432"),
    }
}
```
@z

@x
### Run with Compose Watch
@y
### Run with Compose Watch
@z

@x
Start the development stack:
@y
Start the development stack:
@z

@x
```console
$ docker compose watch
```
@y
```console
$ docker compose watch
```
@z

@x
Open a browser and navigate to [http://localhost:8000](http://localhost:8000).
@y
Open a browser and navigate to [http://localhost:8000](http://localhost:8000).
@z

@x
Try editing a file, for example add a view to `myapp/views.py`. Compose Watch
syncs the change into the container and Django's dev server reloads
automatically. If you update `pyproject.toml` or `uv.lock`, Compose Watch
triggers a full image rebuild.
@y
Try editing a file, for example add a view to `myapp/views.py`. Compose Watch
syncs the change into the container and Django's dev server reloads
automatically. If you update `pyproject.toml` or `uv.lock`, Compose Watch
triggers a full image rebuild.
@z

@x
Press `ctrl`+`c` to stop.
@y
Press `ctrl`+`c` to stop.
@z

@x
---
@y
---
@z

@x
## Summary
@y
## Summary
@z

@x
In this guide, you:
@y
In this guide, you:
@z

@x
- Bootstrapped a Django project using uv, with options for both local and
  containerized setup.
- Created a production-ready Dockerfile using Docker Hardened Images and uv for
  dependency management.
- Added a `development` stage to the `Dockerfile` and configured Compose Watch
  for fast iterative development with a PostgreSQL database.
@y
- Bootstrapped a Django project using uv, with options for both local and
  containerized setup.
- Created a production-ready Dockerfile using Docker Hardened Images and uv for
  dependency management.
- Added a `development` stage to the `Dockerfile` and configured Compose Watch
  for fast iterative development with a PostgreSQL database.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile.md)
- [Compose file reference](/reference/compose-file/_index.md)
- [Use Compose Watch](/manuals/compose/how-tos/file-watch.md)
- [Docker Hardened Images](/dhi/)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
- [uv documentation](https://docs.astral.sh/uv/)
@y
- [Dockerfile reference](reference/dockerfile.md)
- [Compose file reference](reference/compose-file/_index.md)
- [Use Compose Watch](manuals/compose/how-tos/file-watch.md)
- [Docker Hardened Images](__SUBDIR__/dhi/)
- [Multi-stage builds](manuals/build/building/multi-stage.md)
- [uv documentation](https://docs.astral.sh/uv/)
@z
