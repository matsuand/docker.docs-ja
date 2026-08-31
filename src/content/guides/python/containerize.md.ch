%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Containerize a Python application
linkTitle: Containerize your app
@y
title: Python アプリケーションのコンテナー化
linkTitle: アプリのコンテナー化
@z

@x
keywords: python, flask, containerize, initialize
description: Learn how to containerize a Python application.
@y
keywords: python, flask, containerize, initialize
description: Learn how to containerize a Python application.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- [Docker Desktop](get-started/get-docker.md) の最新版をインストールしていること。
- [Git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの Git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a Python application.
@y
本節では Python アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
The sample application uses the popular [FastAPI](https://fastapi.tiangolo.com) framework.
@y
サンプルアプリケーションでは、人気の [FastAPI](https://fastapi.tiangolo.com) フレームワークを利用しています。
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
本ガイドにおいて利用するサンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip command...

@x
## Create Docker assets
@y
## Docker アセットの生成 {#create-docker-assets}
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize your application.
@y
アプリケーションの入手はできました。
次はアプリケーションのコンテナー化に必要となる Docker アセットを生成します。
@z

@x
> [!TIP]
>
> [Gordon](/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@y
> [!TIP]
>
> [Gordon](__SUBDIR__/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@z

@x
Before creating your Dockerfile, you need to choose a base image. You can use the [Python Docker Official Image](https://hub.docker.com/_/python),
or a [Docker Hardened Image (DHI)](https://hub.docker.com/hardened-images/catalog/dhi/python).
@y
Before creating your Dockerfile, you need to choose a base image. You can use the [Python Docker Official Image](https://hub.docker.com/_/python),
or a [Docker Hardened Image (DHI)](https://hub.docker.com/hardened-images/catalog/dhi/python).
@z

@x
Docker Hardened Images (DHIs) are minimal, secure, and production-ready base images maintained by Docker.
They help reduce vulnerabilities and simplify compliance. For more details, see [Docker Hardened Images](/dhi/).
@y
Docker Hardened Images (DHIs) are minimal, secure, and production-ready base images maintained by Docker.
They help reduce vulnerabilities and simplify compliance. For more details, see [Docker Hardened Images](__SUBDIR__/dhi/).
@z

@x
{{< tabs >}}
{{< tab name="Using the official Docker image" >}}
@y
{{< tabs >}}
{{< tab name="Docker 公式イメージの利用" >}}
@z

@x
Create the following files in your project directory.
@y
Create the following files in your project directory.
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
# This Dockerfile uses Python Docker Official Image
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim
@y
# This Dockerfile uses Python Docker Official Image
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim
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
CMD ["python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
# Run the application.
CMD ["python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
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
```
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
@z

@x
Create a file named `.gitignore` with the following contents.
@y
Create a file named `.gitignore` with the following contents.
@z

@x
```text {collapse=true,title=".gitignore"}
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
```text {collapse=true,title=".gitignore"}
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@z

@x
# C extensions
*.so
@y
# C extensions
*.so
@z

@x
# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST
@y
# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST
@z

@x
# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/
@y
# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/
@z

@x
# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/
@y
# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/
@z

@x
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
```
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
```
@z

@x
{{< /tab >}}
{{< tab name="Using Docker Hardened Image" >}}
@y
{{< /tab >}}
{{< tab name="Using Docker Hardened Image" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Python in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/python). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
Docker Hardened Images (DHIs) are available for Python in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/python). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](__SUBDIR__/dhi/get-started/) guide.
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
2. Pull the Python DHI (check the catalog for available versions):
@y
2. Pull the Python DHI (check the catalog for available versions):
@z

@x
   ```console
   $ docker pull dhi.io/python:3.12.12-debian13-fips-dev
   ```
@y
   ```console
   $ docker pull dhi.io/python:3.12.12-debian13-fips-dev
   ```
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
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
ARG PYTHON_VERSION=3.12.12-debian13-fips-dev
FROM dhi.io/python:${PYTHON_VERSION}
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
ARG PYTHON_VERSION=3.12.12-debian13-fips-dev
FROM dhi.io/python:${PYTHON_VERSION}
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
#Add dependencies for adduser
RUN apt update -y && apt install adduser -y
@y
#Add dependencies for adduser
RUN apt update -y && apt install adduser -y
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
CMD ["python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
# Run the application.
CMD ["python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
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
```
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
@z

@x
Create a file named `.gitignore` with the following contents.
@y
Create a file named `.gitignore` with the following contents.
@z

@x
```text {collapse=true,title=".gitignore"}
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
```text {collapse=true,title=".gitignore"}
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@z

@x
# C extensions
*.so
@y
# C extensions
*.so
@z

@x
# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST
@y
# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST
@z

@x
# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/
@y
# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/
@z

@x
# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/
@y
# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/
@z

@x
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
```
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
You should now have the following contents in your `python-docker-example`
directory.
@y
You should now have the following contents in your `python-docker-example`
directory.
@z

@x
```text
├── python-docker-example/
│ ├── app.py
│ ├── requirements.txt
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ └── README.md
```
@y
```text
├── python-docker-example/
│ ├── app.py
│ ├── requirements.txt
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ └── README.md
```
@z

@x
To learn more about the files, see the following:
@y
To learn more about the files, see the following:
@z

@x
- [Dockerfile](/reference/dockerfile.md)
- [.dockerignore](/reference/dockerfile.md#dockerignore-file)
- [.gitignore](https://git-scm.com/docs/gitignore)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](reference/dockerfile.md)
- [.dockerignore](reference/dockerfile.md#dockerignore-file)
- [.gitignore](https://git-scm.com/docs/gitignore)
- [compose.yaml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## Run the application
@z

@x
Inside the `python-docker-example` directory, run the following command in a
terminal.
@y
Inside the `python-docker-example` directory, run the following command in a
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
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple FastAPI application.
@y
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple FastAPI application.
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
option. Inside the `python-docker-example` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `python-docker-example` directory, run the following command
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
To see the OpenAPI docs you can go to [http://localhost:8000/docs](http://localhost:8000/docs).
@y
To see the OpenAPI docs you can go to [http://localhost:8000/docs](http://localhost:8000/docs).
@z

@x
You should see a simple FastAPI application.
@y
You should see a simple FastAPI application.
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
reference](/reference/cli/docker/compose/).
@y
For more information about Compose commands, see the [Compose CLI
reference](__SUBDIR__/reference/cli/docker/compose/).
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
@y
Related information:
@z

@x
- [Docker Compose overview](/manuals/compose/_index.md)
@y
- [Docker Compose overview](manuals/compose/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll take a look at how to set up a local development environment using Docker containers.
@y
In the next section, you'll take a look at how to set up a local development environment using Docker containers.
@z
