%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Python language-specific guide
linkTitle: Python
description: Containerize Python apps using Docker
keywords: Docker, getting started, Python, language
summary: |
  This guide explains how to containerize Python applications using Docker.
@y
title: Python language-specific guide
linkTitle: Python
description: Containerize Python apps using Docker
keywords: Docker, getting started, Python, language
summary: |
  This guide explains how to containerize Python applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
> **Acknowledgment**
>
> This guide is a community contribution. Docker would like to thank
> [Esteban Maya](https://www.linkedin.com/in/esteban-x64/) and [Igor Aleksandrov](https://www.linkedin.com/in/igor-aleksandrov/) for their contribution
> to this guide.
@y
> **Acknowledgment**
>
> This guide is a community contribution. Docker would like to thank
> [Esteban Maya](https://www.linkedin.com/in/esteban-x64/) and [Igor Aleksandrov](https://www.linkedin.com/in/igor-aleksandrov/) for their contribution
> to this guide.
@z

@x
The Python language-specific guide teaches you how to containerize a Python application using Docker. In this guide, you’ll learn how to:
@y
The Python language-specific guide teaches you how to containerize a Python application using Docker. In this guide, you’ll learn how to:
@z

@x
- Containerize and run a Python application
- Set up a local environment to develop a Python application using containers
- Lint, format, typing and best practices
@y
- Containerize and run a Python application
- Set up a local environment to develop a Python application using containers
- Lint, format, typing and best practices
@z

@x
Start by containerizing an existing Python application.
@y
Start by containerizing an existing Python application.
@z

@x
## Containerize a Python application
@y
## Containerize a Python application
@z

@x
### Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
@z

@x
### Overview
@y
## 概要 {#overview}
@z

@x
Containerizing your application means packaging it together with its
dependencies, configuration, and runtime into a single portable unit called a
container image. Running that image creates a container, an isolated process
that behaves the same on any machine, whether it's your laptop, a CI runner, or
a production server.
@y
Containerizing your application means packaging it together with its
dependencies, configuration, and runtime into a single portable unit called a
container image. Running that image creates a container, an isolated process
that behaves the same on any machine, whether it's your laptop, a CI runner, or
a production server.
@z

@x
In this section, you'll containerize a simple
[FastAPI](https://fastapi.tiangolo.com) web application. You'll write a
`Dockerfile` that describes how to build the image, add a `compose.yaml` file
that defines how Docker runs your container, and then build and start the
application with one command.
@y
In this section, you'll containerize a simple
[FastAPI](https://fastapi.tiangolo.com) web application. You'll write a
`Dockerfile` that describes how to build the image, add a `compose.yaml` file
that defines how Docker runs your container, and then build and start the
application with one command.
@z

@x
You'll use [Docker Hardened Images](/dhi/) as the base. These are minimal,
secure Python images maintained by Docker.
@y
You'll use [Docker Hardened Images](__SUBDIR__/dhi/) as the base. These are minimal,
secure Python images maintained by Docker.
@z

@x
### Create the application
@y
### Create the application
@z

@x
The sample application is a minimal FastAPI service with a single endpoint
that returns a JSON greeting. Create the following files in a new
`python-docker-example` directory. To create all the files at once, switch to
the **Scaffold script** tab in the file browser and copy the shell command.
@y
The sample application is a minimal FastAPI service with a single endpoint
that returns a JSON greeting. Create the following files in a new
`python-docker-example` directory. To create all the files at once, switch to
the **Scaffold script** tab in the file browser and copy the shell command.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="app.py" status="new" >}}
@y
{{< file path="app.py" status="new" >}}
@z

@x
```python
# A minimal FastAPI application.
# The root endpoint (GET /) returns a JSON "Hello World" response.
# See https://fastapi.tiangolo.com/ for the framework reference.
@y
```python
# A minimal FastAPI application.
# The root endpoint (GET /) returns a JSON "Hello World" response.
# See https://fastapi.tiangolo.com/ for the framework reference.
@z

@x
from fastapi import FastAPI
@y
from fastapi import FastAPI
@z

@x
app = FastAPI()
@y
app = FastAPI()
@z

@x
@app.get("/")
async def root():
    return {"message": "Hello World"}
```
@y
@app.get("/")
async def root():
    return {"message": "Hello World"}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="requirements.txt" status="new" >}}
@y
{{< file path="requirements.txt" status="new" >}}
@z

@x
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@y
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@z

@x
fastapi==0.115.12
uvicorn==0.34.3
```
@y
fastapi==0.115.12
uvicorn==0.34.3
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" status="new" >}}
@y
{{< file path=".gitignore" status="new" >}}
@z

@x
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
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
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
@z

@x
# Secrets
db/password.txt
```
@y
# Secrets
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
If you already have Python installed and want to verify the app works before
containerizing it, you can run it locally:
@y
If you already have Python installed and want to verify the app works before
containerizing it, you can run it locally:
@z

@x
```console
$ python3 -m venv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
$ uvicorn app:app --reload
```
@y
```console
$ python3 -m venv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
$ uvicorn app:app --reload
```
@z

@x
> [!NOTE]
>
> On Windows, activate the virtual environment with `.venv\Scripts\activate`
> instead of `source .venv/bin/activate`.
@y
> [!NOTE]
>
> On Windows, activate the virtual environment with `.venv\Scripts\activate`
> instead of `source .venv/bin/activate`.
@z

@x
If you don't have Python installed, skip ahead to the next section. The
remaining steps run the application in a container, with no local Python
required.
@y
If you don't have Python installed, skip ahead to the next section. The
remaining steps run the application in a container, with no local Python
required.
@z

@x
### Create the Docker assets
@y
### Create the Docker assets
@z

@x
Sign in to the DHI registry so Docker can pull the Python base images during
the build. The available Python images are listed in the
[catalog](https://hub.docker.com/hardened-images/catalog/dhi/python).
@y
Sign in to the DHI registry so Docker can pull the Python base images during
the build. The available Python images are listed in the
[catalog](https://hub.docker.com/hardened-images/catalog/dhi/python).
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
Add the following three files to your `python-docker-example` directory. The
`Dockerfile` describes how to build the image, `compose.yaml` defines how
Docker runs the container, and `.dockerignore` keeps unwanted files out of the
build context.
@y
Add the following three files to your `python-docker-example` directory. The
`Dockerfile` describes how to build the image, `compose.yaml` defines how
Docker runs the container, and `.dockerignore` keeps unwanted files out of the
build context.
@z

@x
> [!TIP]
>
> [Gordon](/ai/gordon/), Docker's AI assistant, can generate Docker assets for
> your project. Ask Gordon to create a Dockerfile, Compose file, and
> `.dockerignore` tailored to your application.
@y
> [!TIP]
>
> [Gordon](__SUBDIR__/ai/gordon/), Docker's AI assistant, can generate Docker assets for
> your project. Ask Gordon to create a Dockerfile, Compose file, and
> `.dockerignore` tailored to your application.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="app.py" >}}
@y
{{< file path="app.py" >}}
@z

@x
```python
# A minimal FastAPI application.
# The root endpoint (GET /) returns a JSON "Hello World" response.
# See https://fastapi.tiangolo.com/ for the framework reference.
@y
```python
# A minimal FastAPI application.
# The root endpoint (GET /) returns a JSON "Hello World" response.
# See https://fastapi.tiangolo.com/ for the framework reference.
@z

@x
from fastapi import FastAPI
@y
from fastapi import FastAPI
@z

@x
app = FastAPI()
@y
app = FastAPI()
@z

@x
@app.get("/")
async def root():
    return {"message": "Hello World"}
```
@y
@app.get("/")
async def root():
    return {"message": "Hello World"}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="requirements.txt" >}}
