%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Containerize a Python application
keywords: python, flask, containerize, initialize
description: Learn how to containerize a Python application.
aliases:
  - /language/python/build-images/
  - /language/python/run-containers/
---
@y
---
title: Containerize a Python application
keywords: python, flask, containerize, initialize
description: Learn how to containerize a Python application.
aliases:
  - /language/python/build-images/
  - /language/python/run-containers/
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You have installed the latest version of [Docker Desktop](../../get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
* You have installed the latest version of [Docker Desktop](../../get-docker.md).
* You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through containerizing and running a Python application.
@y
This section walks you through containerizing and running a Python application.
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
The sample application uses the popular [Flask](https://flask.palletsprojects.com/) framework.
@y
The sample application uses the popular [Flask](https://flask.palletsprojects.com/) framework.
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

@x
```console
$ git clone https://github.com/docker/python-docker
```
@y
```console
$ git clone https://github.com/docker/python-docker
```
@z

@x
## Initialize Docker assets
@y
## Initialize Docker assets
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize your application. You can use Docker Desktop's built-in Docker Init
feature to help streamline the process, or you can manually create the assets.
@y
Now that you have an application, you can create the necessary Docker assets to
containerize your application. You can use Docker Desktop's built-in Docker Init
feature to help streamline the process, or you can manually create the assets.
@z

@x
{{< tabs >}}
{{< tab name="Use Docker Init" >}}
@y
{{< tabs >}}
{{< tab name="Use Docker Init" >}}
@z

@x
Inside the `python-docker` directory, run the `docker init` command. `docker
init` provides some default configuration, but you'll need to answer a few
questions about your application. For example, this application uses Flask to
run. Refer to the following example to answer the prompts from `docker init` and
use the same answers for your prompts.
@y
Inside the `python-docker` directory, run the `docker init` command. `docker
init` provides some default configuration, but you'll need to answer a few
questions about your application. For example, this application uses Flask to
run. Refer to the following example to answer the prompts from `docker init` and
use the same answers for your prompts.
@z

@x
```console
$ docker init
Welcome to the Docker Init CLI!
@y
```console
$ docker init
Welcome to the Docker Init CLI!
@z

@x
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@y
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@z

@x
Let's get started!
@y
Let's get started!
@z

@x
? What application platform does your project use? Python
? What version of Python do you want to use? 3.11.4
? What port do you want your app to listen on? 8000
? What is the command to run your app? python3 -m flask run --host=0.0.0.0 --port=8000
```
@y
? What application platform does your project use? Python
? What version of Python do you want to use? 3.11.4
? What port do you want your app to listen on? 8000
? What is the command to run your app? python3 -m flask run --host=0.0.0.0 --port=8000
```
@z

@x
{{< /tab >}}
{{< tab name="Manually create assets" >}}
@y
{{< /tab >}}
{{< tab name="Manually create assets" >}}
@z

@x
If you don't have Docker Desktop installed or prefer creating the assets
manually, you can create the following files in your project directory.
@y
If you don't have Docker Desktop installed or prefer creating the assets
manually, you can create the following files in your project directory.
@z

@x
Create a file named `Dockerfile` with the following contents.
@y
Create a file named `Dockerfile` with the following contents.
@z

@x
```dockerfile {collapse=true,title=Dockerfile}
# syntax=docker/dockerfile:1
@y
```dockerfile {collapse=true,title=Dockerfile}
# syntax=docker/dockerfile:1
@z

@x
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@y
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@z

@x
# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7
@y
# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7
@z

@x
ARG PYTHON_VERSION=3.11.4
FROM python:${PYTHON_VERSION}-slim as base
@y
ARG PYTHON_VERSION=3.11.4
FROM python:${PYTHON_VERSION}-slim as base
@z

@x
# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1
@y
# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1
@z

@x
# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1
@y
# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser
@y
# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser
@z

@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt
@z

@x
# Switch to the non-privileged user to run the application.
USER appuser
@y
# Switch to the non-privileged user to run the application.
USER appuser
@z

@x
# Copy the source code into the container.
COPY . .
@y
# Copy the source code into the container.
COPY . .
@z

@x
# Expose the port that the application listens on.
EXPOSE 8000
@y
# Expose the port that the application listens on.
EXPOSE 8000
@z

@x
# Run the application.
CMD python3 -m flask run --host=0.0.0.0 --port=8000
```
@y
# Run the application.
CMD python3 -m flask run --host=0.0.0.0 --port=8000
```
@z

@x
Create a file named `compose.yaml` with the following contents.
@y
Create a file named `compose.yaml` with the following contents.
@z

@x
```yaml {collapse=true,title=compose.yaml}
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
# https://docs.docker.com/go/compose-spec-reference/
@y
```yaml {collapse=true,title=compose.yaml}
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
# https://docs.docker.com/go/compose-spec-reference/
@z

@x
# Here the instructions define your application as a service called "server".
# This service is built from the Dockerfile in the current directory.
# You can add other services your application may depend on here, such as a
# database or a cache. For examples, see the Awesome Compose repository:
# https://github.com/docker/awesome-compose
services:
  server:
    build:
      context: .
    ports:
      - 8000:8000
@y
# Here the instructions define your application as a service called "server".
# This service is built from the Dockerfile in the current directory.
# You can add other services your application may depend on here, such as a
# database or a cache. For examples, see the Awesome Compose repository:
# https://github.com/docker/awesome-compose
services:
  server:
    build:
      context: .
    ports:
      - 8000:8000
@z

@x
# The commented out section below is an example of how to define a PostgreSQL
# database that your application can use. `depends_on` tells Docker Compose to
# start the database before your application. The `db-data` volume persists the
# database data between container restarts. The `db-password` secret is used
# to set the database password. You must create `db/password.txt` and add
# a password of your choosing to it before running `docker compose up`.
#     depends_on:
#       db:
#         condition: service_healthy
#   db:
#     image: postgres
#     restart: always
#     user: postgres
#     secrets:
#       - db-password
#     volumes:
#       - db-data:/var/lib/postgresql/data
#     environment:
#       - POSTGRES_DB=example
#       - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
#     expose:
#       - 5432
#     healthcheck:
#       test: [ "CMD", "pg_isready" ]
#       interval: 10s
#       timeout: 5s
#       retries: 5
# volumes:
#   db-data:
# secrets:
#   db-password:
#     file: db/password.txt
```
@y
# The commented out section below is an example of how to define a PostgreSQL
# database that your application can use. `depends_on` tells Docker Compose to
# start the database before your application. The `db-data` volume persists the
# database data between container restarts. The `db-password` secret is used
# to set the database password. You must create `db/password.txt` and add
# a password of your choosing to it before running `docker compose up`.
#     depends_on:
#       db:
#         condition: service_healthy
#   db:
#     image: postgres
#     restart: always
#     user: postgres
#     secrets:
#       - db-password
#     volumes:
#       - db-data:/var/lib/postgresql/data
#     environment:
#       - POSTGRES_DB=example
#       - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
#     expose:
#       - 5432
#     healthcheck:
#       test: [ "CMD", "pg_isready" ]
#       interval: 10s
#       timeout: 5s
#       retries: 5
# volumes:
#   db-data:
# secrets:
#   db-password:
#     file: db/password.txt
```
@z

@x
Create a file named `.dockerignore` with the following contents.
@y
Create a file named `.dockerignore` with the following contents.
@z

@x
```text {collapse=true,title=".dockerignore"}
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text {collapse=true,title=".dockerignore"}
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@z

@x
**/.DS_Store
**/__pycache__
**/.venv
**/.classpath
**/.dockerignore
**/.env
**/.git
**/.gitignore
**/.project
**/.settings
**/.toolstarget
**/.vs
**/.vscode
**/*.*proj.user
**/*.dbmdl
**/*.jfm
**/bin
**/charts
**/docker-compose*
**/compose.y*ml
**/Dockerfile*
**/node_modules
**/npm-debug.log
**/obj
**/secrets.dev.yaml
**/values.dev.yaml
LICENSE
README.md
```
{{< /tab >}}
{{< /tabs >}}
@y
**/.DS_Store
**/__pycache__
**/.venv
**/.classpath
**/.dockerignore
**/.env
**/.git
**/.gitignore
**/.project
**/.settings
**/.toolstarget
**/.vs
**/.vscode
**/*.*proj.user
**/*.dbmdl
**/*.jfm
**/bin
**/charts
**/docker-compose*
**/compose.y*ml
**/Dockerfile*
**/node_modules
**/npm-debug.log
**/obj
**/secrets.dev.yaml
**/values.dev.yaml
LICENSE
README.md
```
{{< /tab >}}
{{< /tabs >}}
@z

@x
You should now have the following contents in your `python-docker`
directory.
@y
You should now have the following contents in your `python-docker`
directory.
@z

@x
```text
├── python-docker/
│ ├── app.py
│ ├── requirements.txt
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── Dockerfile
│ └── README.md
```
@y
```text
├── python-docker/
│ ├── app.py
│ ├── requirements.txt
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── Dockerfile
│ └── README.md
```
@z

@x
To learn more about the files, see the following:
 - [Dockerfile](../../reference/dockerfile.md)
 - [.dockerignore](../../reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](../../compose/compose-file/_index.md)
@y
To learn more about the files, see the following:
 - [Dockerfile](../../reference/dockerfile.md)
 - [.dockerignore](../../reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](../../compose/compose-file/_index.md)
@z

@x
## Run the application
@y
## Run the application
@z

@x
Inside the `python-docker` directory, run the following command in a
terminal.
@y
Inside the `python-docker` directory, run the following command in a
terminal.
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
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Flask application.
@y
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Flask application.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
### Run the application in the background
@y
### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `python-docker` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `python-docker` directory, run the following command
in a terminal.
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:8000](http://localhost:8000).
@y
Open a browser and view the application at [http://localhost:8000](http://localhost:8000).
@z

@x
You should see a simple Flask application.
@y
You should see a simple Flask application.
@z

@x
In the terminal, run the following command to stop the application.
@y
In the terminal, run the following command to stop the application.
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
For more information about Compose commands, see the [Compose CLI
reference](../../compose/reference/_index.md).
@y
For more information about Compose commands, see the [Compose CLI
reference](../../compose/reference/_index.md).
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how you can containerize and run your Python
application using Docker.
@y
In this section, you learned how you can containerize and run your Python
application using Docker.
@z

@x
Related information:
 - [Build with Docker guide](../../build/guide/index.md)
 - [Docker Compose overview](../../compose/_index.md)
@y
Related information:
 - [Build with Docker guide](../../build/guide/index.md)
 - [Docker Compose overview](../../compose/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how you can develop your application using
containers.
@y
In the next section, you'll learn how you can develop your application using
containers.
@z

@x
{{< button text="Develop your application" url="develop.md" >}}
@y
{{< button text="Develop your application" url="develop.md" >}}
@z
