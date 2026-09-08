%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: PDF analysis and chat
description: Containerize generative AI (GenAI) apps using Docker
keywords: python, generative ai, genai, llm, neo4j, ollama, langchain
summary: |
  Learn how to build a PDF bot for parsing PDF documents and generating
  responses using Docker and generative AI.
@y
title: PDF analysis and chat
description: Containerize generative AI (GenAI) apps using Docker
keywords: python, generative ai, genai, llm, neo4j, ollama, langchain
summary: |
  Learn how to build a PDF bot for parsing PDF documents and generating
  responses using Docker and generative AI.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The generative AI (GenAI) guide teaches you how to containerize an existing GenAI application using Docker. In this guide, you’ll learn how to:
@y
The generative AI (GenAI) guide teaches you how to containerize an existing GenAI application using Docker. In this guide, you’ll learn how to:
@z

@x
- Containerize and run a Python-based GenAI application
- Set up a local environment to run the complete GenAI stack locally for development
@y
- Containerize and run a Python-based GenAI application
- Set up a local environment to run the complete GenAI stack locally for development
@z

@x
Start by containerizing an existing GenAI application.
@y
Start by containerizing an existing GenAI application.
@z

@x
## Containerize a generative AI application
@y
## Containerize a generative AI application
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
> [!NOTE]
>
> GenAI applications can often benefit from GPU acceleration. Currently Docker Desktop supports GPU acceleration only on [Windows with the WSL2 backend](/manuals/desktop/features/gpu.md#using-nvidia-gpus-with-wsl2). Linux users can also access GPU acceleration using a native installation of the [Docker Engine](/manuals/engine/install/_index.md).
@y
> [!NOTE]
>
> GenAI applications can often benefit from GPU acceleration. Currently Docker Desktop supports GPU acceleration only on [Windows with the WSL2 backend](manuals/desktop/features/gpu.md#using-nvidia-gpus-with-wsl2). Linux users can also access GPU acceleration using a native installation of the [Docker Engine](manuals/engine/install/_index.md).
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md) or, if you are a Linux user and are planning to use GPU acceleration, [Docker Engine](/manuals/engine/install/_index.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md) or, if you are a Linux user and are planning to use GPU acceleration, [Docker Engine](manuals/engine/install/_index.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@z

@x
### Overview
@y
### Overview
@z

@x
This section walks you through containerizing a generative AI (GenAI) application using Docker Desktop.
@y
This section walks you through containerizing a generative AI (GenAI) application using Docker Desktop.
@z

@x
> [!NOTE]
>
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@y
> [!NOTE]
>
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
The sample application used in this guide is a modified version of the PDF Reader application from the [GenAI Stack](https://github.com/docker/genai-stack) demo applications. The application is a full stack Python application that lets you ask questions about a PDF file.
@y
The sample application used in this guide is a modified version of the PDF Reader application from the [GenAI Stack](https://github.com/docker/genai-stack) demo applications. The application is a full stack Python application that lets you ask questions about a PDF file.
@z

@x
The application uses [LangChain](https://www.langchain.com/) for orchestration, [Streamlit](https://streamlit.io/) for the UI, [Ollama](https://ollama.ai/) to run the LLM, and [Neo4j](https://neo4j.com/) to store vectors.
@y
The application uses [LangChain](https://www.langchain.com/) for orchestration, [Streamlit](https://streamlit.io/) for the UI, [Ollama](https://ollama.ai/) to run the LLM, and [Neo4j](https://neo4j.com/) to store vectors.
@z

@x
Clone the sample application. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

@x
```console
$ git clone https://github.com/craig-osterhout/docker-genai-sample
```
@y
```console
$ git clone https://github.com/craig-osterhout/docker-genai-sample
```
@z

@x
You should now have the following files in your `docker-genai-sample` directory.
@y
You should now have the following files in your `docker-genai-sample` directory.
@z

@x
```text
├── docker-genai-sample/
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── LICENSE
│ └── README.md
```
@y
```text
├── docker-genai-sample/
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── LICENSE
│ └── README.md
```
@z

@x
### Create Docker assets
@y
### Create Docker assets
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize it.
@y
Now that you have an application, you can create the necessary Docker assets to
containerize it.
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
Create the following files in your `docker-genai-sample` directory.
@y
Create the following files in your `docker-genai-sample` directory.
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
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8000"]
```
@y
# Run the application.
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8000"]
```
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
You should now have the following contents in your `docker-genai-sample`
directory.
@y
You should now have the following contents in your `docker-genai-sample`
directory.
@z

@x
```text
├── docker-genai-sample/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── compose.yaml
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── Dockerfile
│ ├── LICENSE
│ └── README.md
```
@y
```text
├── docker-genai-sample/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── compose.yaml
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── Dockerfile
│ ├── LICENSE
│ └── README.md
```
@z

@x
To learn more about these files, see the following:
@y
To learn more about these files, see the following:
@z

@x
- [Dockerfile](../../../reference/dockerfile.md)
- [.dockerignore](../../../reference/dockerfile.md#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](../../../reference/dockerfile.md)
- [.dockerignore](../../../reference/dockerfile.md#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
@z

@x
### Run the application
@y
### Run the application
@z

@x
Inside the `docker-genai-sample` directory, run the following command in a
terminal.
@y
Inside the `docker-genai-sample` directory, run the following command in a
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
Docker builds and runs your application. Depending on your network connection, it may take several minutes to download all the dependencies. You'll see a message like the following in the terminal when the application is running.
@y
Docker builds and runs your application. Depending on your network connection, it may take several minutes to download all the dependencies. You'll see a message like the following in the terminal when the application is running.
@z

@x
```console
server-1  |   You can now view your Streamlit app in your browser.
server-1  |
server-1  |   URL: http://0.0.0.0:8000
server-1  |
```
@y
```console
server-1  |   You can now view your Streamlit app in your browser.
server-1  |
server-1  |   URL: http://0.0.0.0:8000
server-1  |
```
@z

@x
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. The application may take a few minutes to download the embedding model. While the download is in progress, **Running** appears in the top-right corner.
@y
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. The application may take a few minutes to download the embedding model. While the download is in progress, **Running** appears in the top-right corner.
@z

@x
The application requires a Neo4j database service and an LLM service to
function. If you have access to services that you ran outside of Docker, specify
the connection information and try it out. If you don't have the services
running, continue with this guide to learn how you can run some or all of these
services with Docker.
@y
The application requires a Neo4j database service and an LLM service to
function. If you have access to services that you ran outside of Docker, specify
the connection information and try it out. If you don't have the services
running, continue with this guide to learn how you can run some or all of these
services with Docker.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you learned how you can containerize and run your GenAI
application using Docker.
@y
In this section, you learned how you can containerize and run your GenAI
application using Docker.
@z

@x
### Next steps
@y
### Next steps
@z

@x
In the next section, you'll learn how you can run your application, database, and LLM service all locally using Docker.
@y
In the next section, you'll learn how you can run your application, database, and LLM service all locally using Docker.
@z

@x
## Use containers for generative AI development
@y
## Use containers for generative AI development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a generative AI application](#containerize-a-generative-ai-application).
@y
Complete [Containerize a generative AI application](#containerize-a-generative-ai-application).
@z

@x
### Overview
@y
### Overview
@z

@x
In this section, you'll learn how to set up a development environment to access all the services that your generative AI (GenAI) application needs. This includes:
@y
In this section, you'll learn how to set up a development environment to access all the services that your generative AI (GenAI) application needs. This includes:
@z

@x
- Adding a local database
- Adding a local or remote LLM service
@y
- Adding a local database
- Adding a local or remote LLM service
@z

@x
> [!NOTE]
>
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@y
> [!NOTE]
>
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@z

@x
### Add a local database
@y
### Add a local database
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service. In addition, you'll specify an environment variables file to load the database connection information rather than manually entering the information every time.
@y
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service. In addition, you'll specify an environment variables file to load the database connection information rather than manually entering the information every time.
@z

@x
To run the database service:
@y
To run the database service:
@z

@x
1. In the cloned repository's directory, rename `env.example` file to `.env`.
   This file contains the environment variables that the containers will use.
2. In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor.
3. In the `compose.yaml` file, add the following:
@y
1. In the cloned repository's directory, rename `env.example` file to `.env`.
   This file contains the environment variables that the containers will use.
2. In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor.
3. In the `compose.yaml` file, add the following:
@z

@x
   - Add instructions to run a Neo4j database
   - Specify the environment file under the server service in order to pass in the environment variables for the connection
@y
   - Add instructions to run a Neo4j database
   - Specify the environment file under the server service in order to pass in the environment variables for the connection
@z

@x
   The following is the updated `compose.yaml` file. All comments have been removed.
@y
   The following is the updated `compose.yaml` file. All comments have been removed.
@z

@x
   ```yaml{hl_lines=["7-23"]}
   services:
     server:
       build:
         context: .
       ports:
         - 8000:8000
       env_file:
         - .env
       depends_on:
         database:
           condition: service_healthy
     database:
       image: neo4j:5.11
       ports:
         - "7474:7474"
         - "7687:7687"
       environment:
         - NEO4J_AUTH=${NEO4J_USERNAME}/${NEO4J_PASSWORD}
       healthcheck:
         test: ["CMD-SHELL", "wget --no-verbose --tries=1 --spider localhost:7474 || exit 1"]
         interval: 5s
         timeout: 3s
         retries: 5
   ```
@y
   ```yaml{hl_lines=["7-23"]}
   services:
     server:
       build:
         context: .
       ports:
         - 8000:8000
       env_file:
         - .env
       depends_on:
         database:
           condition: service_healthy
     database:
       image: neo4j:5.11
       ports:
         - "7474:7474"
         - "7687:7687"
       environment:
         - NEO4J_AUTH=${NEO4J_USERNAME}/${NEO4J_PASSWORD}
       healthcheck:
         test: ["CMD-SHELL", "wget --no-verbose --tries=1 --spider localhost:7474 || exit 1"]
         interval: 5s
         timeout: 3s
         retries: 5
   ```
@z

@x
   > [!NOTE]
   >
   > To learn more about Neo4j, see the [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j).
@y
   > [!NOTE]
   >
   > To learn more about Neo4j, see the [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j).
@z

@x
4. Run the application. Inside the `docker-genai-sample` directory,
   run the following command in a terminal.
@y
4. Run the application. Inside the `docker-genai-sample` directory,
   run the following command in a terminal.
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
5. Access the application. Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. Note that asking questions to a PDF will cause the application to fail because the LLM service specified in the `.env` file isn't running yet.
@y
5. Access the application. Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. Note that asking questions to a PDF will cause the application to fail because the LLM service specified in the `.env` file isn't running yet.
@z

@x
6. Stop the application. In the terminal, press `ctrl`+`c` to stop the application.
@y
6. Stop the application. In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
### Add a local or remote LLM service
@y
### Add a local or remote LLM service
@z

@x
The sample application supports both [Ollama](https://ollama.ai/) and [OpenAI](https://openai.com/). This guide provides instructions for the following scenarios:
@y
The sample application supports both [Ollama](https://ollama.ai/) and [OpenAI](https://openai.com/). This guide provides instructions for the following scenarios:
@z

@x
- Run Ollama in a container
- Run Ollama outside of a container
- Use OpenAI
@y
- Run Ollama in a container
- Run Ollama outside of a container
- Use OpenAI
@z

@x
While all platforms can use any of the previous scenarios, the performance and
GPU support may vary. You can use the following guidelines to help you choose the appropriate option:
@y
While all platforms can use any of the previous scenarios, the performance and
GPU support may vary. You can use the following guidelines to help you choose the appropriate option:
@z

@x
- Run Ollama in a container if you're on Linux, and using a native installation of the Docker Engine, or Windows 10/11, and using Docker Desktop, you
  have a CUDA-supported GPU, and your system has at least 8 GB of RAM.
- Run Ollama outside of a container if you're on an Apple silicon Mac.
- Use OpenAI if the previous two scenarios don't apply to you.
@y
- Run Ollama in a container if you're on Linux, and using a native installation of the Docker Engine, or Windows 10/11, and using Docker Desktop, you
  have a CUDA-supported GPU, and your system has at least 8 GB of RAM.
- Run Ollama outside of a container if you're on an Apple silicon Mac.
- Use OpenAI if the previous two scenarios don't apply to you.
@z

@x
Choose one of the following options for your LLM service.
@y
Choose one of the following options for your LLM service.
@z

@x
{{< tabs >}}
{{< tab name="Run Ollama in a container" >}}
@y
{{< tabs >}}
{{< tab name="Run Ollama in a container" >}}
@z

@x
When running Ollama in a container, you should have a CUDA-supported GPU. While you can run Ollama in a container without a supported GPU, the performance may not be acceptable. Only Linux and Windows 11 support GPU access to containers.
@y
When running Ollama in a container, you should have a CUDA-supported GPU. While you can run Ollama in a container without a supported GPU, the performance may not be acceptable. Only Linux and Windows 11 support GPU access to containers.
@z

@x
To run Ollama in a container and provide GPU access:
@y
To run Ollama in a container and provide GPU access:
@z

@x
1. Install the prerequisites.
   - For Docker Engine on Linux, install the [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-container-toolkit).
   - For Docker Desktop on Windows 10/11, install the latest [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) and make sure you are using the [WSL2 backend](/manuals/desktop/features/wsl/_index.md#turn-on-docker-desktop-wsl-2)
2. Add the Ollama service and a volume in your `compose.yaml`. The following is
   the updated `compose.yaml`:
@y
1. Install the prerequisites.
   - For Docker Engine on Linux, install the [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-container-toolkit).
   - For Docker Desktop on Windows 10/11, install the latest [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) and make sure you are using the [WSL2 backend](manuals/desktop/features/wsl/_index.md#turn-on-docker-desktop-wsl-2)
2. Add the Ollama service and a volume in your `compose.yaml`. The following is
   the updated `compose.yaml`:
@z

@x
   ```yaml {hl_lines=["24-38"]}
   services:
     server:
       build:
         context: .
       ports:
         - 8000:8000
       env_file:
         - .env
       depends_on:
         database:
           condition: service_healthy
     database:
       image: neo4j:5.11
       ports:
         - "7474:7474"
         - "7687:7687"
       environment:
         - NEO4J_AUTH=${NEO4J_USERNAME}/${NEO4J_PASSWORD}
       healthcheck:
         test:
           [
             "CMD-SHELL",
             "wget --no-verbose --tries=1 --spider localhost:7474 || exit 1",
           ]
         interval: 5s
         timeout: 3s
         retries: 5
     ollama:
       image: ollama/ollama:latest
       ports:
         - "11434:11434"
       volumes:
         - ollama_volume:/root/.ollama
       deploy:
         resources:
           reservations:
             devices:
               - driver: nvidia
                 count: all
                 capabilities: [gpu]
   volumes:
     ollama_volume:
   ```
@y
   ```yaml {hl_lines=["24-38"]}
   services:
     server:
       build:
         context: .
       ports:
         - 8000:8000
       env_file:
         - .env
       depends_on:
         database:
           condition: service_healthy
     database:
       image: neo4j:5.11
       ports:
         - "7474:7474"
         - "7687:7687"
       environment:
         - NEO4J_AUTH=${NEO4J_USERNAME}/${NEO4J_PASSWORD}
       healthcheck:
         test:
           [
             "CMD-SHELL",
             "wget --no-verbose --tries=1 --spider localhost:7474 || exit 1",
           ]
         interval: 5s
         timeout: 3s
         retries: 5
     ollama:
       image: ollama/ollama:latest
       ports:
         - "11434:11434"
       volumes:
         - ollama_volume:/root/.ollama
       deploy:
         resources:
           reservations:
             devices:
               - driver: nvidia
                 count: all
                 capabilities: [gpu]
   volumes:
     ollama_volume:
   ```
@z

@x
   > [!NOTE]
   >
   > For more details about the Compose instructions, see [Turn on GPU access with Docker Compose](/manuals/compose/how-tos/gpu-support.md).
@y
   > [!NOTE]
   >
   > For more details about the Compose instructions, see [Turn on GPU access with Docker Compose](manuals/compose/how-tos/gpu-support.md).
@z

@x
3. Add the ollama-pull service to your `compose.yaml` file. This service uses
   the `docker/genai:ollama-pull` image, based on the GenAI Stack's
   [pull_model.Dockerfile](https://github.com/docker/genai-stack/blob/main/pull_model.Dockerfile).
   The service will automatically pull the model for your Ollama
   container. The following is the updated section of the `compose.yaml` file:
@y
3. Add the ollama-pull service to your `compose.yaml` file. This service uses
   the `docker/genai:ollama-pull` image, based on the GenAI Stack's
   [pull_model.Dockerfile](https://github.com/docker/genai-stack/blob/main/pull_model.Dockerfile).
   The service will automatically pull the model for your Ollama
   container. The following is the updated section of the `compose.yaml` file:
@z

@x
   ```yaml {hl_lines=["12-17"]}
   services:
     server:
       build:
         context: .
       ports:
         - 8000:8000
       env_file:
         - .env
       depends_on:
         database:
           condition: service_healthy
         ollama-pull:
           condition: service_completed_successfully
     ollama-pull:
       image: docker/genai:ollama-pull
       env_file:
         - .env
     # ...
   ```
@y
   ```yaml {hl_lines=["12-17"]}
   services:
     server:
       build:
         context: .
       ports:
         - 8000:8000
       env_file:
         - .env
       depends_on:
         database:
           condition: service_healthy
         ollama-pull:
           condition: service_completed_successfully
     ollama-pull:
       image: docker/genai:ollama-pull
       env_file:
         - .env
     # ...
   ```
@z

@x
{{< /tab >}}
{{< tab name="Run Ollama outside of a container" >}}
@y
{{< /tab >}}
{{< tab name="Run Ollama outside of a container" >}}
@z

@x
To run Ollama outside of a container:
@y
To run Ollama outside of a container:
@z

@x
1. [Install](https://github.com/jmorganca/ollama) and run Ollama on your host
   machine.
2. Update the `OLLAMA_BASE_URL` value in your `.env` file to
   `http://host.docker.internal:11434`.
3. Pull the model to Ollama using the following command.
   ```console
   $ ollama pull llama2
   ```
@y
1. [Install](https://github.com/jmorganca/ollama) and run Ollama on your host
   machine.
2. Update the `OLLAMA_BASE_URL` value in your `.env` file to
   `http://host.docker.internal:11434`.
3. Pull the model to Ollama using the following command.
   ```console
   $ ollama pull llama2
   ```
@z

@x
{{< /tab >}}
{{< tab name="Use OpenAI" >}}
@y
{{< /tab >}}
{{< tab name="Use OpenAI" >}}
@z

@x
> [!IMPORTANT]
>
> Using OpenAI requires an [OpenAI account](https://platform.openai.com/login). OpenAI is a third-party hosted service and charges may apply.
@y
> [!IMPORTANT]
>
> Using OpenAI requires an [OpenAI account](https://platform.openai.com/login). OpenAI is a third-party hosted service and charges may apply.
@z

@x
1. Update the `LLM` value in your `.env` file to
   `gpt-3.5`.
2. Uncomment and update the `OPENAI_API_KEY` value in your `.env` file to
   your [OpenAI API key](https://help.openai.com/en/articles/4936850-where-do-i-find-my-api-key).
@y
1. Update the `LLM` value in your `.env` file to
   `gpt-3.5`.
2. Uncomment and update the `OPENAI_API_KEY` value in your `.env` file to
   your [OpenAI API key](https://help.openai.com/en/articles/4936850-where-do-i-find-my-api-key).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Run your GenAI application
@y
### Run your GenAI application
@z

@x
At this point, you have the following services in your Compose file:
@y
At this point, you have the following services in your Compose file:
@z

@x
- Server service for your main GenAI application
- Database service to store vectors in a Neo4j database
- (optional) Ollama service to run the LLM
- (optional) Ollama-pull service to automatically pull the model for the Ollama
  service
@y
- Server service for your main GenAI application
- Database service to store vectors in a Neo4j database
- (optional) Ollama service to run the LLM
- (optional) Ollama-pull service to automatically pull the model for the Ollama
  service
@z

@x
To run all the services, run the following command in your `docker-genai-sample`
directory:
@y
To run all the services, run the following command in your `docker-genai-sample`
directory:
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
If your Compose file has the ollama-pull service, it may take several minutes for the ollama-pull service to pull the model. The ollama-pull service will continuously update the console with its status. After pulling the model, the ollama-pull service container will stop and you can access the application.
@y
If your Compose file has the ollama-pull service, it may take several minutes for the ollama-pull service to pull the model. The ollama-pull service will continuously update the console with its status. After pulling the model, the ollama-pull service container will stop and you can access the application.
@z

@x
Once the application is running, open a browser and access the application at [http://localhost:8000](http://localhost:8000).
@y
Once the application is running, open a browser and access the application at [http://localhost:8000](http://localhost:8000).
@z

@x
Upload a PDF file, for example the [Docker CLI Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf), and ask a question about the PDF.
@y
Upload a PDF file, for example the [Docker CLI Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf), and ask a question about the PDF.
@z

@x
Depending on your system and the LLM service that you chose, it may take several
minutes to answer. If you are using Ollama and the performance isn't
acceptable, try using OpenAI.
@y
Depending on your system and the LLM service that you chose, it may take several
minutes to answer. If you are using Ollama and the performance isn't
acceptable, try using OpenAI.
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you learned how to set up a development environment to provide
access all the services that your GenAI application needs.
@y
In this section, you learned how to set up a development environment to provide
access all the services that your GenAI application needs.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](../../../reference/dockerfile.md)
- [Compose file reference](/reference/compose-file/_index.md)
- [Ollama Docker image](https://hub.docker.com/r/ollama/ollama)
- [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j)
- [GenAI Stack demo applications](https://github.com/docker/genai-stack)
@y
- [Dockerfile reference](../../../reference/dockerfile.md)
- [Compose file reference](reference/compose-file/_index.md)
- [Ollama Docker image](https://hub.docker.com/r/ollama/ollama)
- [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j)
- [GenAI Stack demo applications](https://github.com/docker/genai-stack)
@z

@x
### Next steps
@y
### Next steps
@z

@x
See samples of more GenAI applications in the [GenAI Stack demo applications](https://github.com/docker/genai-stack).
@y
See samples of more GenAI applications in the [GenAI Stack demo applications](https://github.com/docker/genai-stack).
@z