@y
{{< file path="requirements.txt" >}}
@z

@x
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@y
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@z

@x
fastapi==0.115.12
uvicorn==0.34.3
```
@y
fastapi==0.115.12
uvicorn==0.34.3
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="Dockerfile" status="new" >}}
@y
{{< file path="Dockerfile" status="new" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
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
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Use the dev image to build and install dependencies.
FROM dhi.io/python:3.12-dev AS builder
@y
# Use the dev image to build and install dependencies.
FROM dhi.io/python:3.12-dev AS builder
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@y
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@z

@x
# Use the minimal runtime image. It runs as nonroot by default.
FROM dhi.io/python:3.12
@y
# Use the minimal runtime image. It runs as nonroot by default.
FROM dhi.io/python:3.12
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@y
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
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
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
# Run the application.
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="new" >}}
@y
{{< file path="compose.yaml" status="new" >}}
@z

@x
```yaml
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
# https://docs.docker.com/go/compose-spec-reference/
@y
```yaml
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".dockerignore" status="new" >}}
@y
{{< file path=".dockerignore" status="new" >}}
@z

@x
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" >}}
@y
{{< file path=".gitignore" >}}
@z

@x
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
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
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
@z

@x
# Secrets
db/password.txt
```
@y
# Secrets
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
To learn more about each file, see the following:
@y
To learn more about each file, see the following:
@z

@x
- [Dockerfile](/reference/dockerfile.md)
- [.dockerignore](/reference/dockerfile.md#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](reference/dockerfile.md)
- [.dockerignore](reference/dockerfile.md#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
@z

@x
### Run the application
@y
### Run the application
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
#### Run the application in the background
@y
#### Run the application in the background
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
## Use containers for Python development
@y
## Use containers for Python development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a Python application](#containerize-a-python-application).
@y
Complete [Containerize a Python application](#containerize-a-python-application).
@z

@x
### Overview
@y
### Overview
@z

@x
Once your application runs in a container, the next step is making the
container loop part of your everyday development workflow. Code changes should
show up quickly, and services your app depends on, like databases, should run
right alongside it.
@y
Once your application runs in a container, the next step is making the
container loop part of your everyday development workflow. Code changes should
show up quickly, and services your app depends on, like databases, should run
right alongside it.
@z

@x
In this section, you'll extend the project from the previous topic by adding a
PostgreSQL database service to your `compose.yaml`, persisting the database
data in a named volume, and enabling Compose Watch so that changes you save in
your editor are picked up by the running container without a manual rebuild.
@y
In this section, you'll extend the project from the previous topic by adding a
PostgreSQL database service to your `compose.yaml`, persisting the database
data in a named volume, and enabling Compose Watch so that changes you save in
your editor are picked up by the running container without a manual rebuild.
@z

@x
### Update the application
@y
### Update the application
@z

@x
You'll update your application to connect to a PostgreSQL database. Continue
working in your `python-docker-example` directory.
@y
You'll update your application to connect to a PostgreSQL database. Continue
working in your `python-docker-example` directory.
@z

@x
Replace `app.py` and `requirements.txt`, and add a new `config.py` file with the
following contents.
@y
Replace `app.py` and `requirements.txt`, and add a new `config.py` file with the
following contents.
@z

@x
> [!NOTE]
>
> The application won't run yet after this step. It tries to connect to a
> PostgreSQL database that doesn't exist. The next two sections add the
> database service and the Docker configuration needed to run everything
> together.
@y
> [!NOTE]
>
> The application won't run yet after this step. It tries to connect to a
> PostgreSQL database that doesn't exist. The next two sections add the
> database service and the Docker configuration needed to run everything
> together.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="app.py" status="modified" >}}
@y
{{< file path="app.py" status="modified" >}}
@z

@x
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@y
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@z

@x
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@y
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@z

@x
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@y
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@z

@x
from config import settings
@y
from config import settings
@z

@x
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@y
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@z

@x
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@y
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@z

@x
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@y
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@z

@x
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@y
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@z

@x
app = FastAPI(lifespan=lifespan)
@y
app = FastAPI(lifespan=lifespan)
@z

@x
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@y
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@z

@x
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@y
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@z

@x
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@y
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="config.py" status="new" >}}
@y
{{< file path="config.py" status="new" >}}
@z

@x
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@y
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@z

@x
import os
from typing import Any
@y
import os
from typing import Any
@z

@x
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@y
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@z

@x
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@y
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@z

@x
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@y
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@z

@x
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@y
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@z

@x
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@y
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@z

@x
settings = Settings()  # type: ignore
```
@y
settings = Settings()  # type: ignore
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="requirements.txt" status="modified" hl_lines="5-7" >}}
@y
{{< file path="requirements.txt" status="modified" hl_lines="5-7" >}}
@z

@x
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@y
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@z

@x
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@y
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="Dockerfile" >}}
@y
{{< file path="Dockerfile" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
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
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Use the dev image to build and install dependencies.
FROM dhi.io/python:3.12-dev AS builder
@y
# Use the dev image to build and install dependencies.
FROM dhi.io/python:3.12-dev AS builder
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@y
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@z

@x
# Use the minimal runtime image. It runs as nonroot by default.
FROM dhi.io/python:3.12
@y
# Use the minimal runtime image. It runs as nonroot by default.
FROM dhi.io/python:3.12
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@y
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
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
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
# Run the application.
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" >}}
@y
{{< file path="compose.yaml" >}}
@z

@x
```yaml
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
# https://docs.docker.com/go/compose-spec-reference/
@y
```yaml
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".dockerignore" >}}
@y
{{< file path=".dockerignore" >}}
@z

@x
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" >}}
@y
{{< file path=".gitignore" >}}
@z

@x
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
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
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
@z

@x
# Secrets
db/password.txt
```
@y
# Secrets
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
### Update Docker assets
@y
### Update Docker assets
@z

@x
Replace `Dockerfile` and `compose.yaml` with the following.
@y
Replace `Dockerfile` and `compose.yaml` with the following.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="app.py" >}}
@y
{{< file path="app.py" >}}
@z

@x
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@y
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@z

@x
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@y
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@z

@x
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@y
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@z

@x
from config import settings
@y
from config import settings
@z

@x
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@y
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@z

@x
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@y
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@z

@x
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@y
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@z

@x
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@y
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@z

@x
app = FastAPI(lifespan=lifespan)
@y
app = FastAPI(lifespan=lifespan)
@z

@x
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@y
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@z

@x
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@y
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@z

@x
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@y
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="config.py" >}}
@y
{{< file path="config.py" >}}
@z

@x
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@y
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@z

@x
import os
from typing import Any
@y
import os
from typing import Any
@z

@x
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@y
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@z

@x
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@y
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@z

@x
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@y
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@z

@x
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@y
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@z

@x
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@y
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@z

@x
settings = Settings()  # type: ignore
```
@y
settings = Settings()  # type: ignore
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="requirements.txt" >}}
@y
{{< file path="requirements.txt" >}}
@z

@x
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@y
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@z

@x
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@y
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="Dockerfile" status="modified" hl_lines="11,27-34,37,45" >}}
@y
{{< file path="Dockerfile" status="modified" hl_lines="11,27-34,37,45" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
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
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Use the dev image to build and install dependencies.
# The builder stage is also used directly in development (see compose.yaml).
FROM dhi.io/python:3.12-dev AS builder
@y
# Use the dev image to build and install dependencies.
# The builder stage is also used directly in development (see compose.yaml).
FROM dhi.io/python:3.12-dev AS builder
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@y
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
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
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
@y
# Run the application.
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
@z

@x
# Use the minimal runtime image for production. It runs as nonroot by default.
FROM dhi.io/python:3.12
@y
# Use the minimal runtime image for production. It runs as nonroot by default.
FROM dhi.io/python:3.12
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@y
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
COPY --from=builder /app .
@y
COPY --from=builder /app .
@z

@x
EXPOSE 8000
@y
EXPOSE 8000
@z

@x
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="8" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="8" >}}
@z

@x
```yaml
services:
  # Application service. The `target: builder` line builds the development
  # image (includes a shell and tools); the production stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: builder
    ports:
      - 8000:8000
```
@y
```yaml
services:
  # Application service. The `target: builder` line builds the development
  # image (includes a shell and tools); the production stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: builder
    ports:
      - 8000:8000
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".dockerignore" >}}
@y
{{< file path=".dockerignore" >}}
@z

@x
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" >}}
@y
{{< file path=".gitignore" >}}
@z

@x
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
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
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
@z

@x
# Secrets
db/password.txt
```
@y
# Secrets
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
#### About these changes
@y
#### About these changes
@z

@x
The `Dockerfile` builder stage now includes `COPY . .` and a `CMD`
instruction, which makes it directly runnable. This lets Compose target the
builder stage during development without rebuilding the production stage. The
production stage at the bottom is unchanged and still produces a minimal,
nonroot runtime image for shipping.
@y
The `Dockerfile` builder stage now includes `COPY . .` and a `CMD`
instruction, which makes it directly runnable. This lets Compose target the
builder stage during development without rebuilding the production stage. The
production stage at the bottom is unchanged and still produces a minimal,
nonroot runtime image for shipping.
@z

@x
In `compose.yaml`, the new `target: builder` line tells Compose to build and
run the builder stage of the Dockerfile during development. Unlike the minimal
production image, the development image includes a shell and additional tools
that make debugging easier. If you need a shell in a running production
container, use [Docker Debug](/reference/cli/docker/debug/) instead.
@y
In `compose.yaml`, the new `target: builder` line tells Compose to build and
run the builder stage of the Dockerfile during development. Unlike the minimal
production image, the development image includes a shell and additional tools
that make debugging easier. If you need a shell in a running production
container, use [Docker Debug](__SUBDIR__/reference/cli/docker/debug/) instead.
@z

@x
### Add a local database and persist data
@y
### Add a local database and persist data
@z

@x
You can use containers to set up local services, like a database. In this
section, you'll update the `compose.yaml` file to define a database service
and a volume to persist data, and add a `db/password.txt` file that holds the
database password.
@y
You can use containers to set up local services, like a database. In this
section, you'll update the `compose.yaml` file to define a database service
and a volume to persist data, and add a `db/password.txt` file that holds the
database password.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="app.py" >}}
@y
{{< file path="app.py" >}}
@z

@x
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@y
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@z

@x
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@y
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@z

@x
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@y
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@z

@x
from config import settings
@y
from config import settings
@z

@x
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@y
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@z

@x
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@y
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@z

@x
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@y
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@z

@x
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@y
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@z

@x
app = FastAPI(lifespan=lifespan)
@y
app = FastAPI(lifespan=lifespan)
@z

@x
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@y
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@z

@x
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@y
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@z

@x
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@y
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="config.py" >}}
@y
{{< file path="config.py" >}}
@z

@x
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@y
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@z

@x
import os
from typing import Any
@y
import os
from typing import Any
@z

@x
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@y
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@z

@x
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@y
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@z

@x
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@y
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@z

@x
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@y
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@z

@x
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@y
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@z

@x
settings = Settings()  # type: ignore
```
@y
settings = Settings()  # type: ignore
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="requirements.txt" >}}
@y
{{< file path="requirements.txt" >}}
@z

@x
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@y
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@z

@x
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@y
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="Dockerfile" >}}
@y
{{< file path="Dockerfile" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
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
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Use the dev image to build and install dependencies.
# The builder stage is also used directly in development (see compose.yaml).
FROM dhi.io/python:3.12-dev AS builder
@y
# Use the dev image to build and install dependencies.
# The builder stage is also used directly in development (see compose.yaml).
FROM dhi.io/python:3.12-dev AS builder
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@y
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
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
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
@y
# Run the application.
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
@z

@x
# Use the minimal runtime image for production. It runs as nonroot by default.
FROM dhi.io/python:3.12
@y
# Use the minimal runtime image for production. It runs as nonroot by default.
FROM dhi.io/python:3.12
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@y
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
COPY --from=builder /app .
@y
COPY --from=builder /app .
@z

@x
EXPOSE 8000
@y
EXPOSE 8000
@z

@x
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="11-46" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="11-46" >}}
@z

@x
```yaml
services:
  # Application service. The `target: builder` line builds the development
  # image (includes a shell and tools); the production stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: builder
    ports:
      - 8000:8000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
  # Database service. Reads the password from a Docker secret mounted at
  # /run/secrets/db-password. Compose waits for the healthcheck to pass
  # before starting the server, via the server's depends_on.
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  # Application service. The `target: builder` line builds the development
  # image (includes a shell and tools); the production stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: builder
    ports:
      - 8000:8000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
  # Database service. Reads the password from a Docker secret mounted at
  # /run/secrets/db-password. Compose waits for the healthcheck to pass
  # before starting the server, via the server's depends_on.
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="db/password.txt" status="new" >}}
@y
{{< file path="db/password.txt" status="new" >}}
@z

@x
```text
mysecretpassword
```
@y
```text
mysecretpassword
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".dockerignore" >}}
@y
{{< file path=".dockerignore" >}}
@z

@x
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" >}}
@y
{{< file path=".gitignore" >}}
@z

@x
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
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
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
@z

@x
# Secrets
db/password.txt
```
@y
# Secrets
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/reference/compose-file/).
@y
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](__SUBDIR__/reference/compose-file/).
@z

@x
Now, run the following `docker compose up` command to start your application.
@y
Now, run the following `docker compose up` command to start your application.
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
Now test your API endpoint. Open a new terminal then make a request to the server using the curl commands:
@y
Now test your API endpoint. Open a new terminal then make a request to the server using the curl commands:
@z

@x
Create an object with a POST request:
@y
Create an object with a POST request:
@z

@x
```console
$ curl -X 'POST' \
  'http://localhost:8000/heroes/' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": 1,
  "name": "my hero",
  "secret_name": "austing",
  "age": 12
}'
```
@y
```console
$ curl -X 'POST' \
  'http://localhost:8000/heroes/' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": 1,
  "name": "my hero",
  "secret_name": "austing",
  "age": 12
}'
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```json
{
  "age": 12,
  "id": 1,
  "name": "my hero",
  "secret_name": "austing"
}
```
@y
```json
{
  "age": 12,
  "id": 1,
  "name": "my hero",
  "secret_name": "austing"
}
```
@z

@x
Now make a GET request:
@y
Now make a GET request:
@z

@x
```console
$ curl -X 'GET' \
  'http://localhost:8000/heroes/' \
  -H 'accept: application/json'
```
@y
```console
$ curl -X 'GET' \
  'http://localhost:8000/heroes/' \
  -H 'accept: application/json'
```
@z

@x
You should receive the same response as above because it's the only object in the database.
@y
You should receive the same response as above because it's the only object in the database.
@z

@x
```json
{
  "age": 12,
  "id": 1,
  "name": "my hero",
  "secret_name": "austing"
}
```
@y
```json
{
  "age": 12,
  "id": 1,
  "name": "my hero",
  "secret_name": "austing"
}
```
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
### Automatically update services
@y
### Automatically update services
@z

@x
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Open your `compose.yaml` file in an IDE or text editor and add the highlighted
Compose Watch instructions.
@y
Open your `compose.yaml` file in an IDE or text editor and add the highlighted
Compose Watch instructions.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="app.py" >}}
@y
{{< file path="app.py" >}}
@z

@x
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@y
```python
# FastAPI application backed by a PostgreSQL database via SQLModel.
# The FastAPI lifespan handler creates database tables at startup.
# Endpoints: GET / (greeting), POST /heroes/ (create), GET /heroes/ (list).
# See https://fastapi.tiangolo.com/ and https://sqlmodel.tiangolo.com/
@z

@x
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@y
from collections.abc import AsyncGenerator, Sequence
from contextlib import asynccontextmanager
@z

@x
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@y
from fastapi import FastAPI
from sqlmodel import Field, Session, SQLModel, create_engine, select
@z

@x
from config import settings
@y
from config import settings
@z

@x
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@y
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)
@z

@x
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@y
engine = create_engine(str(settings.SQLALCHEMY_DATABASE_URI))
@z

@x
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@y
def create_db_and_tables() -> None:
    SQLModel.metadata.create_all(engine)
@z

@x
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@y
@asynccontextmanager
async def lifespan(_app: FastAPI) -> AsyncGenerator[None, None]:
    create_db_and_tables()
    yield
@z

@x
app = FastAPI(lifespan=lifespan)
@y
app = FastAPI(lifespan=lifespan)
@z

@x
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@y
@app.get("/")
def hello() -> str:
    return "Hello, Docker!"
@z

@x
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@y
@app.post("/heroes/")
def create_hero(hero: Hero) -> Hero:
    with Session(engine) as session:
        session.add(hero)
        session.commit()
        session.refresh(hero)
        return hero
@z

@x
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@y
@app.get("/heroes/")
def read_heroes() -> Sequence[Hero]:
    with Session(engine) as session:
        heroes = session.exec(select(Hero)).all()
        return heroes
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="config.py" >}}
@y
{{< file path="config.py" >}}
@z

@x
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@y
```python
# Pydantic settings that read PostgreSQL connection details from the
# environment. Supports a password file (Docker secrets) via
# POSTGRES_PASSWORD_FILE in addition to POSTGRES_PASSWORD.
# See https://docs.pydantic.dev/latest/concepts/pydantic_settings/
@z

@x
import os
from typing import Any
@y
import os
from typing import Any
@z

@x
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@y
from pydantic import (
    PostgresDsn,
    computed_field,
    field_validator,
    model_validator,
)
from pydantic_core import MultiHostUrl
from pydantic_settings import BaseSettings
@z

@x
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@y
class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str | None = None
    POSTGRES_PASSWORD_FILE: str | None = None
    POSTGRES_DB: str
@z

@x
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@y
    @model_validator(mode="before")
    @classmethod
    def check_postgres_password(cls, data: Any) -> Any:
        """Validate that either POSTGRES_PASSWORD or POSTGRES_PASSWORD_FILE is set."""
        if isinstance(data, dict):
            password_file: str | None = data.get("POSTGRES_PASSWORD_FILE")  # type: ignore
            password: str | None = data.get("POSTGRES_PASSWORD")  # type: ignore
            if password_file is None and password is None:
                raise ValueError(
                    "At least one of POSTGRES_PASSWORD_FILE and POSTGRES_PASSWORD must be set."
                )
        return data  # type: ignore
@z

@x
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@y
    @field_validator("POSTGRES_PASSWORD_FILE", mode="before")
    @classmethod
    def read_password_from_file(cls, v: str | None) -> str | None:
        if v is not None:
            file_path = v
            if os.path.exists(file_path):
                with open(file_path) as file:
                    return file.read().strip()
            raise ValueError(f"Password file {file_path} does not exist.")
        return v
@z

@x
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@y
    @computed_field
    @property
    def SQLALCHEMY_DATABASE_URI(self) -> PostgresDsn:
        url = MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD
            if self.POSTGRES_PASSWORD
            else self.POSTGRES_PASSWORD_FILE,
            host=self.POSTGRES_SERVER,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        )
        return PostgresDsn(url)
@z

@x
settings = Settings()  # type: ignore
```
@y
settings = Settings()  # type: ignore
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="requirements.txt" >}}
@y
{{< file path="requirements.txt" >}}
@z

@x
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@y
```text
# Python package dependencies for the application, pinned for reproducible builds.
# See https://pip.pypa.io/en/stable/reference/requirements-file-format/
@z

@x
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@y
fastapi==0.115.12
sqlmodel==0.0.24
psycopg[binary]==3.2.9
pydantic-settings==2.9.1
uvicorn==0.34.3
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="Dockerfile" >}}
@y
{{< file path="Dockerfile" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
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
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Use the dev image to build and install dependencies.
# The builder stage is also used directly in development (see compose.yaml).
FROM dhi.io/python:3.12-dev AS builder
@y
# Use the dev image to build and install dependencies.
# The builder stage is also used directly in development (see compose.yaml).
FROM dhi.io/python:3.12-dev AS builder
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@y
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
@y
# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt
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
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
@y
# Run the application.
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
@z

@x
# Use the minimal runtime image for production. It runs as nonroot by default.
FROM dhi.io/python:3.12
@y
# Use the minimal runtime image for production. It runs as nonroot by default.
FROM dhi.io/python:3.12
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@y
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"
@z

@x
COPY --from=builder /app .
@y
COPY --from=builder /app .
@z

@x
EXPOSE 8000
@y
EXPOSE 8000
@z

@x
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@y
CMD ["/venv/bin/python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="21-24" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="21-24" >}}
@z

@x
```yaml
services:
  # Application service. The `target: builder` line builds the development
  # image (includes a shell and tools); the production stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: builder
    ports:
      - 8000:8000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
    develop:
      watch:
        - action: rebuild
          path: .
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  # Application service. The `target: builder` line builds the development
  # image (includes a shell and tools); the production stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: builder
    ports:
      - 8000:8000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
    develop:
      watch:
        - action: rebuild
          path: .
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="db/password.txt" >}}
@y
{{< file path="db/password.txt" >}}
@z

@x
```text
mysecretpassword
```
@y
```text
mysecretpassword
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".dockerignore" >}}
@y
{{< file path=".dockerignore" >}}
@z

@x
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text
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
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" >}}
@y
{{< file path=".gitignore" >}}
@z

@x
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. This is the standard Python
# template covering bytecode, build artifacts, virtual environments, and IDE
# settings. See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
@y
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
@y
# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
@z

@x
# Secrets
db/password.txt
```
@y
# Secrets
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
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
In a terminal, curl the application to get a response.
@y
In a terminal, curl the application to get a response.
@z

@x
```console
$ curl http://localhost:8000
Hello, Docker!
```
@y
```console
$ curl http://localhost:8000
Hello, Docker!
```
@z

@x
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@z

@x
Open `python-docker-example/app.py` in an IDE or text editor and update the `Hello, Docker!` string by adding a few more exclamation marks.
@y
Open `python-docker-example/app.py` in an IDE or text editor and update the `Hello, Docker!` string by adding a few more exclamation marks.
@z

@x
```diff
-    return 'Hello, Docker!'
+    return 'Hello, Docker!!!'
```
@y
```diff
-    return 'Hello, Docker!'
+    return 'Hello, Docker!!!'
```
@z

@x
Save the changes to `app.py` and then wait a few seconds for the application to rebuild. Curl the application again and verify that the updated text appears.
@y
Save the changes to `app.py` and then wait a few seconds for the application to rebuild. Curl the application again and verify that the updated text appears.
@z

@x
```console
$ curl http://localhost:8000
Hello, Docker!!!
```
@y
```console
$ curl http://localhost:8000
Hello, Docker!!!
```
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Linting, formatting, and type checking for Python
@y
## Linting, formatting, and type checking for Python
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Develop your app](#use-containers-for-python-development). This topic requires a local Python
installation because the tools and Git hooks introduced here run on your
host. If you don't want to install Python locally, skip this topic. You can
also run the same checks in CI.
@y
Complete [Develop your app](#use-containers-for-python-development). This topic requires a local Python
installation because the tools and Git hooks introduced here run on your
host. If you don't want to install Python locally, skip this topic. You can
also run the same checks in CI.
@z

@x
### Overview
@y
### Overview
@z

@x
Linting, formatting, and type checking are automated ways to catch bugs,
enforce style, and spot type errors before code runs. Running them on every
commit, in CI, and in your editor catches problems early when they're cheap
to fix.
@y
Linting, formatting, and type checking are automated ways to catch bugs,
enforce style, and spot type errors before code runs. Running them on every
commit, in CI, and in your editor catches problems early when they're cheap
to fix.
@z

@x
In this section, you'll configure three tools for your Python application.
Ruff handles linting and formatting in a single fast pass. Pyright statically
checks your code for type errors. Pre-commit hooks run both of these
automatically before each Git commit so problems are caught locally before
they're committed.
@y
In this section, you'll configure three tools for your Python application.
Ruff handles linting and formatting in a single fast pass. Pyright statically
checks your code for type errors. Pre-commit hooks run both of these
automatically before each Git commit so problems are caught locally before
they're committed.
@z

@x
### Linting and formatting with Ruff
@y
### Linting and formatting with Ruff
@z

@x
Ruff is an extremely fast Python linter and formatter written in Rust. It replaces multiple tools like flake8, isort, and black with a single unified tool.
@y
Ruff is an extremely fast Python linter and formatter written in Rust. It replaces multiple tools like flake8, isort, and black with a single unified tool.
@z

@x
Create a `pyproject.toml` file in your `python-docker-example` directory:
@y
Create a `pyproject.toml` file in your `python-docker-example` directory:
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="pyproject.toml" status="new" >}}
@y
{{< file path="pyproject.toml" status="new" >}}
@z

@x
```toml
# Configuration for code-quality tools.
# - [tool.ruff]: linting and formatting (https://docs.astral.sh/ruff/)
# - [tool.pyright]: static type checking (https://microsoft.github.io/pyright/)
@y
```toml
# Configuration for code-quality tools.
# - [tool.ruff]: linting and formatting (https://docs.astral.sh/ruff/)
# - [tool.pyright]: static type checking (https://microsoft.github.io/pyright/)
@z

@x
[tool.ruff]
target-version = "py312"
@y
[tool.ruff]
target-version = "py312"
@z

@x
[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "ARG001", # unused arguments in functions
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "W191",  # indentation contains tabs
    "B904",  # Allow raising exceptions without from e, for HTTPException
]
```
@y
[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "ARG001", # unused arguments in functions
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "W191",  # indentation contains tabs
    "B904",  # Allow raising exceptions without from e, for HTTPException
]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
Install Ruff:
@y
Install Ruff:
@z

@x
```console
$ pip install ruff
```
@y
```console
$ pip install ruff
```
@z

@x
If you're using a virtual environment, make sure it is activated so the `ruff`
command is available.
@y
If you're using a virtual environment, make sure it is activated so the `ruff`
command is available.
@z

@x
Run these commands to check and format your code:
@y
Run these commands to check and format your code:
@z

@x
```console
# Check for errors
$ ruff check .
@y
```console
# Check for errors
$ ruff check .
@z

@x
# Automatically fix fixable errors
$ ruff check --fix .
@y
# Automatically fix fixable errors
$ ruff check --fix .
@z

@x
# Format code
$ ruff format .
```
@y
# Format code
$ ruff format .
```
@z

@x
### Type checking with Pyright
@y
### Type checking with Pyright
@z

@x
Pyright is a fast static type checker for Python that works well with modern Python features.
@y
Pyright is a fast static type checker for Python that works well with modern Python features.
@z

@x
Update `pyproject.toml` to add the Pyright configuration at the bottom.
@y
Update `pyproject.toml` to add the Pyright configuration at the bottom.
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path="pyproject.toml" status="modified" hl_lines="25-29" >}}
@y
{{< file path="pyproject.toml" status="modified" hl_lines="25-29" >}}
@z

@x
```toml
# Configuration for code-quality tools.
# - [tool.ruff]: linting and formatting (https://docs.astral.sh/ruff/)
# - [tool.pyright]: static type checking (https://microsoft.github.io/pyright/)
@y
```toml
# Configuration for code-quality tools.
# - [tool.ruff]: linting and formatting (https://docs.astral.sh/ruff/)
# - [tool.pyright]: static type checking (https://microsoft.github.io/pyright/)
@z

@x
[tool.ruff]
target-version = "py312"
@y
[tool.ruff]
target-version = "py312"
@z

@x
[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "ARG001", # unused arguments in functions
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "W191",  # indentation contains tabs
    "B904",  # Allow raising exceptions without from e, for HTTPException
]
@y
[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "ARG001", # unused arguments in functions
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "W191",  # indentation contains tabs
    "B904",  # Allow raising exceptions without from e, for HTTPException
]
@z

@x
[tool.pyright]
typeCheckingMode = "strict"
pythonVersion = "3.12"
exclude = [".venv"]
```
@y
[tool.pyright]
typeCheckingMode = "strict"
pythonVersion = "3.12"
exclude = [".venv"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
Install Pyright and run it:
@y
Install Pyright and run it:
@z

@x
```console
$ pip install pyright
$ pyright
```
@y
```console
$ pip install pyright
$ pyright
```
@z

@x
### Setting up pre-commit hooks
@y
### Setting up pre-commit hooks
@z

@x
Pre-commit hooks run checks automatically before each commit on your local
machine. Create a `.pre-commit-config.yaml` file in your `python-docker-example`
directory to set up Ruff hooks:
@y
Pre-commit hooks run checks automatically before each commit on your local
machine. Create a `.pre-commit-config.yaml` file in your `python-docker-example`
directory to set up Ruff hooks:
@z

@x
{{< files name="python-docker-example" >}}
@y
{{< files name="python-docker-example" >}}
@z

@x
{{< file path=".pre-commit-config.yaml" status="new" >}}
@y
{{< file path=".pre-commit-config.yaml" status="new" >}}
@z

@x
```yaml
# Pre-commit hook configuration. Runs Ruff (lint + format) on every
# `git commit`. See https://pre-commit.com/
@y
```yaml
# Pre-commit hook configuration. Runs Ruff (lint + format) on every
# `git commit`. See https://pre-commit.com/
@z

@x
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.15.15
    hooks:
      - id: ruff
        args: [--fix]
      - id: ruff-format
```
@y
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.15.15
    hooks:
      - id: ruff
        args: [--fix]
      - id: ruff-format
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
To install and use:
@y
To install and use:
@z

@x
```console
$ pip install pre-commit
$ pre-commit install
$ git commit -m "Test commit"  # Automatically runs checks
```
@y
```console
$ pip install pre-commit
$ pre-commit install
$ git commit -m "Test commit"  # Automatically runs checks
```
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you learned how to:
@y
In this section, you learned how to:
@z

@x
- Configure and use Ruff for linting and formatting
- Set up Pyright for static type checking
- Automate checks with pre-commit hooks
@y
- Configure and use Ruff for linting and formatting
- Set up Pyright for static type checking
- Automate checks with pre-commit hooks
@z

@x
These tools help maintain code quality and catch errors early in development.
@y
These tools help maintain code quality and catch errors early in development.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Ruff documentation](https://docs.astral.sh/ruff/)
- [Pyright documentation](https://microsoft.github.io/pyright/)
- [pre-commit framework](https://pre-commit.com/)
@y
- [Ruff documentation](https://docs.astral.sh/ruff/)
- [Pyright documentation](https://microsoft.github.io/pyright/)
- [pre-commit framework](https://pre-commit.com/)
@z

@x
### Next steps
@y
### Next steps
@z

@x
- Customize linting rules to match your team's style preferences
- Explore advanced type checking features
@y
- Customize linting rules to match your team's style preferences
- Explore advanced type checking features
@z
